; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108716 () Bool)

(assert start!108716)

(declare-fun b_free!28039 () Bool)

(declare-fun b_next!28039 () Bool)

(assert (=> start!108716 (= b_free!28039 (not b_next!28039))))

(declare-fun tp!99226 () Bool)

(declare-fun b_and!46101 () Bool)

(assert (=> start!108716 (= tp!99226 b_and!46101)))

(declare-fun mapNonEmpty!52070 () Bool)

(declare-fun mapRes!52070 () Bool)

(declare-fun tp!99227 () Bool)

(declare-fun e!732505 () Bool)

(assert (=> mapNonEmpty!52070 (= mapRes!52070 (and tp!99227 e!732505))))

(declare-datatypes ((V!50009 0))(
  ( (V!50010 (val!16914 Int)) )
))
(declare-datatypes ((ValueCell!15941 0))(
  ( (ValueCellFull!15941 (v!19509 V!50009)) (EmptyCell!15941) )
))
(declare-fun mapRest!52070 () (Array (_ BitVec 32) ValueCell!15941))

(declare-fun mapKey!52070 () (_ BitVec 32))

(declare-datatypes ((array!84463 0))(
  ( (array!84464 (arr!40731 (Array (_ BitVec 32) ValueCell!15941)) (size!41282 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84463)

(declare-fun mapValue!52070 () ValueCell!15941)

(assert (=> mapNonEmpty!52070 (= (arr!40731 _values!1445) (store mapRest!52070 mapKey!52070 mapValue!52070))))

(declare-fun b!1281790 () Bool)

(declare-fun res!851090 () Bool)

(declare-fun e!732507 () Bool)

(assert (=> b!1281790 (=> (not res!851090) (not e!732507))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84465 0))(
  ( (array!84466 (arr!40732 (Array (_ BitVec 32) (_ BitVec 64))) (size!41283 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84465)

(assert (=> b!1281790 (= res!851090 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41283 _keys!1741)) (not (= (select (arr!40732 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281791 () Bool)

(declare-fun e!732504 () Bool)

(declare-fun tp_is_empty!33679 () Bool)

(assert (=> b!1281791 (= e!732504 tp_is_empty!33679)))

(declare-fun b!1281792 () Bool)

(declare-fun res!851088 () Bool)

(assert (=> b!1281792 (=> (not res!851088) (not e!732507))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281792 (= res!851088 (and (= (size!41282 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41283 _keys!1741) (size!41282 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281793 () Bool)

(declare-fun res!851087 () Bool)

(assert (=> b!1281793 (=> (not res!851087) (not e!732507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84465 (_ BitVec 32)) Bool)

(assert (=> b!1281793 (= res!851087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281794 () Bool)

(declare-fun e!732503 () Bool)

(assert (=> b!1281794 (= e!732503 (and e!732504 mapRes!52070))))

(declare-fun condMapEmpty!52070 () Bool)

(declare-fun mapDefault!52070 () ValueCell!15941)

(assert (=> b!1281794 (= condMapEmpty!52070 (= (arr!40731 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15941)) mapDefault!52070)))))

(declare-fun res!851091 () Bool)

(assert (=> start!108716 (=> (not res!851091) (not e!732507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108716 (= res!851091 (validMask!0 mask!2175))))

(assert (=> start!108716 e!732507))

(assert (=> start!108716 tp_is_empty!33679))

(assert (=> start!108716 true))

(declare-fun array_inv!31117 (array!84463) Bool)

(assert (=> start!108716 (and (array_inv!31117 _values!1445) e!732503)))

(declare-fun array_inv!31118 (array!84465) Bool)

(assert (=> start!108716 (array_inv!31118 _keys!1741)))

(assert (=> start!108716 tp!99226))

(declare-fun b!1281795 () Bool)

(declare-fun res!851085 () Bool)

(assert (=> b!1281795 (=> (not res!851085) (not e!732507))))

(declare-datatypes ((List!28882 0))(
  ( (Nil!28879) (Cons!28878 (h!30096 (_ BitVec 64)) (t!42414 List!28882)) )
))
(declare-fun arrayNoDuplicates!0 (array!84465 (_ BitVec 32) List!28882) Bool)

(assert (=> b!1281795 (= res!851085 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28879))))

(declare-fun b!1281796 () Bool)

(declare-fun res!851089 () Bool)

(assert (=> b!1281796 (=> (not res!851089) (not e!732507))))

(assert (=> b!1281796 (= res!851089 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41283 _keys!1741))))))

(declare-fun b!1281797 () Bool)

(assert (=> b!1281797 (= e!732505 tp_is_empty!33679)))

(declare-fun b!1281798 () Bool)

(assert (=> b!1281798 (= e!732507 (not true))))

(declare-fun minValue!1387 () V!50009)

(declare-fun zeroValue!1387 () V!50009)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21668 0))(
  ( (tuple2!21669 (_1!10845 (_ BitVec 64)) (_2!10845 V!50009)) )
))
(declare-datatypes ((List!28883 0))(
  ( (Nil!28880) (Cons!28879 (h!30097 tuple2!21668) (t!42415 List!28883)) )
))
(declare-datatypes ((ListLongMap!19333 0))(
  ( (ListLongMap!19334 (toList!9682 List!28883)) )
))
(declare-fun contains!7811 (ListLongMap!19333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4751 (array!84465 array!84463 (_ BitVec 32) (_ BitVec 32) V!50009 V!50009 (_ BitVec 32) Int) ListLongMap!19333)

(assert (=> b!1281798 (contains!7811 (getCurrentListMap!4751 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42360 0))(
  ( (Unit!42361) )
))
(declare-fun lt!576615 () Unit!42360)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!1 (array!84465 array!84463 (_ BitVec 32) (_ BitVec 32) V!50009 V!50009 (_ BitVec 64) (_ BitVec 32) Int) Unit!42360)

(assert (=> b!1281798 (= lt!576615 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!1 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281799 () Bool)

(declare-fun res!851086 () Bool)

(assert (=> b!1281799 (=> (not res!851086) (not e!732507))))

(assert (=> b!1281799 (= res!851086 (contains!7811 (getCurrentListMap!4751 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52070 () Bool)

(assert (=> mapIsEmpty!52070 mapRes!52070))

(assert (= (and start!108716 res!851091) b!1281792))

(assert (= (and b!1281792 res!851088) b!1281793))

(assert (= (and b!1281793 res!851087) b!1281795))

(assert (= (and b!1281795 res!851085) b!1281796))

(assert (= (and b!1281796 res!851089) b!1281799))

(assert (= (and b!1281799 res!851086) b!1281790))

(assert (= (and b!1281790 res!851090) b!1281798))

(assert (= (and b!1281794 condMapEmpty!52070) mapIsEmpty!52070))

(assert (= (and b!1281794 (not condMapEmpty!52070)) mapNonEmpty!52070))

(get-info :version)

(assert (= (and mapNonEmpty!52070 ((_ is ValueCellFull!15941) mapValue!52070)) b!1281797))

(assert (= (and b!1281794 ((_ is ValueCellFull!15941) mapDefault!52070)) b!1281791))

(assert (= start!108716 b!1281794))

(declare-fun m!1176705 () Bool)

(assert (=> b!1281790 m!1176705))

(declare-fun m!1176707 () Bool)

(assert (=> b!1281799 m!1176707))

(assert (=> b!1281799 m!1176707))

(declare-fun m!1176709 () Bool)

(assert (=> b!1281799 m!1176709))

(declare-fun m!1176711 () Bool)

(assert (=> mapNonEmpty!52070 m!1176711))

(declare-fun m!1176713 () Bool)

(assert (=> b!1281798 m!1176713))

(assert (=> b!1281798 m!1176713))

(declare-fun m!1176715 () Bool)

(assert (=> b!1281798 m!1176715))

(declare-fun m!1176717 () Bool)

(assert (=> b!1281798 m!1176717))

(declare-fun m!1176719 () Bool)

(assert (=> start!108716 m!1176719))

(declare-fun m!1176721 () Bool)

(assert (=> start!108716 m!1176721))

(declare-fun m!1176723 () Bool)

(assert (=> start!108716 m!1176723))

(declare-fun m!1176725 () Bool)

(assert (=> b!1281793 m!1176725))

(declare-fun m!1176727 () Bool)

(assert (=> b!1281795 m!1176727))

(check-sat (not start!108716) b_and!46101 (not b_next!28039) (not b!1281798) (not b!1281795) (not b!1281793) (not mapNonEmpty!52070) tp_is_empty!33679 (not b!1281799))
(check-sat b_and!46101 (not b_next!28039))
