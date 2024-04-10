; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108104 () Bool)

(assert start!108104)

(declare-fun b_free!27817 () Bool)

(declare-fun b_next!27817 () Bool)

(assert (=> start!108104 (= b_free!27817 (not b_next!27817))))

(declare-fun tp!98404 () Bool)

(declare-fun b_and!45873 () Bool)

(assert (=> start!108104 (= tp!98404 b_and!45873)))

(declare-fun b!1276649 () Bool)

(declare-fun res!848405 () Bool)

(declare-fun e!729035 () Bool)

(assert (=> b!1276649 (=> (not res!848405) (not e!729035))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83826 0))(
  ( (array!83827 (arr!40424 (Array (_ BitVec 32) (_ BitVec 64))) (size!40974 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83826)

(declare-datatypes ((V!49593 0))(
  ( (V!49594 (val!16758 Int)) )
))
(declare-datatypes ((ValueCell!15785 0))(
  ( (ValueCellFull!15785 (v!19355 V!49593)) (EmptyCell!15785) )
))
(declare-datatypes ((array!83828 0))(
  ( (array!83829 (arr!40425 (Array (_ BitVec 32) ValueCell!15785)) (size!40975 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83828)

(assert (=> b!1276649 (= res!848405 (and (= (size!40975 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40974 _keys!1427) (size!40975 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51581 () Bool)

(declare-fun mapRes!51581 () Bool)

(declare-fun tp!98405 () Bool)

(declare-fun e!729033 () Bool)

(assert (=> mapNonEmpty!51581 (= mapRes!51581 (and tp!98405 e!729033))))

(declare-fun mapRest!51581 () (Array (_ BitVec 32) ValueCell!15785))

(declare-fun mapKey!51581 () (_ BitVec 32))

(declare-fun mapValue!51581 () ValueCell!15785)

(assert (=> mapNonEmpty!51581 (= (arr!40425 _values!1187) (store mapRest!51581 mapKey!51581 mapValue!51581))))

(declare-fun mapIsEmpty!51581 () Bool)

(assert (=> mapIsEmpty!51581 mapRes!51581))

(declare-fun b!1276650 () Bool)

(declare-fun tp_is_empty!33367 () Bool)

(assert (=> b!1276650 (= e!729033 tp_is_empty!33367)))

(declare-fun b!1276651 () Bool)

(declare-fun e!729036 () Bool)

(declare-fun e!729032 () Bool)

(assert (=> b!1276651 (= e!729036 (and e!729032 mapRes!51581))))

(declare-fun condMapEmpty!51581 () Bool)

(declare-fun mapDefault!51581 () ValueCell!15785)

