; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77664 () Bool)

(assert start!77664)

(declare-fun b_free!16249 () Bool)

(declare-fun b_next!16249 () Bool)

(assert (=> start!77664 (= b_free!16249 (not b_next!16249))))

(declare-fun tp!57008 () Bool)

(declare-fun b_and!26651 () Bool)

(assert (=> start!77664 (= tp!57008 b_and!26651)))

(declare-fun b!905615 () Bool)

(declare-fun res!611127 () Bool)

(declare-fun e!507486 () Bool)

(assert (=> b!905615 (=> (not res!611127) (not e!507486))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905615 (= res!611127 (inRange!0 i!717 mask!1756))))

(declare-fun b!905616 () Bool)

(declare-fun e!507489 () Bool)

(declare-fun tp_is_empty!18667 () Bool)

(assert (=> b!905616 (= e!507489 tp_is_empty!18667)))

(declare-fun b!905617 () Bool)

(declare-fun res!611126 () Bool)

(declare-fun e!507483 () Bool)

(assert (=> b!905617 (=> (not res!611126) (not e!507483))))

(declare-datatypes ((array!53376 0))(
  ( (array!53377 (arr!25647 (Array (_ BitVec 32) (_ BitVec 64))) (size!26106 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53376)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53376 (_ BitVec 32)) Bool)

(assert (=> b!905617 (= res!611126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905618 () Bool)

(declare-fun e!507484 () Bool)

(declare-fun mapRes!29713 () Bool)

(assert (=> b!905618 (= e!507484 (and e!507489 mapRes!29713))))

(declare-fun condMapEmpty!29713 () Bool)

(declare-datatypes ((V!29855 0))(
  ( (V!29856 (val!9384 Int)) )
))
(declare-datatypes ((ValueCell!8852 0))(
  ( (ValueCellFull!8852 (v!11889 V!29855)) (EmptyCell!8852) )
))
(declare-datatypes ((array!53378 0))(
  ( (array!53379 (arr!25648 (Array (_ BitVec 32) ValueCell!8852)) (size!26107 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53378)

(declare-fun mapDefault!29713 () ValueCell!8852)

