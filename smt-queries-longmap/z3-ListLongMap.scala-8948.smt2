; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108638 () Bool)

(assert start!108638)

(declare-fun b_free!27961 () Bool)

(declare-fun b_next!27961 () Bool)

(assert (=> start!108638 (= b_free!27961 (not b_next!27961))))

(declare-fun tp!98993 () Bool)

(declare-fun b_and!46023 () Bool)

(assert (=> start!108638 (= tp!98993 b_and!46023)))

(declare-fun b!1280841 () Bool)

(declare-fun res!850487 () Bool)

(declare-fun e!731919 () Bool)

(assert (=> b!1280841 (=> (not res!850487) (not e!731919))))

(declare-datatypes ((array!84315 0))(
  ( (array!84316 (arr!40657 (Array (_ BitVec 32) (_ BitVec 64))) (size!41208 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84315)

(declare-datatypes ((List!28828 0))(
  ( (Nil!28825) (Cons!28824 (h!30042 (_ BitVec 64)) (t!42360 List!28828)) )
))
(declare-fun arrayNoDuplicates!0 (array!84315 (_ BitVec 32) List!28828) Bool)

(assert (=> b!1280841 (= res!850487 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28825))))

(declare-fun b!1280842 () Bool)

(declare-fun res!850488 () Bool)

(assert (=> b!1280842 (=> (not res!850488) (not e!731919))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49905 0))(
  ( (V!49906 (val!16875 Int)) )
))
(declare-datatypes ((ValueCell!15902 0))(
  ( (ValueCellFull!15902 (v!19470 V!49905)) (EmptyCell!15902) )
))
(declare-datatypes ((array!84317 0))(
  ( (array!84318 (arr!40658 (Array (_ BitVec 32) ValueCell!15902)) (size!41209 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84317)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280842 (= res!850488 (and (= (size!41209 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41208 _keys!1741) (size!41209 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51953 () Bool)

(declare-fun mapRes!51953 () Bool)

(declare-fun tp!98992 () Bool)

(declare-fun e!731922 () Bool)

(assert (=> mapNonEmpty!51953 (= mapRes!51953 (and tp!98992 e!731922))))

(declare-fun mapValue!51953 () ValueCell!15902)

(declare-fun mapKey!51953 () (_ BitVec 32))

(declare-fun mapRest!51953 () (Array (_ BitVec 32) ValueCell!15902))

(assert (=> mapNonEmpty!51953 (= (arr!40658 _values!1445) (store mapRest!51953 mapKey!51953 mapValue!51953))))

(declare-fun b!1280843 () Bool)

(assert (=> b!1280843 (= e!731919 false)))

(declare-fun minValue!1387 () V!49905)

(declare-fun zeroValue!1387 () V!49905)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576507 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21616 0))(
  ( (tuple2!21617 (_1!10819 (_ BitVec 64)) (_2!10819 V!49905)) )
))
(declare-datatypes ((List!28829 0))(
  ( (Nil!28826) (Cons!28825 (h!30043 tuple2!21616) (t!42361 List!28829)) )
))
(declare-datatypes ((ListLongMap!19281 0))(
  ( (ListLongMap!19282 (toList!9656 List!28829)) )
))
(declare-fun contains!7785 (ListLongMap!19281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4725 (array!84315 array!84317 (_ BitVec 32) (_ BitVec 32) V!49905 V!49905 (_ BitVec 32) Int) ListLongMap!19281)

(assert (=> b!1280843 (= lt!576507 (contains!7785 (getCurrentListMap!4725 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280844 () Bool)

(declare-fun res!850489 () Bool)

(assert (=> b!1280844 (=> (not res!850489) (not e!731919))))

(assert (=> b!1280844 (= res!850489 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41208 _keys!1741))))))

(declare-fun b!1280845 () Bool)

(declare-fun e!731918 () Bool)

(declare-fun tp_is_empty!33601 () Bool)

(assert (=> b!1280845 (= e!731918 tp_is_empty!33601)))

(declare-fun b!1280846 () Bool)

(declare-fun res!850491 () Bool)

(assert (=> b!1280846 (=> (not res!850491) (not e!731919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84315 (_ BitVec 32)) Bool)

(assert (=> b!1280846 (= res!850491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280847 () Bool)

(declare-fun e!731920 () Bool)

(assert (=> b!1280847 (= e!731920 (and e!731918 mapRes!51953))))

(declare-fun condMapEmpty!51953 () Bool)

(declare-fun mapDefault!51953 () ValueCell!15902)

(assert (=> b!1280847 (= condMapEmpty!51953 (= (arr!40658 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15902)) mapDefault!51953)))))

(declare-fun b!1280848 () Bool)

(assert (=> b!1280848 (= e!731922 tp_is_empty!33601)))

(declare-fun res!850490 () Bool)

(assert (=> start!108638 (=> (not res!850490) (not e!731919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108638 (= res!850490 (validMask!0 mask!2175))))

(assert (=> start!108638 e!731919))

(assert (=> start!108638 tp_is_empty!33601))

(assert (=> start!108638 true))

(declare-fun array_inv!31061 (array!84317) Bool)

(assert (=> start!108638 (and (array_inv!31061 _values!1445) e!731920)))

(declare-fun array_inv!31062 (array!84315) Bool)

(assert (=> start!108638 (array_inv!31062 _keys!1741)))

(assert (=> start!108638 tp!98993))

(declare-fun mapIsEmpty!51953 () Bool)

(assert (=> mapIsEmpty!51953 mapRes!51953))

(assert (= (and start!108638 res!850490) b!1280842))

(assert (= (and b!1280842 res!850488) b!1280846))

(assert (= (and b!1280846 res!850491) b!1280841))

(assert (= (and b!1280841 res!850487) b!1280844))

(assert (= (and b!1280844 res!850489) b!1280843))

(assert (= (and b!1280847 condMapEmpty!51953) mapIsEmpty!51953))

(assert (= (and b!1280847 (not condMapEmpty!51953)) mapNonEmpty!51953))

(get-info :version)

(assert (= (and mapNonEmpty!51953 ((_ is ValueCellFull!15902) mapValue!51953)) b!1280848))

(assert (= (and b!1280847 ((_ is ValueCellFull!15902) mapDefault!51953)) b!1280845))

(assert (= start!108638 b!1280847))

(declare-fun m!1176081 () Bool)

(assert (=> b!1280846 m!1176081))

(declare-fun m!1176083 () Bool)

(assert (=> b!1280841 m!1176083))

(declare-fun m!1176085 () Bool)

(assert (=> start!108638 m!1176085))

(declare-fun m!1176087 () Bool)

(assert (=> start!108638 m!1176087))

(declare-fun m!1176089 () Bool)

(assert (=> start!108638 m!1176089))

(declare-fun m!1176091 () Bool)

(assert (=> mapNonEmpty!51953 m!1176091))

(declare-fun m!1176093 () Bool)

(assert (=> b!1280843 m!1176093))

(assert (=> b!1280843 m!1176093))

(declare-fun m!1176095 () Bool)

(assert (=> b!1280843 m!1176095))

(check-sat (not mapNonEmpty!51953) (not b!1280843) (not b_next!27961) (not start!108638) tp_is_empty!33601 b_and!46023 (not b!1280846) (not b!1280841))
(check-sat b_and!46023 (not b_next!27961))
