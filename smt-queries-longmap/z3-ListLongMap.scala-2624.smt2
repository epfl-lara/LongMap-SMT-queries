; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39548 () Bool)

(assert start!39548)

(declare-fun b_free!9829 () Bool)

(declare-fun b_next!9829 () Bool)

(assert (=> start!39548 (= b_free!9829 (not b_next!9829))))

(declare-fun tp!35015 () Bool)

(declare-fun b_and!17499 () Bool)

(assert (=> start!39548 (= tp!35015 b_and!17499)))

(declare-fun res!247448 () Bool)

(declare-fun e!251691 () Bool)

(assert (=> start!39548 (=> (not res!247448) (not e!251691))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25814 0))(
  ( (array!25815 (arr!12356 (Array (_ BitVec 32) (_ BitVec 64))) (size!12708 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25814)

(assert (=> start!39548 (= res!247448 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12708 _keys!709))))))

(assert (=> start!39548 e!251691))

(declare-fun tp_is_empty!10981 () Bool)

(assert (=> start!39548 tp_is_empty!10981))

(assert (=> start!39548 tp!35015))

(assert (=> start!39548 true))

(declare-datatypes ((V!15747 0))(
  ( (V!15748 (val!5535 Int)) )
))
(declare-datatypes ((ValueCell!5147 0))(
  ( (ValueCellFull!5147 (v!7783 V!15747)) (EmptyCell!5147) )
))
(declare-datatypes ((array!25816 0))(
  ( (array!25817 (arr!12357 (Array (_ BitVec 32) ValueCell!5147)) (size!12709 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25816)

(declare-fun e!251687 () Bool)

(declare-fun array_inv!9076 (array!25816) Bool)

(assert (=> start!39548 (and (array_inv!9076 _values!549) e!251687)))

(declare-fun array_inv!9077 (array!25814) Bool)

(assert (=> start!39548 (array_inv!9077 _keys!709)))

(declare-fun b!423350 () Bool)

(declare-fun res!247441 () Bool)

(assert (=> b!423350 (=> (not res!247441) (not e!251691))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423350 (= res!247441 (validKeyInArray!0 k0!794))))

(declare-fun b!423351 () Bool)

(declare-fun res!247447 () Bool)

(declare-fun e!251690 () Bool)

(assert (=> b!423351 (=> (not res!247447) (not e!251690))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423351 (= res!247447 (bvsle from!863 i!563))))

(declare-fun b!423352 () Bool)

(declare-fun res!247444 () Bool)

(assert (=> b!423352 (=> (not res!247444) (not e!251691))))

(declare-datatypes ((List!7156 0))(
  ( (Nil!7153) (Cons!7152 (h!8008 (_ BitVec 64)) (t!12592 List!7156)) )
))
(declare-fun arrayNoDuplicates!0 (array!25814 (_ BitVec 32) List!7156) Bool)

(assert (=> b!423352 (= res!247444 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7153))))

(declare-fun b!423353 () Bool)

(assert (=> b!423353 (= e!251691 e!251690)))

(declare-fun res!247442 () Bool)

(assert (=> b!423353 (=> (not res!247442) (not e!251690))))

(declare-fun lt!194180 () array!25814)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25814 (_ BitVec 32)) Bool)

(assert (=> b!423353 (= res!247442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194180 mask!1025))))

(assert (=> b!423353 (= lt!194180 (array!25815 (store (arr!12356 _keys!709) i!563 k0!794) (size!12708 _keys!709)))))

(declare-fun mapNonEmpty!18093 () Bool)

(declare-fun mapRes!18093 () Bool)

(declare-fun tp!35016 () Bool)

(declare-fun e!251692 () Bool)

(assert (=> mapNonEmpty!18093 (= mapRes!18093 (and tp!35016 e!251692))))

(declare-fun mapKey!18093 () (_ BitVec 32))

(declare-fun mapValue!18093 () ValueCell!5147)

(declare-fun mapRest!18093 () (Array (_ BitVec 32) ValueCell!5147))

(assert (=> mapNonEmpty!18093 (= (arr!12357 _values!549) (store mapRest!18093 mapKey!18093 mapValue!18093))))

(declare-fun b!423354 () Bool)

(declare-fun res!247452 () Bool)

(assert (=> b!423354 (=> (not res!247452) (not e!251690))))

(assert (=> b!423354 (= res!247452 (arrayNoDuplicates!0 lt!194180 #b00000000000000000000000000000000 Nil!7153))))

(declare-fun b!423355 () Bool)

(declare-fun res!247445 () Bool)

(assert (=> b!423355 (=> (not res!247445) (not e!251691))))

(declare-fun arrayContainsKey!0 (array!25814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423355 (= res!247445 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423356 () Bool)

(assert (=> b!423356 (= e!251690 false)))

(declare-fun minValue!515 () V!15747)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15747)

(declare-datatypes ((tuple2!7152 0))(
  ( (tuple2!7153 (_1!3587 (_ BitVec 64)) (_2!3587 V!15747)) )
))
(declare-datatypes ((List!7157 0))(
  ( (Nil!7154) (Cons!7153 (h!8009 tuple2!7152) (t!12593 List!7157)) )
))
(declare-datatypes ((ListLongMap!6067 0))(
  ( (ListLongMap!6068 (toList!3049 List!7157)) )
))
(declare-fun lt!194181 () ListLongMap!6067)

(declare-fun v!412 () V!15747)

(declare-fun getCurrentListMapNoExtraKeys!1295 (array!25814 array!25816 (_ BitVec 32) (_ BitVec 32) V!15747 V!15747 (_ BitVec 32) Int) ListLongMap!6067)

(assert (=> b!423356 (= lt!194181 (getCurrentListMapNoExtraKeys!1295 lt!194180 (array!25817 (store (arr!12357 _values!549) i!563 (ValueCellFull!5147 v!412)) (size!12709 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194179 () ListLongMap!6067)

(assert (=> b!423356 (= lt!194179 (getCurrentListMapNoExtraKeys!1295 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423357 () Bool)

(declare-fun res!247443 () Bool)

(assert (=> b!423357 (=> (not res!247443) (not e!251691))))

(assert (=> b!423357 (= res!247443 (and (= (size!12709 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12708 _keys!709) (size!12709 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423358 () Bool)

(declare-fun e!251689 () Bool)

(assert (=> b!423358 (= e!251687 (and e!251689 mapRes!18093))))

(declare-fun condMapEmpty!18093 () Bool)

(declare-fun mapDefault!18093 () ValueCell!5147)

(assert (=> b!423358 (= condMapEmpty!18093 (= (arr!12357 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5147)) mapDefault!18093)))))

(declare-fun mapIsEmpty!18093 () Bool)

(assert (=> mapIsEmpty!18093 mapRes!18093))

(declare-fun b!423359 () Bool)

(declare-fun res!247450 () Bool)

(assert (=> b!423359 (=> (not res!247450) (not e!251691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423359 (= res!247450 (validMask!0 mask!1025))))

(declare-fun b!423360 () Bool)

(assert (=> b!423360 (= e!251692 tp_is_empty!10981)))

(declare-fun b!423361 () Bool)

(declare-fun res!247449 () Bool)

(assert (=> b!423361 (=> (not res!247449) (not e!251691))))

(assert (=> b!423361 (= res!247449 (or (= (select (arr!12356 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12356 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423362 () Bool)

(declare-fun res!247446 () Bool)

(assert (=> b!423362 (=> (not res!247446) (not e!251691))))

(assert (=> b!423362 (= res!247446 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12708 _keys!709))))))

(declare-fun b!423363 () Bool)

(assert (=> b!423363 (= e!251689 tp_is_empty!10981)))

(declare-fun b!423364 () Bool)

(declare-fun res!247451 () Bool)

(assert (=> b!423364 (=> (not res!247451) (not e!251691))))

(assert (=> b!423364 (= res!247451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39548 res!247448) b!423359))

(assert (= (and b!423359 res!247450) b!423357))

(assert (= (and b!423357 res!247443) b!423364))

(assert (= (and b!423364 res!247451) b!423352))

(assert (= (and b!423352 res!247444) b!423362))

(assert (= (and b!423362 res!247446) b!423350))

(assert (= (and b!423350 res!247441) b!423361))

(assert (= (and b!423361 res!247449) b!423355))

(assert (= (and b!423355 res!247445) b!423353))

(assert (= (and b!423353 res!247442) b!423354))

(assert (= (and b!423354 res!247452) b!423351))

(assert (= (and b!423351 res!247447) b!423356))

(assert (= (and b!423358 condMapEmpty!18093) mapIsEmpty!18093))

(assert (= (and b!423358 (not condMapEmpty!18093)) mapNonEmpty!18093))

(get-info :version)

(assert (= (and mapNonEmpty!18093 ((_ is ValueCellFull!5147) mapValue!18093)) b!423360))

(assert (= (and b!423358 ((_ is ValueCellFull!5147) mapDefault!18093)) b!423363))

(assert (= start!39548 b!423358))

(declare-fun m!413111 () Bool)

(assert (=> b!423354 m!413111))

(declare-fun m!413113 () Bool)

(assert (=> b!423350 m!413113))

(declare-fun m!413115 () Bool)

(assert (=> mapNonEmpty!18093 m!413115))

(declare-fun m!413117 () Bool)

(assert (=> start!39548 m!413117))

(declare-fun m!413119 () Bool)

(assert (=> start!39548 m!413119))

(declare-fun m!413121 () Bool)

(assert (=> b!423355 m!413121))

(declare-fun m!413123 () Bool)

(assert (=> b!423359 m!413123))

(declare-fun m!413125 () Bool)

(assert (=> b!423364 m!413125))

(declare-fun m!413127 () Bool)

(assert (=> b!423352 m!413127))

(declare-fun m!413129 () Bool)

(assert (=> b!423356 m!413129))

(declare-fun m!413131 () Bool)

(assert (=> b!423356 m!413131))

(declare-fun m!413133 () Bool)

(assert (=> b!423356 m!413133))

(declare-fun m!413135 () Bool)

(assert (=> b!423353 m!413135))

(declare-fun m!413137 () Bool)

(assert (=> b!423353 m!413137))

(declare-fun m!413139 () Bool)

(assert (=> b!423361 m!413139))

(check-sat (not b!423353) (not b!423359) (not mapNonEmpty!18093) (not b!423350) (not start!39548) (not b!423355) tp_is_empty!10981 (not b_next!9829) (not b!423354) (not b!423364) (not b!423356) b_and!17499 (not b!423352))
(check-sat b_and!17499 (not b_next!9829))
