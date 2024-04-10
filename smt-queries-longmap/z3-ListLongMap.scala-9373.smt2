; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111676 () Bool)

(assert start!111676)

(declare-fun b_free!30333 () Bool)

(declare-fun b_next!30333 () Bool)

(assert (=> start!111676 (= b_free!30333 (not b_next!30333))))

(declare-fun tp!106474 () Bool)

(declare-fun b_and!48825 () Bool)

(assert (=> start!111676 (= tp!106474 b_and!48825)))

(declare-fun res!878177 () Bool)

(declare-fun e!754336 () Bool)

(assert (=> start!111676 (=> (not res!878177) (not e!754336))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111676 (= res!878177 (validMask!0 mask!2019))))

(assert (=> start!111676 e!754336))

(declare-datatypes ((array!89226 0))(
  ( (array!89227 (arr!43087 (Array (_ BitVec 32) (_ BitVec 64))) (size!43637 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89226)

(declare-fun array_inv!32531 (array!89226) Bool)

(assert (=> start!111676 (array_inv!32531 _keys!1609)))

(assert (=> start!111676 true))

(declare-fun tp_is_empty!36153 () Bool)

(assert (=> start!111676 tp_is_empty!36153))

(declare-datatypes ((V!53307 0))(
  ( (V!53308 (val!18151 Int)) )
))
(declare-datatypes ((ValueCell!17178 0))(
  ( (ValueCellFull!17178 (v!20781 V!53307)) (EmptyCell!17178) )
))
(declare-datatypes ((array!89228 0))(
  ( (array!89229 (arr!43088 (Array (_ BitVec 32) ValueCell!17178)) (size!43638 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89228)

(declare-fun e!754335 () Bool)

(declare-fun array_inv!32532 (array!89228) Bool)

(assert (=> start!111676 (and (array_inv!32532 _values!1337) e!754335)))

(assert (=> start!111676 tp!106474))

(declare-fun b!1323045 () Bool)

(declare-fun res!878178 () Bool)

(assert (=> b!1323045 (=> (not res!878178) (not e!754336))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323045 (= res!878178 (not (= (select (arr!43087 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323046 () Bool)

(declare-fun e!754337 () Bool)

(assert (=> b!1323046 (= e!754337 tp_is_empty!36153)))

(declare-fun b!1323047 () Bool)

(declare-fun res!878179 () Bool)

(assert (=> b!1323047 (=> (not res!878179) (not e!754336))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323047 (= res!878179 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43637 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55877 () Bool)

(declare-fun mapRes!55877 () Bool)

(declare-fun tp!106475 () Bool)

(declare-fun e!754339 () Bool)

(assert (=> mapNonEmpty!55877 (= mapRes!55877 (and tp!106475 e!754339))))

(declare-fun mapValue!55877 () ValueCell!17178)

(declare-fun mapRest!55877 () (Array (_ BitVec 32) ValueCell!17178))

(declare-fun mapKey!55877 () (_ BitVec 32))

(assert (=> mapNonEmpty!55877 (= (arr!43088 _values!1337) (store mapRest!55877 mapKey!55877 mapValue!55877))))

(declare-fun b!1323048 () Bool)

(declare-fun res!878175 () Bool)

(assert (=> b!1323048 (=> (not res!878175) (not e!754336))))

(declare-datatypes ((List!30536 0))(
  ( (Nil!30533) (Cons!30532 (h!31741 (_ BitVec 64)) (t!44418 List!30536)) )
))
(declare-fun arrayNoDuplicates!0 (array!89226 (_ BitVec 32) List!30536) Bool)

(assert (=> b!1323048 (= res!878175 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30533))))

(declare-fun b!1323049 () Bool)

(assert (=> b!1323049 (= e!754335 (and e!754337 mapRes!55877))))

(declare-fun condMapEmpty!55877 () Bool)

(declare-fun mapDefault!55877 () ValueCell!17178)

(assert (=> b!1323049 (= condMapEmpty!55877 (= (arr!43088 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17178)) mapDefault!55877)))))

(declare-fun b!1323050 () Bool)

(declare-fun res!878176 () Bool)

(assert (=> b!1323050 (=> (not res!878176) (not e!754336))))

(declare-fun zeroValue!1279 () V!53307)

(declare-fun minValue!1279 () V!53307)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23394 0))(
  ( (tuple2!23395 (_1!11708 (_ BitVec 64)) (_2!11708 V!53307)) )
))
(declare-datatypes ((List!30537 0))(
  ( (Nil!30534) (Cons!30533 (h!31742 tuple2!23394) (t!44419 List!30537)) )
))
(declare-datatypes ((ListLongMap!21051 0))(
  ( (ListLongMap!21052 (toList!10541 List!30537)) )
))
(declare-fun contains!8696 (ListLongMap!21051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5538 (array!89226 array!89228 (_ BitVec 32) (_ BitVec 32) V!53307 V!53307 (_ BitVec 32) Int) ListLongMap!21051)

(assert (=> b!1323050 (= res!878176 (contains!8696 (getCurrentListMap!5538 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55877 () Bool)

(assert (=> mapIsEmpty!55877 mapRes!55877))

(declare-fun b!1323051 () Bool)

(assert (=> b!1323051 (= e!754339 tp_is_empty!36153)))

(declare-fun b!1323052 () Bool)

(declare-fun res!878173 () Bool)

(assert (=> b!1323052 (=> (not res!878173) (not e!754336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89226 (_ BitVec 32)) Bool)

(assert (=> b!1323052 (= res!878173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323053 () Bool)

(declare-fun res!878174 () Bool)

(assert (=> b!1323053 (=> (not res!878174) (not e!754336))))

(assert (=> b!1323053 (= res!878174 (and (= (size!43638 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43637 _keys!1609) (size!43638 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323054 () Bool)

(declare-fun res!878180 () Bool)

(assert (=> b!1323054 (=> (not res!878180) (not e!754336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323054 (= res!878180 (validKeyInArray!0 (select (arr!43087 _keys!1609) from!2000)))))

(declare-fun b!1323055 () Bool)

(assert (=> b!1323055 (= e!754336 (not true))))

(declare-fun lt!588662 () ListLongMap!21051)

(declare-fun +!4593 (ListLongMap!21051 tuple2!23394) ListLongMap!21051)

(assert (=> b!1323055 (contains!8696 (+!4593 lt!588662 (tuple2!23395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43606 0))(
  ( (Unit!43607) )
))
(declare-fun lt!588671 () Unit!43606)

(declare-fun addStillContains!1142 (ListLongMap!21051 (_ BitVec 64) V!53307 (_ BitVec 64)) Unit!43606)

(assert (=> b!1323055 (= lt!588671 (addStillContains!1142 lt!588662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323055 (contains!8696 lt!588662 k0!1164)))

(declare-fun lt!588669 () ListLongMap!21051)

(declare-fun lt!588670 () tuple2!23394)

(assert (=> b!1323055 (= lt!588662 (+!4593 lt!588669 lt!588670))))

(declare-fun lt!588665 () Unit!43606)

(assert (=> b!1323055 (= lt!588665 (addStillContains!1142 lt!588669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323055 (contains!8696 lt!588669 k0!1164)))

(declare-fun lt!588666 () Unit!43606)

(declare-fun lt!588668 () V!53307)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!189 ((_ BitVec 64) (_ BitVec 64) V!53307 ListLongMap!21051) Unit!43606)

(assert (=> b!1323055 (= lt!588666 (lemmaInListMapAfterAddingDiffThenInBefore!189 k0!1164 (select (arr!43087 _keys!1609) from!2000) lt!588668 lt!588669))))

(declare-fun lt!588667 () ListLongMap!21051)

(assert (=> b!1323055 (contains!8696 lt!588667 k0!1164)))

(declare-fun lt!588663 () Unit!43606)

(assert (=> b!1323055 (= lt!588663 (lemmaInListMapAfterAddingDiffThenInBefore!189 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588667))))

(declare-fun lt!588672 () ListLongMap!21051)

(assert (=> b!1323055 (contains!8696 lt!588672 k0!1164)))

(declare-fun lt!588664 () Unit!43606)

(assert (=> b!1323055 (= lt!588664 (lemmaInListMapAfterAddingDiffThenInBefore!189 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588672))))

(assert (=> b!1323055 (= lt!588672 (+!4593 lt!588667 lt!588670))))

(assert (=> b!1323055 (= lt!588670 (tuple2!23395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323055 (= lt!588667 (+!4593 lt!588669 (tuple2!23395 (select (arr!43087 _keys!1609) from!2000) lt!588668)))))

(declare-fun get!21695 (ValueCell!17178 V!53307) V!53307)

(declare-fun dynLambda!3532 (Int (_ BitVec 64)) V!53307)

(assert (=> b!1323055 (= lt!588668 (get!21695 (select (arr!43088 _values!1337) from!2000) (dynLambda!3532 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6228 (array!89226 array!89228 (_ BitVec 32) (_ BitVec 32) V!53307 V!53307 (_ BitVec 32) Int) ListLongMap!21051)

(assert (=> b!1323055 (= lt!588669 (getCurrentListMapNoExtraKeys!6228 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(assert (= (and start!111676 res!878177) b!1323053))

(assert (= (and b!1323053 res!878174) b!1323052))

(assert (= (and b!1323052 res!878173) b!1323048))

(assert (= (and b!1323048 res!878175) b!1323047))

(assert (= (and b!1323047 res!878179) b!1323050))

(assert (= (and b!1323050 res!878176) b!1323045))

(assert (= (and b!1323045 res!878178) b!1323054))

(assert (= (and b!1323054 res!878180) b!1323055))

(assert (= (and b!1323049 condMapEmpty!55877) mapIsEmpty!55877))

(assert (= (and b!1323049 (not condMapEmpty!55877)) mapNonEmpty!55877))

(get-info :version)

(assert (= (and mapNonEmpty!55877 ((_ is ValueCellFull!17178) mapValue!55877)) b!1323051))

(assert (= (and b!1323049 ((_ is ValueCellFull!17178) mapDefault!55877)) b!1323046))

(assert (= start!111676 b!1323049))

(declare-fun b_lambda!23659 () Bool)

(assert (=> (not b_lambda!23659) (not b!1323055)))

(declare-fun t!44417 () Bool)

(declare-fun tb!11685 () Bool)

(assert (=> (and start!111676 (= defaultEntry!1340 defaultEntry!1340) t!44417) tb!11685))

(declare-fun result!24425 () Bool)

(assert (=> tb!11685 (= result!24425 tp_is_empty!36153)))

(assert (=> b!1323055 t!44417))

(declare-fun b_and!48827 () Bool)

(assert (= b_and!48825 (and (=> t!44417 result!24425) b_and!48827)))

(declare-fun m!1211615 () Bool)

(assert (=> b!1323048 m!1211615))

(declare-fun m!1211617 () Bool)

(assert (=> b!1323045 m!1211617))

(assert (=> b!1323054 m!1211617))

(assert (=> b!1323054 m!1211617))

(declare-fun m!1211619 () Bool)

(assert (=> b!1323054 m!1211619))

(assert (=> b!1323055 m!1211617))

(declare-fun m!1211621 () Bool)

(assert (=> b!1323055 m!1211621))

(declare-fun m!1211623 () Bool)

(assert (=> b!1323055 m!1211623))

(declare-fun m!1211625 () Bool)

(assert (=> b!1323055 m!1211625))

(declare-fun m!1211627 () Bool)

(assert (=> b!1323055 m!1211627))

(declare-fun m!1211629 () Bool)

(assert (=> b!1323055 m!1211629))

(declare-fun m!1211631 () Bool)

(assert (=> b!1323055 m!1211631))

(declare-fun m!1211633 () Bool)

(assert (=> b!1323055 m!1211633))

(declare-fun m!1211635 () Bool)

(assert (=> b!1323055 m!1211635))

(declare-fun m!1211637 () Bool)

(assert (=> b!1323055 m!1211637))

(declare-fun m!1211639 () Bool)

(assert (=> b!1323055 m!1211639))

(assert (=> b!1323055 m!1211617))

(declare-fun m!1211641 () Bool)

(assert (=> b!1323055 m!1211641))

(declare-fun m!1211643 () Bool)

(assert (=> b!1323055 m!1211643))

(declare-fun m!1211645 () Bool)

(assert (=> b!1323055 m!1211645))

(declare-fun m!1211647 () Bool)

(assert (=> b!1323055 m!1211647))

(declare-fun m!1211649 () Bool)

(assert (=> b!1323055 m!1211649))

(declare-fun m!1211651 () Bool)

(assert (=> b!1323055 m!1211651))

(assert (=> b!1323055 m!1211635))

(assert (=> b!1323055 m!1211633))

(assert (=> b!1323055 m!1211651))

(declare-fun m!1211653 () Bool)

(assert (=> b!1323055 m!1211653))

(declare-fun m!1211655 () Bool)

(assert (=> b!1323055 m!1211655))

(declare-fun m!1211657 () Bool)

(assert (=> b!1323052 m!1211657))

(declare-fun m!1211659 () Bool)

(assert (=> start!111676 m!1211659))

(declare-fun m!1211661 () Bool)

(assert (=> start!111676 m!1211661))

(declare-fun m!1211663 () Bool)

(assert (=> start!111676 m!1211663))

(declare-fun m!1211665 () Bool)

(assert (=> b!1323050 m!1211665))

(assert (=> b!1323050 m!1211665))

(declare-fun m!1211667 () Bool)

(assert (=> b!1323050 m!1211667))

(declare-fun m!1211669 () Bool)

(assert (=> mapNonEmpty!55877 m!1211669))

(check-sat tp_is_empty!36153 (not b!1323055) (not b!1323048) (not start!111676) (not b!1323054) (not b!1323050) (not b!1323052) b_and!48827 (not b_next!30333) (not mapNonEmpty!55877) (not b_lambda!23659))
(check-sat b_and!48827 (not b_next!30333))
