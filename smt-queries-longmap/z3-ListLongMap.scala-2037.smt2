; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35376 () Bool)

(assert start!35376)

(declare-fun b!354021 () Bool)

(declare-fun e!216943 () Bool)

(declare-fun tp_is_empty!7843 () Bool)

(assert (=> b!354021 (= e!216943 tp_is_empty!7843)))

(declare-fun b!354022 () Bool)

(declare-fun res!196277 () Bool)

(declare-fun e!216944 () Bool)

(assert (=> b!354022 (=> (not res!196277) (not e!216944))))

(declare-datatypes ((array!19255 0))(
  ( (array!19256 (arr!9121 (Array (_ BitVec 32) (_ BitVec 64))) (size!9474 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19255)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19255 (_ BitVec 32)) Bool)

(assert (=> b!354022 (= res!196277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354023 () Bool)

(assert (=> b!354023 (= e!216944 false)))

(declare-fun lt!165445 () Bool)

(declare-datatypes ((List!5264 0))(
  ( (Nil!5261) (Cons!5260 (h!6116 (_ BitVec 64)) (t!10405 List!5264)) )
))
(declare-fun arrayNoDuplicates!0 (array!19255 (_ BitVec 32) List!5264) Bool)

(assert (=> b!354023 (= lt!165445 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5261))))

(declare-fun mapNonEmpty!13272 () Bool)

(declare-fun mapRes!13272 () Bool)

(declare-fun tp!27168 () Bool)

(declare-fun e!216945 () Bool)

(assert (=> mapNonEmpty!13272 (= mapRes!13272 (and tp!27168 e!216945))))

(declare-fun mapKey!13272 () (_ BitVec 32))

(declare-datatypes ((V!11435 0))(
  ( (V!11436 (val!3966 Int)) )
))
(declare-datatypes ((ValueCell!3578 0))(
  ( (ValueCellFull!3578 (v!6154 V!11435)) (EmptyCell!3578) )
))
(declare-datatypes ((array!19257 0))(
  ( (array!19258 (arr!9122 (Array (_ BitVec 32) ValueCell!3578)) (size!9475 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19257)

(declare-fun mapRest!13272 () (Array (_ BitVec 32) ValueCell!3578))

(declare-fun mapValue!13272 () ValueCell!3578)

(assert (=> mapNonEmpty!13272 (= (arr!9122 _values!1208) (store mapRest!13272 mapKey!13272 mapValue!13272))))

(declare-fun mapIsEmpty!13272 () Bool)

(assert (=> mapIsEmpty!13272 mapRes!13272))

(declare-fun res!196279 () Bool)

(assert (=> start!35376 (=> (not res!196279) (not e!216944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35376 (= res!196279 (validMask!0 mask!1842))))

(assert (=> start!35376 e!216944))

(assert (=> start!35376 true))

(declare-fun e!216942 () Bool)

(declare-fun array_inv!6756 (array!19257) Bool)

(assert (=> start!35376 (and (array_inv!6756 _values!1208) e!216942)))

(declare-fun array_inv!6757 (array!19255) Bool)

(assert (=> start!35376 (array_inv!6757 _keys!1456)))

(declare-fun b!354024 () Bool)

(assert (=> b!354024 (= e!216945 tp_is_empty!7843)))

(declare-fun b!354025 () Bool)

(declare-fun res!196278 () Bool)

(assert (=> b!354025 (=> (not res!196278) (not e!216944))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354025 (= res!196278 (and (= (size!9475 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9474 _keys!1456) (size!9475 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354026 () Bool)

(assert (=> b!354026 (= e!216942 (and e!216943 mapRes!13272))))

(declare-fun condMapEmpty!13272 () Bool)

(declare-fun mapDefault!13272 () ValueCell!3578)

(assert (=> b!354026 (= condMapEmpty!13272 (= (arr!9122 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3578)) mapDefault!13272)))))

(assert (= (and start!35376 res!196279) b!354025))

(assert (= (and b!354025 res!196278) b!354022))

(assert (= (and b!354022 res!196277) b!354023))

(assert (= (and b!354026 condMapEmpty!13272) mapIsEmpty!13272))

(assert (= (and b!354026 (not condMapEmpty!13272)) mapNonEmpty!13272))

(get-info :version)

(assert (= (and mapNonEmpty!13272 ((_ is ValueCellFull!3578) mapValue!13272)) b!354024))

(assert (= (and b!354026 ((_ is ValueCellFull!3578) mapDefault!13272)) b!354021))

(assert (= start!35376 b!354026))

(declare-fun m!352629 () Bool)

(assert (=> b!354022 m!352629))

(declare-fun m!352631 () Bool)

(assert (=> b!354023 m!352631))

(declare-fun m!352633 () Bool)

(assert (=> mapNonEmpty!13272 m!352633))

(declare-fun m!352635 () Bool)

(assert (=> start!35376 m!352635))

(declare-fun m!352637 () Bool)

(assert (=> start!35376 m!352637))

(declare-fun m!352639 () Bool)

(assert (=> start!35376 m!352639))

(check-sat (not mapNonEmpty!13272) (not b!354023) (not start!35376) tp_is_empty!7843 (not b!354022))
(check-sat)
