; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39416 () Bool)

(assert start!39416)

(declare-fun b_free!9697 () Bool)

(declare-fun b_next!9697 () Bool)

(assert (=> start!39416 (= b_free!9697 (not b_next!9697))))

(declare-fun tp!34619 () Bool)

(declare-fun b_and!17243 () Bool)

(assert (=> start!39416 (= tp!34619 b_and!17243)))

(declare-fun b!419578 () Bool)

(declare-fun e!249992 () Bool)

(declare-fun e!249988 () Bool)

(assert (=> b!419578 (= e!249992 e!249988)))

(declare-fun res!244701 () Bool)

(assert (=> b!419578 (=> (not res!244701) (not e!249988))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419578 (= res!244701 (= from!863 i!563))))

(declare-datatypes ((V!15571 0))(
  ( (V!15572 (val!5469 Int)) )
))
(declare-fun minValue!515 () V!15571)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15571)

(declare-datatypes ((ValueCell!5081 0))(
  ( (ValueCellFull!5081 (v!7710 V!15571)) (EmptyCell!5081) )
))
(declare-datatypes ((array!25531 0))(
  ( (array!25532 (arr!12215 (Array (_ BitVec 32) ValueCell!5081)) (size!12568 (_ BitVec 32))) )
))
(declare-fun lt!192350 () array!25531)

(declare-datatypes ((array!25533 0))(
  ( (array!25534 (arr!12216 (Array (_ BitVec 32) (_ BitVec 64))) (size!12569 (_ BitVec 32))) )
))
(declare-fun lt!192346 () array!25533)

(declare-datatypes ((tuple2!7144 0))(
  ( (tuple2!7145 (_1!3583 (_ BitVec 64)) (_2!3583 V!15571)) )
))
(declare-datatypes ((List!7142 0))(
  ( (Nil!7139) (Cons!7138 (h!7994 tuple2!7144) (t!12495 List!7142)) )
))
(declare-datatypes ((ListLongMap!6047 0))(
  ( (ListLongMap!6048 (toList!3039 List!7142)) )
))
(declare-fun lt!192341 () ListLongMap!6047)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1249 (array!25533 array!25531 (_ BitVec 32) (_ BitVec 32) V!15571 V!15571 (_ BitVec 32) Int) ListLongMap!6047)

(assert (=> b!419578 (= lt!192341 (getCurrentListMapNoExtraKeys!1249 lt!192346 lt!192350 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25531)

(declare-fun v!412 () V!15571)

(assert (=> b!419578 (= lt!192350 (array!25532 (store (arr!12215 _values!549) i!563 (ValueCellFull!5081 v!412)) (size!12568 _values!549)))))

(declare-fun lt!192348 () ListLongMap!6047)

(declare-fun _keys!709 () array!25533)

(assert (=> b!419578 (= lt!192348 (getCurrentListMapNoExtraKeys!1249 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419579 () Bool)

(declare-fun res!244697 () Bool)

(declare-fun e!249987 () Bool)

(assert (=> b!419579 (=> (not res!244697) (not e!249987))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419579 (= res!244697 (validKeyInArray!0 k0!794))))

(declare-fun b!419580 () Bool)

(declare-fun e!249989 () Bool)

(declare-fun call!29244 () ListLongMap!6047)

(declare-fun call!29245 () ListLongMap!6047)

(assert (=> b!419580 (= e!249989 (= call!29244 call!29245))))

(declare-fun mapIsEmpty!17895 () Bool)

(declare-fun mapRes!17895 () Bool)

(assert (=> mapIsEmpty!17895 mapRes!17895))

(declare-fun c!55188 () Bool)

(declare-fun bm!29241 () Bool)

(assert (=> bm!29241 (= call!29244 (getCurrentListMapNoExtraKeys!1249 (ite c!55188 _keys!709 lt!192346) (ite c!55188 _values!549 lt!192350) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29242 () Bool)

(assert (=> bm!29242 (= call!29245 (getCurrentListMapNoExtraKeys!1249 (ite c!55188 lt!192346 _keys!709) (ite c!55188 lt!192350 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419581 () Bool)

(declare-fun res!244699 () Bool)

(assert (=> b!419581 (=> (not res!244699) (not e!249992))))

(assert (=> b!419581 (= res!244699 (bvsle from!863 i!563))))

(declare-fun b!419582 () Bool)

(declare-fun res!244703 () Bool)

(assert (=> b!419582 (=> (not res!244703) (not e!249987))))

(assert (=> b!419582 (= res!244703 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12569 _keys!709))))))

(declare-fun b!419583 () Bool)

(assert (=> b!419583 (= e!249987 e!249992)))

(declare-fun res!244695 () Bool)

(assert (=> b!419583 (=> (not res!244695) (not e!249992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25533 (_ BitVec 32)) Bool)

(assert (=> b!419583 (= res!244695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192346 mask!1025))))

(assert (=> b!419583 (= lt!192346 (array!25534 (store (arr!12216 _keys!709) i!563 k0!794) (size!12569 _keys!709)))))

(declare-fun res!244694 () Bool)

(assert (=> start!39416 (=> (not res!244694) (not e!249987))))

(assert (=> start!39416 (= res!244694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12569 _keys!709))))))

(assert (=> start!39416 e!249987))

(declare-fun tp_is_empty!10849 () Bool)

(assert (=> start!39416 tp_is_empty!10849))

(assert (=> start!39416 tp!34619))

(assert (=> start!39416 true))

(declare-fun e!249991 () Bool)

(declare-fun array_inv!8950 (array!25531) Bool)

(assert (=> start!39416 (and (array_inv!8950 _values!549) e!249991)))

(declare-fun array_inv!8951 (array!25533) Bool)

(assert (=> start!39416 (array_inv!8951 _keys!709)))

(declare-fun b!419584 () Bool)

(declare-fun e!249985 () Bool)

(assert (=> b!419584 (= e!249985 tp_is_empty!10849)))

(declare-fun b!419585 () Bool)

(declare-fun res!244692 () Bool)

(assert (=> b!419585 (=> (not res!244692) (not e!249987))))

(assert (=> b!419585 (= res!244692 (or (= (select (arr!12216 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12216 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419586 () Bool)

(declare-fun e!249990 () Bool)

(assert (=> b!419586 (= e!249991 (and e!249990 mapRes!17895))))

(declare-fun condMapEmpty!17895 () Bool)

(declare-fun mapDefault!17895 () ValueCell!5081)

(assert (=> b!419586 (= condMapEmpty!17895 (= (arr!12215 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5081)) mapDefault!17895)))))

(declare-fun b!419587 () Bool)

(declare-fun e!249993 () Bool)

(assert (=> b!419587 (= e!249988 (not e!249993))))

(declare-fun res!244700 () Bool)

(assert (=> b!419587 (=> res!244700 e!249993)))

(assert (=> b!419587 (= res!244700 (validKeyInArray!0 (select (arr!12216 _keys!709) from!863)))))

(assert (=> b!419587 e!249989))

(assert (=> b!419587 (= c!55188 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12374 0))(
  ( (Unit!12375) )
))
(declare-fun lt!192340 () Unit!12374)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!440 (array!25533 array!25531 (_ BitVec 32) (_ BitVec 32) V!15571 V!15571 (_ BitVec 32) (_ BitVec 64) V!15571 (_ BitVec 32) Int) Unit!12374)

(assert (=> b!419587 (= lt!192340 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419588 () Bool)

(declare-fun res!244704 () Bool)

(assert (=> b!419588 (=> (not res!244704) (not e!249987))))

(assert (=> b!419588 (= res!244704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419589 () Bool)

(assert (=> b!419589 (= e!249990 tp_is_empty!10849)))

(declare-fun b!419590 () Bool)

(assert (=> b!419590 (= e!249993 true)))

(declare-fun lt!192344 () ListLongMap!6047)

(declare-fun lt!192345 () tuple2!7144)

(declare-fun lt!192349 () V!15571)

(declare-fun +!1265 (ListLongMap!6047 tuple2!7144) ListLongMap!6047)

(assert (=> b!419590 (= (+!1265 lt!192344 lt!192345) (+!1265 (+!1265 lt!192344 (tuple2!7145 k0!794 lt!192349)) lt!192345))))

(declare-fun lt!192342 () V!15571)

(assert (=> b!419590 (= lt!192345 (tuple2!7145 k0!794 lt!192342))))

(declare-fun lt!192343 () Unit!12374)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!50 (ListLongMap!6047 (_ BitVec 64) V!15571 V!15571) Unit!12374)

(assert (=> b!419590 (= lt!192343 (addSameAsAddTwiceSameKeyDiffValues!50 lt!192344 k0!794 lt!192349 lt!192342))))

(declare-fun lt!192347 () V!15571)

(declare-fun get!6057 (ValueCell!5081 V!15571) V!15571)

(assert (=> b!419590 (= lt!192349 (get!6057 (select (arr!12215 _values!549) from!863) lt!192347))))

(assert (=> b!419590 (= lt!192341 (+!1265 lt!192344 (tuple2!7145 (select (arr!12216 lt!192346) from!863) lt!192342)))))

(assert (=> b!419590 (= lt!192342 (get!6057 (select (store (arr!12215 _values!549) i!563 (ValueCellFull!5081 v!412)) from!863) lt!192347))))

(declare-fun dynLambda!707 (Int (_ BitVec 64)) V!15571)

(assert (=> b!419590 (= lt!192347 (dynLambda!707 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419590 (= lt!192344 (getCurrentListMapNoExtraKeys!1249 lt!192346 lt!192350 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419591 () Bool)

(declare-fun res!244702 () Bool)

(assert (=> b!419591 (=> (not res!244702) (not e!249992))))

(declare-datatypes ((List!7143 0))(
  ( (Nil!7140) (Cons!7139 (h!7995 (_ BitVec 64)) (t!12496 List!7143)) )
))
(declare-fun arrayNoDuplicates!0 (array!25533 (_ BitVec 32) List!7143) Bool)

(assert (=> b!419591 (= res!244702 (arrayNoDuplicates!0 lt!192346 #b00000000000000000000000000000000 Nil!7140))))

(declare-fun mapNonEmpty!17895 () Bool)

(declare-fun tp!34620 () Bool)

(assert (=> mapNonEmpty!17895 (= mapRes!17895 (and tp!34620 e!249985))))

(declare-fun mapKey!17895 () (_ BitVec 32))

(declare-fun mapRest!17895 () (Array (_ BitVec 32) ValueCell!5081))

(declare-fun mapValue!17895 () ValueCell!5081)

(assert (=> mapNonEmpty!17895 (= (arr!12215 _values!549) (store mapRest!17895 mapKey!17895 mapValue!17895))))

(declare-fun b!419592 () Bool)

(declare-fun res!244698 () Bool)

(assert (=> b!419592 (=> (not res!244698) (not e!249987))))

(assert (=> b!419592 (= res!244698 (and (= (size!12568 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12569 _keys!709) (size!12568 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419593 () Bool)

(assert (=> b!419593 (= e!249989 (= call!29245 (+!1265 call!29244 (tuple2!7145 k0!794 v!412))))))

(declare-fun b!419594 () Bool)

(declare-fun res!244696 () Bool)

(assert (=> b!419594 (=> (not res!244696) (not e!249987))))

(declare-fun arrayContainsKey!0 (array!25533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419594 (= res!244696 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419595 () Bool)

(declare-fun res!244693 () Bool)

(assert (=> b!419595 (=> (not res!244693) (not e!249987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419595 (= res!244693 (validMask!0 mask!1025))))

(declare-fun b!419596 () Bool)

(declare-fun res!244691 () Bool)

(assert (=> b!419596 (=> (not res!244691) (not e!249987))))

(assert (=> b!419596 (= res!244691 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7140))))

(assert (= (and start!39416 res!244694) b!419595))

(assert (= (and b!419595 res!244693) b!419592))

(assert (= (and b!419592 res!244698) b!419588))

(assert (= (and b!419588 res!244704) b!419596))

(assert (= (and b!419596 res!244691) b!419582))

(assert (= (and b!419582 res!244703) b!419579))

(assert (= (and b!419579 res!244697) b!419585))

(assert (= (and b!419585 res!244692) b!419594))

(assert (= (and b!419594 res!244696) b!419583))

(assert (= (and b!419583 res!244695) b!419591))

(assert (= (and b!419591 res!244702) b!419581))

(assert (= (and b!419581 res!244699) b!419578))

(assert (= (and b!419578 res!244701) b!419587))

(assert (= (and b!419587 c!55188) b!419593))

(assert (= (and b!419587 (not c!55188)) b!419580))

(assert (= (or b!419593 b!419580) bm!29242))

(assert (= (or b!419593 b!419580) bm!29241))

(assert (= (and b!419587 (not res!244700)) b!419590))

(assert (= (and b!419586 condMapEmpty!17895) mapIsEmpty!17895))

(assert (= (and b!419586 (not condMapEmpty!17895)) mapNonEmpty!17895))

(get-info :version)

(assert (= (and mapNonEmpty!17895 ((_ is ValueCellFull!5081) mapValue!17895)) b!419584))

(assert (= (and b!419586 ((_ is ValueCellFull!5081) mapDefault!17895)) b!419589))

(assert (= start!39416 b!419586))

(declare-fun b_lambda!8983 () Bool)

(assert (=> (not b_lambda!8983) (not b!419590)))

(declare-fun t!12494 () Bool)

(declare-fun tb!3311 () Bool)

(assert (=> (and start!39416 (= defaultEntry!557 defaultEntry!557) t!12494) tb!3311))

(declare-fun result!6157 () Bool)

(assert (=> tb!3311 (= result!6157 tp_is_empty!10849)))

(assert (=> b!419590 t!12494))

(declare-fun b_and!17245 () Bool)

(assert (= b_and!17243 (and (=> t!12494 result!6157) b_and!17245)))

(declare-fun m!408671 () Bool)

(assert (=> bm!29242 m!408671))

(declare-fun m!408673 () Bool)

(assert (=> b!419585 m!408673))

(declare-fun m!408675 () Bool)

(assert (=> bm!29241 m!408675))

(declare-fun m!408677 () Bool)

(assert (=> b!419591 m!408677))

(declare-fun m!408679 () Bool)

(assert (=> b!419583 m!408679))

(declare-fun m!408681 () Bool)

(assert (=> b!419583 m!408681))

(declare-fun m!408683 () Bool)

(assert (=> b!419588 m!408683))

(declare-fun m!408685 () Bool)

(assert (=> b!419587 m!408685))

(assert (=> b!419587 m!408685))

(declare-fun m!408687 () Bool)

(assert (=> b!419587 m!408687))

(declare-fun m!408689 () Bool)

(assert (=> b!419587 m!408689))

(declare-fun m!408691 () Bool)

(assert (=> b!419593 m!408691))

(declare-fun m!408693 () Bool)

(assert (=> b!419594 m!408693))

(declare-fun m!408695 () Bool)

(assert (=> b!419596 m!408695))

(declare-fun m!408697 () Bool)

(assert (=> start!39416 m!408697))

(declare-fun m!408699 () Bool)

(assert (=> start!39416 m!408699))

(declare-fun m!408701 () Bool)

(assert (=> b!419590 m!408701))

(declare-fun m!408703 () Bool)

(assert (=> b!419590 m!408703))

(declare-fun m!408705 () Bool)

(assert (=> b!419590 m!408705))

(declare-fun m!408707 () Bool)

(assert (=> b!419590 m!408707))

(declare-fun m!408709 () Bool)

(assert (=> b!419590 m!408709))

(declare-fun m!408711 () Bool)

(assert (=> b!419590 m!408711))

(declare-fun m!408713 () Bool)

(assert (=> b!419590 m!408713))

(declare-fun m!408715 () Bool)

(assert (=> b!419590 m!408715))

(declare-fun m!408717 () Bool)

(assert (=> b!419590 m!408717))

(declare-fun m!408719 () Bool)

(assert (=> b!419590 m!408719))

(assert (=> b!419590 m!408719))

(declare-fun m!408721 () Bool)

(assert (=> b!419590 m!408721))

(declare-fun m!408723 () Bool)

(assert (=> b!419590 m!408723))

(assert (=> b!419590 m!408717))

(declare-fun m!408725 () Bool)

(assert (=> b!419590 m!408725))

(assert (=> b!419590 m!408705))

(declare-fun m!408727 () Bool)

(assert (=> b!419578 m!408727))

(assert (=> b!419578 m!408711))

(declare-fun m!408729 () Bool)

(assert (=> b!419578 m!408729))

(declare-fun m!408731 () Bool)

(assert (=> b!419595 m!408731))

(declare-fun m!408733 () Bool)

(assert (=> mapNonEmpty!17895 m!408733))

(declare-fun m!408735 () Bool)

(assert (=> b!419579 m!408735))

(check-sat (not b!419579) (not b!419595) (not mapNonEmpty!17895) (not b_lambda!8983) (not b!419593) tp_is_empty!10849 b_and!17245 (not bm!29242) (not b!419578) (not b!419594) (not start!39416) (not b!419587) (not b_next!9697) (not bm!29241) (not b!419591) (not b!419583) (not b!419596) (not b!419590) (not b!419588))
(check-sat b_and!17245 (not b_next!9697))
