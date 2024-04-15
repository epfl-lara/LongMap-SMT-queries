; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20344 () Bool)

(assert start!20344)

(declare-fun b_free!4999 () Bool)

(declare-fun b_next!4999 () Bool)

(assert (=> start!20344 (= b_free!4999 (not b_next!4999))))

(declare-fun tp!18028 () Bool)

(declare-fun b_and!11719 () Bool)

(assert (=> start!20344 (= tp!18028 b_and!11719)))

(declare-fun b!200463 () Bool)

(declare-fun res!95542 () Bool)

(declare-fun e!131437 () Bool)

(assert (=> b!200463 (=> (not res!95542) (not e!131437))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200463 (= res!95542 (validKeyInArray!0 k0!843))))

(declare-fun b!200464 () Bool)

(declare-fun e!131436 () Bool)

(declare-fun e!131439 () Bool)

(assert (=> b!200464 (= e!131436 e!131439)))

(declare-fun res!95539 () Bool)

(assert (=> b!200464 (=> res!95539 e!131439)))

(assert (=> b!200464 (= res!95539 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6121 0))(
  ( (V!6122 (val!2472 Int)) )
))
(declare-datatypes ((tuple2!3710 0))(
  ( (tuple2!3711 (_1!1866 (_ BitVec 64)) (_2!1866 V!6121)) )
))
(declare-datatypes ((List!2634 0))(
  ( (Nil!2631) (Cons!2630 (h!3272 tuple2!3710) (t!7556 List!2634)) )
))
(declare-datatypes ((ListLongMap!2613 0))(
  ( (ListLongMap!2614 (toList!1322 List!2634)) )
))
(declare-fun lt!99097 () ListLongMap!2613)

(declare-fun lt!99094 () ListLongMap!2613)

(assert (=> b!200464 (= lt!99097 lt!99094)))

(declare-fun lt!99096 () ListLongMap!2613)

(declare-fun lt!99084 () tuple2!3710)

(declare-fun +!371 (ListLongMap!2613 tuple2!3710) ListLongMap!2613)

(assert (=> b!200464 (= lt!99094 (+!371 lt!99096 lt!99084))))

(declare-datatypes ((Unit!5994 0))(
  ( (Unit!5995) )
))
(declare-fun lt!99098 () Unit!5994)

(declare-fun v!520 () V!6121)

(declare-fun lt!99093 () ListLongMap!2613)

(declare-fun zeroValue!615 () V!6121)

(declare-fun addCommutativeForDiffKeys!81 (ListLongMap!2613 (_ BitVec 64) V!6121 (_ BitVec 64) V!6121) Unit!5994)

(assert (=> b!200464 (= lt!99098 (addCommutativeForDiffKeys!81 lt!99093 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99086 () ListLongMap!2613)

(declare-fun lt!99090 () tuple2!3710)

(assert (=> b!200464 (= lt!99086 (+!371 lt!99097 lt!99090))))

(declare-fun lt!99089 () ListLongMap!2613)

(declare-fun lt!99088 () tuple2!3710)

(assert (=> b!200464 (= lt!99097 (+!371 lt!99089 lt!99088))))

(declare-fun lt!99091 () ListLongMap!2613)

(declare-fun lt!99085 () ListLongMap!2613)

(assert (=> b!200464 (= lt!99091 lt!99085)))

(assert (=> b!200464 (= lt!99085 (+!371 lt!99096 lt!99090))))

(assert (=> b!200464 (= lt!99096 (+!371 lt!99093 lt!99088))))

(declare-fun lt!99083 () ListLongMap!2613)

(assert (=> b!200464 (= lt!99086 (+!371 (+!371 lt!99083 lt!99088) lt!99090))))

(declare-fun minValue!615 () V!6121)

(assert (=> b!200464 (= lt!99090 (tuple2!3711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200464 (= lt!99088 (tuple2!3711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200465 () Bool)

(declare-fun e!131440 () Bool)

(declare-fun tp_is_empty!4855 () Bool)

(assert (=> b!200465 (= e!131440 tp_is_empty!4855)))

(declare-fun b!200466 () Bool)

(assert (=> b!200466 (= e!131437 (not e!131436))))

(declare-fun res!95537 () Bool)

(assert (=> b!200466 (=> res!95537 e!131436)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200466 (= res!95537 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2084 0))(
  ( (ValueCellFull!2084 (v!4436 V!6121)) (EmptyCell!2084) )
))
(declare-datatypes ((array!8927 0))(
  ( (array!8928 (arr!4213 (Array (_ BitVec 32) ValueCell!2084)) (size!4539 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8927)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!8929 0))(
  ( (array!8930 (arr!4214 (Array (_ BitVec 32) (_ BitVec 64))) (size!4540 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8929)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!890 (array!8929 array!8927 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) Int) ListLongMap!2613)

(assert (=> b!200466 (= lt!99091 (getCurrentListMap!890 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99095 () array!8927)

(assert (=> b!200466 (= lt!99086 (getCurrentListMap!890 _keys!825 lt!99095 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200466 (and (= lt!99083 lt!99089) (= lt!99089 lt!99083))))

(assert (=> b!200466 (= lt!99089 (+!371 lt!99093 lt!99084))))

(assert (=> b!200466 (= lt!99084 (tuple2!3711 k0!843 v!520))))

(declare-fun lt!99087 () Unit!5994)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!49 (array!8929 array!8927 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) (_ BitVec 64) V!6121 (_ BitVec 32) Int) Unit!5994)

(assert (=> b!200466 (= lt!99087 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!49 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!300 (array!8929 array!8927 (_ BitVec 32) (_ BitVec 32) V!6121 V!6121 (_ BitVec 32) Int) ListLongMap!2613)

(assert (=> b!200466 (= lt!99083 (getCurrentListMapNoExtraKeys!300 _keys!825 lt!99095 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200466 (= lt!99095 (array!8928 (store (arr!4213 _values!649) i!601 (ValueCellFull!2084 v!520)) (size!4539 _values!649)))))

(assert (=> b!200466 (= lt!99093 (getCurrentListMapNoExtraKeys!300 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200467 () Bool)

(declare-fun res!95538 () Bool)

(assert (=> b!200467 (=> (not res!95538) (not e!131437))))

(assert (=> b!200467 (= res!95538 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4540 _keys!825))))))

(declare-fun mapIsEmpty!8351 () Bool)

(declare-fun mapRes!8351 () Bool)

(assert (=> mapIsEmpty!8351 mapRes!8351))

(declare-fun res!95543 () Bool)

(assert (=> start!20344 (=> (not res!95543) (not e!131437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20344 (= res!95543 (validMask!0 mask!1149))))

(assert (=> start!20344 e!131437))

(declare-fun e!131442 () Bool)

(declare-fun array_inv!2749 (array!8927) Bool)

(assert (=> start!20344 (and (array_inv!2749 _values!649) e!131442)))

(assert (=> start!20344 true))

(assert (=> start!20344 tp_is_empty!4855))

(declare-fun array_inv!2750 (array!8929) Bool)

(assert (=> start!20344 (array_inv!2750 _keys!825)))

(assert (=> start!20344 tp!18028))

(declare-fun b!200468 () Bool)

(declare-fun res!95540 () Bool)

(assert (=> b!200468 (=> (not res!95540) (not e!131437))))

(assert (=> b!200468 (= res!95540 (and (= (size!4539 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4540 _keys!825) (size!4539 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200469 () Bool)

(declare-fun res!95535 () Bool)

(assert (=> b!200469 (=> (not res!95535) (not e!131437))))

(declare-datatypes ((List!2635 0))(
  ( (Nil!2632) (Cons!2631 (h!3273 (_ BitVec 64)) (t!7557 List!2635)) )
))
(declare-fun arrayNoDuplicates!0 (array!8929 (_ BitVec 32) List!2635) Bool)

(assert (=> b!200469 (= res!95535 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2632))))

(declare-fun b!200470 () Bool)

(declare-fun res!95541 () Bool)

(assert (=> b!200470 (=> (not res!95541) (not e!131437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8929 (_ BitVec 32)) Bool)

(assert (=> b!200470 (= res!95541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200471 () Bool)

(assert (=> b!200471 (= e!131442 (and e!131440 mapRes!8351))))

(declare-fun condMapEmpty!8351 () Bool)

(declare-fun mapDefault!8351 () ValueCell!2084)

(assert (=> b!200471 (= condMapEmpty!8351 (= (arr!4213 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2084)) mapDefault!8351)))))

(declare-fun b!200472 () Bool)

(declare-fun e!131438 () Bool)

(assert (=> b!200472 (= e!131438 tp_is_empty!4855)))

(declare-fun mapNonEmpty!8351 () Bool)

(declare-fun tp!18029 () Bool)

(assert (=> mapNonEmpty!8351 (= mapRes!8351 (and tp!18029 e!131438))))

(declare-fun mapRest!8351 () (Array (_ BitVec 32) ValueCell!2084))

(declare-fun mapKey!8351 () (_ BitVec 32))

(declare-fun mapValue!8351 () ValueCell!2084)

(assert (=> mapNonEmpty!8351 (= (arr!4213 _values!649) (store mapRest!8351 mapKey!8351 mapValue!8351))))

(declare-fun b!200473 () Bool)

(declare-fun res!95536 () Bool)

(assert (=> b!200473 (=> (not res!95536) (not e!131437))))

(assert (=> b!200473 (= res!95536 (= (select (arr!4214 _keys!825) i!601) k0!843))))

(declare-fun b!200474 () Bool)

(assert (=> b!200474 (= e!131439 true)))

(assert (=> b!200474 (= (+!371 lt!99094 lt!99090) (+!371 lt!99085 lt!99084))))

(declare-fun lt!99092 () Unit!5994)

(assert (=> b!200474 (= lt!99092 (addCommutativeForDiffKeys!81 lt!99096 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20344 res!95543) b!200468))

(assert (= (and b!200468 res!95540) b!200470))

(assert (= (and b!200470 res!95541) b!200469))

(assert (= (and b!200469 res!95535) b!200467))

(assert (= (and b!200467 res!95538) b!200463))

(assert (= (and b!200463 res!95542) b!200473))

(assert (= (and b!200473 res!95536) b!200466))

(assert (= (and b!200466 (not res!95537)) b!200464))

(assert (= (and b!200464 (not res!95539)) b!200474))

(assert (= (and b!200471 condMapEmpty!8351) mapIsEmpty!8351))

(assert (= (and b!200471 (not condMapEmpty!8351)) mapNonEmpty!8351))

(get-info :version)

(assert (= (and mapNonEmpty!8351 ((_ is ValueCellFull!2084) mapValue!8351)) b!200472))

(assert (= (and b!200471 ((_ is ValueCellFull!2084) mapDefault!8351)) b!200465))

(assert (= start!20344 b!200471))

(declare-fun m!226551 () Bool)

(assert (=> b!200469 m!226551))

(declare-fun m!226553 () Bool)

(assert (=> b!200466 m!226553))

(declare-fun m!226555 () Bool)

(assert (=> b!200466 m!226555))

(declare-fun m!226557 () Bool)

(assert (=> b!200466 m!226557))

(declare-fun m!226559 () Bool)

(assert (=> b!200466 m!226559))

(declare-fun m!226561 () Bool)

(assert (=> b!200466 m!226561))

(declare-fun m!226563 () Bool)

(assert (=> b!200466 m!226563))

(declare-fun m!226565 () Bool)

(assert (=> b!200466 m!226565))

(declare-fun m!226567 () Bool)

(assert (=> start!20344 m!226567))

(declare-fun m!226569 () Bool)

(assert (=> start!20344 m!226569))

(declare-fun m!226571 () Bool)

(assert (=> start!20344 m!226571))

(declare-fun m!226573 () Bool)

(assert (=> b!200464 m!226573))

(declare-fun m!226575 () Bool)

(assert (=> b!200464 m!226575))

(declare-fun m!226577 () Bool)

(assert (=> b!200464 m!226577))

(declare-fun m!226579 () Bool)

(assert (=> b!200464 m!226579))

(declare-fun m!226581 () Bool)

(assert (=> b!200464 m!226581))

(declare-fun m!226583 () Bool)

(assert (=> b!200464 m!226583))

(assert (=> b!200464 m!226581))

(declare-fun m!226585 () Bool)

(assert (=> b!200464 m!226585))

(declare-fun m!226587 () Bool)

(assert (=> b!200464 m!226587))

(declare-fun m!226589 () Bool)

(assert (=> b!200470 m!226589))

(declare-fun m!226591 () Bool)

(assert (=> b!200473 m!226591))

(declare-fun m!226593 () Bool)

(assert (=> b!200474 m!226593))

(declare-fun m!226595 () Bool)

(assert (=> b!200474 m!226595))

(declare-fun m!226597 () Bool)

(assert (=> b!200474 m!226597))

(declare-fun m!226599 () Bool)

(assert (=> mapNonEmpty!8351 m!226599))

(declare-fun m!226601 () Bool)

(assert (=> b!200463 m!226601))

(check-sat tp_is_empty!4855 (not start!20344) (not mapNonEmpty!8351) (not b!200469) (not b!200466) (not b!200474) (not b!200470) (not b!200464) (not b!200463) b_and!11719 (not b_next!4999))
(check-sat b_and!11719 (not b_next!4999))
