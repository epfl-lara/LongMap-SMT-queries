; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35388 () Bool)

(assert start!35388)

(declare-fun b!354352 () Bool)

(declare-fun e!217173 () Bool)

(declare-fun tp_is_empty!7855 () Bool)

(assert (=> b!354352 (= e!217173 tp_is_empty!7855)))

(declare-fun mapNonEmpty!13290 () Bool)

(declare-fun mapRes!13290 () Bool)

(declare-fun tp!27186 () Bool)

(declare-fun e!217175 () Bool)

(assert (=> mapNonEmpty!13290 (= mapRes!13290 (and tp!27186 e!217175))))

(declare-datatypes ((V!11451 0))(
  ( (V!11452 (val!3972 Int)) )
))
(declare-datatypes ((ValueCell!3584 0))(
  ( (ValueCellFull!3584 (v!6167 V!11451)) (EmptyCell!3584) )
))
(declare-fun mapValue!13290 () ValueCell!3584)

(declare-datatypes ((array!19284 0))(
  ( (array!19285 (arr!9135 (Array (_ BitVec 32) ValueCell!3584)) (size!9487 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19284)

(declare-fun mapKey!13290 () (_ BitVec 32))

(declare-fun mapRest!13290 () (Array (_ BitVec 32) ValueCell!3584))

(assert (=> mapNonEmpty!13290 (= (arr!9135 _values!1208) (store mapRest!13290 mapKey!13290 mapValue!13290))))

(declare-fun b!354353 () Bool)

(declare-fun e!217177 () Bool)

(assert (=> b!354353 (= e!217177 (and e!217173 mapRes!13290))))

(declare-fun condMapEmpty!13290 () Bool)

(declare-fun mapDefault!13290 () ValueCell!3584)

(assert (=> b!354353 (= condMapEmpty!13290 (= (arr!9135 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3584)) mapDefault!13290)))))

(declare-fun mapIsEmpty!13290 () Bool)

(assert (=> mapIsEmpty!13290 mapRes!13290))

(declare-fun b!354354 () Bool)

(assert (=> b!354354 (= e!217175 tp_is_empty!7855)))

(declare-fun b!354355 () Bool)

(declare-fun res!196458 () Bool)

(declare-fun e!217176 () Bool)

(assert (=> b!354355 (=> (not res!196458) (not e!217176))))

(declare-datatypes ((array!19286 0))(
  ( (array!19287 (arr!9136 (Array (_ BitVec 32) (_ BitVec 64))) (size!9488 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19286)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19286 (_ BitVec 32)) Bool)

(assert (=> b!354355 (= res!196458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354356 () Bool)

(declare-fun res!196457 () Bool)

(assert (=> b!354356 (=> (not res!196457) (not e!217176))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354356 (= res!196457 (and (= (size!9487 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9488 _keys!1456) (size!9487 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354351 () Bool)

(assert (=> b!354351 (= e!217176 false)))

(declare-fun lt!165716 () Bool)

(declare-datatypes ((List!5202 0))(
  ( (Nil!5199) (Cons!5198 (h!6054 (_ BitVec 64)) (t!10344 List!5202)) )
))
(declare-fun arrayNoDuplicates!0 (array!19286 (_ BitVec 32) List!5202) Bool)

(assert (=> b!354351 (= lt!165716 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5199))))

(declare-fun res!196459 () Bool)

(assert (=> start!35388 (=> (not res!196459) (not e!217176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35388 (= res!196459 (validMask!0 mask!1842))))

(assert (=> start!35388 e!217176))

(assert (=> start!35388 true))

(declare-fun array_inv!6748 (array!19284) Bool)

(assert (=> start!35388 (and (array_inv!6748 _values!1208) e!217177)))

(declare-fun array_inv!6749 (array!19286) Bool)

(assert (=> start!35388 (array_inv!6749 _keys!1456)))

(assert (= (and start!35388 res!196459) b!354356))

(assert (= (and b!354356 res!196457) b!354355))

(assert (= (and b!354355 res!196458) b!354351))

(assert (= (and b!354353 condMapEmpty!13290) mapIsEmpty!13290))

(assert (= (and b!354353 (not condMapEmpty!13290)) mapNonEmpty!13290))

(get-info :version)

(assert (= (and mapNonEmpty!13290 ((_ is ValueCellFull!3584) mapValue!13290)) b!354354))

(assert (= (and b!354353 ((_ is ValueCellFull!3584) mapDefault!13290)) b!354352))

(assert (= start!35388 b!354353))

(declare-fun m!353655 () Bool)

(assert (=> mapNonEmpty!13290 m!353655))

(declare-fun m!353657 () Bool)

(assert (=> b!354355 m!353657))

(declare-fun m!353659 () Bool)

(assert (=> b!354351 m!353659))

(declare-fun m!353661 () Bool)

(assert (=> start!35388 m!353661))

(declare-fun m!353663 () Bool)

(assert (=> start!35388 m!353663))

(declare-fun m!353665 () Bool)

(assert (=> start!35388 m!353665))

(check-sat (not b!354351) (not mapNonEmpty!13290) (not b!354355) tp_is_empty!7855 (not start!35388))
(check-sat)
