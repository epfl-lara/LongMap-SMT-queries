; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108182 () Bool)

(assert start!108182)

(declare-fun b_free!27877 () Bool)

(declare-fun b_next!27877 () Bool)

(assert (=> start!108182 (= b_free!27877 (not b_next!27877))))

(declare-fun tp!98588 () Bool)

(declare-fun b_and!45935 () Bool)

(assert (=> start!108182 (= tp!98588 b_and!45935)))

(declare-fun b!1277508 () Bool)

(declare-fun res!848870 () Bool)

(declare-fun e!729594 () Bool)

(assert (=> b!1277508 (=> (not res!848870) (not e!729594))))

(declare-datatypes ((array!83948 0))(
  ( (array!83949 (arr!40484 (Array (_ BitVec 32) (_ BitVec 64))) (size!41034 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83948)

(declare-datatypes ((List!28712 0))(
  ( (Nil!28709) (Cons!28708 (h!29917 (_ BitVec 64)) (t!42250 List!28712)) )
))
(declare-fun arrayNoDuplicates!0 (array!83948 (_ BitVec 32) List!28712) Bool)

(assert (=> b!1277508 (= res!848870 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28709))))

(declare-fun b!1277509 () Bool)

(declare-fun e!729590 () Bool)

(declare-fun tp_is_empty!33427 () Bool)

(assert (=> b!1277509 (= e!729590 tp_is_empty!33427)))

(declare-fun b!1277510 () Bool)

(declare-fun e!729592 () Bool)

(declare-fun e!729593 () Bool)

(declare-fun mapRes!51674 () Bool)

(assert (=> b!1277510 (= e!729592 (and e!729593 mapRes!51674))))

(declare-fun condMapEmpty!51674 () Bool)

(declare-datatypes ((V!49673 0))(
  ( (V!49674 (val!16788 Int)) )
))
(declare-datatypes ((ValueCell!15815 0))(
  ( (ValueCellFull!15815 (v!19386 V!49673)) (EmptyCell!15815) )
))
(declare-datatypes ((array!83950 0))(
  ( (array!83951 (arr!40485 (Array (_ BitVec 32) ValueCell!15815)) (size!41035 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83950)

(declare-fun mapDefault!51674 () ValueCell!15815)

