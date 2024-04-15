; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109722 () Bool)

(assert start!109722)

(declare-fun b_free!29155 () Bool)

(declare-fun b_next!29155 () Bool)

(assert (=> start!109722 (= b_free!29155 (not b_next!29155))))

(declare-fun tp!102593 () Bool)

(declare-fun b_and!47239 () Bool)

(assert (=> start!109722 (= tp!102593 b_and!47239)))

(declare-fun b!1299572 () Bool)

(declare-fun e!741389 () Bool)

(assert (=> b!1299572 (= e!741389 (not true))))

(declare-datatypes ((V!51497 0))(
  ( (V!51498 (val!17472 Int)) )
))
(declare-datatypes ((tuple2!22582 0))(
  ( (tuple2!22583 (_1!11302 (_ BitVec 64)) (_2!11302 V!51497)) )
))
(declare-datatypes ((List!29701 0))(
  ( (Nil!29698) (Cons!29697 (h!30906 tuple2!22582) (t!43263 List!29701)) )
))
(declare-datatypes ((ListLongMap!20239 0))(
  ( (ListLongMap!20240 (toList!10135 List!29701)) )
))
(declare-fun lt!580928 () ListLongMap!20239)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8187 (ListLongMap!20239 (_ BitVec 64)) Bool)

(assert (=> b!1299572 (contains!8187 lt!580928 k0!1205)))

(declare-fun minValue!1387 () V!51497)

(declare-datatypes ((Unit!42863 0))(
  ( (Unit!42864) )
))
(declare-fun lt!580927 () Unit!42863)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!72 ((_ BitVec 64) (_ BitVec 64) V!51497 ListLongMap!20239) Unit!42863)

(assert (=> b!1299572 (= lt!580927 (lemmaInListMapAfterAddingDiffThenInBefore!72 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580928))))

(declare-fun zeroValue!1387 () V!51497)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16499 0))(
  ( (ValueCellFull!16499 (v!20077 V!51497)) (EmptyCell!16499) )
))
(declare-datatypes ((array!86497 0))(
  ( (array!86498 (arr!41747 (Array (_ BitVec 32) ValueCell!16499)) (size!42299 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86497)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86499 0))(
  ( (array!86500 (arr!41748 (Array (_ BitVec 32) (_ BitVec 64))) (size!42300 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86499)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4480 (ListLongMap!20239 tuple2!22582) ListLongMap!20239)

(declare-fun getCurrentListMapNoExtraKeys!6111 (array!86499 array!86497 (_ BitVec 32) (_ BitVec 32) V!51497 V!51497 (_ BitVec 32) Int) ListLongMap!20239)

(assert (=> b!1299572 (= lt!580928 (+!4480 (getCurrentListMapNoExtraKeys!6111 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1299573 () Bool)

(declare-fun res!863633 () Bool)

(assert (=> b!1299573 (=> (not res!863633) (not e!741389))))

(assert (=> b!1299573 (= res!863633 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42300 _keys!1741))))))

(declare-fun b!1299574 () Bool)

(declare-fun res!863635 () Bool)

(assert (=> b!1299574 (=> (not res!863635) (not e!741389))))

(assert (=> b!1299574 (= res!863635 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299575 () Bool)

(declare-fun res!863636 () Bool)

(assert (=> b!1299575 (=> (not res!863636) (not e!741389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86499 (_ BitVec 32)) Bool)

(assert (=> b!1299575 (= res!863636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299576 () Bool)

(declare-fun e!741392 () Bool)

(declare-fun e!741388 () Bool)

(declare-fun mapRes!53762 () Bool)

(assert (=> b!1299576 (= e!741392 (and e!741388 mapRes!53762))))

(declare-fun condMapEmpty!53762 () Bool)

(declare-fun mapDefault!53762 () ValueCell!16499)

(assert (=> b!1299576 (= condMapEmpty!53762 (= (arr!41747 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16499)) mapDefault!53762)))))

(declare-fun b!1299577 () Bool)

(declare-fun res!863629 () Bool)

(assert (=> b!1299577 (=> (not res!863629) (not e!741389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299577 (= res!863629 (validKeyInArray!0 (select (arr!41748 _keys!1741) from!2144)))))

(declare-fun b!1299578 () Bool)

(declare-fun e!741391 () Bool)

(declare-fun tp_is_empty!34795 () Bool)

(assert (=> b!1299578 (= e!741391 tp_is_empty!34795)))

(declare-fun b!1299579 () Bool)

(declare-fun res!863634 () Bool)

(assert (=> b!1299579 (=> (not res!863634) (not e!741389))))

(declare-fun getCurrentListMap!5050 (array!86499 array!86497 (_ BitVec 32) (_ BitVec 32) V!51497 V!51497 (_ BitVec 32) Int) ListLongMap!20239)

(assert (=> b!1299579 (= res!863634 (contains!8187 (getCurrentListMap!5050 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53762 () Bool)

(declare-fun tp!102594 () Bool)

(assert (=> mapNonEmpty!53762 (= mapRes!53762 (and tp!102594 e!741391))))

(declare-fun mapValue!53762 () ValueCell!16499)

(declare-fun mapRest!53762 () (Array (_ BitVec 32) ValueCell!16499))

(declare-fun mapKey!53762 () (_ BitVec 32))

(assert (=> mapNonEmpty!53762 (= (arr!41747 _values!1445) (store mapRest!53762 mapKey!53762 mapValue!53762))))

(declare-fun b!1299580 () Bool)

(declare-fun res!863630 () Bool)

(assert (=> b!1299580 (=> (not res!863630) (not e!741389))))

(assert (=> b!1299580 (= res!863630 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42300 _keys!1741))))))

(declare-fun b!1299581 () Bool)

(assert (=> b!1299581 (= e!741388 tp_is_empty!34795)))

(declare-fun res!863631 () Bool)

(assert (=> start!109722 (=> (not res!863631) (not e!741389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109722 (= res!863631 (validMask!0 mask!2175))))

(assert (=> start!109722 e!741389))

(assert (=> start!109722 tp_is_empty!34795))

(assert (=> start!109722 true))

(declare-fun array_inv!31751 (array!86497) Bool)

(assert (=> start!109722 (and (array_inv!31751 _values!1445) e!741392)))

(declare-fun array_inv!31752 (array!86499) Bool)

(assert (=> start!109722 (array_inv!31752 _keys!1741)))

(assert (=> start!109722 tp!102593))

(declare-fun mapIsEmpty!53762 () Bool)

(assert (=> mapIsEmpty!53762 mapRes!53762))

(declare-fun b!1299582 () Bool)

(declare-fun res!863632 () Bool)

(assert (=> b!1299582 (=> (not res!863632) (not e!741389))))

(assert (=> b!1299582 (= res!863632 (and (= (size!42299 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42300 _keys!1741) (size!42299 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299583 () Bool)

(declare-fun res!863637 () Bool)

(assert (=> b!1299583 (=> (not res!863637) (not e!741389))))

(declare-datatypes ((List!29702 0))(
  ( (Nil!29699) (Cons!29698 (h!30907 (_ BitVec 64)) (t!43264 List!29702)) )
))
(declare-fun arrayNoDuplicates!0 (array!86499 (_ BitVec 32) List!29702) Bool)

(assert (=> b!1299583 (= res!863637 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29699))))

(assert (= (and start!109722 res!863631) b!1299582))

(assert (= (and b!1299582 res!863632) b!1299575))

(assert (= (and b!1299575 res!863636) b!1299583))

(assert (= (and b!1299583 res!863637) b!1299573))

(assert (= (and b!1299573 res!863633) b!1299579))

(assert (= (and b!1299579 res!863634) b!1299580))

(assert (= (and b!1299580 res!863630) b!1299577))

(assert (= (and b!1299577 res!863629) b!1299574))

(assert (= (and b!1299574 res!863635) b!1299572))

(assert (= (and b!1299576 condMapEmpty!53762) mapIsEmpty!53762))

(assert (= (and b!1299576 (not condMapEmpty!53762)) mapNonEmpty!53762))

(get-info :version)

(assert (= (and mapNonEmpty!53762 ((_ is ValueCellFull!16499) mapValue!53762)) b!1299578))

(assert (= (and b!1299576 ((_ is ValueCellFull!16499) mapDefault!53762)) b!1299581))

(assert (= start!109722 b!1299576))

(declare-fun m!1190265 () Bool)

(assert (=> b!1299577 m!1190265))

(assert (=> b!1299577 m!1190265))

(declare-fun m!1190267 () Bool)

(assert (=> b!1299577 m!1190267))

(declare-fun m!1190269 () Bool)

(assert (=> mapNonEmpty!53762 m!1190269))

(declare-fun m!1190271 () Bool)

(assert (=> b!1299572 m!1190271))

(declare-fun m!1190273 () Bool)

(assert (=> b!1299572 m!1190273))

(declare-fun m!1190275 () Bool)

(assert (=> b!1299572 m!1190275))

(assert (=> b!1299572 m!1190275))

(declare-fun m!1190277 () Bool)

(assert (=> b!1299572 m!1190277))

(declare-fun m!1190279 () Bool)

(assert (=> b!1299575 m!1190279))

(declare-fun m!1190281 () Bool)

(assert (=> b!1299579 m!1190281))

(assert (=> b!1299579 m!1190281))

(declare-fun m!1190283 () Bool)

(assert (=> b!1299579 m!1190283))

(declare-fun m!1190285 () Bool)

(assert (=> start!109722 m!1190285))

(declare-fun m!1190287 () Bool)

(assert (=> start!109722 m!1190287))

(declare-fun m!1190289 () Bool)

(assert (=> start!109722 m!1190289))

(declare-fun m!1190291 () Bool)

(assert (=> b!1299583 m!1190291))

(check-sat (not b_next!29155) (not mapNonEmpty!53762) (not b!1299575) (not b!1299577) (not b!1299572) tp_is_empty!34795 (not b!1299579) (not start!109722) (not b!1299583) b_and!47239)
(check-sat b_and!47239 (not b_next!29155))
