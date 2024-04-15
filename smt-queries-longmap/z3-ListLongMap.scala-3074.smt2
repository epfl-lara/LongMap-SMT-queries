; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43282 () Bool)

(assert start!43282)

(declare-fun b_free!12163 () Bool)

(declare-fun b_next!12163 () Bool)

(assert (=> start!43282 (= b_free!12163 (not b_next!12163))))

(declare-fun tp!42760 () Bool)

(declare-fun b_and!20889 () Bool)

(assert (=> start!43282 (= tp!42760 b_and!20889)))

(declare-fun mapNonEmpty!22210 () Bool)

(declare-fun mapRes!22210 () Bool)

(declare-fun tp!42759 () Bool)

(declare-fun e!282065 () Bool)

(assert (=> mapNonEmpty!22210 (= mapRes!22210 (and tp!42759 e!282065))))

(declare-datatypes ((V!19305 0))(
  ( (V!19306 (val!6885 Int)) )
))
(declare-datatypes ((ValueCell!6476 0))(
  ( (ValueCellFull!6476 (v!9168 V!19305)) (EmptyCell!6476) )
))
(declare-fun mapValue!22210 () ValueCell!6476)

(declare-fun mapRest!22210 () (Array (_ BitVec 32) ValueCell!6476))

(declare-fun mapKey!22210 () (_ BitVec 32))

(declare-datatypes ((array!31013 0))(
  ( (array!31014 (arr!14913 (Array (_ BitVec 32) ValueCell!6476)) (size!15272 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31013)

(assert (=> mapNonEmpty!22210 (= (arr!14913 _values!1516) (store mapRest!22210 mapKey!22210 mapValue!22210))))

(declare-fun b!479407 () Bool)

(declare-fun res!285997 () Bool)

(declare-fun e!282062 () Bool)

(assert (=> b!479407 (=> (not res!285997) (not e!282062))))

(declare-datatypes ((array!31015 0))(
  ( (array!31016 (arr!14914 (Array (_ BitVec 32) (_ BitVec 64))) (size!15273 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31015)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!479407 (= res!285997 (and (= (size!15272 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15273 _keys!1874) (size!15272 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285996 () Bool)

(assert (=> start!43282 (=> (not res!285996) (not e!282062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43282 (= res!285996 (validMask!0 mask!2352))))

(assert (=> start!43282 e!282062))

(assert (=> start!43282 true))

(declare-fun tp_is_empty!13675 () Bool)

(assert (=> start!43282 tp_is_empty!13675))

(declare-fun e!282063 () Bool)

(declare-fun array_inv!10854 (array!31013) Bool)

(assert (=> start!43282 (and (array_inv!10854 _values!1516) e!282063)))

(assert (=> start!43282 tp!42760))

(declare-fun array_inv!10855 (array!31015) Bool)

(assert (=> start!43282 (array_inv!10855 _keys!1874)))

(declare-fun mapIsEmpty!22210 () Bool)

(assert (=> mapIsEmpty!22210 mapRes!22210))

(declare-fun b!479408 () Bool)

(declare-fun e!282066 () Bool)

(assert (=> b!479408 (= e!282063 (and e!282066 mapRes!22210))))

(declare-fun condMapEmpty!22210 () Bool)

(declare-fun mapDefault!22210 () ValueCell!6476)

(assert (=> b!479408 (= condMapEmpty!22210 (= (arr!14913 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6476)) mapDefault!22210)))))

(declare-fun b!479409 () Bool)

(assert (=> b!479409 (= e!282065 tp_is_empty!13675)))

(declare-fun b!479410 () Bool)

(assert (=> b!479410 (= e!282066 tp_is_empty!13675)))

(declare-fun b!479411 () Bool)

(assert (=> b!479411 (= e!282062 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19305)

(declare-fun lt!217663 () Bool)

(declare-fun zeroValue!1458 () V!19305)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9092 0))(
  ( (tuple2!9093 (_1!4557 (_ BitVec 64)) (_2!4557 V!19305)) )
))
(declare-datatypes ((List!9155 0))(
  ( (Nil!9152) (Cons!9151 (h!10007 tuple2!9092) (t!15352 List!9155)) )
))
(declare-datatypes ((ListLongMap!7995 0))(
  ( (ListLongMap!7996 (toList!4013 List!9155)) )
))
(declare-fun contains!2588 (ListLongMap!7995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2266 (array!31015 array!31013 (_ BitVec 32) (_ BitVec 32) V!19305 V!19305 (_ BitVec 32) Int) ListLongMap!7995)

(assert (=> b!479411 (= lt!217663 (contains!2588 (getCurrentListMap!2266 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479412 () Bool)

(declare-fun res!285998 () Bool)

(assert (=> b!479412 (=> (not res!285998) (not e!282062))))

(declare-datatypes ((List!9156 0))(
  ( (Nil!9153) (Cons!9152 (h!10008 (_ BitVec 64)) (t!15353 List!9156)) )
))
(declare-fun arrayNoDuplicates!0 (array!31015 (_ BitVec 32) List!9156) Bool)

(assert (=> b!479412 (= res!285998 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9153))))

(declare-fun b!479413 () Bool)

(declare-fun res!285999 () Bool)

(assert (=> b!479413 (=> (not res!285999) (not e!282062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31015 (_ BitVec 32)) Bool)

(assert (=> b!479413 (= res!285999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43282 res!285996) b!479407))

(assert (= (and b!479407 res!285997) b!479413))

(assert (= (and b!479413 res!285999) b!479412))

(assert (= (and b!479412 res!285998) b!479411))

(assert (= (and b!479408 condMapEmpty!22210) mapIsEmpty!22210))

(assert (= (and b!479408 (not condMapEmpty!22210)) mapNonEmpty!22210))

(get-info :version)

(assert (= (and mapNonEmpty!22210 ((_ is ValueCellFull!6476) mapValue!22210)) b!479409))

(assert (= (and b!479408 ((_ is ValueCellFull!6476) mapDefault!22210)) b!479410))

(assert (= start!43282 b!479408))

(declare-fun m!460833 () Bool)

(assert (=> b!479411 m!460833))

(assert (=> b!479411 m!460833))

(declare-fun m!460835 () Bool)

(assert (=> b!479411 m!460835))

(declare-fun m!460837 () Bool)

(assert (=> b!479412 m!460837))

(declare-fun m!460839 () Bool)

(assert (=> mapNonEmpty!22210 m!460839))

(declare-fun m!460841 () Bool)

(assert (=> start!43282 m!460841))

(declare-fun m!460843 () Bool)

(assert (=> start!43282 m!460843))

(declare-fun m!460845 () Bool)

(assert (=> start!43282 m!460845))

(declare-fun m!460847 () Bool)

(assert (=> b!479413 m!460847))

(check-sat (not mapNonEmpty!22210) (not b!479413) (not b!479411) (not b_next!12163) (not start!43282) (not b!479412) tp_is_empty!13675 b_and!20889)
(check-sat b_and!20889 (not b_next!12163))
