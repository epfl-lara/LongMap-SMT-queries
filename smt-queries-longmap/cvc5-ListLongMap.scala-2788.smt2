; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40616 () Bool)

(assert start!40616)

(declare-fun b_free!10627 () Bool)

(declare-fun b_next!10627 () Bool)

(assert (=> start!40616 (= b_free!10627 (not b_next!10627))))

(declare-fun tp!37701 () Bool)

(declare-fun b_and!18635 () Bool)

(assert (=> start!40616 (= tp!37701 b_and!18635)))

(declare-fun b!448277 () Bool)

(declare-fun res!266405 () Bool)

(declare-fun e!263063 () Bool)

(assert (=> b!448277 (=> (not res!266405) (not e!263063))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448277 (= res!266405 (validKeyInArray!0 k!794))))

(declare-fun b!448278 () Bool)

(declare-fun res!266407 () Bool)

(assert (=> b!448278 (=> (not res!266407) (not e!263063))))

(declare-datatypes ((array!27737 0))(
  ( (array!27738 (arr!13314 (Array (_ BitVec 32) (_ BitVec 64))) (size!13666 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27737)

(declare-datatypes ((List!7971 0))(
  ( (Nil!7968) (Cons!7967 (h!8823 (_ BitVec 64)) (t!13733 List!7971)) )
))
(declare-fun arrayNoDuplicates!0 (array!27737 (_ BitVec 32) List!7971) Bool)

(assert (=> b!448278 (= res!266407 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7968))))

(declare-fun res!266414 () Bool)

(assert (=> start!40616 (=> (not res!266414) (not e!263063))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40616 (= res!266414 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13666 _keys!709))))))

(assert (=> start!40616 e!263063))

(declare-fun tp_is_empty!11965 () Bool)

(assert (=> start!40616 tp_is_empty!11965))

(assert (=> start!40616 tp!37701))

(assert (=> start!40616 true))

(declare-datatypes ((V!17059 0))(
  ( (V!17060 (val!6027 Int)) )
))
(declare-datatypes ((ValueCell!5639 0))(
  ( (ValueCellFull!5639 (v!8282 V!17059)) (EmptyCell!5639) )
))
(declare-datatypes ((array!27739 0))(
  ( (array!27740 (arr!13315 (Array (_ BitVec 32) ValueCell!5639)) (size!13667 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27739)

(declare-fun e!263064 () Bool)

(declare-fun array_inv!9646 (array!27739) Bool)

(assert (=> start!40616 (and (array_inv!9646 _values!549) e!263064)))

(declare-fun array_inv!9647 (array!27737) Bool)

(assert (=> start!40616 (array_inv!9647 _keys!709)))

(declare-fun b!448279 () Bool)

(declare-fun e!263065 () Bool)

(declare-fun mapRes!19581 () Bool)

(assert (=> b!448279 (= e!263064 (and e!263065 mapRes!19581))))

(declare-fun condMapEmpty!19581 () Bool)

(declare-fun mapDefault!19581 () ValueCell!5639)

