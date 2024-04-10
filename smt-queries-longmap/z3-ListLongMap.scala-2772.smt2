; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40486 () Bool)

(assert start!40486)

(declare-fun b_free!10557 () Bool)

(declare-fun b_next!10557 () Bool)

(assert (=> start!40486 (= b_free!10557 (not b_next!10557))))

(declare-fun tp!37449 () Bool)

(declare-fun b_and!18541 () Bool)

(assert (=> start!40486 (= tp!37449 b_and!18541)))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55881 () Bool)

(declare-datatypes ((V!16933 0))(
  ( (V!16934 (val!5980 Int)) )
))
(declare-datatypes ((ValueCell!5592 0))(
  ( (ValueCellFull!5592 (v!8231 V!16933)) (EmptyCell!5592) )
))
(declare-datatypes ((array!27549 0))(
  ( (array!27550 (arr!13222 (Array (_ BitVec 32) ValueCell!5592)) (size!13574 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27549)

(declare-fun zeroValue!515 () V!16933)

(declare-fun v!412 () V!16933)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27551 0))(
  ( (array!27552 (arr!13223 (Array (_ BitVec 32) (_ BitVec 64))) (size!13575 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27551)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7858 0))(
  ( (tuple2!7859 (_1!3940 (_ BitVec 64)) (_2!3940 V!16933)) )
))
(declare-datatypes ((List!7909 0))(
  ( (Nil!7906) (Cons!7905 (h!8761 tuple2!7858) (t!13667 List!7909)) )
))
(declare-datatypes ((ListLongMap!6771 0))(
  ( (ListLongMap!6772 (toList!3401 List!7909)) )
))
(declare-fun call!29628 () ListLongMap!6771)

(declare-fun minValue!515 () V!16933)

(declare-fun lt!203696 () array!27551)

(declare-fun defaultEntry!557 () Int)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun bm!29624 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1588 (array!27551 array!27549 (_ BitVec 32) (_ BitVec 32) V!16933 V!16933 (_ BitVec 32) Int) ListLongMap!6771)

(assert (=> bm!29624 (= call!29628 (getCurrentListMapNoExtraKeys!1588 (ite c!55881 _keys!709 lt!203696) (ite c!55881 _values!549 (array!27550 (store (arr!13222 _values!549) i!563 (ValueCellFull!5592 v!412)) (size!13574 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445960 () Bool)

(declare-fun res!264684 () Bool)

(declare-fun e!262047 () Bool)

(assert (=> b!445960 (=> (not res!264684) (not e!262047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445960 (= res!264684 (validMask!0 mask!1025))))

(declare-fun b!445961 () Bool)

(declare-fun res!264675 () Bool)

(assert (=> b!445961 (=> (not res!264675) (not e!262047))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445961 (= res!264675 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445962 () Bool)

(declare-fun res!264679 () Bool)

(assert (=> b!445962 (=> (not res!264679) (not e!262047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27551 (_ BitVec 32)) Bool)

(assert (=> b!445962 (= res!264679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19434 () Bool)

(declare-fun mapRes!19434 () Bool)

(declare-fun tp!37448 () Bool)

(declare-fun e!262046 () Bool)

(assert (=> mapNonEmpty!19434 (= mapRes!19434 (and tp!37448 e!262046))))

(declare-fun mapValue!19434 () ValueCell!5592)

(declare-fun mapRest!19434 () (Array (_ BitVec 32) ValueCell!5592))

(declare-fun mapKey!19434 () (_ BitVec 32))

(assert (=> mapNonEmpty!19434 (= (arr!13222 _values!549) (store mapRest!19434 mapKey!19434 mapValue!19434))))

(declare-fun e!262043 () Bool)

(declare-fun b!445963 () Bool)

(declare-fun call!29627 () ListLongMap!6771)

(declare-fun +!1532 (ListLongMap!6771 tuple2!7858) ListLongMap!6771)

(assert (=> b!445963 (= e!262043 (= call!29627 (+!1532 call!29628 (tuple2!7859 k0!794 v!412))))))

(declare-fun b!445964 () Bool)

(assert (=> b!445964 (= e!262043 (= call!29628 call!29627))))

(declare-fun b!445965 () Bool)

(declare-fun res!264682 () Bool)

(assert (=> b!445965 (=> (not res!264682) (not e!262047))))

(assert (=> b!445965 (= res!264682 (or (= (select (arr!13223 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13223 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445966 () Bool)

(declare-fun res!264674 () Bool)

(assert (=> b!445966 (=> (not res!264674) (not e!262047))))

(assert (=> b!445966 (= res!264674 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13575 _keys!709))))))

(declare-fun res!264681 () Bool)

(assert (=> start!40486 (=> (not res!264681) (not e!262047))))

(assert (=> start!40486 (= res!264681 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13575 _keys!709))))))

(assert (=> start!40486 e!262047))

(declare-fun tp_is_empty!11871 () Bool)

(assert (=> start!40486 tp_is_empty!11871))

(assert (=> start!40486 tp!37449))

(assert (=> start!40486 true))

(declare-fun e!262045 () Bool)

(declare-fun array_inv!9590 (array!27549) Bool)

(assert (=> start!40486 (and (array_inv!9590 _values!549) e!262045)))

(declare-fun array_inv!9591 (array!27551) Bool)

(assert (=> start!40486 (array_inv!9591 _keys!709)))

(declare-fun mapIsEmpty!19434 () Bool)

(assert (=> mapIsEmpty!19434 mapRes!19434))

(declare-fun b!445967 () Bool)

(declare-fun res!264677 () Bool)

(declare-fun e!262048 () Bool)

(assert (=> b!445967 (=> (not res!264677) (not e!262048))))

(declare-datatypes ((List!7910 0))(
  ( (Nil!7907) (Cons!7906 (h!8762 (_ BitVec 64)) (t!13668 List!7910)) )
))
(declare-fun arrayNoDuplicates!0 (array!27551 (_ BitVec 32) List!7910) Bool)

(assert (=> b!445967 (= res!264677 (arrayNoDuplicates!0 lt!203696 #b00000000000000000000000000000000 Nil!7907))))

(declare-fun b!445968 () Bool)

(declare-fun res!264676 () Bool)

(assert (=> b!445968 (=> (not res!264676) (not e!262047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445968 (= res!264676 (validKeyInArray!0 k0!794))))

(declare-fun b!445969 () Bool)

(declare-fun res!264680 () Bool)

(assert (=> b!445969 (=> (not res!264680) (not e!262047))))

(assert (=> b!445969 (= res!264680 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7907))))

(declare-fun b!445970 () Bool)

(assert (=> b!445970 (= e!262047 e!262048)))

(declare-fun res!264683 () Bool)

(assert (=> b!445970 (=> (not res!264683) (not e!262048))))

(assert (=> b!445970 (= res!264683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203696 mask!1025))))

(assert (=> b!445970 (= lt!203696 (array!27552 (store (arr!13223 _keys!709) i!563 k0!794) (size!13575 _keys!709)))))

(declare-fun b!445971 () Bool)

(declare-fun e!262044 () Bool)

(assert (=> b!445971 (= e!262044 tp_is_empty!11871)))

(declare-fun b!445972 () Bool)

(declare-fun res!264678 () Bool)

(assert (=> b!445972 (=> (not res!264678) (not e!262047))))

(assert (=> b!445972 (= res!264678 (and (= (size!13574 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13575 _keys!709) (size!13574 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445973 () Bool)

(assert (=> b!445973 (= e!262046 tp_is_empty!11871)))

(declare-fun b!445974 () Bool)

(declare-fun res!264685 () Bool)

(assert (=> b!445974 (=> (not res!264685) (not e!262048))))

(assert (=> b!445974 (= res!264685 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13575 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!29625 () Bool)

(assert (=> bm!29625 (= call!29627 (getCurrentListMapNoExtraKeys!1588 (ite c!55881 lt!203696 _keys!709) (ite c!55881 (array!27550 (store (arr!13222 _values!549) i!563 (ValueCellFull!5592 v!412)) (size!13574 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445975 () Bool)

(assert (=> b!445975 (= e!262048 (not (bvslt i!563 (size!13574 _values!549))))))

(assert (=> b!445975 e!262043))

(assert (=> b!445975 (= c!55881 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13174 0))(
  ( (Unit!13175) )
))
(declare-fun lt!203695 () Unit!13174)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!703 (array!27551 array!27549 (_ BitVec 32) (_ BitVec 32) V!16933 V!16933 (_ BitVec 32) (_ BitVec 64) V!16933 (_ BitVec 32) Int) Unit!13174)

(assert (=> b!445975 (= lt!203695 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!703 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445976 () Bool)

(assert (=> b!445976 (= e!262045 (and e!262044 mapRes!19434))))

(declare-fun condMapEmpty!19434 () Bool)

(declare-fun mapDefault!19434 () ValueCell!5592)

(assert (=> b!445976 (= condMapEmpty!19434 (= (arr!13222 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5592)) mapDefault!19434)))))

(assert (= (and start!40486 res!264681) b!445960))

(assert (= (and b!445960 res!264684) b!445972))

(assert (= (and b!445972 res!264678) b!445962))

(assert (= (and b!445962 res!264679) b!445969))

(assert (= (and b!445969 res!264680) b!445966))

(assert (= (and b!445966 res!264674) b!445968))

(assert (= (and b!445968 res!264676) b!445965))

(assert (= (and b!445965 res!264682) b!445961))

(assert (= (and b!445961 res!264675) b!445970))

(assert (= (and b!445970 res!264683) b!445967))

(assert (= (and b!445967 res!264677) b!445974))

(assert (= (and b!445974 res!264685) b!445975))

(assert (= (and b!445975 c!55881) b!445963))

(assert (= (and b!445975 (not c!55881)) b!445964))

(assert (= (or b!445963 b!445964) bm!29625))

(assert (= (or b!445963 b!445964) bm!29624))

(assert (= (and b!445976 condMapEmpty!19434) mapIsEmpty!19434))

(assert (= (and b!445976 (not condMapEmpty!19434)) mapNonEmpty!19434))

(get-info :version)

(assert (= (and mapNonEmpty!19434 ((_ is ValueCellFull!5592) mapValue!19434)) b!445973))

(assert (= (and b!445976 ((_ is ValueCellFull!5592) mapDefault!19434)) b!445971))

(assert (= start!40486 b!445976))

(declare-fun m!431273 () Bool)

(assert (=> b!445965 m!431273))

(declare-fun m!431275 () Bool)

(assert (=> b!445967 m!431275))

(declare-fun m!431277 () Bool)

(assert (=> start!40486 m!431277))

(declare-fun m!431279 () Bool)

(assert (=> start!40486 m!431279))

(declare-fun m!431281 () Bool)

(assert (=> b!445960 m!431281))

(declare-fun m!431283 () Bool)

(assert (=> bm!29625 m!431283))

(declare-fun m!431285 () Bool)

(assert (=> bm!29625 m!431285))

(declare-fun m!431287 () Bool)

(assert (=> mapNonEmpty!19434 m!431287))

(declare-fun m!431289 () Bool)

(assert (=> b!445975 m!431289))

(declare-fun m!431291 () Bool)

(assert (=> b!445968 m!431291))

(assert (=> bm!29624 m!431283))

(declare-fun m!431293 () Bool)

(assert (=> bm!29624 m!431293))

(declare-fun m!431295 () Bool)

(assert (=> b!445970 m!431295))

(declare-fun m!431297 () Bool)

(assert (=> b!445970 m!431297))

(declare-fun m!431299 () Bool)

(assert (=> b!445969 m!431299))

(declare-fun m!431301 () Bool)

(assert (=> b!445962 m!431301))

(declare-fun m!431303 () Bool)

(assert (=> b!445961 m!431303))

(declare-fun m!431305 () Bool)

(assert (=> b!445963 m!431305))

(check-sat (not bm!29625) (not b!445975) (not b!445969) (not b!445967) (not b_next!10557) (not b!445968) (not mapNonEmpty!19434) (not b!445963) (not b!445961) (not start!40486) b_and!18541 (not b!445960) (not b!445970) tp_is_empty!11871 (not bm!29624) (not b!445962))
(check-sat b_and!18541 (not b_next!10557))
