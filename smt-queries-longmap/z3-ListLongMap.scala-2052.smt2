; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35466 () Bool)

(assert start!35466)

(declare-fun mapIsEmpty!13407 () Bool)

(declare-fun mapRes!13407 () Bool)

(assert (=> mapIsEmpty!13407 mapRes!13407))

(declare-fun b!355539 () Bool)

(declare-fun e!217762 () Bool)

(declare-fun tp_is_empty!7933 () Bool)

(assert (=> b!355539 (= e!217762 tp_is_empty!7933)))

(declare-fun b!355540 () Bool)

(declare-fun res!197295 () Bool)

(declare-fun e!217761 () Bool)

(assert (=> b!355540 (=> (not res!197295) (not e!217761))))

(declare-datatypes ((array!19436 0))(
  ( (array!19437 (arr!9211 (Array (_ BitVec 32) (_ BitVec 64))) (size!9563 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19436)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19436 (_ BitVec 32)) Bool)

(assert (=> b!355540 (= res!197295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355541 () Bool)

(assert (=> b!355541 (= e!217761 false)))

(declare-fun lt!165833 () Bool)

(declare-datatypes ((List!5251 0))(
  ( (Nil!5248) (Cons!5247 (h!6103 (_ BitVec 64)) (t!10393 List!5251)) )
))
(declare-fun arrayNoDuplicates!0 (array!19436 (_ BitVec 32) List!5251) Bool)

(assert (=> b!355541 (= lt!165833 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5248))))

(declare-fun mapNonEmpty!13407 () Bool)

(declare-fun tp!27384 () Bool)

(assert (=> mapNonEmpty!13407 (= mapRes!13407 (and tp!27384 e!217762))))

(declare-datatypes ((V!11555 0))(
  ( (V!11556 (val!4011 Int)) )
))
(declare-datatypes ((ValueCell!3623 0))(
  ( (ValueCellFull!3623 (v!6206 V!11555)) (EmptyCell!3623) )
))
(declare-fun mapRest!13407 () (Array (_ BitVec 32) ValueCell!3623))

(declare-fun mapKey!13407 () (_ BitVec 32))

(declare-datatypes ((array!19438 0))(
  ( (array!19439 (arr!9212 (Array (_ BitVec 32) ValueCell!3623)) (size!9564 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19438)

(declare-fun mapValue!13407 () ValueCell!3623)

(assert (=> mapNonEmpty!13407 (= (arr!9212 _values!1208) (store mapRest!13407 mapKey!13407 mapValue!13407))))

(declare-fun res!197294 () Bool)

(assert (=> start!35466 (=> (not res!197294) (not e!217761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35466 (= res!197294 (validMask!0 mask!1842))))

(assert (=> start!35466 e!217761))

(assert (=> start!35466 true))

(declare-fun e!217759 () Bool)

(declare-fun array_inv!6808 (array!19438) Bool)

(assert (=> start!35466 (and (array_inv!6808 _values!1208) e!217759)))

(declare-fun array_inv!6809 (array!19436) Bool)

(assert (=> start!35466 (array_inv!6809 _keys!1456)))

(declare-fun b!355542 () Bool)

(declare-fun e!217760 () Bool)

(assert (=> b!355542 (= e!217759 (and e!217760 mapRes!13407))))

(declare-fun condMapEmpty!13407 () Bool)

(declare-fun mapDefault!13407 () ValueCell!3623)

(assert (=> b!355542 (= condMapEmpty!13407 (= (arr!9212 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3623)) mapDefault!13407)))))

(declare-fun b!355543 () Bool)

(assert (=> b!355543 (= e!217760 tp_is_empty!7933)))

(declare-fun b!355544 () Bool)

(declare-fun res!197296 () Bool)

(assert (=> b!355544 (=> (not res!197296) (not e!217761))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355544 (= res!197296 (and (= (size!9564 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9563 _keys!1456) (size!9564 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35466 res!197294) b!355544))

(assert (= (and b!355544 res!197296) b!355540))

(assert (= (and b!355540 res!197295) b!355541))

(assert (= (and b!355542 condMapEmpty!13407) mapIsEmpty!13407))

(assert (= (and b!355542 (not condMapEmpty!13407)) mapNonEmpty!13407))

(get-info :version)

(assert (= (and mapNonEmpty!13407 ((_ is ValueCellFull!3623) mapValue!13407)) b!355539))

(assert (= (and b!355542 ((_ is ValueCellFull!3623) mapDefault!13407)) b!355543))

(assert (= start!35466 b!355542))

(declare-fun m!354501 () Bool)

(assert (=> b!355540 m!354501))

(declare-fun m!354503 () Bool)

(assert (=> b!355541 m!354503))

(declare-fun m!354505 () Bool)

(assert (=> mapNonEmpty!13407 m!354505))

(declare-fun m!354507 () Bool)

(assert (=> start!35466 m!354507))

(declare-fun m!354509 () Bool)

(assert (=> start!35466 m!354509))

(declare-fun m!354511 () Bool)

(assert (=> start!35466 m!354511))

(check-sat (not b!355540) (not mapNonEmpty!13407) (not start!35466) (not b!355541) tp_is_empty!7933)
(check-sat)
