; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35382 () Bool)

(assert start!35382)

(declare-fun b!354224 () Bool)

(declare-fun res!196370 () Bool)

(declare-fun e!217057 () Bool)

(assert (=> b!354224 (=> (not res!196370) (not e!217057))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19257 0))(
  ( (array!19258 (arr!9122 (Array (_ BitVec 32) (_ BitVec 64))) (size!9474 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19257)

(declare-datatypes ((V!11423 0))(
  ( (V!11424 (val!3962 Int)) )
))
(declare-datatypes ((ValueCell!3574 0))(
  ( (ValueCellFull!3574 (v!6156 V!11423)) (EmptyCell!3574) )
))
(declare-datatypes ((array!19259 0))(
  ( (array!19260 (arr!9123 (Array (_ BitVec 32) ValueCell!3574)) (size!9475 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19259)

(assert (=> b!354224 (= res!196370 (and (= (size!9475 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9474 _keys!1456) (size!9475 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354225 () Bool)

(declare-fun e!217059 () Bool)

(declare-fun tp_is_empty!7835 () Bool)

(assert (=> b!354225 (= e!217059 tp_is_empty!7835)))

(declare-fun b!354226 () Bool)

(declare-fun e!217058 () Bool)

(declare-fun mapRes!13260 () Bool)

(assert (=> b!354226 (= e!217058 (and e!217059 mapRes!13260))))

(declare-fun condMapEmpty!13260 () Bool)

(declare-fun mapDefault!13260 () ValueCell!3574)

