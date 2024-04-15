; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112500 () Bool)

(assert start!112500)

(declare-fun b_free!30895 () Bool)

(declare-fun b_next!30895 () Bool)

(assert (=> start!112500 (= b_free!30895 (not b_next!30895))))

(declare-fun tp!108323 () Bool)

(declare-fun b_and!49773 () Bool)

(assert (=> start!112500 (= tp!108323 b_and!49773)))

(declare-fun res!885544 () Bool)

(declare-fun e!759947 () Bool)

(assert (=> start!112500 (=> (not res!885544) (not e!759947))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112500 (= res!885544 (validMask!0 mask!1998))))

(assert (=> start!112500 e!759947))

(declare-datatypes ((V!54177 0))(
  ( (V!54178 (val!18477 Int)) )
))
(declare-datatypes ((ValueCell!17504 0))(
  ( (ValueCellFull!17504 (v!21113 V!54177)) (EmptyCell!17504) )
))
(declare-datatypes ((array!90421 0))(
  ( (array!90422 (arr!43677 (Array (_ BitVec 32) ValueCell!17504)) (size!44229 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90421)

(declare-fun e!759944 () Bool)

(declare-fun array_inv!33137 (array!90421) Bool)

(assert (=> start!112500 (and (array_inv!33137 _values!1320) e!759944)))

(assert (=> start!112500 true))

(declare-datatypes ((array!90423 0))(
  ( (array!90424 (arr!43678 (Array (_ BitVec 32) (_ BitVec 64))) (size!44230 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90423)

(declare-fun array_inv!33138 (array!90423) Bool)

(assert (=> start!112500 (array_inv!33138 _keys!1590)))

(assert (=> start!112500 tp!108323))

(declare-fun tp_is_empty!36805 () Bool)

(assert (=> start!112500 tp_is_empty!36805))

(declare-fun b!1334276 () Bool)

(declare-fun res!885549 () Bool)

(assert (=> b!1334276 (=> (not res!885549) (not e!759947))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334276 (= res!885549 (and (= (size!44229 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44230 _keys!1590) (size!44229 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334277 () Bool)

(declare-fun res!885553 () Bool)

(assert (=> b!1334277 (=> (not res!885553) (not e!759947))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334277 (= res!885553 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44230 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334278 () Bool)

(declare-fun res!885550 () Bool)

(assert (=> b!1334278 (=> (not res!885550) (not e!759947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90423 (_ BitVec 32)) Bool)

(assert (=> b!1334278 (= res!885550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334279 () Bool)

(declare-fun res!885552 () Bool)

(assert (=> b!1334279 (=> (not res!885552) (not e!759947))))

(assert (=> b!1334279 (= res!885552 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334280 () Bool)

(declare-fun res!885548 () Bool)

(declare-fun e!759948 () Bool)

(assert (=> b!1334280 (=> (not res!885548) (not e!759948))))

(assert (=> b!1334280 (= res!885548 (not (= k0!1153 (select (arr!43678 _keys!1590) from!1980))))))

(declare-fun b!1334281 () Bool)

(declare-fun e!759945 () Bool)

(assert (=> b!1334281 (= e!759945 tp_is_empty!36805)))

(declare-fun b!1334282 () Bool)

(declare-fun res!885545 () Bool)

(assert (=> b!1334282 (=> (not res!885545) (not e!759947))))

(assert (=> b!1334282 (= res!885545 (not (= (select (arr!43678 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334283 () Bool)

(assert (=> b!1334283 (= e!759948 (not true))))

(declare-datatypes ((tuple2!23884 0))(
  ( (tuple2!23885 (_1!11953 (_ BitVec 64)) (_2!11953 V!54177)) )
))
(declare-datatypes ((List!31023 0))(
  ( (Nil!31020) (Cons!31019 (h!32228 tuple2!23884) (t!45269 List!31023)) )
))
(declare-datatypes ((ListLongMap!21541 0))(
  ( (ListLongMap!21542 (toList!10786 List!31023)) )
))
(declare-fun lt!592131 () ListLongMap!21541)

(declare-fun contains!8878 (ListLongMap!21541 (_ BitVec 64)) Bool)

(assert (=> b!1334283 (contains!8878 lt!592131 k0!1153)))

(declare-fun lt!592132 () V!54177)

(declare-datatypes ((Unit!43692 0))(
  ( (Unit!43693) )
))
(declare-fun lt!592130 () Unit!43692)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!296 ((_ BitVec 64) (_ BitVec 64) V!54177 ListLongMap!21541) Unit!43692)

(assert (=> b!1334283 (= lt!592130 (lemmaInListMapAfterAddingDiffThenInBefore!296 k0!1153 (select (arr!43678 _keys!1590) from!1980) lt!592132 lt!592131))))

(declare-fun b!1334284 () Bool)

(declare-fun e!759946 () Bool)

(assert (=> b!1334284 (= e!759946 tp_is_empty!36805)))

(declare-fun mapIsEmpty!56881 () Bool)

(declare-fun mapRes!56881 () Bool)

(assert (=> mapIsEmpty!56881 mapRes!56881))

(declare-fun b!1334285 () Bool)

(declare-fun res!885543 () Bool)

(assert (=> b!1334285 (=> (not res!885543) (not e!759947))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54177)

(declare-fun zeroValue!1262 () V!54177)

(declare-fun getCurrentListMap!5640 (array!90423 array!90421 (_ BitVec 32) (_ BitVec 32) V!54177 V!54177 (_ BitVec 32) Int) ListLongMap!21541)

(assert (=> b!1334285 (= res!885543 (contains!8878 (getCurrentListMap!5640 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56881 () Bool)

(declare-fun tp!108322 () Bool)

(assert (=> mapNonEmpty!56881 (= mapRes!56881 (and tp!108322 e!759946))))

(declare-fun mapValue!56881 () ValueCell!17504)

(declare-fun mapKey!56881 () (_ BitVec 32))

(declare-fun mapRest!56881 () (Array (_ BitVec 32) ValueCell!17504))

(assert (=> mapNonEmpty!56881 (= (arr!43677 _values!1320) (store mapRest!56881 mapKey!56881 mapValue!56881))))

(declare-fun b!1334286 () Bool)

(assert (=> b!1334286 (= e!759944 (and e!759945 mapRes!56881))))

(declare-fun condMapEmpty!56881 () Bool)

(declare-fun mapDefault!56881 () ValueCell!17504)

(assert (=> b!1334286 (= condMapEmpty!56881 (= (arr!43677 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17504)) mapDefault!56881)))))

(declare-fun b!1334287 () Bool)

(assert (=> b!1334287 (= e!759947 e!759948)))

(declare-fun res!885547 () Bool)

(assert (=> b!1334287 (=> (not res!885547) (not e!759948))))

(declare-fun +!4747 (ListLongMap!21541 tuple2!23884) ListLongMap!21541)

(assert (=> b!1334287 (= res!885547 (contains!8878 (+!4747 lt!592131 (tuple2!23885 (select (arr!43678 _keys!1590) from!1980) lt!592132)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6385 (array!90423 array!90421 (_ BitVec 32) (_ BitVec 32) V!54177 V!54177 (_ BitVec 32) Int) ListLongMap!21541)

(assert (=> b!1334287 (= lt!592131 (getCurrentListMapNoExtraKeys!6385 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22042 (ValueCell!17504 V!54177) V!54177)

(declare-fun dynLambda!3677 (Int (_ BitVec 64)) V!54177)

(assert (=> b!1334287 (= lt!592132 (get!22042 (select (arr!43677 _values!1320) from!1980) (dynLambda!3677 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334288 () Bool)

(declare-fun res!885546 () Bool)

(assert (=> b!1334288 (=> (not res!885546) (not e!759947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334288 (= res!885546 (validKeyInArray!0 (select (arr!43678 _keys!1590) from!1980)))))

(declare-fun b!1334289 () Bool)

(declare-fun res!885551 () Bool)

(assert (=> b!1334289 (=> (not res!885551) (not e!759947))))

(declare-datatypes ((List!31024 0))(
  ( (Nil!31021) (Cons!31020 (h!32229 (_ BitVec 64)) (t!45270 List!31024)) )
))
(declare-fun arrayNoDuplicates!0 (array!90423 (_ BitVec 32) List!31024) Bool)

(assert (=> b!1334289 (= res!885551 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31021))))

(assert (= (and start!112500 res!885544) b!1334276))

(assert (= (and b!1334276 res!885549) b!1334278))

(assert (= (and b!1334278 res!885550) b!1334289))

(assert (= (and b!1334289 res!885551) b!1334277))

(assert (= (and b!1334277 res!885553) b!1334285))

(assert (= (and b!1334285 res!885543) b!1334282))

(assert (= (and b!1334282 res!885545) b!1334288))

(assert (= (and b!1334288 res!885546) b!1334279))

(assert (= (and b!1334279 res!885552) b!1334287))

(assert (= (and b!1334287 res!885547) b!1334280))

(assert (= (and b!1334280 res!885548) b!1334283))

(assert (= (and b!1334286 condMapEmpty!56881) mapIsEmpty!56881))

(assert (= (and b!1334286 (not condMapEmpty!56881)) mapNonEmpty!56881))

(get-info :version)

(assert (= (and mapNonEmpty!56881 ((_ is ValueCellFull!17504) mapValue!56881)) b!1334284))

(assert (= (and b!1334286 ((_ is ValueCellFull!17504) mapDefault!56881)) b!1334281))

(assert (= start!112500 b!1334286))

(declare-fun b_lambda!24091 () Bool)

(assert (=> (not b_lambda!24091) (not b!1334287)))

(declare-fun t!45268 () Bool)

(declare-fun tb!12049 () Bool)

(assert (=> (and start!112500 (= defaultEntry!1323 defaultEntry!1323) t!45268) tb!12049))

(declare-fun result!25177 () Bool)

(assert (=> tb!12049 (= result!25177 tp_is_empty!36805)))

(assert (=> b!1334287 t!45268))

(declare-fun b_and!49775 () Bool)

(assert (= b_and!49773 (and (=> t!45268 result!25177) b_and!49775)))

(declare-fun m!1222215 () Bool)

(assert (=> mapNonEmpty!56881 m!1222215))

(declare-fun m!1222217 () Bool)

(assert (=> b!1334283 m!1222217))

(declare-fun m!1222219 () Bool)

(assert (=> b!1334283 m!1222219))

(assert (=> b!1334283 m!1222219))

(declare-fun m!1222221 () Bool)

(assert (=> b!1334283 m!1222221))

(declare-fun m!1222223 () Bool)

(assert (=> b!1334278 m!1222223))

(assert (=> b!1334282 m!1222219))

(declare-fun m!1222225 () Bool)

(assert (=> b!1334289 m!1222225))

(declare-fun m!1222227 () Bool)

(assert (=> b!1334285 m!1222227))

(assert (=> b!1334285 m!1222227))

(declare-fun m!1222229 () Bool)

(assert (=> b!1334285 m!1222229))

(declare-fun m!1222231 () Bool)

(assert (=> start!112500 m!1222231))

(declare-fun m!1222233 () Bool)

(assert (=> start!112500 m!1222233))

(declare-fun m!1222235 () Bool)

(assert (=> start!112500 m!1222235))

(declare-fun m!1222237 () Bool)

(assert (=> b!1334287 m!1222237))

(declare-fun m!1222239 () Bool)

(assert (=> b!1334287 m!1222239))

(declare-fun m!1222241 () Bool)

(assert (=> b!1334287 m!1222241))

(assert (=> b!1334287 m!1222239))

(declare-fun m!1222243 () Bool)

(assert (=> b!1334287 m!1222243))

(assert (=> b!1334287 m!1222237))

(declare-fun m!1222245 () Bool)

(assert (=> b!1334287 m!1222245))

(declare-fun m!1222247 () Bool)

(assert (=> b!1334287 m!1222247))

(assert (=> b!1334287 m!1222241))

(assert (=> b!1334287 m!1222219))

(assert (=> b!1334288 m!1222219))

(assert (=> b!1334288 m!1222219))

(declare-fun m!1222249 () Bool)

(assert (=> b!1334288 m!1222249))

(assert (=> b!1334280 m!1222219))

(check-sat (not b_next!30895) (not b!1334285) (not start!112500) (not b!1334289) (not b_lambda!24091) (not b!1334283) tp_is_empty!36805 (not b!1334288) (not mapNonEmpty!56881) (not b!1334287) b_and!49775 (not b!1334278))
(check-sat b_and!49775 (not b_next!30895))
