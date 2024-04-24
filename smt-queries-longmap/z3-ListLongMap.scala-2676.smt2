; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39860 () Bool)

(assert start!39860)

(declare-fun b_free!10141 () Bool)

(declare-fun b_next!10141 () Bool)

(assert (=> start!39860 (= b_free!10141 (not b_next!10141))))

(declare-fun tp!35951 () Bool)

(declare-fun b_and!17955 () Bool)

(assert (=> start!39860 (= tp!35951 b_and!17955)))

(declare-fun b!431523 () Bool)

(declare-fun e!255343 () Bool)

(declare-fun tp_is_empty!11293 () Bool)

(assert (=> b!431523 (= e!255343 tp_is_empty!11293)))

(declare-fun b!431525 () Bool)

(declare-datatypes ((Unit!12732 0))(
  ( (Unit!12733) )
))
(declare-fun e!255342 () Unit!12732)

(declare-fun Unit!12734 () Unit!12732)

(assert (=> b!431525 (= e!255342 Unit!12734)))

(declare-fun b!431526 () Bool)

(declare-fun res!253750 () Bool)

(declare-fun e!255347 () Bool)

(assert (=> b!431526 (=> (not res!253750) (not e!255347))))

(declare-datatypes ((array!26426 0))(
  ( (array!26427 (arr!12662 (Array (_ BitVec 32) (_ BitVec 64))) (size!13014 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26426)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26426 (_ BitVec 32)) Bool)

(assert (=> b!431526 (= res!253750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431527 () Bool)

(declare-fun res!253747 () Bool)

(assert (=> b!431527 (=> (not res!253747) (not e!255347))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431527 (= res!253747 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431528 () Bool)

(declare-fun e!255345 () Bool)

(declare-fun e!255349 () Bool)

(assert (=> b!431528 (= e!255345 e!255349)))

(declare-fun res!253739 () Bool)

(assert (=> b!431528 (=> (not res!253739) (not e!255349))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431528 (= res!253739 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16163 0))(
  ( (V!16164 (val!5691 Int)) )
))
(declare-fun minValue!515 () V!16163)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!197709 () array!26426)

(declare-fun zeroValue!515 () V!16163)

(declare-datatypes ((ValueCell!5303 0))(
  ( (ValueCellFull!5303 (v!7939 V!16163)) (EmptyCell!5303) )
))
(declare-datatypes ((array!26428 0))(
  ( (array!26429 (arr!12663 (Array (_ BitVec 32) ValueCell!5303)) (size!13015 (_ BitVec 32))) )
))
(declare-fun lt!197707 () array!26428)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7416 0))(
  ( (tuple2!7417 (_1!3719 (_ BitVec 64)) (_2!3719 V!16163)) )
))
(declare-datatypes ((List!7412 0))(
  ( (Nil!7409) (Cons!7408 (h!8264 tuple2!7416) (t!12994 List!7412)) )
))
(declare-datatypes ((ListLongMap!6331 0))(
  ( (ListLongMap!6332 (toList!3181 List!7412)) )
))
(declare-fun lt!197703 () ListLongMap!6331)

(declare-fun getCurrentListMapNoExtraKeys!1422 (array!26426 array!26428 (_ BitVec 32) (_ BitVec 32) V!16163 V!16163 (_ BitVec 32) Int) ListLongMap!6331)

(assert (=> b!431528 (= lt!197703 (getCurrentListMapNoExtraKeys!1422 lt!197709 lt!197707 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26428)

(declare-fun v!412 () V!16163)

(assert (=> b!431528 (= lt!197707 (array!26429 (store (arr!12663 _values!549) i!563 (ValueCellFull!5303 v!412)) (size!13015 _values!549)))))

(declare-fun lt!197702 () ListLongMap!6331)

(assert (=> b!431528 (= lt!197702 (getCurrentListMapNoExtraKeys!1422 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431529 () Bool)

(declare-fun e!255341 () Bool)

(declare-fun e!255344 () Bool)

(assert (=> b!431529 (= e!255341 e!255344)))

(declare-fun res!253746 () Bool)

(assert (=> b!431529 (=> res!253746 e!255344)))

(assert (=> b!431529 (= res!253746 (= k0!794 (select (arr!12662 _keys!709) from!863)))))

(assert (=> b!431529 (not (= (select (arr!12662 _keys!709) from!863) k0!794))))

(declare-fun lt!197697 () Unit!12732)

(assert (=> b!431529 (= lt!197697 e!255342)))

(declare-fun c!55524 () Bool)

(assert (=> b!431529 (= c!55524 (= (select (arr!12662 _keys!709) from!863) k0!794))))

(declare-fun lt!197695 () ListLongMap!6331)

(assert (=> b!431529 (= lt!197703 lt!197695)))

(declare-fun lt!197698 () ListLongMap!6331)

(declare-fun lt!197701 () tuple2!7416)

(declare-fun +!1389 (ListLongMap!6331 tuple2!7416) ListLongMap!6331)

(assert (=> b!431529 (= lt!197695 (+!1389 lt!197698 lt!197701))))

(declare-fun lt!197699 () V!16163)

(assert (=> b!431529 (= lt!197701 (tuple2!7417 (select (arr!12662 _keys!709) from!863) lt!197699))))

(declare-fun get!6299 (ValueCell!5303 V!16163) V!16163)

(declare-fun dynLambda!798 (Int (_ BitVec 64)) V!16163)

(assert (=> b!431529 (= lt!197699 (get!6299 (select (arr!12663 _values!549) from!863) (dynLambda!798 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431530 () Bool)

(declare-fun res!253751 () Bool)

(assert (=> b!431530 (=> (not res!253751) (not e!255347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431530 (= res!253751 (validMask!0 mask!1025))))

(declare-fun b!431531 () Bool)

(declare-fun res!253749 () Bool)

(assert (=> b!431531 (=> (not res!253749) (not e!255347))))

(assert (=> b!431531 (= res!253749 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13014 _keys!709))))))

(declare-fun b!431532 () Bool)

(declare-fun res!253738 () Bool)

(assert (=> b!431532 (=> (not res!253738) (not e!255345))))

(assert (=> b!431532 (= res!253738 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18561 () Bool)

(declare-fun mapRes!18561 () Bool)

(declare-fun tp!35952 () Bool)

(assert (=> mapNonEmpty!18561 (= mapRes!18561 (and tp!35952 e!255343))))

(declare-fun mapKey!18561 () (_ BitVec 32))

(declare-fun mapValue!18561 () ValueCell!5303)

(declare-fun mapRest!18561 () (Array (_ BitVec 32) ValueCell!5303))

(assert (=> mapNonEmpty!18561 (= (arr!12663 _values!549) (store mapRest!18561 mapKey!18561 mapValue!18561))))

(declare-fun b!431533 () Bool)

(declare-fun e!255346 () Bool)

(declare-fun e!255348 () Bool)

(assert (=> b!431533 (= e!255346 (and e!255348 mapRes!18561))))

(declare-fun condMapEmpty!18561 () Bool)

(declare-fun mapDefault!18561 () ValueCell!5303)

(assert (=> b!431533 (= condMapEmpty!18561 (= (arr!12663 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5303)) mapDefault!18561)))))

(declare-fun b!431534 () Bool)

(assert (=> b!431534 (= e!255344 true)))

(declare-fun lt!197706 () tuple2!7416)

(declare-fun lt!197696 () ListLongMap!6331)

(assert (=> b!431534 (= lt!197695 (+!1389 (+!1389 lt!197696 lt!197701) lt!197706))))

(declare-fun lt!197705 () Unit!12732)

(declare-fun addCommutativeForDiffKeys!368 (ListLongMap!6331 (_ BitVec 64) V!16163 (_ BitVec 64) V!16163) Unit!12732)

(assert (=> b!431534 (= lt!197705 (addCommutativeForDiffKeys!368 lt!197696 k0!794 v!412 (select (arr!12662 _keys!709) from!863) lt!197699))))

(declare-fun res!253741 () Bool)

(assert (=> start!39860 (=> (not res!253741) (not e!255347))))

(assert (=> start!39860 (= res!253741 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13014 _keys!709))))))

(assert (=> start!39860 e!255347))

(assert (=> start!39860 tp_is_empty!11293))

(assert (=> start!39860 tp!35951))

(assert (=> start!39860 true))

(declare-fun array_inv!9276 (array!26428) Bool)

(assert (=> start!39860 (and (array_inv!9276 _values!549) e!255346)))

(declare-fun array_inv!9277 (array!26426) Bool)

(assert (=> start!39860 (array_inv!9277 _keys!709)))

(declare-fun b!431524 () Bool)

(assert (=> b!431524 (= e!255348 tp_is_empty!11293)))

(declare-fun b!431535 () Bool)

(declare-fun res!253742 () Bool)

(assert (=> b!431535 (=> (not res!253742) (not e!255347))))

(assert (=> b!431535 (= res!253742 (or (= (select (arr!12662 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12662 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431536 () Bool)

(declare-fun Unit!12735 () Unit!12732)

(assert (=> b!431536 (= e!255342 Unit!12735)))

(declare-fun lt!197700 () Unit!12732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26426 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12732)

(assert (=> b!431536 (= lt!197700 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431536 false))

(declare-fun b!431537 () Bool)

(declare-fun res!253745 () Bool)

(assert (=> b!431537 (=> (not res!253745) (not e!255347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431537 (= res!253745 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18561 () Bool)

(assert (=> mapIsEmpty!18561 mapRes!18561))

(declare-fun b!431538 () Bool)

(declare-fun res!253743 () Bool)

(assert (=> b!431538 (=> (not res!253743) (not e!255347))))

(assert (=> b!431538 (= res!253743 (and (= (size!13015 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13014 _keys!709) (size!13015 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431539 () Bool)

(declare-fun res!253752 () Bool)

(assert (=> b!431539 (=> (not res!253752) (not e!255347))))

(declare-datatypes ((List!7413 0))(
  ( (Nil!7410) (Cons!7409 (h!8265 (_ BitVec 64)) (t!12995 List!7413)) )
))
(declare-fun arrayNoDuplicates!0 (array!26426 (_ BitVec 32) List!7413) Bool)

(assert (=> b!431539 (= res!253752 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7410))))

(declare-fun b!431540 () Bool)

(assert (=> b!431540 (= e!255349 (not e!255341))))

(declare-fun res!253744 () Bool)

(assert (=> b!431540 (=> res!253744 e!255341)))

(assert (=> b!431540 (= res!253744 (not (validKeyInArray!0 (select (arr!12662 _keys!709) from!863))))))

(declare-fun lt!197704 () ListLongMap!6331)

(assert (=> b!431540 (= lt!197704 lt!197698)))

(assert (=> b!431540 (= lt!197698 (+!1389 lt!197696 lt!197706))))

(assert (=> b!431540 (= lt!197704 (getCurrentListMapNoExtraKeys!1422 lt!197709 lt!197707 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431540 (= lt!197706 (tuple2!7417 k0!794 v!412))))

(assert (=> b!431540 (= lt!197696 (getCurrentListMapNoExtraKeys!1422 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197708 () Unit!12732)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!563 (array!26426 array!26428 (_ BitVec 32) (_ BitVec 32) V!16163 V!16163 (_ BitVec 32) (_ BitVec 64) V!16163 (_ BitVec 32) Int) Unit!12732)

(assert (=> b!431540 (= lt!197708 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431541 () Bool)

(assert (=> b!431541 (= e!255347 e!255345)))

(declare-fun res!253740 () Bool)

(assert (=> b!431541 (=> (not res!253740) (not e!255345))))

(assert (=> b!431541 (= res!253740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197709 mask!1025))))

(assert (=> b!431541 (= lt!197709 (array!26427 (store (arr!12662 _keys!709) i!563 k0!794) (size!13014 _keys!709)))))

(declare-fun b!431542 () Bool)

(declare-fun res!253748 () Bool)

(assert (=> b!431542 (=> (not res!253748) (not e!255345))))

(assert (=> b!431542 (= res!253748 (arrayNoDuplicates!0 lt!197709 #b00000000000000000000000000000000 Nil!7410))))

(assert (= (and start!39860 res!253741) b!431530))

(assert (= (and b!431530 res!253751) b!431538))

(assert (= (and b!431538 res!253743) b!431526))

(assert (= (and b!431526 res!253750) b!431539))

(assert (= (and b!431539 res!253752) b!431531))

(assert (= (and b!431531 res!253749) b!431537))

(assert (= (and b!431537 res!253745) b!431535))

(assert (= (and b!431535 res!253742) b!431527))

(assert (= (and b!431527 res!253747) b!431541))

(assert (= (and b!431541 res!253740) b!431542))

(assert (= (and b!431542 res!253748) b!431532))

(assert (= (and b!431532 res!253738) b!431528))

(assert (= (and b!431528 res!253739) b!431540))

(assert (= (and b!431540 (not res!253744)) b!431529))

(assert (= (and b!431529 c!55524) b!431536))

(assert (= (and b!431529 (not c!55524)) b!431525))

(assert (= (and b!431529 (not res!253746)) b!431534))

(assert (= (and b!431533 condMapEmpty!18561) mapIsEmpty!18561))

(assert (= (and b!431533 (not condMapEmpty!18561)) mapNonEmpty!18561))

(get-info :version)

(assert (= (and mapNonEmpty!18561 ((_ is ValueCellFull!5303) mapValue!18561)) b!431523))

(assert (= (and b!431533 ((_ is ValueCellFull!5303) mapDefault!18561)) b!431524))

(assert (= start!39860 b!431533))

(declare-fun b_lambda!9251 () Bool)

(assert (=> (not b_lambda!9251) (not b!431529)))

(declare-fun t!12993 () Bool)

(declare-fun tb!3539 () Bool)

(assert (=> (and start!39860 (= defaultEntry!557 defaultEntry!557) t!12993) tb!3539))

(declare-fun result!6613 () Bool)

(assert (=> tb!3539 (= result!6613 tp_is_empty!11293)))

(assert (=> b!431529 t!12993))

(declare-fun b_and!17957 () Bool)

(assert (= b_and!17955 (and (=> t!12993 result!6613) b_and!17957)))

(declare-fun m!419927 () Bool)

(assert (=> b!431534 m!419927))

(assert (=> b!431534 m!419927))

(declare-fun m!419929 () Bool)

(assert (=> b!431534 m!419929))

(declare-fun m!419931 () Bool)

(assert (=> b!431534 m!419931))

(assert (=> b!431534 m!419931))

(declare-fun m!419933 () Bool)

(assert (=> b!431534 m!419933))

(declare-fun m!419935 () Bool)

(assert (=> b!431528 m!419935))

(declare-fun m!419937 () Bool)

(assert (=> b!431528 m!419937))

(declare-fun m!419939 () Bool)

(assert (=> b!431528 m!419939))

(assert (=> b!431529 m!419931))

(declare-fun m!419941 () Bool)

(assert (=> b!431529 m!419941))

(declare-fun m!419943 () Bool)

(assert (=> b!431529 m!419943))

(declare-fun m!419945 () Bool)

(assert (=> b!431529 m!419945))

(assert (=> b!431529 m!419943))

(assert (=> b!431529 m!419941))

(declare-fun m!419947 () Bool)

(assert (=> b!431529 m!419947))

(declare-fun m!419949 () Bool)

(assert (=> b!431536 m!419949))

(declare-fun m!419951 () Bool)

(assert (=> mapNonEmpty!18561 m!419951))

(declare-fun m!419953 () Bool)

(assert (=> b!431537 m!419953))

(assert (=> b!431540 m!419931))

(declare-fun m!419955 () Bool)

(assert (=> b!431540 m!419955))

(assert (=> b!431540 m!419931))

(declare-fun m!419957 () Bool)

(assert (=> b!431540 m!419957))

(declare-fun m!419959 () Bool)

(assert (=> b!431540 m!419959))

(declare-fun m!419961 () Bool)

(assert (=> b!431540 m!419961))

(declare-fun m!419963 () Bool)

(assert (=> b!431540 m!419963))

(declare-fun m!419965 () Bool)

(assert (=> b!431539 m!419965))

(declare-fun m!419967 () Bool)

(assert (=> b!431535 m!419967))

(declare-fun m!419969 () Bool)

(assert (=> b!431542 m!419969))

(declare-fun m!419971 () Bool)

(assert (=> b!431541 m!419971))

(declare-fun m!419973 () Bool)

(assert (=> b!431541 m!419973))

(declare-fun m!419975 () Bool)

(assert (=> b!431527 m!419975))

(declare-fun m!419977 () Bool)

(assert (=> b!431526 m!419977))

(declare-fun m!419979 () Bool)

(assert (=> b!431530 m!419979))

(declare-fun m!419981 () Bool)

(assert (=> start!39860 m!419981))

(declare-fun m!419983 () Bool)

(assert (=> start!39860 m!419983))

(check-sat (not b_lambda!9251) (not b!431526) (not b!431542) b_and!17957 (not b!431529) (not b!431537) (not mapNonEmpty!18561) (not b!431541) (not b!431536) (not start!39860) (not b!431530) (not b!431540) (not b!431534) (not b!431527) (not b!431528) (not b!431539) tp_is_empty!11293 (not b_next!10141))
(check-sat b_and!17957 (not b_next!10141))
