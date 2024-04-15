; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35496 () Bool)

(assert start!35496)

(declare-fun b!355587 () Bool)

(declare-fun e!217843 () Bool)

(declare-fun tp_is_empty!7963 () Bool)

(assert (=> b!355587 (= e!217843 tp_is_empty!7963)))

(declare-fun b!355588 () Bool)

(declare-fun res!197305 () Bool)

(declare-fun e!217844 () Bool)

(assert (=> b!355588 (=> (not res!197305) (not e!217844))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19487 0))(
  ( (array!19488 (arr!9237 (Array (_ BitVec 32) (_ BitVec 64))) (size!9590 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19487)

(declare-datatypes ((V!11595 0))(
  ( (V!11596 (val!4026 Int)) )
))
(declare-datatypes ((ValueCell!3638 0))(
  ( (ValueCellFull!3638 (v!6214 V!11595)) (EmptyCell!3638) )
))
(declare-datatypes ((array!19489 0))(
  ( (array!19490 (arr!9238 (Array (_ BitVec 32) ValueCell!3638)) (size!9591 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19489)

(assert (=> b!355588 (= res!197305 (and (= (size!9591 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9590 _keys!1456) (size!9591 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355589 () Bool)

(declare-fun res!197304 () Bool)

(assert (=> b!355589 (=> (not res!197304) (not e!217844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19487 (_ BitVec 32)) Bool)

(assert (=> b!355589 (= res!197304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355590 () Bool)

(assert (=> b!355590 (= e!217844 false)))

(declare-fun lt!165625 () Bool)

(declare-datatypes ((List!5322 0))(
  ( (Nil!5319) (Cons!5318 (h!6174 (_ BitVec 64)) (t!10463 List!5322)) )
))
(declare-fun arrayNoDuplicates!0 (array!19487 (_ BitVec 32) List!5322) Bool)

(assert (=> b!355590 (= lt!165625 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5319))))

(declare-fun b!355591 () Bool)

(declare-fun e!217842 () Bool)

(assert (=> b!355591 (= e!217842 tp_is_empty!7963)))

(declare-fun mapNonEmpty!13452 () Bool)

(declare-fun mapRes!13452 () Bool)

(declare-fun tp!27429 () Bool)

(assert (=> mapNonEmpty!13452 (= mapRes!13452 (and tp!27429 e!217843))))

(declare-fun mapKey!13452 () (_ BitVec 32))

(declare-fun mapRest!13452 () (Array (_ BitVec 32) ValueCell!3638))

(declare-fun mapValue!13452 () ValueCell!3638)

(assert (=> mapNonEmpty!13452 (= (arr!9238 _values!1208) (store mapRest!13452 mapKey!13452 mapValue!13452))))

(declare-fun mapIsEmpty!13452 () Bool)

(assert (=> mapIsEmpty!13452 mapRes!13452))

(declare-fun b!355592 () Bool)

(declare-fun e!217841 () Bool)

(assert (=> b!355592 (= e!217841 (and e!217842 mapRes!13452))))

(declare-fun condMapEmpty!13452 () Bool)

(declare-fun mapDefault!13452 () ValueCell!3638)

(assert (=> b!355592 (= condMapEmpty!13452 (= (arr!9238 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3638)) mapDefault!13452)))))

(declare-fun res!197303 () Bool)

(assert (=> start!35496 (=> (not res!197303) (not e!217844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35496 (= res!197303 (validMask!0 mask!1842))))

(assert (=> start!35496 e!217844))

(assert (=> start!35496 true))

(declare-fun array_inv!6832 (array!19489) Bool)

(assert (=> start!35496 (and (array_inv!6832 _values!1208) e!217841)))

(declare-fun array_inv!6833 (array!19487) Bool)

(assert (=> start!35496 (array_inv!6833 _keys!1456)))

(assert (= (and start!35496 res!197303) b!355588))

(assert (= (and b!355588 res!197305) b!355589))

(assert (= (and b!355589 res!197304) b!355590))

(assert (= (and b!355592 condMapEmpty!13452) mapIsEmpty!13452))

(assert (= (and b!355592 (not condMapEmpty!13452)) mapNonEmpty!13452))

(get-info :version)

(assert (= (and mapNonEmpty!13452 ((_ is ValueCellFull!3638) mapValue!13452)) b!355587))

(assert (= (and b!355592 ((_ is ValueCellFull!3638) mapDefault!13452)) b!355591))

(assert (= start!35496 b!355592))

(declare-fun m!353727 () Bool)

(assert (=> b!355589 m!353727))

(declare-fun m!353729 () Bool)

(assert (=> b!355590 m!353729))

(declare-fun m!353731 () Bool)

(assert (=> mapNonEmpty!13452 m!353731))

(declare-fun m!353733 () Bool)

(assert (=> start!35496 m!353733))

(declare-fun m!353735 () Bool)

(assert (=> start!35496 m!353735))

(declare-fun m!353737 () Bool)

(assert (=> start!35496 m!353737))

(check-sat (not b!355590) (not b!355589) (not mapNonEmpty!13452) tp_is_empty!7963 (not start!35496))
(check-sat)
