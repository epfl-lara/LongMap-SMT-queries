; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20830 () Bool)

(assert start!20830)

(declare-fun b_free!5483 () Bool)

(declare-fun b_next!5483 () Bool)

(assert (=> start!20830 (= b_free!5483 (not b_next!5483))))

(declare-fun tp!19489 () Bool)

(declare-fun b_and!12229 () Bool)

(assert (=> start!20830 (= tp!19489 b_and!12229)))

(declare-fun b!208910 () Bool)

(declare-fun res!101730 () Bool)

(declare-fun e!136184 () Bool)

(assert (=> b!208910 (=> (not res!101730) (not e!136184))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9893 0))(
  ( (array!9894 (arr!4697 (Array (_ BitVec 32) (_ BitVec 64))) (size!5022 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9893)

(assert (=> b!208910 (= res!101730 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5022 _keys!825))))))

(declare-fun b!208911 () Bool)

(declare-fun e!136180 () Bool)

(declare-fun e!136182 () Bool)

(declare-fun mapRes!9086 () Bool)

(assert (=> b!208911 (= e!136180 (and e!136182 mapRes!9086))))

(declare-fun condMapEmpty!9086 () Bool)

(declare-datatypes ((V!6773 0))(
  ( (V!6774 (val!2717 Int)) )
))
(declare-datatypes ((ValueCell!2329 0))(
  ( (ValueCellFull!2329 (v!4687 V!6773)) (EmptyCell!2329) )
))
(declare-datatypes ((array!9895 0))(
  ( (array!9896 (arr!4698 (Array (_ BitVec 32) ValueCell!2329)) (size!5023 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9895)

(declare-fun mapDefault!9086 () ValueCell!2329)

