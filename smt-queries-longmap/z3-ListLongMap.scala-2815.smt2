; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40802 () Bool)

(assert start!40802)

(declare-fun b_free!10791 () Bool)

(declare-fun b_next!10791 () Bool)

(assert (=> start!40802 (= b_free!10791 (not b_next!10791))))

(declare-fun tp!38195 () Bool)

(declare-fun b_and!18869 () Bool)

(assert (=> start!40802 (= tp!38195 b_and!18869)))

(declare-fun b!452707 () Bool)

(declare-fun e!265038 () Bool)

(declare-fun e!265035 () Bool)

(assert (=> b!452707 (= e!265038 e!265035)))

(declare-fun res!269686 () Bool)

(assert (=> b!452707 (=> (not res!269686) (not e!265035))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452707 (= res!269686 (= from!863 i!563))))

(declare-datatypes ((V!17277 0))(
  ( (V!17278 (val!6109 Int)) )
))
(declare-datatypes ((ValueCell!5721 0))(
  ( (ValueCellFull!5721 (v!8368 V!17277)) (EmptyCell!5721) )
))
(declare-datatypes ((array!28065 0))(
  ( (array!28066 (arr!13477 (Array (_ BitVec 32) ValueCell!5721)) (size!13829 (_ BitVec 32))) )
))
(declare-fun lt!205387 () array!28065)

(declare-fun minValue!515 () V!17277)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17277)

(declare-datatypes ((tuple2!8044 0))(
  ( (tuple2!8045 (_1!4033 (_ BitVec 64)) (_2!4033 V!17277)) )
))
(declare-datatypes ((List!8101 0))(
  ( (Nil!8098) (Cons!8097 (h!8953 tuple2!8044) (t!13915 List!8101)) )
))
(declare-datatypes ((ListLongMap!6957 0))(
  ( (ListLongMap!6958 (toList!3494 List!8101)) )
))
(declare-fun lt!205389 () ListLongMap!6957)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((array!28067 0))(
  ( (array!28068 (arr!13478 (Array (_ BitVec 32) (_ BitVec 64))) (size!13830 (_ BitVec 32))) )
))
(declare-fun lt!205392 () array!28067)

(declare-fun getCurrentListMapNoExtraKeys!1677 (array!28067 array!28065 (_ BitVec 32) (_ BitVec 32) V!17277 V!17277 (_ BitVec 32) Int) ListLongMap!6957)

(assert (=> b!452707 (= lt!205389 (getCurrentListMapNoExtraKeys!1677 lt!205392 lt!205387 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28065)

(declare-fun v!412 () V!17277)

(assert (=> b!452707 (= lt!205387 (array!28066 (store (arr!13477 _values!549) i!563 (ValueCellFull!5721 v!412)) (size!13829 _values!549)))))

(declare-fun lt!205396 () ListLongMap!6957)

(declare-fun _keys!709 () array!28067)

(assert (=> b!452707 (= lt!205396 (getCurrentListMapNoExtraKeys!1677 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452708 () Bool)

(declare-fun res!269674 () Bool)

(assert (=> b!452708 (=> (not res!269674) (not e!265038))))

(declare-datatypes ((List!8102 0))(
  ( (Nil!8099) (Cons!8098 (h!8954 (_ BitVec 64)) (t!13916 List!8102)) )
))
(declare-fun arrayNoDuplicates!0 (array!28067 (_ BitVec 32) List!8102) Bool)

(assert (=> b!452708 (= res!269674 (arrayNoDuplicates!0 lt!205392 #b00000000000000000000000000000000 Nil!8099))))

(declare-fun b!452709 () Bool)

(declare-fun e!265036 () Bool)

(declare-fun tp_is_empty!12129 () Bool)

(assert (=> b!452709 (= e!265036 tp_is_empty!12129)))

(declare-fun res!269680 () Bool)

(declare-fun e!265034 () Bool)

(assert (=> start!40802 (=> (not res!269680) (not e!265034))))

(assert (=> start!40802 (= res!269680 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13830 _keys!709))))))

(assert (=> start!40802 e!265034))

(assert (=> start!40802 tp_is_empty!12129))

(assert (=> start!40802 tp!38195))

(assert (=> start!40802 true))

(declare-fun e!265040 () Bool)

(declare-fun array_inv!9760 (array!28065) Bool)

(assert (=> start!40802 (and (array_inv!9760 _values!549) e!265040)))

(declare-fun array_inv!9761 (array!28067) Bool)

(assert (=> start!40802 (array_inv!9761 _keys!709)))

(declare-fun b!452710 () Bool)

(declare-fun res!269681 () Bool)

(assert (=> b!452710 (=> (not res!269681) (not e!265034))))

(assert (=> b!452710 (= res!269681 (and (= (size!13829 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13830 _keys!709) (size!13829 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!29987 () ListLongMap!6957)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!265032 () Bool)

(declare-fun call!29986 () ListLongMap!6957)

(declare-fun b!452711 () Bool)

(declare-fun +!1570 (ListLongMap!6957 tuple2!8044) ListLongMap!6957)

(assert (=> b!452711 (= e!265032 (= call!29987 (+!1570 call!29986 (tuple2!8045 k0!794 v!412))))))

(declare-fun mapIsEmpty!19830 () Bool)

(declare-fun mapRes!19830 () Bool)

(assert (=> mapIsEmpty!19830 mapRes!19830))

(declare-fun b!452712 () Bool)

(declare-fun e!265033 () Bool)

(assert (=> b!452712 (= e!265033 tp_is_empty!12129)))

(declare-fun c!56135 () Bool)

(declare-fun bm!29983 () Bool)

(assert (=> bm!29983 (= call!29987 (getCurrentListMapNoExtraKeys!1677 (ite c!56135 lt!205392 _keys!709) (ite c!56135 lt!205387 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452713 () Bool)

(declare-fun e!265039 () Bool)

(assert (=> b!452713 (= e!265035 (not e!265039))))

(declare-fun res!269679 () Bool)

(assert (=> b!452713 (=> res!269679 e!265039)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452713 (= res!269679 (validKeyInArray!0 (select (arr!13478 _keys!709) from!863)))))

(assert (=> b!452713 e!265032))

(assert (=> b!452713 (= c!56135 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13236 0))(
  ( (Unit!13237) )
))
(declare-fun lt!205393 () Unit!13236)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!732 (array!28067 array!28065 (_ BitVec 32) (_ BitVec 32) V!17277 V!17277 (_ BitVec 32) (_ BitVec 64) V!17277 (_ BitVec 32) Int) Unit!13236)

(assert (=> b!452713 (= lt!205393 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452714 () Bool)

(assert (=> b!452714 (= e!265034 e!265038)))

(declare-fun res!269677 () Bool)

(assert (=> b!452714 (=> (not res!269677) (not e!265038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28067 (_ BitVec 32)) Bool)

(assert (=> b!452714 (= res!269677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205392 mask!1025))))

(assert (=> b!452714 (= lt!205392 (array!28068 (store (arr!13478 _keys!709) i!563 k0!794) (size!13830 _keys!709)))))

(declare-fun b!452715 () Bool)

(declare-fun res!269675 () Bool)

(assert (=> b!452715 (=> (not res!269675) (not e!265034))))

(assert (=> b!452715 (= res!269675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452716 () Bool)

(declare-fun res!269685 () Bool)

(assert (=> b!452716 (=> (not res!269685) (not e!265034))))

(assert (=> b!452716 (= res!269685 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13830 _keys!709))))))

(declare-fun b!452717 () Bool)

(declare-fun res!269684 () Bool)

(assert (=> b!452717 (=> (not res!269684) (not e!265038))))

(assert (=> b!452717 (= res!269684 (bvsle from!863 i!563))))

(declare-fun bm!29984 () Bool)

(assert (=> bm!29984 (= call!29986 (getCurrentListMapNoExtraKeys!1677 (ite c!56135 _keys!709 lt!205392) (ite c!56135 _values!549 lt!205387) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452718 () Bool)

(declare-fun res!269678 () Bool)

(assert (=> b!452718 (=> (not res!269678) (not e!265034))))

(assert (=> b!452718 (= res!269678 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19830 () Bool)

(declare-fun tp!38196 () Bool)

(assert (=> mapNonEmpty!19830 (= mapRes!19830 (and tp!38196 e!265033))))

(declare-fun mapKey!19830 () (_ BitVec 32))

(declare-fun mapValue!19830 () ValueCell!5721)

(declare-fun mapRest!19830 () (Array (_ BitVec 32) ValueCell!5721))

(assert (=> mapNonEmpty!19830 (= (arr!13477 _values!549) (store mapRest!19830 mapKey!19830 mapValue!19830))))

(declare-fun b!452719 () Bool)

(declare-fun res!269676 () Bool)

(assert (=> b!452719 (=> (not res!269676) (not e!265034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452719 (= res!269676 (validMask!0 mask!1025))))

(declare-fun b!452720 () Bool)

(assert (=> b!452720 (= e!265040 (and e!265036 mapRes!19830))))

(declare-fun condMapEmpty!19830 () Bool)

(declare-fun mapDefault!19830 () ValueCell!5721)

(assert (=> b!452720 (= condMapEmpty!19830 (= (arr!13477 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5721)) mapDefault!19830)))))

(declare-fun b!452721 () Bool)

(assert (=> b!452721 (= e!265032 (= call!29986 call!29987))))

(declare-fun b!452722 () Bool)

(assert (=> b!452722 (= e!265039 true)))

(declare-fun lt!205390 () ListLongMap!6957)

(declare-fun lt!205388 () tuple2!8044)

(declare-fun lt!205397 () V!17277)

(assert (=> b!452722 (= (+!1570 lt!205390 lt!205388) (+!1570 (+!1570 lt!205390 (tuple2!8045 k0!794 lt!205397)) lt!205388))))

(declare-fun lt!205394 () V!17277)

(assert (=> b!452722 (= lt!205388 (tuple2!8045 k0!794 lt!205394))))

(declare-fun lt!205391 () Unit!13236)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!82 (ListLongMap!6957 (_ BitVec 64) V!17277 V!17277) Unit!13236)

(assert (=> b!452722 (= lt!205391 (addSameAsAddTwiceSameKeyDiffValues!82 lt!205390 k0!794 lt!205397 lt!205394))))

(declare-fun lt!205395 () V!17277)

(declare-fun get!6644 (ValueCell!5721 V!17277) V!17277)

(assert (=> b!452722 (= lt!205397 (get!6644 (select (arr!13477 _values!549) from!863) lt!205395))))

(assert (=> b!452722 (= lt!205389 (+!1570 lt!205390 (tuple2!8045 (select (arr!13478 lt!205392) from!863) lt!205394)))))

(assert (=> b!452722 (= lt!205394 (get!6644 (select (store (arr!13477 _values!549) i!563 (ValueCellFull!5721 v!412)) from!863) lt!205395))))

(declare-fun dynLambda!869 (Int (_ BitVec 64)) V!17277)

(assert (=> b!452722 (= lt!205395 (dynLambda!869 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452722 (= lt!205390 (getCurrentListMapNoExtraKeys!1677 lt!205392 lt!205387 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452723 () Bool)

(declare-fun res!269683 () Bool)

(assert (=> b!452723 (=> (not res!269683) (not e!265034))))

(assert (=> b!452723 (= res!269683 (or (= (select (arr!13478 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13478 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452724 () Bool)

(declare-fun res!269687 () Bool)

(assert (=> b!452724 (=> (not res!269687) (not e!265034))))

(declare-fun arrayContainsKey!0 (array!28067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452724 (= res!269687 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452725 () Bool)

(declare-fun res!269682 () Bool)

(assert (=> b!452725 (=> (not res!269682) (not e!265034))))

(assert (=> b!452725 (= res!269682 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8099))))

(assert (= (and start!40802 res!269680) b!452719))

(assert (= (and b!452719 res!269676) b!452710))

(assert (= (and b!452710 res!269681) b!452715))

(assert (= (and b!452715 res!269675) b!452725))

(assert (= (and b!452725 res!269682) b!452716))

(assert (= (and b!452716 res!269685) b!452718))

(assert (= (and b!452718 res!269678) b!452723))

(assert (= (and b!452723 res!269683) b!452724))

(assert (= (and b!452724 res!269687) b!452714))

(assert (= (and b!452714 res!269677) b!452708))

(assert (= (and b!452708 res!269674) b!452717))

(assert (= (and b!452717 res!269684) b!452707))

(assert (= (and b!452707 res!269686) b!452713))

(assert (= (and b!452713 c!56135) b!452711))

(assert (= (and b!452713 (not c!56135)) b!452721))

(assert (= (or b!452711 b!452721) bm!29983))

(assert (= (or b!452711 b!452721) bm!29984))

(assert (= (and b!452713 (not res!269679)) b!452722))

(assert (= (and b!452720 condMapEmpty!19830) mapIsEmpty!19830))

(assert (= (and b!452720 (not condMapEmpty!19830)) mapNonEmpty!19830))

(get-info :version)

(assert (= (and mapNonEmpty!19830 ((_ is ValueCellFull!5721) mapValue!19830)) b!452712))

(assert (= (and b!452720 ((_ is ValueCellFull!5721) mapDefault!19830)) b!452709))

(assert (= start!40802 b!452720))

(declare-fun b_lambda!9569 () Bool)

(assert (=> (not b_lambda!9569) (not b!452722)))

(declare-fun t!13914 () Bool)

(declare-fun tb!3771 () Bool)

(assert (=> (and start!40802 (= defaultEntry!557 defaultEntry!557) t!13914) tb!3771))

(declare-fun result!7079 () Bool)

(assert (=> tb!3771 (= result!7079 tp_is_empty!12129)))

(assert (=> b!452722 t!13914))

(declare-fun b_and!18871 () Bool)

(assert (= b_and!18869 (and (=> t!13914 result!7079) b_and!18871)))

(declare-fun m!436457 () Bool)

(assert (=> bm!29984 m!436457))

(declare-fun m!436459 () Bool)

(assert (=> b!452723 m!436459))

(declare-fun m!436461 () Bool)

(assert (=> b!452713 m!436461))

(assert (=> b!452713 m!436461))

(declare-fun m!436463 () Bool)

(assert (=> b!452713 m!436463))

(declare-fun m!436465 () Bool)

(assert (=> b!452713 m!436465))

(declare-fun m!436467 () Bool)

(assert (=> b!452724 m!436467))

(declare-fun m!436469 () Bool)

(assert (=> b!452719 m!436469))

(declare-fun m!436471 () Bool)

(assert (=> b!452711 m!436471))

(declare-fun m!436473 () Bool)

(assert (=> start!40802 m!436473))

(declare-fun m!436475 () Bool)

(assert (=> start!40802 m!436475))

(declare-fun m!436477 () Bool)

(assert (=> bm!29983 m!436477))

(declare-fun m!436479 () Bool)

(assert (=> b!452718 m!436479))

(declare-fun m!436481 () Bool)

(assert (=> b!452722 m!436481))

(declare-fun m!436483 () Bool)

(assert (=> b!452722 m!436483))

(declare-fun m!436485 () Bool)

(assert (=> b!452722 m!436485))

(declare-fun m!436487 () Bool)

(assert (=> b!452722 m!436487))

(assert (=> b!452722 m!436485))

(declare-fun m!436489 () Bool)

(assert (=> b!452722 m!436489))

(assert (=> b!452722 m!436481))

(declare-fun m!436491 () Bool)

(assert (=> b!452722 m!436491))

(declare-fun m!436493 () Bool)

(assert (=> b!452722 m!436493))

(declare-fun m!436495 () Bool)

(assert (=> b!452722 m!436495))

(declare-fun m!436497 () Bool)

(assert (=> b!452722 m!436497))

(declare-fun m!436499 () Bool)

(assert (=> b!452722 m!436499))

(declare-fun m!436501 () Bool)

(assert (=> b!452722 m!436501))

(declare-fun m!436503 () Bool)

(assert (=> b!452722 m!436503))

(assert (=> b!452722 m!436497))

(declare-fun m!436505 () Bool)

(assert (=> b!452722 m!436505))

(declare-fun m!436507 () Bool)

(assert (=> b!452707 m!436507))

(assert (=> b!452707 m!436501))

(declare-fun m!436509 () Bool)

(assert (=> b!452707 m!436509))

(declare-fun m!436511 () Bool)

(assert (=> mapNonEmpty!19830 m!436511))

(declare-fun m!436513 () Bool)

(assert (=> b!452708 m!436513))

(declare-fun m!436515 () Bool)

(assert (=> b!452715 m!436515))

(declare-fun m!436517 () Bool)

(assert (=> b!452725 m!436517))

(declare-fun m!436519 () Bool)

(assert (=> b!452714 m!436519))

(declare-fun m!436521 () Bool)

(assert (=> b!452714 m!436521))

(check-sat (not b!452708) (not b!452718) (not b!452722) (not b!452713) (not b_next!10791) (not b!452725) (not b!452715) b_and!18871 (not mapNonEmpty!19830) (not b!452714) (not start!40802) tp_is_empty!12129 (not bm!29984) (not b!452707) (not b!452711) (not b!452719) (not b!452724) (not bm!29983) (not b_lambda!9569))
(check-sat b_and!18871 (not b_next!10791))
