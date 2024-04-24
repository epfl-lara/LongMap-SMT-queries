; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39302 () Bool)

(assert start!39302)

(declare-fun b_free!9583 () Bool)

(declare-fun b_next!9583 () Bool)

(assert (=> start!39302 (= b_free!9583 (not b_next!9583))))

(declare-fun tp!34277 () Bool)

(declare-fun b_and!17055 () Bool)

(assert (=> start!39302 (= tp!34277 b_and!17055)))

(declare-fun b!416437 () Bool)

(declare-fun e!248589 () Bool)

(declare-fun e!248594 () Bool)

(assert (=> b!416437 (= e!248589 e!248594)))

(declare-fun res!242428 () Bool)

(assert (=> b!416437 (=> (not res!242428) (not e!248594))))

(declare-datatypes ((array!25330 0))(
  ( (array!25331 (arr!12114 (Array (_ BitVec 32) (_ BitVec 64))) (size!12466 (_ BitVec 32))) )
))
(declare-fun lt!190721 () array!25330)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25330 (_ BitVec 32)) Bool)

(assert (=> b!416437 (= res!242428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190721 mask!1025))))

(declare-fun _keys!709 () array!25330)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416437 (= lt!190721 (array!25331 (store (arr!12114 _keys!709) i!563 k0!794) (size!12466 _keys!709)))))

(declare-datatypes ((V!15419 0))(
  ( (V!15420 (val!5412 Int)) )
))
(declare-datatypes ((tuple2!6934 0))(
  ( (tuple2!6935 (_1!3478 (_ BitVec 64)) (_2!3478 V!15419)) )
))
(declare-datatypes ((List!6952 0))(
  ( (Nil!6949) (Cons!6948 (h!7804 tuple2!6934) (t!12192 List!6952)) )
))
(declare-datatypes ((ListLongMap!5849 0))(
  ( (ListLongMap!5850 (toList!2940 List!6952)) )
))
(declare-fun call!28915 () ListLongMap!5849)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55065 () Bool)

(declare-datatypes ((ValueCell!5024 0))(
  ( (ValueCellFull!5024 (v!7660 V!15419)) (EmptyCell!5024) )
))
(declare-datatypes ((array!25332 0))(
  ( (array!25333 (arr!12115 (Array (_ BitVec 32) ValueCell!5024)) (size!12467 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25332)

(declare-fun zeroValue!515 () V!15419)

(declare-fun bm!28911 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!190715 () array!25332)

(declare-fun minValue!515 () V!15419)

(declare-fun getCurrentListMapNoExtraKeys!1187 (array!25330 array!25332 (_ BitVec 32) (_ BitVec 32) V!15419 V!15419 (_ BitVec 32) Int) ListLongMap!5849)

(assert (=> bm!28911 (= call!28915 (getCurrentListMapNoExtraKeys!1187 (ite c!55065 lt!190721 _keys!709) (ite c!55065 lt!190715 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416438 () Bool)

(declare-fun res!242427 () Bool)

(assert (=> b!416438 (=> (not res!242427) (not e!248594))))

(declare-datatypes ((List!6953 0))(
  ( (Nil!6950) (Cons!6949 (h!7805 (_ BitVec 64)) (t!12193 List!6953)) )
))
(declare-fun arrayNoDuplicates!0 (array!25330 (_ BitVec 32) List!6953) Bool)

(assert (=> b!416438 (= res!242427 (arrayNoDuplicates!0 lt!190721 #b00000000000000000000000000000000 Nil!6950))))

(declare-fun b!416440 () Bool)

(declare-fun res!242429 () Bool)

(assert (=> b!416440 (=> (not res!242429) (not e!248589))))

(assert (=> b!416440 (= res!242429 (or (= (select (arr!12114 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12114 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416441 () Bool)

(declare-fun e!248593 () Bool)

(declare-fun e!248595 () Bool)

(assert (=> b!416441 (= e!248593 (not e!248595))))

(declare-fun res!242433 () Bool)

(assert (=> b!416441 (=> res!242433 e!248595)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416441 (= res!242433 (validKeyInArray!0 (select (arr!12114 _keys!709) from!863)))))

(declare-fun e!248596 () Bool)

(assert (=> b!416441 e!248596))

(assert (=> b!416441 (= c!55065 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12299 0))(
  ( (Unit!12300) )
))
(declare-fun lt!190718 () Unit!12299)

(declare-fun v!412 () V!15419)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!415 (array!25330 array!25332 (_ BitVec 32) (_ BitVec 32) V!15419 V!15419 (_ BitVec 32) (_ BitVec 64) V!15419 (_ BitVec 32) Int) Unit!12299)

(assert (=> b!416441 (= lt!190718 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416442 () Bool)

(declare-fun call!28914 () ListLongMap!5849)

(assert (=> b!416442 (= e!248596 (= call!28914 call!28915))))

(declare-fun b!416443 () Bool)

(assert (=> b!416443 (= e!248594 e!248593)))

(declare-fun res!242436 () Bool)

(assert (=> b!416443 (=> (not res!242436) (not e!248593))))

(assert (=> b!416443 (= res!242436 (= from!863 i!563))))

(declare-fun lt!190719 () ListLongMap!5849)

(assert (=> b!416443 (= lt!190719 (getCurrentListMapNoExtraKeys!1187 lt!190721 lt!190715 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416443 (= lt!190715 (array!25333 (store (arr!12115 _values!549) i!563 (ValueCellFull!5024 v!412)) (size!12467 _values!549)))))

(declare-fun lt!190712 () ListLongMap!5849)

(assert (=> b!416443 (= lt!190712 (getCurrentListMapNoExtraKeys!1187 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416444 () Bool)

(declare-fun res!242434 () Bool)

(assert (=> b!416444 (=> (not res!242434) (not e!248589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416444 (= res!242434 (validMask!0 mask!1025))))

(declare-fun b!416445 () Bool)

(declare-fun res!242424 () Bool)

(assert (=> b!416445 (=> (not res!242424) (not e!248589))))

(assert (=> b!416445 (= res!242424 (and (= (size!12467 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12466 _keys!709) (size!12467 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17724 () Bool)

(declare-fun mapRes!17724 () Bool)

(declare-fun tp!34278 () Bool)

(declare-fun e!248590 () Bool)

(assert (=> mapNonEmpty!17724 (= mapRes!17724 (and tp!34278 e!248590))))

(declare-fun mapValue!17724 () ValueCell!5024)

(declare-fun mapRest!17724 () (Array (_ BitVec 32) ValueCell!5024))

(declare-fun mapKey!17724 () (_ BitVec 32))

(assert (=> mapNonEmpty!17724 (= (arr!12115 _values!549) (store mapRest!17724 mapKey!17724 mapValue!17724))))

(declare-fun b!416446 () Bool)

(declare-fun res!242432 () Bool)

(assert (=> b!416446 (=> (not res!242432) (not e!248589))))

(assert (=> b!416446 (= res!242432 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6950))))

(declare-fun res!242431 () Bool)

(assert (=> start!39302 (=> (not res!242431) (not e!248589))))

(assert (=> start!39302 (= res!242431 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12466 _keys!709))))))

(assert (=> start!39302 e!248589))

(declare-fun tp_is_empty!10735 () Bool)

(assert (=> start!39302 tp_is_empty!10735))

(assert (=> start!39302 tp!34277))

(assert (=> start!39302 true))

(declare-fun e!248592 () Bool)

(declare-fun array_inv!8912 (array!25332) Bool)

(assert (=> start!39302 (and (array_inv!8912 _values!549) e!248592)))

(declare-fun array_inv!8913 (array!25330) Bool)

(assert (=> start!39302 (array_inv!8913 _keys!709)))

(declare-fun b!416439 () Bool)

(declare-fun res!242426 () Bool)

(assert (=> b!416439 (=> (not res!242426) (not e!248589))))

(assert (=> b!416439 (= res!242426 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12466 _keys!709))))))

(declare-fun b!416447 () Bool)

(declare-fun +!1211 (ListLongMap!5849 tuple2!6934) ListLongMap!5849)

(assert (=> b!416447 (= e!248596 (= call!28915 (+!1211 call!28914 (tuple2!6935 k0!794 v!412))))))

(declare-fun b!416448 () Bool)

(assert (=> b!416448 (= e!248595 true)))

(declare-fun lt!190722 () ListLongMap!5849)

(declare-fun lt!190720 () V!15419)

(declare-fun lt!190714 () tuple2!6934)

(assert (=> b!416448 (= (+!1211 lt!190722 lt!190714) (+!1211 (+!1211 lt!190722 (tuple2!6935 k0!794 lt!190720)) lt!190714))))

(declare-fun lt!190713 () V!15419)

(assert (=> b!416448 (= lt!190714 (tuple2!6935 k0!794 lt!190713))))

(declare-fun lt!190717 () Unit!12299)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!7 (ListLongMap!5849 (_ BitVec 64) V!15419 V!15419) Unit!12299)

(assert (=> b!416448 (= lt!190717 (addSameAsAddTwiceSameKeyDiffValues!7 lt!190722 k0!794 lt!190720 lt!190713))))

(declare-fun lt!190716 () V!15419)

(declare-fun get!5989 (ValueCell!5024 V!15419) V!15419)

(assert (=> b!416448 (= lt!190720 (get!5989 (select (arr!12115 _values!549) from!863) lt!190716))))

(assert (=> b!416448 (= lt!190719 (+!1211 lt!190722 (tuple2!6935 (select (arr!12114 lt!190721) from!863) lt!190713)))))

(assert (=> b!416448 (= lt!190713 (get!5989 (select (store (arr!12115 _values!549) i!563 (ValueCellFull!5024 v!412)) from!863) lt!190716))))

(declare-fun dynLambda!674 (Int (_ BitVec 64)) V!15419)

(assert (=> b!416448 (= lt!190716 (dynLambda!674 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416448 (= lt!190722 (getCurrentListMapNoExtraKeys!1187 lt!190721 lt!190715 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416449 () Bool)

(declare-fun res!242435 () Bool)

(assert (=> b!416449 (=> (not res!242435) (not e!248589))))

(assert (=> b!416449 (= res!242435 (validKeyInArray!0 k0!794))))

(declare-fun b!416450 () Bool)

(assert (=> b!416450 (= e!248590 tp_is_empty!10735)))

(declare-fun b!416451 () Bool)

(declare-fun res!242430 () Bool)

(assert (=> b!416451 (=> (not res!242430) (not e!248589))))

(declare-fun arrayContainsKey!0 (array!25330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416451 (= res!242430 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416452 () Bool)

(declare-fun e!248588 () Bool)

(assert (=> b!416452 (= e!248588 tp_is_empty!10735)))

(declare-fun b!416453 () Bool)

(declare-fun res!242423 () Bool)

(assert (=> b!416453 (=> (not res!242423) (not e!248589))))

(assert (=> b!416453 (= res!242423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416454 () Bool)

(assert (=> b!416454 (= e!248592 (and e!248588 mapRes!17724))))

(declare-fun condMapEmpty!17724 () Bool)

(declare-fun mapDefault!17724 () ValueCell!5024)

(assert (=> b!416454 (= condMapEmpty!17724 (= (arr!12115 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5024)) mapDefault!17724)))))

(declare-fun bm!28912 () Bool)

(assert (=> bm!28912 (= call!28914 (getCurrentListMapNoExtraKeys!1187 (ite c!55065 _keys!709 lt!190721) (ite c!55065 _values!549 lt!190715) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17724 () Bool)

(assert (=> mapIsEmpty!17724 mapRes!17724))

(declare-fun b!416455 () Bool)

(declare-fun res!242425 () Bool)

(assert (=> b!416455 (=> (not res!242425) (not e!248594))))

(assert (=> b!416455 (= res!242425 (bvsle from!863 i!563))))

(assert (= (and start!39302 res!242431) b!416444))

(assert (= (and b!416444 res!242434) b!416445))

(assert (= (and b!416445 res!242424) b!416453))

(assert (= (and b!416453 res!242423) b!416446))

(assert (= (and b!416446 res!242432) b!416439))

(assert (= (and b!416439 res!242426) b!416449))

(assert (= (and b!416449 res!242435) b!416440))

(assert (= (and b!416440 res!242429) b!416451))

(assert (= (and b!416451 res!242430) b!416437))

(assert (= (and b!416437 res!242428) b!416438))

(assert (= (and b!416438 res!242427) b!416455))

(assert (= (and b!416455 res!242425) b!416443))

(assert (= (and b!416443 res!242436) b!416441))

(assert (= (and b!416441 c!55065) b!416447))

(assert (= (and b!416441 (not c!55065)) b!416442))

(assert (= (or b!416447 b!416442) bm!28911))

(assert (= (or b!416447 b!416442) bm!28912))

(assert (= (and b!416441 (not res!242433)) b!416448))

(assert (= (and b!416454 condMapEmpty!17724) mapIsEmpty!17724))

(assert (= (and b!416454 (not condMapEmpty!17724)) mapNonEmpty!17724))

(get-info :version)

(assert (= (and mapNonEmpty!17724 ((_ is ValueCellFull!5024) mapValue!17724)) b!416450))

(assert (= (and b!416454 ((_ is ValueCellFull!5024) mapDefault!17724)) b!416452))

(assert (= start!39302 b!416454))

(declare-fun b_lambda!8909 () Bool)

(assert (=> (not b_lambda!8909) (not b!416448)))

(declare-fun t!12191 () Bool)

(declare-fun tb!3197 () Bool)

(assert (=> (and start!39302 (= defaultEntry!557 defaultEntry!557) t!12191) tb!3197))

(declare-fun result!5929 () Bool)

(assert (=> tb!3197 (= result!5929 tp_is_empty!10735)))

(assert (=> b!416448 t!12191))

(declare-fun b_and!17057 () Bool)

(assert (= b_and!17055 (and (=> t!12191 result!5929) b_and!17057)))

(declare-fun m!405871 () Bool)

(assert (=> b!416447 m!405871))

(declare-fun m!405873 () Bool)

(assert (=> bm!28911 m!405873))

(declare-fun m!405875 () Bool)

(assert (=> b!416441 m!405875))

(assert (=> b!416441 m!405875))

(declare-fun m!405877 () Bool)

(assert (=> b!416441 m!405877))

(declare-fun m!405879 () Bool)

(assert (=> b!416441 m!405879))

(declare-fun m!405881 () Bool)

(assert (=> b!416453 m!405881))

(declare-fun m!405883 () Bool)

(assert (=> b!416440 m!405883))

(declare-fun m!405885 () Bool)

(assert (=> b!416437 m!405885))

(declare-fun m!405887 () Bool)

(assert (=> b!416437 m!405887))

(declare-fun m!405889 () Bool)

(assert (=> b!416451 m!405889))

(declare-fun m!405891 () Bool)

(assert (=> mapNonEmpty!17724 m!405891))

(declare-fun m!405893 () Bool)

(assert (=> b!416444 m!405893))

(declare-fun m!405895 () Bool)

(assert (=> b!416446 m!405895))

(declare-fun m!405897 () Bool)

(assert (=> b!416443 m!405897))

(declare-fun m!405899 () Bool)

(assert (=> b!416443 m!405899))

(declare-fun m!405901 () Bool)

(assert (=> b!416443 m!405901))

(declare-fun m!405903 () Bool)

(assert (=> b!416448 m!405903))

(declare-fun m!405905 () Bool)

(assert (=> b!416448 m!405905))

(declare-fun m!405907 () Bool)

(assert (=> b!416448 m!405907))

(assert (=> b!416448 m!405899))

(declare-fun m!405909 () Bool)

(assert (=> b!416448 m!405909))

(declare-fun m!405911 () Bool)

(assert (=> b!416448 m!405911))

(declare-fun m!405913 () Bool)

(assert (=> b!416448 m!405913))

(assert (=> b!416448 m!405905))

(declare-fun m!405915 () Bool)

(assert (=> b!416448 m!405915))

(declare-fun m!405917 () Bool)

(assert (=> b!416448 m!405917))

(declare-fun m!405919 () Bool)

(assert (=> b!416448 m!405919))

(assert (=> b!416448 m!405909))

(declare-fun m!405921 () Bool)

(assert (=> b!416448 m!405921))

(assert (=> b!416448 m!405911))

(declare-fun m!405923 () Bool)

(assert (=> b!416448 m!405923))

(declare-fun m!405925 () Bool)

(assert (=> b!416448 m!405925))

(declare-fun m!405927 () Bool)

(assert (=> bm!28912 m!405927))

(declare-fun m!405929 () Bool)

(assert (=> b!416449 m!405929))

(declare-fun m!405931 () Bool)

(assert (=> start!39302 m!405931))

(declare-fun m!405933 () Bool)

(assert (=> start!39302 m!405933))

(declare-fun m!405935 () Bool)

(assert (=> b!416438 m!405935))

(check-sat (not start!39302) (not b!416448) (not b!416446) (not b!416451) tp_is_empty!10735 (not b!416438) (not b!416447) (not b!416453) (not b_next!9583) b_and!17057 (not bm!28911) (not b!416449) (not bm!28912) (not b!416443) (not b_lambda!8909) (not b!416441) (not mapNonEmpty!17724) (not b!416444) (not b!416437))
(check-sat b_and!17057 (not b_next!9583))
