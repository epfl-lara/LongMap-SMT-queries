; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35384 () Bool)

(assert start!35384)

(declare-fun b!354242 () Bool)

(declare-fun e!217075 () Bool)

(assert (=> b!354242 (= e!217075 false)))

(declare-fun lt!165671 () Bool)

(declare-datatypes ((array!19261 0))(
  ( (array!19262 (arr!9124 (Array (_ BitVec 32) (_ BitVec 64))) (size!9476 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19261)

(declare-datatypes ((List!5290 0))(
  ( (Nil!5287) (Cons!5286 (h!6142 (_ BitVec 64)) (t!10440 List!5290)) )
))
(declare-fun arrayNoDuplicates!0 (array!19261 (_ BitVec 32) List!5290) Bool)

(assert (=> b!354242 (= lt!165671 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5287))))

(declare-fun mapNonEmpty!13263 () Bool)

(declare-fun mapRes!13263 () Bool)

(declare-fun tp!27159 () Bool)

(declare-fun e!217073 () Bool)

(assert (=> mapNonEmpty!13263 (= mapRes!13263 (and tp!27159 e!217073))))

(declare-fun mapKey!13263 () (_ BitVec 32))

(declare-datatypes ((V!11427 0))(
  ( (V!11428 (val!3963 Int)) )
))
(declare-datatypes ((ValueCell!3575 0))(
  ( (ValueCellFull!3575 (v!6157 V!11427)) (EmptyCell!3575) )
))
(declare-fun mapValue!13263 () ValueCell!3575)

(declare-fun mapRest!13263 () (Array (_ BitVec 32) ValueCell!3575))

(declare-datatypes ((array!19263 0))(
  ( (array!19264 (arr!9125 (Array (_ BitVec 32) ValueCell!3575)) (size!9477 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19263)

(assert (=> mapNonEmpty!13263 (= (arr!9125 _values!1208) (store mapRest!13263 mapKey!13263 mapValue!13263))))

(declare-fun b!354243 () Bool)

(declare-fun res!196379 () Bool)

(assert (=> b!354243 (=> (not res!196379) (not e!217075))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!354243 (= res!196379 (and (= (size!9477 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9476 _keys!1456) (size!9477 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354244 () Bool)

(declare-fun e!217072 () Bool)

(declare-fun e!217074 () Bool)

(assert (=> b!354244 (= e!217072 (and e!217074 mapRes!13263))))

(declare-fun condMapEmpty!13263 () Bool)

(declare-fun mapDefault!13263 () ValueCell!3575)

