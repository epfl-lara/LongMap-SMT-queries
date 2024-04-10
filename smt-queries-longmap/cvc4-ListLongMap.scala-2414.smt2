; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38194 () Bool)

(assert start!38194)

(declare-fun b_free!9053 () Bool)

(declare-fun b_next!9053 () Bool)

(assert (=> start!38194 (= b_free!9053 (not b_next!9053))))

(declare-fun tp!31943 () Bool)

(declare-fun b_and!16427 () Bool)

(assert (=> start!38194 (= tp!31943 b_and!16427)))

(declare-fun b!393868 () Bool)

(declare-fun res!225697 () Bool)

(declare-fun e!238445 () Bool)

(assert (=> b!393868 (=> (not res!225697) (not e!238445))))

(declare-datatypes ((array!23357 0))(
  ( (array!23358 (arr!11136 (Array (_ BitVec 32) (_ BitVec 64))) (size!11488 (_ BitVec 32))) )
))
(declare-fun lt!186499 () array!23357)

(declare-datatypes ((List!6476 0))(
  ( (Nil!6473) (Cons!6472 (h!7328 (_ BitVec 64)) (t!11648 List!6476)) )
))
(declare-fun arrayNoDuplicates!0 (array!23357 (_ BitVec 32) List!6476) Bool)

(assert (=> b!393868 (= res!225697 (arrayNoDuplicates!0 lt!186499 #b00000000000000000000000000000000 Nil!6473))))

(declare-fun b!393869 () Bool)

(declare-fun e!238448 () Bool)

(assert (=> b!393869 (= e!238448 e!238445)))

(declare-fun res!225705 () Bool)

(assert (=> b!393869 (=> (not res!225705) (not e!238445))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23357 (_ BitVec 32)) Bool)

(assert (=> b!393869 (= res!225705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186499 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23357)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393869 (= lt!186499 (array!23358 (store (arr!11136 _keys!658) i!548 k!778) (size!11488 _keys!658)))))

(declare-fun b!393870 () Bool)

(declare-fun e!238450 () Bool)

(declare-datatypes ((V!14071 0))(
  ( (V!14072 (val!4907 Int)) )
))
(declare-datatypes ((ValueCell!4519 0))(
  ( (ValueCellFull!4519 (v!7148 V!14071)) (EmptyCell!4519) )
))
(declare-datatypes ((array!23359 0))(
  ( (array!23360 (arr!11137 (Array (_ BitVec 32) ValueCell!4519)) (size!11489 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23359)

(assert (=> b!393870 (= e!238450 (bvslt i!548 (size!11489 _values!506)))))

(declare-datatypes ((tuple2!6624 0))(
  ( (tuple2!6625 (_1!3323 (_ BitVec 64)) (_2!3323 V!14071)) )
))
(declare-datatypes ((List!6477 0))(
  ( (Nil!6474) (Cons!6473 (h!7329 tuple2!6624) (t!11649 List!6477)) )
))
(declare-datatypes ((ListLongMap!5537 0))(
  ( (ListLongMap!5538 (toList!2784 List!6477)) )
))
(declare-fun lt!186500 () ListLongMap!5537)

(declare-fun lt!186494 () ListLongMap!5537)

(assert (=> b!393870 (= lt!186500 lt!186494)))

(declare-fun b!393871 () Bool)

(declare-fun e!238444 () Bool)

(declare-fun tp_is_empty!9725 () Bool)

(assert (=> b!393871 (= e!238444 tp_is_empty!9725)))

(declare-fun b!393872 () Bool)

(declare-fun res!225702 () Bool)

(assert (=> b!393872 (=> (not res!225702) (not e!238448))))

(assert (=> b!393872 (= res!225702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393874 () Bool)

(declare-fun e!238447 () Bool)

(declare-fun mapRes!16185 () Bool)

(assert (=> b!393874 (= e!238447 (and e!238444 mapRes!16185))))

(declare-fun condMapEmpty!16185 () Bool)

(declare-fun mapDefault!16185 () ValueCell!4519)

