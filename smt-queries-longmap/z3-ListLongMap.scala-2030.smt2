; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35322 () Bool)

(assert start!35322)

(declare-fun b!353812 () Bool)

(declare-fun res!196182 () Bool)

(declare-fun e!216741 () Bool)

(assert (=> b!353812 (=> (not res!196182) (not e!216741))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19180 0))(
  ( (array!19181 (arr!9084 (Array (_ BitVec 32) (_ BitVec 64))) (size!9436 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19180)

(declare-datatypes ((V!11379 0))(
  ( (V!11380 (val!3945 Int)) )
))
(declare-datatypes ((ValueCell!3557 0))(
  ( (ValueCellFull!3557 (v!6140 V!11379)) (EmptyCell!3557) )
))
(declare-datatypes ((array!19182 0))(
  ( (array!19183 (arr!9085 (Array (_ BitVec 32) ValueCell!3557)) (size!9437 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19182)

(assert (=> b!353812 (= res!196182 (and (= (size!9437 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9436 _keys!1456) (size!9437 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353813 () Bool)

(declare-fun e!216745 () Bool)

(declare-fun tp_is_empty!7801 () Bool)

(assert (=> b!353813 (= e!216745 tp_is_empty!7801)))

(declare-fun b!353814 () Bool)

(declare-fun e!216744 () Bool)

(assert (=> b!353814 (= e!216744 tp_is_empty!7801)))

(declare-fun b!353815 () Bool)

(declare-fun e!216743 () Bool)

(declare-fun mapRes!13206 () Bool)

(assert (=> b!353815 (= e!216743 (and e!216744 mapRes!13206))))

(declare-fun condMapEmpty!13206 () Bool)

(declare-fun mapDefault!13206 () ValueCell!3557)

(assert (=> b!353815 (= condMapEmpty!13206 (= (arr!9085 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3557)) mapDefault!13206)))))

(declare-fun b!353816 () Bool)

(assert (=> b!353816 (= e!216741 false)))

(declare-fun lt!165635 () Bool)

(declare-datatypes ((List!5187 0))(
  ( (Nil!5184) (Cons!5183 (h!6039 (_ BitVec 64)) (t!10329 List!5187)) )
))
(declare-fun arrayNoDuplicates!0 (array!19180 (_ BitVec 32) List!5187) Bool)

(assert (=> b!353816 (= lt!165635 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5184))))

(declare-fun mapNonEmpty!13206 () Bool)

(declare-fun tp!27102 () Bool)

(assert (=> mapNonEmpty!13206 (= mapRes!13206 (and tp!27102 e!216745))))

(declare-fun mapValue!13206 () ValueCell!3557)

(declare-fun mapRest!13206 () (Array (_ BitVec 32) ValueCell!3557))

(declare-fun mapKey!13206 () (_ BitVec 32))

(assert (=> mapNonEmpty!13206 (= (arr!9085 _values!1208) (store mapRest!13206 mapKey!13206 mapValue!13206))))

(declare-fun mapIsEmpty!13206 () Bool)

(assert (=> mapIsEmpty!13206 mapRes!13206))

(declare-fun b!353817 () Bool)

(declare-fun res!196183 () Bool)

(assert (=> b!353817 (=> (not res!196183) (not e!216741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19180 (_ BitVec 32)) Bool)

(assert (=> b!353817 (= res!196183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196181 () Bool)

(assert (=> start!35322 (=> (not res!196181) (not e!216741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35322 (= res!196181 (validMask!0 mask!1842))))

(assert (=> start!35322 e!216741))

(assert (=> start!35322 true))

(declare-fun array_inv!6706 (array!19182) Bool)

(assert (=> start!35322 (and (array_inv!6706 _values!1208) e!216743)))

(declare-fun array_inv!6707 (array!19180) Bool)

(assert (=> start!35322 (array_inv!6707 _keys!1456)))

(assert (= (and start!35322 res!196181) b!353812))

(assert (= (and b!353812 res!196182) b!353817))

(assert (= (and b!353817 res!196183) b!353816))

(assert (= (and b!353815 condMapEmpty!13206) mapIsEmpty!13206))

(assert (= (and b!353815 (not condMapEmpty!13206)) mapNonEmpty!13206))

(get-info :version)

(assert (= (and mapNonEmpty!13206 ((_ is ValueCellFull!3557) mapValue!13206)) b!353813))

(assert (= (and b!353815 ((_ is ValueCellFull!3557) mapDefault!13206)) b!353814))

(assert (= start!35322 b!353815))

(declare-fun m!353307 () Bool)

(assert (=> b!353816 m!353307))

(declare-fun m!353309 () Bool)

(assert (=> mapNonEmpty!13206 m!353309))

(declare-fun m!353311 () Bool)

(assert (=> b!353817 m!353311))

(declare-fun m!353313 () Bool)

(assert (=> start!35322 m!353313))

(declare-fun m!353315 () Bool)

(assert (=> start!35322 m!353315))

(declare-fun m!353317 () Bool)

(assert (=> start!35322 m!353317))

(check-sat (not mapNonEmpty!13206) tp_is_empty!7801 (not start!35322) (not b!353816) (not b!353817))
(check-sat)
