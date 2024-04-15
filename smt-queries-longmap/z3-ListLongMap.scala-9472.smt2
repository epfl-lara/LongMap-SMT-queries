; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112440 () Bool)

(assert start!112440)

(declare-fun b_free!30835 () Bool)

(declare-fun b_next!30835 () Bool)

(assert (=> start!112440 (= b_free!30835 (not b_next!30835))))

(declare-fun tp!108142 () Bool)

(declare-fun b_and!49659 () Bool)

(assert (=> start!112440 (= tp!108142 b_and!49659)))

(declare-fun b!1333019 () Bool)

(declare-fun e!759431 () Bool)

(declare-fun e!759429 () Bool)

(declare-fun mapRes!56791 () Bool)

(assert (=> b!1333019 (= e!759431 (and e!759429 mapRes!56791))))

(declare-fun condMapEmpty!56791 () Bool)

(declare-datatypes ((V!54097 0))(
  ( (V!54098 (val!18447 Int)) )
))
(declare-datatypes ((ValueCell!17474 0))(
  ( (ValueCellFull!17474 (v!21083 V!54097)) (EmptyCell!17474) )
))
(declare-datatypes ((array!90305 0))(
  ( (array!90306 (arr!43619 (Array (_ BitVec 32) ValueCell!17474)) (size!44171 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90305)

(declare-fun mapDefault!56791 () ValueCell!17474)

(assert (=> b!1333019 (= condMapEmpty!56791 (= (arr!43619 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17474)) mapDefault!56791)))))

(declare-fun b!1333020 () Bool)

(declare-fun res!884615 () Bool)

(declare-fun e!759430 () Bool)

(assert (=> b!1333020 (=> (not res!884615) (not e!759430))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90307 0))(
  ( (array!90308 (arr!43620 (Array (_ BitVec 32) (_ BitVec 64))) (size!44172 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90307)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333020 (= res!884615 (not (= (select (arr!43620 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333021 () Bool)

(declare-fun res!884614 () Bool)

(assert (=> b!1333021 (=> (not res!884614) (not e!759430))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54097)

(declare-fun zeroValue!1262 () V!54097)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((tuple2!23842 0))(
  ( (tuple2!23843 (_1!11932 (_ BitVec 64)) (_2!11932 V!54097)) )
))
(declare-datatypes ((List!30980 0))(
  ( (Nil!30977) (Cons!30976 (h!32185 tuple2!23842) (t!45170 List!30980)) )
))
(declare-datatypes ((ListLongMap!21499 0))(
  ( (ListLongMap!21500 (toList!10765 List!30980)) )
))
(declare-fun contains!8857 (ListLongMap!21499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5625 (array!90307 array!90305 (_ BitVec 32) (_ BitVec 32) V!54097 V!54097 (_ BitVec 32) Int) ListLongMap!21499)

(assert (=> b!1333021 (= res!884614 (contains!8857 (getCurrentListMap!5625 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333022 () Bool)

(declare-fun res!884617 () Bool)

(assert (=> b!1333022 (=> (not res!884617) (not e!759430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90307 (_ BitVec 32)) Bool)

(assert (=> b!1333022 (= res!884617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!884611 () Bool)

(assert (=> start!112440 (=> (not res!884611) (not e!759430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112440 (= res!884611 (validMask!0 mask!1998))))

(assert (=> start!112440 e!759430))

(declare-fun array_inv!33093 (array!90305) Bool)

(assert (=> start!112440 (and (array_inv!33093 _values!1320) e!759431)))

(assert (=> start!112440 true))

(declare-fun array_inv!33094 (array!90307) Bool)

(assert (=> start!112440 (array_inv!33094 _keys!1590)))

(assert (=> start!112440 tp!108142))

(declare-fun tp_is_empty!36745 () Bool)

(assert (=> start!112440 tp_is_empty!36745))

(declare-fun b!1333023 () Bool)

(declare-fun res!884610 () Bool)

(assert (=> b!1333023 (=> (not res!884610) (not e!759430))))

(assert (=> b!1333023 (= res!884610 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44172 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333024 () Bool)

(assert (=> b!1333024 (= e!759429 tp_is_empty!36745)))

(declare-fun b!1333025 () Bool)

(declare-fun e!759432 () Bool)

(assert (=> b!1333025 (= e!759432 tp_is_empty!36745)))

(declare-fun b!1333026 () Bool)

(declare-fun res!884613 () Bool)

(assert (=> b!1333026 (=> (not res!884613) (not e!759430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333026 (= res!884613 (validKeyInArray!0 (select (arr!43620 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56791 () Bool)

(declare-fun tp!108143 () Bool)

(assert (=> mapNonEmpty!56791 (= mapRes!56791 (and tp!108143 e!759432))))

(declare-fun mapValue!56791 () ValueCell!17474)

(declare-fun mapRest!56791 () (Array (_ BitVec 32) ValueCell!17474))

(declare-fun mapKey!56791 () (_ BitVec 32))

(assert (=> mapNonEmpty!56791 (= (arr!43619 _values!1320) (store mapRest!56791 mapKey!56791 mapValue!56791))))

(declare-fun b!1333027 () Bool)

(declare-fun res!884612 () Bool)

(assert (=> b!1333027 (=> (not res!884612) (not e!759430))))

(assert (=> b!1333027 (= res!884612 (and (= (size!44171 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44172 _keys!1590) (size!44171 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333028 () Bool)

(declare-fun res!884616 () Bool)

(assert (=> b!1333028 (=> (not res!884616) (not e!759430))))

(declare-datatypes ((List!30981 0))(
  ( (Nil!30978) (Cons!30977 (h!32186 (_ BitVec 64)) (t!45171 List!30981)) )
))
(declare-fun arrayNoDuplicates!0 (array!90307 (_ BitVec 32) List!30981) Bool)

(assert (=> b!1333028 (= res!884616 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30978))))

(declare-fun mapIsEmpty!56791 () Bool)

(assert (=> mapIsEmpty!56791 mapRes!56791))

(declare-fun b!1333029 () Bool)

(assert (=> b!1333029 (= e!759430 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(assert (= (and start!112440 res!884611) b!1333027))

(assert (= (and b!1333027 res!884612) b!1333022))

(assert (= (and b!1333022 res!884617) b!1333028))

(assert (= (and b!1333028 res!884616) b!1333023))

(assert (= (and b!1333023 res!884610) b!1333021))

(assert (= (and b!1333021 res!884614) b!1333020))

(assert (= (and b!1333020 res!884615) b!1333026))

(assert (= (and b!1333026 res!884613) b!1333029))

(assert (= (and b!1333019 condMapEmpty!56791) mapIsEmpty!56791))

(assert (= (and b!1333019 (not condMapEmpty!56791)) mapNonEmpty!56791))

(get-info :version)

(assert (= (and mapNonEmpty!56791 ((_ is ValueCellFull!17474) mapValue!56791)) b!1333025))

(assert (= (and b!1333019 ((_ is ValueCellFull!17474) mapDefault!56791)) b!1333024))

(assert (= start!112440 b!1333019))

(declare-fun m!1221207 () Bool)

(assert (=> b!1333022 m!1221207))

(declare-fun m!1221209 () Bool)

(assert (=> b!1333021 m!1221209))

(assert (=> b!1333021 m!1221209))

(declare-fun m!1221211 () Bool)

(assert (=> b!1333021 m!1221211))

(declare-fun m!1221213 () Bool)

(assert (=> b!1333026 m!1221213))

(assert (=> b!1333026 m!1221213))

(declare-fun m!1221215 () Bool)

(assert (=> b!1333026 m!1221215))

(declare-fun m!1221217 () Bool)

(assert (=> b!1333028 m!1221217))

(declare-fun m!1221219 () Bool)

(assert (=> start!112440 m!1221219))

(declare-fun m!1221221 () Bool)

(assert (=> start!112440 m!1221221))

(declare-fun m!1221223 () Bool)

(assert (=> start!112440 m!1221223))

(assert (=> b!1333020 m!1221213))

(declare-fun m!1221225 () Bool)

(assert (=> mapNonEmpty!56791 m!1221225))

(check-sat (not b!1333022) tp_is_empty!36745 b_and!49659 (not start!112440) (not b!1333028) (not mapNonEmpty!56791) (not b!1333026) (not b_next!30835) (not b!1333021))
(check-sat b_and!49659 (not b_next!30835))
