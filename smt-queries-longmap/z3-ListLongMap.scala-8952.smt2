; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108438 () Bool)

(assert start!108438)

(declare-fun b_free!27985 () Bool)

(declare-fun b_next!27985 () Bool)

(assert (=> start!108438 (= b_free!27985 (not b_next!27985))))

(declare-fun tp!99066 () Bool)

(declare-fun b_and!46027 () Bool)

(assert (=> start!108438 (= tp!99066 b_and!46027)))

(declare-fun b!1279769 () Bool)

(declare-fun e!731224 () Bool)

(declare-fun tp_is_empty!33625 () Bool)

(assert (=> b!1279769 (= e!731224 tp_is_empty!33625)))

(declare-fun b!1279770 () Bool)

(declare-fun res!850133 () Bool)

(declare-fun e!731222 () Bool)

(assert (=> b!1279770 (=> (not res!850133) (not e!731222))))

(declare-datatypes ((array!84225 0))(
  ( (array!84226 (arr!40617 (Array (_ BitVec 32) (_ BitVec 64))) (size!41169 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84225)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84225 (_ BitVec 32)) Bool)

(assert (=> b!1279770 (= res!850133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51989 () Bool)

(declare-fun mapRes!51989 () Bool)

(declare-fun tp!99065 () Bool)

(declare-fun e!731225 () Bool)

(assert (=> mapNonEmpty!51989 (= mapRes!51989 (and tp!99065 e!731225))))

(declare-datatypes ((V!49937 0))(
  ( (V!49938 (val!16887 Int)) )
))
(declare-datatypes ((ValueCell!15914 0))(
  ( (ValueCellFull!15914 (v!19486 V!49937)) (EmptyCell!15914) )
))
(declare-fun mapValue!51989 () ValueCell!15914)

(declare-fun mapKey!51989 () (_ BitVec 32))

(declare-fun mapRest!51989 () (Array (_ BitVec 32) ValueCell!15914))

(declare-datatypes ((array!84227 0))(
  ( (array!84228 (arr!40618 (Array (_ BitVec 32) ValueCell!15914)) (size!41170 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84227)

(assert (=> mapNonEmpty!51989 (= (arr!40618 _values!1445) (store mapRest!51989 mapKey!51989 mapValue!51989))))

(declare-fun b!1279771 () Bool)

(assert (=> b!1279771 (= e!731222 false)))

(declare-fun minValue!1387 () V!49937)

(declare-fun zeroValue!1387 () V!49937)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!575872 () Bool)

(declare-datatypes ((tuple2!21688 0))(
  ( (tuple2!21689 (_1!10855 (_ BitVec 64)) (_2!10855 V!49937)) )
))
(declare-datatypes ((List!28877 0))(
  ( (Nil!28874) (Cons!28873 (h!30082 tuple2!21688) (t!42409 List!28877)) )
))
(declare-datatypes ((ListLongMap!19345 0))(
  ( (ListLongMap!19346 (toList!9688 List!28877)) )
))
(declare-fun contains!7733 (ListLongMap!19345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4662 (array!84225 array!84227 (_ BitVec 32) (_ BitVec 32) V!49937 V!49937 (_ BitVec 32) Int) ListLongMap!19345)

(assert (=> b!1279771 (= lt!575872 (contains!7733 (getCurrentListMap!4662 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279772 () Bool)

(declare-fun res!850132 () Bool)

(assert (=> b!1279772 (=> (not res!850132) (not e!731222))))

(assert (=> b!1279772 (= res!850132 (and (= (size!41170 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41169 _keys!1741) (size!41170 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850131 () Bool)

(assert (=> start!108438 (=> (not res!850131) (not e!731222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108438 (= res!850131 (validMask!0 mask!2175))))

(assert (=> start!108438 e!731222))

(assert (=> start!108438 tp_is_empty!33625))

(assert (=> start!108438 true))

(declare-fun e!731223 () Bool)

(declare-fun array_inv!31001 (array!84227) Bool)

(assert (=> start!108438 (and (array_inv!31001 _values!1445) e!731223)))

(declare-fun array_inv!31002 (array!84225) Bool)

(assert (=> start!108438 (array_inv!31002 _keys!1741)))

(assert (=> start!108438 tp!99066))

(declare-fun mapIsEmpty!51989 () Bool)

(assert (=> mapIsEmpty!51989 mapRes!51989))

(declare-fun b!1279773 () Bool)

(assert (=> b!1279773 (= e!731223 (and e!731224 mapRes!51989))))

(declare-fun condMapEmpty!51989 () Bool)

(declare-fun mapDefault!51989 () ValueCell!15914)

(assert (=> b!1279773 (= condMapEmpty!51989 (= (arr!40618 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15914)) mapDefault!51989)))))

(declare-fun b!1279774 () Bool)

(assert (=> b!1279774 (= e!731225 tp_is_empty!33625)))

(declare-fun b!1279775 () Bool)

(declare-fun res!850130 () Bool)

(assert (=> b!1279775 (=> (not res!850130) (not e!731222))))

(assert (=> b!1279775 (= res!850130 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41169 _keys!1741))))))

(declare-fun b!1279776 () Bool)

(declare-fun res!850129 () Bool)

(assert (=> b!1279776 (=> (not res!850129) (not e!731222))))

(declare-datatypes ((List!28878 0))(
  ( (Nil!28875) (Cons!28874 (h!30083 (_ BitVec 64)) (t!42410 List!28878)) )
))
(declare-fun arrayNoDuplicates!0 (array!84225 (_ BitVec 32) List!28878) Bool)

(assert (=> b!1279776 (= res!850129 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28875))))

(assert (= (and start!108438 res!850131) b!1279772))

(assert (= (and b!1279772 res!850132) b!1279770))

(assert (= (and b!1279770 res!850133) b!1279776))

(assert (= (and b!1279776 res!850129) b!1279775))

(assert (= (and b!1279775 res!850130) b!1279771))

(assert (= (and b!1279773 condMapEmpty!51989) mapIsEmpty!51989))

(assert (= (and b!1279773 (not condMapEmpty!51989)) mapNonEmpty!51989))

(get-info :version)

(assert (= (and mapNonEmpty!51989 ((_ is ValueCellFull!15914) mapValue!51989)) b!1279774))

(assert (= (and b!1279773 ((_ is ValueCellFull!15914) mapDefault!51989)) b!1279769))

(assert (= start!108438 b!1279773))

(declare-fun m!1174161 () Bool)

(assert (=> b!1279776 m!1174161))

(declare-fun m!1174163 () Bool)

(assert (=> b!1279771 m!1174163))

(assert (=> b!1279771 m!1174163))

(declare-fun m!1174165 () Bool)

(assert (=> b!1279771 m!1174165))

(declare-fun m!1174167 () Bool)

(assert (=> mapNonEmpty!51989 m!1174167))

(declare-fun m!1174169 () Bool)

(assert (=> start!108438 m!1174169))

(declare-fun m!1174171 () Bool)

(assert (=> start!108438 m!1174171))

(declare-fun m!1174173 () Bool)

(assert (=> start!108438 m!1174173))

(declare-fun m!1174175 () Bool)

(assert (=> b!1279770 m!1174175))

(check-sat (not start!108438) (not mapNonEmpty!51989) (not b_next!27985) (not b!1279771) b_and!46027 (not b!1279776) (not b!1279770) tp_is_empty!33625)
(check-sat b_and!46027 (not b_next!27985))
