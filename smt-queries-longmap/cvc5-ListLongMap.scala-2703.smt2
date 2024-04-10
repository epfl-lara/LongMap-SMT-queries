; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40036 () Bool)

(assert start!40036)

(declare-fun b_free!10303 () Bool)

(declare-fun b_next!10303 () Bool)

(assert (=> start!40036 (= b_free!10303 (not b_next!10303))))

(declare-fun tp!36437 () Bool)

(declare-fun b_and!18265 () Bool)

(assert (=> start!40036 (= tp!36437 b_and!18265)))

(declare-fun b!436594 () Bool)

(declare-fun res!257391 () Bool)

(declare-fun e!257807 () Bool)

(assert (=> b!436594 (=> (not res!257391) (not e!257807))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436594 (= res!257391 (bvsle from!863 i!563))))

(declare-fun b!436595 () Bool)

(declare-fun res!257389 () Bool)

(declare-fun e!257811 () Bool)

(assert (=> b!436595 (=> (not res!257389) (not e!257811))))

(declare-datatypes ((array!26735 0))(
  ( (array!26736 (arr!12817 (Array (_ BitVec 32) (_ BitVec 64))) (size!13169 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26735)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16379 0))(
  ( (V!16380 (val!5772 Int)) )
))
(declare-datatypes ((ValueCell!5384 0))(
  ( (ValueCellFull!5384 (v!8019 V!16379)) (EmptyCell!5384) )
))
(declare-datatypes ((array!26737 0))(
  ( (array!26738 (arr!12818 (Array (_ BitVec 32) ValueCell!5384)) (size!13170 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26737)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!436595 (= res!257389 (and (= (size!13170 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13169 _keys!709) (size!13170 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436596 () Bool)

(declare-fun res!257388 () Bool)

(assert (=> b!436596 (=> (not res!257388) (not e!257811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26735 (_ BitVec 32)) Bool)

(assert (=> b!436596 (= res!257388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436597 () Bool)

(declare-fun e!257805 () Bool)

(declare-fun tp_is_empty!11455 () Bool)

(assert (=> b!436597 (= e!257805 tp_is_empty!11455)))

(declare-fun b!436598 () Bool)

(declare-datatypes ((Unit!12989 0))(
  ( (Unit!12990) )
))
(declare-fun e!257810 () Unit!12989)

(declare-fun Unit!12991 () Unit!12989)

(assert (=> b!436598 (= e!257810 Unit!12991)))

(declare-fun mapIsEmpty!18804 () Bool)

(declare-fun mapRes!18804 () Bool)

(assert (=> mapIsEmpty!18804 mapRes!18804))

(declare-fun b!436599 () Bool)

(declare-fun e!257804 () Bool)

(assert (=> b!436599 (= e!257804 true)))

(declare-datatypes ((tuple2!7650 0))(
  ( (tuple2!7651 (_1!3836 (_ BitVec 64)) (_2!3836 V!16379)) )
))
(declare-datatypes ((List!7648 0))(
  ( (Nil!7645) (Cons!7644 (h!8500 tuple2!7650) (t!13400 List!7648)) )
))
(declare-datatypes ((ListLongMap!6563 0))(
  ( (ListLongMap!6564 (toList!3297 List!7648)) )
))
(declare-fun lt!201334 () ListLongMap!6563)

(declare-fun lt!201333 () tuple2!7650)

(declare-fun lt!201331 () tuple2!7650)

(declare-fun lt!201328 () ListLongMap!6563)

(declare-fun +!1444 (ListLongMap!6563 tuple2!7650) ListLongMap!6563)

(assert (=> b!436599 (= lt!201328 (+!1444 (+!1444 lt!201334 lt!201333) lt!201331))))

(declare-fun lt!201322 () Unit!12989)

(declare-fun v!412 () V!16379)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!201324 () V!16379)

(declare-fun addCommutativeForDiffKeys!425 (ListLongMap!6563 (_ BitVec 64) V!16379 (_ BitVec 64) V!16379) Unit!12989)

(assert (=> b!436599 (= lt!201322 (addCommutativeForDiffKeys!425 lt!201334 k!794 v!412 (select (arr!12817 _keys!709) from!863) lt!201324))))

(declare-fun b!436600 () Bool)

(assert (=> b!436600 (= e!257811 e!257807)))

(declare-fun res!257399 () Bool)

(assert (=> b!436600 (=> (not res!257399) (not e!257807))))

(declare-fun lt!201332 () array!26735)

(assert (=> b!436600 (= res!257399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201332 mask!1025))))

(assert (=> b!436600 (= lt!201332 (array!26736 (store (arr!12817 _keys!709) i!563 k!794) (size!13169 _keys!709)))))

(declare-fun b!436601 () Bool)

(declare-fun res!257387 () Bool)

(assert (=> b!436601 (=> (not res!257387) (not e!257811))))

(declare-datatypes ((List!7649 0))(
  ( (Nil!7646) (Cons!7645 (h!8501 (_ BitVec 64)) (t!13401 List!7649)) )
))
(declare-fun arrayNoDuplicates!0 (array!26735 (_ BitVec 32) List!7649) Bool)

(assert (=> b!436601 (= res!257387 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7646))))

(declare-fun b!436602 () Bool)

(declare-fun res!257386 () Bool)

(assert (=> b!436602 (=> (not res!257386) (not e!257811))))

(assert (=> b!436602 (= res!257386 (or (= (select (arr!12817 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12817 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436603 () Bool)

(declare-fun res!257396 () Bool)

(assert (=> b!436603 (=> (not res!257396) (not e!257811))))

(assert (=> b!436603 (= res!257396 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13169 _keys!709))))))

(declare-fun b!436604 () Bool)

(declare-fun e!257809 () Bool)

(assert (=> b!436604 (= e!257807 e!257809)))

(declare-fun res!257390 () Bool)

(assert (=> b!436604 (=> (not res!257390) (not e!257809))))

(assert (=> b!436604 (= res!257390 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16379)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16379)

(declare-fun lt!201323 () ListLongMap!6563)

(declare-fun lt!201325 () array!26737)

(declare-fun getCurrentListMapNoExtraKeys!1486 (array!26735 array!26737 (_ BitVec 32) (_ BitVec 32) V!16379 V!16379 (_ BitVec 32) Int) ListLongMap!6563)

(assert (=> b!436604 (= lt!201323 (getCurrentListMapNoExtraKeys!1486 lt!201332 lt!201325 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436604 (= lt!201325 (array!26738 (store (arr!12818 _values!549) i!563 (ValueCellFull!5384 v!412)) (size!13170 _values!549)))))

(declare-fun lt!201329 () ListLongMap!6563)

(assert (=> b!436604 (= lt!201329 (getCurrentListMapNoExtraKeys!1486 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436605 () Bool)

(declare-fun e!257803 () Bool)

(declare-fun e!257802 () Bool)

(assert (=> b!436605 (= e!257803 (and e!257802 mapRes!18804))))

(declare-fun condMapEmpty!18804 () Bool)

(declare-fun mapDefault!18804 () ValueCell!5384)

