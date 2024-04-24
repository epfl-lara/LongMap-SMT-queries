; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112094 () Bool)

(assert start!112094)

(declare-fun b_free!30469 () Bool)

(declare-fun b_next!30469 () Bool)

(assert (=> start!112094 (= b_free!30469 (not b_next!30469))))

(declare-fun tp!106887 () Bool)

(declare-fun b_and!49035 () Bool)

(assert (=> start!112094 (= tp!106887 b_and!49035)))

(declare-fun b!1326787 () Bool)

(declare-fun res!880229 () Bool)

(declare-fun e!756460 () Bool)

(assert (=> b!1326787 (=> (not res!880229) (not e!756460))))

(declare-datatypes ((array!89579 0))(
  ( (array!89580 (arr!43258 (Array (_ BitVec 32) (_ BitVec 64))) (size!43809 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89579)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53489 0))(
  ( (V!53490 (val!18219 Int)) )
))
(declare-datatypes ((ValueCell!17246 0))(
  ( (ValueCellFull!17246 (v!20847 V!53489)) (EmptyCell!17246) )
))
(declare-datatypes ((array!89581 0))(
  ( (array!89582 (arr!43259 (Array (_ BitVec 32) ValueCell!17246)) (size!43810 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89581)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326787 (= res!880229 (and (= (size!43810 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43809 _keys!1609) (size!43810 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326788 () Bool)

(declare-fun res!880227 () Bool)

(assert (=> b!1326788 (=> (not res!880227) (not e!756460))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326788 (= res!880227 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43809 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326789 () Bool)

(declare-fun e!756457 () Bool)

(declare-fun tp_is_empty!36289 () Bool)

(assert (=> b!1326789 (= e!756457 tp_is_empty!36289)))

(declare-fun b!1326790 () Bool)

(declare-fun res!880225 () Bool)

(assert (=> b!1326790 (=> (not res!880225) (not e!756460))))

(declare-datatypes ((List!30684 0))(
  ( (Nil!30681) (Cons!30680 (h!31898 (_ BitVec 64)) (t!44616 List!30684)) )
))
(declare-fun arrayNoDuplicates!0 (array!89579 (_ BitVec 32) List!30684) Bool)

(assert (=> b!1326790 (= res!880225 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30681))))

(declare-fun b!1326791 () Bool)

(declare-fun e!756458 () Bool)

(declare-fun mapRes!56085 () Bool)

(assert (=> b!1326791 (= e!756458 (and e!756457 mapRes!56085))))

(declare-fun condMapEmpty!56085 () Bool)

(declare-fun mapDefault!56085 () ValueCell!17246)

(assert (=> b!1326791 (= condMapEmpty!56085 (= (arr!43259 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17246)) mapDefault!56085)))))

(declare-fun b!1326792 () Bool)

(assert (=> b!1326792 (= e!756460 (not true))))

(declare-datatypes ((tuple2!23534 0))(
  ( (tuple2!23535 (_1!11778 (_ BitVec 64)) (_2!11778 V!53489)) )
))
(declare-datatypes ((List!30685 0))(
  ( (Nil!30682) (Cons!30681 (h!31899 tuple2!23534) (t!44617 List!30685)) )
))
(declare-datatypes ((ListLongMap!21199 0))(
  ( (ListLongMap!21200 (toList!10615 List!30685)) )
))
(declare-fun lt!590267 () ListLongMap!21199)

(declare-fun contains!8783 (ListLongMap!21199 (_ BitVec 64)) Bool)

(assert (=> b!1326792 (contains!8783 lt!590267 k0!1164)))

(declare-datatypes ((Unit!43613 0))(
  ( (Unit!43614) )
))
(declare-fun lt!590266 () Unit!43613)

(declare-fun minValue!1279 () V!53489)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!210 ((_ BitVec 64) (_ BitVec 64) V!53489 ListLongMap!21199) Unit!43613)

(assert (=> b!1326792 (= lt!590266 (lemmaInListMapAfterAddingDiffThenInBefore!210 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590267))))

(declare-fun zeroValue!1279 () V!53489)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4660 (ListLongMap!21199 tuple2!23534) ListLongMap!21199)

(declare-fun getCurrentListMapNoExtraKeys!6304 (array!89579 array!89581 (_ BitVec 32) (_ BitVec 32) V!53489 V!53489 (_ BitVec 32) Int) ListLongMap!21199)

(declare-fun get!21814 (ValueCell!17246 V!53489) V!53489)

(declare-fun dynLambda!3614 (Int (_ BitVec 64)) V!53489)

(assert (=> b!1326792 (= lt!590267 (+!4660 (+!4660 (getCurrentListMapNoExtraKeys!6304 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23535 (select (arr!43258 _keys!1609) from!2000) (get!21814 (select (arr!43259 _values!1337) from!2000) (dynLambda!3614 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!56085 () Bool)

(declare-fun tp!106886 () Bool)

(declare-fun e!756456 () Bool)

(assert (=> mapNonEmpty!56085 (= mapRes!56085 (and tp!106886 e!756456))))

(declare-fun mapValue!56085 () ValueCell!17246)

(declare-fun mapKey!56085 () (_ BitVec 32))

(declare-fun mapRest!56085 () (Array (_ BitVec 32) ValueCell!17246))

(assert (=> mapNonEmpty!56085 (= (arr!43259 _values!1337) (store mapRest!56085 mapKey!56085 mapValue!56085))))

(declare-fun res!880223 () Bool)

(assert (=> start!112094 (=> (not res!880223) (not e!756460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112094 (= res!880223 (validMask!0 mask!2019))))

(assert (=> start!112094 e!756460))

(declare-fun array_inv!32919 (array!89579) Bool)

(assert (=> start!112094 (array_inv!32919 _keys!1609)))

(assert (=> start!112094 true))

(assert (=> start!112094 tp_is_empty!36289))

(declare-fun array_inv!32920 (array!89581) Bool)

(assert (=> start!112094 (and (array_inv!32920 _values!1337) e!756458)))

(assert (=> start!112094 tp!106887))

(declare-fun mapIsEmpty!56085 () Bool)

(assert (=> mapIsEmpty!56085 mapRes!56085))

(declare-fun b!1326793 () Bool)

(declare-fun res!880228 () Bool)

(assert (=> b!1326793 (=> (not res!880228) (not e!756460))))

(declare-fun getCurrentListMap!5595 (array!89579 array!89581 (_ BitVec 32) (_ BitVec 32) V!53489 V!53489 (_ BitVec 32) Int) ListLongMap!21199)

(assert (=> b!1326793 (= res!880228 (contains!8783 (getCurrentListMap!5595 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326794 () Bool)

(declare-fun res!880230 () Bool)

(assert (=> b!1326794 (=> (not res!880230) (not e!756460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326794 (= res!880230 (validKeyInArray!0 (select (arr!43258 _keys!1609) from!2000)))))

(declare-fun b!1326795 () Bool)

(declare-fun res!880226 () Bool)

(assert (=> b!1326795 (=> (not res!880226) (not e!756460))))

(assert (=> b!1326795 (= res!880226 (not (= (select (arr!43258 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326796 () Bool)

(assert (=> b!1326796 (= e!756456 tp_is_empty!36289)))

(declare-fun b!1326797 () Bool)

(declare-fun res!880224 () Bool)

(assert (=> b!1326797 (=> (not res!880224) (not e!756460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89579 (_ BitVec 32)) Bool)

(assert (=> b!1326797 (= res!880224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!112094 res!880223) b!1326787))

(assert (= (and b!1326787 res!880229) b!1326797))

(assert (= (and b!1326797 res!880224) b!1326790))

(assert (= (and b!1326790 res!880225) b!1326788))

(assert (= (and b!1326788 res!880227) b!1326793))

(assert (= (and b!1326793 res!880228) b!1326795))

(assert (= (and b!1326795 res!880226) b!1326794))

(assert (= (and b!1326794 res!880230) b!1326792))

(assert (= (and b!1326791 condMapEmpty!56085) mapIsEmpty!56085))

(assert (= (and b!1326791 (not condMapEmpty!56085)) mapNonEmpty!56085))

(get-info :version)

(assert (= (and mapNonEmpty!56085 ((_ is ValueCellFull!17246) mapValue!56085)) b!1326796))

(assert (= (and b!1326791 ((_ is ValueCellFull!17246) mapDefault!56085)) b!1326789))

(assert (= start!112094 b!1326791))

(declare-fun b_lambda!23741 () Bool)

(assert (=> (not b_lambda!23741) (not b!1326792)))

(declare-fun t!44615 () Bool)

(declare-fun tb!11735 () Bool)

(assert (=> (and start!112094 (= defaultEntry!1340 defaultEntry!1340) t!44615) tb!11735))

(declare-fun result!24535 () Bool)

(assert (=> tb!11735 (= result!24535 tp_is_empty!36289)))

(assert (=> b!1326792 t!44615))

(declare-fun b_and!49037 () Bool)

(assert (= b_and!49035 (and (=> t!44615 result!24535) b_and!49037)))

(declare-fun m!1215975 () Bool)

(assert (=> b!1326797 m!1215975))

(declare-fun m!1215977 () Bool)

(assert (=> b!1326792 m!1215977))

(declare-fun m!1215979 () Bool)

(assert (=> b!1326792 m!1215979))

(assert (=> b!1326792 m!1215977))

(declare-fun m!1215981 () Bool)

(assert (=> b!1326792 m!1215981))

(declare-fun m!1215983 () Bool)

(assert (=> b!1326792 m!1215983))

(assert (=> b!1326792 m!1215981))

(declare-fun m!1215985 () Bool)

(assert (=> b!1326792 m!1215985))

(declare-fun m!1215987 () Bool)

(assert (=> b!1326792 m!1215987))

(assert (=> b!1326792 m!1215983))

(assert (=> b!1326792 m!1215979))

(declare-fun m!1215989 () Bool)

(assert (=> b!1326792 m!1215989))

(declare-fun m!1215991 () Bool)

(assert (=> b!1326792 m!1215991))

(declare-fun m!1215993 () Bool)

(assert (=> b!1326792 m!1215993))

(assert (=> b!1326795 m!1215993))

(assert (=> b!1326794 m!1215993))

(assert (=> b!1326794 m!1215993))

(declare-fun m!1215995 () Bool)

(assert (=> b!1326794 m!1215995))

(declare-fun m!1215997 () Bool)

(assert (=> b!1326790 m!1215997))

(declare-fun m!1215999 () Bool)

(assert (=> mapNonEmpty!56085 m!1215999))

(declare-fun m!1216001 () Bool)

(assert (=> start!112094 m!1216001))

(declare-fun m!1216003 () Bool)

(assert (=> start!112094 m!1216003))

(declare-fun m!1216005 () Bool)

(assert (=> start!112094 m!1216005))

(declare-fun m!1216007 () Bool)

(assert (=> b!1326793 m!1216007))

(assert (=> b!1326793 m!1216007))

(declare-fun m!1216009 () Bool)

(assert (=> b!1326793 m!1216009))

(check-sat (not b_lambda!23741) (not b!1326794) b_and!49037 tp_is_empty!36289 (not b_next!30469) (not b!1326792) (not b!1326793) (not b!1326790) (not start!112094) (not mapNonEmpty!56085) (not b!1326797))
(check-sat b_and!49037 (not b_next!30469))
