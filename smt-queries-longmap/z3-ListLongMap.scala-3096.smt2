; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43502 () Bool)

(assert start!43502)

(declare-fun b_free!12295 () Bool)

(declare-fun b_next!12295 () Bool)

(assert (=> start!43502 (= b_free!12295 (not b_next!12295))))

(declare-fun tp!43167 () Bool)

(declare-fun b_and!21029 () Bool)

(assert (=> start!43502 (= tp!43167 b_and!21029)))

(declare-fun b!481882 () Bool)

(declare-fun e!283542 () Bool)

(declare-fun tp_is_empty!13807 () Bool)

(assert (=> b!481882 (= e!283542 tp_is_empty!13807)))

(declare-fun b!481883 () Bool)

(declare-fun e!283543 () Bool)

(assert (=> b!481883 (= e!283543 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19481 0))(
  ( (V!19482 (val!6951 Int)) )
))
(declare-fun zeroValue!1458 () V!19481)

(declare-datatypes ((ValueCell!6542 0))(
  ( (ValueCellFull!6542 (v!9238 V!19481)) (EmptyCell!6542) )
))
(declare-datatypes ((array!31269 0))(
  ( (array!31270 (arr!15037 (Array (_ BitVec 32) ValueCell!6542)) (size!15396 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31269)

(declare-fun lt!218446 () Bool)

(declare-fun minValue!1458 () V!19481)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31271 0))(
  ( (array!31272 (arr!15038 (Array (_ BitVec 32) (_ BitVec 64))) (size!15397 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31271)

(declare-datatypes ((tuple2!9174 0))(
  ( (tuple2!9175 (_1!4598 (_ BitVec 64)) (_2!4598 V!19481)) )
))
(declare-datatypes ((List!9238 0))(
  ( (Nil!9235) (Cons!9234 (h!10090 tuple2!9174) (t!15443 List!9238)) )
))
(declare-datatypes ((ListLongMap!8077 0))(
  ( (ListLongMap!8078 (toList!4054 List!9238)) )
))
(declare-fun contains!2633 (ListLongMap!8077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2307 (array!31271 array!31269 (_ BitVec 32) (_ BitVec 32) V!19481 V!19481 (_ BitVec 32) Int) ListLongMap!8077)

(assert (=> b!481883 (= lt!218446 (contains!2633 (getCurrentListMap!2307 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481884 () Bool)

(declare-fun e!283544 () Bool)

(declare-fun mapRes!22420 () Bool)

(assert (=> b!481884 (= e!283544 (and e!283542 mapRes!22420))))

(declare-fun condMapEmpty!22420 () Bool)

(declare-fun mapDefault!22420 () ValueCell!6542)

(assert (=> b!481884 (= condMapEmpty!22420 (= (arr!15037 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6542)) mapDefault!22420)))))

(declare-fun b!481885 () Bool)

(declare-fun res!287293 () Bool)

(assert (=> b!481885 (=> (not res!287293) (not e!283543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31271 (_ BitVec 32)) Bool)

(assert (=> b!481885 (= res!287293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481886 () Bool)

(declare-fun res!287294 () Bool)

(assert (=> b!481886 (=> (not res!287294) (not e!283543))))

(declare-datatypes ((List!9239 0))(
  ( (Nil!9236) (Cons!9235 (h!10091 (_ BitVec 64)) (t!15444 List!9239)) )
))
(declare-fun arrayNoDuplicates!0 (array!31271 (_ BitVec 32) List!9239) Bool)

(assert (=> b!481886 (= res!287294 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9236))))

(declare-fun mapIsEmpty!22420 () Bool)

(assert (=> mapIsEmpty!22420 mapRes!22420))

(declare-fun b!481887 () Bool)

(declare-fun e!283541 () Bool)

(assert (=> b!481887 (= e!283541 tp_is_empty!13807)))

(declare-fun b!481888 () Bool)

(declare-fun res!287296 () Bool)

(assert (=> b!481888 (=> (not res!287296) (not e!283543))))

(assert (=> b!481888 (= res!287296 (and (= (size!15396 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15397 _keys!1874) (size!15396 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287295 () Bool)

(assert (=> start!43502 (=> (not res!287295) (not e!283543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43502 (= res!287295 (validMask!0 mask!2352))))

(assert (=> start!43502 e!283543))

(assert (=> start!43502 true))

(assert (=> start!43502 tp_is_empty!13807))

(declare-fun array_inv!10936 (array!31269) Bool)

(assert (=> start!43502 (and (array_inv!10936 _values!1516) e!283544)))

(assert (=> start!43502 tp!43167))

(declare-fun array_inv!10937 (array!31271) Bool)

(assert (=> start!43502 (array_inv!10937 _keys!1874)))

(declare-fun mapNonEmpty!22420 () Bool)

(declare-fun tp!43168 () Bool)

(assert (=> mapNonEmpty!22420 (= mapRes!22420 (and tp!43168 e!283541))))

(declare-fun mapRest!22420 () (Array (_ BitVec 32) ValueCell!6542))

(declare-fun mapKey!22420 () (_ BitVec 32))

(declare-fun mapValue!22420 () ValueCell!6542)

(assert (=> mapNonEmpty!22420 (= (arr!15037 _values!1516) (store mapRest!22420 mapKey!22420 mapValue!22420))))

(assert (= (and start!43502 res!287295) b!481888))

(assert (= (and b!481888 res!287296) b!481885))

(assert (= (and b!481885 res!287293) b!481886))

(assert (= (and b!481886 res!287294) b!481883))

(assert (= (and b!481884 condMapEmpty!22420) mapIsEmpty!22420))

(assert (= (and b!481884 (not condMapEmpty!22420)) mapNonEmpty!22420))

(get-info :version)

(assert (= (and mapNonEmpty!22420 ((_ is ValueCellFull!6542) mapValue!22420)) b!481887))

(assert (= (and b!481884 ((_ is ValueCellFull!6542) mapDefault!22420)) b!481882))

(assert (= start!43502 b!481884))

(declare-fun m!462741 () Bool)

(assert (=> mapNonEmpty!22420 m!462741))

(declare-fun m!462743 () Bool)

(assert (=> b!481885 m!462743))

(declare-fun m!462745 () Bool)

(assert (=> b!481883 m!462745))

(assert (=> b!481883 m!462745))

(declare-fun m!462747 () Bool)

(assert (=> b!481883 m!462747))

(declare-fun m!462749 () Bool)

(assert (=> start!43502 m!462749))

(declare-fun m!462751 () Bool)

(assert (=> start!43502 m!462751))

(declare-fun m!462753 () Bool)

(assert (=> start!43502 m!462753))

(declare-fun m!462755 () Bool)

(assert (=> b!481886 m!462755))

(check-sat tp_is_empty!13807 b_and!21029 (not b!481883) (not start!43502) (not b_next!12295) (not b!481885) (not b!481886) (not mapNonEmpty!22420))
(check-sat b_and!21029 (not b_next!12295))
