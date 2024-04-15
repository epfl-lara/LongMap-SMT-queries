; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35364 () Bool)

(assert start!35364)

(declare-fun mapIsEmpty!13254 () Bool)

(declare-fun mapRes!13254 () Bool)

(assert (=> mapIsEmpty!13254 mapRes!13254))

(declare-fun b!353913 () Bool)

(declare-fun e!216852 () Bool)

(declare-fun e!216853 () Bool)

(assert (=> b!353913 (= e!216852 (and e!216853 mapRes!13254))))

(declare-fun condMapEmpty!13254 () Bool)

(declare-datatypes ((V!11419 0))(
  ( (V!11420 (val!3960 Int)) )
))
(declare-datatypes ((ValueCell!3572 0))(
  ( (ValueCellFull!3572 (v!6148 V!11419)) (EmptyCell!3572) )
))
(declare-datatypes ((array!19233 0))(
  ( (array!19234 (arr!9110 (Array (_ BitVec 32) ValueCell!3572)) (size!9463 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19233)

(declare-fun mapDefault!13254 () ValueCell!3572)

(assert (=> b!353913 (= condMapEmpty!13254 (= (arr!9110 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3572)) mapDefault!13254)))))

(declare-fun mapNonEmpty!13254 () Bool)

(declare-fun tp!27150 () Bool)

(declare-fun e!216854 () Bool)

(assert (=> mapNonEmpty!13254 (= mapRes!13254 (and tp!27150 e!216854))))

(declare-fun mapKey!13254 () (_ BitVec 32))

(declare-fun mapValue!13254 () ValueCell!3572)

(declare-fun mapRest!13254 () (Array (_ BitVec 32) ValueCell!3572))

(assert (=> mapNonEmpty!13254 (= (arr!9110 _values!1208) (store mapRest!13254 mapKey!13254 mapValue!13254))))

(declare-fun b!353914 () Bool)

(declare-fun res!196224 () Bool)

(declare-fun e!216851 () Bool)

(assert (=> b!353914 (=> (not res!196224) (not e!216851))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19235 0))(
  ( (array!19236 (arr!9111 (Array (_ BitVec 32) (_ BitVec 64))) (size!9464 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19235)

(assert (=> b!353914 (= res!196224 (and (= (size!9463 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9464 _keys!1456) (size!9463 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353915 () Bool)

(declare-fun res!196225 () Bool)

(assert (=> b!353915 (=> (not res!196225) (not e!216851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19235 (_ BitVec 32)) Bool)

(assert (=> b!353915 (= res!196225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353916 () Bool)

(assert (=> b!353916 (= e!216851 false)))

(declare-fun lt!165427 () Bool)

(declare-datatypes ((List!5260 0))(
  ( (Nil!5257) (Cons!5256 (h!6112 (_ BitVec 64)) (t!10401 List!5260)) )
))
(declare-fun arrayNoDuplicates!0 (array!19235 (_ BitVec 32) List!5260) Bool)

(assert (=> b!353916 (= lt!165427 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5257))))

(declare-fun res!196223 () Bool)

(assert (=> start!35364 (=> (not res!196223) (not e!216851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35364 (= res!196223 (validMask!0 mask!1842))))

(assert (=> start!35364 e!216851))

(assert (=> start!35364 true))

(declare-fun array_inv!6746 (array!19233) Bool)

(assert (=> start!35364 (and (array_inv!6746 _values!1208) e!216852)))

(declare-fun array_inv!6747 (array!19235) Bool)

(assert (=> start!35364 (array_inv!6747 _keys!1456)))

(declare-fun b!353917 () Bool)

(declare-fun tp_is_empty!7831 () Bool)

(assert (=> b!353917 (= e!216853 tp_is_empty!7831)))

(declare-fun b!353918 () Bool)

(assert (=> b!353918 (= e!216854 tp_is_empty!7831)))

(assert (= (and start!35364 res!196223) b!353914))

(assert (= (and b!353914 res!196224) b!353915))

(assert (= (and b!353915 res!196225) b!353916))

(assert (= (and b!353913 condMapEmpty!13254) mapIsEmpty!13254))

(assert (= (and b!353913 (not condMapEmpty!13254)) mapNonEmpty!13254))

(get-info :version)

(assert (= (and mapNonEmpty!13254 ((_ is ValueCellFull!3572) mapValue!13254)) b!353918))

(assert (= (and b!353913 ((_ is ValueCellFull!3572) mapDefault!13254)) b!353917))

(assert (= start!35364 b!353913))

(declare-fun m!352557 () Bool)

(assert (=> mapNonEmpty!13254 m!352557))

(declare-fun m!352559 () Bool)

(assert (=> b!353915 m!352559))

(declare-fun m!352561 () Bool)

(assert (=> b!353916 m!352561))

(declare-fun m!352563 () Bool)

(assert (=> start!35364 m!352563))

(declare-fun m!352565 () Bool)

(assert (=> start!35364 m!352565))

(declare-fun m!352567 () Bool)

(assert (=> start!35364 m!352567))

(check-sat (not mapNonEmpty!13254) (not start!35364) (not b!353915) (not b!353916) tp_is_empty!7831)
(check-sat)
