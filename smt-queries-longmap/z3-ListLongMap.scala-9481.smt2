; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112718 () Bool)

(assert start!112718)

(declare-fun b_free!30889 () Bool)

(declare-fun b_next!30889 () Bool)

(assert (=> start!112718 (= b_free!30889 (not b_next!30889))))

(declare-fun tp!108303 () Bool)

(declare-fun b_and!49781 () Bool)

(assert (=> start!112718 (= tp!108303 b_and!49781)))

(declare-fun b!1335513 () Bool)

(declare-fun res!885991 () Bool)

(declare-fun e!760771 () Bool)

(assert (=> b!1335513 (=> (not res!885991) (not e!760771))))

(declare-datatypes ((array!90571 0))(
  ( (array!90572 (arr!43747 (Array (_ BitVec 32) (_ BitVec 64))) (size!44298 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90571)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90571 (_ BitVec 32)) Bool)

(assert (=> b!1335513 (= res!885991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335514 () Bool)

(declare-fun res!885993 () Bool)

(declare-fun e!760770 () Bool)

(assert (=> b!1335514 (=> (not res!885993) (not e!760770))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335514 (= res!885993 (not (= k0!1153 (select (arr!43747 _keys!1590) from!1980))))))

(declare-fun b!1335515 () Bool)

(declare-fun res!885992 () Bool)

(assert (=> b!1335515 (=> (not res!885992) (not e!760771))))

(declare-datatypes ((V!54169 0))(
  ( (V!54170 (val!18474 Int)) )
))
(declare-datatypes ((ValueCell!17501 0))(
  ( (ValueCellFull!17501 (v!21106 V!54169)) (EmptyCell!17501) )
))
(declare-datatypes ((array!90573 0))(
  ( (array!90574 (arr!43748 (Array (_ BitVec 32) ValueCell!17501)) (size!44299 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90573)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54169)

(declare-fun minValue!1262 () V!54169)

(declare-datatypes ((tuple2!23844 0))(
  ( (tuple2!23845 (_1!11933 (_ BitVec 64)) (_2!11933 V!54169)) )
))
(declare-datatypes ((List!30995 0))(
  ( (Nil!30992) (Cons!30991 (h!32209 tuple2!23844) (t!45235 List!30995)) )
))
(declare-datatypes ((ListLongMap!21509 0))(
  ( (ListLongMap!21510 (toList!10770 List!30995)) )
))
(declare-fun contains!8946 (ListLongMap!21509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5730 (array!90571 array!90573 (_ BitVec 32) (_ BitVec 32) V!54169 V!54169 (_ BitVec 32) Int) ListLongMap!21509)

(assert (=> b!1335515 (= res!885992 (contains!8946 (getCurrentListMap!5730 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335516 () Bool)

(declare-fun res!885996 () Bool)

(assert (=> b!1335516 (=> (not res!885996) (not e!760771))))

(assert (=> b!1335516 (= res!885996 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44298 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335517 () Bool)

(declare-fun e!760767 () Bool)

(declare-fun tp_is_empty!36799 () Bool)

(assert (=> b!1335517 (= e!760767 tp_is_empty!36799)))

(declare-fun res!885995 () Bool)

(assert (=> start!112718 (=> (not res!885995) (not e!760771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112718 (= res!885995 (validMask!0 mask!1998))))

(assert (=> start!112718 e!760771))

(declare-fun e!760769 () Bool)

(declare-fun array_inv!33265 (array!90573) Bool)

(assert (=> start!112718 (and (array_inv!33265 _values!1320) e!760769)))

(assert (=> start!112718 true))

(declare-fun array_inv!33266 (array!90571) Bool)

(assert (=> start!112718 (array_inv!33266 _keys!1590)))

(assert (=> start!112718 tp!108303))

(assert (=> start!112718 tp_is_empty!36799))

(declare-fun mapNonEmpty!56872 () Bool)

(declare-fun mapRes!56872 () Bool)

(declare-fun tp!108304 () Bool)

(assert (=> mapNonEmpty!56872 (= mapRes!56872 (and tp!108304 e!760767))))

(declare-fun mapKey!56872 () (_ BitVec 32))

(declare-fun mapValue!56872 () ValueCell!17501)

(declare-fun mapRest!56872 () (Array (_ BitVec 32) ValueCell!17501))

(assert (=> mapNonEmpty!56872 (= (arr!43748 _values!1320) (store mapRest!56872 mapKey!56872 mapValue!56872))))

(declare-fun b!1335518 () Bool)

(declare-fun res!885998 () Bool)

(assert (=> b!1335518 (=> (not res!885998) (not e!760771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335518 (= res!885998 (validKeyInArray!0 (select (arr!43747 _keys!1590) from!1980)))))

(declare-fun b!1335519 () Bool)

(declare-fun res!886000 () Bool)

(assert (=> b!1335519 (=> (not res!886000) (not e!760771))))

(assert (=> b!1335519 (= res!886000 (and (= (size!44299 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44298 _keys!1590) (size!44299 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56872 () Bool)

(assert (=> mapIsEmpty!56872 mapRes!56872))

(declare-fun b!1335520 () Bool)

(declare-fun e!760766 () Bool)

(assert (=> b!1335520 (= e!760769 (and e!760766 mapRes!56872))))

(declare-fun condMapEmpty!56872 () Bool)

(declare-fun mapDefault!56872 () ValueCell!17501)

(assert (=> b!1335520 (= condMapEmpty!56872 (= (arr!43748 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17501)) mapDefault!56872)))))

(declare-fun b!1335521 () Bool)

(declare-fun res!886001 () Bool)

(assert (=> b!1335521 (=> (not res!886001) (not e!760771))))

(assert (=> b!1335521 (= res!886001 (not (= (select (arr!43747 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335522 () Bool)

(declare-fun res!885999 () Bool)

(assert (=> b!1335522 (=> (not res!885999) (not e!760771))))

(assert (=> b!1335522 (= res!885999 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1335523 () Bool)

(assert (=> b!1335523 (= e!760766 tp_is_empty!36799)))

(declare-fun b!1335524 () Bool)

(assert (=> b!1335524 (= e!760771 e!760770)))

(declare-fun res!885994 () Bool)

(assert (=> b!1335524 (=> (not res!885994) (not e!760770))))

(declare-fun lt!592766 () V!54169)

(declare-fun lt!592767 () ListLongMap!21509)

(declare-fun +!4757 (ListLongMap!21509 tuple2!23844) ListLongMap!21509)

(assert (=> b!1335524 (= res!885994 (contains!8946 (+!4757 lt!592767 (tuple2!23845 (select (arr!43747 _keys!1590) from!1980) lt!592766)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6401 (array!90571 array!90573 (_ BitVec 32) (_ BitVec 32) V!54169 V!54169 (_ BitVec 32) Int) ListLongMap!21509)

(assert (=> b!1335524 (= lt!592767 (getCurrentListMapNoExtraKeys!6401 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22086 (ValueCell!17501 V!54169) V!54169)

(declare-fun dynLambda!3711 (Int (_ BitVec 64)) V!54169)

(assert (=> b!1335524 (= lt!592766 (get!22086 (select (arr!43748 _values!1320) from!1980) (dynLambda!3711 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335525 () Bool)

(assert (=> b!1335525 (= e!760770 (not true))))

(assert (=> b!1335525 (contains!8946 lt!592767 k0!1153)))

(declare-datatypes ((Unit!43820 0))(
  ( (Unit!43821) )
))
(declare-fun lt!592765 () Unit!43820)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!298 ((_ BitVec 64) (_ BitVec 64) V!54169 ListLongMap!21509) Unit!43820)

(assert (=> b!1335525 (= lt!592765 (lemmaInListMapAfterAddingDiffThenInBefore!298 k0!1153 (select (arr!43747 _keys!1590) from!1980) lt!592766 lt!592767))))

(declare-fun b!1335526 () Bool)

(declare-fun res!885997 () Bool)

(assert (=> b!1335526 (=> (not res!885997) (not e!760771))))

(declare-datatypes ((List!30996 0))(
  ( (Nil!30993) (Cons!30992 (h!32210 (_ BitVec 64)) (t!45236 List!30996)) )
))
(declare-fun arrayNoDuplicates!0 (array!90571 (_ BitVec 32) List!30996) Bool)

(assert (=> b!1335526 (= res!885997 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30993))))

(assert (= (and start!112718 res!885995) b!1335519))

(assert (= (and b!1335519 res!886000) b!1335513))

(assert (= (and b!1335513 res!885991) b!1335526))

(assert (= (and b!1335526 res!885997) b!1335516))

(assert (= (and b!1335516 res!885996) b!1335515))

(assert (= (and b!1335515 res!885992) b!1335521))

(assert (= (and b!1335521 res!886001) b!1335518))

(assert (= (and b!1335518 res!885998) b!1335522))

(assert (= (and b!1335522 res!885999) b!1335524))

(assert (= (and b!1335524 res!885994) b!1335514))

(assert (= (and b!1335514 res!885993) b!1335525))

(assert (= (and b!1335520 condMapEmpty!56872) mapIsEmpty!56872))

(assert (= (and b!1335520 (not condMapEmpty!56872)) mapNonEmpty!56872))

(get-info :version)

(assert (= (and mapNonEmpty!56872 ((_ is ValueCellFull!17501) mapValue!56872)) b!1335517))

(assert (= (and b!1335520 ((_ is ValueCellFull!17501) mapDefault!56872)) b!1335523))

(assert (= start!112718 b!1335520))

(declare-fun b_lambda!24089 () Bool)

(assert (=> (not b_lambda!24089) (not b!1335524)))

(declare-fun t!45234 () Bool)

(declare-fun tb!12043 () Bool)

(assert (=> (and start!112718 (= defaultEntry!1323 defaultEntry!1323) t!45234) tb!12043))

(declare-fun result!25165 () Bool)

(assert (=> tb!12043 (= result!25165 tp_is_empty!36799)))

(assert (=> b!1335524 t!45234))

(declare-fun b_and!49783 () Bool)

(assert (= b_and!49781 (and (=> t!45234 result!25165) b_and!49783)))

(declare-fun m!1224221 () Bool)

(assert (=> b!1335514 m!1224221))

(declare-fun m!1224223 () Bool)

(assert (=> b!1335524 m!1224223))

(declare-fun m!1224225 () Bool)

(assert (=> b!1335524 m!1224225))

(assert (=> b!1335524 m!1224223))

(declare-fun m!1224227 () Bool)

(assert (=> b!1335524 m!1224227))

(declare-fun m!1224229 () Bool)

(assert (=> b!1335524 m!1224229))

(declare-fun m!1224231 () Bool)

(assert (=> b!1335524 m!1224231))

(assert (=> b!1335524 m!1224229))

(declare-fun m!1224233 () Bool)

(assert (=> b!1335524 m!1224233))

(assert (=> b!1335524 m!1224225))

(assert (=> b!1335524 m!1224221))

(declare-fun m!1224235 () Bool)

(assert (=> start!112718 m!1224235))

(declare-fun m!1224237 () Bool)

(assert (=> start!112718 m!1224237))

(declare-fun m!1224239 () Bool)

(assert (=> start!112718 m!1224239))

(declare-fun m!1224241 () Bool)

(assert (=> mapNonEmpty!56872 m!1224241))

(declare-fun m!1224243 () Bool)

(assert (=> b!1335513 m!1224243))

(declare-fun m!1224245 () Bool)

(assert (=> b!1335525 m!1224245))

(assert (=> b!1335525 m!1224221))

(assert (=> b!1335525 m!1224221))

(declare-fun m!1224247 () Bool)

(assert (=> b!1335525 m!1224247))

(declare-fun m!1224249 () Bool)

(assert (=> b!1335526 m!1224249))

(declare-fun m!1224251 () Bool)

(assert (=> b!1335515 m!1224251))

(assert (=> b!1335515 m!1224251))

(declare-fun m!1224253 () Bool)

(assert (=> b!1335515 m!1224253))

(assert (=> b!1335518 m!1224221))

(assert (=> b!1335518 m!1224221))

(declare-fun m!1224255 () Bool)

(assert (=> b!1335518 m!1224255))

(assert (=> b!1335521 m!1224221))

(check-sat (not start!112718) (not b!1335518) b_and!49783 (not b!1335513) (not b_next!30889) (not b!1335524) (not b_lambda!24089) tp_is_empty!36799 (not b!1335526) (not b!1335525) (not mapNonEmpty!56872) (not b!1335515))
(check-sat b_and!49783 (not b_next!30889))
