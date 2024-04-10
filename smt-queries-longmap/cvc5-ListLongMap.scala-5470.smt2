; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72604 () Bool)

(assert start!72604)

(declare-fun b!842807 () Bool)

(declare-fun res!572798 () Bool)

(declare-fun e!470149 () Bool)

(assert (=> b!842807 (=> (not res!572798) (not e!470149))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47576 0))(
  ( (array!47577 (arr!22819 (Array (_ BitVec 32) (_ BitVec 64))) (size!23259 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47576)

(declare-datatypes ((V!25921 0))(
  ( (V!25922 (val!7875 Int)) )
))
(declare-datatypes ((ValueCell!7388 0))(
  ( (ValueCellFull!7388 (v!10300 V!25921)) (EmptyCell!7388) )
))
(declare-datatypes ((array!47578 0))(
  ( (array!47579 (arr!22820 (Array (_ BitVec 32) ValueCell!7388)) (size!23260 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47578)

(assert (=> b!842807 (= res!572798 (and (= (size!23260 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23259 _keys!868) (size!23260 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842808 () Bool)

(declare-fun res!572799 () Bool)

(assert (=> b!842808 (=> (not res!572799) (not e!470149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47576 (_ BitVec 32)) Bool)

(assert (=> b!842808 (= res!572799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25082 () Bool)

(declare-fun mapRes!25082 () Bool)

(assert (=> mapIsEmpty!25082 mapRes!25082))

(declare-fun b!842809 () Bool)

(declare-fun e!470151 () Bool)

(declare-fun tp_is_empty!15655 () Bool)

(assert (=> b!842809 (= e!470151 tp_is_empty!15655)))

(declare-fun b!842810 () Bool)

(declare-fun res!572801 () Bool)

(assert (=> b!842810 (=> (not res!572801) (not e!470149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842810 (= res!572801 (validMask!0 mask!1196))))

(declare-fun b!842811 () Bool)

(declare-fun e!470152 () Bool)

(declare-fun e!470150 () Bool)

(assert (=> b!842811 (= e!470152 (and e!470150 mapRes!25082))))

(declare-fun condMapEmpty!25082 () Bool)

(declare-fun mapDefault!25082 () ValueCell!7388)

