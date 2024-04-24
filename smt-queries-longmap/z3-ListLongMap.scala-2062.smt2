; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35526 () Bool)

(assert start!35526)

(declare-fun b!356079 () Bool)

(declare-fun e!218210 () Bool)

(declare-fun e!218209 () Bool)

(declare-fun mapRes!13497 () Bool)

(assert (=> b!356079 (= e!218210 (and e!218209 mapRes!13497))))

(declare-fun condMapEmpty!13497 () Bool)

(declare-datatypes ((V!11635 0))(
  ( (V!11636 (val!4041 Int)) )
))
(declare-datatypes ((ValueCell!3653 0))(
  ( (ValueCellFull!3653 (v!6236 V!11635)) (EmptyCell!3653) )
))
(declare-datatypes ((array!19542 0))(
  ( (array!19543 (arr!9264 (Array (_ BitVec 32) ValueCell!3653)) (size!9616 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19542)

(declare-fun mapDefault!13497 () ValueCell!3653)

(assert (=> b!356079 (= condMapEmpty!13497 (= (arr!9264 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3653)) mapDefault!13497)))))

(declare-fun b!356080 () Bool)

(declare-fun e!218211 () Bool)

(assert (=> b!356080 (= e!218211 false)))

(declare-fun lt!165923 () Bool)

(declare-datatypes ((array!19544 0))(
  ( (array!19545 (arr!9265 (Array (_ BitVec 32) (_ BitVec 64))) (size!9617 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19544)

(declare-datatypes ((List!5269 0))(
  ( (Nil!5266) (Cons!5265 (h!6121 (_ BitVec 64)) (t!10411 List!5269)) )
))
(declare-fun arrayNoDuplicates!0 (array!19544 (_ BitVec 32) List!5269) Bool)

(assert (=> b!356080 (= lt!165923 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5266))))

(declare-fun mapIsEmpty!13497 () Bool)

(assert (=> mapIsEmpty!13497 mapRes!13497))

(declare-fun b!356081 () Bool)

(declare-fun tp_is_empty!7993 () Bool)

(assert (=> b!356081 (= e!218209 tp_is_empty!7993)))

(declare-fun b!356082 () Bool)

(declare-fun res!197565 () Bool)

(assert (=> b!356082 (=> (not res!197565) (not e!218211))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19544 (_ BitVec 32)) Bool)

(assert (=> b!356082 (= res!197565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356083 () Bool)

(declare-fun res!197566 () Bool)

(assert (=> b!356083 (=> (not res!197566) (not e!218211))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356083 (= res!197566 (and (= (size!9616 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9617 _keys!1456) (size!9616 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356084 () Bool)

(declare-fun e!218208 () Bool)

(assert (=> b!356084 (= e!218208 tp_is_empty!7993)))

(declare-fun res!197564 () Bool)

(assert (=> start!35526 (=> (not res!197564) (not e!218211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35526 (= res!197564 (validMask!0 mask!1842))))

(assert (=> start!35526 e!218211))

(assert (=> start!35526 true))

(declare-fun array_inv!6846 (array!19542) Bool)

(assert (=> start!35526 (and (array_inv!6846 _values!1208) e!218210)))

(declare-fun array_inv!6847 (array!19544) Bool)

(assert (=> start!35526 (array_inv!6847 _keys!1456)))

(declare-fun mapNonEmpty!13497 () Bool)

(declare-fun tp!27474 () Bool)

(assert (=> mapNonEmpty!13497 (= mapRes!13497 (and tp!27474 e!218208))))

(declare-fun mapRest!13497 () (Array (_ BitVec 32) ValueCell!3653))

(declare-fun mapValue!13497 () ValueCell!3653)

(declare-fun mapKey!13497 () (_ BitVec 32))

(assert (=> mapNonEmpty!13497 (= (arr!9264 _values!1208) (store mapRest!13497 mapKey!13497 mapValue!13497))))

(assert (= (and start!35526 res!197564) b!356083))

(assert (= (and b!356083 res!197566) b!356082))

(assert (= (and b!356082 res!197565) b!356080))

(assert (= (and b!356079 condMapEmpty!13497) mapIsEmpty!13497))

(assert (= (and b!356079 (not condMapEmpty!13497)) mapNonEmpty!13497))

(get-info :version)

(assert (= (and mapNonEmpty!13497 ((_ is ValueCellFull!3653) mapValue!13497)) b!356084))

(assert (= (and b!356079 ((_ is ValueCellFull!3653) mapDefault!13497)) b!356081))

(assert (= start!35526 b!356079))

(declare-fun m!354861 () Bool)

(assert (=> b!356080 m!354861))

(declare-fun m!354863 () Bool)

(assert (=> b!356082 m!354863))

(declare-fun m!354865 () Bool)

(assert (=> start!35526 m!354865))

(declare-fun m!354867 () Bool)

(assert (=> start!35526 m!354867))

(declare-fun m!354869 () Bool)

(assert (=> start!35526 m!354869))

(declare-fun m!354871 () Bool)

(assert (=> mapNonEmpty!13497 m!354871))

(check-sat (not start!35526) tp_is_empty!7993 (not mapNonEmpty!13497) (not b!356082) (not b!356080))
(check-sat)
