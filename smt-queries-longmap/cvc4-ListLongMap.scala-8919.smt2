; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108186 () Bool)

(assert start!108186)

(declare-fun b_free!27881 () Bool)

(declare-fun b_next!27881 () Bool)

(assert (=> start!108186 (= b_free!27881 (not b_next!27881))))

(declare-fun tp!98599 () Bool)

(declare-fun b_and!45939 () Bool)

(assert (=> start!108186 (= tp!98599 b_and!45939)))

(declare-fun b!1277550 () Bool)

(declare-fun res!848895 () Bool)

(declare-fun e!729620 () Bool)

(assert (=> b!1277550 (=> (not res!848895) (not e!729620))))

(declare-datatypes ((array!83956 0))(
  ( (array!83957 (arr!40488 (Array (_ BitVec 32) (_ BitVec 64))) (size!41038 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83956)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83956 (_ BitVec 32)) Bool)

(assert (=> b!1277550 (= res!848895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277551 () Bool)

(declare-fun e!729623 () Bool)

(declare-fun tp_is_empty!33431 () Bool)

(assert (=> b!1277551 (= e!729623 tp_is_empty!33431)))

(declare-fun b!1277552 () Bool)

(declare-fun e!729621 () Bool)

(declare-fun mapRes!51680 () Bool)

(assert (=> b!1277552 (= e!729621 (and e!729623 mapRes!51680))))

(declare-fun condMapEmpty!51680 () Bool)

(declare-datatypes ((V!49677 0))(
  ( (V!49678 (val!16790 Int)) )
))
(declare-datatypes ((ValueCell!15817 0))(
  ( (ValueCellFull!15817 (v!19388 V!49677)) (EmptyCell!15817) )
))
(declare-datatypes ((array!83958 0))(
  ( (array!83959 (arr!40489 (Array (_ BitVec 32) ValueCell!15817)) (size!41039 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83958)

(declare-fun mapDefault!51680 () ValueCell!15817)

