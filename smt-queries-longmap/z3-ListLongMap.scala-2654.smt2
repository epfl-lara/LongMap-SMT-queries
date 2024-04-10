; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39744 () Bool)

(assert start!39744)

(declare-fun b_free!10011 () Bool)

(declare-fun b_next!10011 () Bool)

(assert (=> start!39744 (= b_free!10011 (not b_next!10011))))

(declare-fun tp!35561 () Bool)

(declare-fun b_and!17681 () Bool)

(assert (=> start!39744 (= tp!35561 b_and!17681)))

(declare-fun b!427725 () Bool)

(declare-fun res!250946 () Bool)

(declare-fun e!253576 () Bool)

(assert (=> b!427725 (=> (not res!250946) (not e!253576))))

(declare-datatypes ((array!26163 0))(
  ( (array!26164 (arr!12531 (Array (_ BitVec 32) (_ BitVec 64))) (size!12883 (_ BitVec 32))) )
))
(declare-fun lt!195422 () array!26163)

(declare-datatypes ((List!7411 0))(
  ( (Nil!7408) (Cons!7407 (h!8263 (_ BitVec 64)) (t!12871 List!7411)) )
))
(declare-fun arrayNoDuplicates!0 (array!26163 (_ BitVec 32) List!7411) Bool)

(assert (=> b!427725 (= res!250946 (arrayNoDuplicates!0 lt!195422 #b00000000000000000000000000000000 Nil!7408))))

(declare-fun b!427726 () Bool)

(declare-fun res!250939 () Bool)

(declare-fun e!253580 () Bool)

(assert (=> b!427726 (=> (not res!250939) (not e!253580))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427726 (= res!250939 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18366 () Bool)

(declare-fun mapRes!18366 () Bool)

(assert (=> mapIsEmpty!18366 mapRes!18366))

(declare-fun b!427727 () Bool)

(declare-fun res!250938 () Bool)

(assert (=> b!427727 (=> (not res!250938) (not e!253580))))

(declare-fun _keys!709 () array!26163)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26163 (_ BitVec 32)) Bool)

(assert (=> b!427727 (= res!250938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427728 () Bool)

(declare-fun e!253575 () Bool)

(declare-fun tp_is_empty!11163 () Bool)

(assert (=> b!427728 (= e!253575 tp_is_empty!11163)))

(declare-fun res!250949 () Bool)

(assert (=> start!39744 (=> (not res!250949) (not e!253580))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39744 (= res!250949 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12883 _keys!709))))))

(assert (=> start!39744 e!253580))

(assert (=> start!39744 tp_is_empty!11163))

(assert (=> start!39744 tp!35561))

(assert (=> start!39744 true))

(declare-datatypes ((V!15989 0))(
  ( (V!15990 (val!5626 Int)) )
))
(declare-datatypes ((ValueCell!5238 0))(
  ( (ValueCellFull!5238 (v!7873 V!15989)) (EmptyCell!5238) )
))
(declare-datatypes ((array!26165 0))(
  ( (array!26166 (arr!12532 (Array (_ BitVec 32) ValueCell!5238)) (size!12884 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26165)

(declare-fun e!253579 () Bool)

(declare-fun array_inv!9134 (array!26165) Bool)

(assert (=> start!39744 (and (array_inv!9134 _values!549) e!253579)))

(declare-fun array_inv!9135 (array!26163) Bool)

(assert (=> start!39744 (array_inv!9135 _keys!709)))

(declare-fun b!427729 () Bool)

(declare-fun res!250945 () Bool)

(assert (=> b!427729 (=> (not res!250945) (not e!253576))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427729 (= res!250945 (bvsle from!863 i!563))))

(declare-fun b!427730 () Bool)

(declare-fun e!253578 () Bool)

(assert (=> b!427730 (= e!253578 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7398 0))(
  ( (tuple2!7399 (_1!3710 (_ BitVec 64)) (_2!3710 V!15989)) )
))
(declare-datatypes ((List!7412 0))(
  ( (Nil!7409) (Cons!7408 (h!8264 tuple2!7398) (t!12872 List!7412)) )
))
(declare-datatypes ((ListLongMap!6311 0))(
  ( (ListLongMap!6312 (toList!3171 List!7412)) )
))
(declare-fun lt!195424 () ListLongMap!6311)

(declare-fun lt!195419 () ListLongMap!6311)

(declare-fun +!1326 (ListLongMap!6311 tuple2!7398) ListLongMap!6311)

(declare-fun get!6205 (ValueCell!5238 V!15989) V!15989)

(declare-fun dynLambda!754 (Int (_ BitVec 64)) V!15989)

(assert (=> b!427730 (= lt!195424 (+!1326 lt!195419 (tuple2!7399 (select (arr!12531 _keys!709) from!863) (get!6205 (select (arr!12532 _values!549) from!863) (dynLambda!754 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!18366 () Bool)

(declare-fun tp!35562 () Bool)

(assert (=> mapNonEmpty!18366 (= mapRes!18366 (and tp!35562 e!253575))))

(declare-fun mapRest!18366 () (Array (_ BitVec 32) ValueCell!5238))

(declare-fun mapKey!18366 () (_ BitVec 32))

(declare-fun mapValue!18366 () ValueCell!5238)

(assert (=> mapNonEmpty!18366 (= (arr!12532 _values!549) (store mapRest!18366 mapKey!18366 mapValue!18366))))

(declare-fun b!427731 () Bool)

(declare-fun res!250941 () Bool)

(assert (=> b!427731 (=> (not res!250941) (not e!253580))))

(assert (=> b!427731 (= res!250941 (or (= (select (arr!12531 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12531 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427732 () Bool)

(declare-fun res!250944 () Bool)

(assert (=> b!427732 (=> (not res!250944) (not e!253580))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427732 (= res!250944 (validKeyInArray!0 k0!794))))

(declare-fun b!427733 () Bool)

(assert (=> b!427733 (= e!253580 e!253576)))

(declare-fun res!250942 () Bool)

(assert (=> b!427733 (=> (not res!250942) (not e!253576))))

(assert (=> b!427733 (= res!250942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195422 mask!1025))))

(assert (=> b!427733 (= lt!195422 (array!26164 (store (arr!12531 _keys!709) i!563 k0!794) (size!12883 _keys!709)))))

(declare-fun b!427734 () Bool)

(declare-fun e!253581 () Bool)

(assert (=> b!427734 (= e!253579 (and e!253581 mapRes!18366))))

(declare-fun condMapEmpty!18366 () Bool)

(declare-fun mapDefault!18366 () ValueCell!5238)

(assert (=> b!427734 (= condMapEmpty!18366 (= (arr!12532 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5238)) mapDefault!18366)))))

(declare-fun b!427735 () Bool)

(declare-fun res!250940 () Bool)

(assert (=> b!427735 (=> (not res!250940) (not e!253580))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!427735 (= res!250940 (and (= (size!12884 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12883 _keys!709) (size!12884 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427736 () Bool)

(declare-fun res!250947 () Bool)

(assert (=> b!427736 (=> (not res!250947) (not e!253580))))

(declare-fun arrayContainsKey!0 (array!26163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427736 (= res!250947 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427737 () Bool)

(declare-fun e!253574 () Bool)

(assert (=> b!427737 (= e!253574 (not e!253578))))

(declare-fun res!250943 () Bool)

(assert (=> b!427737 (=> res!250943 e!253578)))

(assert (=> b!427737 (= res!250943 (not (validKeyInArray!0 (select (arr!12531 _keys!709) from!863))))))

(declare-fun lt!195423 () ListLongMap!6311)

(assert (=> b!427737 (= lt!195423 lt!195419)))

(declare-fun lt!195421 () ListLongMap!6311)

(declare-fun v!412 () V!15989)

(assert (=> b!427737 (= lt!195419 (+!1326 lt!195421 (tuple2!7399 k0!794 v!412)))))

(declare-fun minValue!515 () V!15989)

(declare-fun zeroValue!515 () V!15989)

(declare-fun lt!195420 () array!26165)

(declare-fun getCurrentListMapNoExtraKeys!1373 (array!26163 array!26165 (_ BitVec 32) (_ BitVec 32) V!15989 V!15989 (_ BitVec 32) Int) ListLongMap!6311)

(assert (=> b!427737 (= lt!195423 (getCurrentListMapNoExtraKeys!1373 lt!195422 lt!195420 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427737 (= lt!195421 (getCurrentListMapNoExtraKeys!1373 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12550 0))(
  ( (Unit!12551) )
))
(declare-fun lt!195425 () Unit!12550)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!519 (array!26163 array!26165 (_ BitVec 32) (_ BitVec 32) V!15989 V!15989 (_ BitVec 32) (_ BitVec 64) V!15989 (_ BitVec 32) Int) Unit!12550)

(assert (=> b!427737 (= lt!195425 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!519 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427738 () Bool)

(assert (=> b!427738 (= e!253581 tp_is_empty!11163)))

(declare-fun b!427739 () Bool)

(declare-fun res!250950 () Bool)

(assert (=> b!427739 (=> (not res!250950) (not e!253580))))

(assert (=> b!427739 (= res!250950 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7408))))

(declare-fun b!427740 () Bool)

(assert (=> b!427740 (= e!253576 e!253574)))

(declare-fun res!250937 () Bool)

(assert (=> b!427740 (=> (not res!250937) (not e!253574))))

(assert (=> b!427740 (= res!250937 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!427740 (= lt!195424 (getCurrentListMapNoExtraKeys!1373 lt!195422 lt!195420 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427740 (= lt!195420 (array!26166 (store (arr!12532 _values!549) i!563 (ValueCellFull!5238 v!412)) (size!12884 _values!549)))))

(declare-fun lt!195418 () ListLongMap!6311)

(assert (=> b!427740 (= lt!195418 (getCurrentListMapNoExtraKeys!1373 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427741 () Bool)

(declare-fun res!250948 () Bool)

(assert (=> b!427741 (=> (not res!250948) (not e!253580))))

(assert (=> b!427741 (= res!250948 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12883 _keys!709))))))

(assert (= (and start!39744 res!250949) b!427726))

(assert (= (and b!427726 res!250939) b!427735))

(assert (= (and b!427735 res!250940) b!427727))

(assert (= (and b!427727 res!250938) b!427739))

(assert (= (and b!427739 res!250950) b!427741))

(assert (= (and b!427741 res!250948) b!427732))

(assert (= (and b!427732 res!250944) b!427731))

(assert (= (and b!427731 res!250941) b!427736))

(assert (= (and b!427736 res!250947) b!427733))

(assert (= (and b!427733 res!250942) b!427725))

(assert (= (and b!427725 res!250946) b!427729))

(assert (= (and b!427729 res!250945) b!427740))

(assert (= (and b!427740 res!250937) b!427737))

(assert (= (and b!427737 (not res!250943)) b!427730))

(assert (= (and b!427734 condMapEmpty!18366) mapIsEmpty!18366))

(assert (= (and b!427734 (not condMapEmpty!18366)) mapNonEmpty!18366))

(get-info :version)

(assert (= (and mapNonEmpty!18366 ((_ is ValueCellFull!5238) mapValue!18366)) b!427728))

(assert (= (and b!427734 ((_ is ValueCellFull!5238) mapDefault!18366)) b!427738))

(assert (= start!39744 b!427734))

(declare-fun b_lambda!9099 () Bool)

(assert (=> (not b_lambda!9099) (not b!427730)))

(declare-fun t!12870 () Bool)

(declare-fun tb!3417 () Bool)

(assert (=> (and start!39744 (= defaultEntry!557 defaultEntry!557) t!12870) tb!3417))

(declare-fun result!6361 () Bool)

(assert (=> tb!3417 (= result!6361 tp_is_empty!11163)))

(assert (=> b!427730 t!12870))

(declare-fun b_and!17683 () Bool)

(assert (= b_and!17681 (and (=> t!12870 result!6361) b_and!17683)))

(declare-fun m!416207 () Bool)

(assert (=> b!427736 m!416207))

(declare-fun m!416209 () Bool)

(assert (=> b!427726 m!416209))

(declare-fun m!416211 () Bool)

(assert (=> b!427740 m!416211))

(declare-fun m!416213 () Bool)

(assert (=> b!427740 m!416213))

(declare-fun m!416215 () Bool)

(assert (=> b!427740 m!416215))

(declare-fun m!416217 () Bool)

(assert (=> b!427732 m!416217))

(declare-fun m!416219 () Bool)

(assert (=> mapNonEmpty!18366 m!416219))

(declare-fun m!416221 () Bool)

(assert (=> b!427730 m!416221))

(declare-fun m!416223 () Bool)

(assert (=> b!427730 m!416223))

(declare-fun m!416225 () Bool)

(assert (=> b!427730 m!416225))

(assert (=> b!427730 m!416223))

(declare-fun m!416227 () Bool)

(assert (=> b!427730 m!416227))

(declare-fun m!416229 () Bool)

(assert (=> b!427730 m!416229))

(assert (=> b!427730 m!416225))

(declare-fun m!416231 () Bool)

(assert (=> b!427739 m!416231))

(declare-fun m!416233 () Bool)

(assert (=> b!427733 m!416233))

(declare-fun m!416235 () Bool)

(assert (=> b!427733 m!416235))

(assert (=> b!427737 m!416221))

(declare-fun m!416237 () Bool)

(assert (=> b!427737 m!416237))

(declare-fun m!416239 () Bool)

(assert (=> b!427737 m!416239))

(declare-fun m!416241 () Bool)

(assert (=> b!427737 m!416241))

(declare-fun m!416243 () Bool)

(assert (=> b!427737 m!416243))

(assert (=> b!427737 m!416221))

(declare-fun m!416245 () Bool)

(assert (=> b!427737 m!416245))

(declare-fun m!416247 () Bool)

(assert (=> b!427731 m!416247))

(declare-fun m!416249 () Bool)

(assert (=> b!427725 m!416249))

(declare-fun m!416251 () Bool)

(assert (=> b!427727 m!416251))

(declare-fun m!416253 () Bool)

(assert (=> start!39744 m!416253))

(declare-fun m!416255 () Bool)

(assert (=> start!39744 m!416255))

(check-sat tp_is_empty!11163 (not b!427726) (not b!427730) b_and!17683 (not b_next!10011) (not b!427740) (not b!427725) (not b!427737) (not b!427732) (not b!427739) (not b_lambda!9099) (not b!427733) (not b!427736) (not start!39744) (not mapNonEmpty!18366) (not b!427727))
(check-sat b_and!17683 (not b_next!10011))
