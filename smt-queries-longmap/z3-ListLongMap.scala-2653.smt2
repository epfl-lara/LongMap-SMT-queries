; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39722 () Bool)

(assert start!39722)

(declare-fun b_free!10003 () Bool)

(declare-fun b_next!10003 () Bool)

(assert (=> start!39722 (= b_free!10003 (not b_next!10003))))

(declare-fun tp!35538 () Bool)

(declare-fun b_and!17679 () Bool)

(assert (=> start!39722 (= tp!35538 b_and!17679)))

(declare-fun b!427464 () Bool)

(declare-fun e!253450 () Bool)

(declare-fun e!253452 () Bool)

(assert (=> b!427464 (= e!253450 (not e!253452))))

(declare-fun res!250778 () Bool)

(assert (=> b!427464 (=> res!250778 e!253452)))

(declare-datatypes ((array!26156 0))(
  ( (array!26157 (arr!12527 (Array (_ BitVec 32) (_ BitVec 64))) (size!12879 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26156)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427464 (= res!250778 (not (validKeyInArray!0 (select (arr!12527 _keys!709) from!863))))))

(declare-datatypes ((V!15979 0))(
  ( (V!15980 (val!5622 Int)) )
))
(declare-datatypes ((tuple2!7290 0))(
  ( (tuple2!7291 (_1!3656 (_ BitVec 64)) (_2!3656 V!15979)) )
))
(declare-datatypes ((List!7293 0))(
  ( (Nil!7290) (Cons!7289 (h!8145 tuple2!7290) (t!12737 List!7293)) )
))
(declare-datatypes ((ListLongMap!6205 0))(
  ( (ListLongMap!6206 (toList!3118 List!7293)) )
))
(declare-fun lt!195342 () ListLongMap!6205)

(declare-fun lt!195348 () ListLongMap!6205)

(assert (=> b!427464 (= lt!195342 lt!195348)))

(declare-fun lt!195345 () ListLongMap!6205)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15979)

(declare-fun +!1331 (ListLongMap!6205 tuple2!7290) ListLongMap!6205)

(assert (=> b!427464 (= lt!195348 (+!1331 lt!195345 (tuple2!7291 k0!794 v!412)))))

(declare-fun minValue!515 () V!15979)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195343 () array!26156)

(declare-fun zeroValue!515 () V!15979)

(declare-datatypes ((ValueCell!5234 0))(
  ( (ValueCellFull!5234 (v!7870 V!15979)) (EmptyCell!5234) )
))
(declare-datatypes ((array!26158 0))(
  ( (array!26159 (arr!12528 (Array (_ BitVec 32) ValueCell!5234)) (size!12880 (_ BitVec 32))) )
))
(declare-fun lt!195346 () array!26158)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1364 (array!26156 array!26158 (_ BitVec 32) (_ BitVec 32) V!15979 V!15979 (_ BitVec 32) Int) ListLongMap!6205)

(assert (=> b!427464 (= lt!195342 (getCurrentListMapNoExtraKeys!1364 lt!195343 lt!195346 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26158)

(assert (=> b!427464 (= lt!195345 (getCurrentListMapNoExtraKeys!1364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12537 0))(
  ( (Unit!12538) )
))
(declare-fun lt!195344 () Unit!12537)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!515 (array!26156 array!26158 (_ BitVec 32) (_ BitVec 32) V!15979 V!15979 (_ BitVec 32) (_ BitVec 64) V!15979 (_ BitVec 32) Int) Unit!12537)

(assert (=> b!427464 (= lt!195344 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!515 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427465 () Bool)

(declare-fun e!253447 () Bool)

(declare-fun tp_is_empty!11155 () Bool)

(assert (=> b!427465 (= e!253447 tp_is_empty!11155)))

(declare-fun b!427466 () Bool)

(declare-fun e!253449 () Bool)

(assert (=> b!427466 (= e!253449 e!253450)))

(declare-fun res!250774 () Bool)

(assert (=> b!427466 (=> (not res!250774) (not e!253450))))

(assert (=> b!427466 (= res!250774 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195341 () ListLongMap!6205)

(assert (=> b!427466 (= lt!195341 (getCurrentListMapNoExtraKeys!1364 lt!195343 lt!195346 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427466 (= lt!195346 (array!26159 (store (arr!12528 _values!549) i!563 (ValueCellFull!5234 v!412)) (size!12880 _values!549)))))

(declare-fun lt!195347 () ListLongMap!6205)

(assert (=> b!427466 (= lt!195347 (getCurrentListMapNoExtraKeys!1364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427467 () Bool)

(declare-fun res!250770 () Bool)

(declare-fun e!253453 () Bool)

(assert (=> b!427467 (=> (not res!250770) (not e!253453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26156 (_ BitVec 32)) Bool)

(assert (=> b!427467 (= res!250770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427468 () Bool)

(declare-fun res!250769 () Bool)

(assert (=> b!427468 (=> (not res!250769) (not e!253449))))

(declare-datatypes ((List!7294 0))(
  ( (Nil!7291) (Cons!7290 (h!8146 (_ BitVec 64)) (t!12738 List!7294)) )
))
(declare-fun arrayNoDuplicates!0 (array!26156 (_ BitVec 32) List!7294) Bool)

(assert (=> b!427468 (= res!250769 (arrayNoDuplicates!0 lt!195343 #b00000000000000000000000000000000 Nil!7291))))

(declare-fun b!427469 () Bool)

(declare-fun res!250777 () Bool)

(assert (=> b!427469 (=> (not res!250777) (not e!253453))))

(assert (=> b!427469 (= res!250777 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7291))))

(declare-fun mapIsEmpty!18354 () Bool)

(declare-fun mapRes!18354 () Bool)

(assert (=> mapIsEmpty!18354 mapRes!18354))

(declare-fun b!427470 () Bool)

(assert (=> b!427470 (= e!253453 e!253449)))

(declare-fun res!250776 () Bool)

(assert (=> b!427470 (=> (not res!250776) (not e!253449))))

(assert (=> b!427470 (= res!250776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195343 mask!1025))))

(assert (=> b!427470 (= lt!195343 (array!26157 (store (arr!12527 _keys!709) i!563 k0!794) (size!12879 _keys!709)))))

(declare-fun b!427471 () Bool)

(declare-fun res!250772 () Bool)

(assert (=> b!427471 (=> (not res!250772) (not e!253453))))

(assert (=> b!427471 (= res!250772 (and (= (size!12880 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12879 _keys!709) (size!12880 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427472 () Bool)

(declare-fun res!250768 () Bool)

(assert (=> b!427472 (=> (not res!250768) (not e!253453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427472 (= res!250768 (validMask!0 mask!1025))))

(declare-fun b!427473 () Bool)

(declare-fun res!250767 () Bool)

(assert (=> b!427473 (=> (not res!250767) (not e!253453))))

(declare-fun arrayContainsKey!0 (array!26156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427473 (= res!250767 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427474 () Bool)

(assert (=> b!427474 (= e!253452 true)))

(declare-fun get!6203 (ValueCell!5234 V!15979) V!15979)

(declare-fun dynLambda!748 (Int (_ BitVec 64)) V!15979)

(assert (=> b!427474 (= lt!195341 (+!1331 lt!195348 (tuple2!7291 (select (arr!12527 _keys!709) from!863) (get!6203 (select (arr!12528 _values!549) from!863) (dynLambda!748 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427475 () Bool)

(declare-fun res!250775 () Bool)

(assert (=> b!427475 (=> (not res!250775) (not e!253453))))

(assert (=> b!427475 (= res!250775 (validKeyInArray!0 k0!794))))

(declare-fun b!427476 () Bool)

(declare-fun e!253451 () Bool)

(assert (=> b!427476 (= e!253451 tp_is_empty!11155)))

(declare-fun res!250766 () Bool)

(assert (=> start!39722 (=> (not res!250766) (not e!253453))))

(assert (=> start!39722 (= res!250766 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12879 _keys!709))))))

(assert (=> start!39722 e!253453))

(assert (=> start!39722 tp_is_empty!11155))

(assert (=> start!39722 tp!35538))

(assert (=> start!39722 true))

(declare-fun e!253446 () Bool)

(declare-fun array_inv!9192 (array!26158) Bool)

(assert (=> start!39722 (and (array_inv!9192 _values!549) e!253446)))

(declare-fun array_inv!9193 (array!26156) Bool)

(assert (=> start!39722 (array_inv!9193 _keys!709)))

(declare-fun b!427477 () Bool)

(declare-fun res!250779 () Bool)

(assert (=> b!427477 (=> (not res!250779) (not e!253449))))

(assert (=> b!427477 (= res!250779 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18354 () Bool)

(declare-fun tp!35537 () Bool)

(assert (=> mapNonEmpty!18354 (= mapRes!18354 (and tp!35537 e!253447))))

(declare-fun mapValue!18354 () ValueCell!5234)

(declare-fun mapRest!18354 () (Array (_ BitVec 32) ValueCell!5234))

(declare-fun mapKey!18354 () (_ BitVec 32))

(assert (=> mapNonEmpty!18354 (= (arr!12528 _values!549) (store mapRest!18354 mapKey!18354 mapValue!18354))))

(declare-fun b!427478 () Bool)

(declare-fun res!250773 () Bool)

(assert (=> b!427478 (=> (not res!250773) (not e!253453))))

(assert (=> b!427478 (= res!250773 (or (= (select (arr!12527 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12527 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427479 () Bool)

(assert (=> b!427479 (= e!253446 (and e!253451 mapRes!18354))))

(declare-fun condMapEmpty!18354 () Bool)

(declare-fun mapDefault!18354 () ValueCell!5234)

(assert (=> b!427479 (= condMapEmpty!18354 (= (arr!12528 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5234)) mapDefault!18354)))))

(declare-fun b!427480 () Bool)

(declare-fun res!250771 () Bool)

(assert (=> b!427480 (=> (not res!250771) (not e!253453))))

(assert (=> b!427480 (= res!250771 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12879 _keys!709))))))

(assert (= (and start!39722 res!250766) b!427472))

(assert (= (and b!427472 res!250768) b!427471))

(assert (= (and b!427471 res!250772) b!427467))

(assert (= (and b!427467 res!250770) b!427469))

(assert (= (and b!427469 res!250777) b!427480))

(assert (= (and b!427480 res!250771) b!427475))

(assert (= (and b!427475 res!250775) b!427478))

(assert (= (and b!427478 res!250773) b!427473))

(assert (= (and b!427473 res!250767) b!427470))

(assert (= (and b!427470 res!250776) b!427468))

(assert (= (and b!427468 res!250769) b!427477))

(assert (= (and b!427477 res!250779) b!427466))

(assert (= (and b!427466 res!250774) b!427464))

(assert (= (and b!427464 (not res!250778)) b!427474))

(assert (= (and b!427479 condMapEmpty!18354) mapIsEmpty!18354))

(assert (= (and b!427479 (not condMapEmpty!18354)) mapNonEmpty!18354))

(get-info :version)

(assert (= (and mapNonEmpty!18354 ((_ is ValueCellFull!5234) mapValue!18354)) b!427465))

(assert (= (and b!427479 ((_ is ValueCellFull!5234) mapDefault!18354)) b!427476))

(assert (= start!39722 b!427479))

(declare-fun b_lambda!9113 () Bool)

(assert (=> (not b_lambda!9113) (not b!427474)))

(declare-fun t!12736 () Bool)

(declare-fun tb!3401 () Bool)

(assert (=> (and start!39722 (= defaultEntry!557 defaultEntry!557) t!12736) tb!3401))

(declare-fun result!6337 () Bool)

(assert (=> tb!3401 (= result!6337 tp_is_empty!11155)))

(assert (=> b!427474 t!12736))

(declare-fun b_and!17681 () Bool)

(assert (= b_and!17679 (and (=> t!12736 result!6337) b_and!17681)))

(declare-fun m!416225 () Bool)

(assert (=> b!427469 m!416225))

(declare-fun m!416227 () Bool)

(assert (=> b!427467 m!416227))

(declare-fun m!416229 () Bool)

(assert (=> b!427470 m!416229))

(declare-fun m!416231 () Bool)

(assert (=> b!427470 m!416231))

(declare-fun m!416233 () Bool)

(assert (=> b!427468 m!416233))

(declare-fun m!416235 () Bool)

(assert (=> b!427475 m!416235))

(declare-fun m!416237 () Bool)

(assert (=> b!427474 m!416237))

(declare-fun m!416239 () Bool)

(assert (=> b!427474 m!416239))

(declare-fun m!416241 () Bool)

(assert (=> b!427474 m!416241))

(declare-fun m!416243 () Bool)

(assert (=> b!427474 m!416243))

(assert (=> b!427474 m!416241))

(assert (=> b!427474 m!416239))

(declare-fun m!416245 () Bool)

(assert (=> b!427474 m!416245))

(declare-fun m!416247 () Bool)

(assert (=> start!39722 m!416247))

(declare-fun m!416249 () Bool)

(assert (=> start!39722 m!416249))

(assert (=> b!427464 m!416237))

(declare-fun m!416251 () Bool)

(assert (=> b!427464 m!416251))

(declare-fun m!416253 () Bool)

(assert (=> b!427464 m!416253))

(declare-fun m!416255 () Bool)

(assert (=> b!427464 m!416255))

(assert (=> b!427464 m!416237))

(declare-fun m!416257 () Bool)

(assert (=> b!427464 m!416257))

(declare-fun m!416259 () Bool)

(assert (=> b!427464 m!416259))

(declare-fun m!416261 () Bool)

(assert (=> b!427472 m!416261))

(declare-fun m!416263 () Bool)

(assert (=> b!427478 m!416263))

(declare-fun m!416265 () Bool)

(assert (=> mapNonEmpty!18354 m!416265))

(declare-fun m!416267 () Bool)

(assert (=> b!427473 m!416267))

(declare-fun m!416269 () Bool)

(assert (=> b!427466 m!416269))

(declare-fun m!416271 () Bool)

(assert (=> b!427466 m!416271))

(declare-fun m!416273 () Bool)

(assert (=> b!427466 m!416273))

(check-sat (not b_lambda!9113) (not b!427464) (not b!427466) (not b!427475) (not b!427472) (not b!427469) tp_is_empty!11155 b_and!17681 (not start!39722) (not b!427470) (not b!427474) (not b!427468) (not b_next!10003) (not b!427473) (not b!427467) (not mapNonEmpty!18354))
(check-sat b_and!17681 (not b_next!10003))
