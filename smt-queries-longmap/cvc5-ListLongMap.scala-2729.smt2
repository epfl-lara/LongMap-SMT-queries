; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40192 () Bool)

(assert start!40192)

(declare-fun b_free!10459 () Bool)

(declare-fun b_next!10459 () Bool)

(assert (=> start!40192 (= b_free!10459 (not b_next!10459))))

(declare-fun tp!36906 () Bool)

(declare-fun b_and!18427 () Bool)

(assert (=> start!40192 (= tp!36906 b_and!18427)))

(declare-fun b!440372 () Bool)

(declare-fun res!260445 () Bool)

(declare-fun e!259463 () Bool)

(assert (=> b!440372 (=> (not res!260445) (not e!259463))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440372 (= res!260445 (bvsle from!863 i!563))))

(declare-fun b!440373 () Bool)

(declare-fun res!260451 () Bool)

(declare-fun e!259466 () Bool)

(assert (=> b!440373 (=> (not res!260451) (not e!259466))))

(declare-datatypes ((array!27035 0))(
  ( (array!27036 (arr!12967 (Array (_ BitVec 32) (_ BitVec 64))) (size!13319 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27035)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27035 (_ BitVec 32)) Bool)

(assert (=> b!440373 (= res!260451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440374 () Bool)

(declare-fun res!260449 () Bool)

(assert (=> b!440374 (=> (not res!260449) (not e!259463))))

(declare-fun lt!202565 () array!27035)

(declare-datatypes ((List!7771 0))(
  ( (Nil!7768) (Cons!7767 (h!8623 (_ BitVec 64)) (t!13527 List!7771)) )
))
(declare-fun arrayNoDuplicates!0 (array!27035 (_ BitVec 32) List!7771) Bool)

(assert (=> b!440374 (= res!260449 (arrayNoDuplicates!0 lt!202565 #b00000000000000000000000000000000 Nil!7768))))

(declare-fun res!260446 () Bool)

(assert (=> start!40192 (=> (not res!260446) (not e!259466))))

(assert (=> start!40192 (= res!260446 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13319 _keys!709))))))

(assert (=> start!40192 e!259466))

(declare-fun tp_is_empty!11611 () Bool)

(assert (=> start!40192 tp_is_empty!11611))

(assert (=> start!40192 tp!36906))

(assert (=> start!40192 true))

(declare-datatypes ((V!16587 0))(
  ( (V!16588 (val!5850 Int)) )
))
(declare-datatypes ((ValueCell!5462 0))(
  ( (ValueCellFull!5462 (v!8097 V!16587)) (EmptyCell!5462) )
))
(declare-datatypes ((array!27037 0))(
  ( (array!27038 (arr!12968 (Array (_ BitVec 32) ValueCell!5462)) (size!13320 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27037)

(declare-fun e!259467 () Bool)

(declare-fun array_inv!9412 (array!27037) Bool)

(assert (=> start!40192 (and (array_inv!9412 _values!549) e!259467)))

(declare-fun array_inv!9413 (array!27035) Bool)

(assert (=> start!40192 (array_inv!9413 _keys!709)))

(declare-fun b!440375 () Bool)

(assert (=> b!440375 (= e!259466 e!259463)))

(declare-fun res!260442 () Bool)

(assert (=> b!440375 (=> (not res!260442) (not e!259463))))

(assert (=> b!440375 (= res!260442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202565 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!440375 (= lt!202565 (array!27036 (store (arr!12967 _keys!709) i!563 k!794) (size!13319 _keys!709)))))

(declare-fun b!440376 () Bool)

(declare-fun e!259462 () Bool)

(assert (=> b!440376 (= e!259463 e!259462)))

(declare-fun res!260448 () Bool)

(assert (=> b!440376 (=> (not res!260448) (not e!259462))))

(assert (=> b!440376 (= res!260448 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16587)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7774 0))(
  ( (tuple2!7775 (_1!3898 (_ BitVec 64)) (_2!3898 V!16587)) )
))
(declare-datatypes ((List!7772 0))(
  ( (Nil!7769) (Cons!7768 (h!8624 tuple2!7774) (t!13528 List!7772)) )
))
(declare-datatypes ((ListLongMap!6687 0))(
  ( (ListLongMap!6688 (toList!3359 List!7772)) )
))
(declare-fun lt!202564 () ListLongMap!6687)

(declare-fun lt!202563 () array!27037)

(declare-fun zeroValue!515 () V!16587)

(declare-fun getCurrentListMapNoExtraKeys!1548 (array!27035 array!27037 (_ BitVec 32) (_ BitVec 32) V!16587 V!16587 (_ BitVec 32) Int) ListLongMap!6687)

(assert (=> b!440376 (= lt!202564 (getCurrentListMapNoExtraKeys!1548 lt!202565 lt!202563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16587)

(assert (=> b!440376 (= lt!202563 (array!27038 (store (arr!12968 _values!549) i!563 (ValueCellFull!5462 v!412)) (size!13320 _values!549)))))

(declare-fun lt!202561 () ListLongMap!6687)

(assert (=> b!440376 (= lt!202561 (getCurrentListMapNoExtraKeys!1548 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440377 () Bool)

(declare-fun e!259461 () Bool)

(assert (=> b!440377 (= e!259461 tp_is_empty!11611)))

(declare-fun mapIsEmpty!19038 () Bool)

(declare-fun mapRes!19038 () Bool)

(assert (=> mapIsEmpty!19038 mapRes!19038))

(declare-fun b!440378 () Bool)

(declare-fun res!260443 () Bool)

(assert (=> b!440378 (=> (not res!260443) (not e!259466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440378 (= res!260443 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19038 () Bool)

(declare-fun tp!36905 () Bool)

(assert (=> mapNonEmpty!19038 (= mapRes!19038 (and tp!36905 e!259461))))

(declare-fun mapRest!19038 () (Array (_ BitVec 32) ValueCell!5462))

(declare-fun mapKey!19038 () (_ BitVec 32))

(declare-fun mapValue!19038 () ValueCell!5462)

(assert (=> mapNonEmpty!19038 (= (arr!12968 _values!549) (store mapRest!19038 mapKey!19038 mapValue!19038))))

(declare-fun b!440379 () Bool)

(declare-fun e!259464 () Bool)

(assert (=> b!440379 (= e!259464 tp_is_empty!11611)))

(declare-fun b!440380 () Bool)

(declare-fun res!260453 () Bool)

(assert (=> b!440380 (=> (not res!260453) (not e!259466))))

(assert (=> b!440380 (= res!260453 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13319 _keys!709))))))

(declare-fun b!440381 () Bool)

(declare-fun res!260452 () Bool)

(assert (=> b!440381 (=> (not res!260452) (not e!259466))))

(assert (=> b!440381 (= res!260452 (and (= (size!13320 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13319 _keys!709) (size!13320 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440382 () Bool)

(assert (=> b!440382 (= e!259462 (not true))))

(declare-fun +!1497 (ListLongMap!6687 tuple2!7774) ListLongMap!6687)

(assert (=> b!440382 (= (getCurrentListMapNoExtraKeys!1548 lt!202565 lt!202563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1497 (getCurrentListMapNoExtraKeys!1548 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7775 k!794 v!412)))))

(declare-datatypes ((Unit!13098 0))(
  ( (Unit!13099) )
))
(declare-fun lt!202562 () Unit!13098)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!666 (array!27035 array!27037 (_ BitVec 32) (_ BitVec 32) V!16587 V!16587 (_ BitVec 32) (_ BitVec 64) V!16587 (_ BitVec 32) Int) Unit!13098)

(assert (=> b!440382 (= lt!202562 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!666 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440383 () Bool)

(declare-fun res!260450 () Bool)

(assert (=> b!440383 (=> (not res!260450) (not e!259466))))

(declare-fun arrayContainsKey!0 (array!27035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440383 (= res!260450 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!440384 () Bool)

(declare-fun res!260444 () Bool)

(assert (=> b!440384 (=> (not res!260444) (not e!259466))))

(assert (=> b!440384 (= res!260444 (or (= (select (arr!12967 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12967 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440385 () Bool)

(assert (=> b!440385 (= e!259467 (and e!259464 mapRes!19038))))

(declare-fun condMapEmpty!19038 () Bool)

(declare-fun mapDefault!19038 () ValueCell!5462)

