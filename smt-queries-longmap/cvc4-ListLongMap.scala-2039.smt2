; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35406 () Bool)

(assert start!35406)

(declare-fun res!196480 () Bool)

(declare-fun e!217237 () Bool)

(assert (=> start!35406 (=> (not res!196480) (not e!217237))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35406 (= res!196480 (validMask!0 mask!1842))))

(assert (=> start!35406 e!217237))

(assert (=> start!35406 true))

(declare-datatypes ((V!11455 0))(
  ( (V!11456 (val!3974 Int)) )
))
(declare-datatypes ((ValueCell!3586 0))(
  ( (ValueCellFull!3586 (v!6168 V!11455)) (EmptyCell!3586) )
))
(declare-datatypes ((array!19301 0))(
  ( (array!19302 (arr!9144 (Array (_ BitVec 32) ValueCell!3586)) (size!9496 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19301)

(declare-fun e!217241 () Bool)

(declare-fun array_inv!6724 (array!19301) Bool)

(assert (=> start!35406 (and (array_inv!6724 _values!1208) e!217241)))

(declare-datatypes ((array!19303 0))(
  ( (array!19304 (arr!9145 (Array (_ BitVec 32) (_ BitVec 64))) (size!9497 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19303)

(declare-fun array_inv!6725 (array!19303) Bool)

(assert (=> start!35406 (array_inv!6725 _keys!1456)))

(declare-fun b!354440 () Bool)

(declare-fun e!217238 () Bool)

(declare-fun tp_is_empty!7859 () Bool)

(assert (=> b!354440 (= e!217238 tp_is_empty!7859)))

(declare-fun b!354441 () Bool)

(declare-fun mapRes!13296 () Bool)

(assert (=> b!354441 (= e!217241 (and e!217238 mapRes!13296))))

(declare-fun condMapEmpty!13296 () Bool)

(declare-fun mapDefault!13296 () ValueCell!3586)

