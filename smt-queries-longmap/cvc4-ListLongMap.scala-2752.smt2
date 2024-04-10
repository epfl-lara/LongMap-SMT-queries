; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40368 () Bool)

(assert start!40368)

(declare-fun res!262838 () Bool)

(declare-fun e!260954 () Bool)

(assert (=> start!40368 (=> (not res!262838) (not e!260954))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27319 0))(
  ( (array!27320 (arr!13107 (Array (_ BitVec 32) (_ BitVec 64))) (size!13459 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27319)

(assert (=> start!40368 (= res!262838 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13459 _keys!709))))))

(assert (=> start!40368 e!260954))

(assert (=> start!40368 true))

(declare-datatypes ((V!16775 0))(
  ( (V!16776 (val!5921 Int)) )
))
(declare-datatypes ((ValueCell!5533 0))(
  ( (ValueCellFull!5533 (v!8172 V!16775)) (EmptyCell!5533) )
))
(declare-datatypes ((array!27321 0))(
  ( (array!27322 (arr!13108 (Array (_ BitVec 32) ValueCell!5533)) (size!13460 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27321)

(declare-fun e!260951 () Bool)

(declare-fun array_inv!9510 (array!27321) Bool)

(assert (=> start!40368 (and (array_inv!9510 _values!549) e!260951)))

(declare-fun array_inv!9511 (array!27319) Bool)

(assert (=> start!40368 (array_inv!9511 _keys!709)))

(declare-fun b!443522 () Bool)

(declare-fun e!260952 () Bool)

(declare-fun tp_is_empty!11753 () Bool)

(assert (=> b!443522 (= e!260952 tp_is_empty!11753)))

(declare-fun b!443523 () Bool)

(declare-fun res!262836 () Bool)

(assert (=> b!443523 (=> (not res!262836) (not e!260954))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27319 (_ BitVec 32)) Bool)

(assert (=> b!443523 (= res!262836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443524 () Bool)

(declare-fun res!262834 () Bool)

(assert (=> b!443524 (=> (not res!262834) (not e!260954))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443524 (= res!262834 (or (= (select (arr!13107 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13107 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443525 () Bool)

(declare-fun res!262835 () Bool)

(assert (=> b!443525 (=> (not res!262835) (not e!260954))))

(assert (=> b!443525 (= res!262835 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13459 _keys!709))))))

(declare-fun mapNonEmpty!19257 () Bool)

(declare-fun mapRes!19257 () Bool)

(declare-fun tp!37239 () Bool)

(assert (=> mapNonEmpty!19257 (= mapRes!19257 (and tp!37239 e!260952))))

(declare-fun mapKey!19257 () (_ BitVec 32))

(declare-fun mapValue!19257 () ValueCell!5533)

(declare-fun mapRest!19257 () (Array (_ BitVec 32) ValueCell!5533))

(assert (=> mapNonEmpty!19257 (= (arr!13108 _values!549) (store mapRest!19257 mapKey!19257 mapValue!19257))))

(declare-fun b!443526 () Bool)

(declare-fun res!262833 () Bool)

(assert (=> b!443526 (=> (not res!262833) (not e!260954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443526 (= res!262833 (validMask!0 mask!1025))))

(declare-fun b!443527 () Bool)

(declare-fun e!260950 () Bool)

(assert (=> b!443527 (= e!260954 e!260950)))

(declare-fun res!262832 () Bool)

(assert (=> b!443527 (=> (not res!262832) (not e!260950))))

(declare-fun lt!203350 () array!27319)

(assert (=> b!443527 (= res!262832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203350 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!443527 (= lt!203350 (array!27320 (store (arr!13107 _keys!709) i!563 k!794) (size!13459 _keys!709)))))

(declare-fun b!443528 () Bool)

(declare-fun res!262840 () Bool)

(assert (=> b!443528 (=> (not res!262840) (not e!260954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443528 (= res!262840 (validKeyInArray!0 k!794))))

(declare-fun b!443529 () Bool)

(declare-fun res!262831 () Bool)

(assert (=> b!443529 (=> (not res!262831) (not e!260954))))

(declare-fun arrayContainsKey!0 (array!27319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443529 (= res!262831 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443530 () Bool)

(declare-fun e!260949 () Bool)

(assert (=> b!443530 (= e!260949 tp_is_empty!11753)))

(declare-fun b!443531 () Bool)

(declare-fun res!262837 () Bool)

(assert (=> b!443531 (=> (not res!262837) (not e!260954))))

(declare-datatypes ((List!7858 0))(
  ( (Nil!7855) (Cons!7854 (h!8710 (_ BitVec 64)) (t!13616 List!7858)) )
))
(declare-fun arrayNoDuplicates!0 (array!27319 (_ BitVec 32) List!7858) Bool)

(assert (=> b!443531 (= res!262837 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7855))))

(declare-fun b!443532 () Bool)

(assert (=> b!443532 (= e!260951 (and e!260949 mapRes!19257))))

(declare-fun condMapEmpty!19257 () Bool)

(declare-fun mapDefault!19257 () ValueCell!5533)

