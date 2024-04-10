; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40064 () Bool)

(assert start!40064)

(declare-fun b_free!10331 () Bool)

(declare-fun b_next!10331 () Bool)

(assert (=> start!40064 (= b_free!10331 (not b_next!10331))))

(declare-fun tp!36522 () Bool)

(declare-fun b_and!18299 () Bool)

(assert (=> start!40064 (= tp!36522 b_and!18299)))

(declare-fun b!437300 () Bool)

(declare-fun e!258117 () Bool)

(declare-fun e!258119 () Bool)

(assert (=> b!437300 (= e!258117 e!258119)))

(declare-fun res!257957 () Bool)

(assert (=> b!437300 (=> (not res!257957) (not e!258119))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437300 (= res!257957 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16415 0))(
  ( (V!16416 (val!5786 Int)) )
))
(declare-fun minValue!515 () V!16415)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16415)

(declare-datatypes ((tuple2!7668 0))(
  ( (tuple2!7669 (_1!3845 (_ BitVec 64)) (_2!3845 V!16415)) )
))
(declare-datatypes ((List!7666 0))(
  ( (Nil!7663) (Cons!7662 (h!8518 tuple2!7668) (t!13422 List!7666)) )
))
(declare-datatypes ((ListLongMap!6581 0))(
  ( (ListLongMap!6582 (toList!3306 List!7666)) )
))
(declare-fun lt!201602 () ListLongMap!6581)

(declare-datatypes ((array!26785 0))(
  ( (array!26786 (arr!12842 (Array (_ BitVec 32) (_ BitVec 64))) (size!13194 (_ BitVec 32))) )
))
(declare-fun lt!201601 () array!26785)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5398 0))(
  ( (ValueCellFull!5398 (v!8033 V!16415)) (EmptyCell!5398) )
))
(declare-datatypes ((array!26787 0))(
  ( (array!26788 (arr!12843 (Array (_ BitVec 32) ValueCell!5398)) (size!13195 (_ BitVec 32))) )
))
(declare-fun lt!201605 () array!26787)

(declare-fun getCurrentListMapNoExtraKeys!1495 (array!26785 array!26787 (_ BitVec 32) (_ BitVec 32) V!16415 V!16415 (_ BitVec 32) Int) ListLongMap!6581)

(assert (=> b!437300 (= lt!201602 (getCurrentListMapNoExtraKeys!1495 lt!201601 lt!201605 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26787)

(declare-fun v!412 () V!16415)

(assert (=> b!437300 (= lt!201605 (array!26788 (store (arr!12843 _values!549) i!563 (ValueCellFull!5398 v!412)) (size!13195 _values!549)))))

(declare-fun lt!201604 () ListLongMap!6581)

(declare-fun _keys!709 () array!26785)

(assert (=> b!437300 (= lt!201604 (getCurrentListMapNoExtraKeys!1495 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437301 () Bool)

(declare-fun e!258118 () Bool)

(assert (=> b!437301 (= e!258118 e!258117)))

(declare-fun res!257952 () Bool)

(assert (=> b!437301 (=> (not res!257952) (not e!258117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26785 (_ BitVec 32)) Bool)

(assert (=> b!437301 (= res!257952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201601 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!437301 (= lt!201601 (array!26786 (store (arr!12842 _keys!709) i!563 k!794) (size!13194 _keys!709)))))

(declare-fun res!257950 () Bool)

(assert (=> start!40064 (=> (not res!257950) (not e!258118))))

(assert (=> start!40064 (= res!257950 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13194 _keys!709))))))

(assert (=> start!40064 e!258118))

(declare-fun tp_is_empty!11483 () Bool)

(assert (=> start!40064 tp_is_empty!11483))

(assert (=> start!40064 tp!36522))

(assert (=> start!40064 true))

(declare-fun e!258121 () Bool)

(declare-fun array_inv!9328 (array!26787) Bool)

(assert (=> start!40064 (and (array_inv!9328 _values!549) e!258121)))

(declare-fun array_inv!9329 (array!26785) Bool)

(assert (=> start!40064 (array_inv!9329 _keys!709)))

(declare-fun b!437302 () Bool)

(declare-fun res!257951 () Bool)

(assert (=> b!437302 (=> (not res!257951) (not e!258118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437302 (= res!257951 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18846 () Bool)

(declare-fun mapRes!18846 () Bool)

(assert (=> mapIsEmpty!18846 mapRes!18846))

(declare-fun b!437303 () Bool)

(declare-fun res!257956 () Bool)

(assert (=> b!437303 (=> (not res!257956) (not e!258118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437303 (= res!257956 (validKeyInArray!0 k!794))))

(declare-fun b!437304 () Bool)

(declare-fun e!258120 () Bool)

(assert (=> b!437304 (= e!258120 tp_is_empty!11483)))

(declare-fun b!437305 () Bool)

(declare-fun res!257953 () Bool)

(assert (=> b!437305 (=> (not res!257953) (not e!258118))))

(assert (=> b!437305 (= res!257953 (or (= (select (arr!12842 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12842 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437306 () Bool)

(declare-fun res!257947 () Bool)

(assert (=> b!437306 (=> (not res!257947) (not e!258118))))

(declare-datatypes ((List!7667 0))(
  ( (Nil!7664) (Cons!7663 (h!8519 (_ BitVec 64)) (t!13423 List!7667)) )
))
(declare-fun arrayNoDuplicates!0 (array!26785 (_ BitVec 32) List!7667) Bool)

(assert (=> b!437306 (= res!257947 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7664))))

(declare-fun b!437307 () Bool)

(declare-fun e!258123 () Bool)

(assert (=> b!437307 (= e!258123 tp_is_empty!11483)))

(declare-fun b!437308 () Bool)

(declare-fun res!257946 () Bool)

(assert (=> b!437308 (=> (not res!257946) (not e!258118))))

(declare-fun arrayContainsKey!0 (array!26785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437308 (= res!257946 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!437309 () Bool)

(declare-fun res!257948 () Bool)

(assert (=> b!437309 (=> (not res!257948) (not e!258118))))

(assert (=> b!437309 (= res!257948 (and (= (size!13195 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13194 _keys!709) (size!13195 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437310 () Bool)

(declare-fun res!257955 () Bool)

(assert (=> b!437310 (=> (not res!257955) (not e!258118))))

(assert (=> b!437310 (= res!257955 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13194 _keys!709))))))

(declare-fun b!437311 () Bool)

(assert (=> b!437311 (= e!258121 (and e!258120 mapRes!18846))))

(declare-fun condMapEmpty!18846 () Bool)

(declare-fun mapDefault!18846 () ValueCell!5398)

