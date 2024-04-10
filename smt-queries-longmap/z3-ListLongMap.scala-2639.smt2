; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39654 () Bool)

(assert start!39654)

(declare-fun b_free!9921 () Bool)

(declare-fun b_next!9921 () Bool)

(assert (=> start!39654 (= b_free!9921 (not b_next!9921))))

(declare-fun tp!35292 () Bool)

(declare-fun b_and!17577 () Bool)

(assert (=> start!39654 (= tp!35292 b_and!17577)))

(declare-fun b!425520 () Bool)

(declare-fun res!249151 () Bool)

(declare-fun e!252603 () Bool)

(assert (=> b!425520 (=> (not res!249151) (not e!252603))))

(declare-datatypes ((array!25985 0))(
  ( (array!25986 (arr!12442 (Array (_ BitVec 32) (_ BitVec 64))) (size!12794 (_ BitVec 32))) )
))
(declare-fun lt!194676 () array!25985)

(declare-datatypes ((List!7340 0))(
  ( (Nil!7337) (Cons!7336 (h!8192 (_ BitVec 64)) (t!12784 List!7340)) )
))
(declare-fun arrayNoDuplicates!0 (array!25985 (_ BitVec 32) List!7340) Bool)

(assert (=> b!425520 (= res!249151 (arrayNoDuplicates!0 lt!194676 #b00000000000000000000000000000000 Nil!7337))))

(declare-fun mapNonEmpty!18231 () Bool)

(declare-fun mapRes!18231 () Bool)

(declare-fun tp!35291 () Bool)

(declare-fun e!252598 () Bool)

(assert (=> mapNonEmpty!18231 (= mapRes!18231 (and tp!35291 e!252598))))

(declare-datatypes ((V!15869 0))(
  ( (V!15870 (val!5581 Int)) )
))
(declare-datatypes ((ValueCell!5193 0))(
  ( (ValueCellFull!5193 (v!7828 V!15869)) (EmptyCell!5193) )
))
(declare-datatypes ((array!25987 0))(
  ( (array!25988 (arr!12443 (Array (_ BitVec 32) ValueCell!5193)) (size!12795 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25987)

(declare-fun mapKey!18231 () (_ BitVec 32))

(declare-fun mapRest!18231 () (Array (_ BitVec 32) ValueCell!5193))

(declare-fun mapValue!18231 () ValueCell!5193)

(assert (=> mapNonEmpty!18231 (= (arr!12443 _values!549) (store mapRest!18231 mapKey!18231 mapValue!18231))))

(declare-fun b!425521 () Bool)

(declare-fun res!249155 () Bool)

(declare-fun e!252599 () Bool)

(assert (=> b!425521 (=> (not res!249155) (not e!252599))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425521 (= res!249155 (validKeyInArray!0 k0!794))))

(declare-fun b!425522 () Bool)

(declare-fun res!249154 () Bool)

(assert (=> b!425522 (=> (not res!249154) (not e!252599))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!25985)

(assert (=> b!425522 (= res!249154 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12794 _keys!709))))))

(declare-fun b!425523 () Bool)

(assert (=> b!425523 (= e!252599 e!252603)))

(declare-fun res!249161 () Bool)

(assert (=> b!425523 (=> (not res!249161) (not e!252603))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25985 (_ BitVec 32)) Bool)

(assert (=> b!425523 (= res!249161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194676 mask!1025))))

(assert (=> b!425523 (= lt!194676 (array!25986 (store (arr!12442 _keys!709) i!563 k0!794) (size!12794 _keys!709)))))

(declare-fun b!425524 () Bool)

(declare-fun e!252600 () Bool)

(assert (=> b!425524 (= e!252603 e!252600)))

(declare-fun res!249153 () Bool)

(assert (=> b!425524 (=> (not res!249153) (not e!252600))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425524 (= res!249153 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15869)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15869)

(declare-datatypes ((tuple2!7328 0))(
  ( (tuple2!7329 (_1!3675 (_ BitVec 64)) (_2!3675 V!15869)) )
))
(declare-datatypes ((List!7341 0))(
  ( (Nil!7338) (Cons!7337 (h!8193 tuple2!7328) (t!12785 List!7341)) )
))
(declare-datatypes ((ListLongMap!6241 0))(
  ( (ListLongMap!6242 (toList!3136 List!7341)) )
))
(declare-fun lt!194677 () ListLongMap!6241)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194675 () array!25987)

(declare-fun getCurrentListMapNoExtraKeys!1340 (array!25985 array!25987 (_ BitVec 32) (_ BitVec 32) V!15869 V!15869 (_ BitVec 32) Int) ListLongMap!6241)

(assert (=> b!425524 (= lt!194677 (getCurrentListMapNoExtraKeys!1340 lt!194676 lt!194675 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15869)

(assert (=> b!425524 (= lt!194675 (array!25988 (store (arr!12443 _values!549) i!563 (ValueCellFull!5193 v!412)) (size!12795 _values!549)))))

(declare-fun lt!194678 () ListLongMap!6241)

(assert (=> b!425524 (= lt!194678 (getCurrentListMapNoExtraKeys!1340 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425519 () Bool)

(declare-fun res!249158 () Bool)

(assert (=> b!425519 (=> (not res!249158) (not e!252599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425519 (= res!249158 (validMask!0 mask!1025))))

(declare-fun res!249157 () Bool)

(assert (=> start!39654 (=> (not res!249157) (not e!252599))))

(assert (=> start!39654 (= res!249157 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12794 _keys!709))))))

(assert (=> start!39654 e!252599))

(declare-fun tp_is_empty!11073 () Bool)

(assert (=> start!39654 tp_is_empty!11073))

(assert (=> start!39654 tp!35292))

(assert (=> start!39654 true))

(declare-fun e!252601 () Bool)

(declare-fun array_inv!9066 (array!25987) Bool)

(assert (=> start!39654 (and (array_inv!9066 _values!549) e!252601)))

(declare-fun array_inv!9067 (array!25985) Bool)

(assert (=> start!39654 (array_inv!9067 _keys!709)))

(declare-fun mapIsEmpty!18231 () Bool)

(assert (=> mapIsEmpty!18231 mapRes!18231))

(declare-fun b!425525 () Bool)

(assert (=> b!425525 (= e!252598 tp_is_empty!11073)))

(declare-fun b!425526 () Bool)

(declare-fun res!249159 () Bool)

(assert (=> b!425526 (=> (not res!249159) (not e!252603))))

(assert (=> b!425526 (= res!249159 (bvsle from!863 i!563))))

(declare-fun b!425527 () Bool)

(declare-fun res!249156 () Bool)

(assert (=> b!425527 (=> (not res!249156) (not e!252599))))

(assert (=> b!425527 (= res!249156 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7337))))

(declare-fun b!425528 () Bool)

(declare-fun res!249152 () Bool)

(assert (=> b!425528 (=> (not res!249152) (not e!252599))))

(declare-fun arrayContainsKey!0 (array!25985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425528 (= res!249152 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425529 () Bool)

(declare-fun res!249160 () Bool)

(assert (=> b!425529 (=> (not res!249160) (not e!252599))))

(assert (=> b!425529 (= res!249160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425530 () Bool)

(declare-fun e!252602 () Bool)

(assert (=> b!425530 (= e!252602 tp_is_empty!11073)))

(declare-fun b!425531 () Bool)

(declare-fun res!249162 () Bool)

(assert (=> b!425531 (=> (not res!249162) (not e!252599))))

(assert (=> b!425531 (= res!249162 (and (= (size!12795 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12794 _keys!709) (size!12795 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425532 () Bool)

(assert (=> b!425532 (= e!252600 (not true))))

(declare-fun +!1294 (ListLongMap!6241 tuple2!7328) ListLongMap!6241)

(assert (=> b!425532 (= (getCurrentListMapNoExtraKeys!1340 lt!194676 lt!194675 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1294 (getCurrentListMapNoExtraKeys!1340 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7329 k0!794 v!412)))))

(declare-datatypes ((Unit!12490 0))(
  ( (Unit!12491) )
))
(declare-fun lt!194674 () Unit!12490)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!489 (array!25985 array!25987 (_ BitVec 32) (_ BitVec 32) V!15869 V!15869 (_ BitVec 32) (_ BitVec 64) V!15869 (_ BitVec 32) Int) Unit!12490)

(assert (=> b!425532 (= lt!194674 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425533 () Bool)

(assert (=> b!425533 (= e!252601 (and e!252602 mapRes!18231))))

(declare-fun condMapEmpty!18231 () Bool)

(declare-fun mapDefault!18231 () ValueCell!5193)

(assert (=> b!425533 (= condMapEmpty!18231 (= (arr!12443 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5193)) mapDefault!18231)))))

(declare-fun b!425534 () Bool)

(declare-fun res!249150 () Bool)

(assert (=> b!425534 (=> (not res!249150) (not e!252599))))

(assert (=> b!425534 (= res!249150 (or (= (select (arr!12442 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12442 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39654 res!249157) b!425519))

(assert (= (and b!425519 res!249158) b!425531))

(assert (= (and b!425531 res!249162) b!425529))

(assert (= (and b!425529 res!249160) b!425527))

(assert (= (and b!425527 res!249156) b!425522))

(assert (= (and b!425522 res!249154) b!425521))

(assert (= (and b!425521 res!249155) b!425534))

(assert (= (and b!425534 res!249150) b!425528))

(assert (= (and b!425528 res!249152) b!425523))

(assert (= (and b!425523 res!249161) b!425520))

(assert (= (and b!425520 res!249151) b!425526))

(assert (= (and b!425526 res!249159) b!425524))

(assert (= (and b!425524 res!249153) b!425532))

(assert (= (and b!425533 condMapEmpty!18231) mapIsEmpty!18231))

(assert (= (and b!425533 (not condMapEmpty!18231)) mapNonEmpty!18231))

(get-info :version)

(assert (= (and mapNonEmpty!18231 ((_ is ValueCellFull!5193) mapValue!18231)) b!425525))

(assert (= (and b!425533 ((_ is ValueCellFull!5193) mapDefault!18231)) b!425530))

(assert (= start!39654 b!425533))

(declare-fun m!414401 () Bool)

(assert (=> b!425529 m!414401))

(declare-fun m!414403 () Bool)

(assert (=> b!425521 m!414403))

(declare-fun m!414405 () Bool)

(assert (=> b!425524 m!414405))

(declare-fun m!414407 () Bool)

(assert (=> b!425524 m!414407))

(declare-fun m!414409 () Bool)

(assert (=> b!425524 m!414409))

(declare-fun m!414411 () Bool)

(assert (=> b!425527 m!414411))

(declare-fun m!414413 () Bool)

(assert (=> mapNonEmpty!18231 m!414413))

(declare-fun m!414415 () Bool)

(assert (=> b!425532 m!414415))

(declare-fun m!414417 () Bool)

(assert (=> b!425532 m!414417))

(assert (=> b!425532 m!414417))

(declare-fun m!414419 () Bool)

(assert (=> b!425532 m!414419))

(declare-fun m!414421 () Bool)

(assert (=> b!425532 m!414421))

(declare-fun m!414423 () Bool)

(assert (=> start!39654 m!414423))

(declare-fun m!414425 () Bool)

(assert (=> start!39654 m!414425))

(declare-fun m!414427 () Bool)

(assert (=> b!425528 m!414427))

(declare-fun m!414429 () Bool)

(assert (=> b!425520 m!414429))

(declare-fun m!414431 () Bool)

(assert (=> b!425519 m!414431))

(declare-fun m!414433 () Bool)

(assert (=> b!425534 m!414433))

(declare-fun m!414435 () Bool)

(assert (=> b!425523 m!414435))

(declare-fun m!414437 () Bool)

(assert (=> b!425523 m!414437))

(check-sat tp_is_empty!11073 (not b!425519) (not b_next!9921) (not b!425524) (not b!425527) (not b!425520) (not b!425523) b_and!17577 (not b!425528) (not start!39654) (not b!425529) (not mapNonEmpty!18231) (not b!425521) (not b!425532))
(check-sat b_and!17577 (not b_next!9921))
