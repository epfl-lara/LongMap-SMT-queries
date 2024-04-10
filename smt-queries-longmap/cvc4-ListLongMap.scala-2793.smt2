; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40650 () Bool)

(assert start!40650)

(declare-fun b_free!10661 () Bool)

(declare-fun b_next!10661 () Bool)

(assert (=> start!40650 (= b_free!10661 (not b_next!10661))))

(declare-fun tp!37803 () Bool)

(declare-fun b_and!18669 () Bool)

(assert (=> start!40650 (= tp!37803 b_and!18669)))

(declare-fun b!449042 () Bool)

(declare-fun res!267025 () Bool)

(declare-fun e!263367 () Bool)

(assert (=> b!449042 (=> (not res!267025) (not e!263367))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27805 0))(
  ( (array!27806 (arr!13348 (Array (_ BitVec 32) (_ BitVec 64))) (size!13700 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27805)

(assert (=> b!449042 (= res!267025 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13700 _keys!709))))))

(declare-fun b!449043 () Bool)

(declare-fun res!267024 () Bool)

(assert (=> b!449043 (=> (not res!267024) (not e!263367))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449043 (= res!267024 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19632 () Bool)

(declare-fun mapRes!19632 () Bool)

(declare-fun tp!37802 () Bool)

(declare-fun e!263370 () Bool)

(assert (=> mapNonEmpty!19632 (= mapRes!19632 (and tp!37802 e!263370))))

(declare-datatypes ((V!17103 0))(
  ( (V!17104 (val!6044 Int)) )
))
(declare-datatypes ((ValueCell!5656 0))(
  ( (ValueCellFull!5656 (v!8299 V!17103)) (EmptyCell!5656) )
))
(declare-fun mapValue!19632 () ValueCell!5656)

(declare-datatypes ((array!27807 0))(
  ( (array!27808 (arr!13349 (Array (_ BitVec 32) ValueCell!5656)) (size!13701 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27807)

(declare-fun mapRest!19632 () (Array (_ BitVec 32) ValueCell!5656))

(declare-fun mapKey!19632 () (_ BitVec 32))

(assert (=> mapNonEmpty!19632 (= (arr!13349 _values!549) (store mapRest!19632 mapKey!19632 mapValue!19632))))

(declare-fun b!449044 () Bool)

(declare-fun res!267023 () Bool)

(assert (=> b!449044 (=> (not res!267023) (not e!263367))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27805 (_ BitVec 32)) Bool)

(assert (=> b!449044 (= res!267023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449045 () Bool)

(declare-fun res!267020 () Bool)

(assert (=> b!449045 (=> (not res!267020) (not e!263367))))

(assert (=> b!449045 (= res!267020 (or (= (select (arr!13348 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13348 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449046 () Bool)

(declare-fun res!267018 () Bool)

(assert (=> b!449046 (=> (not res!267018) (not e!263367))))

(declare-datatypes ((List!7997 0))(
  ( (Nil!7994) (Cons!7993 (h!8849 (_ BitVec 64)) (t!13759 List!7997)) )
))
(declare-fun arrayNoDuplicates!0 (array!27805 (_ BitVec 32) List!7997) Bool)

(assert (=> b!449046 (= res!267018 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7994))))

(declare-fun b!449047 () Bool)

(declare-fun e!263368 () Bool)

(assert (=> b!449047 (= e!263368 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17103)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7932 0))(
  ( (tuple2!7933 (_1!3977 (_ BitVec 64)) (_2!3977 V!17103)) )
))
(declare-datatypes ((List!7998 0))(
  ( (Nil!7995) (Cons!7994 (h!8850 tuple2!7932) (t!13760 List!7998)) )
))
(declare-datatypes ((ListLongMap!6845 0))(
  ( (ListLongMap!6846 (toList!3438 List!7998)) )
))
(declare-fun lt!204288 () ListLongMap!6845)

(declare-fun zeroValue!515 () V!17103)

(declare-fun lt!204287 () array!27805)

(declare-fun v!412 () V!17103)

(declare-fun getCurrentListMapNoExtraKeys!1624 (array!27805 array!27807 (_ BitVec 32) (_ BitVec 32) V!17103 V!17103 (_ BitVec 32) Int) ListLongMap!6845)

(assert (=> b!449047 (= lt!204288 (getCurrentListMapNoExtraKeys!1624 lt!204287 (array!27808 (store (arr!13349 _values!549) i!563 (ValueCellFull!5656 v!412)) (size!13701 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204286 () ListLongMap!6845)

(assert (=> b!449047 (= lt!204286 (getCurrentListMapNoExtraKeys!1624 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449048 () Bool)

(declare-fun res!267016 () Bool)

(assert (=> b!449048 (=> (not res!267016) (not e!263368))))

(assert (=> b!449048 (= res!267016 (bvsle from!863 i!563))))

(declare-fun b!449049 () Bool)

(declare-fun e!263371 () Bool)

(declare-fun e!263369 () Bool)

(assert (=> b!449049 (= e!263371 (and e!263369 mapRes!19632))))

(declare-fun condMapEmpty!19632 () Bool)

(declare-fun mapDefault!19632 () ValueCell!5656)

