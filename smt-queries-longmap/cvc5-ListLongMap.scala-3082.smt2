; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43384 () Bool)

(assert start!43384)

(declare-fun b_free!12211 () Bool)

(declare-fun b_next!12211 () Bool)

(assert (=> start!43384 (= b_free!12211 (not b_next!12211))))

(declare-fun tp!42910 () Bool)

(declare-fun b_and!20967 () Bool)

(assert (=> start!43384 (= tp!42910 b_and!20967)))

(declare-fun b!480693 () Bool)

(declare-fun res!286658 () Bool)

(declare-fun e!282834 () Bool)

(assert (=> b!480693 (=> (not res!286658) (not e!282834))))

(declare-datatypes ((array!31111 0))(
  ( (array!31112 (arr!14960 (Array (_ BitVec 32) (_ BitVec 64))) (size!15318 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31111)

(declare-datatypes ((List!9143 0))(
  ( (Nil!9140) (Cons!9139 (h!9995 (_ BitVec 64)) (t!15353 List!9143)) )
))
(declare-fun arrayNoDuplicates!0 (array!31111 (_ BitVec 32) List!9143) Bool)

(assert (=> b!480693 (= res!286658 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9140))))

(declare-fun b!480694 () Bool)

(declare-fun res!286655 () Bool)

(assert (=> b!480694 (=> (not res!286655) (not e!282834))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19369 0))(
  ( (V!19370 (val!6909 Int)) )
))
(declare-fun minValue!1458 () V!19369)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6500 0))(
  ( (ValueCellFull!6500 (v!9200 V!19369)) (EmptyCell!6500) )
))
(declare-datatypes ((array!31113 0))(
  ( (array!31114 (arr!14961 (Array (_ BitVec 32) ValueCell!6500)) (size!15319 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31113)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19369)

(declare-datatypes ((tuple2!9066 0))(
  ( (tuple2!9067 (_1!4544 (_ BitVec 64)) (_2!4544 V!19369)) )
))
(declare-datatypes ((List!9144 0))(
  ( (Nil!9141) (Cons!9140 (h!9996 tuple2!9066) (t!15354 List!9144)) )
))
(declare-datatypes ((ListLongMap!7979 0))(
  ( (ListLongMap!7980 (toList!4005 List!9144)) )
))
(declare-fun contains!2617 (ListLongMap!7979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2324 (array!31111 array!31113 (_ BitVec 32) (_ BitVec 32) V!19369 V!19369 (_ BitVec 32) Int) ListLongMap!7979)

(assert (=> b!480694 (= res!286655 (contains!2617 (getCurrentListMap!2324 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!480695 () Bool)

(declare-fun res!286654 () Bool)

(assert (=> b!480695 (=> (not res!286654) (not e!282834))))

(assert (=> b!480695 (= res!286654 (and (= (size!15319 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15318 _keys!1874) (size!15319 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480697 () Bool)

(declare-fun e!282837 () Bool)

(declare-fun tp_is_empty!13723 () Bool)

(assert (=> b!480697 (= e!282837 tp_is_empty!13723)))

(declare-fun mapIsEmpty!22288 () Bool)

(declare-fun mapRes!22288 () Bool)

(assert (=> mapIsEmpty!22288 mapRes!22288))

(declare-fun b!480698 () Bool)

(declare-fun res!286657 () Bool)

(assert (=> b!480698 (=> (not res!286657) (not e!282834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31111 (_ BitVec 32)) Bool)

(assert (=> b!480698 (= res!286657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480699 () Bool)

(declare-fun res!286656 () Bool)

(assert (=> b!480699 (=> (not res!286656) (not e!282834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480699 (= res!286656 (validKeyInArray!0 k!1332))))

(declare-fun b!480700 () Bool)

(declare-fun e!282835 () Bool)

(assert (=> b!480700 (= e!282835 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22288 () Bool)

(declare-fun tp!42909 () Bool)

(declare-fun e!282832 () Bool)

(assert (=> mapNonEmpty!22288 (= mapRes!22288 (and tp!42909 e!282832))))

(declare-fun mapValue!22288 () ValueCell!6500)

(declare-fun mapKey!22288 () (_ BitVec 32))

(declare-fun mapRest!22288 () (Array (_ BitVec 32) ValueCell!6500))

(assert (=> mapNonEmpty!22288 (= (arr!14961 _values!1516) (store mapRest!22288 mapKey!22288 mapValue!22288))))

(declare-fun b!480701 () Bool)

(assert (=> b!480701 (= e!282832 tp_is_empty!13723)))

(declare-fun b!480702 () Bool)

(declare-fun arrayContainsKey!0 (array!31111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480702 (= e!282835 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!480703 () Bool)

(declare-fun e!282833 () Bool)

(assert (=> b!480703 (= e!282833 (and e!282837 mapRes!22288))))

(declare-fun condMapEmpty!22288 () Bool)

(declare-fun mapDefault!22288 () ValueCell!6500)

