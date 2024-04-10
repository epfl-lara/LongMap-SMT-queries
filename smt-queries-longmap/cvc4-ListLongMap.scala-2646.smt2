; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39698 () Bool)

(assert start!39698)

(declare-fun b_free!9965 () Bool)

(declare-fun b_next!9965 () Bool)

(assert (=> start!39698 (= b_free!9965 (not b_next!9965))))

(declare-fun tp!35423 () Bool)

(declare-fun b_and!17621 () Bool)

(assert (=> start!39698 (= tp!35423 b_and!17621)))

(declare-fun b!426575 () Bool)

(declare-fun res!250009 () Bool)

(declare-fun e!253063 () Bool)

(assert (=> b!426575 (=> (not res!250009) (not e!253063))))

(declare-datatypes ((array!26073 0))(
  ( (array!26074 (arr!12486 (Array (_ BitVec 32) (_ BitVec 64))) (size!12838 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26073)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26073 (_ BitVec 32)) Bool)

(assert (=> b!426575 (= res!250009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426576 () Bool)

(declare-fun res!250011 () Bool)

(assert (=> b!426576 (=> (not res!250011) (not e!253063))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426576 (= res!250011 (or (= (select (arr!12486 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12486 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426577 () Bool)

(declare-fun e!253065 () Bool)

(declare-fun tp_is_empty!11117 () Bool)

(assert (=> b!426577 (= e!253065 tp_is_empty!11117)))

(declare-fun b!426578 () Bool)

(declare-fun e!253060 () Bool)

(assert (=> b!426578 (= e!253060 tp_is_empty!11117)))

(declare-fun b!426579 () Bool)

(declare-fun res!250017 () Bool)

(assert (=> b!426579 (=> (not res!250017) (not e!253063))))

(assert (=> b!426579 (= res!250017 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12838 _keys!709))))))

(declare-fun b!426580 () Bool)

(declare-fun e!253062 () Bool)

(assert (=> b!426580 (= e!253063 e!253062)))

(declare-fun res!250014 () Bool)

(assert (=> b!426580 (=> (not res!250014) (not e!253062))))

(declare-fun lt!195005 () array!26073)

(assert (=> b!426580 (= res!250014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195005 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!426580 (= lt!195005 (array!26074 (store (arr!12486 _keys!709) i!563 k!794) (size!12838 _keys!709)))))

(declare-fun b!426581 () Bool)

(declare-fun res!250012 () Bool)

(assert (=> b!426581 (=> (not res!250012) (not e!253063))))

(declare-datatypes ((List!7378 0))(
  ( (Nil!7375) (Cons!7374 (h!8230 (_ BitVec 64)) (t!12822 List!7378)) )
))
(declare-fun arrayNoDuplicates!0 (array!26073 (_ BitVec 32) List!7378) Bool)

(assert (=> b!426581 (= res!250012 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7375))))

(declare-fun b!426582 () Bool)

(declare-fun res!250008 () Bool)

(assert (=> b!426582 (=> (not res!250008) (not e!253062))))

(assert (=> b!426582 (= res!250008 (arrayNoDuplicates!0 lt!195005 #b00000000000000000000000000000000 Nil!7375))))

(declare-fun b!426583 () Bool)

(declare-fun e!253064 () Bool)

(declare-fun mapRes!18297 () Bool)

(assert (=> b!426583 (= e!253064 (and e!253065 mapRes!18297))))

(declare-fun condMapEmpty!18297 () Bool)

(declare-datatypes ((V!15927 0))(
  ( (V!15928 (val!5603 Int)) )
))
(declare-datatypes ((ValueCell!5215 0))(
  ( (ValueCellFull!5215 (v!7850 V!15927)) (EmptyCell!5215) )
))
(declare-datatypes ((array!26075 0))(
  ( (array!26076 (arr!12487 (Array (_ BitVec 32) ValueCell!5215)) (size!12839 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26075)

(declare-fun mapDefault!18297 () ValueCell!5215)

