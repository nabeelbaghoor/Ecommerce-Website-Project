namespace System.Data
{
    internal class Objects
    {
        internal class ObjectParameter
        {
            private string v;
            private Type type;

            public ObjectParameter(string v, Type type)
            {
                this.v = v;
                this.type = type;
            }
        }
    }
}