; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35416 () Bool)

(assert start!35416)

(declare-fun mapIsEmpty!13311 () Bool)

(declare-fun mapRes!13311 () Bool)

(assert (=> mapIsEmpty!13311 mapRes!13311))

(declare-fun res!196525 () Bool)

(declare-fun e!217315 () Bool)

(assert (=> start!35416 (=> (not res!196525) (not e!217315))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35416 (= res!196525 (validMask!0 mask!1842))))

(assert (=> start!35416 e!217315))

(assert (=> start!35416 true))

(declare-datatypes ((V!11469 0))(
  ( (V!11470 (val!3979 Int)) )
))
(declare-datatypes ((ValueCell!3591 0))(
  ( (ValueCellFull!3591 (v!6173 V!11469)) (EmptyCell!3591) )
))
(declare-datatypes ((array!19321 0))(
  ( (array!19322 (arr!9154 (Array (_ BitVec 32) ValueCell!3591)) (size!9506 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19321)

(declare-fun e!217313 () Bool)

(declare-fun array_inv!6732 (array!19321) Bool)

(assert (=> start!35416 (and (array_inv!6732 _values!1208) e!217313)))

(declare-datatypes ((array!19323 0))(
  ( (array!19324 (arr!9155 (Array (_ BitVec 32) (_ BitVec 64))) (size!9507 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19323)

(declare-fun array_inv!6733 (array!19323) Bool)

(assert (=> start!35416 (array_inv!6733 _keys!1456)))

(declare-fun b!354530 () Bool)

(declare-fun e!217314 () Bool)

(declare-fun tp_is_empty!7869 () Bool)

(assert (=> b!354530 (= e!217314 tp_is_empty!7869)))

(declare-fun b!354531 () Bool)

(declare-fun e!217312 () Bool)

(assert (=> b!354531 (= e!217313 (and e!217312 mapRes!13311))))

(declare-fun condMapEmpty!13311 () Bool)

(declare-fun mapDefault!13311 () ValueCell!3591)

(assert (=> b!354531 (= condMapEmpty!13311 (= (arr!9154 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3591)) mapDefault!13311)))))

(declare-fun b!354532 () Bool)

(assert (=> b!354532 (= e!217312 tp_is_empty!7869)))

(declare-fun b!354533 () Bool)

(declare-fun res!196524 () Bool)

(assert (=> b!354533 (=> (not res!196524) (not e!217315))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354533 (= res!196524 (and (= (size!9506 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9507 _keys!1456) (size!9506 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354534 () Bool)

(assert (=> b!354534 (= e!217315 false)))

(declare-fun lt!165719 () Bool)

(declare-datatypes ((List!5300 0))(
  ( (Nil!5297) (Cons!5296 (h!6152 (_ BitVec 64)) (t!10450 List!5300)) )
))
(declare-fun arrayNoDuplicates!0 (array!19323 (_ BitVec 32) List!5300) Bool)

(assert (=> b!354534 (= lt!165719 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5297))))

(declare-fun b!354535 () Bool)

(declare-fun res!196523 () Bool)

(assert (=> b!354535 (=> (not res!196523) (not e!217315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19323 (_ BitVec 32)) Bool)

(assert (=> b!354535 (= res!196523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13311 () Bool)

(declare-fun tp!27207 () Bool)

(assert (=> mapNonEmpty!13311 (= mapRes!13311 (and tp!27207 e!217314))))

(declare-fun mapValue!13311 () ValueCell!3591)

(declare-fun mapKey!13311 () (_ BitVec 32))

(declare-fun mapRest!13311 () (Array (_ BitVec 32) ValueCell!3591))

(assert (=> mapNonEmpty!13311 (= (arr!9154 _values!1208) (store mapRest!13311 mapKey!13311 mapValue!13311))))

(assert (= (and start!35416 res!196525) b!354533))

(assert (= (and b!354533 res!196524) b!354535))

(assert (= (and b!354535 res!196523) b!354534))

(assert (= (and b!354531 condMapEmpty!13311) mapIsEmpty!13311))

(assert (= (and b!354531 (not condMapEmpty!13311)) mapNonEmpty!13311))

(get-info :version)

(assert (= (and mapNonEmpty!13311 ((_ is ValueCellFull!3591) mapValue!13311)) b!354530))

(assert (= (and b!354531 ((_ is ValueCellFull!3591) mapDefault!13311)) b!354532))

(assert (= start!35416 b!354531))

(declare-fun m!353515 () Bool)

(assert (=> start!35416 m!353515))

(declare-fun m!353517 () Bool)

(assert (=> start!35416 m!353517))

(declare-fun m!353519 () Bool)

(assert (=> start!35416 m!353519))

(declare-fun m!353521 () Bool)

(assert (=> b!354534 m!353521))

(declare-fun m!353523 () Bool)

(assert (=> b!354535 m!353523))

(declare-fun m!353525 () Bool)

(assert (=> mapNonEmpty!13311 m!353525))

(check-sat (not b!354534) (not b!354535) (not start!35416) (not mapNonEmpty!13311) tp_is_empty!7869)
(check-sat)
