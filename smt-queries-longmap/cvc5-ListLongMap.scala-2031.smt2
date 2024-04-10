; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35342 () Bool)

(assert start!35342)

(declare-fun mapNonEmpty!13215 () Bool)

(declare-fun mapRes!13215 () Bool)

(declare-fun tp!27111 () Bool)

(declare-fun e!216820 () Bool)

(assert (=> mapNonEmpty!13215 (= mapRes!13215 (and tp!27111 e!216820))))

(declare-datatypes ((V!11387 0))(
  ( (V!11388 (val!3948 Int)) )
))
(declare-datatypes ((ValueCell!3560 0))(
  ( (ValueCellFull!3560 (v!6142 V!11387)) (EmptyCell!3560) )
))
(declare-fun mapRest!13215 () (Array (_ BitVec 32) ValueCell!3560))

(declare-fun mapKey!13215 () (_ BitVec 32))

(declare-fun mapValue!13215 () ValueCell!3560)

(declare-datatypes ((array!19207 0))(
  ( (array!19208 (arr!9098 (Array (_ BitVec 32) ValueCell!3560)) (size!9450 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19207)

(assert (=> mapNonEmpty!13215 (= (arr!9098 _values!1208) (store mapRest!13215 mapKey!13215 mapValue!13215))))

(declare-fun mapIsEmpty!13215 () Bool)

(assert (=> mapIsEmpty!13215 mapRes!13215))

(declare-fun b!353919 () Bool)

(declare-fun res!196211 () Bool)

(declare-fun e!216823 () Bool)

(assert (=> b!353919 (=> (not res!196211) (not e!216823))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19209 0))(
  ( (array!19210 (arr!9099 (Array (_ BitVec 32) (_ BitVec 64))) (size!9451 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19209)

(assert (=> b!353919 (= res!196211 (and (= (size!9450 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9451 _keys!1456) (size!9450 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353920 () Bool)

(declare-fun res!196213 () Bool)

(assert (=> b!353920 (=> (not res!196213) (not e!216823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19209 (_ BitVec 32)) Bool)

(assert (=> b!353920 (= res!196213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353921 () Bool)

(declare-fun e!216824 () Bool)

(declare-fun e!216822 () Bool)

(assert (=> b!353921 (= e!216824 (and e!216822 mapRes!13215))))

(declare-fun condMapEmpty!13215 () Bool)

(declare-fun mapDefault!13215 () ValueCell!3560)

