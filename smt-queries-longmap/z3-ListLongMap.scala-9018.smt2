; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108870 () Bool)

(assert start!108870)

(declare-fun b_free!28383 () Bool)

(declare-fun b_next!28383 () Bool)

(assert (=> start!108870 (= b_free!28383 (not b_next!28383))))

(declare-fun tp!100265 () Bool)

(declare-fun b_and!46449 () Bool)

(assert (=> start!108870 (= tp!100265 b_and!46449)))

(declare-fun mapIsEmpty!52592 () Bool)

(declare-fun mapRes!52592 () Bool)

(assert (=> mapIsEmpty!52592 mapRes!52592))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun e!734431 () Bool)

(declare-fun b!1285742 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85100 0))(
  ( (array!85101 (arr!41052 (Array (_ BitVec 32) (_ BitVec 64))) (size!41602 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85100)

(assert (=> b!1285742 (= e!734431 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41602 _keys!1741))))))

(declare-fun res!854131 () Bool)

(assert (=> start!108870 (=> (not res!854131) (not e!734431))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108870 (= res!854131 (validMask!0 mask!2175))))

(assert (=> start!108870 e!734431))

(declare-fun tp_is_empty!34023 () Bool)

(assert (=> start!108870 tp_is_empty!34023))

(assert (=> start!108870 true))

(declare-datatypes ((V!50467 0))(
  ( (V!50468 (val!17086 Int)) )
))
(declare-datatypes ((ValueCell!16113 0))(
  ( (ValueCellFull!16113 (v!19688 V!50467)) (EmptyCell!16113) )
))
(declare-datatypes ((array!85102 0))(
  ( (array!85103 (arr!41053 (Array (_ BitVec 32) ValueCell!16113)) (size!41603 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85102)

(declare-fun e!734433 () Bool)

(declare-fun array_inv!31129 (array!85102) Bool)

(assert (=> start!108870 (and (array_inv!31129 _values!1445) e!734433)))

(declare-fun array_inv!31130 (array!85100) Bool)

(assert (=> start!108870 (array_inv!31130 _keys!1741)))

(assert (=> start!108870 tp!100265))

(declare-fun b!1285743 () Bool)

(declare-fun res!854130 () Bool)

(assert (=> b!1285743 (=> (not res!854130) (not e!734431))))

(declare-datatypes ((List!29091 0))(
  ( (Nil!29088) (Cons!29087 (h!30296 (_ BitVec 64)) (t!42635 List!29091)) )
))
(declare-fun arrayNoDuplicates!0 (array!85100 (_ BitVec 32) List!29091) Bool)

(assert (=> b!1285743 (= res!854130 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29088))))

(declare-fun b!1285744 () Bool)

(declare-fun res!854132 () Bool)

(assert (=> b!1285744 (=> (not res!854132) (not e!734431))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285744 (= res!854132 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41602 _keys!1741))))))

(declare-fun b!1285745 () Bool)

(declare-fun res!854129 () Bool)

(assert (=> b!1285745 (=> (not res!854129) (not e!734431))))

(declare-fun minValue!1387 () V!50467)

(declare-fun zeroValue!1387 () V!50467)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21904 0))(
  ( (tuple2!21905 (_1!10963 (_ BitVec 64)) (_2!10963 V!50467)) )
))
(declare-datatypes ((List!29092 0))(
  ( (Nil!29089) (Cons!29088 (h!30297 tuple2!21904) (t!42636 List!29092)) )
))
(declare-datatypes ((ListLongMap!19561 0))(
  ( (ListLongMap!19562 (toList!9796 List!29092)) )
))
(declare-fun contains!7913 (ListLongMap!19561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4874 (array!85100 array!85102 (_ BitVec 32) (_ BitVec 32) V!50467 V!50467 (_ BitVec 32) Int) ListLongMap!19561)

(assert (=> b!1285745 (= res!854129 (contains!7913 (getCurrentListMap!4874 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285746 () Bool)

(declare-fun res!854127 () Bool)

(assert (=> b!1285746 (=> (not res!854127) (not e!734431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85100 (_ BitVec 32)) Bool)

(assert (=> b!1285746 (= res!854127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285747 () Bool)

(declare-fun res!854126 () Bool)

(assert (=> b!1285747 (=> (not res!854126) (not e!734431))))

(assert (=> b!1285747 (= res!854126 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41602 _keys!1741))))))

(declare-fun b!1285748 () Bool)

(declare-fun e!734434 () Bool)

(assert (=> b!1285748 (= e!734433 (and e!734434 mapRes!52592))))

(declare-fun condMapEmpty!52592 () Bool)

(declare-fun mapDefault!52592 () ValueCell!16113)

(assert (=> b!1285748 (= condMapEmpty!52592 (= (arr!41053 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16113)) mapDefault!52592)))))

(declare-fun b!1285749 () Bool)

(declare-fun res!854133 () Bool)

(assert (=> b!1285749 (=> (not res!854133) (not e!734431))))

(assert (=> b!1285749 (= res!854133 (and (= (size!41603 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41602 _keys!1741) (size!41603 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285750 () Bool)

(declare-fun res!854128 () Bool)

(assert (=> b!1285750 (=> (not res!854128) (not e!734431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285750 (= res!854128 (validKeyInArray!0 (select (arr!41052 _keys!1741) from!2144)))))

(declare-fun b!1285751 () Bool)

(declare-fun e!734432 () Bool)

(assert (=> b!1285751 (= e!734432 tp_is_empty!34023)))

(declare-fun mapNonEmpty!52592 () Bool)

(declare-fun tp!100264 () Bool)

(assert (=> mapNonEmpty!52592 (= mapRes!52592 (and tp!100264 e!734432))))

(declare-fun mapRest!52592 () (Array (_ BitVec 32) ValueCell!16113))

(declare-fun mapKey!52592 () (_ BitVec 32))

(declare-fun mapValue!52592 () ValueCell!16113)

(assert (=> mapNonEmpty!52592 (= (arr!41053 _values!1445) (store mapRest!52592 mapKey!52592 mapValue!52592))))

(declare-fun b!1285752 () Bool)

(assert (=> b!1285752 (= e!734434 tp_is_empty!34023)))

(assert (= (and start!108870 res!854131) b!1285749))

(assert (= (and b!1285749 res!854133) b!1285746))

(assert (= (and b!1285746 res!854127) b!1285743))

(assert (= (and b!1285743 res!854130) b!1285747))

(assert (= (and b!1285747 res!854126) b!1285745))

(assert (= (and b!1285745 res!854129) b!1285744))

(assert (= (and b!1285744 res!854132) b!1285750))

(assert (= (and b!1285750 res!854128) b!1285742))

(assert (= (and b!1285748 condMapEmpty!52592) mapIsEmpty!52592))

(assert (= (and b!1285748 (not condMapEmpty!52592)) mapNonEmpty!52592))

(get-info :version)

(assert (= (and mapNonEmpty!52592 ((_ is ValueCellFull!16113) mapValue!52592)) b!1285751))

(assert (= (and b!1285748 ((_ is ValueCellFull!16113) mapDefault!52592)) b!1285752))

(assert (= start!108870 b!1285748))

(declare-fun m!1178993 () Bool)

(assert (=> b!1285743 m!1178993))

(declare-fun m!1178995 () Bool)

(assert (=> b!1285746 m!1178995))

(declare-fun m!1178997 () Bool)

(assert (=> mapNonEmpty!52592 m!1178997))

(declare-fun m!1178999 () Bool)

(assert (=> b!1285745 m!1178999))

(assert (=> b!1285745 m!1178999))

(declare-fun m!1179001 () Bool)

(assert (=> b!1285745 m!1179001))

(declare-fun m!1179003 () Bool)

(assert (=> b!1285750 m!1179003))

(assert (=> b!1285750 m!1179003))

(declare-fun m!1179005 () Bool)

(assert (=> b!1285750 m!1179005))

(declare-fun m!1179007 () Bool)

(assert (=> start!108870 m!1179007))

(declare-fun m!1179009 () Bool)

(assert (=> start!108870 m!1179009))

(declare-fun m!1179011 () Bool)

(assert (=> start!108870 m!1179011))

(check-sat (not mapNonEmpty!52592) (not start!108870) (not b!1285743) (not b!1285746) tp_is_empty!34023 (not b!1285745) (not b!1285750) (not b_next!28383) b_and!46449)
(check-sat b_and!46449 (not b_next!28383))
