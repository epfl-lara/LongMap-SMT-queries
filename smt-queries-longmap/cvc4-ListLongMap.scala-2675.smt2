; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39872 () Bool)

(assert start!39872)

(declare-fun b_free!10139 () Bool)

(declare-fun b_next!10139 () Bool)

(assert (=> start!39872 (= b_free!10139 (not b_next!10139))))

(declare-fun tp!35946 () Bool)

(declare-fun b_and!17937 () Bool)

(assert (=> start!39872 (= tp!35946 b_and!17937)))

(declare-fun b!431510 () Bool)

(declare-fun e!255351 () Bool)

(declare-fun e!255344 () Bool)

(assert (=> b!431510 (= e!255351 (not e!255344))))

(declare-fun res!253708 () Bool)

(assert (=> b!431510 (=> res!253708 e!255344)))

(declare-datatypes ((array!26417 0))(
  ( (array!26418 (arr!12658 (Array (_ BitVec 32) (_ BitVec 64))) (size!13010 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26417)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431510 (= res!253708 (not (validKeyInArray!0 (select (arr!12658 _keys!709) from!863))))))

(declare-datatypes ((V!16159 0))(
  ( (V!16160 (val!5690 Int)) )
))
(declare-datatypes ((tuple2!7504 0))(
  ( (tuple2!7505 (_1!3763 (_ BitVec 64)) (_2!3763 V!16159)) )
))
(declare-datatypes ((List!7519 0))(
  ( (Nil!7516) (Cons!7515 (h!8371 tuple2!7504) (t!13107 List!7519)) )
))
(declare-datatypes ((ListLongMap!6417 0))(
  ( (ListLongMap!6418 (toList!3224 List!7519)) )
))
(declare-fun lt!197633 () ListLongMap!6417)

(declare-fun lt!197635 () ListLongMap!6417)

(assert (=> b!431510 (= lt!197633 lt!197635)))

(declare-fun lt!197644 () ListLongMap!6417)

(declare-fun lt!197643 () tuple2!7504)

(declare-fun +!1372 (ListLongMap!6417 tuple2!7504) ListLongMap!6417)

(assert (=> b!431510 (= lt!197635 (+!1372 lt!197644 lt!197643))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!197638 () array!26417)

(declare-fun zeroValue!515 () V!16159)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5302 0))(
  ( (ValueCellFull!5302 (v!7937 V!16159)) (EmptyCell!5302) )
))
(declare-datatypes ((array!26419 0))(
  ( (array!26420 (arr!12659 (Array (_ BitVec 32) ValueCell!5302)) (size!13011 (_ BitVec 32))) )
))
(declare-fun lt!197637 () array!26419)

(declare-fun minValue!515 () V!16159)

(declare-fun getCurrentListMapNoExtraKeys!1422 (array!26417 array!26419 (_ BitVec 32) (_ BitVec 32) V!16159 V!16159 (_ BitVec 32) Int) ListLongMap!6417)

(assert (=> b!431510 (= lt!197633 (getCurrentListMapNoExtraKeys!1422 lt!197638 lt!197637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16159)

(assert (=> b!431510 (= lt!197643 (tuple2!7505 k!794 v!412))))

(declare-fun _values!549 () array!26419)

(assert (=> b!431510 (= lt!197644 (getCurrentListMapNoExtraKeys!1422 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12721 0))(
  ( (Unit!12722) )
))
(declare-fun lt!197631 () Unit!12721)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!557 (array!26417 array!26419 (_ BitVec 32) (_ BitVec 32) V!16159 V!16159 (_ BitVec 32) (_ BitVec 64) V!16159 (_ BitVec 32) Int) Unit!12721)

(assert (=> b!431510 (= lt!197631 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!557 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431511 () Bool)

(declare-fun res!253702 () Bool)

(declare-fun e!255343 () Bool)

(assert (=> b!431511 (=> (not res!253702) (not e!255343))))

(declare-fun arrayContainsKey!0 (array!26417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431511 (= res!253702 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!431512 () Bool)

(declare-fun e!255350 () Bool)

(declare-fun tp_is_empty!11291 () Bool)

(assert (=> b!431512 (= e!255350 tp_is_empty!11291)))

(declare-fun b!431513 () Bool)

(declare-fun e!255346 () Bool)

(assert (=> b!431513 (= e!255344 e!255346)))

(declare-fun res!253704 () Bool)

(assert (=> b!431513 (=> res!253704 e!255346)))

(assert (=> b!431513 (= res!253704 (= k!794 (select (arr!12658 _keys!709) from!863)))))

(assert (=> b!431513 (not (= (select (arr!12658 _keys!709) from!863) k!794))))

(declare-fun lt!197639 () Unit!12721)

(declare-fun e!255349 () Unit!12721)

(assert (=> b!431513 (= lt!197639 e!255349)))

(declare-fun c!55544 () Bool)

(assert (=> b!431513 (= c!55544 (= (select (arr!12658 _keys!709) from!863) k!794))))

(declare-fun lt!197634 () ListLongMap!6417)

(declare-fun lt!197645 () ListLongMap!6417)

(assert (=> b!431513 (= lt!197634 lt!197645)))

(declare-fun lt!197636 () tuple2!7504)

(assert (=> b!431513 (= lt!197645 (+!1372 lt!197635 lt!197636))))

(declare-fun lt!197640 () V!16159)

(assert (=> b!431513 (= lt!197636 (tuple2!7505 (select (arr!12658 _keys!709) from!863) lt!197640))))

(declare-fun get!6286 (ValueCell!5302 V!16159) V!16159)

(declare-fun dynLambda!793 (Int (_ BitVec 64)) V!16159)

(assert (=> b!431513 (= lt!197640 (get!6286 (select (arr!12659 _values!549) from!863) (dynLambda!793 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431514 () Bool)

(declare-fun e!255347 () Bool)

(assert (=> b!431514 (= e!255347 e!255351)))

(declare-fun res!253709 () Bool)

(assert (=> b!431514 (=> (not res!253709) (not e!255351))))

(assert (=> b!431514 (= res!253709 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!431514 (= lt!197634 (getCurrentListMapNoExtraKeys!1422 lt!197638 lt!197637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431514 (= lt!197637 (array!26420 (store (arr!12659 _values!549) i!563 (ValueCellFull!5302 v!412)) (size!13011 _values!549)))))

(declare-fun lt!197641 () ListLongMap!6417)

(assert (=> b!431514 (= lt!197641 (getCurrentListMapNoExtraKeys!1422 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18558 () Bool)

(declare-fun mapRes!18558 () Bool)

(declare-fun tp!35945 () Bool)

(declare-fun e!255342 () Bool)

(assert (=> mapNonEmpty!18558 (= mapRes!18558 (and tp!35945 e!255342))))

(declare-fun mapValue!18558 () ValueCell!5302)

(declare-fun mapRest!18558 () (Array (_ BitVec 32) ValueCell!5302))

(declare-fun mapKey!18558 () (_ BitVec 32))

(assert (=> mapNonEmpty!18558 (= (arr!12659 _values!549) (store mapRest!18558 mapKey!18558 mapValue!18558))))

(declare-fun mapIsEmpty!18558 () Bool)

(assert (=> mapIsEmpty!18558 mapRes!18558))

(declare-fun b!431515 () Bool)

(declare-fun res!253710 () Bool)

(assert (=> b!431515 (=> (not res!253710) (not e!255343))))

(assert (=> b!431515 (= res!253710 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13010 _keys!709))))))

(declare-fun b!431516 () Bool)

(assert (=> b!431516 (= e!255343 e!255347)))

(declare-fun res!253699 () Bool)

(assert (=> b!431516 (=> (not res!253699) (not e!255347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26417 (_ BitVec 32)) Bool)

(assert (=> b!431516 (= res!253699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197638 mask!1025))))

(assert (=> b!431516 (= lt!197638 (array!26418 (store (arr!12658 _keys!709) i!563 k!794) (size!13010 _keys!709)))))

(declare-fun b!431517 () Bool)

(assert (=> b!431517 (= e!255342 tp_is_empty!11291)))

(declare-fun res!253700 () Bool)

(assert (=> start!39872 (=> (not res!253700) (not e!255343))))

(assert (=> start!39872 (= res!253700 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13010 _keys!709))))))

(assert (=> start!39872 e!255343))

(assert (=> start!39872 tp_is_empty!11291))

(assert (=> start!39872 tp!35946))

(assert (=> start!39872 true))

(declare-fun e!255348 () Bool)

(declare-fun array_inv!9212 (array!26419) Bool)

(assert (=> start!39872 (and (array_inv!9212 _values!549) e!255348)))

(declare-fun array_inv!9213 (array!26417) Bool)

(assert (=> start!39872 (array_inv!9213 _keys!709)))

(declare-fun b!431518 () Bool)

(declare-fun res!253701 () Bool)

(assert (=> b!431518 (=> (not res!253701) (not e!255343))))

(assert (=> b!431518 (= res!253701 (and (= (size!13011 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13010 _keys!709) (size!13011 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431519 () Bool)

(declare-fun Unit!12723 () Unit!12721)

(assert (=> b!431519 (= e!255349 Unit!12723)))

(declare-fun lt!197632 () Unit!12721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26417 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12721)

(assert (=> b!431519 (= lt!197632 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431519 false))

(declare-fun b!431520 () Bool)

(declare-fun res!253697 () Bool)

(assert (=> b!431520 (=> (not res!253697) (not e!255343))))

(assert (=> b!431520 (= res!253697 (validKeyInArray!0 k!794))))

(declare-fun b!431521 () Bool)

(assert (=> b!431521 (= e!255348 (and e!255350 mapRes!18558))))

(declare-fun condMapEmpty!18558 () Bool)

(declare-fun mapDefault!18558 () ValueCell!5302)

