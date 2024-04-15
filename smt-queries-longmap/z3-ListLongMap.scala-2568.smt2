; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39212 () Bool)

(assert start!39212)

(declare-fun b_free!9493 () Bool)

(declare-fun b_next!9493 () Bool)

(assert (=> start!39212 (= b_free!9493 (not b_next!9493))))

(declare-fun tp!34007 () Bool)

(declare-fun b_and!16853 () Bool)

(assert (=> start!39212 (= tp!34007 b_and!16853)))

(declare-datatypes ((V!15299 0))(
  ( (V!15300 (val!5367 Int)) )
))
(declare-fun minValue!515 () V!15299)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25139 0))(
  ( (array!25140 (arr!12019 (Array (_ BitVec 32) (_ BitVec 64))) (size!12372 (_ BitVec 32))) )
))
(declare-fun lt!189610 () array!25139)

(declare-fun zeroValue!515 () V!15299)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25139)

(declare-datatypes ((tuple2!6960 0))(
  ( (tuple2!6961 (_1!3491 (_ BitVec 64)) (_2!3491 V!15299)) )
))
(declare-datatypes ((List!6975 0))(
  ( (Nil!6972) (Cons!6971 (h!7827 tuple2!6960) (t!12140 List!6975)) )
))
(declare-datatypes ((ListLongMap!5863 0))(
  ( (ListLongMap!5864 (toList!2947 List!6975)) )
))
(declare-fun call!28632 () ListLongMap!5863)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54882 () Bool)

(declare-datatypes ((ValueCell!4979 0))(
  ( (ValueCellFull!4979 (v!7608 V!15299)) (EmptyCell!4979) )
))
(declare-datatypes ((array!25141 0))(
  ( (array!25142 (arr!12020 (Array (_ BitVec 32) ValueCell!4979)) (size!12373 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25141)

(declare-fun bm!28629 () Bool)

(declare-fun lt!189611 () array!25141)

(declare-fun getCurrentListMapNoExtraKeys!1160 (array!25139 array!25141 (_ BitVec 32) (_ BitVec 32) V!15299 V!15299 (_ BitVec 32) Int) ListLongMap!5863)

(assert (=> bm!28629 (= call!28632 (getCurrentListMapNoExtraKeys!1160 (ite c!54882 _keys!709 lt!189610) (ite c!54882 _values!549 lt!189611) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413594 () Bool)

(declare-fun res!240426 () Bool)

(declare-fun e!247254 () Bool)

(assert (=> b!413594 (=> (not res!240426) (not e!247254))))

(assert (=> b!413594 (= res!240426 (and (= (size!12373 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12372 _keys!709) (size!12373 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413595 () Bool)

(declare-fun e!247247 () Bool)

(declare-fun call!28633 () ListLongMap!5863)

(assert (=> b!413595 (= e!247247 (= call!28632 call!28633))))

(declare-fun b!413596 () Bool)

(declare-fun res!240423 () Bool)

(assert (=> b!413596 (=> (not res!240423) (not e!247254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413596 (= res!240423 (validMask!0 mask!1025))))

(declare-fun b!413597 () Bool)

(declare-fun e!247251 () Bool)

(declare-fun e!247250 () Bool)

(declare-fun mapRes!17589 () Bool)

(assert (=> b!413597 (= e!247251 (and e!247250 mapRes!17589))))

(declare-fun condMapEmpty!17589 () Bool)

(declare-fun mapDefault!17589 () ValueCell!4979)

(assert (=> b!413597 (= condMapEmpty!17589 (= (arr!12020 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4979)) mapDefault!17589)))))

(declare-fun b!413598 () Bool)

(declare-fun e!247249 () Bool)

(declare-fun e!247253 () Bool)

(assert (=> b!413598 (= e!247249 e!247253)))

(declare-fun res!240429 () Bool)

(assert (=> b!413598 (=> (not res!240429) (not e!247253))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413598 (= res!240429 (= from!863 i!563))))

(declare-fun lt!189612 () ListLongMap!5863)

(assert (=> b!413598 (= lt!189612 (getCurrentListMapNoExtraKeys!1160 lt!189610 lt!189611 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15299)

(assert (=> b!413598 (= lt!189611 (array!25142 (store (arr!12020 _values!549) i!563 (ValueCellFull!4979 v!412)) (size!12373 _values!549)))))

(declare-fun lt!189614 () ListLongMap!5863)

(assert (=> b!413598 (= lt!189614 (getCurrentListMapNoExtraKeys!1160 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413599 () Bool)

(declare-fun res!240432 () Bool)

(assert (=> b!413599 (=> (not res!240432) (not e!247254))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413599 (= res!240432 (validKeyInArray!0 k0!794))))

(declare-fun b!413600 () Bool)

(declare-fun res!240434 () Bool)

(assert (=> b!413600 (=> (not res!240434) (not e!247254))))

(assert (=> b!413600 (= res!240434 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12372 _keys!709))))))

(declare-fun b!413601 () Bool)

(declare-fun res!240425 () Bool)

(assert (=> b!413601 (=> (not res!240425) (not e!247254))))

(assert (=> b!413601 (= res!240425 (or (= (select (arr!12019 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12019 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17589 () Bool)

(assert (=> mapIsEmpty!17589 mapRes!17589))

(declare-fun b!413602 () Bool)

(assert (=> b!413602 (= e!247254 e!247249)))

(declare-fun res!240435 () Bool)

(assert (=> b!413602 (=> (not res!240435) (not e!247249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25139 (_ BitVec 32)) Bool)

(assert (=> b!413602 (= res!240435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189610 mask!1025))))

(assert (=> b!413602 (= lt!189610 (array!25140 (store (arr!12019 _keys!709) i!563 k0!794) (size!12372 _keys!709)))))

(declare-fun b!413603 () Bool)

(declare-fun e!247248 () Bool)

(declare-fun tp_is_empty!10645 () Bool)

(assert (=> b!413603 (= e!247248 tp_is_empty!10645)))

(declare-fun b!413604 () Bool)

(declare-fun res!240427 () Bool)

(assert (=> b!413604 (=> (not res!240427) (not e!247254))))

(declare-fun arrayContainsKey!0 (array!25139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413604 (= res!240427 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413605 () Bool)

(declare-fun res!240430 () Bool)

(assert (=> b!413605 (=> (not res!240430) (not e!247254))))

(declare-datatypes ((List!6976 0))(
  ( (Nil!6973) (Cons!6972 (h!7828 (_ BitVec 64)) (t!12141 List!6976)) )
))
(declare-fun arrayNoDuplicates!0 (array!25139 (_ BitVec 32) List!6976) Bool)

(assert (=> b!413605 (= res!240430 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6973))))

(declare-fun b!413606 () Bool)

(declare-fun res!240428 () Bool)

(assert (=> b!413606 (=> (not res!240428) (not e!247249))))

(assert (=> b!413606 (= res!240428 (arrayNoDuplicates!0 lt!189610 #b00000000000000000000000000000000 Nil!6973))))

(declare-fun b!413607 () Bool)

(declare-fun res!240433 () Bool)

(assert (=> b!413607 (=> (not res!240433) (not e!247249))))

(assert (=> b!413607 (= res!240433 (bvsle from!863 i!563))))

(declare-fun b!413608 () Bool)

(declare-fun +!1186 (ListLongMap!5863 tuple2!6960) ListLongMap!5863)

(assert (=> b!413608 (= e!247247 (= call!28633 (+!1186 call!28632 (tuple2!6961 k0!794 v!412))))))

(declare-fun b!413609 () Bool)

(declare-fun res!240431 () Bool)

(assert (=> b!413609 (=> (not res!240431) (not e!247254))))

(assert (=> b!413609 (= res!240431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413610 () Bool)

(assert (=> b!413610 (= e!247250 tp_is_empty!10645)))

(declare-fun mapNonEmpty!17589 () Bool)

(declare-fun tp!34008 () Bool)

(assert (=> mapNonEmpty!17589 (= mapRes!17589 (and tp!34008 e!247248))))

(declare-fun mapKey!17589 () (_ BitVec 32))

(declare-fun mapRest!17589 () (Array (_ BitVec 32) ValueCell!4979))

(declare-fun mapValue!17589 () ValueCell!4979)

(assert (=> mapNonEmpty!17589 (= (arr!12020 _values!549) (store mapRest!17589 mapKey!17589 mapValue!17589))))

(declare-fun res!240424 () Bool)

(assert (=> start!39212 (=> (not res!240424) (not e!247254))))

(assert (=> start!39212 (= res!240424 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12372 _keys!709))))))

(assert (=> start!39212 e!247254))

(assert (=> start!39212 tp_is_empty!10645))

(assert (=> start!39212 tp!34007))

(assert (=> start!39212 true))

(declare-fun array_inv!8818 (array!25141) Bool)

(assert (=> start!39212 (and (array_inv!8818 _values!549) e!247251)))

(declare-fun array_inv!8819 (array!25139) Bool)

(assert (=> start!39212 (array_inv!8819 _keys!709)))

(declare-fun b!413611 () Bool)

(assert (=> b!413611 (= e!247253 (not true))))

(assert (=> b!413611 e!247247))

(assert (=> b!413611 (= c!54882 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12212 0))(
  ( (Unit!12213) )
))
(declare-fun lt!189613 () Unit!12212)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!369 (array!25139 array!25141 (_ BitVec 32) (_ BitVec 32) V!15299 V!15299 (_ BitVec 32) (_ BitVec 64) V!15299 (_ BitVec 32) Int) Unit!12212)

(assert (=> b!413611 (= lt!189613 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!369 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28630 () Bool)

(assert (=> bm!28630 (= call!28633 (getCurrentListMapNoExtraKeys!1160 (ite c!54882 lt!189610 _keys!709) (ite c!54882 lt!189611 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39212 res!240424) b!413596))

(assert (= (and b!413596 res!240423) b!413594))

(assert (= (and b!413594 res!240426) b!413609))

(assert (= (and b!413609 res!240431) b!413605))

(assert (= (and b!413605 res!240430) b!413600))

(assert (= (and b!413600 res!240434) b!413599))

(assert (= (and b!413599 res!240432) b!413601))

(assert (= (and b!413601 res!240425) b!413604))

(assert (= (and b!413604 res!240427) b!413602))

(assert (= (and b!413602 res!240435) b!413606))

(assert (= (and b!413606 res!240428) b!413607))

(assert (= (and b!413607 res!240433) b!413598))

(assert (= (and b!413598 res!240429) b!413611))

(assert (= (and b!413611 c!54882) b!413608))

(assert (= (and b!413611 (not c!54882)) b!413595))

(assert (= (or b!413608 b!413595) bm!28630))

(assert (= (or b!413608 b!413595) bm!28629))

(assert (= (and b!413597 condMapEmpty!17589) mapIsEmpty!17589))

(assert (= (and b!413597 (not condMapEmpty!17589)) mapNonEmpty!17589))

(get-info :version)

(assert (= (and mapNonEmpty!17589 ((_ is ValueCellFull!4979) mapValue!17589)) b!413603))

(assert (= (and b!413597 ((_ is ValueCellFull!4979) mapDefault!17589)) b!413610))

(assert (= start!39212 b!413597))

(declare-fun m!402513 () Bool)

(assert (=> b!413601 m!402513))

(declare-fun m!402515 () Bool)

(assert (=> b!413604 m!402515))

(declare-fun m!402517 () Bool)

(assert (=> b!413599 m!402517))

(declare-fun m!402519 () Bool)

(assert (=> b!413605 m!402519))

(declare-fun m!402521 () Bool)

(assert (=> b!413609 m!402521))

(declare-fun m!402523 () Bool)

(assert (=> b!413611 m!402523))

(declare-fun m!402525 () Bool)

(assert (=> bm!28630 m!402525))

(declare-fun m!402527 () Bool)

(assert (=> mapNonEmpty!17589 m!402527))

(declare-fun m!402529 () Bool)

(assert (=> b!413598 m!402529))

(declare-fun m!402531 () Bool)

(assert (=> b!413598 m!402531))

(declare-fun m!402533 () Bool)

(assert (=> b!413598 m!402533))

(declare-fun m!402535 () Bool)

(assert (=> b!413596 m!402535))

(declare-fun m!402537 () Bool)

(assert (=> bm!28629 m!402537))

(declare-fun m!402539 () Bool)

(assert (=> b!413602 m!402539))

(declare-fun m!402541 () Bool)

(assert (=> b!413602 m!402541))

(declare-fun m!402543 () Bool)

(assert (=> b!413606 m!402543))

(declare-fun m!402545 () Bool)

(assert (=> b!413608 m!402545))

(declare-fun m!402547 () Bool)

(assert (=> start!39212 m!402547))

(declare-fun m!402549 () Bool)

(assert (=> start!39212 m!402549))

(check-sat (not b!413598) (not b!413606) (not b!413611) tp_is_empty!10645 (not b_next!9493) b_and!16853 (not b!413609) (not b!413596) (not bm!28629) (not b!413599) (not b!413608) (not b!413605) (not b!413602) (not bm!28630) (not start!39212) (not b!413604) (not mapNonEmpty!17589))
(check-sat b_and!16853 (not b_next!9493))
