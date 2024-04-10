; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35390 () Bool)

(assert start!35390)

(declare-fun b!354297 () Bool)

(declare-fun e!217118 () Bool)

(declare-fun tp_is_empty!7843 () Bool)

(assert (=> b!354297 (= e!217118 tp_is_empty!7843)))

(declare-fun b!354298 () Bool)

(declare-fun e!217119 () Bool)

(assert (=> b!354298 (= e!217119 tp_is_empty!7843)))

(declare-fun b!354299 () Bool)

(declare-fun res!196408 () Bool)

(declare-fun e!217120 () Bool)

(assert (=> b!354299 (=> (not res!196408) (not e!217120))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11435 0))(
  ( (V!11436 (val!3966 Int)) )
))
(declare-datatypes ((ValueCell!3578 0))(
  ( (ValueCellFull!3578 (v!6160 V!11435)) (EmptyCell!3578) )
))
(declare-datatypes ((array!19273 0))(
  ( (array!19274 (arr!9130 (Array (_ BitVec 32) ValueCell!3578)) (size!9482 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19273)

(declare-datatypes ((array!19275 0))(
  ( (array!19276 (arr!9131 (Array (_ BitVec 32) (_ BitVec 64))) (size!9483 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19275)

(assert (=> b!354299 (= res!196408 (and (= (size!9482 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9483 _keys!1456) (size!9482 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13272 () Bool)

(declare-fun mapRes!13272 () Bool)

(declare-fun tp!27168 () Bool)

(assert (=> mapNonEmpty!13272 (= mapRes!13272 (and tp!27168 e!217118))))

(declare-fun mapValue!13272 () ValueCell!3578)

(declare-fun mapRest!13272 () (Array (_ BitVec 32) ValueCell!3578))

(declare-fun mapKey!13272 () (_ BitVec 32))

(assert (=> mapNonEmpty!13272 (= (arr!9130 _values!1208) (store mapRest!13272 mapKey!13272 mapValue!13272))))

(declare-fun mapIsEmpty!13272 () Bool)

(assert (=> mapIsEmpty!13272 mapRes!13272))

(declare-fun b!354296 () Bool)

(assert (=> b!354296 (= e!217120 false)))

(declare-fun lt!165680 () Bool)

(declare-datatypes ((List!5293 0))(
  ( (Nil!5290) (Cons!5289 (h!6145 (_ BitVec 64)) (t!10443 List!5293)) )
))
(declare-fun arrayNoDuplicates!0 (array!19275 (_ BitVec 32) List!5293) Bool)

(assert (=> b!354296 (= lt!165680 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5290))))

(declare-fun res!196407 () Bool)

(assert (=> start!35390 (=> (not res!196407) (not e!217120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35390 (= res!196407 (validMask!0 mask!1842))))

(assert (=> start!35390 e!217120))

(assert (=> start!35390 true))

(declare-fun e!217117 () Bool)

(declare-fun array_inv!6716 (array!19273) Bool)

(assert (=> start!35390 (and (array_inv!6716 _values!1208) e!217117)))

(declare-fun array_inv!6717 (array!19275) Bool)

(assert (=> start!35390 (array_inv!6717 _keys!1456)))

(declare-fun b!354300 () Bool)

(assert (=> b!354300 (= e!217117 (and e!217119 mapRes!13272))))

(declare-fun condMapEmpty!13272 () Bool)

(declare-fun mapDefault!13272 () ValueCell!3578)

