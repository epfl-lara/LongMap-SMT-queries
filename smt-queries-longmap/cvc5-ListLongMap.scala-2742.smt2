; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40290 () Bool)

(assert start!40290)

(declare-fun b_free!10531 () Bool)

(declare-fun b_next!10531 () Bool)

(assert (=> start!40290 (= b_free!10531 (not b_next!10531))))

(declare-fun tp!37133 () Bool)

(declare-fun b_and!18515 () Bool)

(assert (=> start!40290 (= tp!37133 b_and!18515)))

(declare-fun b!442372 () Bool)

(declare-fun res!262002 () Bool)

(declare-fun e!260371 () Bool)

(assert (=> b!442372 (=> (not res!262002) (not e!260371))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442372 (= res!262002 (validMask!0 mask!1025))))

(declare-fun b!442373 () Bool)

(declare-fun e!260374 () Bool)

(assert (=> b!442373 (= e!260371 e!260374)))

(declare-fun res!262003 () Bool)

(assert (=> b!442373 (=> (not res!262003) (not e!260374))))

(declare-datatypes ((array!27191 0))(
  ( (array!27192 (arr!13044 (Array (_ BitVec 32) (_ BitVec 64))) (size!13396 (_ BitVec 32))) )
))
(declare-fun lt!203186 () array!27191)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27191 (_ BitVec 32)) Bool)

(assert (=> b!442373 (= res!262003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203186 mask!1025))))

(declare-fun _keys!709 () array!27191)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442373 (= lt!203186 (array!27192 (store (arr!13044 _keys!709) i!563 k!794) (size!13396 _keys!709)))))

(declare-fun b!442374 () Bool)

(declare-fun res!261994 () Bool)

(assert (=> b!442374 (=> (not res!261994) (not e!260371))))

(declare-fun arrayContainsKey!0 (array!27191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442374 (= res!261994 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!442375 () Bool)

(declare-fun e!260369 () Bool)

(declare-fun tp_is_empty!11689 () Bool)

(assert (=> b!442375 (= e!260369 tp_is_empty!11689)))

(declare-fun b!442376 () Bool)

(declare-fun res!262000 () Bool)

(assert (=> b!442376 (=> (not res!262000) (not e!260371))))

(assert (=> b!442376 (= res!262000 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13396 _keys!709))))))

(declare-fun res!261998 () Bool)

(assert (=> start!40290 (=> (not res!261998) (not e!260371))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40290 (= res!261998 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13396 _keys!709))))))

(assert (=> start!40290 e!260371))

(assert (=> start!40290 tp_is_empty!11689))

(assert (=> start!40290 tp!37133))

(assert (=> start!40290 true))

(declare-datatypes ((V!16691 0))(
  ( (V!16692 (val!5889 Int)) )
))
(declare-datatypes ((ValueCell!5501 0))(
  ( (ValueCellFull!5501 (v!8140 V!16691)) (EmptyCell!5501) )
))
(declare-datatypes ((array!27193 0))(
  ( (array!27194 (arr!13045 (Array (_ BitVec 32) ValueCell!5501)) (size!13397 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27193)

(declare-fun e!260370 () Bool)

(declare-fun array_inv!9466 (array!27193) Bool)

(assert (=> start!40290 (and (array_inv!9466 _values!549) e!260370)))

(declare-fun array_inv!9467 (array!27191) Bool)

(assert (=> start!40290 (array_inv!9467 _keys!709)))

(declare-fun b!442377 () Bool)

(declare-fun res!261997 () Bool)

(assert (=> b!442377 (=> (not res!261997) (not e!260371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442377 (= res!261997 (validKeyInArray!0 k!794))))

(declare-fun b!442378 () Bool)

(declare-fun res!262004 () Bool)

(assert (=> b!442378 (=> (not res!262004) (not e!260371))))

(assert (=> b!442378 (= res!262004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19158 () Bool)

(declare-fun mapRes!19158 () Bool)

(assert (=> mapIsEmpty!19158 mapRes!19158))

(declare-fun b!442379 () Bool)

(declare-fun res!261996 () Bool)

(assert (=> b!442379 (=> (not res!261996) (not e!260371))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442379 (= res!261996 (and (= (size!13397 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13396 _keys!709) (size!13397 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442380 () Bool)

(declare-fun res!262001 () Bool)

(assert (=> b!442380 (=> (not res!262001) (not e!260374))))

(declare-datatypes ((List!7835 0))(
  ( (Nil!7832) (Cons!7831 (h!8687 (_ BitVec 64)) (t!13593 List!7835)) )
))
(declare-fun arrayNoDuplicates!0 (array!27191 (_ BitVec 32) List!7835) Bool)

(assert (=> b!442380 (= res!262001 (arrayNoDuplicates!0 lt!203186 #b00000000000000000000000000000000 Nil!7832))))

(declare-fun b!442381 () Bool)

(declare-fun e!260373 () Bool)

(assert (=> b!442381 (= e!260373 tp_is_empty!11689)))

(declare-fun b!442382 () Bool)

(declare-fun res!261993 () Bool)

(assert (=> b!442382 (=> (not res!261993) (not e!260371))))

(assert (=> b!442382 (= res!261993 (or (= (select (arr!13044 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13044 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442383 () Bool)

(assert (=> b!442383 (= e!260370 (and e!260369 mapRes!19158))))

(declare-fun condMapEmpty!19158 () Bool)

(declare-fun mapDefault!19158 () ValueCell!5501)

