; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43166 () Bool)

(assert start!43166)

(declare-fun b!478533 () Bool)

(declare-fun res!285502 () Bool)

(declare-fun e!281363 () Bool)

(assert (=> b!478533 (=> (not res!285502) (not e!281363))))

(declare-datatypes ((array!30809 0))(
  ( (array!30810 (arr!14813 (Array (_ BitVec 32) (_ BitVec 64))) (size!15171 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30809)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30809 (_ BitVec 32)) Bool)

(assert (=> b!478533 (= res!285502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478534 () Bool)

(declare-fun e!281364 () Bool)

(declare-fun tp_is_empty!13567 () Bool)

(assert (=> b!478534 (= e!281364 tp_is_empty!13567)))

(declare-fun b!478535 () Bool)

(declare-fun e!281366 () Bool)

(declare-fun mapRes!22042 () Bool)

(assert (=> b!478535 (= e!281366 (and e!281364 mapRes!22042))))

(declare-fun condMapEmpty!22042 () Bool)

(declare-datatypes ((V!19161 0))(
  ( (V!19162 (val!6831 Int)) )
))
(declare-datatypes ((ValueCell!6422 0))(
  ( (ValueCellFull!6422 (v!9119 V!19161)) (EmptyCell!6422) )
))
(declare-datatypes ((array!30811 0))(
  ( (array!30812 (arr!14814 (Array (_ BitVec 32) ValueCell!6422)) (size!15172 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30811)

(declare-fun mapDefault!22042 () ValueCell!6422)

