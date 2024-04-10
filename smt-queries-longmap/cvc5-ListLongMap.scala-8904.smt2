; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108074 () Bool)

(assert start!108074)

(declare-fun b_free!27787 () Bool)

(declare-fun b_next!27787 () Bool)

(assert (=> start!108074 (= b_free!27787 (not b_next!27787))))

(declare-fun tp!98314 () Bool)

(declare-fun b_and!45843 () Bool)

(assert (=> start!108074 (= tp!98314 b_and!45843)))

(declare-fun b!1276334 () Bool)

(declare-fun res!848224 () Bool)

(declare-fun e!728809 () Bool)

(assert (=> b!1276334 (=> (not res!848224) (not e!728809))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83768 0))(
  ( (array!83769 (arr!40395 (Array (_ BitVec 32) (_ BitVec 64))) (size!40945 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83768)

(declare-datatypes ((V!49553 0))(
  ( (V!49554 (val!16743 Int)) )
))
(declare-datatypes ((ValueCell!15770 0))(
  ( (ValueCellFull!15770 (v!19340 V!49553)) (EmptyCell!15770) )
))
(declare-datatypes ((array!83770 0))(
  ( (array!83771 (arr!40396 (Array (_ BitVec 32) ValueCell!15770)) (size!40946 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83770)

(assert (=> b!1276334 (= res!848224 (and (= (size!40946 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40945 _keys!1427) (size!40946 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51536 () Bool)

(declare-fun mapRes!51536 () Bool)

(assert (=> mapIsEmpty!51536 mapRes!51536))

(declare-fun b!1276335 () Bool)

(assert (=> b!1276335 (= e!728809 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575473 () Bool)

(declare-fun minValue!1129 () V!49553)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49553)

(declare-datatypes ((tuple2!21476 0))(
  ( (tuple2!21477 (_1!10749 (_ BitVec 64)) (_2!10749 V!49553)) )
))
(declare-datatypes ((List!28647 0))(
  ( (Nil!28644) (Cons!28643 (h!29852 tuple2!21476) (t!42183 List!28647)) )
))
(declare-datatypes ((ListLongMap!19133 0))(
  ( (ListLongMap!19134 (toList!9582 List!28647)) )
))
(declare-fun contains!7691 (ListLongMap!19133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4666 (array!83768 array!83770 (_ BitVec 32) (_ BitVec 32) V!49553 V!49553 (_ BitVec 32) Int) ListLongMap!19133)

(assert (=> b!1276335 (= lt!575473 (contains!7691 (getCurrentListMap!4666 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun res!848223 () Bool)

(assert (=> start!108074 (=> (not res!848223) (not e!728809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108074 (= res!848223 (validMask!0 mask!1805))))

(assert (=> start!108074 e!728809))

(assert (=> start!108074 true))

(assert (=> start!108074 tp!98314))

(declare-fun tp_is_empty!33337 () Bool)

(assert (=> start!108074 tp_is_empty!33337))

(declare-fun e!728810 () Bool)

(declare-fun array_inv!30699 (array!83770) Bool)

(assert (=> start!108074 (and (array_inv!30699 _values!1187) e!728810)))

(declare-fun array_inv!30700 (array!83768) Bool)

(assert (=> start!108074 (array_inv!30700 _keys!1427)))

(declare-fun b!1276336 () Bool)

(declare-fun res!848226 () Bool)

(assert (=> b!1276336 (=> (not res!848226) (not e!728809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83768 (_ BitVec 32)) Bool)

(assert (=> b!1276336 (= res!848226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276337 () Bool)

(declare-fun e!728811 () Bool)

(assert (=> b!1276337 (= e!728811 tp_is_empty!33337)))

(declare-fun mapNonEmpty!51536 () Bool)

(declare-fun tp!98315 () Bool)

(assert (=> mapNonEmpty!51536 (= mapRes!51536 (and tp!98315 e!728811))))

(declare-fun mapRest!51536 () (Array (_ BitVec 32) ValueCell!15770))

(declare-fun mapKey!51536 () (_ BitVec 32))

(declare-fun mapValue!51536 () ValueCell!15770)

(assert (=> mapNonEmpty!51536 (= (arr!40396 _values!1187) (store mapRest!51536 mapKey!51536 mapValue!51536))))

(declare-fun b!1276338 () Bool)

(declare-fun e!728807 () Bool)

(assert (=> b!1276338 (= e!728807 tp_is_empty!33337)))

(declare-fun b!1276339 () Bool)

(declare-fun res!848225 () Bool)

(assert (=> b!1276339 (=> (not res!848225) (not e!728809))))

(declare-datatypes ((List!28648 0))(
  ( (Nil!28645) (Cons!28644 (h!29853 (_ BitVec 64)) (t!42184 List!28648)) )
))
(declare-fun arrayNoDuplicates!0 (array!83768 (_ BitVec 32) List!28648) Bool)

(assert (=> b!1276339 (= res!848225 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28645))))

(declare-fun b!1276340 () Bool)

(assert (=> b!1276340 (= e!728810 (and e!728807 mapRes!51536))))

(declare-fun condMapEmpty!51536 () Bool)

(declare-fun mapDefault!51536 () ValueCell!15770)

