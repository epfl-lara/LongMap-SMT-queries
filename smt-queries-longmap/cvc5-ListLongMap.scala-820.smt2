; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19994 () Bool)

(assert start!19994)

(declare-fun b!195941 () Bool)

(declare-fun e!128983 () Bool)

(declare-fun tp_is_empty!4531 () Bool)

(assert (=> b!195941 (= e!128983 tp_is_empty!4531)))

(declare-fun mapNonEmpty!7859 () Bool)

(declare-fun mapRes!7859 () Bool)

(declare-fun tp!17147 () Bool)

(assert (=> mapNonEmpty!7859 (= mapRes!7859 (and tp!17147 e!128983))))

(declare-datatypes ((V!5689 0))(
  ( (V!5690 (val!2310 Int)) )
))
(declare-datatypes ((ValueCell!1922 0))(
  ( (ValueCellFull!1922 (v!4279 V!5689)) (EmptyCell!1922) )
))
(declare-fun mapValue!7859 () ValueCell!1922)

(declare-fun mapKey!7859 () (_ BitVec 32))

(declare-datatypes ((array!8321 0))(
  ( (array!8322 (arr!3913 (Array (_ BitVec 32) ValueCell!1922)) (size!4238 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8321)

(declare-fun mapRest!7859 () (Array (_ BitVec 32) ValueCell!1922))

(assert (=> mapNonEmpty!7859 (= (arr!3913 _values!649) (store mapRest!7859 mapKey!7859 mapValue!7859))))

(declare-fun res!92448 () Bool)

(declare-fun e!128981 () Bool)

(assert (=> start!19994 (=> (not res!92448) (not e!128981))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19994 (= res!92448 (validMask!0 mask!1149))))

(assert (=> start!19994 e!128981))

(assert (=> start!19994 true))

(declare-fun e!128982 () Bool)

(declare-fun array_inv!2541 (array!8321) Bool)

(assert (=> start!19994 (and (array_inv!2541 _values!649) e!128982)))

(declare-datatypes ((array!8323 0))(
  ( (array!8324 (arr!3914 (Array (_ BitVec 32) (_ BitVec 64))) (size!4239 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8323)

(declare-fun array_inv!2542 (array!8323) Bool)

(assert (=> start!19994 (array_inv!2542 _keys!825)))

(declare-fun b!195942 () Bool)

(declare-datatypes ((List!2455 0))(
  ( (Nil!2452) (Cons!2451 (h!3093 (_ BitVec 64)) (t!7386 List!2455)) )
))
(declare-fun noDuplicate!57 (List!2455) Bool)

(assert (=> b!195942 (= e!128981 (not (noDuplicate!57 Nil!2452)))))

(declare-fun mapIsEmpty!7859 () Bool)

(assert (=> mapIsEmpty!7859 mapRes!7859))

(declare-fun b!195943 () Bool)

(declare-fun e!128985 () Bool)

(assert (=> b!195943 (= e!128982 (and e!128985 mapRes!7859))))

(declare-fun condMapEmpty!7859 () Bool)

(declare-fun mapDefault!7859 () ValueCell!1922)

