; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72794 () Bool)

(assert start!72794)

(declare-fun b!844802 () Bool)

(declare-fun e!471576 () Bool)

(declare-fun tp_is_empty!15845 () Bool)

(assert (=> b!844802 (= e!471576 tp_is_empty!15845)))

(declare-fun b!844803 () Bool)

(declare-fun e!471577 () Bool)

(assert (=> b!844803 (= e!471577 tp_is_empty!15845)))

(declare-fun mapNonEmpty!25367 () Bool)

(declare-fun mapRes!25367 () Bool)

(declare-fun tp!48685 () Bool)

(assert (=> mapNonEmpty!25367 (= mapRes!25367 (and tp!48685 e!471576))))

(declare-fun mapKey!25367 () (_ BitVec 32))

(declare-datatypes ((V!26173 0))(
  ( (V!26174 (val!7970 Int)) )
))
(declare-datatypes ((ValueCell!7483 0))(
  ( (ValueCellFull!7483 (v!10395 V!26173)) (EmptyCell!7483) )
))
(declare-fun mapValue!25367 () ValueCell!7483)

(declare-fun mapRest!25367 () (Array (_ BitVec 32) ValueCell!7483))

(declare-datatypes ((array!47916 0))(
  ( (array!47917 (arr!22989 (Array (_ BitVec 32) ValueCell!7483)) (size!23429 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47916)

(assert (=> mapNonEmpty!25367 (= (arr!22989 _values!688) (store mapRest!25367 mapKey!25367 mapValue!25367))))

(declare-fun b!844804 () Bool)

(declare-fun res!573938 () Bool)

(declare-fun e!471575 () Bool)

(assert (=> b!844804 (=> (not res!573938) (not e!471575))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47918 0))(
  ( (array!47919 (arr!22990 (Array (_ BitVec 32) (_ BitVec 64))) (size!23430 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47918)

(assert (=> b!844804 (= res!573938 (and (= (size!23429 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23430 _keys!868) (size!23429 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844805 () Bool)

(declare-fun e!471574 () Bool)

(assert (=> b!844805 (= e!471574 (and e!471577 mapRes!25367))))

(declare-fun condMapEmpty!25367 () Bool)

(declare-fun mapDefault!25367 () ValueCell!7483)

