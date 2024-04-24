; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39818 () Bool)

(assert start!39818)

(declare-fun b_free!10099 () Bool)

(declare-fun b_next!10099 () Bool)

(assert (=> start!39818 (= b_free!10099 (not b_next!10099))))

(declare-fun tp!35826 () Bool)

(declare-fun b_and!17871 () Bool)

(assert (=> start!39818 (= tp!35826 b_and!17871)))

(declare-fun b!430221 () Bool)

(declare-fun e!254719 () Bool)

(declare-fun e!254710 () Bool)

(assert (=> b!430221 (= e!254719 (not e!254710))))

(declare-fun res!252796 () Bool)

(assert (=> b!430221 (=> res!252796 e!254710)))

(declare-datatypes ((array!26342 0))(
  ( (array!26343 (arr!12620 (Array (_ BitVec 32) (_ BitVec 64))) (size!12972 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26342)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430221 (= res!252796 (not (validKeyInArray!0 (select (arr!12620 _keys!709) from!863))))))

(declare-datatypes ((V!16107 0))(
  ( (V!16108 (val!5670 Int)) )
))
(declare-datatypes ((tuple2!7374 0))(
  ( (tuple2!7375 (_1!3698 (_ BitVec 64)) (_2!3698 V!16107)) )
))
(declare-datatypes ((List!7372 0))(
  ( (Nil!7369) (Cons!7368 (h!8224 tuple2!7374) (t!12912 List!7372)) )
))
(declare-datatypes ((ListLongMap!6289 0))(
  ( (ListLongMap!6290 (toList!3160 List!7372)) )
))
(declare-fun lt!196754 () ListLongMap!6289)

(declare-fun lt!196756 () ListLongMap!6289)

(assert (=> b!430221 (= lt!196754 lt!196756)))

(declare-fun lt!196757 () ListLongMap!6289)

(declare-fun lt!196760 () tuple2!7374)

(declare-fun +!1371 (ListLongMap!6289 tuple2!7374) ListLongMap!6289)

(assert (=> b!430221 (= lt!196756 (+!1371 lt!196757 lt!196760))))

(declare-fun minValue!515 () V!16107)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!196752 () array!26342)

(declare-fun zeroValue!515 () V!16107)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5282 0))(
  ( (ValueCellFull!5282 (v!7918 V!16107)) (EmptyCell!5282) )
))
(declare-datatypes ((array!26344 0))(
  ( (array!26345 (arr!12621 (Array (_ BitVec 32) ValueCell!5282)) (size!12973 (_ BitVec 32))) )
))
(declare-fun lt!196751 () array!26344)

(declare-fun getCurrentListMapNoExtraKeys!1403 (array!26342 array!26344 (_ BitVec 32) (_ BitVec 32) V!16107 V!16107 (_ BitVec 32) Int) ListLongMap!6289)

(assert (=> b!430221 (= lt!196754 (getCurrentListMapNoExtraKeys!1403 lt!196752 lt!196751 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16107)

(assert (=> b!430221 (= lt!196760 (tuple2!7375 k0!794 v!412))))

(declare-fun _values!549 () array!26344)

(assert (=> b!430221 (= lt!196757 (getCurrentListMapNoExtraKeys!1403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12658 0))(
  ( (Unit!12659) )
))
(declare-fun lt!196761 () Unit!12658)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!548 (array!26342 array!26344 (_ BitVec 32) (_ BitVec 32) V!16107 V!16107 (_ BitVec 32) (_ BitVec 64) V!16107 (_ BitVec 32) Int) Unit!12658)

(assert (=> b!430221 (= lt!196761 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!548 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430222 () Bool)

(declare-fun res!252795 () Bool)

(declare-fun e!254715 () Bool)

(assert (=> b!430222 (=> (not res!252795) (not e!254715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26342 (_ BitVec 32)) Bool)

(assert (=> b!430222 (= res!252795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430223 () Bool)

(declare-fun e!254718 () Bool)

(declare-fun tp_is_empty!11251 () Bool)

(assert (=> b!430223 (= e!254718 tp_is_empty!11251)))

(declare-fun b!430224 () Bool)

(declare-fun res!252800 () Bool)

(assert (=> b!430224 (=> (not res!252800) (not e!254715))))

(assert (=> b!430224 (= res!252800 (and (= (size!12973 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12972 _keys!709) (size!12973 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!252798 () Bool)

(assert (=> start!39818 (=> (not res!252798) (not e!254715))))

(assert (=> start!39818 (= res!252798 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12972 _keys!709))))))

(assert (=> start!39818 e!254715))

(assert (=> start!39818 tp_is_empty!11251))

(assert (=> start!39818 tp!35826))

(assert (=> start!39818 true))

(declare-fun e!254716 () Bool)

(declare-fun array_inv!9252 (array!26344) Bool)

(assert (=> start!39818 (and (array_inv!9252 _values!549) e!254716)))

(declare-fun array_inv!9253 (array!26342) Bool)

(assert (=> start!39818 (array_inv!9253 _keys!709)))

(declare-fun b!430225 () Bool)

(declare-fun res!252806 () Bool)

(assert (=> b!430225 (=> (not res!252806) (not e!254715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430225 (= res!252806 (validMask!0 mask!1025))))

(declare-fun b!430226 () Bool)

(declare-fun e!254713 () Bool)

(assert (=> b!430226 (= e!254713 tp_is_empty!11251)))

(declare-fun b!430227 () Bool)

(declare-fun res!252794 () Bool)

(assert (=> b!430227 (=> (not res!252794) (not e!254715))))

(assert (=> b!430227 (= res!252794 (or (= (select (arr!12620 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12620 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430228 () Bool)

(declare-fun e!254714 () Bool)

(assert (=> b!430228 (= e!254714 e!254719)))

(declare-fun res!252797 () Bool)

(assert (=> b!430228 (=> (not res!252797) (not e!254719))))

(assert (=> b!430228 (= res!252797 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196755 () ListLongMap!6289)

(assert (=> b!430228 (= lt!196755 (getCurrentListMapNoExtraKeys!1403 lt!196752 lt!196751 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430228 (= lt!196751 (array!26345 (store (arr!12621 _values!549) i!563 (ValueCellFull!5282 v!412)) (size!12973 _values!549)))))

(declare-fun lt!196759 () ListLongMap!6289)

(assert (=> b!430228 (= lt!196759 (getCurrentListMapNoExtraKeys!1403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430229 () Bool)

(declare-fun e!254717 () Unit!12658)

(declare-fun Unit!12660 () Unit!12658)

(assert (=> b!430229 (= e!254717 Unit!12660)))

(declare-fun b!430230 () Bool)

(declare-fun res!252793 () Bool)

(assert (=> b!430230 (=> (not res!252793) (not e!254715))))

(declare-datatypes ((List!7373 0))(
  ( (Nil!7370) (Cons!7369 (h!8225 (_ BitVec 64)) (t!12913 List!7373)) )
))
(declare-fun arrayNoDuplicates!0 (array!26342 (_ BitVec 32) List!7373) Bool)

(assert (=> b!430230 (= res!252793 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7370))))

(declare-fun b!430231 () Bool)

(declare-fun res!252803 () Bool)

(assert (=> b!430231 (=> (not res!252803) (not e!254715))))

(declare-fun arrayContainsKey!0 (array!26342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430231 (= res!252803 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18498 () Bool)

(declare-fun mapRes!18498 () Bool)

(declare-fun tp!35825 () Bool)

(assert (=> mapNonEmpty!18498 (= mapRes!18498 (and tp!35825 e!254713))))

(declare-fun mapKey!18498 () (_ BitVec 32))

(declare-fun mapValue!18498 () ValueCell!5282)

(declare-fun mapRest!18498 () (Array (_ BitVec 32) ValueCell!5282))

(assert (=> mapNonEmpty!18498 (= (arr!12621 _values!549) (store mapRest!18498 mapKey!18498 mapValue!18498))))

(declare-fun b!430232 () Bool)

(declare-fun e!254711 () Bool)

(assert (=> b!430232 (= e!254711 true)))

(declare-fun lt!196764 () ListLongMap!6289)

(declare-fun lt!196762 () tuple2!7374)

(assert (=> b!430232 (= lt!196764 (+!1371 (+!1371 lt!196757 lt!196762) lt!196760))))

(declare-fun lt!196763 () V!16107)

(declare-fun lt!196753 () Unit!12658)

(declare-fun addCommutativeForDiffKeys!352 (ListLongMap!6289 (_ BitVec 64) V!16107 (_ BitVec 64) V!16107) Unit!12658)

(assert (=> b!430232 (= lt!196753 (addCommutativeForDiffKeys!352 lt!196757 k0!794 v!412 (select (arr!12620 _keys!709) from!863) lt!196763))))

(declare-fun b!430233 () Bool)

(declare-fun res!252807 () Bool)

(assert (=> b!430233 (=> (not res!252807) (not e!254714))))

(assert (=> b!430233 (= res!252807 (arrayNoDuplicates!0 lt!196752 #b00000000000000000000000000000000 Nil!7370))))

(declare-fun b!430234 () Bool)

(assert (=> b!430234 (= e!254716 (and e!254718 mapRes!18498))))

(declare-fun condMapEmpty!18498 () Bool)

(declare-fun mapDefault!18498 () ValueCell!5282)

(assert (=> b!430234 (= condMapEmpty!18498 (= (arr!12621 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5282)) mapDefault!18498)))))

(declare-fun b!430235 () Bool)

(declare-fun res!252799 () Bool)

(assert (=> b!430235 (=> (not res!252799) (not e!254715))))

(assert (=> b!430235 (= res!252799 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18498 () Bool)

(assert (=> mapIsEmpty!18498 mapRes!18498))

(declare-fun b!430236 () Bool)

(declare-fun Unit!12661 () Unit!12658)

(assert (=> b!430236 (= e!254717 Unit!12661)))

(declare-fun lt!196758 () Unit!12658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26342 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12658)

(assert (=> b!430236 (= lt!196758 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430236 false))

(declare-fun b!430237 () Bool)

(assert (=> b!430237 (= e!254710 e!254711)))

(declare-fun res!252801 () Bool)

(assert (=> b!430237 (=> res!252801 e!254711)))

(assert (=> b!430237 (= res!252801 (= k0!794 (select (arr!12620 _keys!709) from!863)))))

(assert (=> b!430237 (not (= (select (arr!12620 _keys!709) from!863) k0!794))))

(declare-fun lt!196750 () Unit!12658)

(assert (=> b!430237 (= lt!196750 e!254717)))

(declare-fun c!55461 () Bool)

(assert (=> b!430237 (= c!55461 (= (select (arr!12620 _keys!709) from!863) k0!794))))

(assert (=> b!430237 (= lt!196755 lt!196764)))

(assert (=> b!430237 (= lt!196764 (+!1371 lt!196756 lt!196762))))

(assert (=> b!430237 (= lt!196762 (tuple2!7375 (select (arr!12620 _keys!709) from!863) lt!196763))))

(declare-fun get!6271 (ValueCell!5282 V!16107) V!16107)

(declare-fun dynLambda!784 (Int (_ BitVec 64)) V!16107)

(assert (=> b!430237 (= lt!196763 (get!6271 (select (arr!12621 _values!549) from!863) (dynLambda!784 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430238 () Bool)

(assert (=> b!430238 (= e!254715 e!254714)))

(declare-fun res!252805 () Bool)

(assert (=> b!430238 (=> (not res!252805) (not e!254714))))

(assert (=> b!430238 (= res!252805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196752 mask!1025))))

(assert (=> b!430238 (= lt!196752 (array!26343 (store (arr!12620 _keys!709) i!563 k0!794) (size!12972 _keys!709)))))

(declare-fun b!430239 () Bool)

(declare-fun res!252804 () Bool)

(assert (=> b!430239 (=> (not res!252804) (not e!254714))))

(assert (=> b!430239 (= res!252804 (bvsle from!863 i!563))))

(declare-fun b!430240 () Bool)

(declare-fun res!252802 () Bool)

(assert (=> b!430240 (=> (not res!252802) (not e!254715))))

(assert (=> b!430240 (= res!252802 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12972 _keys!709))))))

(assert (= (and start!39818 res!252798) b!430225))

(assert (= (and b!430225 res!252806) b!430224))

(assert (= (and b!430224 res!252800) b!430222))

(assert (= (and b!430222 res!252795) b!430230))

(assert (= (and b!430230 res!252793) b!430240))

(assert (= (and b!430240 res!252802) b!430235))

(assert (= (and b!430235 res!252799) b!430227))

(assert (= (and b!430227 res!252794) b!430231))

(assert (= (and b!430231 res!252803) b!430238))

(assert (= (and b!430238 res!252805) b!430233))

(assert (= (and b!430233 res!252807) b!430239))

(assert (= (and b!430239 res!252804) b!430228))

(assert (= (and b!430228 res!252797) b!430221))

(assert (= (and b!430221 (not res!252796)) b!430237))

(assert (= (and b!430237 c!55461) b!430236))

(assert (= (and b!430237 (not c!55461)) b!430229))

(assert (= (and b!430237 (not res!252801)) b!430232))

(assert (= (and b!430234 condMapEmpty!18498) mapIsEmpty!18498))

(assert (= (and b!430234 (not condMapEmpty!18498)) mapNonEmpty!18498))

(get-info :version)

(assert (= (and mapNonEmpty!18498 ((_ is ValueCellFull!5282) mapValue!18498)) b!430226))

(assert (= (and b!430234 ((_ is ValueCellFull!5282) mapDefault!18498)) b!430223))

(assert (= start!39818 b!430234))

(declare-fun b_lambda!9209 () Bool)

(assert (=> (not b_lambda!9209) (not b!430237)))

(declare-fun t!12911 () Bool)

(declare-fun tb!3497 () Bool)

(assert (=> (and start!39818 (= defaultEntry!557 defaultEntry!557) t!12911) tb!3497))

(declare-fun result!6529 () Bool)

(assert (=> tb!3497 (= result!6529 tp_is_empty!11251)))

(assert (=> b!430237 t!12911))

(declare-fun b_and!17873 () Bool)

(assert (= b_and!17871 (and (=> t!12911 result!6529) b_and!17873)))

(declare-fun m!418709 () Bool)

(assert (=> b!430227 m!418709))

(declare-fun m!418711 () Bool)

(assert (=> b!430230 m!418711))

(declare-fun m!418713 () Bool)

(assert (=> b!430225 m!418713))

(declare-fun m!418715 () Bool)

(assert (=> b!430231 m!418715))

(declare-fun m!418717 () Bool)

(assert (=> start!39818 m!418717))

(declare-fun m!418719 () Bool)

(assert (=> start!39818 m!418719))

(declare-fun m!418721 () Bool)

(assert (=> b!430222 m!418721))

(declare-fun m!418723 () Bool)

(assert (=> b!430236 m!418723))

(declare-fun m!418725 () Bool)

(assert (=> b!430235 m!418725))

(declare-fun m!418727 () Bool)

(assert (=> b!430228 m!418727))

(declare-fun m!418729 () Bool)

(assert (=> b!430228 m!418729))

(declare-fun m!418731 () Bool)

(assert (=> b!430228 m!418731))

(declare-fun m!418733 () Bool)

(assert (=> b!430221 m!418733))

(declare-fun m!418735 () Bool)

(assert (=> b!430221 m!418735))

(declare-fun m!418737 () Bool)

(assert (=> b!430221 m!418737))

(declare-fun m!418739 () Bool)

(assert (=> b!430221 m!418739))

(assert (=> b!430221 m!418733))

(declare-fun m!418741 () Bool)

(assert (=> b!430221 m!418741))

(declare-fun m!418743 () Bool)

(assert (=> b!430221 m!418743))

(declare-fun m!418745 () Bool)

(assert (=> b!430238 m!418745))

(declare-fun m!418747 () Bool)

(assert (=> b!430238 m!418747))

(declare-fun m!418749 () Bool)

(assert (=> mapNonEmpty!18498 m!418749))

(assert (=> b!430237 m!418733))

(declare-fun m!418751 () Bool)

(assert (=> b!430237 m!418751))

(declare-fun m!418753 () Bool)

(assert (=> b!430237 m!418753))

(declare-fun m!418755 () Bool)

(assert (=> b!430237 m!418755))

(assert (=> b!430237 m!418755))

(assert (=> b!430237 m!418751))

(declare-fun m!418757 () Bool)

(assert (=> b!430237 m!418757))

(declare-fun m!418759 () Bool)

(assert (=> b!430233 m!418759))

(declare-fun m!418761 () Bool)

(assert (=> b!430232 m!418761))

(assert (=> b!430232 m!418761))

(declare-fun m!418763 () Bool)

(assert (=> b!430232 m!418763))

(assert (=> b!430232 m!418733))

(assert (=> b!430232 m!418733))

(declare-fun m!418765 () Bool)

(assert (=> b!430232 m!418765))

(check-sat (not b!430237) (not b_lambda!9209) tp_is_empty!11251 b_and!17873 (not b!430228) (not start!39818) (not b!430221) (not b!430233) (not b!430236) (not b!430231) (not b!430225) (not mapNonEmpty!18498) (not b!430232) (not b!430230) (not b_next!10099) (not b!430222) (not b!430238) (not b!430235))
(check-sat b_and!17873 (not b_next!10099))
