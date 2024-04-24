; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35376 () Bool)

(assert start!35376)

(declare-fun b!354243 () Bool)

(declare-fun e!217086 () Bool)

(declare-fun tp_is_empty!7843 () Bool)

(assert (=> b!354243 (= e!217086 tp_is_empty!7843)))

(declare-fun b!354244 () Bool)

(declare-fun res!196405 () Bool)

(declare-fun e!217085 () Bool)

(assert (=> b!354244 (=> (not res!196405) (not e!217085))))

(declare-datatypes ((array!19262 0))(
  ( (array!19263 (arr!9124 (Array (_ BitVec 32) (_ BitVec 64))) (size!9476 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19262)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19262 (_ BitVec 32)) Bool)

(assert (=> b!354244 (= res!196405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354245 () Bool)

(declare-fun e!217084 () Bool)

(declare-fun e!217083 () Bool)

(declare-fun mapRes!13272 () Bool)

(assert (=> b!354245 (= e!217084 (and e!217083 mapRes!13272))))

(declare-fun condMapEmpty!13272 () Bool)

(declare-datatypes ((V!11435 0))(
  ( (V!11436 (val!3966 Int)) )
))
(declare-datatypes ((ValueCell!3578 0))(
  ( (ValueCellFull!3578 (v!6161 V!11435)) (EmptyCell!3578) )
))
(declare-datatypes ((array!19264 0))(
  ( (array!19265 (arr!9125 (Array (_ BitVec 32) ValueCell!3578)) (size!9477 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19264)

(declare-fun mapDefault!13272 () ValueCell!3578)

(assert (=> b!354245 (= condMapEmpty!13272 (= (arr!9125 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3578)) mapDefault!13272)))))

(declare-fun mapIsEmpty!13272 () Bool)

(assert (=> mapIsEmpty!13272 mapRes!13272))

(declare-fun b!354246 () Bool)

(assert (=> b!354246 (= e!217083 tp_is_empty!7843)))

(declare-fun res!196403 () Bool)

(assert (=> start!35376 (=> (not res!196403) (not e!217085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35376 (= res!196403 (validMask!0 mask!1842))))

(assert (=> start!35376 e!217085))

(assert (=> start!35376 true))

(declare-fun array_inv!6740 (array!19264) Bool)

(assert (=> start!35376 (and (array_inv!6740 _values!1208) e!217084)))

(declare-fun array_inv!6741 (array!19262) Bool)

(assert (=> start!35376 (array_inv!6741 _keys!1456)))

(declare-fun b!354247 () Bool)

(assert (=> b!354247 (= e!217085 false)))

(declare-fun lt!165698 () Bool)

(declare-datatypes ((List!5198 0))(
  ( (Nil!5195) (Cons!5194 (h!6050 (_ BitVec 64)) (t!10340 List!5198)) )
))
(declare-fun arrayNoDuplicates!0 (array!19262 (_ BitVec 32) List!5198) Bool)

(assert (=> b!354247 (= lt!165698 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5195))))

(declare-fun mapNonEmpty!13272 () Bool)

(declare-fun tp!27168 () Bool)

(assert (=> mapNonEmpty!13272 (= mapRes!13272 (and tp!27168 e!217086))))

(declare-fun mapRest!13272 () (Array (_ BitVec 32) ValueCell!3578))

(declare-fun mapValue!13272 () ValueCell!3578)

(declare-fun mapKey!13272 () (_ BitVec 32))

(assert (=> mapNonEmpty!13272 (= (arr!9125 _values!1208) (store mapRest!13272 mapKey!13272 mapValue!13272))))

(declare-fun b!354248 () Bool)

(declare-fun res!196404 () Bool)

(assert (=> b!354248 (=> (not res!196404) (not e!217085))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354248 (= res!196404 (and (= (size!9477 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9476 _keys!1456) (size!9477 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35376 res!196403) b!354248))

(assert (= (and b!354248 res!196404) b!354244))

(assert (= (and b!354244 res!196405) b!354247))

(assert (= (and b!354245 condMapEmpty!13272) mapIsEmpty!13272))

(assert (= (and b!354245 (not condMapEmpty!13272)) mapNonEmpty!13272))

(get-info :version)

(assert (= (and mapNonEmpty!13272 ((_ is ValueCellFull!3578) mapValue!13272)) b!354243))

(assert (= (and b!354245 ((_ is ValueCellFull!3578) mapDefault!13272)) b!354246))

(assert (= start!35376 b!354245))

(declare-fun m!353583 () Bool)

(assert (=> b!354244 m!353583))

(declare-fun m!353585 () Bool)

(assert (=> start!35376 m!353585))

(declare-fun m!353587 () Bool)

(assert (=> start!35376 m!353587))

(declare-fun m!353589 () Bool)

(assert (=> start!35376 m!353589))

(declare-fun m!353591 () Bool)

(assert (=> b!354247 m!353591))

(declare-fun m!353593 () Bool)

(assert (=> mapNonEmpty!13272 m!353593))

(check-sat tp_is_empty!7843 (not start!35376) (not mapNonEmpty!13272) (not b!354244) (not b!354247))
(check-sat)
