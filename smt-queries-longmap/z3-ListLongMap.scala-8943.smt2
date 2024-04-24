; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108608 () Bool)

(assert start!108608)

(declare-fun b_free!27931 () Bool)

(declare-fun b_next!27931 () Bool)

(assert (=> start!108608 (= b_free!27931 (not b_next!27931))))

(declare-fun tp!98902 () Bool)

(declare-fun b_and!45993 () Bool)

(assert (=> start!108608 (= tp!98902 b_and!45993)))

(declare-fun b!1280481 () Bool)

(declare-fun res!850262 () Bool)

(declare-fun e!731696 () Bool)

(assert (=> b!1280481 (=> (not res!850262) (not e!731696))))

(declare-datatypes ((array!84257 0))(
  ( (array!84258 (arr!40628 (Array (_ BitVec 32) (_ BitVec 64))) (size!41179 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84257)

(declare-datatypes ((List!28803 0))(
  ( (Nil!28800) (Cons!28799 (h!30017 (_ BitVec 64)) (t!42335 List!28803)) )
))
(declare-fun arrayNoDuplicates!0 (array!84257 (_ BitVec 32) List!28803) Bool)

(assert (=> b!1280481 (= res!850262 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28800))))

(declare-fun mapNonEmpty!51908 () Bool)

(declare-fun mapRes!51908 () Bool)

(declare-fun tp!98903 () Bool)

(declare-fun e!731693 () Bool)

(assert (=> mapNonEmpty!51908 (= mapRes!51908 (and tp!98903 e!731693))))

(declare-fun mapKey!51908 () (_ BitVec 32))

(declare-datatypes ((V!49865 0))(
  ( (V!49866 (val!16860 Int)) )
))
(declare-datatypes ((ValueCell!15887 0))(
  ( (ValueCellFull!15887 (v!19455 V!49865)) (EmptyCell!15887) )
))
(declare-fun mapValue!51908 () ValueCell!15887)

(declare-datatypes ((array!84259 0))(
  ( (array!84260 (arr!40629 (Array (_ BitVec 32) ValueCell!15887)) (size!41180 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84259)

(declare-fun mapRest!51908 () (Array (_ BitVec 32) ValueCell!15887))

(assert (=> mapNonEmpty!51908 (= (arr!40629 _values!1445) (store mapRest!51908 mapKey!51908 mapValue!51908))))

(declare-fun b!1280482 () Bool)

(declare-fun res!850266 () Bool)

(assert (=> b!1280482 (=> (not res!850266) (not e!731696))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280482 (= res!850266 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41179 _keys!1741))))))

(declare-fun res!850265 () Bool)

(assert (=> start!108608 (=> (not res!850265) (not e!731696))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108608 (= res!850265 (validMask!0 mask!2175))))

(assert (=> start!108608 e!731696))

(declare-fun tp_is_empty!33571 () Bool)

(assert (=> start!108608 tp_is_empty!33571))

(assert (=> start!108608 true))

(declare-fun e!731697 () Bool)

(declare-fun array_inv!31039 (array!84259) Bool)

(assert (=> start!108608 (and (array_inv!31039 _values!1445) e!731697)))

(declare-fun array_inv!31040 (array!84257) Bool)

(assert (=> start!108608 (array_inv!31040 _keys!1741)))

(assert (=> start!108608 tp!98902))

(declare-fun b!1280483 () Bool)

(assert (=> b!1280483 (= e!731693 tp_is_empty!33571)))

(declare-fun b!1280484 () Bool)

(declare-fun res!850263 () Bool)

(assert (=> b!1280484 (=> (not res!850263) (not e!731696))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280484 (= res!850263 (and (= (size!41180 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41179 _keys!1741) (size!41180 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280485 () Bool)

(declare-fun e!731695 () Bool)

(assert (=> b!1280485 (= e!731695 tp_is_empty!33571)))

(declare-fun b!1280486 () Bool)

(declare-fun res!850264 () Bool)

(assert (=> b!1280486 (=> (not res!850264) (not e!731696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84257 (_ BitVec 32)) Bool)

(assert (=> b!1280486 (= res!850264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51908 () Bool)

(assert (=> mapIsEmpty!51908 mapRes!51908))

(declare-fun b!1280487 () Bool)

(assert (=> b!1280487 (= e!731697 (and e!731695 mapRes!51908))))

(declare-fun condMapEmpty!51908 () Bool)

(declare-fun mapDefault!51908 () ValueCell!15887)

(assert (=> b!1280487 (= condMapEmpty!51908 (= (arr!40629 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15887)) mapDefault!51908)))))

(declare-fun b!1280488 () Bool)

(assert (=> b!1280488 (= e!731696 false)))

(declare-fun minValue!1387 () V!49865)

(declare-fun zeroValue!1387 () V!49865)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576462 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21588 0))(
  ( (tuple2!21589 (_1!10805 (_ BitVec 64)) (_2!10805 V!49865)) )
))
(declare-datatypes ((List!28804 0))(
  ( (Nil!28801) (Cons!28800 (h!30018 tuple2!21588) (t!42336 List!28804)) )
))
(declare-datatypes ((ListLongMap!19253 0))(
  ( (ListLongMap!19254 (toList!9642 List!28804)) )
))
(declare-fun contains!7771 (ListLongMap!19253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4711 (array!84257 array!84259 (_ BitVec 32) (_ BitVec 32) V!49865 V!49865 (_ BitVec 32) Int) ListLongMap!19253)

(assert (=> b!1280488 (= lt!576462 (contains!7771 (getCurrentListMap!4711 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108608 res!850265) b!1280484))

(assert (= (and b!1280484 res!850263) b!1280486))

(assert (= (and b!1280486 res!850264) b!1280481))

(assert (= (and b!1280481 res!850262) b!1280482))

(assert (= (and b!1280482 res!850266) b!1280488))

(assert (= (and b!1280487 condMapEmpty!51908) mapIsEmpty!51908))

(assert (= (and b!1280487 (not condMapEmpty!51908)) mapNonEmpty!51908))

(get-info :version)

(assert (= (and mapNonEmpty!51908 ((_ is ValueCellFull!15887) mapValue!51908)) b!1280483))

(assert (= (and b!1280487 ((_ is ValueCellFull!15887) mapDefault!51908)) b!1280485))

(assert (= start!108608 b!1280487))

(declare-fun m!1175841 () Bool)

(assert (=> b!1280488 m!1175841))

(assert (=> b!1280488 m!1175841))

(declare-fun m!1175843 () Bool)

(assert (=> b!1280488 m!1175843))

(declare-fun m!1175845 () Bool)

(assert (=> b!1280481 m!1175845))

(declare-fun m!1175847 () Bool)

(assert (=> mapNonEmpty!51908 m!1175847))

(declare-fun m!1175849 () Bool)

(assert (=> b!1280486 m!1175849))

(declare-fun m!1175851 () Bool)

(assert (=> start!108608 m!1175851))

(declare-fun m!1175853 () Bool)

(assert (=> start!108608 m!1175853))

(declare-fun m!1175855 () Bool)

(assert (=> start!108608 m!1175855))

(check-sat tp_is_empty!33571 (not b_next!27931) (not b!1280488) (not b!1280486) (not b!1280481) (not start!108608) b_and!45993 (not mapNonEmpty!51908))
(check-sat b_and!45993 (not b_next!27931))
