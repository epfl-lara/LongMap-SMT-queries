; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39650 () Bool)

(assert start!39650)

(declare-fun b_free!9931 () Bool)

(declare-fun b_next!9931 () Bool)

(assert (=> start!39650 (= b_free!9931 (not b_next!9931))))

(declare-fun tp!35321 () Bool)

(declare-fun b_and!17561 () Bool)

(assert (=> start!39650 (= tp!35321 b_and!17561)))

(declare-fun b!425488 () Bool)

(declare-fun res!249217 () Bool)

(declare-fun e!252533 () Bool)

(assert (=> b!425488 (=> (not res!249217) (not e!252533))))

(declare-datatypes ((array!25995 0))(
  ( (array!25996 (arr!12447 (Array (_ BitVec 32) (_ BitVec 64))) (size!12800 (_ BitVec 32))) )
))
(declare-fun lt!194516 () array!25995)

(declare-datatypes ((List!7333 0))(
  ( (Nil!7330) (Cons!7329 (h!8185 (_ BitVec 64)) (t!12768 List!7333)) )
))
(declare-fun arrayNoDuplicates!0 (array!25995 (_ BitVec 32) List!7333) Bool)

(assert (=> b!425488 (= res!249217 (arrayNoDuplicates!0 lt!194516 #b00000000000000000000000000000000 Nil!7330))))

(declare-fun b!425489 () Bool)

(declare-fun res!249224 () Bool)

(declare-fun e!252532 () Bool)

(assert (=> b!425489 (=> (not res!249224) (not e!252532))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!25995)

(assert (=> b!425489 (= res!249224 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12800 _keys!709))))))

(declare-fun b!425490 () Bool)

(declare-fun res!249226 () Bool)

(assert (=> b!425490 (=> (not res!249226) (not e!252533))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425490 (= res!249226 (bvsle from!863 i!563))))

(declare-fun b!425491 () Bool)

(declare-fun res!249221 () Bool)

(assert (=> b!425491 (=> (not res!249221) (not e!252532))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425491 (= res!249221 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425492 () Bool)

(declare-fun e!252531 () Bool)

(assert (=> b!425492 (= e!252533 e!252531)))

(declare-fun res!249228 () Bool)

(assert (=> b!425492 (=> (not res!249228) (not e!252531))))

(assert (=> b!425492 (= res!249228 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15883 0))(
  ( (V!15884 (val!5586 Int)) )
))
(declare-datatypes ((tuple2!7334 0))(
  ( (tuple2!7335 (_1!3678 (_ BitVec 64)) (_2!3678 V!15883)) )
))
(declare-datatypes ((List!7334 0))(
  ( (Nil!7331) (Cons!7330 (h!8186 tuple2!7334) (t!12769 List!7334)) )
))
(declare-datatypes ((ListLongMap!6237 0))(
  ( (ListLongMap!6238 (toList!3134 List!7334)) )
))
(declare-fun lt!194517 () ListLongMap!6237)

(declare-fun zeroValue!515 () V!15883)

(declare-datatypes ((ValueCell!5198 0))(
  ( (ValueCellFull!5198 (v!7827 V!15883)) (EmptyCell!5198) )
))
(declare-datatypes ((array!25997 0))(
  ( (array!25998 (arr!12448 (Array (_ BitVec 32) ValueCell!5198)) (size!12801 (_ BitVec 32))) )
))
(declare-fun lt!194515 () array!25997)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15883)

(declare-fun getCurrentListMapNoExtraKeys!1342 (array!25995 array!25997 (_ BitVec 32) (_ BitVec 32) V!15883 V!15883 (_ BitVec 32) Int) ListLongMap!6237)

(assert (=> b!425492 (= lt!194517 (getCurrentListMapNoExtraKeys!1342 lt!194516 lt!194515 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25997)

(declare-fun v!412 () V!15883)

(assert (=> b!425492 (= lt!194515 (array!25998 (store (arr!12448 _values!549) i!563 (ValueCellFull!5198 v!412)) (size!12801 _values!549)))))

(declare-fun lt!194518 () ListLongMap!6237)

(assert (=> b!425492 (= lt!194518 (getCurrentListMapNoExtraKeys!1342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425493 () Bool)

(assert (=> b!425493 (= e!252531 (not true))))

(declare-fun +!1316 (ListLongMap!6237 tuple2!7334) ListLongMap!6237)

(assert (=> b!425493 (= (getCurrentListMapNoExtraKeys!1342 lt!194516 lt!194515 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1316 (getCurrentListMapNoExtraKeys!1342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7335 k0!794 v!412)))))

(declare-datatypes ((Unit!12478 0))(
  ( (Unit!12479) )
))
(declare-fun lt!194519 () Unit!12478)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!487 (array!25995 array!25997 (_ BitVec 32) (_ BitVec 32) V!15883 V!15883 (_ BitVec 32) (_ BitVec 64) V!15883 (_ BitVec 32) Int) Unit!12478)

(assert (=> b!425493 (= lt!194519 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425494 () Bool)

(declare-fun res!249218 () Bool)

(assert (=> b!425494 (=> (not res!249218) (not e!252532))))

(assert (=> b!425494 (= res!249218 (and (= (size!12801 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12800 _keys!709) (size!12801 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425495 () Bool)

(declare-fun res!249223 () Bool)

(assert (=> b!425495 (=> (not res!249223) (not e!252532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425495 (= res!249223 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18246 () Bool)

(declare-fun mapRes!18246 () Bool)

(declare-fun tp!35322 () Bool)

(declare-fun e!252534 () Bool)

(assert (=> mapNonEmpty!18246 (= mapRes!18246 (and tp!35322 e!252534))))

(declare-fun mapRest!18246 () (Array (_ BitVec 32) ValueCell!5198))

(declare-fun mapKey!18246 () (_ BitVec 32))

(declare-fun mapValue!18246 () ValueCell!5198)

(assert (=> mapNonEmpty!18246 (= (arr!12448 _values!549) (store mapRest!18246 mapKey!18246 mapValue!18246))))

(declare-fun res!249225 () Bool)

(assert (=> start!39650 (=> (not res!249225) (not e!252532))))

(assert (=> start!39650 (= res!249225 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12800 _keys!709))))))

(assert (=> start!39650 e!252532))

(declare-fun tp_is_empty!11083 () Bool)

(assert (=> start!39650 tp_is_empty!11083))

(assert (=> start!39650 tp!35321))

(assert (=> start!39650 true))

(declare-fun e!252529 () Bool)

(declare-fun array_inv!9106 (array!25997) Bool)

(assert (=> start!39650 (and (array_inv!9106 _values!549) e!252529)))

(declare-fun array_inv!9107 (array!25995) Bool)

(assert (=> start!39650 (array_inv!9107 _keys!709)))

(declare-fun b!425496 () Bool)

(declare-fun res!249227 () Bool)

(assert (=> b!425496 (=> (not res!249227) (not e!252532))))

(assert (=> b!425496 (= res!249227 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7330))))

(declare-fun b!425497 () Bool)

(declare-fun e!252530 () Bool)

(assert (=> b!425497 (= e!252530 tp_is_empty!11083)))

(declare-fun b!425498 () Bool)

(declare-fun res!249220 () Bool)

(assert (=> b!425498 (=> (not res!249220) (not e!252532))))

(assert (=> b!425498 (= res!249220 (or (= (select (arr!12447 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12447 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425499 () Bool)

(assert (=> b!425499 (= e!252529 (and e!252530 mapRes!18246))))

(declare-fun condMapEmpty!18246 () Bool)

(declare-fun mapDefault!18246 () ValueCell!5198)

(assert (=> b!425499 (= condMapEmpty!18246 (= (arr!12448 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5198)) mapDefault!18246)))))

(declare-fun b!425500 () Bool)

(assert (=> b!425500 (= e!252534 tp_is_empty!11083)))

(declare-fun b!425501 () Bool)

(declare-fun res!249216 () Bool)

(assert (=> b!425501 (=> (not res!249216) (not e!252532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25995 (_ BitVec 32)) Bool)

(assert (=> b!425501 (= res!249216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425502 () Bool)

(declare-fun res!249222 () Bool)

(assert (=> b!425502 (=> (not res!249222) (not e!252532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425502 (= res!249222 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18246 () Bool)

(assert (=> mapIsEmpty!18246 mapRes!18246))

(declare-fun b!425503 () Bool)

(assert (=> b!425503 (= e!252532 e!252533)))

(declare-fun res!249219 () Bool)

(assert (=> b!425503 (=> (not res!249219) (not e!252533))))

(assert (=> b!425503 (= res!249219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194516 mask!1025))))

(assert (=> b!425503 (= lt!194516 (array!25996 (store (arr!12447 _keys!709) i!563 k0!794) (size!12800 _keys!709)))))

(assert (= (and start!39650 res!249225) b!425502))

(assert (= (and b!425502 res!249222) b!425494))

(assert (= (and b!425494 res!249218) b!425501))

(assert (= (and b!425501 res!249216) b!425496))

(assert (= (and b!425496 res!249227) b!425489))

(assert (= (and b!425489 res!249224) b!425495))

(assert (= (and b!425495 res!249223) b!425498))

(assert (= (and b!425498 res!249220) b!425491))

(assert (= (and b!425491 res!249221) b!425503))

(assert (= (and b!425503 res!249219) b!425488))

(assert (= (and b!425488 res!249217) b!425490))

(assert (= (and b!425490 res!249226) b!425492))

(assert (= (and b!425492 res!249228) b!425493))

(assert (= (and b!425499 condMapEmpty!18246) mapIsEmpty!18246))

(assert (= (and b!425499 (not condMapEmpty!18246)) mapNonEmpty!18246))

(get-info :version)

(assert (= (and mapNonEmpty!18246 ((_ is ValueCellFull!5198) mapValue!18246)) b!425500))

(assert (= (and b!425499 ((_ is ValueCellFull!5198) mapDefault!18246)) b!425497))

(assert (= start!39650 b!425499))

(declare-fun m!413859 () Bool)

(assert (=> b!425488 m!413859))

(declare-fun m!413861 () Bool)

(assert (=> b!425493 m!413861))

(declare-fun m!413863 () Bool)

(assert (=> b!425493 m!413863))

(assert (=> b!425493 m!413863))

(declare-fun m!413865 () Bool)

(assert (=> b!425493 m!413865))

(declare-fun m!413867 () Bool)

(assert (=> b!425493 m!413867))

(declare-fun m!413869 () Bool)

(assert (=> b!425503 m!413869))

(declare-fun m!413871 () Bool)

(assert (=> b!425503 m!413871))

(declare-fun m!413873 () Bool)

(assert (=> mapNonEmpty!18246 m!413873))

(declare-fun m!413875 () Bool)

(assert (=> b!425502 m!413875))

(declare-fun m!413877 () Bool)

(assert (=> b!425495 m!413877))

(declare-fun m!413879 () Bool)

(assert (=> b!425491 m!413879))

(declare-fun m!413881 () Bool)

(assert (=> b!425501 m!413881))

(declare-fun m!413883 () Bool)

(assert (=> b!425498 m!413883))

(declare-fun m!413885 () Bool)

(assert (=> start!39650 m!413885))

(declare-fun m!413887 () Bool)

(assert (=> start!39650 m!413887))

(declare-fun m!413889 () Bool)

(assert (=> b!425492 m!413889))

(declare-fun m!413891 () Bool)

(assert (=> b!425492 m!413891))

(declare-fun m!413893 () Bool)

(assert (=> b!425492 m!413893))

(declare-fun m!413895 () Bool)

(assert (=> b!425496 m!413895))

(check-sat (not b!425496) (not start!39650) b_and!17561 (not b!425491) (not mapNonEmpty!18246) (not b!425503) (not b!425492) (not b!425501) (not b_next!9931) (not b!425488) (not b!425495) (not b!425493) (not b!425502) tp_is_empty!11083)
(check-sat b_and!17561 (not b_next!9931))
