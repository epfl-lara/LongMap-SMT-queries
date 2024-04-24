; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35808 () Bool)

(assert start!35808)

(declare-fun b!359833 () Bool)

(declare-fun res!200051 () Bool)

(declare-fun e!220406 () Bool)

(assert (=> b!359833 (=> (not res!200051) (not e!220406))))

(declare-datatypes ((array!20084 0))(
  ( (array!20085 (arr!9535 (Array (_ BitVec 32) (_ BitVec 64))) (size!9887 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20084)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20084 (_ BitVec 32)) Bool)

(assert (=> b!359833 (= res!200051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359835 () Bool)

(declare-fun res!200049 () Bool)

(assert (=> b!359835 (=> (not res!200049) (not e!220406))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!359835 (= res!200049 (not (= (select (arr!9535 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359836 () Bool)

(declare-fun res!200056 () Bool)

(assert (=> b!359836 (=> (not res!200056) (not e!220406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359836 (= res!200056 (validKeyInArray!0 k0!1077))))

(declare-fun b!359837 () Bool)

(declare-fun e!220404 () Bool)

(declare-fun tp_is_empty!8275 () Bool)

(assert (=> b!359837 (= e!220404 tp_is_empty!8275)))

(declare-fun b!359838 () Bool)

(declare-fun e!220408 () Bool)

(assert (=> b!359838 (= e!220408 tp_is_empty!8275)))

(declare-fun b!359839 () Bool)

(assert (=> b!359839 (= e!220406 (not true))))

(declare-fun arrayContainsKey!0 (array!20084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359839 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12011 0))(
  ( (V!12012 (val!4182 Int)) )
))
(declare-fun minValue!1150 () V!12011)

(declare-datatypes ((ValueCell!3794 0))(
  ( (ValueCellFull!3794 (v!6377 V!12011)) (EmptyCell!3794) )
))
(declare-datatypes ((array!20086 0))(
  ( (array!20087 (arr!9536 (Array (_ BitVec 32) ValueCell!3794)) (size!9888 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20086)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12011)

(declare-datatypes ((Unit!11047 0))(
  ( (Unit!11048) )
))
(declare-fun lt!166418 () Unit!11047)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!45 (array!20084 array!20086 (_ BitVec 32) (_ BitVec 32) V!12011 V!12011 (_ BitVec 64) (_ BitVec 32)) Unit!11047)

(assert (=> b!359839 (= lt!166418 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!45 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13920 () Bool)

(declare-fun mapRes!13920 () Bool)

(assert (=> mapIsEmpty!13920 mapRes!13920))

(declare-fun b!359840 () Bool)

(declare-fun e!220407 () Bool)

(assert (=> b!359840 (= e!220407 (and e!220408 mapRes!13920))))

(declare-fun condMapEmpty!13920 () Bool)

(declare-fun mapDefault!13920 () ValueCell!3794)

(assert (=> b!359840 (= condMapEmpty!13920 (= (arr!9536 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3794)) mapDefault!13920)))))

(declare-fun res!200052 () Bool)

(assert (=> start!35808 (=> (not res!200052) (not e!220406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35808 (= res!200052 (validMask!0 mask!1842))))

(assert (=> start!35808 e!220406))

(assert (=> start!35808 tp_is_empty!8275))

(assert (=> start!35808 true))

(declare-fun array_inv!7048 (array!20084) Bool)

(assert (=> start!35808 (array_inv!7048 _keys!1456)))

(declare-fun array_inv!7049 (array!20086) Bool)

(assert (=> start!35808 (and (array_inv!7049 _values!1208) e!220407)))

(declare-fun b!359834 () Bool)

(declare-fun res!200054 () Bool)

(assert (=> b!359834 (=> (not res!200054) (not e!220406))))

(assert (=> b!359834 (= res!200054 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13920 () Bool)

(declare-fun tp!27987 () Bool)

(assert (=> mapNonEmpty!13920 (= mapRes!13920 (and tp!27987 e!220404))))

(declare-fun mapKey!13920 () (_ BitVec 32))

(declare-fun mapRest!13920 () (Array (_ BitVec 32) ValueCell!3794))

(declare-fun mapValue!13920 () ValueCell!3794)

(assert (=> mapNonEmpty!13920 (= (arr!9536 _values!1208) (store mapRest!13920 mapKey!13920 mapValue!13920))))

(declare-fun b!359841 () Bool)

(declare-fun res!200055 () Bool)

(assert (=> b!359841 (=> (not res!200055) (not e!220406))))

(declare-datatypes ((List!5389 0))(
  ( (Nil!5386) (Cons!5385 (h!6241 (_ BitVec 64)) (t!10531 List!5389)) )
))
(declare-fun arrayNoDuplicates!0 (array!20084 (_ BitVec 32) List!5389) Bool)

(assert (=> b!359841 (= res!200055 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5386))))

(declare-fun b!359842 () Bool)

(declare-fun res!200053 () Bool)

(assert (=> b!359842 (=> (not res!200053) (not e!220406))))

(assert (=> b!359842 (= res!200053 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9887 _keys!1456))))))

(declare-fun b!359843 () Bool)

(declare-fun res!200050 () Bool)

(assert (=> b!359843 (=> (not res!200050) (not e!220406))))

(assert (=> b!359843 (= res!200050 (and (= (size!9888 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9887 _keys!1456) (size!9888 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35808 res!200052) b!359843))

(assert (= (and b!359843 res!200050) b!359833))

(assert (= (and b!359833 res!200051) b!359841))

(assert (= (and b!359841 res!200055) b!359836))

(assert (= (and b!359836 res!200056) b!359842))

(assert (= (and b!359842 res!200053) b!359834))

(assert (= (and b!359834 res!200054) b!359835))

(assert (= (and b!359835 res!200049) b!359839))

(assert (= (and b!359840 condMapEmpty!13920) mapIsEmpty!13920))

(assert (= (and b!359840 (not condMapEmpty!13920)) mapNonEmpty!13920))

(get-info :version)

(assert (= (and mapNonEmpty!13920 ((_ is ValueCellFull!3794) mapValue!13920)) b!359837))

(assert (= (and b!359840 ((_ is ValueCellFull!3794) mapDefault!13920)) b!359838))

(assert (= start!35808 b!359840))

(declare-fun m!357459 () Bool)

(assert (=> b!359834 m!357459))

(declare-fun m!357461 () Bool)

(assert (=> start!35808 m!357461))

(declare-fun m!357463 () Bool)

(assert (=> start!35808 m!357463))

(declare-fun m!357465 () Bool)

(assert (=> start!35808 m!357465))

(declare-fun m!357467 () Bool)

(assert (=> b!359835 m!357467))

(declare-fun m!357469 () Bool)

(assert (=> b!359841 m!357469))

(declare-fun m!357471 () Bool)

(assert (=> b!359839 m!357471))

(declare-fun m!357473 () Bool)

(assert (=> b!359839 m!357473))

(declare-fun m!357475 () Bool)

(assert (=> b!359833 m!357475))

(declare-fun m!357477 () Bool)

(assert (=> mapNonEmpty!13920 m!357477))

(declare-fun m!357479 () Bool)

(assert (=> b!359836 m!357479))

(check-sat (not b!359839) (not b!359833) (not mapNonEmpty!13920) (not start!35808) (not b!359841) tp_is_empty!8275 (not b!359834) (not b!359836))
(check-sat)
