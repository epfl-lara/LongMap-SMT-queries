; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35606 () Bool)

(assert start!35606)

(declare-fun b!357186 () Bool)

(declare-fun res!198327 () Bool)

(declare-fun e!218740 () Bool)

(assert (=> b!357186 (=> (not res!198327) (not e!218740))))

(declare-datatypes ((array!19685 0))(
  ( (array!19686 (arr!9336 (Array (_ BitVec 32) (_ BitVec 64))) (size!9688 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19685)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!357186 (= res!198327 (not (= (select (arr!9336 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357187 () Bool)

(declare-fun e!218739 () Bool)

(declare-fun e!218738 () Bool)

(declare-fun mapRes!13596 () Bool)

(assert (=> b!357187 (= e!218739 (and e!218738 mapRes!13596))))

(declare-fun condMapEmpty!13596 () Bool)

(declare-datatypes ((V!11723 0))(
  ( (V!11724 (val!4074 Int)) )
))
(declare-datatypes ((ValueCell!3686 0))(
  ( (ValueCellFull!3686 (v!6268 V!11723)) (EmptyCell!3686) )
))
(declare-datatypes ((array!19687 0))(
  ( (array!19688 (arr!9337 (Array (_ BitVec 32) ValueCell!3686)) (size!9689 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19687)

(declare-fun mapDefault!13596 () ValueCell!3686)

