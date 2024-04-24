; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112532 () Bool)

(assert start!112532)

(declare-fun b_free!30703 () Bool)

(declare-fun b_next!30703 () Bool)

(assert (=> start!112532 (= b_free!30703 (not b_next!30703))))

(declare-fun tp!107746 () Bool)

(declare-fun b_and!49463 () Bool)

(assert (=> start!112532 (= tp!107746 b_and!49463)))

(declare-fun b!1332218 () Bool)

(declare-fun res!883671 () Bool)

(declare-fun e!759317 () Bool)

(assert (=> b!1332218 (=> (not res!883671) (not e!759317))))

(declare-datatypes ((array!90217 0))(
  ( (array!90218 (arr!43570 (Array (_ BitVec 32) (_ BitVec 64))) (size!44121 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90217)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90217 (_ BitVec 32)) Bool)

(assert (=> b!1332218 (= res!883671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332219 () Bool)

(declare-fun res!883668 () Bool)

(assert (=> b!1332219 (=> (not res!883668) (not e!759317))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332219 (= res!883668 (validKeyInArray!0 (select (arr!43570 _keys!1590) from!1980)))))

(declare-fun b!1332220 () Bool)

(declare-fun res!883672 () Bool)

(assert (=> b!1332220 (=> (not res!883672) (not e!759317))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332220 (= res!883672 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332221 () Bool)

(declare-fun res!883665 () Bool)

(assert (=> b!1332221 (=> (not res!883665) (not e!759317))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332221 (= res!883665 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44121 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332222 () Bool)

(declare-fun e!759319 () Bool)

(declare-fun e!759315 () Bool)

(declare-fun mapRes!56593 () Bool)

(assert (=> b!1332222 (= e!759319 (and e!759315 mapRes!56593))))

(declare-fun condMapEmpty!56593 () Bool)

(declare-datatypes ((V!53921 0))(
  ( (V!53922 (val!18381 Int)) )
))
(declare-datatypes ((ValueCell!17408 0))(
  ( (ValueCellFull!17408 (v!21013 V!53921)) (EmptyCell!17408) )
))
(declare-datatypes ((array!90219 0))(
  ( (array!90220 (arr!43571 (Array (_ BitVec 32) ValueCell!17408)) (size!44122 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90219)

(declare-fun mapDefault!56593 () ValueCell!17408)

(assert (=> b!1332222 (= condMapEmpty!56593 (= (arr!43571 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17408)) mapDefault!56593)))))

(declare-fun b!1332223 () Bool)

(declare-fun res!883666 () Bool)

(assert (=> b!1332223 (=> (not res!883666) (not e!759317))))

(assert (=> b!1332223 (= res!883666 (and (= (size!44122 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44121 _keys!1590) (size!44122 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332224 () Bool)

(assert (=> b!1332224 (= e!759317 (not true))))

(declare-datatypes ((tuple2!23706 0))(
  ( (tuple2!23707 (_1!11864 (_ BitVec 64)) (_2!11864 V!53921)) )
))
(declare-datatypes ((List!30873 0))(
  ( (Nil!30870) (Cons!30869 (h!32087 tuple2!23706) (t!44981 List!30873)) )
))
(declare-datatypes ((ListLongMap!21371 0))(
  ( (ListLongMap!21372 (toList!10701 List!30873)) )
))
(declare-fun lt!591806 () ListLongMap!21371)

(declare-fun contains!8877 (ListLongMap!21371 (_ BitVec 64)) Bool)

(assert (=> b!1332224 (contains!8877 lt!591806 k0!1153)))

(declare-datatypes ((Unit!43740 0))(
  ( (Unit!43741) )
))
(declare-fun lt!591808 () Unit!43740)

(declare-fun lt!591810 () V!53921)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!258 ((_ BitVec 64) (_ BitVec 64) V!53921 ListLongMap!21371) Unit!43740)

(assert (=> b!1332224 (= lt!591808 (lemmaInListMapAfterAddingDiffThenInBefore!258 k0!1153 (select (arr!43570 _keys!1590) from!1980) lt!591810 lt!591806))))

(declare-fun lt!591807 () ListLongMap!21371)

(assert (=> b!1332224 (contains!8877 lt!591807 k0!1153)))

(declare-fun lt!591809 () Unit!43740)

(declare-fun minValue!1262 () V!53921)

(assert (=> b!1332224 (= lt!591809 (lemmaInListMapAfterAddingDiffThenInBefore!258 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591807))))

(declare-fun +!4715 (ListLongMap!21371 tuple2!23706) ListLongMap!21371)

(assert (=> b!1332224 (= lt!591807 (+!4715 lt!591806 (tuple2!23707 (select (arr!43570 _keys!1590) from!1980) lt!591810)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21982 (ValueCell!17408 V!53921) V!53921)

(declare-fun dynLambda!3669 (Int (_ BitVec 64)) V!53921)

(assert (=> b!1332224 (= lt!591810 (get!21982 (select (arr!43571 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53921)

(declare-fun getCurrentListMapNoExtraKeys!6359 (array!90217 array!90219 (_ BitVec 32) (_ BitVec 32) V!53921 V!53921 (_ BitVec 32) Int) ListLongMap!21371)

(assert (=> b!1332224 (= lt!591806 (getCurrentListMapNoExtraKeys!6359 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332225 () Bool)

(declare-fun res!883667 () Bool)

(assert (=> b!1332225 (=> (not res!883667) (not e!759317))))

(declare-fun getCurrentListMap!5672 (array!90217 array!90219 (_ BitVec 32) (_ BitVec 32) V!53921 V!53921 (_ BitVec 32) Int) ListLongMap!21371)

(assert (=> b!1332225 (= res!883667 (contains!8877 (getCurrentListMap!5672 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332227 () Bool)

(declare-fun res!883670 () Bool)

(assert (=> b!1332227 (=> (not res!883670) (not e!759317))))

(declare-datatypes ((List!30874 0))(
  ( (Nil!30871) (Cons!30870 (h!32088 (_ BitVec 64)) (t!44982 List!30874)) )
))
(declare-fun arrayNoDuplicates!0 (array!90217 (_ BitVec 32) List!30874) Bool)

(assert (=> b!1332227 (= res!883670 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30871))))

(declare-fun mapNonEmpty!56593 () Bool)

(declare-fun tp!107745 () Bool)

(declare-fun e!759318 () Bool)

(assert (=> mapNonEmpty!56593 (= mapRes!56593 (and tp!107745 e!759318))))

(declare-fun mapValue!56593 () ValueCell!17408)

(declare-fun mapRest!56593 () (Array (_ BitVec 32) ValueCell!17408))

(declare-fun mapKey!56593 () (_ BitVec 32))

(assert (=> mapNonEmpty!56593 (= (arr!43571 _values!1320) (store mapRest!56593 mapKey!56593 mapValue!56593))))

(declare-fun b!1332228 () Bool)

(declare-fun tp_is_empty!36613 () Bool)

(assert (=> b!1332228 (= e!759318 tp_is_empty!36613)))

(declare-fun mapIsEmpty!56593 () Bool)

(assert (=> mapIsEmpty!56593 mapRes!56593))

(declare-fun b!1332229 () Bool)

(assert (=> b!1332229 (= e!759315 tp_is_empty!36613)))

(declare-fun res!883673 () Bool)

(assert (=> start!112532 (=> (not res!883673) (not e!759317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112532 (= res!883673 (validMask!0 mask!1998))))

(assert (=> start!112532 e!759317))

(declare-fun array_inv!33147 (array!90219) Bool)

(assert (=> start!112532 (and (array_inv!33147 _values!1320) e!759319)))

(assert (=> start!112532 true))

(declare-fun array_inv!33148 (array!90217) Bool)

(assert (=> start!112532 (array_inv!33148 _keys!1590)))

(assert (=> start!112532 tp!107746))

(assert (=> start!112532 tp_is_empty!36613))

(declare-fun b!1332226 () Bool)

(declare-fun res!883669 () Bool)

(assert (=> b!1332226 (=> (not res!883669) (not e!759317))))

(assert (=> b!1332226 (= res!883669 (not (= (select (arr!43570 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112532 res!883673) b!1332223))

(assert (= (and b!1332223 res!883666) b!1332218))

(assert (= (and b!1332218 res!883671) b!1332227))

(assert (= (and b!1332227 res!883670) b!1332221))

(assert (= (and b!1332221 res!883665) b!1332225))

(assert (= (and b!1332225 res!883667) b!1332226))

(assert (= (and b!1332226 res!883669) b!1332219))

(assert (= (and b!1332219 res!883668) b!1332220))

(assert (= (and b!1332220 res!883672) b!1332224))

(assert (= (and b!1332222 condMapEmpty!56593) mapIsEmpty!56593))

(assert (= (and b!1332222 (not condMapEmpty!56593)) mapNonEmpty!56593))

(get-info :version)

(assert (= (and mapNonEmpty!56593 ((_ is ValueCellFull!17408) mapValue!56593)) b!1332228))

(assert (= (and b!1332222 ((_ is ValueCellFull!17408) mapDefault!56593)) b!1332229))

(assert (= start!112532 b!1332222))

(declare-fun b_lambda!23957 () Bool)

(assert (=> (not b_lambda!23957) (not b!1332224)))

(declare-fun t!44980 () Bool)

(declare-fun tb!11911 () Bool)

(assert (=> (and start!112532 (= defaultEntry!1323 defaultEntry!1323) t!44980) tb!11911))

(declare-fun result!24901 () Bool)

(assert (=> tb!11911 (= result!24901 tp_is_empty!36613)))

(assert (=> b!1332224 t!44980))

(declare-fun b_and!49465 () Bool)

(assert (= b_and!49463 (and (=> t!44980 result!24901) b_and!49465)))

(declare-fun m!1221179 () Bool)

(assert (=> start!112532 m!1221179))

(declare-fun m!1221181 () Bool)

(assert (=> start!112532 m!1221181))

(declare-fun m!1221183 () Bool)

(assert (=> start!112532 m!1221183))

(declare-fun m!1221185 () Bool)

(assert (=> b!1332226 m!1221185))

(declare-fun m!1221187 () Bool)

(assert (=> b!1332225 m!1221187))

(assert (=> b!1332225 m!1221187))

(declare-fun m!1221189 () Bool)

(assert (=> b!1332225 m!1221189))

(declare-fun m!1221191 () Bool)

(assert (=> b!1332218 m!1221191))

(assert (=> b!1332219 m!1221185))

(assert (=> b!1332219 m!1221185))

(declare-fun m!1221193 () Bool)

(assert (=> b!1332219 m!1221193))

(declare-fun m!1221195 () Bool)

(assert (=> b!1332224 m!1221195))

(declare-fun m!1221197 () Bool)

(assert (=> b!1332224 m!1221197))

(declare-fun m!1221199 () Bool)

(assert (=> b!1332224 m!1221199))

(assert (=> b!1332224 m!1221185))

(declare-fun m!1221201 () Bool)

(assert (=> b!1332224 m!1221201))

(declare-fun m!1221203 () Bool)

(assert (=> b!1332224 m!1221203))

(declare-fun m!1221205 () Bool)

(assert (=> b!1332224 m!1221205))

(declare-fun m!1221207 () Bool)

(assert (=> b!1332224 m!1221207))

(assert (=> b!1332224 m!1221185))

(declare-fun m!1221209 () Bool)

(assert (=> b!1332224 m!1221209))

(assert (=> b!1332224 m!1221207))

(assert (=> b!1332224 m!1221197))

(declare-fun m!1221211 () Bool)

(assert (=> b!1332224 m!1221211))

(declare-fun m!1221213 () Bool)

(assert (=> b!1332227 m!1221213))

(declare-fun m!1221215 () Bool)

(assert (=> mapNonEmpty!56593 m!1221215))

(check-sat (not b_next!30703) (not mapNonEmpty!56593) tp_is_empty!36613 (not b!1332225) (not start!112532) (not b!1332227) (not b!1332224) (not b_lambda!23957) b_and!49465 (not b!1332219) (not b!1332218))
(check-sat b_and!49465 (not b_next!30703))
