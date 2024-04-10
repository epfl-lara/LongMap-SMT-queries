; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43136 () Bool)

(assert start!43136)

(declare-fun b!478364 () Bool)

(declare-fun e!281237 () Bool)

(declare-datatypes ((array!30781 0))(
  ( (array!30782 (arr!14801 (Array (_ BitVec 32) (_ BitVec 64))) (size!15159 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30781)

(assert (=> b!478364 (= e!281237 (and (bvsle #b00000000000000000000000000000000 (size!15159 _keys!1874)) (bvsge (size!15159 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478365 () Bool)

(declare-fun res!285414 () Bool)

(assert (=> b!478365 (=> (not res!285414) (not e!281237))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30781 (_ BitVec 32)) Bool)

(assert (=> b!478365 (= res!285414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478366 () Bool)

(declare-fun e!281238 () Bool)

(declare-fun tp_is_empty!13555 () Bool)

(assert (=> b!478366 (= e!281238 tp_is_empty!13555)))

(declare-fun b!478367 () Bool)

(declare-fun e!281239 () Bool)

(declare-fun e!281236 () Bool)

(declare-fun mapRes!22018 () Bool)

(assert (=> b!478367 (= e!281239 (and e!281236 mapRes!22018))))

(declare-fun condMapEmpty!22018 () Bool)

(declare-datatypes ((V!19145 0))(
  ( (V!19146 (val!6825 Int)) )
))
(declare-datatypes ((ValueCell!6416 0))(
  ( (ValueCellFull!6416 (v!9113 V!19145)) (EmptyCell!6416) )
))
(declare-datatypes ((array!30783 0))(
  ( (array!30784 (arr!14802 (Array (_ BitVec 32) ValueCell!6416)) (size!15160 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30783)

(declare-fun mapDefault!22018 () ValueCell!6416)

