; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112640 () Bool)

(assert start!112640)

(declare-fun b_free!30811 () Bool)

(declare-fun b_next!30811 () Bool)

(assert (=> start!112640 (= b_free!30811 (not b_next!30811))))

(declare-fun tp!108069 () Bool)

(declare-fun b_and!49655 () Bool)

(assert (=> start!112640 (= tp!108069 b_and!49655)))

(declare-fun b!1334094 () Bool)

(declare-fun e!760129 () Bool)

(declare-fun e!760125 () Bool)

(declare-fun mapRes!56755 () Bool)

(assert (=> b!1334094 (= e!760129 (and e!760125 mapRes!56755))))

(declare-fun condMapEmpty!56755 () Bool)

(declare-datatypes ((V!54065 0))(
  ( (V!54066 (val!18435 Int)) )
))
(declare-datatypes ((ValueCell!17462 0))(
  ( (ValueCellFull!17462 (v!21067 V!54065)) (EmptyCell!17462) )
))
(declare-datatypes ((array!90421 0))(
  ( (array!90422 (arr!43672 (Array (_ BitVec 32) ValueCell!17462)) (size!44223 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90421)

(declare-fun mapDefault!56755 () ValueCell!17462)

(assert (=> b!1334094 (= condMapEmpty!56755 (= (arr!43672 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17462)) mapDefault!56755)))))

(declare-fun b!1334095 () Bool)

(declare-fun res!884973 () Bool)

(declare-fun e!760128 () Bool)

(assert (=> b!1334095 (=> (not res!884973) (not e!760128))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90423 0))(
  ( (array!90424 (arr!43673 (Array (_ BitVec 32) (_ BitVec 64))) (size!44224 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90423)

(assert (=> b!1334095 (= res!884973 (and (= (size!44223 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44224 _keys!1590) (size!44223 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56755 () Bool)

(declare-fun tp!108070 () Bool)

(declare-fun e!760126 () Bool)

(assert (=> mapNonEmpty!56755 (= mapRes!56755 (and tp!108070 e!760126))))

(declare-fun mapRest!56755 () (Array (_ BitVec 32) ValueCell!17462))

(declare-fun mapValue!56755 () ValueCell!17462)

(declare-fun mapKey!56755 () (_ BitVec 32))

(assert (=> mapNonEmpty!56755 (= (arr!43672 _values!1320) (store mapRest!56755 mapKey!56755 mapValue!56755))))

(declare-fun b!1334096 () Bool)

(declare-fun res!884971 () Bool)

(assert (=> b!1334096 (=> (not res!884971) (not e!760128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90423 (_ BitVec 32)) Bool)

(assert (=> b!1334096 (= res!884971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!884974 () Bool)

(assert (=> start!112640 (=> (not res!884974) (not e!760128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112640 (= res!884974 (validMask!0 mask!1998))))

(assert (=> start!112640 e!760128))

(declare-fun array_inv!33213 (array!90421) Bool)

(assert (=> start!112640 (and (array_inv!33213 _values!1320) e!760129)))

(assert (=> start!112640 true))

(declare-fun array_inv!33214 (array!90423) Bool)

(assert (=> start!112640 (array_inv!33214 _keys!1590)))

(assert (=> start!112640 tp!108069))

(declare-fun tp_is_empty!36721 () Bool)

(assert (=> start!112640 tp_is_empty!36721))

(declare-fun b!1334097 () Bool)

(declare-fun res!884972 () Bool)

(assert (=> b!1334097 (=> (not res!884972) (not e!760128))))

(declare-datatypes ((List!30948 0))(
  ( (Nil!30945) (Cons!30944 (h!32162 (_ BitVec 64)) (t!45138 List!30948)) )
))
(declare-fun arrayNoDuplicates!0 (array!90423 (_ BitVec 32) List!30948) Bool)

(assert (=> b!1334097 (= res!884972 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30945))))

(declare-fun b!1334098 () Bool)

(assert (=> b!1334098 (= e!760125 tp_is_empty!36721)))

(declare-fun mapIsEmpty!56755 () Bool)

(assert (=> mapIsEmpty!56755 mapRes!56755))

(declare-fun b!1334099 () Bool)

(assert (=> b!1334099 (= e!760128 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592545 () Bool)

(declare-fun minValue!1262 () V!54065)

(declare-fun zeroValue!1262 () V!54065)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23792 0))(
  ( (tuple2!23793 (_1!11907 (_ BitVec 64)) (_2!11907 V!54065)) )
))
(declare-datatypes ((List!30949 0))(
  ( (Nil!30946) (Cons!30945 (h!32163 tuple2!23792) (t!45139 List!30949)) )
))
(declare-datatypes ((ListLongMap!21457 0))(
  ( (ListLongMap!21458 (toList!10744 List!30949)) )
))
(declare-fun contains!8920 (ListLongMap!21457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5708 (array!90423 array!90421 (_ BitVec 32) (_ BitVec 32) V!54065 V!54065 (_ BitVec 32) Int) ListLongMap!21457)

(assert (=> b!1334099 (= lt!592545 (contains!8920 (getCurrentListMap!5708 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334100 () Bool)

(assert (=> b!1334100 (= e!760126 tp_is_empty!36721)))

(declare-fun b!1334101 () Bool)

(declare-fun res!884975 () Bool)

(assert (=> b!1334101 (=> (not res!884975) (not e!760128))))

(assert (=> b!1334101 (= res!884975 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44224 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112640 res!884974) b!1334095))

(assert (= (and b!1334095 res!884973) b!1334096))

(assert (= (and b!1334096 res!884971) b!1334097))

(assert (= (and b!1334097 res!884972) b!1334101))

(assert (= (and b!1334101 res!884975) b!1334099))

(assert (= (and b!1334094 condMapEmpty!56755) mapIsEmpty!56755))

(assert (= (and b!1334094 (not condMapEmpty!56755)) mapNonEmpty!56755))

(get-info :version)

(assert (= (and mapNonEmpty!56755 ((_ is ValueCellFull!17462) mapValue!56755)) b!1334100))

(assert (= (and b!1334094 ((_ is ValueCellFull!17462) mapDefault!56755)) b!1334098))

(assert (= start!112640 b!1334094))

(declare-fun m!1223129 () Bool)

(assert (=> b!1334096 m!1223129))

(declare-fun m!1223131 () Bool)

(assert (=> start!112640 m!1223131))

(declare-fun m!1223133 () Bool)

(assert (=> start!112640 m!1223133))

(declare-fun m!1223135 () Bool)

(assert (=> start!112640 m!1223135))

(declare-fun m!1223137 () Bool)

(assert (=> mapNonEmpty!56755 m!1223137))

(declare-fun m!1223139 () Bool)

(assert (=> b!1334097 m!1223139))

(declare-fun m!1223141 () Bool)

(assert (=> b!1334099 m!1223141))

(assert (=> b!1334099 m!1223141))

(declare-fun m!1223143 () Bool)

(assert (=> b!1334099 m!1223143))

(check-sat (not b_next!30811) (not start!112640) b_and!49655 (not mapNonEmpty!56755) (not b!1334096) (not b!1334097) (not b!1334099) tp_is_empty!36721)
(check-sat b_and!49655 (not b_next!30811))
