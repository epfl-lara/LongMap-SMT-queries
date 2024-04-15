; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39452 () Bool)

(assert start!39452)

(declare-fun b_free!9733 () Bool)

(declare-fun b_next!9733 () Bool)

(assert (=> start!39452 (= b_free!9733 (not b_next!9733))))

(declare-fun tp!34727 () Bool)

(declare-fun b_and!17315 () Bool)

(assert (=> start!39452 (= tp!34727 b_and!17315)))

(declare-fun b!420640 () Bool)

(declare-fun e!250478 () Bool)

(declare-fun e!250476 () Bool)

(declare-fun mapRes!17949 () Bool)

(assert (=> b!420640 (= e!250478 (and e!250476 mapRes!17949))))

(declare-fun condMapEmpty!17949 () Bool)

(declare-datatypes ((V!15619 0))(
  ( (V!15620 (val!5487 Int)) )
))
(declare-datatypes ((ValueCell!5099 0))(
  ( (ValueCellFull!5099 (v!7728 V!15619)) (EmptyCell!5099) )
))
(declare-datatypes ((array!25603 0))(
  ( (array!25604 (arr!12251 (Array (_ BitVec 32) ValueCell!5099)) (size!12604 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25603)

(declare-fun mapDefault!17949 () ValueCell!5099)

(assert (=> b!420640 (= condMapEmpty!17949 (= (arr!12251 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5099)) mapDefault!17949)))))

(declare-datatypes ((array!25605 0))(
  ( (array!25606 (arr!12252 (Array (_ BitVec 32) (_ BitVec 64))) (size!12605 (_ BitVec 32))) )
))
(declare-fun lt!192939 () array!25605)

(declare-fun lt!192941 () array!25603)

(declare-fun minValue!515 () V!15619)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29349 () Bool)

(declare-fun zeroValue!515 () V!15619)

(declare-datatypes ((tuple2!7180 0))(
  ( (tuple2!7181 (_1!3601 (_ BitVec 64)) (_2!3601 V!15619)) )
))
(declare-datatypes ((List!7174 0))(
  ( (Nil!7171) (Cons!7170 (h!8026 tuple2!7180) (t!12563 List!7174)) )
))
(declare-datatypes ((ListLongMap!6083 0))(
  ( (ListLongMap!6084 (toList!3057 List!7174)) )
))
(declare-fun call!29352 () ListLongMap!6083)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!55242 () Bool)

(declare-fun _keys!709 () array!25605)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1267 (array!25605 array!25603 (_ BitVec 32) (_ BitVec 32) V!15619 V!15619 (_ BitVec 32) Int) ListLongMap!6083)

(assert (=> bm!29349 (= call!29352 (getCurrentListMapNoExtraKeys!1267 (ite c!55242 _keys!709 lt!192939) (ite c!55242 _values!549 lt!192941) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29353 () ListLongMap!6083)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!420641 () Bool)

(declare-fun e!250477 () Bool)

(declare-fun v!412 () V!15619)

(declare-fun +!1279 (ListLongMap!6083 tuple2!7180) ListLongMap!6083)

(assert (=> b!420641 (= e!250477 (= call!29353 (+!1279 call!29352 (tuple2!7181 k0!794 v!412))))))

(declare-fun b!420642 () Bool)

(declare-fun tp_is_empty!10885 () Bool)

(assert (=> b!420642 (= e!250476 tp_is_empty!10885)))

(declare-fun bm!29350 () Bool)

(assert (=> bm!29350 (= call!29353 (getCurrentListMapNoExtraKeys!1267 (ite c!55242 lt!192939 _keys!709) (ite c!55242 lt!192941 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420643 () Bool)

(declare-fun e!250472 () Bool)

(assert (=> b!420643 (= e!250472 true)))

(declare-fun lt!192942 () ListLongMap!6083)

(declare-fun lt!192935 () V!15619)

(declare-fun lt!192944 () tuple2!7180)

(assert (=> b!420643 (= (+!1279 lt!192942 lt!192944) (+!1279 (+!1279 lt!192942 (tuple2!7181 k0!794 lt!192935)) lt!192944))))

(declare-fun lt!192934 () V!15619)

(assert (=> b!420643 (= lt!192944 (tuple2!7181 k0!794 lt!192934))))

(declare-datatypes ((Unit!12404 0))(
  ( (Unit!12405) )
))
(declare-fun lt!192940 () Unit!12404)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!63 (ListLongMap!6083 (_ BitVec 64) V!15619 V!15619) Unit!12404)

(assert (=> b!420643 (= lt!192940 (addSameAsAddTwiceSameKeyDiffValues!63 lt!192942 k0!794 lt!192935 lt!192934))))

(declare-fun lt!192938 () V!15619)

(declare-fun get!6082 (ValueCell!5099 V!15619) V!15619)

(assert (=> b!420643 (= lt!192935 (get!6082 (select (arr!12251 _values!549) from!863) lt!192938))))

(declare-fun lt!192937 () ListLongMap!6083)

(assert (=> b!420643 (= lt!192937 (+!1279 lt!192942 (tuple2!7181 (select (arr!12252 lt!192939) from!863) lt!192934)))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420643 (= lt!192934 (get!6082 (select (store (arr!12251 _values!549) i!563 (ValueCellFull!5099 v!412)) from!863) lt!192938))))

(declare-fun dynLambda!720 (Int (_ BitVec 64)) V!15619)

(assert (=> b!420643 (= lt!192938 (dynLambda!720 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420643 (= lt!192942 (getCurrentListMapNoExtraKeys!1267 lt!192939 lt!192941 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420644 () Bool)

(declare-fun res!245451 () Bool)

(declare-fun e!250479 () Bool)

(assert (=> b!420644 (=> (not res!245451) (not e!250479))))

(assert (=> b!420644 (= res!245451 (and (= (size!12604 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12605 _keys!709) (size!12604 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420645 () Bool)

(declare-fun res!245448 () Bool)

(assert (=> b!420645 (=> (not res!245448) (not e!250479))))

(declare-fun arrayContainsKey!0 (array!25605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420645 (= res!245448 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17949 () Bool)

(declare-fun tp!34728 () Bool)

(declare-fun e!250474 () Bool)

(assert (=> mapNonEmpty!17949 (= mapRes!17949 (and tp!34728 e!250474))))

(declare-fun mapKey!17949 () (_ BitVec 32))

(declare-fun mapRest!17949 () (Array (_ BitVec 32) ValueCell!5099))

(declare-fun mapValue!17949 () ValueCell!5099)

(assert (=> mapNonEmpty!17949 (= (arr!12251 _values!549) (store mapRest!17949 mapKey!17949 mapValue!17949))))

(declare-fun b!420646 () Bool)

(declare-fun res!245452 () Bool)

(declare-fun e!250473 () Bool)

(assert (=> b!420646 (=> (not res!245452) (not e!250473))))

(assert (=> b!420646 (= res!245452 (bvsle from!863 i!563))))

(declare-fun b!420647 () Bool)

(assert (=> b!420647 (= e!250477 (= call!29352 call!29353))))

(declare-fun mapIsEmpty!17949 () Bool)

(assert (=> mapIsEmpty!17949 mapRes!17949))

(declare-fun b!420648 () Bool)

(declare-fun res!245457 () Bool)

(assert (=> b!420648 (=> (not res!245457) (not e!250479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420648 (= res!245457 (validKeyInArray!0 k0!794))))

(declare-fun b!420649 () Bool)

(declare-fun e!250471 () Bool)

(assert (=> b!420649 (= e!250473 e!250471)))

(declare-fun res!245460 () Bool)

(assert (=> b!420649 (=> (not res!245460) (not e!250471))))

(assert (=> b!420649 (= res!245460 (= from!863 i!563))))

(assert (=> b!420649 (= lt!192937 (getCurrentListMapNoExtraKeys!1267 lt!192939 lt!192941 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420649 (= lt!192941 (array!25604 (store (arr!12251 _values!549) i!563 (ValueCellFull!5099 v!412)) (size!12604 _values!549)))))

(declare-fun lt!192936 () ListLongMap!6083)

(assert (=> b!420649 (= lt!192936 (getCurrentListMapNoExtraKeys!1267 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420650 () Bool)

(assert (=> b!420650 (= e!250471 (not e!250472))))

(declare-fun res!245456 () Bool)

(assert (=> b!420650 (=> res!245456 e!250472)))

(assert (=> b!420650 (= res!245456 (validKeyInArray!0 (select (arr!12252 _keys!709) from!863)))))

(assert (=> b!420650 e!250477))

(assert (=> b!420650 (= c!55242 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192943 () Unit!12404)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!452 (array!25605 array!25603 (_ BitVec 32) (_ BitVec 32) V!15619 V!15619 (_ BitVec 32) (_ BitVec 64) V!15619 (_ BitVec 32) Int) Unit!12404)

(assert (=> b!420650 (= lt!192943 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!452 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420651 () Bool)

(declare-fun res!245450 () Bool)

(assert (=> b!420651 (=> (not res!245450) (not e!250473))))

(declare-datatypes ((List!7175 0))(
  ( (Nil!7172) (Cons!7171 (h!8027 (_ BitVec 64)) (t!12564 List!7175)) )
))
(declare-fun arrayNoDuplicates!0 (array!25605 (_ BitVec 32) List!7175) Bool)

(assert (=> b!420651 (= res!245450 (arrayNoDuplicates!0 lt!192939 #b00000000000000000000000000000000 Nil!7172))))

(declare-fun res!245459 () Bool)

(assert (=> start!39452 (=> (not res!245459) (not e!250479))))

(assert (=> start!39452 (= res!245459 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12605 _keys!709))))))

(assert (=> start!39452 e!250479))

(assert (=> start!39452 tp_is_empty!10885))

(assert (=> start!39452 tp!34727))

(assert (=> start!39452 true))

(declare-fun array_inv!8970 (array!25603) Bool)

(assert (=> start!39452 (and (array_inv!8970 _values!549) e!250478)))

(declare-fun array_inv!8971 (array!25605) Bool)

(assert (=> start!39452 (array_inv!8971 _keys!709)))

(declare-fun b!420652 () Bool)

(declare-fun res!245458 () Bool)

(assert (=> b!420652 (=> (not res!245458) (not e!250479))))

(assert (=> b!420652 (= res!245458 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7172))))

(declare-fun b!420653 () Bool)

(declare-fun res!245454 () Bool)

(assert (=> b!420653 (=> (not res!245454) (not e!250479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25605 (_ BitVec 32)) Bool)

(assert (=> b!420653 (= res!245454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420654 () Bool)

(declare-fun res!245449 () Bool)

(assert (=> b!420654 (=> (not res!245449) (not e!250479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420654 (= res!245449 (validMask!0 mask!1025))))

(declare-fun b!420655 () Bool)

(assert (=> b!420655 (= e!250479 e!250473)))

(declare-fun res!245453 () Bool)

(assert (=> b!420655 (=> (not res!245453) (not e!250473))))

(assert (=> b!420655 (= res!245453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192939 mask!1025))))

(assert (=> b!420655 (= lt!192939 (array!25606 (store (arr!12252 _keys!709) i!563 k0!794) (size!12605 _keys!709)))))

(declare-fun b!420656 () Bool)

(declare-fun res!245455 () Bool)

(assert (=> b!420656 (=> (not res!245455) (not e!250479))))

(assert (=> b!420656 (= res!245455 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12605 _keys!709))))))

(declare-fun b!420657 () Bool)

(assert (=> b!420657 (= e!250474 tp_is_empty!10885)))

(declare-fun b!420658 () Bool)

(declare-fun res!245447 () Bool)

(assert (=> b!420658 (=> (not res!245447) (not e!250479))))

(assert (=> b!420658 (= res!245447 (or (= (select (arr!12252 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12252 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39452 res!245459) b!420654))

(assert (= (and b!420654 res!245449) b!420644))

(assert (= (and b!420644 res!245451) b!420653))

(assert (= (and b!420653 res!245454) b!420652))

(assert (= (and b!420652 res!245458) b!420656))

(assert (= (and b!420656 res!245455) b!420648))

(assert (= (and b!420648 res!245457) b!420658))

(assert (= (and b!420658 res!245447) b!420645))

(assert (= (and b!420645 res!245448) b!420655))

(assert (= (and b!420655 res!245453) b!420651))

(assert (= (and b!420651 res!245450) b!420646))

(assert (= (and b!420646 res!245452) b!420649))

(assert (= (and b!420649 res!245460) b!420650))

(assert (= (and b!420650 c!55242) b!420641))

(assert (= (and b!420650 (not c!55242)) b!420647))

(assert (= (or b!420641 b!420647) bm!29350))

(assert (= (or b!420641 b!420647) bm!29349))

(assert (= (and b!420650 (not res!245456)) b!420643))

(assert (= (and b!420640 condMapEmpty!17949) mapIsEmpty!17949))

(assert (= (and b!420640 (not condMapEmpty!17949)) mapNonEmpty!17949))

(get-info :version)

(assert (= (and mapNonEmpty!17949 ((_ is ValueCellFull!5099) mapValue!17949)) b!420657))

(assert (= (and b!420640 ((_ is ValueCellFull!5099) mapDefault!17949)) b!420642))

(assert (= start!39452 b!420640))

(declare-fun b_lambda!9019 () Bool)

(assert (=> (not b_lambda!9019) (not b!420643)))

(declare-fun t!12562 () Bool)

(declare-fun tb!3347 () Bool)

(assert (=> (and start!39452 (= defaultEntry!557 defaultEntry!557) t!12562) tb!3347))

(declare-fun result!6229 () Bool)

(assert (=> tb!3347 (= result!6229 tp_is_empty!10885)))

(assert (=> b!420643 t!12562))

(declare-fun b_and!17317 () Bool)

(assert (= b_and!17315 (and (=> t!12562 result!6229) b_and!17317)))

(declare-fun m!409857 () Bool)

(assert (=> bm!29349 m!409857))

(declare-fun m!409859 () Bool)

(assert (=> b!420658 m!409859))

(declare-fun m!409861 () Bool)

(assert (=> b!420641 m!409861))

(declare-fun m!409863 () Bool)

(assert (=> start!39452 m!409863))

(declare-fun m!409865 () Bool)

(assert (=> start!39452 m!409865))

(declare-fun m!409867 () Bool)

(assert (=> b!420648 m!409867))

(declare-fun m!409869 () Bool)

(assert (=> b!420654 m!409869))

(declare-fun m!409871 () Bool)

(assert (=> b!420650 m!409871))

(assert (=> b!420650 m!409871))

(declare-fun m!409873 () Bool)

(assert (=> b!420650 m!409873))

(declare-fun m!409875 () Bool)

(assert (=> b!420650 m!409875))

(declare-fun m!409877 () Bool)

(assert (=> b!420649 m!409877))

(declare-fun m!409879 () Bool)

(assert (=> b!420649 m!409879))

(declare-fun m!409881 () Bool)

(assert (=> b!420649 m!409881))

(declare-fun m!409883 () Bool)

(assert (=> b!420653 m!409883))

(declare-fun m!409885 () Bool)

(assert (=> b!420655 m!409885))

(declare-fun m!409887 () Bool)

(assert (=> b!420655 m!409887))

(declare-fun m!409889 () Bool)

(assert (=> b!420652 m!409889))

(declare-fun m!409891 () Bool)

(assert (=> b!420643 m!409891))

(assert (=> b!420643 m!409879))

(declare-fun m!409893 () Bool)

(assert (=> b!420643 m!409893))

(declare-fun m!409895 () Bool)

(assert (=> b!420643 m!409895))

(declare-fun m!409897 () Bool)

(assert (=> b!420643 m!409897))

(declare-fun m!409899 () Bool)

(assert (=> b!420643 m!409899))

(assert (=> b!420643 m!409899))

(declare-fun m!409901 () Bool)

(assert (=> b!420643 m!409901))

(declare-fun m!409903 () Bool)

(assert (=> b!420643 m!409903))

(declare-fun m!409905 () Bool)

(assert (=> b!420643 m!409905))

(assert (=> b!420643 m!409897))

(declare-fun m!409907 () Bool)

(assert (=> b!420643 m!409907))

(declare-fun m!409909 () Bool)

(assert (=> b!420643 m!409909))

(assert (=> b!420643 m!409903))

(declare-fun m!409911 () Bool)

(assert (=> b!420643 m!409911))

(declare-fun m!409913 () Bool)

(assert (=> b!420643 m!409913))

(declare-fun m!409915 () Bool)

(assert (=> b!420645 m!409915))

(declare-fun m!409917 () Bool)

(assert (=> bm!29350 m!409917))

(declare-fun m!409919 () Bool)

(assert (=> mapNonEmpty!17949 m!409919))

(declare-fun m!409921 () Bool)

(assert (=> b!420651 m!409921))

(check-sat (not bm!29349) (not bm!29350) (not b!420652) (not b!420643) (not b_lambda!9019) (not b!420655) (not b_next!9733) (not start!39452) (not b!420653) b_and!17317 (not b!420641) (not b!420650) (not b!420645) tp_is_empty!10885 (not mapNonEmpty!17949) (not b!420654) (not b!420651) (not b!420649) (not b!420648))
(check-sat b_and!17317 (not b_next!9733))
