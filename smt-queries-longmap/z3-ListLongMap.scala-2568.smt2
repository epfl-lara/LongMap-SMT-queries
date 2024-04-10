; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39228 () Bool)

(assert start!39228)

(declare-fun b_free!9495 () Bool)

(declare-fun b_next!9495 () Bool)

(assert (=> start!39228 (= b_free!9495 (not b_next!9495))))

(declare-fun tp!34014 () Bool)

(declare-fun b_and!16881 () Bool)

(assert (=> start!39228 (= tp!34014 b_and!16881)))

(declare-fun b!413919 () Bool)

(declare-fun res!240599 () Bool)

(declare-fun e!247451 () Bool)

(assert (=> b!413919 (=> (not res!240599) (not e!247451))))

(declare-datatypes ((array!25151 0))(
  ( (array!25152 (arr!12025 (Array (_ BitVec 32) (_ BitVec 64))) (size!12377 (_ BitVec 32))) )
))
(declare-fun lt!189859 () array!25151)

(declare-datatypes ((List!7002 0))(
  ( (Nil!6999) (Cons!6998 (h!7854 (_ BitVec 64)) (t!12176 List!7002)) )
))
(declare-fun arrayNoDuplicates!0 (array!25151 (_ BitVec 32) List!7002) Bool)

(assert (=> b!413919 (= res!240599 (arrayNoDuplicates!0 lt!189859 #b00000000000000000000000000000000 Nil!6999))))

(declare-fun b!413920 () Bool)

(declare-fun e!247448 () Bool)

(declare-datatypes ((V!15301 0))(
  ( (V!15302 (val!5368 Int)) )
))
(declare-datatypes ((tuple2!6980 0))(
  ( (tuple2!6981 (_1!3501 (_ BitVec 64)) (_2!3501 V!15301)) )
))
(declare-datatypes ((List!7003 0))(
  ( (Nil!7000) (Cons!6999 (h!7855 tuple2!6980) (t!12177 List!7003)) )
))
(declare-datatypes ((ListLongMap!5893 0))(
  ( (ListLongMap!5894 (toList!2962 List!7003)) )
))
(declare-fun call!28663 () ListLongMap!5893)

(declare-fun call!28664 () ListLongMap!5893)

(assert (=> b!413920 (= e!247448 (= call!28663 call!28664))))

(declare-fun b!413921 () Bool)

(declare-fun e!247450 () Bool)

(assert (=> b!413921 (= e!247450 e!247451)))

(declare-fun res!240598 () Bool)

(assert (=> b!413921 (=> (not res!240598) (not e!247451))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25151 (_ BitVec 32)) Bool)

(assert (=> b!413921 (= res!240598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189859 mask!1025))))

(declare-fun _keys!709 () array!25151)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413921 (= lt!189859 (array!25152 (store (arr!12025 _keys!709) i!563 k0!794) (size!12377 _keys!709)))))

(declare-fun b!413922 () Bool)

(declare-fun e!247452 () Bool)

(declare-fun tp_is_empty!10647 () Bool)

(assert (=> b!413922 (= e!247452 tp_is_empty!10647)))

(declare-fun b!413923 () Bool)

(declare-fun res!240593 () Bool)

(assert (=> b!413923 (=> (not res!240593) (not e!247450))))

(assert (=> b!413923 (= res!240593 (or (= (select (arr!12025 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12025 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28660 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4980 0))(
  ( (ValueCellFull!4980 (v!7615 V!15301)) (EmptyCell!4980) )
))
(declare-datatypes ((array!25153 0))(
  ( (array!25154 (arr!12026 (Array (_ BitVec 32) ValueCell!4980)) (size!12378 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25153)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!189863 () array!25153)

(declare-fun minValue!515 () V!15301)

(declare-fun zeroValue!515 () V!15301)

(declare-fun c!54956 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1169 (array!25151 array!25153 (_ BitVec 32) (_ BitVec 32) V!15301 V!15301 (_ BitVec 32) Int) ListLongMap!5893)

(assert (=> bm!28660 (= call!28663 (getCurrentListMapNoExtraKeys!1169 (ite c!54956 _keys!709 lt!189859) (ite c!54956 _values!549 lt!189863) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413924 () Bool)

(declare-fun e!247447 () Bool)

(assert (=> b!413924 (= e!247447 tp_is_empty!10647)))

(declare-fun b!413925 () Bool)

(declare-fun res!240601 () Bool)

(assert (=> b!413925 (=> (not res!240601) (not e!247450))))

(assert (=> b!413925 (= res!240601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413926 () Bool)

(declare-fun res!240600 () Bool)

(assert (=> b!413926 (=> (not res!240600) (not e!247450))))

(assert (=> b!413926 (= res!240600 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12377 _keys!709))))))

(declare-fun bm!28661 () Bool)

(assert (=> bm!28661 (= call!28664 (getCurrentListMapNoExtraKeys!1169 (ite c!54956 lt!189859 _keys!709) (ite c!54956 lt!189863 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413927 () Bool)

(declare-fun v!412 () V!15301)

(declare-fun +!1169 (ListLongMap!5893 tuple2!6980) ListLongMap!5893)

(assert (=> b!413927 (= e!247448 (= call!28664 (+!1169 call!28663 (tuple2!6981 k0!794 v!412))))))

(declare-fun b!413928 () Bool)

(declare-fun res!240595 () Bool)

(assert (=> b!413928 (=> (not res!240595) (not e!247450))))

(assert (=> b!413928 (= res!240595 (and (= (size!12378 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12377 _keys!709) (size!12378 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17592 () Bool)

(declare-fun mapRes!17592 () Bool)

(assert (=> mapIsEmpty!17592 mapRes!17592))

(declare-fun b!413930 () Bool)

(declare-fun res!240603 () Bool)

(assert (=> b!413930 (=> (not res!240603) (not e!247450))))

(declare-fun arrayContainsKey!0 (array!25151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413930 (= res!240603 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413931 () Bool)

(declare-fun e!247449 () Bool)

(assert (=> b!413931 (= e!247451 e!247449)))

(declare-fun res!240596 () Bool)

(assert (=> b!413931 (=> (not res!240596) (not e!247449))))

(assert (=> b!413931 (= res!240596 (= from!863 i!563))))

(declare-fun lt!189862 () ListLongMap!5893)

(assert (=> b!413931 (= lt!189862 (getCurrentListMapNoExtraKeys!1169 lt!189859 lt!189863 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413931 (= lt!189863 (array!25154 (store (arr!12026 _values!549) i!563 (ValueCellFull!4980 v!412)) (size!12378 _values!549)))))

(declare-fun lt!189860 () ListLongMap!5893)

(assert (=> b!413931 (= lt!189860 (getCurrentListMapNoExtraKeys!1169 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17592 () Bool)

(declare-fun tp!34013 () Bool)

(assert (=> mapNonEmpty!17592 (= mapRes!17592 (and tp!34013 e!247452))))

(declare-fun mapRest!17592 () (Array (_ BitVec 32) ValueCell!4980))

(declare-fun mapValue!17592 () ValueCell!4980)

(declare-fun mapKey!17592 () (_ BitVec 32))

(assert (=> mapNonEmpty!17592 (= (arr!12026 _values!549) (store mapRest!17592 mapKey!17592 mapValue!17592))))

(declare-fun b!413932 () Bool)

(declare-fun res!240602 () Bool)

(assert (=> b!413932 (=> (not res!240602) (not e!247451))))

(assert (=> b!413932 (= res!240602 (bvsle from!863 i!563))))

(declare-fun b!413933 () Bool)

(declare-fun res!240594 () Bool)

(assert (=> b!413933 (=> (not res!240594) (not e!247450))))

(assert (=> b!413933 (= res!240594 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6999))))

(declare-fun b!413934 () Bool)

(declare-fun res!240591 () Bool)

(assert (=> b!413934 (=> (not res!240591) (not e!247450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413934 (= res!240591 (validKeyInArray!0 k0!794))))

(declare-fun b!413935 () Bool)

(declare-fun res!240592 () Bool)

(assert (=> b!413935 (=> (not res!240592) (not e!247450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413935 (= res!240592 (validMask!0 mask!1025))))

(declare-fun b!413936 () Bool)

(assert (=> b!413936 (= e!247449 (not true))))

(assert (=> b!413936 e!247448))

(assert (=> b!413936 (= c!54956 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12246 0))(
  ( (Unit!12247) )
))
(declare-fun lt!189861 () Unit!12246)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!381 (array!25151 array!25153 (_ BitVec 32) (_ BitVec 32) V!15301 V!15301 (_ BitVec 32) (_ BitVec 64) V!15301 (_ BitVec 32) Int) Unit!12246)

(assert (=> b!413936 (= lt!189861 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!381 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413929 () Bool)

(declare-fun e!247446 () Bool)

(assert (=> b!413929 (= e!247446 (and e!247447 mapRes!17592))))

(declare-fun condMapEmpty!17592 () Bool)

(declare-fun mapDefault!17592 () ValueCell!4980)

(assert (=> b!413929 (= condMapEmpty!17592 (= (arr!12026 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4980)) mapDefault!17592)))))

(declare-fun res!240597 () Bool)

(assert (=> start!39228 (=> (not res!240597) (not e!247450))))

(assert (=> start!39228 (= res!240597 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12377 _keys!709))))))

(assert (=> start!39228 e!247450))

(assert (=> start!39228 tp_is_empty!10647))

(assert (=> start!39228 tp!34014))

(assert (=> start!39228 true))

(declare-fun array_inv!8772 (array!25153) Bool)

(assert (=> start!39228 (and (array_inv!8772 _values!549) e!247446)))

(declare-fun array_inv!8773 (array!25151) Bool)

(assert (=> start!39228 (array_inv!8773 _keys!709)))

(assert (= (and start!39228 res!240597) b!413935))

(assert (= (and b!413935 res!240592) b!413928))

(assert (= (and b!413928 res!240595) b!413925))

(assert (= (and b!413925 res!240601) b!413933))

(assert (= (and b!413933 res!240594) b!413926))

(assert (= (and b!413926 res!240600) b!413934))

(assert (= (and b!413934 res!240591) b!413923))

(assert (= (and b!413923 res!240593) b!413930))

(assert (= (and b!413930 res!240603) b!413921))

(assert (= (and b!413921 res!240598) b!413919))

(assert (= (and b!413919 res!240599) b!413932))

(assert (= (and b!413932 res!240602) b!413931))

(assert (= (and b!413931 res!240596) b!413936))

(assert (= (and b!413936 c!54956) b!413927))

(assert (= (and b!413936 (not c!54956)) b!413920))

(assert (= (or b!413927 b!413920) bm!28661))

(assert (= (or b!413927 b!413920) bm!28660))

(assert (= (and b!413929 condMapEmpty!17592) mapIsEmpty!17592))

(assert (= (and b!413929 (not condMapEmpty!17592)) mapNonEmpty!17592))

(get-info :version)

(assert (= (and mapNonEmpty!17592 ((_ is ValueCellFull!4980) mapValue!17592)) b!413922))

(assert (= (and b!413929 ((_ is ValueCellFull!4980) mapDefault!17592)) b!413924))

(assert (= start!39228 b!413929))

(declare-fun m!403275 () Bool)

(assert (=> b!413919 m!403275))

(declare-fun m!403277 () Bool)

(assert (=> bm!28661 m!403277))

(declare-fun m!403279 () Bool)

(assert (=> b!413930 m!403279))

(declare-fun m!403281 () Bool)

(assert (=> b!413935 m!403281))

(declare-fun m!403283 () Bool)

(assert (=> b!413931 m!403283))

(declare-fun m!403285 () Bool)

(assert (=> b!413931 m!403285))

(declare-fun m!403287 () Bool)

(assert (=> b!413931 m!403287))

(declare-fun m!403289 () Bool)

(assert (=> b!413934 m!403289))

(declare-fun m!403291 () Bool)

(assert (=> start!39228 m!403291))

(declare-fun m!403293 () Bool)

(assert (=> start!39228 m!403293))

(declare-fun m!403295 () Bool)

(assert (=> b!413936 m!403295))

(declare-fun m!403297 () Bool)

(assert (=> b!413921 m!403297))

(declare-fun m!403299 () Bool)

(assert (=> b!413921 m!403299))

(declare-fun m!403301 () Bool)

(assert (=> bm!28660 m!403301))

(declare-fun m!403303 () Bool)

(assert (=> b!413925 m!403303))

(declare-fun m!403305 () Bool)

(assert (=> mapNonEmpty!17592 m!403305))

(declare-fun m!403307 () Bool)

(assert (=> b!413933 m!403307))

(declare-fun m!403309 () Bool)

(assert (=> b!413923 m!403309))

(declare-fun m!403311 () Bool)

(assert (=> b!413927 m!403311))

(check-sat (not b!413921) (not b!413927) (not b!413934) tp_is_empty!10647 (not b_next!9495) (not b!413936) b_and!16881 (not b!413933) (not start!39228) (not bm!28660) (not b!413925) (not b!413931) (not b!413930) (not mapNonEmpty!17592) (not bm!28661) (not b!413935) (not b!413919))
(check-sat b_and!16881 (not b_next!9495))
