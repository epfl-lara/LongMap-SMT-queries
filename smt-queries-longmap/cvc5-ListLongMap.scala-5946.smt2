; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77492 () Bool)

(assert start!77492)

(declare-fun b!903012 () Bool)

(declare-fun res!609304 () Bool)

(declare-fun e!505875 () Bool)

(assert (=> b!903012 (=> (not res!609304) (not e!505875))))

(declare-datatypes ((array!53068 0))(
  ( (array!53069 (arr!25494 (Array (_ BitVec 32) (_ BitVec 64))) (size!25953 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53068)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53068 (_ BitVec 32)) Bool)

(assert (=> b!903012 (= res!609304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903013 () Bool)

(declare-fun e!505878 () Bool)

(declare-fun tp_is_empty!18505 () Bool)

(assert (=> b!903013 (= e!505878 tp_is_empty!18505)))

(declare-fun mapNonEmpty!29467 () Bool)

(declare-fun mapRes!29467 () Bool)

(declare-fun tp!56526 () Bool)

(declare-fun e!505877 () Bool)

(assert (=> mapNonEmpty!29467 (= mapRes!29467 (and tp!56526 e!505877))))

(declare-datatypes ((V!29639 0))(
  ( (V!29640 (val!9303 Int)) )
))
(declare-datatypes ((ValueCell!8771 0))(
  ( (ValueCellFull!8771 (v!11808 V!29639)) (EmptyCell!8771) )
))
(declare-fun mapRest!29467 () (Array (_ BitVec 32) ValueCell!8771))

(declare-fun mapValue!29467 () ValueCell!8771)

(declare-fun mapKey!29467 () (_ BitVec 32))

(declare-datatypes ((array!53070 0))(
  ( (array!53071 (arr!25495 (Array (_ BitVec 32) ValueCell!8771)) (size!25954 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53070)

(assert (=> mapNonEmpty!29467 (= (arr!25495 _values!1152) (store mapRest!29467 mapKey!29467 mapValue!29467))))

(declare-fun mapIsEmpty!29467 () Bool)

(assert (=> mapIsEmpty!29467 mapRes!29467))

(declare-fun b!903014 () Bool)

(assert (=> b!903014 (= e!505877 tp_is_empty!18505)))

(declare-fun b!903015 () Bool)

(declare-fun e!505874 () Bool)

(assert (=> b!903015 (= e!505874 (and e!505878 mapRes!29467))))

(declare-fun condMapEmpty!29467 () Bool)

(declare-fun mapDefault!29467 () ValueCell!8771)

