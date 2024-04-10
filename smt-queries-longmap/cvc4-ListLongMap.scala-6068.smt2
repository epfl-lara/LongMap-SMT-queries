; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78520 () Bool)

(assert start!78520)

(declare-fun mapNonEmpty!30618 () Bool)

(declare-fun mapRes!30618 () Bool)

(declare-fun tp!58685 () Bool)

(declare-fun e!513721 () Bool)

(assert (=> mapNonEmpty!30618 (= mapRes!30618 (and tp!58685 e!513721))))

(declare-datatypes ((V!30619 0))(
  ( (V!30620 (val!9671 Int)) )
))
(declare-datatypes ((ValueCell!9139 0))(
  ( (ValueCellFull!9139 (v!12189 V!30619)) (EmptyCell!9139) )
))
(declare-fun mapRest!30618 () (Array (_ BitVec 32) ValueCell!9139))

(declare-fun mapValue!30618 () ValueCell!9139)

(declare-fun mapKey!30618 () (_ BitVec 32))

(declare-datatypes ((array!54480 0))(
  ( (array!54481 (arr!26185 (Array (_ BitVec 32) ValueCell!9139)) (size!26644 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54480)

(assert (=> mapNonEmpty!30618 (= (arr!26185 _values!1231) (store mapRest!30618 mapKey!30618 mapValue!30618))))

(declare-fun b!915372 () Bool)

(declare-fun e!513718 () Bool)

(assert (=> b!915372 (= e!513718 false)))

(declare-fun lt!411661 () Bool)

(declare-datatypes ((array!54482 0))(
  ( (array!54483 (arr!26186 (Array (_ BitVec 32) (_ BitVec 64))) (size!26645 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54482)

(declare-datatypes ((List!18369 0))(
  ( (Nil!18366) (Cons!18365 (h!19511 (_ BitVec 64)) (t!25982 List!18369)) )
))
(declare-fun arrayNoDuplicates!0 (array!54482 (_ BitVec 32) List!18369) Bool)

(assert (=> b!915372 (= lt!411661 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18366))))

(declare-fun mapIsEmpty!30618 () Bool)

(assert (=> mapIsEmpty!30618 mapRes!30618))

(declare-fun b!915373 () Bool)

(declare-fun res!617174 () Bool)

(assert (=> b!915373 (=> (not res!617174) (not e!513718))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54482 (_ BitVec 32)) Bool)

(assert (=> b!915373 (= res!617174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915374 () Bool)

(declare-fun e!513720 () Bool)

(declare-fun e!513719 () Bool)

(assert (=> b!915374 (= e!513720 (and e!513719 mapRes!30618))))

(declare-fun condMapEmpty!30618 () Bool)

(declare-fun mapDefault!30618 () ValueCell!9139)

