; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72428 () Bool)

(assert start!72428)

(declare-fun b_free!13613 () Bool)

(declare-fun b_next!13613 () Bool)

(assert (=> start!72428 (= b_free!13613 (not b_next!13613))))

(declare-fun tp!47938 () Bool)

(declare-fun b_and!22699 () Bool)

(assert (=> start!72428 (= tp!47938 b_and!22699)))

(declare-fun b!839765 () Bool)

(declare-fun res!570946 () Bool)

(declare-fun e!468630 () Bool)

(assert (=> b!839765 (=> (not res!570946) (not e!468630))))

(declare-datatypes ((array!47240 0))(
  ( (array!47241 (arr!22651 (Array (_ BitVec 32) (_ BitVec 64))) (size!23091 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47240)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47240 (_ BitVec 32)) Bool)

(assert (=> b!839765 (= res!570946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24818 () Bool)

(declare-fun mapRes!24818 () Bool)

(assert (=> mapIsEmpty!24818 mapRes!24818))

(declare-fun b!839767 () Bool)

(declare-fun e!468632 () Bool)

(declare-datatypes ((V!25685 0))(
  ( (V!25686 (val!7787 Int)) )
))
(declare-datatypes ((tuple2!10314 0))(
  ( (tuple2!10315 (_1!5168 (_ BitVec 64)) (_2!5168 V!25685)) )
))
(declare-datatypes ((List!16111 0))(
  ( (Nil!16108) (Cons!16107 (h!17238 tuple2!10314) (t!22482 List!16111)) )
))
(declare-datatypes ((ListLongMap!9083 0))(
  ( (ListLongMap!9084 (toList!4557 List!16111)) )
))
(declare-fun call!37072 () ListLongMap!9083)

(declare-fun call!37073 () ListLongMap!9083)

(assert (=> b!839767 (= e!468632 (= call!37072 call!37073))))

(declare-fun b!839768 () Bool)

(declare-fun e!468634 () Bool)

(declare-fun tp_is_empty!15479 () Bool)

(assert (=> b!839768 (= e!468634 tp_is_empty!15479)))

(declare-fun mapNonEmpty!24818 () Bool)

(declare-fun tp!47937 () Bool)

(declare-fun e!468629 () Bool)

(assert (=> mapNonEmpty!24818 (= mapRes!24818 (and tp!47937 e!468629))))

(declare-fun mapKey!24818 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7300 0))(
  ( (ValueCellFull!7300 (v!10212 V!25685)) (EmptyCell!7300) )
))
(declare-fun mapRest!24818 () (Array (_ BitVec 32) ValueCell!7300))

(declare-fun mapValue!24818 () ValueCell!7300)

(declare-datatypes ((array!47242 0))(
  ( (array!47243 (arr!22652 (Array (_ BitVec 32) ValueCell!7300)) (size!23092 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47242)

(assert (=> mapNonEmpty!24818 (= (arr!22652 _values!688) (store mapRest!24818 mapKey!24818 mapValue!24818))))

(declare-fun b!839769 () Bool)

(declare-fun res!570951 () Bool)

(assert (=> b!839769 (=> (not res!570951) (not e!468630))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839769 (= res!570951 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23091 _keys!868))))))

(declare-fun b!839770 () Bool)

(assert (=> b!839770 (= e!468629 tp_is_empty!15479)))

(declare-fun b!839771 () Bool)

(declare-fun e!468633 () Bool)

(assert (=> b!839771 (= e!468633 (and e!468634 mapRes!24818))))

(declare-fun condMapEmpty!24818 () Bool)

(declare-fun mapDefault!24818 () ValueCell!7300)

