; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20548 () Bool)

(assert start!20548)

(declare-fun b_free!5203 () Bool)

(declare-fun b_next!5203 () Bool)

(assert (=> start!20548 (= b_free!5203 (not b_next!5203))))

(declare-fun tp!18640 () Bool)

(declare-fun b_and!11963 () Bool)

(assert (=> start!20548 (= tp!18640 b_and!11963)))

(declare-fun b!204338 () Bool)

(declare-fun res!98418 () Bool)

(declare-fun e!133706 () Bool)

(assert (=> b!204338 (=> (not res!98418) (not e!133706))))

(declare-datatypes ((array!9329 0))(
  ( (array!9330 (arr!4415 (Array (_ BitVec 32) (_ BitVec 64))) (size!4740 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9329)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6393 0))(
  ( (V!6394 (val!2574 Int)) )
))
(declare-datatypes ((ValueCell!2186 0))(
  ( (ValueCellFull!2186 (v!4545 V!6393)) (EmptyCell!2186) )
))
(declare-datatypes ((array!9331 0))(
  ( (array!9332 (arr!4416 (Array (_ BitVec 32) ValueCell!2186)) (size!4741 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9331)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!204338 (= res!98418 (and (= (size!4741 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4740 _keys!825) (size!4741 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204339 () Bool)

(declare-fun res!98417 () Bool)

(assert (=> b!204339 (=> (not res!98417) (not e!133706))))

(declare-datatypes ((List!2745 0))(
  ( (Nil!2742) (Cons!2741 (h!3383 (_ BitVec 64)) (t!7668 List!2745)) )
))
(declare-fun arrayNoDuplicates!0 (array!9329 (_ BitVec 32) List!2745) Bool)

(assert (=> b!204339 (= res!98417 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2742))))

(declare-fun b!204340 () Bool)

(declare-fun e!133707 () Bool)

(assert (=> b!204340 (= e!133707 (bvsle #b00000000000000000000000000000000 (size!4740 _keys!825)))))

(declare-datatypes ((tuple2!3850 0))(
  ( (tuple2!3851 (_1!1936 (_ BitVec 64)) (_2!1936 V!6393)) )
))
(declare-datatypes ((List!2746 0))(
  ( (Nil!2743) (Cons!2742 (h!3384 tuple2!3850) (t!7669 List!2746)) )
))
(declare-datatypes ((ListLongMap!2765 0))(
  ( (ListLongMap!2766 (toList!1398 List!2746)) )
))
(declare-fun lt!103532 () ListLongMap!2765)

(declare-fun lt!103533 () ListLongMap!2765)

(declare-fun lt!103536 () tuple2!3850)

(declare-fun +!452 (ListLongMap!2765 tuple2!3850) ListLongMap!2765)

(assert (=> b!204340 (= lt!103532 (+!452 lt!103533 lt!103536))))

(declare-fun lt!103535 () ListLongMap!2765)

(declare-datatypes ((Unit!6184 0))(
  ( (Unit!6185) )
))
(declare-fun lt!103538 () Unit!6184)

(declare-fun v!520 () V!6393)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6393)

(declare-fun addCommutativeForDiffKeys!162 (ListLongMap!2765 (_ BitVec 64) V!6393 (_ BitVec 64) V!6393) Unit!6184)

(assert (=> b!204340 (= lt!103538 (addCommutativeForDiffKeys!162 lt!103535 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204341 () Bool)

(declare-fun res!98416 () Bool)

(assert (=> b!204341 (=> (not res!98416) (not e!133706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204341 (= res!98416 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8657 () Bool)

(declare-fun mapRes!8657 () Bool)

(declare-fun tp!18641 () Bool)

(declare-fun e!133708 () Bool)

(assert (=> mapNonEmpty!8657 (= mapRes!8657 (and tp!18641 e!133708))))

(declare-fun mapValue!8657 () ValueCell!2186)

(declare-fun mapKey!8657 () (_ BitVec 32))

(declare-fun mapRest!8657 () (Array (_ BitVec 32) ValueCell!2186))

(assert (=> mapNonEmpty!8657 (= (arr!4416 _values!649) (store mapRest!8657 mapKey!8657 mapValue!8657))))

(declare-fun b!204342 () Bool)

(declare-fun res!98421 () Bool)

(assert (=> b!204342 (=> (not res!98421) (not e!133706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9329 (_ BitVec 32)) Bool)

(assert (=> b!204342 (= res!98421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204343 () Bool)

(declare-fun e!133703 () Bool)

(assert (=> b!204343 (= e!133703 e!133707)))

(declare-fun res!98414 () Bool)

(assert (=> b!204343 (=> res!98414 e!133707)))

(assert (=> b!204343 (= res!98414 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103531 () ListLongMap!2765)

(assert (=> b!204343 (= lt!103531 lt!103532)))

(declare-fun lt!103537 () ListLongMap!2765)

(declare-fun lt!103534 () tuple2!3850)

(assert (=> b!204343 (= lt!103532 (+!452 lt!103537 lt!103534))))

(declare-fun lt!103530 () ListLongMap!2765)

(assert (=> b!204343 (= lt!103530 lt!103533)))

(assert (=> b!204343 (= lt!103533 (+!452 lt!103535 lt!103534))))

(declare-fun lt!103527 () ListLongMap!2765)

(assert (=> b!204343 (= lt!103531 (+!452 lt!103527 lt!103534))))

(assert (=> b!204343 (= lt!103534 (tuple2!3851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204344 () Bool)

(declare-fun e!133704 () Bool)

(declare-fun tp_is_empty!5059 () Bool)

(assert (=> b!204344 (= e!133704 tp_is_empty!5059)))

(declare-fun b!204345 () Bool)

(declare-fun e!133705 () Bool)

(assert (=> b!204345 (= e!133705 (and e!133704 mapRes!8657))))

(declare-fun condMapEmpty!8657 () Bool)

(declare-fun mapDefault!8657 () ValueCell!2186)

(assert (=> b!204345 (= condMapEmpty!8657 (= (arr!4416 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2186)) mapDefault!8657)))))

(declare-fun b!204346 () Bool)

(declare-fun res!98415 () Bool)

(assert (=> b!204346 (=> (not res!98415) (not e!133706))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204346 (= res!98415 (= (select (arr!4415 _keys!825) i!601) k0!843))))

(declare-fun res!98422 () Bool)

(assert (=> start!20548 (=> (not res!98422) (not e!133706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20548 (= res!98422 (validMask!0 mask!1149))))

(assert (=> start!20548 e!133706))

(declare-fun array_inv!2887 (array!9331) Bool)

(assert (=> start!20548 (and (array_inv!2887 _values!649) e!133705)))

(assert (=> start!20548 true))

(assert (=> start!20548 tp_is_empty!5059))

(declare-fun array_inv!2888 (array!9329) Bool)

(assert (=> start!20548 (array_inv!2888 _keys!825)))

(assert (=> start!20548 tp!18640))

(declare-fun mapIsEmpty!8657 () Bool)

(assert (=> mapIsEmpty!8657 mapRes!8657))

(declare-fun b!204347 () Bool)

(assert (=> b!204347 (= e!133708 tp_is_empty!5059)))

(declare-fun b!204348 () Bool)

(declare-fun res!98420 () Bool)

(assert (=> b!204348 (=> (not res!98420) (not e!133706))))

(assert (=> b!204348 (= res!98420 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4740 _keys!825))))))

(declare-fun b!204349 () Bool)

(assert (=> b!204349 (= e!133706 (not e!133703))))

(declare-fun res!98419 () Bool)

(assert (=> b!204349 (=> res!98419 e!133703)))

(assert (=> b!204349 (= res!98419 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6393)

(declare-fun getCurrentListMap!975 (array!9329 array!9331 (_ BitVec 32) (_ BitVec 32) V!6393 V!6393 (_ BitVec 32) Int) ListLongMap!2765)

(assert (=> b!204349 (= lt!103530 (getCurrentListMap!975 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103528 () array!9331)

(assert (=> b!204349 (= lt!103531 (getCurrentListMap!975 _keys!825 lt!103528 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204349 (and (= lt!103527 lt!103537) (= lt!103537 lt!103527))))

(assert (=> b!204349 (= lt!103537 (+!452 lt!103535 lt!103536))))

(assert (=> b!204349 (= lt!103536 (tuple2!3851 k0!843 v!520))))

(declare-fun lt!103529 () Unit!6184)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!111 (array!9329 array!9331 (_ BitVec 32) (_ BitVec 32) V!6393 V!6393 (_ BitVec 32) (_ BitVec 64) V!6393 (_ BitVec 32) Int) Unit!6184)

(assert (=> b!204349 (= lt!103529 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!111 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!368 (array!9329 array!9331 (_ BitVec 32) (_ BitVec 32) V!6393 V!6393 (_ BitVec 32) Int) ListLongMap!2765)

(assert (=> b!204349 (= lt!103527 (getCurrentListMapNoExtraKeys!368 _keys!825 lt!103528 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204349 (= lt!103528 (array!9332 (store (arr!4416 _values!649) i!601 (ValueCellFull!2186 v!520)) (size!4741 _values!649)))))

(assert (=> b!204349 (= lt!103535 (getCurrentListMapNoExtraKeys!368 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20548 res!98422) b!204338))

(assert (= (and b!204338 res!98418) b!204342))

(assert (= (and b!204342 res!98421) b!204339))

(assert (= (and b!204339 res!98417) b!204348))

(assert (= (and b!204348 res!98420) b!204341))

(assert (= (and b!204341 res!98416) b!204346))

(assert (= (and b!204346 res!98415) b!204349))

(assert (= (and b!204349 (not res!98419)) b!204343))

(assert (= (and b!204343 (not res!98414)) b!204340))

(assert (= (and b!204345 condMapEmpty!8657) mapIsEmpty!8657))

(assert (= (and b!204345 (not condMapEmpty!8657)) mapNonEmpty!8657))

(get-info :version)

(assert (= (and mapNonEmpty!8657 ((_ is ValueCellFull!2186) mapValue!8657)) b!204347))

(assert (= (and b!204345 ((_ is ValueCellFull!2186) mapDefault!8657)) b!204344))

(assert (= start!20548 b!204345))

(declare-fun m!231993 () Bool)

(assert (=> b!204342 m!231993))

(declare-fun m!231995 () Bool)

(assert (=> b!204340 m!231995))

(declare-fun m!231997 () Bool)

(assert (=> b!204340 m!231997))

(declare-fun m!231999 () Bool)

(assert (=> b!204349 m!231999))

(declare-fun m!232001 () Bool)

(assert (=> b!204349 m!232001))

(declare-fun m!232003 () Bool)

(assert (=> b!204349 m!232003))

(declare-fun m!232005 () Bool)

(assert (=> b!204349 m!232005))

(declare-fun m!232007 () Bool)

(assert (=> b!204349 m!232007))

(declare-fun m!232009 () Bool)

(assert (=> b!204349 m!232009))

(declare-fun m!232011 () Bool)

(assert (=> b!204349 m!232011))

(declare-fun m!232013 () Bool)

(assert (=> b!204343 m!232013))

(declare-fun m!232015 () Bool)

(assert (=> b!204343 m!232015))

(declare-fun m!232017 () Bool)

(assert (=> b!204343 m!232017))

(declare-fun m!232019 () Bool)

(assert (=> start!20548 m!232019))

(declare-fun m!232021 () Bool)

(assert (=> start!20548 m!232021))

(declare-fun m!232023 () Bool)

(assert (=> start!20548 m!232023))

(declare-fun m!232025 () Bool)

(assert (=> b!204341 m!232025))

(declare-fun m!232027 () Bool)

(assert (=> b!204339 m!232027))

(declare-fun m!232029 () Bool)

(assert (=> mapNonEmpty!8657 m!232029))

(declare-fun m!232031 () Bool)

(assert (=> b!204346 m!232031))

(check-sat (not b_next!5203) tp_is_empty!5059 (not start!20548) (not b!204342) (not mapNonEmpty!8657) (not b!204339) b_and!11963 (not b!204343) (not b!204340) (not b!204341) (not b!204349))
(check-sat b_and!11963 (not b_next!5203))
