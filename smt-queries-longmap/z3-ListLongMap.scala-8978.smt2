; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108630 () Bool)

(assert start!108630)

(declare-fun b_free!28143 () Bool)

(declare-fun b_next!28143 () Bool)

(assert (=> start!108630 (= b_free!28143 (not b_next!28143))))

(declare-fun tp!99544 () Bool)

(declare-fun b_and!46209 () Bool)

(assert (=> start!108630 (= tp!99544 b_and!46209)))

(declare-fun b!1282253 () Bool)

(declare-fun e!732635 () Bool)

(assert (=> b!1282253 (= e!732635 false)))

(declare-datatypes ((V!50147 0))(
  ( (V!50148 (val!16966 Int)) )
))
(declare-fun minValue!1387 () V!50147)

(declare-fun zeroValue!1387 () V!50147)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15993 0))(
  ( (ValueCellFull!15993 (v!19568 V!50147)) (EmptyCell!15993) )
))
(declare-datatypes ((array!84636 0))(
  ( (array!84637 (arr!40820 (Array (_ BitVec 32) ValueCell!15993)) (size!41370 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84636)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576511 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84638 0))(
  ( (array!84639 (arr!40821 (Array (_ BitVec 32) (_ BitVec 64))) (size!41371 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84638)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21724 0))(
  ( (tuple2!21725 (_1!10873 (_ BitVec 64)) (_2!10873 V!50147)) )
))
(declare-datatypes ((List!28918 0))(
  ( (Nil!28915) (Cons!28914 (h!30123 tuple2!21724) (t!42462 List!28918)) )
))
(declare-datatypes ((ListLongMap!19381 0))(
  ( (ListLongMap!19382 (toList!9706 List!28918)) )
))
(declare-fun contains!7823 (ListLongMap!19381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4790 (array!84638 array!84636 (_ BitVec 32) (_ BitVec 32) V!50147 V!50147 (_ BitVec 32) Int) ListLongMap!19381)

(assert (=> b!1282253 (= lt!576511 (contains!7823 (getCurrentListMap!4790 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282254 () Bool)

(declare-fun res!851721 () Bool)

(assert (=> b!1282254 (=> (not res!851721) (not e!732635))))

(declare-datatypes ((List!28919 0))(
  ( (Nil!28916) (Cons!28915 (h!30124 (_ BitVec 64)) (t!42463 List!28919)) )
))
(declare-fun arrayNoDuplicates!0 (array!84638 (_ BitVec 32) List!28919) Bool)

(assert (=> b!1282254 (= res!851721 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28916))))

(declare-fun res!851719 () Bool)

(assert (=> start!108630 (=> (not res!851719) (not e!732635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108630 (= res!851719 (validMask!0 mask!2175))))

(assert (=> start!108630 e!732635))

(declare-fun tp_is_empty!33783 () Bool)

(assert (=> start!108630 tp_is_empty!33783))

(assert (=> start!108630 true))

(declare-fun e!732634 () Bool)

(declare-fun array_inv!30969 (array!84636) Bool)

(assert (=> start!108630 (and (array_inv!30969 _values!1445) e!732634)))

(declare-fun array_inv!30970 (array!84638) Bool)

(assert (=> start!108630 (array_inv!30970 _keys!1741)))

(assert (=> start!108630 tp!99544))

(declare-fun b!1282255 () Bool)

(declare-fun e!732631 () Bool)

(assert (=> b!1282255 (= e!732631 tp_is_empty!33783)))

(declare-fun mapIsEmpty!52232 () Bool)

(declare-fun mapRes!52232 () Bool)

(assert (=> mapIsEmpty!52232 mapRes!52232))

(declare-fun b!1282256 () Bool)

(declare-fun res!851717 () Bool)

(assert (=> b!1282256 (=> (not res!851717) (not e!732635))))

(assert (=> b!1282256 (= res!851717 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41371 _keys!1741))))))

(declare-fun b!1282257 () Bool)

(declare-fun res!851720 () Bool)

(assert (=> b!1282257 (=> (not res!851720) (not e!732635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84638 (_ BitVec 32)) Bool)

(assert (=> b!1282257 (= res!851720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52232 () Bool)

(declare-fun tp!99545 () Bool)

(assert (=> mapNonEmpty!52232 (= mapRes!52232 (and tp!99545 e!732631))))

(declare-fun mapKey!52232 () (_ BitVec 32))

(declare-fun mapRest!52232 () (Array (_ BitVec 32) ValueCell!15993))

(declare-fun mapValue!52232 () ValueCell!15993)

(assert (=> mapNonEmpty!52232 (= (arr!40820 _values!1445) (store mapRest!52232 mapKey!52232 mapValue!52232))))

(declare-fun b!1282258 () Bool)

(declare-fun e!732632 () Bool)

(assert (=> b!1282258 (= e!732632 tp_is_empty!33783)))

(declare-fun b!1282259 () Bool)

(declare-fun res!851718 () Bool)

(assert (=> b!1282259 (=> (not res!851718) (not e!732635))))

(assert (=> b!1282259 (= res!851718 (and (= (size!41370 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41371 _keys!1741) (size!41370 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282260 () Bool)

(assert (=> b!1282260 (= e!732634 (and e!732632 mapRes!52232))))

(declare-fun condMapEmpty!52232 () Bool)

(declare-fun mapDefault!52232 () ValueCell!15993)

(assert (=> b!1282260 (= condMapEmpty!52232 (= (arr!40820 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15993)) mapDefault!52232)))))

(assert (= (and start!108630 res!851719) b!1282259))

(assert (= (and b!1282259 res!851718) b!1282257))

(assert (= (and b!1282257 res!851720) b!1282254))

(assert (= (and b!1282254 res!851721) b!1282256))

(assert (= (and b!1282256 res!851717) b!1282253))

(assert (= (and b!1282260 condMapEmpty!52232) mapIsEmpty!52232))

(assert (= (and b!1282260 (not condMapEmpty!52232)) mapNonEmpty!52232))

(get-info :version)

(assert (= (and mapNonEmpty!52232 ((_ is ValueCellFull!15993) mapValue!52232)) b!1282255))

(assert (= (and b!1282260 ((_ is ValueCellFull!15993) mapDefault!52232)) b!1282258))

(assert (= start!108630 b!1282260))

(declare-fun m!1176517 () Bool)

(assert (=> b!1282253 m!1176517))

(assert (=> b!1282253 m!1176517))

(declare-fun m!1176519 () Bool)

(assert (=> b!1282253 m!1176519))

(declare-fun m!1176521 () Bool)

(assert (=> start!108630 m!1176521))

(declare-fun m!1176523 () Bool)

(assert (=> start!108630 m!1176523))

(declare-fun m!1176525 () Bool)

(assert (=> start!108630 m!1176525))

(declare-fun m!1176527 () Bool)

(assert (=> b!1282257 m!1176527))

(declare-fun m!1176529 () Bool)

(assert (=> mapNonEmpty!52232 m!1176529))

(declare-fun m!1176531 () Bool)

(assert (=> b!1282254 m!1176531))

(check-sat (not start!108630) (not b!1282257) (not b_next!28143) b_and!46209 (not b!1282253) (not b!1282254) tp_is_empty!33783 (not mapNonEmpty!52232))
(check-sat b_and!46209 (not b_next!28143))
