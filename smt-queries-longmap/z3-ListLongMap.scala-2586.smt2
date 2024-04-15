; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39320 () Bool)

(assert start!39320)

(declare-fun b_free!9601 () Bool)

(declare-fun b_next!9601 () Bool)

(assert (=> start!39320 (= b_free!9601 (not b_next!9601))))

(declare-fun tp!34331 () Bool)

(declare-fun b_and!17051 () Bool)

(assert (=> start!39320 (= tp!34331 b_and!17051)))

(declare-fun b!416746 () Bool)

(declare-fun res!242679 () Bool)

(declare-fun e!248690 () Bool)

(assert (=> b!416746 (=> (not res!242679) (not e!248690))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416746 (= res!242679 (bvsle from!863 i!563))))

(declare-fun b!416747 () Bool)

(declare-fun res!242681 () Bool)

(declare-fun e!248692 () Bool)

(assert (=> b!416747 (=> (not res!242681) (not e!248692))))

(declare-datatypes ((array!25349 0))(
  ( (array!25350 (arr!12124 (Array (_ BitVec 32) (_ BitVec 64))) (size!12477 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25349)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25349 (_ BitVec 32)) Bool)

(assert (=> b!416747 (= res!242681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416748 () Bool)

(declare-fun e!248689 () Bool)

(declare-datatypes ((V!15443 0))(
  ( (V!15444 (val!5421 Int)) )
))
(declare-datatypes ((tuple2!7058 0))(
  ( (tuple2!7059 (_1!3540 (_ BitVec 64)) (_2!3540 V!15443)) )
))
(declare-datatypes ((List!7060 0))(
  ( (Nil!7057) (Cons!7056 (h!7912 tuple2!7058) (t!12317 List!7060)) )
))
(declare-datatypes ((ListLongMap!5961 0))(
  ( (ListLongMap!5962 (toList!2996 List!7060)) )
))
(declare-fun call!28956 () ListLongMap!5961)

(declare-fun call!28957 () ListLongMap!5961)

(assert (=> b!416748 (= e!248689 (= call!28956 call!28957))))

(declare-fun b!416749 () Bool)

(declare-fun res!242684 () Bool)

(assert (=> b!416749 (=> (not res!242684) (not e!248692))))

(assert (=> b!416749 (= res!242684 (or (= (select (arr!12124 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12124 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!416750 () Bool)

(declare-fun v!412 () V!15443)

(declare-fun +!1227 (ListLongMap!5961 tuple2!7058) ListLongMap!5961)

(assert (=> b!416750 (= e!248689 (= call!28957 (+!1227 call!28956 (tuple2!7059 k0!794 v!412))))))

(declare-fun b!416751 () Bool)

(declare-fun e!248695 () Bool)

(declare-fun tp_is_empty!10753 () Bool)

(assert (=> b!416751 (= e!248695 tp_is_empty!10753)))

(declare-fun b!416752 () Bool)

(declare-fun res!242687 () Bool)

(assert (=> b!416752 (=> (not res!242687) (not e!248692))))

(declare-fun arrayContainsKey!0 (array!25349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416752 (= res!242687 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416753 () Bool)

(assert (=> b!416753 (= e!248692 e!248690)))

(declare-fun res!242678 () Bool)

(assert (=> b!416753 (=> (not res!242678) (not e!248690))))

(declare-fun lt!190762 () array!25349)

(assert (=> b!416753 (= res!242678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190762 mask!1025))))

(assert (=> b!416753 (= lt!190762 (array!25350 (store (arr!12124 _keys!709) i!563 k0!794) (size!12477 _keys!709)))))

(declare-fun b!416754 () Bool)

(declare-fun res!242682 () Bool)

(assert (=> b!416754 (=> (not res!242682) (not e!248692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416754 (= res!242682 (validKeyInArray!0 k0!794))))

(declare-fun b!416755 () Bool)

(declare-fun res!242675 () Bool)

(assert (=> b!416755 (=> (not res!242675) (not e!248690))))

(declare-datatypes ((List!7061 0))(
  ( (Nil!7058) (Cons!7057 (h!7913 (_ BitVec 64)) (t!12318 List!7061)) )
))
(declare-fun arrayNoDuplicates!0 (array!25349 (_ BitVec 32) List!7061) Bool)

(assert (=> b!416755 (= res!242675 (arrayNoDuplicates!0 lt!190762 #b00000000000000000000000000000000 Nil!7058))))

(declare-fun b!416756 () Bool)

(declare-fun e!248696 () Bool)

(assert (=> b!416756 (= e!248696 true)))

(declare-fun lt!190760 () ListLongMap!5961)

(declare-fun lt!190756 () tuple2!7058)

(declare-fun lt!190764 () V!15443)

(assert (=> b!416756 (= (+!1227 lt!190760 lt!190756) (+!1227 (+!1227 lt!190760 (tuple2!7059 k0!794 lt!190764)) lt!190756))))

(declare-fun lt!190759 () V!15443)

(assert (=> b!416756 (= lt!190756 (tuple2!7059 k0!794 lt!190759))))

(declare-datatypes ((Unit!12292 0))(
  ( (Unit!12293) )
))
(declare-fun lt!190763 () Unit!12292)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!16 (ListLongMap!5961 (_ BitVec 64) V!15443 V!15443) Unit!12292)

(assert (=> b!416756 (= lt!190763 (addSameAsAddTwiceSameKeyDiffValues!16 lt!190760 k0!794 lt!190764 lt!190759))))

(declare-datatypes ((ValueCell!5033 0))(
  ( (ValueCellFull!5033 (v!7662 V!15443)) (EmptyCell!5033) )
))
(declare-datatypes ((array!25351 0))(
  ( (array!25352 (arr!12125 (Array (_ BitVec 32) ValueCell!5033)) (size!12478 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25351)

(declare-fun lt!190766 () V!15443)

(declare-fun get!5991 (ValueCell!5033 V!15443) V!15443)

(assert (=> b!416756 (= lt!190764 (get!5991 (select (arr!12125 _values!549) from!863) lt!190766))))

(declare-fun lt!190757 () ListLongMap!5961)

(assert (=> b!416756 (= lt!190757 (+!1227 lt!190760 (tuple2!7059 (select (arr!12124 lt!190762) from!863) lt!190759)))))

(assert (=> b!416756 (= lt!190759 (get!5991 (select (store (arr!12125 _values!549) i!563 (ValueCellFull!5033 v!412)) from!863) lt!190766))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!673 (Int (_ BitVec 64)) V!15443)

(assert (=> b!416756 (= lt!190766 (dynLambda!673 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15443)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15443)

(declare-fun lt!190761 () array!25351)

(declare-fun getCurrentListMapNoExtraKeys!1207 (array!25349 array!25351 (_ BitVec 32) (_ BitVec 32) V!15443 V!15443 (_ BitVec 32) Int) ListLongMap!5961)

(assert (=> b!416756 (= lt!190760 (getCurrentListMapNoExtraKeys!1207 lt!190762 lt!190761 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28953 () Bool)

(declare-fun c!55044 () Bool)

(assert (=> bm!28953 (= call!28956 (getCurrentListMapNoExtraKeys!1207 (ite c!55044 _keys!709 lt!190762) (ite c!55044 _values!549 lt!190761) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416757 () Bool)

(declare-fun res!242686 () Bool)

(assert (=> b!416757 (=> (not res!242686) (not e!248692))))

(assert (=> b!416757 (= res!242686 (and (= (size!12478 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12477 _keys!709) (size!12478 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17751 () Bool)

(declare-fun mapRes!17751 () Bool)

(declare-fun tp!34332 () Bool)

(declare-fun e!248697 () Bool)

(assert (=> mapNonEmpty!17751 (= mapRes!17751 (and tp!34332 e!248697))))

(declare-fun mapKey!17751 () (_ BitVec 32))

(declare-fun mapRest!17751 () (Array (_ BitVec 32) ValueCell!5033))

(declare-fun mapValue!17751 () ValueCell!5033)

(assert (=> mapNonEmpty!17751 (= (arr!12125 _values!549) (store mapRest!17751 mapKey!17751 mapValue!17751))))

(declare-fun b!416758 () Bool)

(assert (=> b!416758 (= e!248697 tp_is_empty!10753)))

(declare-fun bm!28954 () Bool)

(assert (=> bm!28954 (= call!28957 (getCurrentListMapNoExtraKeys!1207 (ite c!55044 lt!190762 _keys!709) (ite c!55044 lt!190761 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416759 () Bool)

(declare-fun res!242685 () Bool)

(assert (=> b!416759 (=> (not res!242685) (not e!248692))))

(assert (=> b!416759 (= res!242685 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7058))))

(declare-fun b!416760 () Bool)

(declare-fun e!248691 () Bool)

(assert (=> b!416760 (= e!248691 (and e!248695 mapRes!17751))))

(declare-fun condMapEmpty!17751 () Bool)

(declare-fun mapDefault!17751 () ValueCell!5033)

(assert (=> b!416760 (= condMapEmpty!17751 (= (arr!12125 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5033)) mapDefault!17751)))))

(declare-fun mapIsEmpty!17751 () Bool)

(assert (=> mapIsEmpty!17751 mapRes!17751))

(declare-fun res!242688 () Bool)

(assert (=> start!39320 (=> (not res!242688) (not e!248692))))

(assert (=> start!39320 (= res!242688 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12477 _keys!709))))))

(assert (=> start!39320 e!248692))

(assert (=> start!39320 tp_is_empty!10753))

(assert (=> start!39320 tp!34331))

(assert (=> start!39320 true))

(declare-fun array_inv!8884 (array!25351) Bool)

(assert (=> start!39320 (and (array_inv!8884 _values!549) e!248691)))

(declare-fun array_inv!8885 (array!25349) Bool)

(assert (=> start!39320 (array_inv!8885 _keys!709)))

(declare-fun b!416761 () Bool)

(declare-fun e!248694 () Bool)

(assert (=> b!416761 (= e!248690 e!248694)))

(declare-fun res!242680 () Bool)

(assert (=> b!416761 (=> (not res!242680) (not e!248694))))

(assert (=> b!416761 (= res!242680 (= from!863 i!563))))

(assert (=> b!416761 (= lt!190757 (getCurrentListMapNoExtraKeys!1207 lt!190762 lt!190761 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416761 (= lt!190761 (array!25352 (store (arr!12125 _values!549) i!563 (ValueCellFull!5033 v!412)) (size!12478 _values!549)))))

(declare-fun lt!190758 () ListLongMap!5961)

(assert (=> b!416761 (= lt!190758 (getCurrentListMapNoExtraKeys!1207 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416762 () Bool)

(declare-fun res!242683 () Bool)

(assert (=> b!416762 (=> (not res!242683) (not e!248692))))

(assert (=> b!416762 (= res!242683 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12477 _keys!709))))))

(declare-fun b!416763 () Bool)

(assert (=> b!416763 (= e!248694 (not e!248696))))

(declare-fun res!242676 () Bool)

(assert (=> b!416763 (=> res!242676 e!248696)))

(assert (=> b!416763 (= res!242676 (validKeyInArray!0 (select (arr!12124 _keys!709) from!863)))))

(assert (=> b!416763 e!248689))

(assert (=> b!416763 (= c!55044 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190765 () Unit!12292)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!404 (array!25349 array!25351 (_ BitVec 32) (_ BitVec 32) V!15443 V!15443 (_ BitVec 32) (_ BitVec 64) V!15443 (_ BitVec 32) Int) Unit!12292)

(assert (=> b!416763 (= lt!190765 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416764 () Bool)

(declare-fun res!242677 () Bool)

(assert (=> b!416764 (=> (not res!242677) (not e!248692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416764 (= res!242677 (validMask!0 mask!1025))))

(assert (= (and start!39320 res!242688) b!416764))

(assert (= (and b!416764 res!242677) b!416757))

(assert (= (and b!416757 res!242686) b!416747))

(assert (= (and b!416747 res!242681) b!416759))

(assert (= (and b!416759 res!242685) b!416762))

(assert (= (and b!416762 res!242683) b!416754))

(assert (= (and b!416754 res!242682) b!416749))

(assert (= (and b!416749 res!242684) b!416752))

(assert (= (and b!416752 res!242687) b!416753))

(assert (= (and b!416753 res!242678) b!416755))

(assert (= (and b!416755 res!242675) b!416746))

(assert (= (and b!416746 res!242679) b!416761))

(assert (= (and b!416761 res!242680) b!416763))

(assert (= (and b!416763 c!55044) b!416750))

(assert (= (and b!416763 (not c!55044)) b!416748))

(assert (= (or b!416750 b!416748) bm!28954))

(assert (= (or b!416750 b!416748) bm!28953))

(assert (= (and b!416763 (not res!242676)) b!416756))

(assert (= (and b!416760 condMapEmpty!17751) mapIsEmpty!17751))

(assert (= (and b!416760 (not condMapEmpty!17751)) mapNonEmpty!17751))

(get-info :version)

(assert (= (and mapNonEmpty!17751 ((_ is ValueCellFull!5033) mapValue!17751)) b!416758))

(assert (= (and b!416760 ((_ is ValueCellFull!5033) mapDefault!17751)) b!416751))

(assert (= start!39320 b!416760))

(declare-fun b_lambda!8887 () Bool)

(assert (=> (not b_lambda!8887) (not b!416756)))

(declare-fun t!12316 () Bool)

(declare-fun tb!3215 () Bool)

(assert (=> (and start!39320 (= defaultEntry!557 defaultEntry!557) t!12316) tb!3215))

(declare-fun result!5965 () Bool)

(assert (=> tb!3215 (= result!5965 tp_is_empty!10753)))

(assert (=> b!416756 t!12316))

(declare-fun b_and!17053 () Bool)

(assert (= b_and!17051 (and (=> t!12316 result!5965) b_and!17053)))

(declare-fun m!405507 () Bool)

(assert (=> b!416756 m!405507))

(declare-fun m!405509 () Bool)

(assert (=> b!416756 m!405509))

(declare-fun m!405511 () Bool)

(assert (=> b!416756 m!405511))

(declare-fun m!405513 () Bool)

(assert (=> b!416756 m!405513))

(assert (=> b!416756 m!405513))

(declare-fun m!405515 () Bool)

(assert (=> b!416756 m!405515))

(declare-fun m!405517 () Bool)

(assert (=> b!416756 m!405517))

(declare-fun m!405519 () Bool)

(assert (=> b!416756 m!405519))

(declare-fun m!405521 () Bool)

(assert (=> b!416756 m!405521))

(assert (=> b!416756 m!405519))

(declare-fun m!405523 () Bool)

(assert (=> b!416756 m!405523))

(declare-fun m!405525 () Bool)

(assert (=> b!416756 m!405525))

(assert (=> b!416756 m!405517))

(declare-fun m!405527 () Bool)

(assert (=> b!416756 m!405527))

(declare-fun m!405529 () Bool)

(assert (=> b!416756 m!405529))

(declare-fun m!405531 () Bool)

(assert (=> b!416756 m!405531))

(declare-fun m!405533 () Bool)

(assert (=> b!416754 m!405533))

(declare-fun m!405535 () Bool)

(assert (=> b!416759 m!405535))

(declare-fun m!405537 () Bool)

(assert (=> b!416747 m!405537))

(declare-fun m!405539 () Bool)

(assert (=> bm!28953 m!405539))

(declare-fun m!405541 () Bool)

(assert (=> b!416752 m!405541))

(declare-fun m!405543 () Bool)

(assert (=> b!416761 m!405543))

(assert (=> b!416761 m!405511))

(declare-fun m!405545 () Bool)

(assert (=> b!416761 m!405545))

(declare-fun m!405547 () Bool)

(assert (=> start!39320 m!405547))

(declare-fun m!405549 () Bool)

(assert (=> start!39320 m!405549))

(declare-fun m!405551 () Bool)

(assert (=> b!416749 m!405551))

(declare-fun m!405553 () Bool)

(assert (=> mapNonEmpty!17751 m!405553))

(declare-fun m!405555 () Bool)

(assert (=> b!416753 m!405555))

(declare-fun m!405557 () Bool)

(assert (=> b!416753 m!405557))

(declare-fun m!405559 () Bool)

(assert (=> b!416764 m!405559))

(declare-fun m!405561 () Bool)

(assert (=> bm!28954 m!405561))

(declare-fun m!405563 () Bool)

(assert (=> b!416763 m!405563))

(assert (=> b!416763 m!405563))

(declare-fun m!405565 () Bool)

(assert (=> b!416763 m!405565))

(declare-fun m!405567 () Bool)

(assert (=> b!416763 m!405567))

(declare-fun m!405569 () Bool)

(assert (=> b!416750 m!405569))

(declare-fun m!405571 () Bool)

(assert (=> b!416755 m!405571))

(check-sat (not b!416752) (not bm!28954) (not b!416750) (not mapNonEmpty!17751) (not b!416753) (not b_lambda!8887) (not start!39320) (not bm!28953) tp_is_empty!10753 (not b_next!9601) (not b!416759) (not b!416763) (not b!416747) (not b!416755) (not b!416754) (not b!416761) (not b!416756) (not b!416764) b_and!17053)
(check-sat b_and!17053 (not b_next!9601))
