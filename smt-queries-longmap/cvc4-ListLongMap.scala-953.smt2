; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20818 () Bool)

(assert start!20818)

(declare-fun b_free!5471 () Bool)

(declare-fun b_next!5471 () Bool)

(assert (=> start!20818 (= b_free!5471 (not b_next!5471))))

(declare-fun tp!19454 () Bool)

(declare-fun b_and!12217 () Bool)

(assert (=> start!20818 (= tp!19454 b_and!12217)))

(declare-fun b!208730 () Bool)

(declare-fun res!101602 () Bool)

(declare-fun e!136094 () Bool)

(assert (=> b!208730 (=> (not res!101602) (not e!136094))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9869 0))(
  ( (array!9870 (arr!4685 (Array (_ BitVec 32) (_ BitVec 64))) (size!5010 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9869)

(assert (=> b!208730 (= res!101602 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5010 _keys!825))))))

(declare-fun mapNonEmpty!9068 () Bool)

(declare-fun mapRes!9068 () Bool)

(declare-fun tp!19453 () Bool)

(declare-fun e!136090 () Bool)

(assert (=> mapNonEmpty!9068 (= mapRes!9068 (and tp!19453 e!136090))))

(declare-datatypes ((V!6757 0))(
  ( (V!6758 (val!2711 Int)) )
))
(declare-datatypes ((ValueCell!2323 0))(
  ( (ValueCellFull!2323 (v!4681 V!6757)) (EmptyCell!2323) )
))
(declare-fun mapValue!9068 () ValueCell!2323)

(declare-fun mapRest!9068 () (Array (_ BitVec 32) ValueCell!2323))

(declare-datatypes ((array!9871 0))(
  ( (array!9872 (arr!4686 (Array (_ BitVec 32) ValueCell!2323)) (size!5011 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9871)

(declare-fun mapKey!9068 () (_ BitVec 32))

(assert (=> mapNonEmpty!9068 (= (arr!4686 _values!649) (store mapRest!9068 mapKey!9068 mapValue!9068))))

(declare-fun b!208731 () Bool)

(declare-fun tp_is_empty!5333 () Bool)

(assert (=> b!208731 (= e!136090 tp_is_empty!5333)))

(declare-fun b!208732 () Bool)

(declare-fun e!136091 () Bool)

(declare-fun e!136093 () Bool)

(assert (=> b!208732 (= e!136091 (and e!136093 mapRes!9068))))

(declare-fun condMapEmpty!9068 () Bool)

(declare-fun mapDefault!9068 () ValueCell!2323)

