; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39212 () Bool)

(assert start!39212)

(declare-fun b_free!9493 () Bool)

(declare-fun b_next!9493 () Bool)

(assert (=> start!39212 (= b_free!9493 (not b_next!9493))))

(declare-fun tp!34007 () Bool)

(declare-fun b_and!16893 () Bool)

(assert (=> start!39212 (= tp!34007 b_and!16893)))

(declare-datatypes ((V!15299 0))(
  ( (V!15300 (val!5367 Int)) )
))
(declare-fun minValue!515 () V!15299)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28641 () Bool)

(declare-datatypes ((array!25152 0))(
  ( (array!25153 (arr!12025 (Array (_ BitVec 32) (_ BitVec 64))) (size!12377 (_ BitVec 32))) )
))
(declare-fun lt!189863 () array!25152)

(declare-fun zeroValue!515 () V!15299)

(declare-datatypes ((tuple2!6848 0))(
  ( (tuple2!6849 (_1!3435 (_ BitVec 64)) (_2!3435 V!15299)) )
))
(declare-datatypes ((List!6868 0))(
  ( (Nil!6865) (Cons!6864 (h!7720 tuple2!6848) (t!12034 List!6868)) )
))
(declare-datatypes ((ListLongMap!5763 0))(
  ( (ListLongMap!5764 (toList!2897 List!6868)) )
))
(declare-fun call!28644 () ListLongMap!5763)

(declare-fun c!54930 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25152)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4979 0))(
  ( (ValueCellFull!4979 (v!7615 V!15299)) (EmptyCell!4979) )
))
(declare-datatypes ((array!25154 0))(
  ( (array!25155 (arr!12026 (Array (_ BitVec 32) ValueCell!4979)) (size!12378 (_ BitVec 32))) )
))
(declare-fun lt!189867 () array!25154)

(declare-fun _values!549 () array!25154)

(declare-fun getCurrentListMapNoExtraKeys!1147 (array!25152 array!25154 (_ BitVec 32) (_ BitVec 32) V!15299 V!15299 (_ BitVec 32) Int) ListLongMap!5763)

(assert (=> bm!28641 (= call!28644 (getCurrentListMapNoExtraKeys!1147 (ite c!54930 _keys!709 lt!189863) (ite c!54930 _values!549 lt!189867) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413816 () Bool)

(declare-fun e!247392 () Bool)

(declare-fun tp_is_empty!10645 () Bool)

(assert (=> b!413816 (= e!247392 tp_is_empty!10645)))

(declare-fun b!413817 () Bool)

(declare-fun e!247391 () Bool)

(assert (=> b!413817 (= e!247391 tp_is_empty!10645)))

(declare-fun b!413818 () Bool)

(declare-fun res!240561 () Bool)

(declare-fun e!247394 () Bool)

(assert (=> b!413818 (=> (not res!240561) (not e!247394))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413818 (= res!240561 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413819 () Bool)

(declare-fun res!240560 () Bool)

(assert (=> b!413819 (=> (not res!240560) (not e!247394))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413819 (= res!240560 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12377 _keys!709))))))

(declare-fun b!413820 () Bool)

(declare-fun res!240550 () Bool)

(assert (=> b!413820 (=> (not res!240550) (not e!247394))))

(assert (=> b!413820 (= res!240550 (and (= (size!12378 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12377 _keys!709) (size!12378 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413822 () Bool)

(declare-fun res!240551 () Bool)

(assert (=> b!413822 (=> (not res!240551) (not e!247394))))

(declare-datatypes ((List!6869 0))(
  ( (Nil!6866) (Cons!6865 (h!7721 (_ BitVec 64)) (t!12035 List!6869)) )
))
(declare-fun arrayNoDuplicates!0 (array!25152 (_ BitVec 32) List!6869) Bool)

(assert (=> b!413822 (= res!240551 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6866))))

(declare-fun b!413823 () Bool)

(declare-fun e!247389 () Bool)

(assert (=> b!413823 (= e!247394 e!247389)))

(declare-fun res!240554 () Bool)

(assert (=> b!413823 (=> (not res!240554) (not e!247389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25152 (_ BitVec 32)) Bool)

(assert (=> b!413823 (= res!240554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189863 mask!1025))))

(assert (=> b!413823 (= lt!189863 (array!25153 (store (arr!12025 _keys!709) i!563 k0!794) (size!12377 _keys!709)))))

(declare-fun bm!28642 () Bool)

(declare-fun call!28645 () ListLongMap!5763)

(assert (=> bm!28642 (= call!28645 (getCurrentListMapNoExtraKeys!1147 (ite c!54930 lt!189863 _keys!709) (ite c!54930 lt!189867 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413824 () Bool)

(declare-fun e!247393 () Bool)

(assert (=> b!413824 (= e!247393 (= call!28644 call!28645))))

(declare-fun mapIsEmpty!17589 () Bool)

(declare-fun mapRes!17589 () Bool)

(assert (=> mapIsEmpty!17589 mapRes!17589))

(declare-fun b!413825 () Bool)

(declare-fun res!240552 () Bool)

(assert (=> b!413825 (=> (not res!240552) (not e!247394))))

(assert (=> b!413825 (= res!240552 (or (= (select (arr!12025 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12025 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun v!412 () V!15299)

(declare-fun b!413826 () Bool)

(declare-fun +!1174 (ListLongMap!5763 tuple2!6848) ListLongMap!5763)

(assert (=> b!413826 (= e!247393 (= call!28645 (+!1174 call!28644 (tuple2!6849 k0!794 v!412))))))

(declare-fun res!240558 () Bool)

(assert (=> start!39212 (=> (not res!240558) (not e!247394))))

(assert (=> start!39212 (= res!240558 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12377 _keys!709))))))

(assert (=> start!39212 e!247394))

(assert (=> start!39212 tp_is_empty!10645))

(assert (=> start!39212 tp!34007))

(assert (=> start!39212 true))

(declare-fun e!247395 () Bool)

(declare-fun array_inv!8852 (array!25154) Bool)

(assert (=> start!39212 (and (array_inv!8852 _values!549) e!247395)))

(declare-fun array_inv!8853 (array!25152) Bool)

(assert (=> start!39212 (array_inv!8853 _keys!709)))

(declare-fun b!413821 () Bool)

(declare-fun res!240555 () Bool)

(assert (=> b!413821 (=> (not res!240555) (not e!247394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413821 (= res!240555 (validMask!0 mask!1025))))

(declare-fun b!413827 () Bool)

(declare-fun e!247396 () Bool)

(assert (=> b!413827 (= e!247396 (not true))))

(assert (=> b!413827 e!247393))

(assert (=> b!413827 (= c!54930 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12239 0))(
  ( (Unit!12240) )
))
(declare-fun lt!189866 () Unit!12239)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!387 (array!25152 array!25154 (_ BitVec 32) (_ BitVec 32) V!15299 V!15299 (_ BitVec 32) (_ BitVec 64) V!15299 (_ BitVec 32) Int) Unit!12239)

(assert (=> b!413827 (= lt!189866 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!387 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413828 () Bool)

(assert (=> b!413828 (= e!247389 e!247396)))

(declare-fun res!240557 () Bool)

(assert (=> b!413828 (=> (not res!240557) (not e!247396))))

(assert (=> b!413828 (= res!240557 (= from!863 i!563))))

(declare-fun lt!189864 () ListLongMap!5763)

(assert (=> b!413828 (= lt!189864 (getCurrentListMapNoExtraKeys!1147 lt!189863 lt!189867 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413828 (= lt!189867 (array!25155 (store (arr!12026 _values!549) i!563 (ValueCellFull!4979 v!412)) (size!12378 _values!549)))))

(declare-fun lt!189865 () ListLongMap!5763)

(assert (=> b!413828 (= lt!189865 (getCurrentListMapNoExtraKeys!1147 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413829 () Bool)

(declare-fun res!240553 () Bool)

(assert (=> b!413829 (=> (not res!240553) (not e!247394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413829 (= res!240553 (validKeyInArray!0 k0!794))))

(declare-fun b!413830 () Bool)

(assert (=> b!413830 (= e!247395 (and e!247391 mapRes!17589))))

(declare-fun condMapEmpty!17589 () Bool)

(declare-fun mapDefault!17589 () ValueCell!4979)

(assert (=> b!413830 (= condMapEmpty!17589 (= (arr!12026 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4979)) mapDefault!17589)))))

(declare-fun b!413831 () Bool)

(declare-fun res!240549 () Bool)

(assert (=> b!413831 (=> (not res!240549) (not e!247389))))

(assert (=> b!413831 (= res!240549 (bvsle from!863 i!563))))

(declare-fun b!413832 () Bool)

(declare-fun res!240556 () Bool)

(assert (=> b!413832 (=> (not res!240556) (not e!247394))))

(assert (=> b!413832 (= res!240556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17589 () Bool)

(declare-fun tp!34008 () Bool)

(assert (=> mapNonEmpty!17589 (= mapRes!17589 (and tp!34008 e!247392))))

(declare-fun mapValue!17589 () ValueCell!4979)

(declare-fun mapKey!17589 () (_ BitVec 32))

(declare-fun mapRest!17589 () (Array (_ BitVec 32) ValueCell!4979))

(assert (=> mapNonEmpty!17589 (= (arr!12026 _values!549) (store mapRest!17589 mapKey!17589 mapValue!17589))))

(declare-fun b!413833 () Bool)

(declare-fun res!240559 () Bool)

(assert (=> b!413833 (=> (not res!240559) (not e!247389))))

(assert (=> b!413833 (= res!240559 (arrayNoDuplicates!0 lt!189863 #b00000000000000000000000000000000 Nil!6866))))

(assert (= (and start!39212 res!240558) b!413821))

(assert (= (and b!413821 res!240555) b!413820))

(assert (= (and b!413820 res!240550) b!413832))

(assert (= (and b!413832 res!240556) b!413822))

(assert (= (and b!413822 res!240551) b!413819))

(assert (= (and b!413819 res!240560) b!413829))

(assert (= (and b!413829 res!240553) b!413825))

(assert (= (and b!413825 res!240552) b!413818))

(assert (= (and b!413818 res!240561) b!413823))

(assert (= (and b!413823 res!240554) b!413833))

(assert (= (and b!413833 res!240559) b!413831))

(assert (= (and b!413831 res!240549) b!413828))

(assert (= (and b!413828 res!240557) b!413827))

(assert (= (and b!413827 c!54930) b!413826))

(assert (= (and b!413827 (not c!54930)) b!413824))

(assert (= (or b!413826 b!413824) bm!28642))

(assert (= (or b!413826 b!413824) bm!28641))

(assert (= (and b!413830 condMapEmpty!17589) mapIsEmpty!17589))

(assert (= (and b!413830 (not condMapEmpty!17589)) mapNonEmpty!17589))

(get-info :version)

(assert (= (and mapNonEmpty!17589 ((_ is ValueCellFull!4979) mapValue!17589)) b!413816))

(assert (= (and b!413830 ((_ is ValueCellFull!4979) mapDefault!17589)) b!413817))

(assert (= start!39212 b!413830))

(declare-fun m!403467 () Bool)

(assert (=> bm!28641 m!403467))

(declare-fun m!403469 () Bool)

(assert (=> b!413827 m!403469))

(declare-fun m!403471 () Bool)

(assert (=> start!39212 m!403471))

(declare-fun m!403473 () Bool)

(assert (=> start!39212 m!403473))

(declare-fun m!403475 () Bool)

(assert (=> b!413833 m!403475))

(declare-fun m!403477 () Bool)

(assert (=> b!413829 m!403477))

(declare-fun m!403479 () Bool)

(assert (=> bm!28642 m!403479))

(declare-fun m!403481 () Bool)

(assert (=> b!413822 m!403481))

(declare-fun m!403483 () Bool)

(assert (=> b!413825 m!403483))

(declare-fun m!403485 () Bool)

(assert (=> b!413821 m!403485))

(declare-fun m!403487 () Bool)

(assert (=> b!413828 m!403487))

(declare-fun m!403489 () Bool)

(assert (=> b!413828 m!403489))

(declare-fun m!403491 () Bool)

(assert (=> b!413828 m!403491))

(declare-fun m!403493 () Bool)

(assert (=> b!413826 m!403493))

(declare-fun m!403495 () Bool)

(assert (=> b!413832 m!403495))

(declare-fun m!403497 () Bool)

(assert (=> mapNonEmpty!17589 m!403497))

(declare-fun m!403499 () Bool)

(assert (=> b!413818 m!403499))

(declare-fun m!403501 () Bool)

(assert (=> b!413823 m!403501))

(declare-fun m!403503 () Bool)

(assert (=> b!413823 m!403503))

(check-sat (not b!413821) (not b!413827) (not b!413833) (not b!413823) (not start!39212) (not bm!28641) (not b!413826) (not bm!28642) tp_is_empty!10645 (not b!413832) (not b_next!9493) (not b!413828) (not mapNonEmpty!17589) b_and!16893 (not b!413822) (not b!413818) (not b!413829))
(check-sat b_and!16893 (not b_next!9493))
