; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73004 () Bool)

(assert start!73004)

(declare-fun b_free!13919 () Bool)

(declare-fun b_next!13919 () Bool)

(assert (=> start!73004 (= b_free!13919 (not b_next!13919))))

(declare-fun tp!49260 () Bool)

(declare-fun b_and!23005 () Bool)

(assert (=> start!73004 (= tp!49260 b_and!23005)))

(declare-fun b!848260 () Bool)

(declare-fun e!473294 () Bool)

(declare-fun tp_is_empty!16055 () Bool)

(assert (=> b!848260 (= e!473294 tp_is_empty!16055)))

(declare-fun b!848261 () Bool)

(declare-fun e!473290 () Bool)

(declare-fun mapRes!25682 () Bool)

(assert (=> b!848261 (= e!473290 (and e!473294 mapRes!25682))))

(declare-fun condMapEmpty!25682 () Bool)

(declare-datatypes ((V!26453 0))(
  ( (V!26454 (val!8075 Int)) )
))
(declare-datatypes ((ValueCell!7588 0))(
  ( (ValueCellFull!7588 (v!10500 V!26453)) (EmptyCell!7588) )
))
(declare-datatypes ((array!48320 0))(
  ( (array!48321 (arr!23191 (Array (_ BitVec 32) ValueCell!7588)) (size!23631 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48320)

(declare-fun mapDefault!25682 () ValueCell!7588)

