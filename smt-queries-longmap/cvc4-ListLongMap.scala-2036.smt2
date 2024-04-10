; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35388 () Bool)

(assert start!35388)

(declare-fun b!354278 () Bool)

(declare-fun e!217102 () Bool)

(assert (=> b!354278 (= e!217102 false)))

(declare-fun lt!165677 () Bool)

(declare-datatypes ((array!19269 0))(
  ( (array!19270 (arr!9128 (Array (_ BitVec 32) (_ BitVec 64))) (size!9480 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19269)

(declare-datatypes ((List!5292 0))(
  ( (Nil!5289) (Cons!5288 (h!6144 (_ BitVec 64)) (t!10442 List!5292)) )
))
(declare-fun arrayNoDuplicates!0 (array!19269 (_ BitVec 32) List!5292) Bool)

(assert (=> b!354278 (= lt!165677 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5289))))

(declare-fun mapNonEmpty!13269 () Bool)

(declare-fun mapRes!13269 () Bool)

(declare-fun tp!27165 () Bool)

(declare-fun e!217106 () Bool)

(assert (=> mapNonEmpty!13269 (= mapRes!13269 (and tp!27165 e!217106))))

(declare-datatypes ((V!11431 0))(
  ( (V!11432 (val!3965 Int)) )
))
(declare-datatypes ((ValueCell!3577 0))(
  ( (ValueCellFull!3577 (v!6159 V!11431)) (EmptyCell!3577) )
))
(declare-fun mapValue!13269 () ValueCell!3577)

(declare-fun mapKey!13269 () (_ BitVec 32))

(declare-datatypes ((array!19271 0))(
  ( (array!19272 (arr!9129 (Array (_ BitVec 32) ValueCell!3577)) (size!9481 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19271)

(declare-fun mapRest!13269 () (Array (_ BitVec 32) ValueCell!3577))

(assert (=> mapNonEmpty!13269 (= (arr!9129 _values!1208) (store mapRest!13269 mapKey!13269 mapValue!13269))))

(declare-fun b!354279 () Bool)

(declare-fun res!196397 () Bool)

(assert (=> b!354279 (=> (not res!196397) (not e!217102))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19269 (_ BitVec 32)) Bool)

(assert (=> b!354279 (= res!196397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196398 () Bool)

(assert (=> start!35388 (=> (not res!196398) (not e!217102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35388 (= res!196398 (validMask!0 mask!1842))))

(assert (=> start!35388 e!217102))

(assert (=> start!35388 true))

(declare-fun e!217103 () Bool)

(declare-fun array_inv!6714 (array!19271) Bool)

(assert (=> start!35388 (and (array_inv!6714 _values!1208) e!217103)))

(declare-fun array_inv!6715 (array!19269) Bool)

(assert (=> start!35388 (array_inv!6715 _keys!1456)))

(declare-fun mapIsEmpty!13269 () Bool)

(assert (=> mapIsEmpty!13269 mapRes!13269))

(declare-fun b!354280 () Bool)

(declare-fun res!196399 () Bool)

(assert (=> b!354280 (=> (not res!196399) (not e!217102))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354280 (= res!196399 (and (= (size!9481 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9480 _keys!1456) (size!9481 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354281 () Bool)

(declare-fun e!217104 () Bool)

(declare-fun tp_is_empty!7841 () Bool)

(assert (=> b!354281 (= e!217104 tp_is_empty!7841)))

(declare-fun b!354282 () Bool)

(assert (=> b!354282 (= e!217106 tp_is_empty!7841)))

(declare-fun b!354283 () Bool)

(assert (=> b!354283 (= e!217103 (and e!217104 mapRes!13269))))

(declare-fun condMapEmpty!13269 () Bool)

(declare-fun mapDefault!13269 () ValueCell!3577)

