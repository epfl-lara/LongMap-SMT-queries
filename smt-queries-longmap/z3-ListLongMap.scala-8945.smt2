; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108398 () Bool)

(assert start!108398)

(declare-fun b_free!27945 () Bool)

(declare-fun b_next!27945 () Bool)

(assert (=> start!108398 (= b_free!27945 (not b_next!27945))))

(declare-fun tp!98944 () Bool)

(declare-fun b_and!46005 () Bool)

(assert (=> start!108398 (= tp!98944 b_and!46005)))

(declare-fun mapNonEmpty!51929 () Bool)

(declare-fun mapRes!51929 () Bool)

(declare-fun tp!98945 () Bool)

(declare-fun e!730952 () Bool)

(assert (=> mapNonEmpty!51929 (= mapRes!51929 (and tp!98945 e!730952))))

(declare-datatypes ((V!49883 0))(
  ( (V!49884 (val!16867 Int)) )
))
(declare-datatypes ((ValueCell!15894 0))(
  ( (ValueCellFull!15894 (v!19467 V!49883)) (EmptyCell!15894) )
))
(declare-fun mapValue!51929 () ValueCell!15894)

(declare-fun mapKey!51929 () (_ BitVec 32))

(declare-datatypes ((array!84256 0))(
  ( (array!84257 (arr!40632 (Array (_ BitVec 32) ValueCell!15894)) (size!41182 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84256)

(declare-fun mapRest!51929 () (Array (_ BitVec 32) ValueCell!15894))

(assert (=> mapNonEmpty!51929 (= (arr!40632 _values!1445) (store mapRest!51929 mapKey!51929 mapValue!51929))))

(declare-fun b!1279344 () Bool)

(declare-fun res!849848 () Bool)

(declare-fun e!730954 () Bool)

(assert (=> b!1279344 (=> (not res!849848) (not e!730954))))

(declare-datatypes ((array!84258 0))(
  ( (array!84259 (arr!40633 (Array (_ BitVec 32) (_ BitVec 64))) (size!41183 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84258)

(declare-datatypes ((List!28778 0))(
  ( (Nil!28775) (Cons!28774 (h!29983 (_ BitVec 64)) (t!42318 List!28778)) )
))
(declare-fun arrayNoDuplicates!0 (array!84258 (_ BitVec 32) List!28778) Bool)

(assert (=> b!1279344 (= res!849848 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28775))))

(declare-fun b!1279345 () Bool)

(declare-fun res!849850 () Bool)

(assert (=> b!1279345 (=> (not res!849850) (not e!730954))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279345 (= res!849850 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41183 _keys!1741))))))

(declare-fun b!1279346 () Bool)

(declare-fun e!730953 () Bool)

(declare-fun tp_is_empty!33585 () Bool)

(assert (=> b!1279346 (= e!730953 tp_is_empty!33585)))

(declare-fun res!849847 () Bool)

(assert (=> start!108398 (=> (not res!849847) (not e!730954))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108398 (= res!849847 (validMask!0 mask!2175))))

(assert (=> start!108398 e!730954))

(assert (=> start!108398 tp_is_empty!33585))

(assert (=> start!108398 true))

(declare-fun e!730955 () Bool)

(declare-fun array_inv!30849 (array!84256) Bool)

(assert (=> start!108398 (and (array_inv!30849 _values!1445) e!730955)))

(declare-fun array_inv!30850 (array!84258) Bool)

(assert (=> start!108398 (array_inv!30850 _keys!1741)))

(assert (=> start!108398 tp!98944))

(declare-fun b!1279347 () Bool)

(declare-fun res!849849 () Bool)

(assert (=> b!1279347 (=> (not res!849849) (not e!730954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84258 (_ BitVec 32)) Bool)

(assert (=> b!1279347 (= res!849849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!51929 () Bool)

(assert (=> mapIsEmpty!51929 mapRes!51929))

(declare-fun b!1279348 () Bool)

(declare-fun res!849851 () Bool)

(assert (=> b!1279348 (=> (not res!849851) (not e!730954))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279348 (= res!849851 (and (= (size!41182 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41183 _keys!1741) (size!41182 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279349 () Bool)

(assert (=> b!1279349 (= e!730955 (and e!730953 mapRes!51929))))

(declare-fun condMapEmpty!51929 () Bool)

(declare-fun mapDefault!51929 () ValueCell!15894)

(assert (=> b!1279349 (= condMapEmpty!51929 (= (arr!40632 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15894)) mapDefault!51929)))))

(declare-fun b!1279350 () Bool)

(assert (=> b!1279350 (= e!730954 false)))

(declare-fun minValue!1387 () V!49883)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!49883)

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!575999 () Bool)

(declare-datatypes ((tuple2!21578 0))(
  ( (tuple2!21579 (_1!10800 (_ BitVec 64)) (_2!10800 V!49883)) )
))
(declare-datatypes ((List!28779 0))(
  ( (Nil!28776) (Cons!28775 (h!29984 tuple2!21578) (t!42319 List!28779)) )
))
(declare-datatypes ((ListLongMap!19235 0))(
  ( (ListLongMap!19236 (toList!9633 List!28779)) )
))
(declare-fun contains!7748 (ListLongMap!19235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4717 (array!84258 array!84256 (_ BitVec 32) (_ BitVec 32) V!49883 V!49883 (_ BitVec 32) Int) ListLongMap!19235)

(assert (=> b!1279350 (= lt!575999 (contains!7748 (getCurrentListMap!4717 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279351 () Bool)

(assert (=> b!1279351 (= e!730952 tp_is_empty!33585)))

(assert (= (and start!108398 res!849847) b!1279348))

(assert (= (and b!1279348 res!849851) b!1279347))

(assert (= (and b!1279347 res!849849) b!1279344))

(assert (= (and b!1279344 res!849848) b!1279345))

(assert (= (and b!1279345 res!849850) b!1279350))

(assert (= (and b!1279349 condMapEmpty!51929) mapIsEmpty!51929))

(assert (= (and b!1279349 (not condMapEmpty!51929)) mapNonEmpty!51929))

(get-info :version)

(assert (= (and mapNonEmpty!51929 ((_ is ValueCellFull!15894) mapValue!51929)) b!1279351))

(assert (= (and b!1279349 ((_ is ValueCellFull!15894) mapDefault!51929)) b!1279346))

(assert (= start!108398 b!1279349))

(declare-fun m!1174341 () Bool)

(assert (=> mapNonEmpty!51929 m!1174341))

(declare-fun m!1174343 () Bool)

(assert (=> b!1279347 m!1174343))

(declare-fun m!1174345 () Bool)

(assert (=> start!108398 m!1174345))

(declare-fun m!1174347 () Bool)

(assert (=> start!108398 m!1174347))

(declare-fun m!1174349 () Bool)

(assert (=> start!108398 m!1174349))

(declare-fun m!1174351 () Bool)

(assert (=> b!1279350 m!1174351))

(assert (=> b!1279350 m!1174351))

(declare-fun m!1174353 () Bool)

(assert (=> b!1279350 m!1174353))

(declare-fun m!1174355 () Bool)

(assert (=> b!1279344 m!1174355))

(check-sat (not b!1279347) (not mapNonEmpty!51929) (not b!1279350) (not b!1279344) (not b_next!27945) (not start!108398) b_and!46005 tp_is_empty!33585)
(check-sat b_and!46005 (not b_next!27945))
