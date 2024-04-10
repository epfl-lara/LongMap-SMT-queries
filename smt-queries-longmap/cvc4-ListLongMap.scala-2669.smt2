; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39836 () Bool)

(assert start!39836)

(declare-fun b_free!10103 () Bool)

(declare-fun b_next!10103 () Bool)

(assert (=> start!39836 (= b_free!10103 (not b_next!10103))))

(declare-fun tp!35837 () Bool)

(declare-fun b_and!17865 () Bool)

(assert (=> start!39836 (= tp!35837 b_and!17865)))

(declare-fun b!430394 () Bool)

(declare-fun e!254804 () Bool)

(declare-fun e!254806 () Bool)

(assert (=> b!430394 (= e!254804 e!254806)))

(declare-fun res!252887 () Bool)

(assert (=> b!430394 (=> res!252887 e!254806)))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26345 0))(
  ( (array!26346 (arr!12622 (Array (_ BitVec 32) (_ BitVec 64))) (size!12974 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26345)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!430394 (= res!252887 (= k!794 (select (arr!12622 _keys!709) from!863)))))

(assert (=> b!430394 (not (= (select (arr!12622 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12666 0))(
  ( (Unit!12667) )
))
(declare-fun lt!196822 () Unit!12666)

(declare-fun e!254802 () Unit!12666)

(assert (=> b!430394 (= lt!196822 e!254802)))

(declare-fun c!55490 () Bool)

(assert (=> b!430394 (= c!55490 (= (select (arr!12622 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16111 0))(
  ( (V!16112 (val!5672 Int)) )
))
(declare-datatypes ((tuple2!7470 0))(
  ( (tuple2!7471 (_1!3746 (_ BitVec 64)) (_2!3746 V!16111)) )
))
(declare-datatypes ((List!7489 0))(
  ( (Nil!7486) (Cons!7485 (h!8341 tuple2!7470) (t!13041 List!7489)) )
))
(declare-datatypes ((ListLongMap!6383 0))(
  ( (ListLongMap!6384 (toList!3207 List!7489)) )
))
(declare-fun lt!196828 () ListLongMap!6383)

(declare-fun lt!196830 () ListLongMap!6383)

(assert (=> b!430394 (= lt!196828 lt!196830)))

(declare-fun lt!196823 () ListLongMap!6383)

(declare-fun lt!196824 () tuple2!7470)

(declare-fun +!1356 (ListLongMap!6383 tuple2!7470) ListLongMap!6383)

(assert (=> b!430394 (= lt!196830 (+!1356 lt!196823 lt!196824))))

(declare-fun lt!196833 () V!16111)

(assert (=> b!430394 (= lt!196824 (tuple2!7471 (select (arr!12622 _keys!709) from!863) lt!196833))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5284 0))(
  ( (ValueCellFull!5284 (v!7919 V!16111)) (EmptyCell!5284) )
))
(declare-datatypes ((array!26347 0))(
  ( (array!26348 (arr!12623 (Array (_ BitVec 32) ValueCell!5284)) (size!12975 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26347)

(declare-fun get!6263 (ValueCell!5284 V!16111) V!16111)

(declare-fun dynLambda!782 (Int (_ BitVec 64)) V!16111)

(assert (=> b!430394 (= lt!196833 (get!6263 (select (arr!12623 _values!549) from!863) (dynLambda!782 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430395 () Bool)

(declare-fun res!252898 () Bool)

(declare-fun e!254811 () Bool)

(assert (=> b!430395 (=> (not res!252898) (not e!254811))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430395 (= res!252898 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12974 _keys!709))))))

(declare-fun b!430396 () Bool)

(declare-fun res!252894 () Bool)

(declare-fun e!254809 () Bool)

(assert (=> b!430396 (=> (not res!252894) (not e!254809))))

(assert (=> b!430396 (= res!252894 (bvsle from!863 i!563))))

(declare-fun b!430397 () Bool)

(declare-fun res!252893 () Bool)

(assert (=> b!430397 (=> (not res!252893) (not e!254811))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!430397 (= res!252893 (and (= (size!12975 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12974 _keys!709) (size!12975 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430398 () Bool)

(declare-fun e!254805 () Bool)

(assert (=> b!430398 (= e!254809 e!254805)))

(declare-fun res!252899 () Bool)

(assert (=> b!430398 (=> (not res!252899) (not e!254805))))

(assert (=> b!430398 (= res!252899 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16111)

(declare-fun lt!196831 () array!26347)

(declare-fun zeroValue!515 () V!16111)

(declare-fun lt!196821 () array!26345)

(declare-fun getCurrentListMapNoExtraKeys!1409 (array!26345 array!26347 (_ BitVec 32) (_ BitVec 32) V!16111 V!16111 (_ BitVec 32) Int) ListLongMap!6383)

(assert (=> b!430398 (= lt!196828 (getCurrentListMapNoExtraKeys!1409 lt!196821 lt!196831 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16111)

(assert (=> b!430398 (= lt!196831 (array!26348 (store (arr!12623 _values!549) i!563 (ValueCellFull!5284 v!412)) (size!12975 _values!549)))))

(declare-fun lt!196826 () ListLongMap!6383)

(assert (=> b!430398 (= lt!196826 (getCurrentListMapNoExtraKeys!1409 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430399 () Bool)

(declare-fun res!252895 () Bool)

(assert (=> b!430399 (=> (not res!252895) (not e!254811))))

(declare-datatypes ((List!7490 0))(
  ( (Nil!7487) (Cons!7486 (h!8342 (_ BitVec 64)) (t!13042 List!7490)) )
))
(declare-fun arrayNoDuplicates!0 (array!26345 (_ BitVec 32) List!7490) Bool)

(assert (=> b!430399 (= res!252895 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7487))))

(declare-fun b!430400 () Bool)

(declare-fun Unit!12668 () Unit!12666)

(assert (=> b!430400 (= e!254802 Unit!12668)))

(declare-fun lt!196835 () Unit!12666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12666)

(assert (=> b!430400 (= lt!196835 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430400 false))

(declare-fun b!430401 () Bool)

(assert (=> b!430401 (= e!254805 (not e!254804))))

(declare-fun res!252900 () Bool)

(assert (=> b!430401 (=> res!252900 e!254804)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430401 (= res!252900 (not (validKeyInArray!0 (select (arr!12622 _keys!709) from!863))))))

(declare-fun lt!196829 () ListLongMap!6383)

(assert (=> b!430401 (= lt!196829 lt!196823)))

(declare-fun lt!196827 () ListLongMap!6383)

(declare-fun lt!196834 () tuple2!7470)

(assert (=> b!430401 (= lt!196823 (+!1356 lt!196827 lt!196834))))

(assert (=> b!430401 (= lt!196829 (getCurrentListMapNoExtraKeys!1409 lt!196821 lt!196831 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430401 (= lt!196834 (tuple2!7471 k!794 v!412))))

(assert (=> b!430401 (= lt!196827 (getCurrentListMapNoExtraKeys!1409 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196832 () Unit!12666)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!545 (array!26345 array!26347 (_ BitVec 32) (_ BitVec 32) V!16111 V!16111 (_ BitVec 32) (_ BitVec 64) V!16111 (_ BitVec 32) Int) Unit!12666)

(assert (=> b!430401 (= lt!196832 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!545 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430402 () Bool)

(declare-fun e!254803 () Bool)

(declare-fun tp_is_empty!11255 () Bool)

(assert (=> b!430402 (= e!254803 tp_is_empty!11255)))

(declare-fun b!430403 () Bool)

(declare-fun Unit!12669 () Unit!12666)

(assert (=> b!430403 (= e!254802 Unit!12669)))

(declare-fun b!430404 () Bool)

(assert (=> b!430404 (= e!254811 e!254809)))

(declare-fun res!252888 () Bool)

(assert (=> b!430404 (=> (not res!252888) (not e!254809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26345 (_ BitVec 32)) Bool)

(assert (=> b!430404 (= res!252888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196821 mask!1025))))

(assert (=> b!430404 (= lt!196821 (array!26346 (store (arr!12622 _keys!709) i!563 k!794) (size!12974 _keys!709)))))

(declare-fun b!430405 () Bool)

(declare-fun res!252891 () Bool)

(assert (=> b!430405 (=> (not res!252891) (not e!254811))))

(assert (=> b!430405 (= res!252891 (validKeyInArray!0 k!794))))

(declare-fun b!430406 () Bool)

(declare-fun e!254807 () Bool)

(assert (=> b!430406 (= e!254807 tp_is_empty!11255)))

(declare-fun b!430407 () Bool)

(assert (=> b!430407 (= e!254806 true)))

(assert (=> b!430407 (= lt!196830 (+!1356 (+!1356 lt!196827 lt!196824) lt!196834))))

(declare-fun lt!196825 () Unit!12666)

(declare-fun addCommutativeForDiffKeys!352 (ListLongMap!6383 (_ BitVec 64) V!16111 (_ BitVec 64) V!16111) Unit!12666)

(assert (=> b!430407 (= lt!196825 (addCommutativeForDiffKeys!352 lt!196827 k!794 v!412 (select (arr!12622 _keys!709) from!863) lt!196833))))

(declare-fun b!430408 () Bool)

(declare-fun res!252886 () Bool)

(assert (=> b!430408 (=> (not res!252886) (not e!254811))))

(assert (=> b!430408 (= res!252886 (or (= (select (arr!12622 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12622 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430410 () Bool)

(declare-fun res!252896 () Bool)

(assert (=> b!430410 (=> (not res!252896) (not e!254809))))

(assert (=> b!430410 (= res!252896 (arrayNoDuplicates!0 lt!196821 #b00000000000000000000000000000000 Nil!7487))))

(declare-fun mapNonEmpty!18504 () Bool)

(declare-fun mapRes!18504 () Bool)

(declare-fun tp!35838 () Bool)

(assert (=> mapNonEmpty!18504 (= mapRes!18504 (and tp!35838 e!254803))))

(declare-fun mapValue!18504 () ValueCell!5284)

(declare-fun mapKey!18504 () (_ BitVec 32))

(declare-fun mapRest!18504 () (Array (_ BitVec 32) ValueCell!5284))

(assert (=> mapNonEmpty!18504 (= (arr!12623 _values!549) (store mapRest!18504 mapKey!18504 mapValue!18504))))

(declare-fun b!430411 () Bool)

(declare-fun e!254808 () Bool)

(assert (=> b!430411 (= e!254808 (and e!254807 mapRes!18504))))

(declare-fun condMapEmpty!18504 () Bool)

(declare-fun mapDefault!18504 () ValueCell!5284)

