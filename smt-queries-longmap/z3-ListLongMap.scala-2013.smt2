; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35088 () Bool)

(assert start!35088)

(declare-fun b_free!7747 () Bool)

(declare-fun b_next!7747 () Bool)

(assert (=> start!35088 (= b_free!7747 (not b_next!7747))))

(declare-fun tp!26825 () Bool)

(declare-fun b_and!14955 () Bool)

(assert (=> start!35088 (= tp!26825 b_and!14955)))

(declare-fun b!351585 () Bool)

(declare-fun e!215295 () Bool)

(declare-fun tp_is_empty!7699 () Bool)

(assert (=> b!351585 (= e!215295 tp_is_empty!7699)))

(declare-fun mapNonEmpty!13026 () Bool)

(declare-fun mapRes!13026 () Bool)

(declare-fun tp!26826 () Bool)

(assert (=> mapNonEmpty!13026 (= mapRes!13026 (and tp!26826 e!215295))))

(declare-datatypes ((V!11243 0))(
  ( (V!11244 (val!3894 Int)) )
))
(declare-datatypes ((ValueCell!3506 0))(
  ( (ValueCellFull!3506 (v!6077 V!11243)) (EmptyCell!3506) )
))
(declare-fun mapValue!13026 () ValueCell!3506)

(declare-fun mapRest!13026 () (Array (_ BitVec 32) ValueCell!3506))

(declare-fun mapKey!13026 () (_ BitVec 32))

(declare-datatypes ((array!18969 0))(
  ( (array!18970 (arr!8988 (Array (_ BitVec 32) ValueCell!3506)) (size!9341 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18969)

(assert (=> mapNonEmpty!13026 (= (arr!8988 _values!1525) (store mapRest!13026 mapKey!13026 mapValue!13026))))

(declare-fun b!351586 () Bool)

(declare-fun e!215293 () Bool)

(declare-fun lt!164754 () Bool)

(assert (=> b!351586 (= e!215293 lt!164754)))

(declare-datatypes ((Unit!10859 0))(
  ( (Unit!10860) )
))
(declare-fun lt!164757 () Unit!10859)

(declare-fun e!215294 () Unit!10859)

(assert (=> b!351586 (= lt!164757 e!215294)))

(declare-fun c!53426 () Bool)

(assert (=> b!351586 (= c!53426 lt!164754)))

(declare-datatypes ((array!18971 0))(
  ( (array!18972 (arr!8989 (Array (_ BitVec 32) (_ BitVec 64))) (size!9342 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18971)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351586 (= lt!164754 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!13026 () Bool)

(assert (=> mapIsEmpty!13026 mapRes!13026))

(declare-fun b!351587 () Bool)

(declare-fun Unit!10861 () Unit!10859)

(assert (=> b!351587 (= e!215294 Unit!10861)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!11243)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lt!164755 () Unit!10859)

(declare-fun minValue!1467 () V!11243)

(declare-fun lemmaArrayContainsKeyThenInListMap!331 (array!18971 array!18969 (_ BitVec 32) (_ BitVec 32) V!11243 V!11243 (_ BitVec 64) (_ BitVec 32) Int) Unit!10859)

(declare-fun arrayScanForKey!0 (array!18971 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351587 (= lt!164755 (lemmaArrayContainsKeyThenInListMap!331 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351587 false))

(declare-fun b!351588 () Bool)

(declare-fun res!195002 () Bool)

(declare-fun e!215298 () Bool)

(assert (=> b!351588 (=> (not res!195002) (not e!215298))))

(declare-datatypes ((List!5208 0))(
  ( (Nil!5205) (Cons!5204 (h!6060 (_ BitVec 64)) (t!10341 List!5208)) )
))
(declare-fun arrayNoDuplicates!0 (array!18971 (_ BitVec 32) List!5208) Bool)

(assert (=> b!351588 (= res!195002 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5205))))

(declare-fun b!351589 () Bool)

(declare-fun res!195001 () Bool)

(assert (=> b!351589 (=> (not res!195001) (not e!215298))))

(assert (=> b!351589 (= res!195001 (and (= (size!9341 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9342 _keys!1895) (size!9341 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195000 () Bool)

(assert (=> start!35088 (=> (not res!195000) (not e!215298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35088 (= res!195000 (validMask!0 mask!2385))))

(assert (=> start!35088 e!215298))

(assert (=> start!35088 true))

(assert (=> start!35088 tp_is_empty!7699))

(assert (=> start!35088 tp!26825))

(declare-fun e!215296 () Bool)

(declare-fun array_inv!6660 (array!18969) Bool)

(assert (=> start!35088 (and (array_inv!6660 _values!1525) e!215296)))

(declare-fun array_inv!6661 (array!18971) Bool)

(assert (=> start!35088 (array_inv!6661 _keys!1895)))

(declare-fun b!351590 () Bool)

(declare-fun res!194999 () Bool)

(assert (=> b!351590 (=> (not res!194999) (not e!215298))))

(declare-datatypes ((tuple2!5594 0))(
  ( (tuple2!5595 (_1!2808 (_ BitVec 64)) (_2!2808 V!11243)) )
))
(declare-datatypes ((List!5209 0))(
  ( (Nil!5206) (Cons!5205 (h!6061 tuple2!5594) (t!10342 List!5209)) )
))
(declare-datatypes ((ListLongMap!4497 0))(
  ( (ListLongMap!4498 (toList!2264 List!5209)) )
))
(declare-fun contains!2346 (ListLongMap!4497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1769 (array!18971 array!18969 (_ BitVec 32) (_ BitVec 32) V!11243 V!11243 (_ BitVec 32) Int) ListLongMap!4497)

(assert (=> b!351590 (= res!194999 (not (contains!2346 (getCurrentListMap!1769 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351591 () Bool)

(declare-fun Unit!10862 () Unit!10859)

(assert (=> b!351591 (= e!215294 Unit!10862)))

(declare-fun b!351592 () Bool)

(assert (=> b!351592 (= e!215298 e!215293)))

(declare-fun res!195005 () Bool)

(assert (=> b!351592 (=> (not res!195005) (not e!215293))))

(declare-datatypes ((SeekEntryResult!3462 0))(
  ( (MissingZero!3462 (index!16027 (_ BitVec 32))) (Found!3462 (index!16028 (_ BitVec 32))) (Intermediate!3462 (undefined!4274 Bool) (index!16029 (_ BitVec 32)) (x!35013 (_ BitVec 32))) (Undefined!3462) (MissingVacant!3462 (index!16030 (_ BitVec 32))) )
))
(declare-fun lt!164756 () SeekEntryResult!3462)

(get-info :version)

(assert (=> b!351592 (= res!195005 (and (not ((_ is Found!3462) lt!164756)) (not ((_ is MissingZero!3462) lt!164756)) ((_ is MissingVacant!3462) lt!164756)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18971 (_ BitVec 32)) SeekEntryResult!3462)

(assert (=> b!351592 (= lt!164756 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351593 () Bool)

(declare-fun res!195003 () Bool)

(assert (=> b!351593 (=> (not res!195003) (not e!215298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18971 (_ BitVec 32)) Bool)

(assert (=> b!351593 (= res!195003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351594 () Bool)

(declare-fun res!195004 () Bool)

(assert (=> b!351594 (=> (not res!195004) (not e!215298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351594 (= res!195004 (validKeyInArray!0 k0!1348))))

(declare-fun b!351595 () Bool)

(declare-fun e!215297 () Bool)

(assert (=> b!351595 (= e!215297 tp_is_empty!7699)))

(declare-fun b!351596 () Bool)

(assert (=> b!351596 (= e!215296 (and e!215297 mapRes!13026))))

(declare-fun condMapEmpty!13026 () Bool)

(declare-fun mapDefault!13026 () ValueCell!3506)

(assert (=> b!351596 (= condMapEmpty!13026 (= (arr!8988 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3506)) mapDefault!13026)))))

(assert (= (and start!35088 res!195000) b!351589))

(assert (= (and b!351589 res!195001) b!351593))

(assert (= (and b!351593 res!195003) b!351588))

(assert (= (and b!351588 res!195002) b!351594))

(assert (= (and b!351594 res!195004) b!351590))

(assert (= (and b!351590 res!194999) b!351592))

(assert (= (and b!351592 res!195005) b!351586))

(assert (= (and b!351586 c!53426) b!351587))

(assert (= (and b!351586 (not c!53426)) b!351591))

(assert (= (and b!351596 condMapEmpty!13026) mapIsEmpty!13026))

(assert (= (and b!351596 (not condMapEmpty!13026)) mapNonEmpty!13026))

(assert (= (and mapNonEmpty!13026 ((_ is ValueCellFull!3506) mapValue!13026)) b!351585))

(assert (= (and b!351596 ((_ is ValueCellFull!3506) mapDefault!13026)) b!351595))

(assert (= start!35088 b!351596))

(declare-fun m!350943 () Bool)

(assert (=> b!351590 m!350943))

(assert (=> b!351590 m!350943))

(declare-fun m!350945 () Bool)

(assert (=> b!351590 m!350945))

(declare-fun m!350947 () Bool)

(assert (=> mapNonEmpty!13026 m!350947))

(declare-fun m!350949 () Bool)

(assert (=> b!351586 m!350949))

(declare-fun m!350951 () Bool)

(assert (=> b!351588 m!350951))

(declare-fun m!350953 () Bool)

(assert (=> start!35088 m!350953))

(declare-fun m!350955 () Bool)

(assert (=> start!35088 m!350955))

(declare-fun m!350957 () Bool)

(assert (=> start!35088 m!350957))

(declare-fun m!350959 () Bool)

(assert (=> b!351587 m!350959))

(assert (=> b!351587 m!350959))

(declare-fun m!350961 () Bool)

(assert (=> b!351587 m!350961))

(declare-fun m!350963 () Bool)

(assert (=> b!351594 m!350963))

(declare-fun m!350965 () Bool)

(assert (=> b!351592 m!350965))

(declare-fun m!350967 () Bool)

(assert (=> b!351593 m!350967))

(check-sat tp_is_empty!7699 (not b!351593) (not b!351594) b_and!14955 (not b!351586) (not b!351590) (not b_next!7747) (not start!35088) (not mapNonEmpty!13026) (not b!351588) (not b!351587) (not b!351592))
(check-sat b_and!14955 (not b_next!7747))
