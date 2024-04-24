; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35790 () Bool)

(assert start!35790)

(declare-fun b!359571 () Bool)

(declare-fun e!220272 () Bool)

(declare-fun e!220271 () Bool)

(declare-fun mapRes!13893 () Bool)

(assert (=> b!359571 (= e!220272 (and e!220271 mapRes!13893))))

(declare-fun condMapEmpty!13893 () Bool)

(declare-datatypes ((V!11987 0))(
  ( (V!11988 (val!4173 Int)) )
))
(declare-datatypes ((ValueCell!3785 0))(
  ( (ValueCellFull!3785 (v!6368 V!11987)) (EmptyCell!3785) )
))
(declare-datatypes ((array!20048 0))(
  ( (array!20049 (arr!9517 (Array (_ BitVec 32) ValueCell!3785)) (size!9869 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20048)

(declare-fun mapDefault!13893 () ValueCell!3785)

(assert (=> b!359571 (= condMapEmpty!13893 (= (arr!9517 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3785)) mapDefault!13893)))))

(declare-fun b!359572 () Bool)

(declare-fun tp_is_empty!8257 () Bool)

(assert (=> b!359572 (= e!220271 tp_is_empty!8257)))

(declare-fun b!359573 () Bool)

(declare-fun res!199868 () Bool)

(declare-fun e!220270 () Bool)

(assert (=> b!359573 (=> (not res!199868) (not e!220270))))

(declare-datatypes ((array!20050 0))(
  ( (array!20051 (arr!9518 (Array (_ BitVec 32) (_ BitVec 64))) (size!9870 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20050)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20050 (_ BitVec 32)) Bool)

(assert (=> b!359573 (= res!199868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199869 () Bool)

(assert (=> start!35790 (=> (not res!199869) (not e!220270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35790 (= res!199869 (validMask!0 mask!1842))))

(assert (=> start!35790 e!220270))

(assert (=> start!35790 true))

(declare-fun array_inv!7036 (array!20048) Bool)

(assert (=> start!35790 (and (array_inv!7036 _values!1208) e!220272)))

(declare-fun array_inv!7037 (array!20050) Bool)

(assert (=> start!35790 (array_inv!7037 _keys!1456)))

(declare-fun mapNonEmpty!13893 () Bool)

(declare-fun tp!27960 () Bool)

(declare-fun e!220273 () Bool)

(assert (=> mapNonEmpty!13893 (= mapRes!13893 (and tp!27960 e!220273))))

(declare-fun mapKey!13893 () (_ BitVec 32))

(declare-fun mapRest!13893 () (Array (_ BitVec 32) ValueCell!3785))

(declare-fun mapValue!13893 () ValueCell!3785)

(assert (=> mapNonEmpty!13893 (= (arr!9517 _values!1208) (store mapRest!13893 mapKey!13893 mapValue!13893))))

(declare-fun b!359574 () Bool)

(declare-fun res!199870 () Bool)

(assert (=> b!359574 (=> (not res!199870) (not e!220270))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359574 (= res!199870 (and (= (size!9869 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9870 _keys!1456) (size!9869 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13893 () Bool)

(assert (=> mapIsEmpty!13893 mapRes!13893))

(declare-fun b!359575 () Bool)

(assert (=> b!359575 (= e!220270 false)))

(declare-fun lt!166391 () Bool)

(declare-datatypes ((List!5382 0))(
  ( (Nil!5379) (Cons!5378 (h!6234 (_ BitVec 64)) (t!10524 List!5382)) )
))
(declare-fun arrayNoDuplicates!0 (array!20050 (_ BitVec 32) List!5382) Bool)

(assert (=> b!359575 (= lt!166391 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5379))))

(declare-fun b!359576 () Bool)

(assert (=> b!359576 (= e!220273 tp_is_empty!8257)))

(assert (= (and start!35790 res!199869) b!359574))

(assert (= (and b!359574 res!199870) b!359573))

(assert (= (and b!359573 res!199868) b!359575))

(assert (= (and b!359571 condMapEmpty!13893) mapIsEmpty!13893))

(assert (= (and b!359571 (not condMapEmpty!13893)) mapNonEmpty!13893))

(get-info :version)

(assert (= (and mapNonEmpty!13893 ((_ is ValueCellFull!3785) mapValue!13893)) b!359576))

(assert (= (and b!359571 ((_ is ValueCellFull!3785) mapDefault!13893)) b!359572))

(assert (= start!35790 b!359571))

(declare-fun m!357291 () Bool)

(assert (=> b!359573 m!357291))

(declare-fun m!357293 () Bool)

(assert (=> start!35790 m!357293))

(declare-fun m!357295 () Bool)

(assert (=> start!35790 m!357295))

(declare-fun m!357297 () Bool)

(assert (=> start!35790 m!357297))

(declare-fun m!357299 () Bool)

(assert (=> mapNonEmpty!13893 m!357299))

(declare-fun m!357301 () Bool)

(assert (=> b!359575 m!357301))

(check-sat (not b!359573) (not mapNonEmpty!13893) (not b!359575) (not start!35790) tp_is_empty!8257)
(check-sat)
