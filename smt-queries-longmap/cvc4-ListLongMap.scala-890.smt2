; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20440 () Bool)

(assert start!20440)

(declare-fun b_free!5099 () Bool)

(declare-fun b_next!5099 () Bool)

(assert (=> start!20440 (= b_free!5099 (not b_next!5099))))

(declare-fun tp!18328 () Bool)

(declare-fun b_and!11845 () Bool)

(assert (=> start!20440 (= tp!18328 b_and!11845)))

(declare-fun b!202418 () Bool)

(declare-fun res!96992 () Bool)

(declare-fun e!132589 () Bool)

(assert (=> b!202418 (=> (not res!96992) (not e!132589))))

(declare-datatypes ((V!6253 0))(
  ( (V!6254 (val!2522 Int)) )
))
(declare-datatypes ((tuple2!3824 0))(
  ( (tuple2!3825 (_1!1923 (_ BitVec 64)) (_2!1923 V!6253)) )
))
(declare-datatypes ((List!2730 0))(
  ( (Nil!2727) (Cons!2726 (h!3368 tuple2!3824) (t!7661 List!2730)) )
))
(declare-datatypes ((ListLongMap!2737 0))(
  ( (ListLongMap!2738 (toList!1384 List!2730)) )
))
(declare-fun lt!101605 () ListLongMap!2737)

(declare-fun lt!101602 () tuple2!3824)

(declare-fun lt!101604 () ListLongMap!2737)

(declare-fun +!411 (ListLongMap!2737 tuple2!3824) ListLongMap!2737)

(assert (=> b!202418 (= res!96992 (= lt!101604 (+!411 lt!101605 lt!101602)))))

(declare-fun b!202419 () Bool)

(declare-fun res!96991 () Bool)

(declare-fun e!132587 () Bool)

(assert (=> b!202419 (=> (not res!96991) (not e!132587))))

(declare-datatypes ((array!9135 0))(
  ( (array!9136 (arr!4318 (Array (_ BitVec 32) (_ BitVec 64))) (size!4643 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9135)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9135 (_ BitVec 32)) Bool)

(assert (=> b!202419 (= res!96991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202420 () Bool)

(declare-fun res!96988 () Bool)

(assert (=> b!202420 (=> (not res!96988) (not e!132587))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202420 (= res!96988 (= (select (arr!4318 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!8501 () Bool)

(declare-fun mapRes!8501 () Bool)

(assert (=> mapIsEmpty!8501 mapRes!8501))

(declare-fun b!202421 () Bool)

(declare-fun e!132590 () Bool)

(declare-fun tp_is_empty!4955 () Bool)

(assert (=> b!202421 (= e!132590 tp_is_empty!4955)))

(declare-fun b!202422 () Bool)

(declare-fun res!96994 () Bool)

(assert (=> b!202422 (=> (not res!96994) (not e!132587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202422 (= res!96994 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8501 () Bool)

(declare-fun tp!18329 () Bool)

(declare-fun e!132588 () Bool)

(assert (=> mapNonEmpty!8501 (= mapRes!8501 (and tp!18329 e!132588))))

(declare-datatypes ((ValueCell!2134 0))(
  ( (ValueCellFull!2134 (v!4492 V!6253)) (EmptyCell!2134) )
))
(declare-fun mapRest!8501 () (Array (_ BitVec 32) ValueCell!2134))

(declare-fun mapValue!8501 () ValueCell!2134)

(declare-datatypes ((array!9137 0))(
  ( (array!9138 (arr!4319 (Array (_ BitVec 32) ValueCell!2134)) (size!4644 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9137)

(declare-fun mapKey!8501 () (_ BitVec 32))

(assert (=> mapNonEmpty!8501 (= (arr!4319 _values!649) (store mapRest!8501 mapKey!8501 mapValue!8501))))

(declare-fun b!202423 () Bool)

(declare-fun e!132591 () Bool)

(assert (=> b!202423 (= e!132591 (and e!132590 mapRes!8501))))

(declare-fun condMapEmpty!8501 () Bool)

(declare-fun mapDefault!8501 () ValueCell!2134)

