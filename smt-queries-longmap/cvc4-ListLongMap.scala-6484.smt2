; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82748 () Bool)

(assert start!82748)

(declare-fun b_free!18881 () Bool)

(declare-fun b_next!18881 () Bool)

(assert (=> start!82748 (= b_free!18881 (not b_next!18881))))

(declare-fun tp!65762 () Bool)

(declare-fun b_and!30369 () Bool)

(assert (=> start!82748 (= tp!65762 b_and!30369)))

(declare-fun res!646041 () Bool)

(declare-fun e!544074 () Bool)

(assert (=> start!82748 (=> (not res!646041) (not e!544074))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82748 (= res!646041 (validMask!0 mask!2110))))

(assert (=> start!82748 e!544074))

(assert (=> start!82748 true))

(declare-datatypes ((V!33893 0))(
  ( (V!33894 (val!10892 Int)) )
))
(declare-datatypes ((ValueCell!10360 0))(
  ( (ValueCellFull!10360 (v!13450 V!33893)) (EmptyCell!10360) )
))
(declare-datatypes ((array!59451 0))(
  ( (array!59452 (arr!28594 (Array (_ BitVec 32) ValueCell!10360)) (size!29073 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59451)

(declare-fun e!544076 () Bool)

(declare-fun array_inv!22143 (array!59451) Bool)

(assert (=> start!82748 (and (array_inv!22143 _values!1400) e!544076)))

(declare-datatypes ((array!59453 0))(
  ( (array!59454 (arr!28595 (Array (_ BitVec 32) (_ BitVec 64))) (size!29074 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59453)

(declare-fun array_inv!22144 (array!59453) Bool)

(assert (=> start!82748 (array_inv!22144 _keys!1686)))

(assert (=> start!82748 tp!65762))

(declare-fun tp_is_empty!21683 () Bool)

(assert (=> start!82748 tp_is_empty!21683))

(declare-fun b!965138 () Bool)

(declare-fun e!544075 () Bool)

(declare-fun mapRes!34519 () Bool)

(assert (=> b!965138 (= e!544076 (and e!544075 mapRes!34519))))

(declare-fun condMapEmpty!34519 () Bool)

(declare-fun mapDefault!34519 () ValueCell!10360)

