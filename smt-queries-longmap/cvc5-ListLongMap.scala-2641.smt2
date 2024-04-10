; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39664 () Bool)

(assert start!39664)

(declare-fun b_free!9931 () Bool)

(declare-fun b_next!9931 () Bool)

(assert (=> start!39664 (= b_free!9931 (not b_next!9931))))

(declare-fun tp!35321 () Bool)

(declare-fun b_and!17587 () Bool)

(assert (=> start!39664 (= tp!35321 b_and!17587)))

(declare-fun b!425759 () Bool)

(declare-fun e!252703 () Bool)

(declare-fun tp_is_empty!11083 () Bool)

(assert (=> b!425759 (= e!252703 tp_is_empty!11083)))

(declare-fun b!425760 () Bool)

(declare-fun e!252706 () Bool)

(assert (=> b!425760 (= e!252706 (not true))))

(declare-datatypes ((V!15883 0))(
  ( (V!15884 (val!5586 Int)) )
))
(declare-datatypes ((ValueCell!5198 0))(
  ( (ValueCellFull!5198 (v!7833 V!15883)) (EmptyCell!5198) )
))
(declare-datatypes ((array!26005 0))(
  ( (array!26006 (arr!12452 (Array (_ BitVec 32) ValueCell!5198)) (size!12804 (_ BitVec 32))) )
))
(declare-fun lt!194750 () array!26005)

(declare-fun minValue!515 () V!15883)

(declare-fun defaultEntry!557 () Int)

(declare-fun _values!549 () array!26005)

(declare-fun zeroValue!515 () V!15883)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26007 0))(
  ( (array!26008 (arr!12453 (Array (_ BitVec 32) (_ BitVec 64))) (size!12805 (_ BitVec 32))) )
))
(declare-fun lt!194753 () array!26007)

(declare-fun v!412 () V!15883)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26007)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7336 0))(
  ( (tuple2!7337 (_1!3679 (_ BitVec 64)) (_2!3679 V!15883)) )
))
(declare-datatypes ((List!7349 0))(
  ( (Nil!7346) (Cons!7345 (h!8201 tuple2!7336) (t!12793 List!7349)) )
))
(declare-datatypes ((ListLongMap!6249 0))(
  ( (ListLongMap!6250 (toList!3140 List!7349)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1344 (array!26007 array!26005 (_ BitVec 32) (_ BitVec 32) V!15883 V!15883 (_ BitVec 32) Int) ListLongMap!6249)

(declare-fun +!1298 (ListLongMap!6249 tuple2!7336) ListLongMap!6249)

(assert (=> b!425760 (= (getCurrentListMapNoExtraKeys!1344 lt!194753 lt!194750 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1298 (getCurrentListMapNoExtraKeys!1344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7337 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12498 0))(
  ( (Unit!12499) )
))
(declare-fun lt!194751 () Unit!12498)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!493 (array!26007 array!26005 (_ BitVec 32) (_ BitVec 32) V!15883 V!15883 (_ BitVec 32) (_ BitVec 64) V!15883 (_ BitVec 32) Int) Unit!12498)

(assert (=> b!425760 (= lt!194751 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!493 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425761 () Bool)

(declare-fun res!249351 () Bool)

(declare-fun e!252705 () Bool)

(assert (=> b!425761 (=> (not res!249351) (not e!252705))))

(declare-fun arrayContainsKey!0 (array!26007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425761 (= res!249351 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425762 () Bool)

(declare-fun res!249347 () Bool)

(assert (=> b!425762 (=> (not res!249347) (not e!252705))))

(assert (=> b!425762 (= res!249347 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12805 _keys!709))))))

(declare-fun b!425763 () Bool)

(declare-fun res!249350 () Bool)

(assert (=> b!425763 (=> (not res!249350) (not e!252705))))

(assert (=> b!425763 (= res!249350 (and (= (size!12804 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12805 _keys!709) (size!12804 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!249352 () Bool)

(assert (=> start!39664 (=> (not res!249352) (not e!252705))))

(assert (=> start!39664 (= res!249352 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12805 _keys!709))))))

(assert (=> start!39664 e!252705))

(assert (=> start!39664 tp_is_empty!11083))

(assert (=> start!39664 tp!35321))

(assert (=> start!39664 true))

(declare-fun e!252708 () Bool)

(declare-fun array_inv!9074 (array!26005) Bool)

(assert (=> start!39664 (and (array_inv!9074 _values!549) e!252708)))

(declare-fun array_inv!9075 (array!26007) Bool)

(assert (=> start!39664 (array_inv!9075 _keys!709)))

(declare-fun mapNonEmpty!18246 () Bool)

(declare-fun mapRes!18246 () Bool)

(declare-fun tp!35322 () Bool)

(declare-fun e!252702 () Bool)

(assert (=> mapNonEmpty!18246 (= mapRes!18246 (and tp!35322 e!252702))))

(declare-fun mapRest!18246 () (Array (_ BitVec 32) ValueCell!5198))

(declare-fun mapKey!18246 () (_ BitVec 32))

(declare-fun mapValue!18246 () ValueCell!5198)

(assert (=> mapNonEmpty!18246 (= (arr!12452 _values!549) (store mapRest!18246 mapKey!18246 mapValue!18246))))

(declare-fun b!425764 () Bool)

(declare-fun res!249353 () Bool)

(assert (=> b!425764 (=> (not res!249353) (not e!252705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425764 (= res!249353 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18246 () Bool)

(assert (=> mapIsEmpty!18246 mapRes!18246))

(declare-fun b!425765 () Bool)

(declare-fun res!249356 () Bool)

(assert (=> b!425765 (=> (not res!249356) (not e!252705))))

(assert (=> b!425765 (= res!249356 (or (= (select (arr!12453 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12453 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425766 () Bool)

(declare-fun res!249348 () Bool)

(assert (=> b!425766 (=> (not res!249348) (not e!252705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425766 (= res!249348 (validKeyInArray!0 k!794))))

(declare-fun b!425767 () Bool)

(assert (=> b!425767 (= e!252708 (and e!252703 mapRes!18246))))

(declare-fun condMapEmpty!18246 () Bool)

(declare-fun mapDefault!18246 () ValueCell!5198)

