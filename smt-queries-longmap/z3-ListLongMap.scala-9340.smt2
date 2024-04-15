; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111476 () Bool)

(assert start!111476)

(declare-fun b_free!30133 () Bool)

(declare-fun b_next!30133 () Bool)

(assert (=> start!111476 (= b_free!30133 (not b_next!30133))))

(declare-fun tp!105876 () Bool)

(declare-fun b_and!48407 () Bool)

(assert (=> start!111476 (= tp!105876 b_and!48407)))

(declare-fun res!875748 () Bool)

(declare-fun e!752802 () Bool)

(assert (=> start!111476 (=> (not res!875748) (not e!752802))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111476 (= res!875748 (validMask!0 mask!2019))))

(assert (=> start!111476 e!752802))

(declare-datatypes ((array!88771 0))(
  ( (array!88772 (arr!42860 (Array (_ BitVec 32) (_ BitVec 64))) (size!43412 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88771)

(declare-fun array_inv!32549 (array!88771) Bool)

(assert (=> start!111476 (array_inv!32549 _keys!1609)))

(assert (=> start!111476 true))

(declare-fun tp_is_empty!35953 () Bool)

(assert (=> start!111476 tp_is_empty!35953))

(declare-datatypes ((V!53041 0))(
  ( (V!53042 (val!18051 Int)) )
))
(declare-datatypes ((ValueCell!17078 0))(
  ( (ValueCellFull!17078 (v!20680 V!53041)) (EmptyCell!17078) )
))
(declare-datatypes ((array!88773 0))(
  ( (array!88774 (arr!42861 (Array (_ BitVec 32) ValueCell!17078)) (size!43413 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88773)

(declare-fun e!752806 () Bool)

(declare-fun array_inv!32550 (array!88773) Bool)

(assert (=> start!111476 (and (array_inv!32550 _values!1337) e!752806)))

(assert (=> start!111476 tp!105876))

(declare-fun mapIsEmpty!55577 () Bool)

(declare-fun mapRes!55577 () Bool)

(assert (=> mapIsEmpty!55577 mapRes!55577))

(declare-fun b!1319475 () Bool)

(declare-fun res!875750 () Bool)

(assert (=> b!1319475 (=> (not res!875750) (not e!752802))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319475 (= res!875750 (and (= (size!43413 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43412 _keys!1609) (size!43413 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319476 () Bool)

(declare-fun res!875744 () Bool)

(assert (=> b!1319476 (=> (not res!875744) (not e!752802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88771 (_ BitVec 32)) Bool)

(assert (=> b!1319476 (= res!875744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319477 () Bool)

(assert (=> b!1319477 (= e!752802 (not true))))

(declare-datatypes ((tuple2!23322 0))(
  ( (tuple2!23323 (_1!11672 (_ BitVec 64)) (_2!11672 V!53041)) )
))
(declare-datatypes ((List!30461 0))(
  ( (Nil!30458) (Cons!30457 (h!31666 tuple2!23322) (t!44135 List!30461)) )
))
(declare-datatypes ((ListLongMap!20979 0))(
  ( (ListLongMap!20980 (toList!10505 List!30461)) )
))
(declare-fun lt!586473 () ListLongMap!20979)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8588 (ListLongMap!20979 (_ BitVec 64)) Bool)

(assert (=> b!1319477 (contains!8588 lt!586473 k0!1164)))

(declare-datatypes ((Unit!43287 0))(
  ( (Unit!43288) )
))
(declare-fun lt!586472 () Unit!43287)

(declare-fun minValue!1279 () V!53041)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!117 ((_ BitVec 64) (_ BitVec 64) V!53041 ListLongMap!20979) Unit!43287)

(assert (=> b!1319477 (= lt!586472 (lemmaInListMapAfterAddingDiffThenInBefore!117 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586473))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53041)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4552 (ListLongMap!20979 tuple2!23322) ListLongMap!20979)

(declare-fun getCurrentListMapNoExtraKeys!6185 (array!88771 array!88773 (_ BitVec 32) (_ BitVec 32) V!53041 V!53041 (_ BitVec 32) Int) ListLongMap!20979)

(declare-fun get!21555 (ValueCell!17078 V!53041) V!53041)

(declare-fun dynLambda!3482 (Int (_ BitVec 64)) V!53041)

(assert (=> b!1319477 (= lt!586473 (+!4552 (+!4552 (getCurrentListMapNoExtraKeys!6185 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23323 (select (arr!42860 _keys!1609) from!2000) (get!21555 (select (arr!42861 _values!1337) from!2000) (dynLambda!3482 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319478 () Bool)

(declare-fun e!752803 () Bool)

(assert (=> b!1319478 (= e!752803 tp_is_empty!35953)))

(declare-fun b!1319479 () Bool)

(declare-fun res!875749 () Bool)

(assert (=> b!1319479 (=> (not res!875749) (not e!752802))))

(declare-fun getCurrentListMap!5397 (array!88771 array!88773 (_ BitVec 32) (_ BitVec 32) V!53041 V!53041 (_ BitVec 32) Int) ListLongMap!20979)

(assert (=> b!1319479 (= res!875749 (contains!8588 (getCurrentListMap!5397 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55577 () Bool)

(declare-fun tp!105875 () Bool)

(declare-fun e!752804 () Bool)

(assert (=> mapNonEmpty!55577 (= mapRes!55577 (and tp!105875 e!752804))))

(declare-fun mapRest!55577 () (Array (_ BitVec 32) ValueCell!17078))

(declare-fun mapKey!55577 () (_ BitVec 32))

(declare-fun mapValue!55577 () ValueCell!17078)

(assert (=> mapNonEmpty!55577 (= (arr!42861 _values!1337) (store mapRest!55577 mapKey!55577 mapValue!55577))))

(declare-fun b!1319480 () Bool)

(declare-fun res!875751 () Bool)

(assert (=> b!1319480 (=> (not res!875751) (not e!752802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319480 (= res!875751 (validKeyInArray!0 (select (arr!42860 _keys!1609) from!2000)))))

(declare-fun b!1319481 () Bool)

(declare-fun res!875745 () Bool)

(assert (=> b!1319481 (=> (not res!875745) (not e!752802))))

(declare-datatypes ((List!30462 0))(
  ( (Nil!30459) (Cons!30458 (h!31667 (_ BitVec 64)) (t!44136 List!30462)) )
))
(declare-fun arrayNoDuplicates!0 (array!88771 (_ BitVec 32) List!30462) Bool)

(assert (=> b!1319481 (= res!875745 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30459))))

(declare-fun b!1319482 () Bool)

(declare-fun res!875747 () Bool)

(assert (=> b!1319482 (=> (not res!875747) (not e!752802))))

(assert (=> b!1319482 (= res!875747 (not (= (select (arr!42860 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319483 () Bool)

(assert (=> b!1319483 (= e!752804 tp_is_empty!35953)))

(declare-fun b!1319484 () Bool)

(assert (=> b!1319484 (= e!752806 (and e!752803 mapRes!55577))))

(declare-fun condMapEmpty!55577 () Bool)

(declare-fun mapDefault!55577 () ValueCell!17078)

(assert (=> b!1319484 (= condMapEmpty!55577 (= (arr!42861 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17078)) mapDefault!55577)))))

(declare-fun b!1319485 () Bool)

(declare-fun res!875746 () Bool)

(assert (=> b!1319485 (=> (not res!875746) (not e!752802))))

(assert (=> b!1319485 (= res!875746 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43412 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111476 res!875748) b!1319475))

(assert (= (and b!1319475 res!875750) b!1319476))

(assert (= (and b!1319476 res!875744) b!1319481))

(assert (= (and b!1319481 res!875745) b!1319485))

(assert (= (and b!1319485 res!875746) b!1319479))

(assert (= (and b!1319479 res!875749) b!1319482))

(assert (= (and b!1319482 res!875747) b!1319480))

(assert (= (and b!1319480 res!875751) b!1319477))

(assert (= (and b!1319484 condMapEmpty!55577) mapIsEmpty!55577))

(assert (= (and b!1319484 (not condMapEmpty!55577)) mapNonEmpty!55577))

(get-info :version)

(assert (= (and mapNonEmpty!55577 ((_ is ValueCellFull!17078) mapValue!55577)) b!1319483))

(assert (= (and b!1319484 ((_ is ValueCellFull!17078) mapDefault!55577)) b!1319478))

(assert (= start!111476 b!1319484))

(declare-fun b_lambda!23449 () Bool)

(assert (=> (not b_lambda!23449) (not b!1319477)))

(declare-fun t!44134 () Bool)

(declare-fun tb!11477 () Bool)

(assert (=> (and start!111476 (= defaultEntry!1340 defaultEntry!1340) t!44134) tb!11477))

(declare-fun result!24017 () Bool)

(assert (=> tb!11477 (= result!24017 tp_is_empty!35953)))

(assert (=> b!1319477 t!44134))

(declare-fun b_and!48409 () Bool)

(assert (= b_and!48407 (and (=> t!44134 result!24017) b_and!48409)))

(declare-fun m!1206627 () Bool)

(assert (=> start!111476 m!1206627))

(declare-fun m!1206629 () Bool)

(assert (=> start!111476 m!1206629))

(declare-fun m!1206631 () Bool)

(assert (=> start!111476 m!1206631))

(declare-fun m!1206633 () Bool)

(assert (=> b!1319476 m!1206633))

(declare-fun m!1206635 () Bool)

(assert (=> b!1319480 m!1206635))

(assert (=> b!1319480 m!1206635))

(declare-fun m!1206637 () Bool)

(assert (=> b!1319480 m!1206637))

(declare-fun m!1206639 () Bool)

(assert (=> b!1319481 m!1206639))

(declare-fun m!1206641 () Bool)

(assert (=> b!1319479 m!1206641))

(assert (=> b!1319479 m!1206641))

(declare-fun m!1206643 () Bool)

(assert (=> b!1319479 m!1206643))

(declare-fun m!1206645 () Bool)

(assert (=> b!1319477 m!1206645))

(declare-fun m!1206647 () Bool)

(assert (=> b!1319477 m!1206647))

(assert (=> b!1319477 m!1206645))

(declare-fun m!1206649 () Bool)

(assert (=> b!1319477 m!1206649))

(declare-fun m!1206651 () Bool)

(assert (=> b!1319477 m!1206651))

(declare-fun m!1206653 () Bool)

(assert (=> b!1319477 m!1206653))

(assert (=> b!1319477 m!1206649))

(declare-fun m!1206655 () Bool)

(assert (=> b!1319477 m!1206655))

(assert (=> b!1319477 m!1206653))

(assert (=> b!1319477 m!1206647))

(declare-fun m!1206657 () Bool)

(assert (=> b!1319477 m!1206657))

(assert (=> b!1319477 m!1206635))

(declare-fun m!1206659 () Bool)

(assert (=> b!1319477 m!1206659))

(declare-fun m!1206661 () Bool)

(assert (=> mapNonEmpty!55577 m!1206661))

(assert (=> b!1319482 m!1206635))

(check-sat (not b!1319479) b_and!48409 (not mapNonEmpty!55577) (not b!1319481) (not b_lambda!23449) tp_is_empty!35953 (not b!1319476) (not start!111476) (not b!1319477) (not b_next!30133) (not b!1319480))
(check-sat b_and!48409 (not b_next!30133))
