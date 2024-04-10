; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21216 () Bool)

(assert start!21216)

(declare-fun b_free!5647 () Bool)

(declare-fun b_next!5647 () Bool)

(assert (=> start!21216 (= b_free!5647 (not b_next!5647))))

(declare-fun tp!20014 () Bool)

(declare-fun b_and!12525 () Bool)

(assert (=> start!21216 (= tp!20014 b_and!12525)))

(declare-fun b!213766 () Bool)

(declare-fun e!138999 () Bool)

(declare-fun tp_is_empty!5509 () Bool)

(assert (=> b!213766 (= e!138999 tp_is_empty!5509)))

(declare-fun b!213767 () Bool)

(declare-fun e!139003 () Bool)

(assert (=> b!213767 (= e!139003 tp_is_empty!5509)))

(declare-fun res!104658 () Bool)

(declare-fun e!139004 () Bool)

(assert (=> start!21216 (=> (not res!104658) (not e!139004))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21216 (= res!104658 (validMask!0 mask!1149))))

(assert (=> start!21216 e!139004))

(declare-datatypes ((V!6993 0))(
  ( (V!6994 (val!2799 Int)) )
))
(declare-datatypes ((ValueCell!2411 0))(
  ( (ValueCellFull!2411 (v!4813 V!6993)) (EmptyCell!2411) )
))
(declare-datatypes ((array!10221 0))(
  ( (array!10222 (arr!4850 (Array (_ BitVec 32) ValueCell!2411)) (size!5175 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10221)

(declare-fun e!139000 () Bool)

(declare-fun array_inv!3207 (array!10221) Bool)

(assert (=> start!21216 (and (array_inv!3207 _values!649) e!139000)))

(assert (=> start!21216 true))

(assert (=> start!21216 tp_is_empty!5509))

(declare-datatypes ((array!10223 0))(
  ( (array!10224 (arr!4851 (Array (_ BitVec 32) (_ BitVec 64))) (size!5176 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10223)

(declare-fun array_inv!3208 (array!10223) Bool)

(assert (=> start!21216 (array_inv!3208 _keys!825)))

(assert (=> start!21216 tp!20014))

(declare-fun b!213768 () Bool)

(declare-fun mapRes!9365 () Bool)

(assert (=> b!213768 (= e!139000 (and e!138999 mapRes!9365))))

(declare-fun condMapEmpty!9365 () Bool)

(declare-fun mapDefault!9365 () ValueCell!2411)

