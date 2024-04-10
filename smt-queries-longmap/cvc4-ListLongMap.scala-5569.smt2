; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73202 () Bool)

(assert start!73202)

(declare-fun b_free!14117 () Bool)

(declare-fun b_next!14117 () Bool)

(assert (=> start!73202 (= b_free!14117 (not b_next!14117))))

(declare-fun tp!49855 () Bool)

(declare-fun b_and!23393 () Bool)

(assert (=> start!73202 (= tp!49855 b_and!23393)))

(declare-fun res!579279 () Bool)

(declare-fun e!475665 () Bool)

(assert (=> start!73202 (=> (not res!579279) (not e!475665))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48704 0))(
  ( (array!48705 (arr!23383 (Array (_ BitVec 32) (_ BitVec 64))) (size!23823 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48704)

(assert (=> start!73202 (= res!579279 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23823 _keys!868))))))

(assert (=> start!73202 e!475665))

(declare-fun tp_is_empty!16253 () Bool)

(assert (=> start!73202 tp_is_empty!16253))

(assert (=> start!73202 true))

(assert (=> start!73202 tp!49855))

(declare-fun array_inv!18540 (array!48704) Bool)

(assert (=> start!73202 (array_inv!18540 _keys!868)))

(declare-datatypes ((V!26717 0))(
  ( (V!26718 (val!8174 Int)) )
))
(declare-datatypes ((ValueCell!7687 0))(
  ( (ValueCellFull!7687 (v!10599 V!26717)) (EmptyCell!7687) )
))
(declare-datatypes ((array!48706 0))(
  ( (array!48707 (arr!23384 (Array (_ BitVec 32) ValueCell!7687)) (size!23824 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48706)

(declare-fun e!475667 () Bool)

(declare-fun array_inv!18541 (array!48706) Bool)

(assert (=> start!73202 (and (array_inv!18541 _values!688) e!475667)))

(declare-fun b!852904 () Bool)

(declare-fun e!475670 () Bool)

(assert (=> b!852904 (= e!475670 tp_is_empty!16253)))

(declare-fun mapNonEmpty!25979 () Bool)

(declare-fun mapRes!25979 () Bool)

(declare-fun tp!49854 () Bool)

(assert (=> mapNonEmpty!25979 (= mapRes!25979 (and tp!49854 e!475670))))

(declare-fun mapRest!25979 () (Array (_ BitVec 32) ValueCell!7687))

(declare-fun mapValue!25979 () ValueCell!7687)

(declare-fun mapKey!25979 () (_ BitVec 32))

(assert (=> mapNonEmpty!25979 (= (arr!23384 _values!688) (store mapRest!25979 mapKey!25979 mapValue!25979))))

(declare-fun mapIsEmpty!25979 () Bool)

(assert (=> mapIsEmpty!25979 mapRes!25979))

(declare-fun b!852905 () Bool)

(declare-fun e!475672 () Bool)

(assert (=> b!852905 (= e!475672 tp_is_empty!16253)))

(declare-fun b!852906 () Bool)

(declare-fun res!579280 () Bool)

(assert (=> b!852906 (=> (not res!579280) (not e!475665))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852906 (= res!579280 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23823 _keys!868))))))

(declare-fun b!852907 () Bool)

(assert (=> b!852907 (= e!475667 (and e!475672 mapRes!25979))))

(declare-fun condMapEmpty!25979 () Bool)

(declare-fun mapDefault!25979 () ValueCell!7687)

