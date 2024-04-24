; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35496 () Bool)

(assert start!35496)

(declare-fun b!355810 () Bool)

(declare-fun res!197429 () Bool)

(declare-fun e!217984 () Bool)

(assert (=> b!355810 (=> (not res!197429) (not e!217984))))

(declare-datatypes ((array!19488 0))(
  ( (array!19489 (arr!9237 (Array (_ BitVec 32) (_ BitVec 64))) (size!9589 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19488)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19488 (_ BitVec 32)) Bool)

(assert (=> b!355810 (= res!197429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355811 () Bool)

(declare-fun e!217985 () Bool)

(declare-fun e!217983 () Bool)

(declare-fun mapRes!13452 () Bool)

(assert (=> b!355811 (= e!217985 (and e!217983 mapRes!13452))))

(declare-fun condMapEmpty!13452 () Bool)

(declare-datatypes ((V!11595 0))(
  ( (V!11596 (val!4026 Int)) )
))
(declare-datatypes ((ValueCell!3638 0))(
  ( (ValueCellFull!3638 (v!6221 V!11595)) (EmptyCell!3638) )
))
(declare-datatypes ((array!19490 0))(
  ( (array!19491 (arr!9238 (Array (_ BitVec 32) ValueCell!3638)) (size!9590 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19490)

(declare-fun mapDefault!13452 () ValueCell!3638)

(assert (=> b!355811 (= condMapEmpty!13452 (= (arr!9238 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3638)) mapDefault!13452)))))

(declare-fun b!355812 () Bool)

(declare-fun tp_is_empty!7963 () Bool)

(assert (=> b!355812 (= e!217983 tp_is_empty!7963)))

(declare-fun b!355813 () Bool)

(assert (=> b!355813 (= e!217984 false)))

(declare-fun lt!165878 () Bool)

(declare-datatypes ((List!5258 0))(
  ( (Nil!5255) (Cons!5254 (h!6110 (_ BitVec 64)) (t!10400 List!5258)) )
))
(declare-fun arrayNoDuplicates!0 (array!19488 (_ BitVec 32) List!5258) Bool)

(assert (=> b!355813 (= lt!165878 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5255))))

(declare-fun mapNonEmpty!13452 () Bool)

(declare-fun tp!27429 () Bool)

(declare-fun e!217986 () Bool)

(assert (=> mapNonEmpty!13452 (= mapRes!13452 (and tp!27429 e!217986))))

(declare-fun mapValue!13452 () ValueCell!3638)

(declare-fun mapRest!13452 () (Array (_ BitVec 32) ValueCell!3638))

(declare-fun mapKey!13452 () (_ BitVec 32))

(assert (=> mapNonEmpty!13452 (= (arr!9238 _values!1208) (store mapRest!13452 mapKey!13452 mapValue!13452))))

(declare-fun b!355814 () Bool)

(assert (=> b!355814 (= e!217986 tp_is_empty!7963)))

(declare-fun mapIsEmpty!13452 () Bool)

(assert (=> mapIsEmpty!13452 mapRes!13452))

(declare-fun res!197430 () Bool)

(assert (=> start!35496 (=> (not res!197430) (not e!217984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35496 (= res!197430 (validMask!0 mask!1842))))

(assert (=> start!35496 e!217984))

(assert (=> start!35496 true))

(declare-fun array_inv!6826 (array!19490) Bool)

(assert (=> start!35496 (and (array_inv!6826 _values!1208) e!217985)))

(declare-fun array_inv!6827 (array!19488) Bool)

(assert (=> start!35496 (array_inv!6827 _keys!1456)))

(declare-fun b!355809 () Bool)

(declare-fun res!197431 () Bool)

(assert (=> b!355809 (=> (not res!197431) (not e!217984))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355809 (= res!197431 (and (= (size!9590 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9589 _keys!1456) (size!9590 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35496 res!197430) b!355809))

(assert (= (and b!355809 res!197431) b!355810))

(assert (= (and b!355810 res!197429) b!355813))

(assert (= (and b!355811 condMapEmpty!13452) mapIsEmpty!13452))

(assert (= (and b!355811 (not condMapEmpty!13452)) mapNonEmpty!13452))

(get-info :version)

(assert (= (and mapNonEmpty!13452 ((_ is ValueCellFull!3638) mapValue!13452)) b!355814))

(assert (= (and b!355811 ((_ is ValueCellFull!3638) mapDefault!13452)) b!355812))

(assert (= start!35496 b!355811))

(declare-fun m!354681 () Bool)

(assert (=> b!355810 m!354681))

(declare-fun m!354683 () Bool)

(assert (=> b!355813 m!354683))

(declare-fun m!354685 () Bool)

(assert (=> mapNonEmpty!13452 m!354685))

(declare-fun m!354687 () Bool)

(assert (=> start!35496 m!354687))

(declare-fun m!354689 () Bool)

(assert (=> start!35496 m!354689))

(declare-fun m!354691 () Bool)

(assert (=> start!35496 m!354691))

(check-sat tp_is_empty!7963 (not b!355813) (not mapNonEmpty!13452) (not start!35496) (not b!355810))
(check-sat)
