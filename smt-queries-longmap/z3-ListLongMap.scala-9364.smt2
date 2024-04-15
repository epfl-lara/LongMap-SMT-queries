; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111620 () Bool)

(assert start!111620)

(declare-fun b_free!30277 () Bool)

(declare-fun b_next!30277 () Bool)

(assert (=> start!111620 (= b_free!30277 (not b_next!30277))))

(declare-fun tp!106308 () Bool)

(declare-fun b_and!48695 () Bool)

(assert (=> start!111620 (= tp!106308 b_and!48695)))

(declare-fun b!1321995 () Bool)

(declare-fun res!877473 () Bool)

(declare-fun e!753883 () Bool)

(assert (=> b!1321995 (=> (not res!877473) (not e!753883))))

(declare-datatypes ((array!89047 0))(
  ( (array!89048 (arr!42998 (Array (_ BitVec 32) (_ BitVec 64))) (size!43550 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89047)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321995 (= res!877473 (validKeyInArray!0 (select (arr!42998 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55793 () Bool)

(declare-fun mapRes!55793 () Bool)

(assert (=> mapIsEmpty!55793 mapRes!55793))

(declare-fun b!1321996 () Bool)

(declare-fun res!877472 () Bool)

(assert (=> b!1321996 (=> (not res!877472) (not e!753883))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321996 (= res!877472 (not (= (select (arr!42998 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321997 () Bool)

(declare-fun res!877479 () Bool)

(assert (=> b!1321997 (=> (not res!877479) (not e!753883))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321997 (= res!877479 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43550 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321998 () Bool)

(declare-fun res!877478 () Bool)

(assert (=> b!1321998 (=> (not res!877478) (not e!753883))))

(declare-datatypes ((List!30557 0))(
  ( (Nil!30554) (Cons!30553 (h!31762 (_ BitVec 64)) (t!44375 List!30557)) )
))
(declare-fun arrayNoDuplicates!0 (array!89047 (_ BitVec 32) List!30557) Bool)

(assert (=> b!1321998 (= res!877478 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30554))))

(declare-fun b!1321999 () Bool)

(declare-fun e!753882 () Bool)

(declare-fun tp_is_empty!36097 () Bool)

(assert (=> b!1321999 (= e!753882 tp_is_empty!36097)))

(declare-fun b!1322000 () Bool)

(declare-fun res!877477 () Bool)

(assert (=> b!1322000 (=> (not res!877477) (not e!753883))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89047 (_ BitVec 32)) Bool)

(assert (=> b!1322000 (= res!877477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!877474 () Bool)

(assert (=> start!111620 (=> (not res!877474) (not e!753883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111620 (= res!877474 (validMask!0 mask!2019))))

(assert (=> start!111620 e!753883))

(declare-fun array_inv!32645 (array!89047) Bool)

(assert (=> start!111620 (array_inv!32645 _keys!1609)))

(assert (=> start!111620 true))

(assert (=> start!111620 tp_is_empty!36097))

(declare-datatypes ((V!53233 0))(
  ( (V!53234 (val!18123 Int)) )
))
(declare-datatypes ((ValueCell!17150 0))(
  ( (ValueCellFull!17150 (v!20752 V!53233)) (EmptyCell!17150) )
))
(declare-datatypes ((array!89049 0))(
  ( (array!89050 (arr!42999 (Array (_ BitVec 32) ValueCell!17150)) (size!43551 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89049)

(declare-fun e!753884 () Bool)

(declare-fun array_inv!32646 (array!89049) Bool)

(assert (=> start!111620 (and (array_inv!32646 _values!1337) e!753884)))

(assert (=> start!111620 tp!106308))

(declare-fun b!1322001 () Bool)

(assert (=> b!1322001 (= e!753884 (and e!753882 mapRes!55793))))

(declare-fun condMapEmpty!55793 () Bool)

(declare-fun mapDefault!55793 () ValueCell!17150)

(assert (=> b!1322001 (= condMapEmpty!55793 (= (arr!42999 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17150)) mapDefault!55793)))))

(declare-fun b!1322002 () Bool)

(assert (=> b!1322002 (= e!753883 (not true))))

(declare-datatypes ((tuple2!23424 0))(
  ( (tuple2!23425 (_1!11723 (_ BitVec 64)) (_2!11723 V!53233)) )
))
(declare-datatypes ((List!30558 0))(
  ( (Nil!30555) (Cons!30554 (h!31763 tuple2!23424) (t!44376 List!30558)) )
))
(declare-datatypes ((ListLongMap!21081 0))(
  ( (ListLongMap!21082 (toList!10556 List!30558)) )
))
(declare-fun lt!587694 () ListLongMap!21081)

(declare-fun lt!587696 () tuple2!23424)

(declare-fun contains!8639 (ListLongMap!21081 (_ BitVec 64)) Bool)

(declare-fun +!4597 (ListLongMap!21081 tuple2!23424) ListLongMap!21081)

(assert (=> b!1322002 (contains!8639 (+!4597 lt!587694 lt!587696) k0!1164)))

(declare-fun zeroValue!1279 () V!53233)

(declare-datatypes ((Unit!43377 0))(
  ( (Unit!43378) )
))
(declare-fun lt!587698 () Unit!43377)

(declare-fun addStillContains!1121 (ListLongMap!21081 (_ BitVec 64) V!53233 (_ BitVec 64)) Unit!43377)

(assert (=> b!1322002 (= lt!587698 (addStillContains!1121 lt!587694 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322002 (contains!8639 lt!587694 k0!1164)))

(declare-fun lt!587692 () Unit!43377)

(declare-fun lt!587693 () V!53233)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!162 ((_ BitVec 64) (_ BitVec 64) V!53233 ListLongMap!21081) Unit!43377)

(assert (=> b!1322002 (= lt!587692 (lemmaInListMapAfterAddingDiffThenInBefore!162 k0!1164 (select (arr!42998 _keys!1609) from!2000) lt!587693 lt!587694))))

(declare-fun lt!587699 () ListLongMap!21081)

(assert (=> b!1322002 (contains!8639 lt!587699 k0!1164)))

(declare-fun lt!587697 () Unit!43377)

(assert (=> b!1322002 (= lt!587697 (lemmaInListMapAfterAddingDiffThenInBefore!162 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587699))))

(declare-fun lt!587695 () ListLongMap!21081)

(assert (=> b!1322002 (contains!8639 lt!587695 k0!1164)))

(declare-fun minValue!1279 () V!53233)

(declare-fun lt!587700 () Unit!43377)

(assert (=> b!1322002 (= lt!587700 (lemmaInListMapAfterAddingDiffThenInBefore!162 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587695))))

(assert (=> b!1322002 (= lt!587695 (+!4597 lt!587699 lt!587696))))

(assert (=> b!1322002 (= lt!587696 (tuple2!23425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322002 (= lt!587699 (+!4597 lt!587694 (tuple2!23425 (select (arr!42998 _keys!1609) from!2000) lt!587693)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21648 (ValueCell!17150 V!53233) V!53233)

(declare-fun dynLambda!3527 (Int (_ BitVec 64)) V!53233)

(assert (=> b!1322002 (= lt!587693 (get!21648 (select (arr!42999 _values!1337) from!2000) (dynLambda!3527 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6230 (array!89047 array!89049 (_ BitVec 32) (_ BitVec 32) V!53233 V!53233 (_ BitVec 32) Int) ListLongMap!21081)

(assert (=> b!1322002 (= lt!587694 (getCurrentListMapNoExtraKeys!6230 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322003 () Bool)

(declare-fun res!877475 () Bool)

(assert (=> b!1322003 (=> (not res!877475) (not e!753883))))

(declare-fun getCurrentListMap!5441 (array!89047 array!89049 (_ BitVec 32) (_ BitVec 32) V!53233 V!53233 (_ BitVec 32) Int) ListLongMap!21081)

(assert (=> b!1322003 (= res!877475 (contains!8639 (getCurrentListMap!5441 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55793 () Bool)

(declare-fun tp!106307 () Bool)

(declare-fun e!753885 () Bool)

(assert (=> mapNonEmpty!55793 (= mapRes!55793 (and tp!106307 e!753885))))

(declare-fun mapValue!55793 () ValueCell!17150)

(declare-fun mapRest!55793 () (Array (_ BitVec 32) ValueCell!17150))

(declare-fun mapKey!55793 () (_ BitVec 32))

(assert (=> mapNonEmpty!55793 (= (arr!42999 _values!1337) (store mapRest!55793 mapKey!55793 mapValue!55793))))

(declare-fun b!1322004 () Bool)

(assert (=> b!1322004 (= e!753885 tp_is_empty!36097)))

(declare-fun b!1322005 () Bool)

(declare-fun res!877476 () Bool)

(assert (=> b!1322005 (=> (not res!877476) (not e!753883))))

(assert (=> b!1322005 (= res!877476 (and (= (size!43551 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43550 _keys!1609) (size!43551 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111620 res!877474) b!1322005))

(assert (= (and b!1322005 res!877476) b!1322000))

(assert (= (and b!1322000 res!877477) b!1321998))

(assert (= (and b!1321998 res!877478) b!1321997))

(assert (= (and b!1321997 res!877479) b!1322003))

(assert (= (and b!1322003 res!877475) b!1321996))

(assert (= (and b!1321996 res!877472) b!1321995))

(assert (= (and b!1321995 res!877473) b!1322002))

(assert (= (and b!1322001 condMapEmpty!55793) mapIsEmpty!55793))

(assert (= (and b!1322001 (not condMapEmpty!55793)) mapNonEmpty!55793))

(get-info :version)

(assert (= (and mapNonEmpty!55793 ((_ is ValueCellFull!17150) mapValue!55793)) b!1322004))

(assert (= (and b!1322001 ((_ is ValueCellFull!17150) mapDefault!55793)) b!1321999))

(assert (= start!111620 b!1322001))

(declare-fun b_lambda!23593 () Bool)

(assert (=> (not b_lambda!23593) (not b!1322002)))

(declare-fun t!44374 () Bool)

(declare-fun tb!11621 () Bool)

(assert (=> (and start!111620 (= defaultEntry!1340 defaultEntry!1340) t!44374) tb!11621))

(declare-fun result!24305 () Bool)

(assert (=> tb!11621 (= result!24305 tp_is_empty!36097)))

(assert (=> b!1322002 t!44374))

(declare-fun b_and!48697 () Bool)

(assert (= b_and!48695 (and (=> t!44374 result!24305) b_and!48697)))

(declare-fun m!1209675 () Bool)

(assert (=> start!111620 m!1209675))

(declare-fun m!1209677 () Bool)

(assert (=> start!111620 m!1209677))

(declare-fun m!1209679 () Bool)

(assert (=> start!111620 m!1209679))

(declare-fun m!1209681 () Bool)

(assert (=> b!1321998 m!1209681))

(declare-fun m!1209683 () Bool)

(assert (=> b!1321996 m!1209683))

(declare-fun m!1209685 () Bool)

(assert (=> b!1322002 m!1209685))

(declare-fun m!1209687 () Bool)

(assert (=> b!1322002 m!1209687))

(declare-fun m!1209689 () Bool)

(assert (=> b!1322002 m!1209689))

(declare-fun m!1209691 () Bool)

(assert (=> b!1322002 m!1209691))

(declare-fun m!1209693 () Bool)

(assert (=> b!1322002 m!1209693))

(declare-fun m!1209695 () Bool)

(assert (=> b!1322002 m!1209695))

(assert (=> b!1322002 m!1209689))

(declare-fun m!1209697 () Bool)

(assert (=> b!1322002 m!1209697))

(declare-fun m!1209699 () Bool)

(assert (=> b!1322002 m!1209699))

(assert (=> b!1322002 m!1209683))

(declare-fun m!1209701 () Bool)

(assert (=> b!1322002 m!1209701))

(assert (=> b!1322002 m!1209683))

(declare-fun m!1209703 () Bool)

(assert (=> b!1322002 m!1209703))

(declare-fun m!1209705 () Bool)

(assert (=> b!1322002 m!1209705))

(declare-fun m!1209707 () Bool)

(assert (=> b!1322002 m!1209707))

(declare-fun m!1209709 () Bool)

(assert (=> b!1322002 m!1209709))

(assert (=> b!1322002 m!1209695))

(declare-fun m!1209711 () Bool)

(assert (=> b!1322002 m!1209711))

(declare-fun m!1209713 () Bool)

(assert (=> b!1322002 m!1209713))

(assert (=> b!1322002 m!1209691))

(assert (=> b!1321995 m!1209683))

(assert (=> b!1321995 m!1209683))

(declare-fun m!1209715 () Bool)

(assert (=> b!1321995 m!1209715))

(declare-fun m!1209717 () Bool)

(assert (=> b!1322000 m!1209717))

(declare-fun m!1209719 () Bool)

(assert (=> b!1322003 m!1209719))

(assert (=> b!1322003 m!1209719))

(declare-fun m!1209721 () Bool)

(assert (=> b!1322003 m!1209721))

(declare-fun m!1209723 () Bool)

(assert (=> mapNonEmpty!55793 m!1209723))

(check-sat (not b!1322002) (not mapNonEmpty!55793) (not b!1321995) (not b!1322003) (not b_next!30277) (not start!111620) (not b!1322000) tp_is_empty!36097 b_and!48697 (not b!1321998) (not b_lambda!23593))
(check-sat b_and!48697 (not b_next!30277))
