; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112490 () Bool)

(assert start!112490)

(declare-fun b_free!30885 () Bool)

(declare-fun b_next!30885 () Bool)

(assert (=> start!112490 (= b_free!30885 (not b_next!30885))))

(declare-fun tp!108292 () Bool)

(declare-fun b_and!49771 () Bool)

(assert (=> start!112490 (= tp!108292 b_and!49771)))

(declare-fun b!1334126 () Bool)

(declare-fun res!885410 () Bool)

(declare-fun e!759891 () Bool)

(assert (=> b!1334126 (=> (not res!885410) (not e!759891))))

(declare-datatypes ((V!54163 0))(
  ( (V!54164 (val!18472 Int)) )
))
(declare-datatypes ((ValueCell!17499 0))(
  ( (ValueCellFull!17499 (v!21109 V!54163)) (EmptyCell!17499) )
))
(declare-datatypes ((array!90456 0))(
  ( (array!90457 (arr!43694 (Array (_ BitVec 32) ValueCell!17499)) (size!44244 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90456)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90458 0))(
  ( (array!90459 (arr!43695 (Array (_ BitVec 32) (_ BitVec 64))) (size!44245 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90458)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334126 (= res!885410 (and (= (size!44244 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44245 _keys!1590) (size!44244 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334127 () Bool)

(declare-fun res!885417 () Bool)

(assert (=> b!1334127 (=> (not res!885417) (not e!759891))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54163)

(declare-fun zeroValue!1262 () V!54163)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23814 0))(
  ( (tuple2!23815 (_1!11918 (_ BitVec 64)) (_2!11918 V!54163)) )
))
(declare-datatypes ((List!30955 0))(
  ( (Nil!30952) (Cons!30951 (h!32160 tuple2!23814) (t!45199 List!30955)) )
))
(declare-datatypes ((ListLongMap!21471 0))(
  ( (ListLongMap!21472 (toList!10751 List!30955)) )
))
(declare-fun contains!8915 (ListLongMap!21471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5728 (array!90458 array!90456 (_ BitVec 32) (_ BitVec 32) V!54163 V!54163 (_ BitVec 32) Int) ListLongMap!21471)

(assert (=> b!1334127 (= res!885417 (contains!8915 (getCurrentListMap!5728 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334128 () Bool)

(declare-fun res!885407 () Bool)

(assert (=> b!1334128 (=> (not res!885407) (not e!759891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90458 (_ BitVec 32)) Bool)

(assert (=> b!1334128 (= res!885407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56866 () Bool)

(declare-fun mapRes!56866 () Bool)

(assert (=> mapIsEmpty!56866 mapRes!56866))

(declare-fun b!1334129 () Bool)

(declare-fun res!885414 () Bool)

(assert (=> b!1334129 (=> (not res!885414) (not e!759891))))

(assert (=> b!1334129 (= res!885414 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44245 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334130 () Bool)

(declare-fun e!759887 () Bool)

(declare-fun tp_is_empty!36795 () Bool)

(assert (=> b!1334130 (= e!759887 tp_is_empty!36795)))

(declare-fun b!1334131 () Bool)

(declare-fun e!759888 () Bool)

(assert (=> b!1334131 (= e!759888 tp_is_empty!36795)))

(declare-fun b!1334133 () Bool)

(declare-fun res!885409 () Bool)

(assert (=> b!1334133 (=> (not res!885409) (not e!759891))))

(assert (=> b!1334133 (= res!885409 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!56866 () Bool)

(declare-fun tp!108291 () Bool)

(assert (=> mapNonEmpty!56866 (= mapRes!56866 (and tp!108291 e!759888))))

(declare-fun mapValue!56866 () ValueCell!17499)

(declare-fun mapKey!56866 () (_ BitVec 32))

(declare-fun mapRest!56866 () (Array (_ BitVec 32) ValueCell!17499))

(assert (=> mapNonEmpty!56866 (= (arr!43694 _values!1320) (store mapRest!56866 mapKey!56866 mapValue!56866))))

(declare-fun b!1334134 () Bool)

(declare-fun res!885413 () Bool)

(assert (=> b!1334134 (=> (not res!885413) (not e!759891))))

(assert (=> b!1334134 (= res!885413 (not (= (select (arr!43695 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334135 () Bool)

(declare-fun e!759890 () Bool)

(assert (=> b!1334135 (= e!759890 (not true))))

(declare-fun lt!592271 () ListLongMap!21471)

(assert (=> b!1334135 (contains!8915 lt!592271 k0!1153)))

(declare-fun lt!592272 () V!54163)

(declare-datatypes ((Unit!43883 0))(
  ( (Unit!43884) )
))
(declare-fun lt!592273 () Unit!43883)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!304 ((_ BitVec 64) (_ BitVec 64) V!54163 ListLongMap!21471) Unit!43883)

(assert (=> b!1334135 (= lt!592273 (lemmaInListMapAfterAddingDiffThenInBefore!304 k0!1153 (select (arr!43695 _keys!1590) from!1980) lt!592272 lt!592271))))

(declare-fun b!1334136 () Bool)

(declare-fun res!885416 () Bool)

(assert (=> b!1334136 (=> (not res!885416) (not e!759891))))

(declare-datatypes ((List!30956 0))(
  ( (Nil!30953) (Cons!30952 (h!32161 (_ BitVec 64)) (t!45200 List!30956)) )
))
(declare-fun arrayNoDuplicates!0 (array!90458 (_ BitVec 32) List!30956) Bool)

(assert (=> b!1334136 (= res!885416 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30953))))

(declare-fun b!1334137 () Bool)

(declare-fun res!885411 () Bool)

(assert (=> b!1334137 (=> (not res!885411) (not e!759890))))

(assert (=> b!1334137 (= res!885411 (not (= k0!1153 (select (arr!43695 _keys!1590) from!1980))))))

(declare-fun b!1334132 () Bool)

(declare-fun e!759892 () Bool)

(assert (=> b!1334132 (= e!759892 (and e!759887 mapRes!56866))))

(declare-fun condMapEmpty!56866 () Bool)

(declare-fun mapDefault!56866 () ValueCell!17499)

(assert (=> b!1334132 (= condMapEmpty!56866 (= (arr!43694 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17499)) mapDefault!56866)))))

(declare-fun res!885408 () Bool)

(assert (=> start!112490 (=> (not res!885408) (not e!759891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112490 (= res!885408 (validMask!0 mask!1998))))

(assert (=> start!112490 e!759891))

(declare-fun array_inv!32953 (array!90456) Bool)

(assert (=> start!112490 (and (array_inv!32953 _values!1320) e!759892)))

(assert (=> start!112490 true))

(declare-fun array_inv!32954 (array!90458) Bool)

(assert (=> start!112490 (array_inv!32954 _keys!1590)))

(assert (=> start!112490 tp!108292))

(assert (=> start!112490 tp_is_empty!36795))

(declare-fun b!1334138 () Bool)

(declare-fun res!885415 () Bool)

(assert (=> b!1334138 (=> (not res!885415) (not e!759891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334138 (= res!885415 (validKeyInArray!0 (select (arr!43695 _keys!1590) from!1980)))))

(declare-fun b!1334139 () Bool)

(assert (=> b!1334139 (= e!759891 e!759890)))

(declare-fun res!885412 () Bool)

(assert (=> b!1334139 (=> (not res!885412) (not e!759890))))

(declare-fun +!4721 (ListLongMap!21471 tuple2!23814) ListLongMap!21471)

(assert (=> b!1334139 (= res!885412 (contains!8915 (+!4721 lt!592271 (tuple2!23815 (select (arr!43695 _keys!1590) from!1980) lt!592272)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6359 (array!90458 array!90456 (_ BitVec 32) (_ BitVec 32) V!54163 V!54163 (_ BitVec 32) Int) ListLongMap!21471)

(assert (=> b!1334139 (= lt!592271 (getCurrentListMapNoExtraKeys!6359 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22045 (ValueCell!17499 V!54163) V!54163)

(declare-fun dynLambda!3660 (Int (_ BitVec 64)) V!54163)

(assert (=> b!1334139 (= lt!592272 (get!22045 (select (arr!43694 _values!1320) from!1980) (dynLambda!3660 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!112490 res!885408) b!1334126))

(assert (= (and b!1334126 res!885410) b!1334128))

(assert (= (and b!1334128 res!885407) b!1334136))

(assert (= (and b!1334136 res!885416) b!1334129))

(assert (= (and b!1334129 res!885414) b!1334127))

(assert (= (and b!1334127 res!885417) b!1334134))

(assert (= (and b!1334134 res!885413) b!1334138))

(assert (= (and b!1334138 res!885415) b!1334133))

(assert (= (and b!1334133 res!885409) b!1334139))

(assert (= (and b!1334139 res!885412) b!1334137))

(assert (= (and b!1334137 res!885411) b!1334135))

(assert (= (and b!1334132 condMapEmpty!56866) mapIsEmpty!56866))

(assert (= (and b!1334132 (not condMapEmpty!56866)) mapNonEmpty!56866))

(get-info :version)

(assert (= (and mapNonEmpty!56866 ((_ is ValueCellFull!17499) mapValue!56866)) b!1334131))

(assert (= (and b!1334132 ((_ is ValueCellFull!17499) mapDefault!56866)) b!1334130))

(assert (= start!112490 b!1334132))

(declare-fun b_lambda!24091 () Bool)

(assert (=> (not b_lambda!24091) (not b!1334139)))

(declare-fun t!45198 () Bool)

(declare-fun tb!12047 () Bool)

(assert (=> (and start!112490 (= defaultEntry!1323 defaultEntry!1323) t!45198) tb!12047))

(declare-fun result!25165 () Bool)

(assert (=> tb!12047 (= result!25165 tp_is_empty!36795)))

(assert (=> b!1334139 t!45198))

(declare-fun b_and!49773 () Bool)

(assert (= b_and!49771 (and (=> t!45198 result!25165) b_and!49773)))

(declare-fun m!1222551 () Bool)

(assert (=> b!1334138 m!1222551))

(assert (=> b!1334138 m!1222551))

(declare-fun m!1222553 () Bool)

(assert (=> b!1334138 m!1222553))

(declare-fun m!1222555 () Bool)

(assert (=> b!1334139 m!1222555))

(declare-fun m!1222557 () Bool)

(assert (=> b!1334139 m!1222557))

(assert (=> b!1334139 m!1222555))

(declare-fun m!1222559 () Bool)

(assert (=> b!1334139 m!1222559))

(declare-fun m!1222561 () Bool)

(assert (=> b!1334139 m!1222561))

(declare-fun m!1222563 () Bool)

(assert (=> b!1334139 m!1222563))

(assert (=> b!1334139 m!1222561))

(declare-fun m!1222565 () Bool)

(assert (=> b!1334139 m!1222565))

(assert (=> b!1334139 m!1222557))

(assert (=> b!1334139 m!1222551))

(declare-fun m!1222567 () Bool)

(assert (=> b!1334127 m!1222567))

(assert (=> b!1334127 m!1222567))

(declare-fun m!1222569 () Bool)

(assert (=> b!1334127 m!1222569))

(declare-fun m!1222571 () Bool)

(assert (=> b!1334135 m!1222571))

(assert (=> b!1334135 m!1222551))

(assert (=> b!1334135 m!1222551))

(declare-fun m!1222573 () Bool)

(assert (=> b!1334135 m!1222573))

(declare-fun m!1222575 () Bool)

(assert (=> b!1334128 m!1222575))

(declare-fun m!1222577 () Bool)

(assert (=> start!112490 m!1222577))

(declare-fun m!1222579 () Bool)

(assert (=> start!112490 m!1222579))

(declare-fun m!1222581 () Bool)

(assert (=> start!112490 m!1222581))

(declare-fun m!1222583 () Bool)

(assert (=> mapNonEmpty!56866 m!1222583))

(assert (=> b!1334137 m!1222551))

(assert (=> b!1334134 m!1222551))

(declare-fun m!1222585 () Bool)

(assert (=> b!1334136 m!1222585))

(check-sat (not b_lambda!24091) (not mapNonEmpty!56866) tp_is_empty!36795 (not b!1334138) (not b_next!30885) (not start!112490) b_and!49773 (not b!1334136) (not b!1334127) (not b!1334139) (not b!1334135) (not b!1334128))
(check-sat b_and!49773 (not b_next!30885))
