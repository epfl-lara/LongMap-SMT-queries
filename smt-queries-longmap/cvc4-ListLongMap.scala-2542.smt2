; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39074 () Bool)

(assert start!39074)

(declare-fun b_free!9341 () Bool)

(declare-fun b_next!9341 () Bool)

(assert (=> start!39074 (= b_free!9341 (not b_next!9341))))

(declare-fun tp!33551 () Bool)

(declare-fun b_and!16727 () Bool)

(assert (=> start!39074 (= tp!33551 b_and!16727)))

(declare-fun b!410277 () Bool)

(declare-fun res!237767 () Bool)

(declare-fun e!245944 () Bool)

(assert (=> b!410277 (=> (not res!237767) (not e!245944))))

(declare-datatypes ((array!24857 0))(
  ( (array!24858 (arr!11878 (Array (_ BitVec 32) (_ BitVec 64))) (size!12230 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24857)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410277 (= res!237767 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!410278 () Bool)

(declare-fun res!237763 () Bool)

(assert (=> b!410278 (=> (not res!237763) (not e!245944))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410278 (= res!237763 (validMask!0 mask!1025))))

(declare-fun b!410279 () Bool)

(declare-fun res!237771 () Bool)

(declare-fun e!245942 () Bool)

(assert (=> b!410279 (=> (not res!237771) (not e!245942))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410279 (= res!237771 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17361 () Bool)

(declare-fun mapRes!17361 () Bool)

(declare-fun tp!33552 () Bool)

(declare-fun e!245943 () Bool)

(assert (=> mapNonEmpty!17361 (= mapRes!17361 (and tp!33552 e!245943))))

(declare-datatypes ((V!15095 0))(
  ( (V!15096 (val!5291 Int)) )
))
(declare-datatypes ((ValueCell!4903 0))(
  ( (ValueCellFull!4903 (v!7538 V!15095)) (EmptyCell!4903) )
))
(declare-fun mapRest!17361 () (Array (_ BitVec 32) ValueCell!4903))

(declare-fun mapKey!17361 () (_ BitVec 32))

(declare-datatypes ((array!24859 0))(
  ( (array!24860 (arr!11879 (Array (_ BitVec 32) ValueCell!4903)) (size!12231 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24859)

(declare-fun mapValue!17361 () ValueCell!4903)

(assert (=> mapNonEmpty!17361 (= (arr!11879 _values!549) (store mapRest!17361 mapKey!17361 mapValue!17361))))

(declare-fun b!410280 () Bool)

(declare-fun res!237765 () Bool)

(assert (=> b!410280 (=> (not res!237765) (not e!245944))))

(declare-datatypes ((List!6886 0))(
  ( (Nil!6883) (Cons!6882 (h!7738 (_ BitVec 64)) (t!12060 List!6886)) )
))
(declare-fun arrayNoDuplicates!0 (array!24857 (_ BitVec 32) List!6886) Bool)

(assert (=> b!410280 (= res!237765 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6883))))

(declare-fun b!410281 () Bool)

(declare-fun e!245941 () Bool)

(declare-fun tp_is_empty!10493 () Bool)

(assert (=> b!410281 (= e!245941 tp_is_empty!10493)))

(declare-fun b!410282 () Bool)

(declare-fun e!245945 () Bool)

(assert (=> b!410282 (= e!245945 (and e!245941 mapRes!17361))))

(declare-fun condMapEmpty!17361 () Bool)

(declare-fun mapDefault!17361 () ValueCell!4903)

