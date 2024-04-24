; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108614 () Bool)

(assert start!108614)

(declare-fun b_free!27937 () Bool)

(declare-fun b_next!27937 () Bool)

(assert (=> start!108614 (= b_free!27937 (not b_next!27937))))

(declare-fun tp!98920 () Bool)

(declare-fun b_and!45999 () Bool)

(assert (=> start!108614 (= tp!98920 b_and!45999)))

(declare-fun res!850311 () Bool)

(declare-fun e!731738 () Bool)

(assert (=> start!108614 (=> (not res!850311) (not e!731738))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108614 (= res!850311 (validMask!0 mask!2175))))

(assert (=> start!108614 e!731738))

(declare-fun tp_is_empty!33577 () Bool)

(assert (=> start!108614 tp_is_empty!33577))

(assert (=> start!108614 true))

(declare-datatypes ((V!49873 0))(
  ( (V!49874 (val!16863 Int)) )
))
(declare-datatypes ((ValueCell!15890 0))(
  ( (ValueCellFull!15890 (v!19458 V!49873)) (EmptyCell!15890) )
))
(declare-datatypes ((array!84269 0))(
  ( (array!84270 (arr!40634 (Array (_ BitVec 32) ValueCell!15890)) (size!41185 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84269)

(declare-fun e!731740 () Bool)

(declare-fun array_inv!31045 (array!84269) Bool)

(assert (=> start!108614 (and (array_inv!31045 _values!1445) e!731740)))

(declare-datatypes ((array!84271 0))(
  ( (array!84272 (arr!40635 (Array (_ BitVec 32) (_ BitVec 64))) (size!41186 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84271)

(declare-fun array_inv!31046 (array!84271) Bool)

(assert (=> start!108614 (array_inv!31046 _keys!1741)))

(assert (=> start!108614 tp!98920))

(declare-fun b!1280553 () Bool)

(declare-fun e!731741 () Bool)

(declare-fun mapRes!51917 () Bool)

(assert (=> b!1280553 (= e!731740 (and e!731741 mapRes!51917))))

(declare-fun condMapEmpty!51917 () Bool)

(declare-fun mapDefault!51917 () ValueCell!15890)

(assert (=> b!1280553 (= condMapEmpty!51917 (= (arr!40634 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15890)) mapDefault!51917)))))

(declare-fun b!1280554 () Bool)

(declare-fun res!850309 () Bool)

(assert (=> b!1280554 (=> (not res!850309) (not e!731738))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280554 (= res!850309 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41186 _keys!1741))))))

(declare-fun b!1280555 () Bool)

(declare-fun e!731742 () Bool)

(assert (=> b!1280555 (= e!731742 tp_is_empty!33577)))

(declare-fun b!1280556 () Bool)

(declare-fun res!850310 () Bool)

(assert (=> b!1280556 (=> (not res!850310) (not e!731738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84271 (_ BitVec 32)) Bool)

(assert (=> b!1280556 (= res!850310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280557 () Bool)

(assert (=> b!1280557 (= e!731738 false)))

(declare-fun minValue!1387 () V!49873)

(declare-fun zeroValue!1387 () V!49873)

(declare-fun lt!576471 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21594 0))(
  ( (tuple2!21595 (_1!10808 (_ BitVec 64)) (_2!10808 V!49873)) )
))
(declare-datatypes ((List!28808 0))(
  ( (Nil!28805) (Cons!28804 (h!30022 tuple2!21594) (t!42340 List!28808)) )
))
(declare-datatypes ((ListLongMap!19259 0))(
  ( (ListLongMap!19260 (toList!9645 List!28808)) )
))
(declare-fun contains!7774 (ListLongMap!19259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4714 (array!84271 array!84269 (_ BitVec 32) (_ BitVec 32) V!49873 V!49873 (_ BitVec 32) Int) ListLongMap!19259)

(assert (=> b!1280557 (= lt!576471 (contains!7774 (getCurrentListMap!4714 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280558 () Bool)

(declare-fun res!850308 () Bool)

(assert (=> b!1280558 (=> (not res!850308) (not e!731738))))

(declare-datatypes ((List!28809 0))(
  ( (Nil!28806) (Cons!28805 (h!30023 (_ BitVec 64)) (t!42341 List!28809)) )
))
(declare-fun arrayNoDuplicates!0 (array!84271 (_ BitVec 32) List!28809) Bool)

(assert (=> b!1280558 (= res!850308 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28806))))

(declare-fun b!1280559 () Bool)

(declare-fun res!850307 () Bool)

(assert (=> b!1280559 (=> (not res!850307) (not e!731738))))

(assert (=> b!1280559 (= res!850307 (and (= (size!41185 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41186 _keys!1741) (size!41185 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280560 () Bool)

(assert (=> b!1280560 (= e!731741 tp_is_empty!33577)))

(declare-fun mapNonEmpty!51917 () Bool)

(declare-fun tp!98921 () Bool)

(assert (=> mapNonEmpty!51917 (= mapRes!51917 (and tp!98921 e!731742))))

(declare-fun mapKey!51917 () (_ BitVec 32))

(declare-fun mapRest!51917 () (Array (_ BitVec 32) ValueCell!15890))

(declare-fun mapValue!51917 () ValueCell!15890)

(assert (=> mapNonEmpty!51917 (= (arr!40634 _values!1445) (store mapRest!51917 mapKey!51917 mapValue!51917))))

(declare-fun mapIsEmpty!51917 () Bool)

(assert (=> mapIsEmpty!51917 mapRes!51917))

(assert (= (and start!108614 res!850311) b!1280559))

(assert (= (and b!1280559 res!850307) b!1280556))

(assert (= (and b!1280556 res!850310) b!1280558))

(assert (= (and b!1280558 res!850308) b!1280554))

(assert (= (and b!1280554 res!850309) b!1280557))

(assert (= (and b!1280553 condMapEmpty!51917) mapIsEmpty!51917))

(assert (= (and b!1280553 (not condMapEmpty!51917)) mapNonEmpty!51917))

(get-info :version)

(assert (= (and mapNonEmpty!51917 ((_ is ValueCellFull!15890) mapValue!51917)) b!1280555))

(assert (= (and b!1280553 ((_ is ValueCellFull!15890) mapDefault!51917)) b!1280560))

(assert (= start!108614 b!1280553))

(declare-fun m!1175889 () Bool)

(assert (=> start!108614 m!1175889))

(declare-fun m!1175891 () Bool)

(assert (=> start!108614 m!1175891))

(declare-fun m!1175893 () Bool)

(assert (=> start!108614 m!1175893))

(declare-fun m!1175895 () Bool)

(assert (=> b!1280556 m!1175895))

(declare-fun m!1175897 () Bool)

(assert (=> b!1280558 m!1175897))

(declare-fun m!1175899 () Bool)

(assert (=> b!1280557 m!1175899))

(assert (=> b!1280557 m!1175899))

(declare-fun m!1175901 () Bool)

(assert (=> b!1280557 m!1175901))

(declare-fun m!1175903 () Bool)

(assert (=> mapNonEmpty!51917 m!1175903))

(check-sat b_and!45999 (not start!108614) (not b!1280558) (not b_next!27937) (not mapNonEmpty!51917) (not b!1280556) tp_is_empty!33577 (not b!1280557))
(check-sat b_and!45999 (not b_next!27937))
