; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82154 () Bool)

(assert start!82154)

(declare-fun b!957545 () Bool)

(declare-fun e!539771 () Bool)

(declare-fun e!539772 () Bool)

(declare-fun mapRes!33679 () Bool)

(assert (=> b!957545 (= e!539771 (and e!539772 mapRes!33679))))

(declare-fun condMapEmpty!33679 () Bool)

(declare-datatypes ((V!33161 0))(
  ( (V!33162 (val!10617 Int)) )
))
(declare-datatypes ((ValueCell!10085 0))(
  ( (ValueCellFull!10085 (v!13174 V!33161)) (EmptyCell!10085) )
))
(declare-datatypes ((array!58371 0))(
  ( (array!58372 (arr!28059 (Array (_ BitVec 32) ValueCell!10085)) (size!28538 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58371)

(declare-fun mapDefault!33679 () ValueCell!10085)

