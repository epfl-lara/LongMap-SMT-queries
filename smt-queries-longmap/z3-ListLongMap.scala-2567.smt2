; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39206 () Bool)

(assert start!39206)

(declare-fun b_free!9487 () Bool)

(declare-fun b_next!9487 () Bool)

(assert (=> start!39206 (= b_free!9487 (not b_next!9487))))

(declare-fun tp!33989 () Bool)

(declare-fun b_and!16847 () Bool)

(assert (=> start!39206 (= tp!33989 b_and!16847)))

(declare-fun b!413432 () Bool)

(declare-fun res!240310 () Bool)

(declare-fun e!247175 () Bool)

(assert (=> b!413432 (=> (not res!240310) (not e!247175))))

(declare-datatypes ((array!25127 0))(
  ( (array!25128 (arr!12013 (Array (_ BitVec 32) (_ BitVec 64))) (size!12366 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25127)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25127 (_ BitVec 32)) Bool)

(assert (=> b!413432 (= res!240310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413433 () Bool)

(declare-fun e!247182 () Bool)

(declare-fun tp_is_empty!10639 () Bool)

(assert (=> b!413433 (= e!247182 tp_is_empty!10639)))

(declare-fun b!413434 () Bool)

(declare-fun res!240309 () Bool)

(assert (=> b!413434 (=> (not res!240309) (not e!247175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413434 (= res!240309 (validMask!0 mask!1025))))

(declare-fun b!413435 () Bool)

(declare-fun res!240306 () Bool)

(assert (=> b!413435 (=> (not res!240306) (not e!247175))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413435 (= res!240306 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413436 () Bool)

(declare-fun e!247176 () Bool)

(assert (=> b!413436 (= e!247176 (not true))))

(declare-fun e!247180 () Bool)

(assert (=> b!413436 e!247180))

(declare-fun c!54873 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413436 (= c!54873 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15291 0))(
  ( (V!15292 (val!5364 Int)) )
))
(declare-fun minValue!515 () V!15291)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4976 0))(
  ( (ValueCellFull!4976 (v!7605 V!15291)) (EmptyCell!4976) )
))
(declare-datatypes ((array!25129 0))(
  ( (array!25130 (arr!12014 (Array (_ BitVec 32) ValueCell!4976)) (size!12367 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25129)

(declare-fun zeroValue!515 () V!15291)

(declare-datatypes ((Unit!12210 0))(
  ( (Unit!12211) )
))
(declare-fun lt!189569 () Unit!12210)

(declare-fun v!412 () V!15291)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!368 (array!25127 array!25129 (_ BitVec 32) (_ BitVec 32) V!15291 V!15291 (_ BitVec 32) (_ BitVec 64) V!15291 (_ BitVec 32) Int) Unit!12210)

(assert (=> b!413436 (= lt!189569 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!368 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!189568 () array!25127)

(declare-fun bm!28611 () Bool)

(declare-fun lt!189566 () array!25129)

(declare-datatypes ((tuple2!6954 0))(
  ( (tuple2!6955 (_1!3488 (_ BitVec 64)) (_2!3488 V!15291)) )
))
(declare-datatypes ((List!6969 0))(
  ( (Nil!6966) (Cons!6965 (h!7821 tuple2!6954) (t!12134 List!6969)) )
))
(declare-datatypes ((ListLongMap!5857 0))(
  ( (ListLongMap!5858 (toList!2944 List!6969)) )
))
(declare-fun call!28615 () ListLongMap!5857)

(declare-fun getCurrentListMapNoExtraKeys!1157 (array!25127 array!25129 (_ BitVec 32) (_ BitVec 32) V!15291 V!15291 (_ BitVec 32) Int) ListLongMap!5857)

(assert (=> bm!28611 (= call!28615 (getCurrentListMapNoExtraKeys!1157 (ite c!54873 _keys!709 lt!189568) (ite c!54873 _values!549 lt!189566) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413437 () Bool)

(declare-fun res!240318 () Bool)

(assert (=> b!413437 (=> (not res!240318) (not e!247175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413437 (= res!240318 (validKeyInArray!0 k0!794))))

(declare-fun b!413438 () Bool)

(declare-fun res!240312 () Bool)

(assert (=> b!413438 (=> (not res!240312) (not e!247175))))

(declare-datatypes ((List!6970 0))(
  ( (Nil!6967) (Cons!6966 (h!7822 (_ BitVec 64)) (t!12135 List!6970)) )
))
(declare-fun arrayNoDuplicates!0 (array!25127 (_ BitVec 32) List!6970) Bool)

(assert (=> b!413438 (= res!240312 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6967))))

(declare-fun b!413439 () Bool)

(declare-fun res!240308 () Bool)

(declare-fun e!247181 () Bool)

(assert (=> b!413439 (=> (not res!240308) (not e!247181))))

(assert (=> b!413439 (= res!240308 (bvsle from!863 i!563))))

(declare-fun b!413440 () Bool)

(declare-fun res!240311 () Bool)

(assert (=> b!413440 (=> (not res!240311) (not e!247175))))

(assert (=> b!413440 (= res!240311 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12366 _keys!709))))))

(declare-fun b!413441 () Bool)

(declare-fun call!28614 () ListLongMap!5857)

(assert (=> b!413441 (= e!247180 (= call!28615 call!28614))))

(declare-fun mapNonEmpty!17580 () Bool)

(declare-fun mapRes!17580 () Bool)

(declare-fun tp!33990 () Bool)

(declare-fun e!247177 () Bool)

(assert (=> mapNonEmpty!17580 (= mapRes!17580 (and tp!33990 e!247177))))

(declare-fun mapRest!17580 () (Array (_ BitVec 32) ValueCell!4976))

(declare-fun mapValue!17580 () ValueCell!4976)

(declare-fun mapKey!17580 () (_ BitVec 32))

(assert (=> mapNonEmpty!17580 (= (arr!12014 _values!549) (store mapRest!17580 mapKey!17580 mapValue!17580))))

(declare-fun res!240314 () Bool)

(assert (=> start!39206 (=> (not res!240314) (not e!247175))))

(assert (=> start!39206 (= res!240314 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12366 _keys!709))))))

(assert (=> start!39206 e!247175))

(assert (=> start!39206 tp_is_empty!10639))

(assert (=> start!39206 tp!33989))

(assert (=> start!39206 true))

(declare-fun e!247179 () Bool)

(declare-fun array_inv!8814 (array!25129) Bool)

(assert (=> start!39206 (and (array_inv!8814 _values!549) e!247179)))

(declare-fun array_inv!8815 (array!25127) Bool)

(assert (=> start!39206 (array_inv!8815 _keys!709)))

(declare-fun b!413442 () Bool)

(assert (=> b!413442 (= e!247175 e!247181)))

(declare-fun res!240317 () Bool)

(assert (=> b!413442 (=> (not res!240317) (not e!247181))))

(assert (=> b!413442 (= res!240317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189568 mask!1025))))

(assert (=> b!413442 (= lt!189568 (array!25128 (store (arr!12013 _keys!709) i!563 k0!794) (size!12366 _keys!709)))))

(declare-fun b!413443 () Bool)

(assert (=> b!413443 (= e!247177 tp_is_empty!10639)))

(declare-fun b!413444 () Bool)

(assert (=> b!413444 (= e!247179 (and e!247182 mapRes!17580))))

(declare-fun condMapEmpty!17580 () Bool)

(declare-fun mapDefault!17580 () ValueCell!4976)

(assert (=> b!413444 (= condMapEmpty!17580 (= (arr!12014 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4976)) mapDefault!17580)))))

(declare-fun b!413445 () Bool)

(declare-fun res!240313 () Bool)

(assert (=> b!413445 (=> (not res!240313) (not e!247175))))

(assert (=> b!413445 (= res!240313 (and (= (size!12367 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12366 _keys!709) (size!12367 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413446 () Bool)

(declare-fun res!240315 () Bool)

(assert (=> b!413446 (=> (not res!240315) (not e!247175))))

(assert (=> b!413446 (= res!240315 (or (= (select (arr!12013 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12013 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413447 () Bool)

(assert (=> b!413447 (= e!247181 e!247176)))

(declare-fun res!240307 () Bool)

(assert (=> b!413447 (=> (not res!240307) (not e!247176))))

(assert (=> b!413447 (= res!240307 (= from!863 i!563))))

(declare-fun lt!189567 () ListLongMap!5857)

(assert (=> b!413447 (= lt!189567 (getCurrentListMapNoExtraKeys!1157 lt!189568 lt!189566 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413447 (= lt!189566 (array!25130 (store (arr!12014 _values!549) i!563 (ValueCellFull!4976 v!412)) (size!12367 _values!549)))))

(declare-fun lt!189565 () ListLongMap!5857)

(assert (=> b!413447 (= lt!189565 (getCurrentListMapNoExtraKeys!1157 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413448 () Bool)

(declare-fun +!1185 (ListLongMap!5857 tuple2!6954) ListLongMap!5857)

(assert (=> b!413448 (= e!247180 (= call!28614 (+!1185 call!28615 (tuple2!6955 k0!794 v!412))))))

(declare-fun bm!28612 () Bool)

(assert (=> bm!28612 (= call!28614 (getCurrentListMapNoExtraKeys!1157 (ite c!54873 lt!189568 _keys!709) (ite c!54873 lt!189566 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17580 () Bool)

(assert (=> mapIsEmpty!17580 mapRes!17580))

(declare-fun b!413449 () Bool)

(declare-fun res!240316 () Bool)

(assert (=> b!413449 (=> (not res!240316) (not e!247181))))

(assert (=> b!413449 (= res!240316 (arrayNoDuplicates!0 lt!189568 #b00000000000000000000000000000000 Nil!6967))))

(assert (= (and start!39206 res!240314) b!413434))

(assert (= (and b!413434 res!240309) b!413445))

(assert (= (and b!413445 res!240313) b!413432))

(assert (= (and b!413432 res!240310) b!413438))

(assert (= (and b!413438 res!240312) b!413440))

(assert (= (and b!413440 res!240311) b!413437))

(assert (= (and b!413437 res!240318) b!413446))

(assert (= (and b!413446 res!240315) b!413435))

(assert (= (and b!413435 res!240306) b!413442))

(assert (= (and b!413442 res!240317) b!413449))

(assert (= (and b!413449 res!240316) b!413439))

(assert (= (and b!413439 res!240308) b!413447))

(assert (= (and b!413447 res!240307) b!413436))

(assert (= (and b!413436 c!54873) b!413448))

(assert (= (and b!413436 (not c!54873)) b!413441))

(assert (= (or b!413448 b!413441) bm!28612))

(assert (= (or b!413448 b!413441) bm!28611))

(assert (= (and b!413444 condMapEmpty!17580) mapIsEmpty!17580))

(assert (= (and b!413444 (not condMapEmpty!17580)) mapNonEmpty!17580))

(get-info :version)

(assert (= (and mapNonEmpty!17580 ((_ is ValueCellFull!4976) mapValue!17580)) b!413443))

(assert (= (and b!413444 ((_ is ValueCellFull!4976) mapDefault!17580)) b!413433))

(assert (= start!39206 b!413444))

(declare-fun m!402399 () Bool)

(assert (=> mapNonEmpty!17580 m!402399))

(declare-fun m!402401 () Bool)

(assert (=> start!39206 m!402401))

(declare-fun m!402403 () Bool)

(assert (=> start!39206 m!402403))

(declare-fun m!402405 () Bool)

(assert (=> b!413449 m!402405))

(declare-fun m!402407 () Bool)

(assert (=> b!413447 m!402407))

(declare-fun m!402409 () Bool)

(assert (=> b!413447 m!402409))

(declare-fun m!402411 () Bool)

(assert (=> b!413447 m!402411))

(declare-fun m!402413 () Bool)

(assert (=> b!413442 m!402413))

(declare-fun m!402415 () Bool)

(assert (=> b!413442 m!402415))

(declare-fun m!402417 () Bool)

(assert (=> b!413435 m!402417))

(declare-fun m!402419 () Bool)

(assert (=> b!413436 m!402419))

(declare-fun m!402421 () Bool)

(assert (=> b!413437 m!402421))

(declare-fun m!402423 () Bool)

(assert (=> b!413446 m!402423))

(declare-fun m!402425 () Bool)

(assert (=> b!413438 m!402425))

(declare-fun m!402427 () Bool)

(assert (=> bm!28612 m!402427))

(declare-fun m!402429 () Bool)

(assert (=> b!413434 m!402429))

(declare-fun m!402431 () Bool)

(assert (=> b!413448 m!402431))

(declare-fun m!402433 () Bool)

(assert (=> b!413432 m!402433))

(declare-fun m!402435 () Bool)

(assert (=> bm!28611 m!402435))

(check-sat (not b!413447) (not mapNonEmpty!17580) (not b!413435) (not bm!28611) (not start!39206) (not b!413438) (not b!413442) (not b!413432) tp_is_empty!10639 (not b!413448) (not bm!28612) b_and!16847 (not b_next!9487) (not b!413437) (not b!413434) (not b!413449) (not b!413436))
(check-sat b_and!16847 (not b_next!9487))
