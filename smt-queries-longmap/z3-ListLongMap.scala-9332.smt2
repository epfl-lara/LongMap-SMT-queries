; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111428 () Bool)

(assert start!111428)

(declare-fun b_free!30085 () Bool)

(declare-fun b_next!30085 () Bool)

(assert (=> start!111428 (= b_free!30085 (not b_next!30085))))

(declare-fun tp!105731 () Bool)

(declare-fun b_and!48311 () Bool)

(assert (=> start!111428 (= tp!105731 b_and!48311)))

(declare-fun b!1318635 () Bool)

(declare-fun res!875173 () Bool)

(declare-fun e!752444 () Bool)

(assert (=> b!1318635 (=> (not res!875173) (not e!752444))))

(declare-datatypes ((array!88677 0))(
  ( (array!88678 (arr!42813 (Array (_ BitVec 32) (_ BitVec 64))) (size!43365 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88677)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88677 (_ BitVec 32)) Bool)

(assert (=> b!1318635 (= res!875173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318636 () Bool)

(declare-fun res!875175 () Bool)

(assert (=> b!1318636 (=> (not res!875175) (not e!752444))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52977 0))(
  ( (V!52978 (val!18027 Int)) )
))
(declare-fun zeroValue!1279 () V!52977)

(declare-datatypes ((ValueCell!17054 0))(
  ( (ValueCellFull!17054 (v!20656 V!52977)) (EmptyCell!17054) )
))
(declare-datatypes ((array!88679 0))(
  ( (array!88680 (arr!42814 (Array (_ BitVec 32) ValueCell!17054)) (size!43366 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88679)

(declare-fun minValue!1279 () V!52977)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23286 0))(
  ( (tuple2!23287 (_1!11654 (_ BitVec 64)) (_2!11654 V!52977)) )
))
(declare-datatypes ((List!30423 0))(
  ( (Nil!30420) (Cons!30419 (h!31628 tuple2!23286) (t!44049 List!30423)) )
))
(declare-datatypes ((ListLongMap!20943 0))(
  ( (ListLongMap!20944 (toList!10487 List!30423)) )
))
(declare-fun contains!8570 (ListLongMap!20943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5380 (array!88677 array!88679 (_ BitVec 32) (_ BitVec 32) V!52977 V!52977 (_ BitVec 32) Int) ListLongMap!20943)

(assert (=> b!1318636 (= res!875175 (contains!8570 (getCurrentListMap!5380 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318637 () Bool)

(declare-fun res!875169 () Bool)

(assert (=> b!1318637 (=> (not res!875169) (not e!752444))))

(declare-datatypes ((List!30424 0))(
  ( (Nil!30421) (Cons!30420 (h!31629 (_ BitVec 64)) (t!44050 List!30424)) )
))
(declare-fun arrayNoDuplicates!0 (array!88677 (_ BitVec 32) List!30424) Bool)

(assert (=> b!1318637 (= res!875169 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30421))))

(declare-fun b!1318638 () Bool)

(assert (=> b!1318638 (= e!752444 (not true))))

(declare-fun lt!586329 () ListLongMap!20943)

(assert (=> b!1318638 (contains!8570 lt!586329 k0!1164)))

(declare-datatypes ((Unit!43255 0))(
  ( (Unit!43256) )
))
(declare-fun lt!586328 () Unit!43255)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!101 ((_ BitVec 64) (_ BitVec 64) V!52977 ListLongMap!20943) Unit!43255)

(assert (=> b!1318638 (= lt!586328 (lemmaInListMapAfterAddingDiffThenInBefore!101 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586329))))

(declare-fun +!4536 (ListLongMap!20943 tuple2!23286) ListLongMap!20943)

(declare-fun getCurrentListMapNoExtraKeys!6169 (array!88677 array!88679 (_ BitVec 32) (_ BitVec 32) V!52977 V!52977 (_ BitVec 32) Int) ListLongMap!20943)

(declare-fun get!21523 (ValueCell!17054 V!52977) V!52977)

(declare-fun dynLambda!3466 (Int (_ BitVec 64)) V!52977)

(assert (=> b!1318638 (= lt!586329 (+!4536 (+!4536 (getCurrentListMapNoExtraKeys!6169 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23287 (select (arr!42813 _keys!1609) from!2000) (get!21523 (select (arr!42814 _values!1337) from!2000) (dynLambda!3466 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23287 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318639 () Bool)

(declare-fun res!875168 () Bool)

(assert (=> b!1318639 (=> (not res!875168) (not e!752444))))

(assert (=> b!1318639 (= res!875168 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43365 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318640 () Bool)

(declare-fun res!875174 () Bool)

(assert (=> b!1318640 (=> (not res!875174) (not e!752444))))

(assert (=> b!1318640 (= res!875174 (and (= (size!43366 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43365 _keys!1609) (size!43366 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!875172 () Bool)

(assert (=> start!111428 (=> (not res!875172) (not e!752444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111428 (= res!875172 (validMask!0 mask!2019))))

(assert (=> start!111428 e!752444))

(declare-fun array_inv!32513 (array!88677) Bool)

(assert (=> start!111428 (array_inv!32513 _keys!1609)))

(assert (=> start!111428 true))

(declare-fun tp_is_empty!35905 () Bool)

(assert (=> start!111428 tp_is_empty!35905))

(declare-fun e!752445 () Bool)

(declare-fun array_inv!32514 (array!88679) Bool)

(assert (=> start!111428 (and (array_inv!32514 _values!1337) e!752445)))

(assert (=> start!111428 tp!105731))

(declare-fun b!1318641 () Bool)

(declare-fun e!752442 () Bool)

(assert (=> b!1318641 (= e!752442 tp_is_empty!35905)))

(declare-fun b!1318642 () Bool)

(declare-fun res!875171 () Bool)

(assert (=> b!1318642 (=> (not res!875171) (not e!752444))))

(assert (=> b!1318642 (= res!875171 (not (= (select (arr!42813 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55505 () Bool)

(declare-fun mapRes!55505 () Bool)

(declare-fun tp!105732 () Bool)

(assert (=> mapNonEmpty!55505 (= mapRes!55505 (and tp!105732 e!752442))))

(declare-fun mapValue!55505 () ValueCell!17054)

(declare-fun mapKey!55505 () (_ BitVec 32))

(declare-fun mapRest!55505 () (Array (_ BitVec 32) ValueCell!17054))

(assert (=> mapNonEmpty!55505 (= (arr!42814 _values!1337) (store mapRest!55505 mapKey!55505 mapValue!55505))))

(declare-fun b!1318643 () Bool)

(declare-fun res!875170 () Bool)

(assert (=> b!1318643 (=> (not res!875170) (not e!752444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318643 (= res!875170 (validKeyInArray!0 (select (arr!42813 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55505 () Bool)

(assert (=> mapIsEmpty!55505 mapRes!55505))

(declare-fun b!1318644 () Bool)

(declare-fun e!752443 () Bool)

(assert (=> b!1318644 (= e!752443 tp_is_empty!35905)))

(declare-fun b!1318645 () Bool)

(assert (=> b!1318645 (= e!752445 (and e!752443 mapRes!55505))))

(declare-fun condMapEmpty!55505 () Bool)

(declare-fun mapDefault!55505 () ValueCell!17054)

(assert (=> b!1318645 (= condMapEmpty!55505 (= (arr!42814 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17054)) mapDefault!55505)))))

(assert (= (and start!111428 res!875172) b!1318640))

(assert (= (and b!1318640 res!875174) b!1318635))

(assert (= (and b!1318635 res!875173) b!1318637))

(assert (= (and b!1318637 res!875169) b!1318639))

(assert (= (and b!1318639 res!875168) b!1318636))

(assert (= (and b!1318636 res!875175) b!1318642))

(assert (= (and b!1318642 res!875171) b!1318643))

(assert (= (and b!1318643 res!875170) b!1318638))

(assert (= (and b!1318645 condMapEmpty!55505) mapIsEmpty!55505))

(assert (= (and b!1318645 (not condMapEmpty!55505)) mapNonEmpty!55505))

(get-info :version)

(assert (= (and mapNonEmpty!55505 ((_ is ValueCellFull!17054) mapValue!55505)) b!1318641))

(assert (= (and b!1318645 ((_ is ValueCellFull!17054) mapDefault!55505)) b!1318644))

(assert (= start!111428 b!1318645))

(declare-fun b_lambda!23401 () Bool)

(assert (=> (not b_lambda!23401) (not b!1318638)))

(declare-fun t!44048 () Bool)

(declare-fun tb!11429 () Bool)

(assert (=> (and start!111428 (= defaultEntry!1340 defaultEntry!1340) t!44048) tb!11429))

(declare-fun result!23921 () Bool)

(assert (=> tb!11429 (= result!23921 tp_is_empty!35905)))

(assert (=> b!1318638 t!44048))

(declare-fun b_and!48313 () Bool)

(assert (= b_and!48311 (and (=> t!44048 result!23921) b_and!48313)))

(declare-fun m!1205763 () Bool)

(assert (=> b!1318636 m!1205763))

(assert (=> b!1318636 m!1205763))

(declare-fun m!1205765 () Bool)

(assert (=> b!1318636 m!1205765))

(declare-fun m!1205767 () Bool)

(assert (=> b!1318642 m!1205767))

(assert (=> b!1318643 m!1205767))

(assert (=> b!1318643 m!1205767))

(declare-fun m!1205769 () Bool)

(assert (=> b!1318643 m!1205769))

(declare-fun m!1205771 () Bool)

(assert (=> b!1318638 m!1205771))

(declare-fun m!1205773 () Bool)

(assert (=> b!1318638 m!1205773))

(assert (=> b!1318638 m!1205771))

(declare-fun m!1205775 () Bool)

(assert (=> b!1318638 m!1205775))

(declare-fun m!1205777 () Bool)

(assert (=> b!1318638 m!1205777))

(declare-fun m!1205779 () Bool)

(assert (=> b!1318638 m!1205779))

(declare-fun m!1205781 () Bool)

(assert (=> b!1318638 m!1205781))

(assert (=> b!1318638 m!1205775))

(declare-fun m!1205783 () Bool)

(assert (=> b!1318638 m!1205783))

(assert (=> b!1318638 m!1205781))

(assert (=> b!1318638 m!1205773))

(declare-fun m!1205785 () Bool)

(assert (=> b!1318638 m!1205785))

(assert (=> b!1318638 m!1205767))

(declare-fun m!1205787 () Bool)

(assert (=> b!1318637 m!1205787))

(declare-fun m!1205789 () Bool)

(assert (=> b!1318635 m!1205789))

(declare-fun m!1205791 () Bool)

(assert (=> mapNonEmpty!55505 m!1205791))

(declare-fun m!1205793 () Bool)

(assert (=> start!111428 m!1205793))

(declare-fun m!1205795 () Bool)

(assert (=> start!111428 m!1205795))

(declare-fun m!1205797 () Bool)

(assert (=> start!111428 m!1205797))

(check-sat (not b_lambda!23401) tp_is_empty!35905 (not b!1318643) (not b_next!30085) (not b!1318638) (not b!1318637) b_and!48313 (not b!1318635) (not mapNonEmpty!55505) (not start!111428) (not b!1318636))
(check-sat b_and!48313 (not b_next!30085))
