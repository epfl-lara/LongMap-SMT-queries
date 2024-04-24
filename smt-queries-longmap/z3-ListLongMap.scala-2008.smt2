; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35014 () Bool)

(assert start!35014)

(declare-fun b_free!7717 () Bool)

(declare-fun b_next!7717 () Bool)

(assert (=> start!35014 (= b_free!7717 (not b_next!7717))))

(declare-fun tp!26730 () Bool)

(declare-fun b_and!14961 () Bool)

(assert (=> start!35014 (= tp!26730 b_and!14961)))

(declare-fun b!351021 () Bool)

(declare-fun res!194657 () Bool)

(declare-fun e!214977 () Bool)

(assert (=> b!351021 (=> (not res!194657) (not e!214977))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351021 (= res!194657 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12975 () Bool)

(declare-fun mapRes!12975 () Bool)

(declare-fun tp!26729 () Bool)

(declare-fun e!214973 () Bool)

(assert (=> mapNonEmpty!12975 (= mapRes!12975 (and tp!26729 e!214973))))

(declare-datatypes ((V!11203 0))(
  ( (V!11204 (val!3879 Int)) )
))
(declare-datatypes ((ValueCell!3491 0))(
  ( (ValueCellFull!3491 (v!6067 V!11203)) (EmptyCell!3491) )
))
(declare-fun mapValue!12975 () ValueCell!3491)

(declare-fun mapKey!12975 () (_ BitVec 32))

(declare-fun mapRest!12975 () (Array (_ BitVec 32) ValueCell!3491))

(declare-datatypes ((array!18914 0))(
  ( (array!18915 (arr!8962 (Array (_ BitVec 32) ValueCell!3491)) (size!9314 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18914)

(assert (=> mapNonEmpty!12975 (= (arr!8962 _values!1525) (store mapRest!12975 mapKey!12975 mapValue!12975))))

(declare-fun b!351022 () Bool)

(declare-fun res!194659 () Bool)

(declare-fun e!214976 () Bool)

(assert (=> b!351022 (=> (not res!194659) (not e!214976))))

(declare-datatypes ((array!18916 0))(
  ( (array!18917 (arr!8963 (Array (_ BitVec 32) (_ BitVec 64))) (size!9315 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18916)

(declare-fun arrayContainsKey!0 (array!18916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351022 (= res!194659 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351024 () Bool)

(assert (=> b!351024 (= e!214977 e!214976)))

(declare-fun res!194661 () Bool)

(assert (=> b!351024 (=> (not res!194661) (not e!214976))))

(declare-datatypes ((SeekEntryResult!3405 0))(
  ( (MissingZero!3405 (index!15799 (_ BitVec 32))) (Found!3405 (index!15800 (_ BitVec 32))) (Intermediate!3405 (undefined!4217 Bool) (index!15801 (_ BitVec 32)) (x!34898 (_ BitVec 32))) (Undefined!3405) (MissingVacant!3405 (index!15802 (_ BitVec 32))) )
))
(declare-fun lt!164715 () SeekEntryResult!3405)

(get-info :version)

(assert (=> b!351024 (= res!194661 (and (not ((_ is Found!3405) lt!164715)) (not ((_ is MissingZero!3405) lt!164715)) ((_ is MissingVacant!3405) lt!164715)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18916 (_ BitVec 32)) SeekEntryResult!3405)

(assert (=> b!351024 (= lt!164715 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351025 () Bool)

(declare-fun res!194660 () Bool)

(assert (=> b!351025 (=> (not res!194660) (not e!214977))))

(declare-fun zeroValue!1467 () V!11203)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11203)

(declare-datatypes ((tuple2!5514 0))(
  ( (tuple2!5515 (_1!2768 (_ BitVec 64)) (_2!2768 V!11203)) )
))
(declare-datatypes ((List!5120 0))(
  ( (Nil!5117) (Cons!5116 (h!5972 tuple2!5514) (t!10250 List!5120)) )
))
(declare-datatypes ((ListLongMap!4429 0))(
  ( (ListLongMap!4430 (toList!2230 List!5120)) )
))
(declare-fun contains!2318 (ListLongMap!4429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1758 (array!18916 array!18914 (_ BitVec 32) (_ BitVec 32) V!11203 V!11203 (_ BitVec 32) Int) ListLongMap!4429)

(assert (=> b!351025 (= res!194660 (not (contains!2318 (getCurrentListMap!1758 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351026 () Bool)

(declare-fun tp_is_empty!7669 () Bool)

(assert (=> b!351026 (= e!214973 tp_is_empty!7669)))

(declare-fun b!351027 () Bool)

(assert (=> b!351027 (= e!214976 false)))

(declare-fun lt!164716 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18916 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351027 (= lt!164716 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194654 () Bool)

(assert (=> start!35014 (=> (not res!194654) (not e!214977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35014 (= res!194654 (validMask!0 mask!2385))))

(assert (=> start!35014 e!214977))

(assert (=> start!35014 true))

(assert (=> start!35014 tp_is_empty!7669))

(assert (=> start!35014 tp!26730))

(declare-fun e!214974 () Bool)

(declare-fun array_inv!6620 (array!18914) Bool)

(assert (=> start!35014 (and (array_inv!6620 _values!1525) e!214974)))

(declare-fun array_inv!6621 (array!18916) Bool)

(assert (=> start!35014 (array_inv!6621 _keys!1895)))

(declare-fun b!351023 () Bool)

(declare-fun res!194658 () Bool)

(assert (=> b!351023 (=> (not res!194658) (not e!214977))))

(declare-datatypes ((List!5121 0))(
  ( (Nil!5118) (Cons!5117 (h!5973 (_ BitVec 64)) (t!10251 List!5121)) )
))
(declare-fun arrayNoDuplicates!0 (array!18916 (_ BitVec 32) List!5121) Bool)

(assert (=> b!351023 (= res!194658 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5118))))

(declare-fun mapIsEmpty!12975 () Bool)

(assert (=> mapIsEmpty!12975 mapRes!12975))

(declare-fun b!351028 () Bool)

(declare-fun e!214972 () Bool)

(assert (=> b!351028 (= e!214974 (and e!214972 mapRes!12975))))

(declare-fun condMapEmpty!12975 () Bool)

(declare-fun mapDefault!12975 () ValueCell!3491)

(assert (=> b!351028 (= condMapEmpty!12975 (= (arr!8962 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3491)) mapDefault!12975)))))

(declare-fun b!351029 () Bool)

(declare-fun res!194655 () Bool)

(assert (=> b!351029 (=> (not res!194655) (not e!214977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18916 (_ BitVec 32)) Bool)

(assert (=> b!351029 (= res!194655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351030 () Bool)

(declare-fun res!194656 () Bool)

(assert (=> b!351030 (=> (not res!194656) (not e!214977))))

(assert (=> b!351030 (= res!194656 (and (= (size!9314 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9315 _keys!1895) (size!9314 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351031 () Bool)

(assert (=> b!351031 (= e!214972 tp_is_empty!7669)))

(assert (= (and start!35014 res!194654) b!351030))

(assert (= (and b!351030 res!194656) b!351029))

(assert (= (and b!351029 res!194655) b!351023))

(assert (= (and b!351023 res!194658) b!351021))

(assert (= (and b!351021 res!194657) b!351025))

(assert (= (and b!351025 res!194660) b!351024))

(assert (= (and b!351024 res!194661) b!351022))

(assert (= (and b!351022 res!194659) b!351027))

(assert (= (and b!351028 condMapEmpty!12975) mapIsEmpty!12975))

(assert (= (and b!351028 (not condMapEmpty!12975)) mapNonEmpty!12975))

(assert (= (and mapNonEmpty!12975 ((_ is ValueCellFull!3491) mapValue!12975)) b!351026))

(assert (= (and b!351028 ((_ is ValueCellFull!3491) mapDefault!12975)) b!351031))

(assert (= start!35014 b!351028))

(declare-fun m!351321 () Bool)

(assert (=> start!35014 m!351321))

(declare-fun m!351323 () Bool)

(assert (=> start!35014 m!351323))

(declare-fun m!351325 () Bool)

(assert (=> start!35014 m!351325))

(declare-fun m!351327 () Bool)

(assert (=> b!351021 m!351327))

(declare-fun m!351329 () Bool)

(assert (=> b!351024 m!351329))

(declare-fun m!351331 () Bool)

(assert (=> b!351029 m!351331))

(declare-fun m!351333 () Bool)

(assert (=> b!351022 m!351333))

(declare-fun m!351335 () Bool)

(assert (=> b!351023 m!351335))

(declare-fun m!351337 () Bool)

(assert (=> mapNonEmpty!12975 m!351337))

(declare-fun m!351339 () Bool)

(assert (=> b!351027 m!351339))

(declare-fun m!351341 () Bool)

(assert (=> b!351025 m!351341))

(assert (=> b!351025 m!351341))

(declare-fun m!351343 () Bool)

(assert (=> b!351025 m!351343))

(check-sat (not b!351023) b_and!14961 (not mapNonEmpty!12975) (not b!351025) (not b_next!7717) (not b!351024) (not b!351022) (not b!351021) (not start!35014) (not b!351027) (not b!351029) tp_is_empty!7669)
(check-sat b_and!14961 (not b_next!7717))
