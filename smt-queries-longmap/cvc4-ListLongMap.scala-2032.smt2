; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35352 () Bool)

(assert start!35352)

(declare-fun b!354025 () Bool)

(declare-fun res!196272 () Bool)

(declare-fun e!216897 () Bool)

(assert (=> b!354025 (=> (not res!196272) (not e!216897))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19223 0))(
  ( (array!19224 (arr!9106 (Array (_ BitVec 32) (_ BitVec 64))) (size!9458 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19223)

(declare-datatypes ((V!11399 0))(
  ( (V!11400 (val!3953 Int)) )
))
(declare-datatypes ((ValueCell!3565 0))(
  ( (ValueCellFull!3565 (v!6147 V!11399)) (EmptyCell!3565) )
))
(declare-datatypes ((array!19225 0))(
  ( (array!19226 (arr!9107 (Array (_ BitVec 32) ValueCell!3565)) (size!9459 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19225)

(assert (=> b!354025 (= res!196272 (and (= (size!9459 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9458 _keys!1456) (size!9459 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354026 () Bool)

(declare-fun res!196274 () Bool)

(assert (=> b!354026 (=> (not res!196274) (not e!216897))))

(declare-datatypes ((List!5286 0))(
  ( (Nil!5283) (Cons!5282 (h!6138 (_ BitVec 64)) (t!10436 List!5286)) )
))
(declare-fun arrayNoDuplicates!0 (array!19223 (_ BitVec 32) List!5286) Bool)

(assert (=> b!354026 (= res!196274 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5283))))

(declare-fun b!354027 () Bool)

(declare-fun e!216898 () Bool)

(declare-fun e!216896 () Bool)

(declare-fun mapRes!13230 () Bool)

(assert (=> b!354027 (= e!216898 (and e!216896 mapRes!13230))))

(declare-fun condMapEmpty!13230 () Bool)

(declare-fun mapDefault!13230 () ValueCell!3565)

