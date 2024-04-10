; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112494 () Bool)

(assert start!112494)

(declare-fun b_free!30889 () Bool)

(declare-fun b_next!30889 () Bool)

(assert (=> start!112494 (= b_free!30889 (not b_next!30889))))

(declare-fun tp!108304 () Bool)

(declare-fun b_and!49779 () Bool)

(assert (=> start!112494 (= tp!108304 b_and!49779)))

(declare-fun b!1334214 () Bool)

(declare-fun e!759928 () Bool)

(assert (=> b!1334214 (= e!759928 (not true))))

(declare-datatypes ((V!54169 0))(
  ( (V!54170 (val!18474 Int)) )
))
(declare-datatypes ((tuple2!23818 0))(
  ( (tuple2!23819 (_1!11920 (_ BitVec 64)) (_2!11920 V!54169)) )
))
(declare-datatypes ((List!30958 0))(
  ( (Nil!30955) (Cons!30954 (h!32163 tuple2!23818) (t!45206 List!30958)) )
))
(declare-datatypes ((ListLongMap!21475 0))(
  ( (ListLongMap!21476 (toList!10753 List!30958)) )
))
(declare-fun lt!592291 () ListLongMap!21475)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8917 (ListLongMap!21475 (_ BitVec 64)) Bool)

(assert (=> b!1334214 (contains!8917 lt!592291 k!1153)))

(declare-fun lt!592290 () V!54169)

(declare-datatypes ((array!90464 0))(
  ( (array!90465 (arr!43698 (Array (_ BitVec 32) (_ BitVec 64))) (size!44248 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90464)

(declare-datatypes ((Unit!43887 0))(
  ( (Unit!43888) )
))
(declare-fun lt!592289 () Unit!43887)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!306 ((_ BitVec 64) (_ BitVec 64) V!54169 ListLongMap!21475) Unit!43887)

(assert (=> b!1334214 (= lt!592289 (lemmaInListMapAfterAddingDiffThenInBefore!306 k!1153 (select (arr!43698 _keys!1590) from!1980) lt!592290 lt!592291))))

(declare-fun mapNonEmpty!56872 () Bool)

(declare-fun mapRes!56872 () Bool)

(declare-fun tp!108303 () Bool)

(declare-fun e!759923 () Bool)

(assert (=> mapNonEmpty!56872 (= mapRes!56872 (and tp!108303 e!759923))))

(declare-datatypes ((ValueCell!17501 0))(
  ( (ValueCellFull!17501 (v!21111 V!54169)) (EmptyCell!17501) )
))
(declare-datatypes ((array!90466 0))(
  ( (array!90467 (arr!43699 (Array (_ BitVec 32) ValueCell!17501)) (size!44249 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90466)

(declare-fun mapValue!56872 () ValueCell!17501)

(declare-fun mapRest!56872 () (Array (_ BitVec 32) ValueCell!17501))

(declare-fun mapKey!56872 () (_ BitVec 32))

(assert (=> mapNonEmpty!56872 (= (arr!43699 _values!1320) (store mapRest!56872 mapKey!56872 mapValue!56872))))

(declare-fun b!1334215 () Bool)

(declare-fun res!885480 () Bool)

(declare-fun e!759925 () Bool)

(assert (=> b!1334215 (=> (not res!885480) (not e!759925))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54169)

(declare-fun zeroValue!1262 () V!54169)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun getCurrentListMap!5729 (array!90464 array!90466 (_ BitVec 32) (_ BitVec 32) V!54169 V!54169 (_ BitVec 32) Int) ListLongMap!21475)

(assert (=> b!1334215 (= res!885480 (contains!8917 (getCurrentListMap!5729 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334216 () Bool)

(declare-fun res!885477 () Bool)

(assert (=> b!1334216 (=> (not res!885477) (not e!759928))))

(assert (=> b!1334216 (= res!885477 (not (= k!1153 (select (arr!43698 _keys!1590) from!1980))))))

(declare-fun b!1334217 () Bool)

(declare-fun res!885483 () Bool)

(assert (=> b!1334217 (=> (not res!885483) (not e!759925))))

(assert (=> b!1334217 (= res!885483 (and (= (size!44249 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44248 _keys!1590) (size!44249 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334218 () Bool)

(declare-fun tp_is_empty!36799 () Bool)

(assert (=> b!1334218 (= e!759923 tp_is_empty!36799)))

(declare-fun res!885474 () Bool)

(assert (=> start!112494 (=> (not res!885474) (not e!759925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112494 (= res!885474 (validMask!0 mask!1998))))

(assert (=> start!112494 e!759925))

(declare-fun e!759927 () Bool)

(declare-fun array_inv!32957 (array!90466) Bool)

(assert (=> start!112494 (and (array_inv!32957 _values!1320) e!759927)))

(assert (=> start!112494 true))

(declare-fun array_inv!32958 (array!90464) Bool)

(assert (=> start!112494 (array_inv!32958 _keys!1590)))

(assert (=> start!112494 tp!108304))

(assert (=> start!112494 tp_is_empty!36799))

(declare-fun b!1334219 () Bool)

(assert (=> b!1334219 (= e!759925 e!759928)))

(declare-fun res!885476 () Bool)

(assert (=> b!1334219 (=> (not res!885476) (not e!759928))))

(declare-fun +!4723 (ListLongMap!21475 tuple2!23818) ListLongMap!21475)

(assert (=> b!1334219 (= res!885476 (contains!8917 (+!4723 lt!592291 (tuple2!23819 (select (arr!43698 _keys!1590) from!1980) lt!592290)) k!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6361 (array!90464 array!90466 (_ BitVec 32) (_ BitVec 32) V!54169 V!54169 (_ BitVec 32) Int) ListLongMap!21475)

(assert (=> b!1334219 (= lt!592291 (getCurrentListMapNoExtraKeys!6361 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22049 (ValueCell!17501 V!54169) V!54169)

(declare-fun dynLambda!3662 (Int (_ BitVec 64)) V!54169)

(assert (=> b!1334219 (= lt!592290 (get!22049 (select (arr!43699 _values!1320) from!1980) (dynLambda!3662 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56872 () Bool)

(assert (=> mapIsEmpty!56872 mapRes!56872))

(declare-fun b!1334220 () Bool)

(declare-fun res!885473 () Bool)

(assert (=> b!1334220 (=> (not res!885473) (not e!759925))))

(assert (=> b!1334220 (= res!885473 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44248 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334221 () Bool)

(declare-fun res!885478 () Bool)

(assert (=> b!1334221 (=> (not res!885478) (not e!759925))))

(declare-datatypes ((List!30959 0))(
  ( (Nil!30956) (Cons!30955 (h!32164 (_ BitVec 64)) (t!45207 List!30959)) )
))
(declare-fun arrayNoDuplicates!0 (array!90464 (_ BitVec 32) List!30959) Bool)

(assert (=> b!1334221 (= res!885478 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30956))))

(declare-fun b!1334222 () Bool)

(declare-fun res!885479 () Bool)

(assert (=> b!1334222 (=> (not res!885479) (not e!759925))))

(assert (=> b!1334222 (= res!885479 (not (= (select (arr!43698 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1334223 () Bool)

(declare-fun res!885481 () Bool)

(assert (=> b!1334223 (=> (not res!885481) (not e!759925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334223 (= res!885481 (validKeyInArray!0 (select (arr!43698 _keys!1590) from!1980)))))

(declare-fun b!1334224 () Bool)

(declare-fun res!885482 () Bool)

(assert (=> b!1334224 (=> (not res!885482) (not e!759925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90464 (_ BitVec 32)) Bool)

(assert (=> b!1334224 (= res!885482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334225 () Bool)

(declare-fun res!885475 () Bool)

(assert (=> b!1334225 (=> (not res!885475) (not e!759925))))

(assert (=> b!1334225 (= res!885475 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334226 () Bool)

(declare-fun e!759926 () Bool)

(assert (=> b!1334226 (= e!759926 tp_is_empty!36799)))

(declare-fun b!1334227 () Bool)

(assert (=> b!1334227 (= e!759927 (and e!759926 mapRes!56872))))

(declare-fun condMapEmpty!56872 () Bool)

(declare-fun mapDefault!56872 () ValueCell!17501)

