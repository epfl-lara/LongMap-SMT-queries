; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35664 () Bool)

(assert start!35664)

(declare-fun b_free!7919 () Bool)

(declare-fun b_next!7919 () Bool)

(assert (=> start!35664 (= b_free!7919 (not b_next!7919))))

(declare-fun tp!27741 () Bool)

(declare-fun b_and!15161 () Bool)

(assert (=> start!35664 (= tp!27741 b_and!15161)))

(declare-fun b!358223 () Bool)

(declare-fun e!219253 () Bool)

(declare-fun tp_is_empty!8117 () Bool)

(assert (=> b!358223 (= e!219253 tp_is_empty!8117)))

(declare-fun b!358224 () Bool)

(declare-fun res!199106 () Bool)

(declare-fun e!219257 () Bool)

(assert (=> b!358224 (=> (not res!199106) (not e!219257))))

(declare-datatypes ((array!19801 0))(
  ( (array!19802 (arr!9394 (Array (_ BitVec 32) (_ BitVec 64))) (size!9746 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19801)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358224 (= res!199106 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!358225 () Bool)

(declare-fun e!219256 () Bool)

(declare-fun mapRes!13683 () Bool)

(assert (=> b!358225 (= e!219256 (and e!219253 mapRes!13683))))

(declare-fun condMapEmpty!13683 () Bool)

(declare-datatypes ((V!11799 0))(
  ( (V!11800 (val!4103 Int)) )
))
(declare-datatypes ((ValueCell!3715 0))(
  ( (ValueCellFull!3715 (v!6297 V!11799)) (EmptyCell!3715) )
))
(declare-datatypes ((array!19803 0))(
  ( (array!19804 (arr!9395 (Array (_ BitVec 32) ValueCell!3715)) (size!9747 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19803)

(declare-fun mapDefault!13683 () ValueCell!3715)

