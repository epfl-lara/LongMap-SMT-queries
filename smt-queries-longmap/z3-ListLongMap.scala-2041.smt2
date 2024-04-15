; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35400 () Bool)

(assert start!35400)

(declare-fun b!354237 () Bool)

(declare-fun e!217124 () Bool)

(declare-fun tp_is_empty!7867 () Bool)

(assert (=> b!354237 (= e!217124 tp_is_empty!7867)))

(declare-fun b!354238 () Bool)

(declare-fun res!196385 () Bool)

(declare-fun e!217122 () Bool)

(assert (=> b!354238 (=> (not res!196385) (not e!217122))))

(declare-datatypes ((array!19301 0))(
  ( (array!19302 (arr!9144 (Array (_ BitVec 32) (_ BitVec 64))) (size!9497 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19301)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19301 (_ BitVec 32)) Bool)

(assert (=> b!354238 (= res!196385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354239 () Bool)

(declare-fun res!196386 () Bool)

(assert (=> b!354239 (=> (not res!196386) (not e!217122))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11467 0))(
  ( (V!11468 (val!3978 Int)) )
))
(declare-datatypes ((ValueCell!3590 0))(
  ( (ValueCellFull!3590 (v!6166 V!11467)) (EmptyCell!3590) )
))
(declare-datatypes ((array!19303 0))(
  ( (array!19304 (arr!9145 (Array (_ BitVec 32) ValueCell!3590)) (size!9498 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19303)

(assert (=> b!354239 (= res!196386 (and (= (size!9498 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9497 _keys!1456) (size!9498 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13308 () Bool)

(declare-fun mapRes!13308 () Bool)

(declare-fun tp!27204 () Bool)

(assert (=> mapNonEmpty!13308 (= mapRes!13308 (and tp!27204 e!217124))))

(declare-fun mapKey!13308 () (_ BitVec 32))

(declare-fun mapRest!13308 () (Array (_ BitVec 32) ValueCell!3590))

(declare-fun mapValue!13308 () ValueCell!3590)

(assert (=> mapNonEmpty!13308 (= (arr!9145 _values!1208) (store mapRest!13308 mapKey!13308 mapValue!13308))))

(declare-fun b!354240 () Bool)

(declare-fun e!217125 () Bool)

(assert (=> b!354240 (= e!217125 tp_is_empty!7867)))

(declare-fun b!354241 () Bool)

(assert (=> b!354241 (= e!217122 false)))

(declare-fun lt!165481 () Bool)

(declare-datatypes ((List!5271 0))(
  ( (Nil!5268) (Cons!5267 (h!6123 (_ BitVec 64)) (t!10412 List!5271)) )
))
(declare-fun arrayNoDuplicates!0 (array!19301 (_ BitVec 32) List!5271) Bool)

(assert (=> b!354241 (= lt!165481 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5268))))

(declare-fun res!196387 () Bool)

(assert (=> start!35400 (=> (not res!196387) (not e!217122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35400 (= res!196387 (validMask!0 mask!1842))))

(assert (=> start!35400 e!217122))

(assert (=> start!35400 true))

(declare-fun e!217123 () Bool)

(declare-fun array_inv!6774 (array!19303) Bool)

(assert (=> start!35400 (and (array_inv!6774 _values!1208) e!217123)))

(declare-fun array_inv!6775 (array!19301) Bool)

(assert (=> start!35400 (array_inv!6775 _keys!1456)))

(declare-fun mapIsEmpty!13308 () Bool)

(assert (=> mapIsEmpty!13308 mapRes!13308))

(declare-fun b!354242 () Bool)

(assert (=> b!354242 (= e!217123 (and e!217125 mapRes!13308))))

(declare-fun condMapEmpty!13308 () Bool)

(declare-fun mapDefault!13308 () ValueCell!3590)

(assert (=> b!354242 (= condMapEmpty!13308 (= (arr!9145 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3590)) mapDefault!13308)))))

(assert (= (and start!35400 res!196387) b!354239))

(assert (= (and b!354239 res!196386) b!354238))

(assert (= (and b!354238 res!196385) b!354241))

(assert (= (and b!354242 condMapEmpty!13308) mapIsEmpty!13308))

(assert (= (and b!354242 (not condMapEmpty!13308)) mapNonEmpty!13308))

(get-info :version)

(assert (= (and mapNonEmpty!13308 ((_ is ValueCellFull!3590) mapValue!13308)) b!354237))

(assert (= (and b!354242 ((_ is ValueCellFull!3590) mapDefault!13308)) b!354240))

(assert (= start!35400 b!354242))

(declare-fun m!352773 () Bool)

(assert (=> b!354238 m!352773))

(declare-fun m!352775 () Bool)

(assert (=> mapNonEmpty!13308 m!352775))

(declare-fun m!352777 () Bool)

(assert (=> b!354241 m!352777))

(declare-fun m!352779 () Bool)

(assert (=> start!35400 m!352779))

(declare-fun m!352781 () Bool)

(assert (=> start!35400 m!352781))

(declare-fun m!352783 () Bool)

(assert (=> start!35400 m!352783))

(check-sat (not b!354241) (not start!35400) (not mapNonEmpty!13308) (not b!354238) tp_is_empty!7867)
(check-sat)
