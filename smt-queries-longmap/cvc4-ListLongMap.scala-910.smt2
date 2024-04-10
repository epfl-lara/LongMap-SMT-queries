; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20560 () Bool)

(assert start!20560)

(declare-fun b_free!5219 () Bool)

(declare-fun b_next!5219 () Bool)

(assert (=> start!20560 (= b_free!5219 (not b_next!5219))))

(declare-fun tp!18688 () Bool)

(declare-fun b_and!11965 () Bool)

(assert (=> start!20560 (= tp!18688 b_and!11965)))

(declare-fun b!204588 () Bool)

(declare-fun res!98620 () Bool)

(declare-fun e!133852 () Bool)

(assert (=> b!204588 (=> (not res!98620) (not e!133852))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9367 0))(
  ( (array!9368 (arr!4434 (Array (_ BitVec 32) (_ BitVec 64))) (size!4759 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9367)

(assert (=> b!204588 (= res!98620 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4759 _keys!825))))))

(declare-fun b!204589 () Bool)

(declare-fun e!133853 () Bool)

(declare-fun e!133849 () Bool)

(declare-fun mapRes!8681 () Bool)

(assert (=> b!204589 (= e!133853 (and e!133849 mapRes!8681))))

(declare-fun condMapEmpty!8681 () Bool)

(declare-datatypes ((V!6413 0))(
  ( (V!6414 (val!2582 Int)) )
))
(declare-datatypes ((ValueCell!2194 0))(
  ( (ValueCellFull!2194 (v!4552 V!6413)) (EmptyCell!2194) )
))
(declare-datatypes ((array!9369 0))(
  ( (array!9370 (arr!4435 (Array (_ BitVec 32) ValueCell!2194)) (size!4760 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9369)

(declare-fun mapDefault!8681 () ValueCell!2194)

