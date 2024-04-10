; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73186 () Bool)

(assert start!73186)

(declare-fun b_free!14101 () Bool)

(declare-fun b_next!14101 () Bool)

(assert (=> start!73186 (= b_free!14101 (not b_next!14101))))

(declare-fun tp!49806 () Bool)

(declare-fun b_and!23361 () Bool)

(assert (=> start!73186 (= tp!49806 b_and!23361)))

(declare-fun b!852528 () Bool)

(declare-fun e!475477 () Bool)

(declare-fun tp_is_empty!16237 () Bool)

(assert (=> b!852528 (= e!475477 tp_is_empty!16237)))

(declare-fun b!852529 () Bool)

(declare-fun res!579038 () Bool)

(declare-fun e!475473 () Bool)

(assert (=> b!852529 (=> (not res!579038) (not e!475473))))

(declare-datatypes ((array!48672 0))(
  ( (array!48673 (arr!23367 (Array (_ BitVec 32) (_ BitVec 64))) (size!23807 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48672)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48672 (_ BitVec 32)) Bool)

(assert (=> b!852529 (= res!579038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852530 () Bool)

(declare-fun e!475476 () Bool)

(declare-fun mapRes!25955 () Bool)

(assert (=> b!852530 (= e!475476 (and e!475477 mapRes!25955))))

(declare-fun condMapEmpty!25955 () Bool)

(declare-datatypes ((V!26697 0))(
  ( (V!26698 (val!8166 Int)) )
))
(declare-datatypes ((ValueCell!7679 0))(
  ( (ValueCellFull!7679 (v!10591 V!26697)) (EmptyCell!7679) )
))
(declare-datatypes ((array!48674 0))(
  ( (array!48675 (arr!23368 (Array (_ BitVec 32) ValueCell!7679)) (size!23808 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48674)

(declare-fun mapDefault!25955 () ValueCell!7679)

