; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20206 () Bool)

(assert start!20206)

(declare-fun b_free!4861 () Bool)

(declare-fun b_next!4861 () Bool)

(assert (=> start!20206 (= b_free!4861 (not b_next!4861))))

(declare-fun tp!17614 () Bool)

(declare-fun b_and!11581 () Bool)

(assert (=> start!20206 (= tp!17614 b_and!11581)))

(declare-fun b!198317 () Bool)

(declare-fun res!94010 () Bool)

(declare-fun e!130338 () Bool)

(assert (=> b!198317 (=> (not res!94010) (not e!130338))))

(declare-datatypes ((array!8659 0))(
  ( (array!8660 (arr!4079 (Array (_ BitVec 32) (_ BitVec 64))) (size!4405 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8659)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198317 (= res!94010 (= (select (arr!4079 _keys!825) i!601) k0!843))))

(declare-fun b!198318 () Bool)

(assert (=> b!198318 (= e!130338 false)))

(declare-datatypes ((V!5937 0))(
  ( (V!5938 (val!2403 Int)) )
))
(declare-datatypes ((tuple2!3604 0))(
  ( (tuple2!3605 (_1!1813 (_ BitVec 64)) (_2!1813 V!5937)) )
))
(declare-datatypes ((List!2537 0))(
  ( (Nil!2534) (Cons!2533 (h!3175 tuple2!3604) (t!7459 List!2537)) )
))
(declare-datatypes ((ListLongMap!2507 0))(
  ( (ListLongMap!2508 (toList!1269 List!2537)) )
))
(declare-fun lt!97741 () ListLongMap!2507)

(declare-datatypes ((ValueCell!2015 0))(
  ( (ValueCellFull!2015 (v!4367 V!5937)) (EmptyCell!2015) )
))
(declare-datatypes ((array!8661 0))(
  ( (array!8662 (arr!4080 (Array (_ BitVec 32) ValueCell!2015)) (size!4406 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8661)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5937)

(declare-fun zeroValue!615 () V!5937)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5937)

(declare-fun getCurrentListMapNoExtraKeys!249 (array!8659 array!8661 (_ BitVec 32) (_ BitVec 32) V!5937 V!5937 (_ BitVec 32) Int) ListLongMap!2507)

(assert (=> b!198318 (= lt!97741 (getCurrentListMapNoExtraKeys!249 _keys!825 (array!8662 (store (arr!4080 _values!649) i!601 (ValueCellFull!2015 v!520)) (size!4406 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97742 () ListLongMap!2507)

(assert (=> b!198318 (= lt!97742 (getCurrentListMapNoExtraKeys!249 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!94016 () Bool)

(assert (=> start!20206 (=> (not res!94016) (not e!130338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20206 (= res!94016 (validMask!0 mask!1149))))

(assert (=> start!20206 e!130338))

(declare-fun e!130336 () Bool)

(declare-fun array_inv!2653 (array!8661) Bool)

(assert (=> start!20206 (and (array_inv!2653 _values!649) e!130336)))

(assert (=> start!20206 true))

(declare-fun tp_is_empty!4717 () Bool)

(assert (=> start!20206 tp_is_empty!4717))

(declare-fun array_inv!2654 (array!8659) Bool)

(assert (=> start!20206 (array_inv!2654 _keys!825)))

(assert (=> start!20206 tp!17614))

(declare-fun b!198319 () Bool)

(declare-fun res!94013 () Bool)

(assert (=> b!198319 (=> (not res!94013) (not e!130338))))

(assert (=> b!198319 (= res!94013 (and (= (size!4406 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4405 _keys!825) (size!4406 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198320 () Bool)

(declare-fun e!130334 () Bool)

(declare-fun mapRes!8144 () Bool)

(assert (=> b!198320 (= e!130336 (and e!130334 mapRes!8144))))

(declare-fun condMapEmpty!8144 () Bool)

(declare-fun mapDefault!8144 () ValueCell!2015)

(assert (=> b!198320 (= condMapEmpty!8144 (= (arr!4080 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2015)) mapDefault!8144)))))

(declare-fun b!198321 () Bool)

(assert (=> b!198321 (= e!130334 tp_is_empty!4717)))

(declare-fun mapIsEmpty!8144 () Bool)

(assert (=> mapIsEmpty!8144 mapRes!8144))

(declare-fun mapNonEmpty!8144 () Bool)

(declare-fun tp!17615 () Bool)

(declare-fun e!130337 () Bool)

(assert (=> mapNonEmpty!8144 (= mapRes!8144 (and tp!17615 e!130337))))

(declare-fun mapKey!8144 () (_ BitVec 32))

(declare-fun mapRest!8144 () (Array (_ BitVec 32) ValueCell!2015))

(declare-fun mapValue!8144 () ValueCell!2015)

(assert (=> mapNonEmpty!8144 (= (arr!4080 _values!649) (store mapRest!8144 mapKey!8144 mapValue!8144))))

(declare-fun b!198322 () Bool)

(declare-fun res!94015 () Bool)

(assert (=> b!198322 (=> (not res!94015) (not e!130338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8659 (_ BitVec 32)) Bool)

(assert (=> b!198322 (= res!94015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198323 () Bool)

(declare-fun res!94014 () Bool)

(assert (=> b!198323 (=> (not res!94014) (not e!130338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198323 (= res!94014 (validKeyInArray!0 k0!843))))

(declare-fun b!198324 () Bool)

(declare-fun res!94011 () Bool)

(assert (=> b!198324 (=> (not res!94011) (not e!130338))))

(assert (=> b!198324 (= res!94011 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4405 _keys!825))))))

(declare-fun b!198325 () Bool)

(declare-fun res!94012 () Bool)

(assert (=> b!198325 (=> (not res!94012) (not e!130338))))

(declare-datatypes ((List!2538 0))(
  ( (Nil!2535) (Cons!2534 (h!3176 (_ BitVec 64)) (t!7460 List!2538)) )
))
(declare-fun arrayNoDuplicates!0 (array!8659 (_ BitVec 32) List!2538) Bool)

(assert (=> b!198325 (= res!94012 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2535))))

(declare-fun b!198326 () Bool)

(assert (=> b!198326 (= e!130337 tp_is_empty!4717)))

(assert (= (and start!20206 res!94016) b!198319))

(assert (= (and b!198319 res!94013) b!198322))

(assert (= (and b!198322 res!94015) b!198325))

(assert (= (and b!198325 res!94012) b!198324))

(assert (= (and b!198324 res!94011) b!198323))

(assert (= (and b!198323 res!94014) b!198317))

(assert (= (and b!198317 res!94010) b!198318))

(assert (= (and b!198320 condMapEmpty!8144) mapIsEmpty!8144))

(assert (= (and b!198320 (not condMapEmpty!8144)) mapNonEmpty!8144))

(get-info :version)

(assert (= (and mapNonEmpty!8144 ((_ is ValueCellFull!2015) mapValue!8144)) b!198326))

(assert (= (and b!198320 ((_ is ValueCellFull!2015) mapDefault!8144)) b!198321))

(assert (= start!20206 b!198320))

(declare-fun m!224451 () Bool)

(assert (=> start!20206 m!224451))

(declare-fun m!224453 () Bool)

(assert (=> start!20206 m!224453))

(declare-fun m!224455 () Bool)

(assert (=> start!20206 m!224455))

(declare-fun m!224457 () Bool)

(assert (=> b!198318 m!224457))

(declare-fun m!224459 () Bool)

(assert (=> b!198318 m!224459))

(declare-fun m!224461 () Bool)

(assert (=> b!198318 m!224461))

(declare-fun m!224463 () Bool)

(assert (=> b!198322 m!224463))

(declare-fun m!224465 () Bool)

(assert (=> b!198323 m!224465))

(declare-fun m!224467 () Bool)

(assert (=> b!198325 m!224467))

(declare-fun m!224469 () Bool)

(assert (=> b!198317 m!224469))

(declare-fun m!224471 () Bool)

(assert (=> mapNonEmpty!8144 m!224471))

(check-sat (not b!198318) b_and!11581 (not b!198325) tp_is_empty!4717 (not b_next!4861) (not start!20206) (not b!198322) (not b!198323) (not mapNonEmpty!8144))
(check-sat b_and!11581 (not b_next!4861))
