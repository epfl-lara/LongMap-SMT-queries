; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40620 () Bool)

(assert start!40620)

(declare-fun b_free!10631 () Bool)

(declare-fun b_next!10631 () Bool)

(assert (=> start!40620 (= b_free!10631 (not b_next!10631))))

(declare-fun tp!37713 () Bool)

(declare-fun b_and!18639 () Bool)

(assert (=> start!40620 (= tp!37713 b_and!18639)))

(declare-fun b!448367 () Bool)

(declare-fun res!266476 () Bool)

(declare-fun e!263097 () Bool)

(assert (=> b!448367 (=> (not res!266476) (not e!263097))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27745 0))(
  ( (array!27746 (arr!13318 (Array (_ BitVec 32) (_ BitVec 64))) (size!13670 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27745)

(assert (=> b!448367 (= res!266476 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13670 _keys!709))))))

(declare-fun b!448368 () Bool)

(declare-fun res!266478 () Bool)

(assert (=> b!448368 (=> (not res!266478) (not e!263097))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448368 (= res!266478 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19587 () Bool)

(declare-fun mapRes!19587 () Bool)

(assert (=> mapIsEmpty!19587 mapRes!19587))

(declare-fun b!448369 () Bool)

(declare-fun res!266485 () Bool)

(declare-fun e!263099 () Bool)

(assert (=> b!448369 (=> (not res!266485) (not e!263099))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!448369 (= res!266485 (bvsle from!863 i!563))))

(declare-fun b!448370 () Bool)

(declare-fun e!263101 () Bool)

(declare-fun tp_is_empty!11969 () Bool)

(assert (=> b!448370 (= e!263101 tp_is_empty!11969)))

(declare-fun b!448371 () Bool)

(assert (=> b!448371 (= e!263097 e!263099)))

(declare-fun res!266482 () Bool)

(assert (=> b!448371 (=> (not res!266482) (not e!263099))))

(declare-fun lt!204153 () array!27745)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27745 (_ BitVec 32)) Bool)

(assert (=> b!448371 (= res!266482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204153 mask!1025))))

(assert (=> b!448371 (= lt!204153 (array!27746 (store (arr!13318 _keys!709) i!563 k!794) (size!13670 _keys!709)))))

(declare-fun b!448372 () Bool)

(assert (=> b!448372 (= e!263099 false)))

(declare-datatypes ((V!17063 0))(
  ( (V!17064 (val!6029 Int)) )
))
(declare-fun minValue!515 () V!17063)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5641 0))(
  ( (ValueCellFull!5641 (v!8284 V!17063)) (EmptyCell!5641) )
))
(declare-datatypes ((array!27747 0))(
  ( (array!27748 (arr!13319 (Array (_ BitVec 32) ValueCell!5641)) (size!13671 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27747)

(declare-fun zeroValue!515 () V!17063)

(declare-datatypes ((tuple2!7908 0))(
  ( (tuple2!7909 (_1!3965 (_ BitVec 64)) (_2!3965 V!17063)) )
))
(declare-datatypes ((List!7974 0))(
  ( (Nil!7971) (Cons!7970 (h!8826 tuple2!7908) (t!13736 List!7974)) )
))
(declare-datatypes ((ListLongMap!6821 0))(
  ( (ListLongMap!6822 (toList!3426 List!7974)) )
))
(declare-fun lt!204152 () ListLongMap!6821)

(declare-fun v!412 () V!17063)

(declare-fun getCurrentListMapNoExtraKeys!1612 (array!27745 array!27747 (_ BitVec 32) (_ BitVec 32) V!17063 V!17063 (_ BitVec 32) Int) ListLongMap!6821)

(assert (=> b!448372 (= lt!204152 (getCurrentListMapNoExtraKeys!1612 lt!204153 (array!27748 (store (arr!13319 _values!549) i!563 (ValueCellFull!5641 v!412)) (size!13671 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204151 () ListLongMap!6821)

(assert (=> b!448372 (= lt!204151 (getCurrentListMapNoExtraKeys!1612 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448374 () Bool)

(declare-fun res!266483 () Bool)

(assert (=> b!448374 (=> (not res!266483) (not e!263097))))

(assert (=> b!448374 (= res!266483 (and (= (size!13671 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13670 _keys!709) (size!13671 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448375 () Bool)

(declare-fun e!263100 () Bool)

(assert (=> b!448375 (= e!263100 tp_is_empty!11969)))

(declare-fun b!448376 () Bool)

(declare-fun res!266487 () Bool)

(assert (=> b!448376 (=> (not res!266487) (not e!263097))))

(assert (=> b!448376 (= res!266487 (or (= (select (arr!13318 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13318 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448377 () Bool)

(declare-fun e!263102 () Bool)

(assert (=> b!448377 (= e!263102 (and e!263101 mapRes!19587))))

(declare-fun condMapEmpty!19587 () Bool)

(declare-fun mapDefault!19587 () ValueCell!5641)

