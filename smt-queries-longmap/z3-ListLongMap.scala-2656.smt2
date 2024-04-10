; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39756 () Bool)

(assert start!39756)

(declare-fun b_free!10023 () Bool)

(declare-fun b_next!10023 () Bool)

(assert (=> start!39756 (= b_free!10023 (not b_next!10023))))

(declare-fun tp!35597 () Bool)

(declare-fun b_and!17705 () Bool)

(assert (=> start!39756 (= tp!35597 b_and!17705)))

(declare-fun b!428043 () Bool)

(declare-fun res!251196 () Bool)

(declare-fun e!253721 () Bool)

(assert (=> b!428043 (=> (not res!251196) (not e!253721))))

(declare-datatypes ((array!26187 0))(
  ( (array!26188 (arr!12543 (Array (_ BitVec 32) (_ BitVec 64))) (size!12895 (_ BitVec 32))) )
))
(declare-fun lt!195566 () array!26187)

(declare-datatypes ((List!7422 0))(
  ( (Nil!7419) (Cons!7418 (h!8274 (_ BitVec 64)) (t!12894 List!7422)) )
))
(declare-fun arrayNoDuplicates!0 (array!26187 (_ BitVec 32) List!7422) Bool)

(assert (=> b!428043 (= res!251196 (arrayNoDuplicates!0 lt!195566 #b00000000000000000000000000000000 Nil!7419))))

(declare-fun b!428044 () Bool)

(declare-fun res!251198 () Bool)

(declare-fun e!253722 () Bool)

(assert (=> b!428044 (=> (not res!251198) (not e!253722))))

(declare-fun _keys!709 () array!26187)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26187 (_ BitVec 32)) Bool)

(assert (=> b!428044 (= res!251198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428045 () Bool)

(declare-fun e!253723 () Bool)

(declare-fun tp_is_empty!11175 () Bool)

(assert (=> b!428045 (= e!253723 tp_is_empty!11175)))

(declare-fun b!428046 () Bool)

(assert (=> b!428046 (= e!253722 e!253721)))

(declare-fun res!251195 () Bool)

(assert (=> b!428046 (=> (not res!251195) (not e!253721))))

(assert (=> b!428046 (= res!251195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195566 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428046 (= lt!195566 (array!26188 (store (arr!12543 _keys!709) i!563 k0!794) (size!12895 _keys!709)))))

(declare-fun b!428047 () Bool)

(declare-fun res!251202 () Bool)

(assert (=> b!428047 (=> (not res!251202) (not e!253722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428047 (= res!251202 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18384 () Bool)

(declare-fun mapRes!18384 () Bool)

(assert (=> mapIsEmpty!18384 mapRes!18384))

(declare-fun b!428049 () Bool)

(declare-fun res!251189 () Bool)

(assert (=> b!428049 (=> (not res!251189) (not e!253722))))

(assert (=> b!428049 (= res!251189 (or (= (select (arr!12543 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12543 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428050 () Bool)

(declare-fun e!253718 () Bool)

(declare-fun e!253719 () Bool)

(assert (=> b!428050 (= e!253718 (not e!253719))))

(declare-fun res!251192 () Bool)

(assert (=> b!428050 (=> res!251192 e!253719)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428050 (= res!251192 (not (validKeyInArray!0 (select (arr!12543 _keys!709) from!863))))))

(declare-datatypes ((V!16005 0))(
  ( (V!16006 (val!5632 Int)) )
))
(declare-datatypes ((tuple2!7408 0))(
  ( (tuple2!7409 (_1!3715 (_ BitVec 64)) (_2!3715 V!16005)) )
))
(declare-datatypes ((List!7423 0))(
  ( (Nil!7420) (Cons!7419 (h!8275 tuple2!7408) (t!12895 List!7423)) )
))
(declare-datatypes ((ListLongMap!6321 0))(
  ( (ListLongMap!6322 (toList!3176 List!7423)) )
))
(declare-fun lt!195565 () ListLongMap!6321)

(declare-fun lt!195568 () ListLongMap!6321)

(assert (=> b!428050 (= lt!195565 lt!195568)))

(declare-fun lt!195563 () ListLongMap!6321)

(declare-fun v!412 () V!16005)

(declare-fun +!1331 (ListLongMap!6321 tuple2!7408) ListLongMap!6321)

(assert (=> b!428050 (= lt!195568 (+!1331 lt!195563 (tuple2!7409 k0!794 v!412)))))

(declare-fun minValue!515 () V!16005)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5244 0))(
  ( (ValueCellFull!5244 (v!7879 V!16005)) (EmptyCell!5244) )
))
(declare-datatypes ((array!26189 0))(
  ( (array!26190 (arr!12544 (Array (_ BitVec 32) ValueCell!5244)) (size!12896 (_ BitVec 32))) )
))
(declare-fun lt!195562 () array!26189)

(declare-fun zeroValue!515 () V!16005)

(declare-fun getCurrentListMapNoExtraKeys!1378 (array!26187 array!26189 (_ BitVec 32) (_ BitVec 32) V!16005 V!16005 (_ BitVec 32) Int) ListLongMap!6321)

(assert (=> b!428050 (= lt!195565 (getCurrentListMapNoExtraKeys!1378 lt!195566 lt!195562 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26189)

(assert (=> b!428050 (= lt!195563 (getCurrentListMapNoExtraKeys!1378 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12558 0))(
  ( (Unit!12559) )
))
(declare-fun lt!195569 () Unit!12558)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!523 (array!26187 array!26189 (_ BitVec 32) (_ BitVec 32) V!16005 V!16005 (_ BitVec 32) (_ BitVec 64) V!16005 (_ BitVec 32) Int) Unit!12558)

(assert (=> b!428050 (= lt!195569 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!523 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428051 () Bool)

(declare-fun res!251197 () Bool)

(assert (=> b!428051 (=> (not res!251197) (not e!253722))))

(declare-fun arrayContainsKey!0 (array!26187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428051 (= res!251197 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18384 () Bool)

(declare-fun tp!35598 () Bool)

(assert (=> mapNonEmpty!18384 (= mapRes!18384 (and tp!35598 e!253723))))

(declare-fun mapRest!18384 () (Array (_ BitVec 32) ValueCell!5244))

(declare-fun mapKey!18384 () (_ BitVec 32))

(declare-fun mapValue!18384 () ValueCell!5244)

(assert (=> mapNonEmpty!18384 (= (arr!12544 _values!549) (store mapRest!18384 mapKey!18384 mapValue!18384))))

(declare-fun b!428052 () Bool)

(declare-fun res!251190 () Bool)

(assert (=> b!428052 (=> (not res!251190) (not e!253721))))

(assert (=> b!428052 (= res!251190 (bvsle from!863 i!563))))

(declare-fun b!428053 () Bool)

(declare-fun res!251191 () Bool)

(assert (=> b!428053 (=> (not res!251191) (not e!253722))))

(assert (=> b!428053 (= res!251191 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7419))))

(declare-fun b!428054 () Bool)

(assert (=> b!428054 (= e!253719 true)))

(declare-fun lt!195567 () ListLongMap!6321)

(declare-fun get!6214 (ValueCell!5244 V!16005) V!16005)

(declare-fun dynLambda!759 (Int (_ BitVec 64)) V!16005)

(assert (=> b!428054 (= lt!195567 (+!1331 lt!195568 (tuple2!7409 (select (arr!12543 _keys!709) from!863) (get!6214 (select (arr!12544 _values!549) from!863) (dynLambda!759 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428055 () Bool)

(declare-fun res!251193 () Bool)

(assert (=> b!428055 (=> (not res!251193) (not e!253722))))

(assert (=> b!428055 (= res!251193 (and (= (size!12896 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12895 _keys!709) (size!12896 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428056 () Bool)

(declare-fun res!251201 () Bool)

(assert (=> b!428056 (=> (not res!251201) (not e!253722))))

(assert (=> b!428056 (= res!251201 (validKeyInArray!0 k0!794))))

(declare-fun b!428057 () Bool)

(declare-fun res!251200 () Bool)

(assert (=> b!428057 (=> (not res!251200) (not e!253722))))

(assert (=> b!428057 (= res!251200 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12895 _keys!709))))))

(declare-fun b!428058 () Bool)

(declare-fun e!253724 () Bool)

(assert (=> b!428058 (= e!253724 tp_is_empty!11175)))

(declare-fun b!428059 () Bool)

(declare-fun e!253720 () Bool)

(assert (=> b!428059 (= e!253720 (and e!253724 mapRes!18384))))

(declare-fun condMapEmpty!18384 () Bool)

(declare-fun mapDefault!18384 () ValueCell!5244)

(assert (=> b!428059 (= condMapEmpty!18384 (= (arr!12544 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5244)) mapDefault!18384)))))

(declare-fun b!428048 () Bool)

(assert (=> b!428048 (= e!253721 e!253718)))

(declare-fun res!251194 () Bool)

(assert (=> b!428048 (=> (not res!251194) (not e!253718))))

(assert (=> b!428048 (= res!251194 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428048 (= lt!195567 (getCurrentListMapNoExtraKeys!1378 lt!195566 lt!195562 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428048 (= lt!195562 (array!26190 (store (arr!12544 _values!549) i!563 (ValueCellFull!5244 v!412)) (size!12896 _values!549)))))

(declare-fun lt!195564 () ListLongMap!6321)

(assert (=> b!428048 (= lt!195564 (getCurrentListMapNoExtraKeys!1378 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!251199 () Bool)

(assert (=> start!39756 (=> (not res!251199) (not e!253722))))

(assert (=> start!39756 (= res!251199 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12895 _keys!709))))))

(assert (=> start!39756 e!253722))

(assert (=> start!39756 tp_is_empty!11175))

(assert (=> start!39756 tp!35597))

(assert (=> start!39756 true))

(declare-fun array_inv!9144 (array!26189) Bool)

(assert (=> start!39756 (and (array_inv!9144 _values!549) e!253720)))

(declare-fun array_inv!9145 (array!26187) Bool)

(assert (=> start!39756 (array_inv!9145 _keys!709)))

(assert (= (and start!39756 res!251199) b!428047))

(assert (= (and b!428047 res!251202) b!428055))

(assert (= (and b!428055 res!251193) b!428044))

(assert (= (and b!428044 res!251198) b!428053))

(assert (= (and b!428053 res!251191) b!428057))

(assert (= (and b!428057 res!251200) b!428056))

(assert (= (and b!428056 res!251201) b!428049))

(assert (= (and b!428049 res!251189) b!428051))

(assert (= (and b!428051 res!251197) b!428046))

(assert (= (and b!428046 res!251195) b!428043))

(assert (= (and b!428043 res!251196) b!428052))

(assert (= (and b!428052 res!251190) b!428048))

(assert (= (and b!428048 res!251194) b!428050))

(assert (= (and b!428050 (not res!251192)) b!428054))

(assert (= (and b!428059 condMapEmpty!18384) mapIsEmpty!18384))

(assert (= (and b!428059 (not condMapEmpty!18384)) mapNonEmpty!18384))

(get-info :version)

(assert (= (and mapNonEmpty!18384 ((_ is ValueCellFull!5244) mapValue!18384)) b!428045))

(assert (= (and b!428059 ((_ is ValueCellFull!5244) mapDefault!18384)) b!428058))

(assert (= start!39756 b!428059))

(declare-fun b_lambda!9111 () Bool)

(assert (=> (not b_lambda!9111) (not b!428054)))

(declare-fun t!12893 () Bool)

(declare-fun tb!3429 () Bool)

(assert (=> (and start!39756 (= defaultEntry!557 defaultEntry!557) t!12893) tb!3429))

(declare-fun result!6385 () Bool)

(assert (=> tb!3429 (= result!6385 tp_is_empty!11175)))

(assert (=> b!428054 t!12893))

(declare-fun b_and!17707 () Bool)

(assert (= b_and!17705 (and (=> t!12893 result!6385) b_and!17707)))

(declare-fun m!416507 () Bool)

(assert (=> b!428047 m!416507))

(declare-fun m!416509 () Bool)

(assert (=> b!428054 m!416509))

(declare-fun m!416511 () Bool)

(assert (=> b!428054 m!416511))

(declare-fun m!416513 () Bool)

(assert (=> b!428054 m!416513))

(assert (=> b!428054 m!416513))

(assert (=> b!428054 m!416511))

(declare-fun m!416515 () Bool)

(assert (=> b!428054 m!416515))

(declare-fun m!416517 () Bool)

(assert (=> b!428054 m!416517))

(declare-fun m!416519 () Bool)

(assert (=> b!428048 m!416519))

(declare-fun m!416521 () Bool)

(assert (=> b!428048 m!416521))

(declare-fun m!416523 () Bool)

(assert (=> b!428048 m!416523))

(declare-fun m!416525 () Bool)

(assert (=> b!428056 m!416525))

(declare-fun m!416527 () Bool)

(assert (=> mapNonEmpty!18384 m!416527))

(declare-fun m!416529 () Bool)

(assert (=> b!428043 m!416529))

(declare-fun m!416531 () Bool)

(assert (=> b!428049 m!416531))

(declare-fun m!416533 () Bool)

(assert (=> b!428051 m!416533))

(declare-fun m!416535 () Bool)

(assert (=> b!428050 m!416535))

(declare-fun m!416537 () Bool)

(assert (=> b!428050 m!416537))

(assert (=> b!428050 m!416509))

(declare-fun m!416539 () Bool)

(assert (=> b!428050 m!416539))

(declare-fun m!416541 () Bool)

(assert (=> b!428050 m!416541))

(declare-fun m!416543 () Bool)

(assert (=> b!428050 m!416543))

(assert (=> b!428050 m!416509))

(declare-fun m!416545 () Bool)

(assert (=> b!428053 m!416545))

(declare-fun m!416547 () Bool)

(assert (=> b!428044 m!416547))

(declare-fun m!416549 () Bool)

(assert (=> b!428046 m!416549))

(declare-fun m!416551 () Bool)

(assert (=> b!428046 m!416551))

(declare-fun m!416553 () Bool)

(assert (=> start!39756 m!416553))

(declare-fun m!416555 () Bool)

(assert (=> start!39756 m!416555))

(check-sat (not b!428044) (not b!428048) (not b!428054) (not mapNonEmpty!18384) (not start!39756) (not b_next!10023) (not b!428047) (not b!428046) (not b_lambda!9111) (not b!428043) (not b!428051) tp_is_empty!11175 (not b!428056) (not b!428053) b_and!17707 (not b!428050))
(check-sat b_and!17707 (not b_next!10023))
