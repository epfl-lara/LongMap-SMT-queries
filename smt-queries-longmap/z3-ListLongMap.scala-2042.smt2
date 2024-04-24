; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35406 () Bool)

(assert start!35406)

(declare-fun mapIsEmpty!13317 () Bool)

(declare-fun mapRes!13317 () Bool)

(assert (=> mapIsEmpty!13317 mapRes!13317))

(declare-fun b!354513 () Bool)

(declare-fun e!217312 () Bool)

(declare-fun tp_is_empty!7873 () Bool)

(assert (=> b!354513 (= e!217312 tp_is_empty!7873)))

(declare-fun mapNonEmpty!13317 () Bool)

(declare-fun tp!27213 () Bool)

(declare-fun e!217310 () Bool)

(assert (=> mapNonEmpty!13317 (= mapRes!13317 (and tp!27213 e!217310))))

(declare-datatypes ((V!11475 0))(
  ( (V!11476 (val!3981 Int)) )
))
(declare-datatypes ((ValueCell!3593 0))(
  ( (ValueCellFull!3593 (v!6176 V!11475)) (EmptyCell!3593) )
))
(declare-fun mapRest!13317 () (Array (_ BitVec 32) ValueCell!3593))

(declare-fun mapValue!13317 () ValueCell!3593)

(declare-fun mapKey!13317 () (_ BitVec 32))

(declare-datatypes ((array!19316 0))(
  ( (array!19317 (arr!9151 (Array (_ BitVec 32) ValueCell!3593)) (size!9503 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19316)

(assert (=> mapNonEmpty!13317 (= (arr!9151 _values!1208) (store mapRest!13317 mapKey!13317 mapValue!13317))))

(declare-fun b!354514 () Bool)

(declare-fun res!196539 () Bool)

(declare-fun e!217309 () Bool)

(assert (=> b!354514 (=> (not res!196539) (not e!217309))))

(declare-datatypes ((array!19318 0))(
  ( (array!19319 (arr!9152 (Array (_ BitVec 32) (_ BitVec 64))) (size!9504 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19318)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19318 (_ BitVec 32)) Bool)

(assert (=> b!354514 (= res!196539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354515 () Bool)

(declare-fun res!196540 () Bool)

(assert (=> b!354515 (=> (not res!196540) (not e!217309))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354515 (= res!196540 (and (= (size!9503 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9504 _keys!1456) (size!9503 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354516 () Bool)

(assert (=> b!354516 (= e!217310 tp_is_empty!7873)))

(declare-fun b!354517 () Bool)

(assert (=> b!354517 (= e!217309 false)))

(declare-fun lt!165743 () Bool)

(declare-datatypes ((List!5208 0))(
  ( (Nil!5205) (Cons!5204 (h!6060 (_ BitVec 64)) (t!10350 List!5208)) )
))
(declare-fun arrayNoDuplicates!0 (array!19318 (_ BitVec 32) List!5208) Bool)

(assert (=> b!354517 (= lt!165743 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5205))))

(declare-fun res!196538 () Bool)

(assert (=> start!35406 (=> (not res!196538) (not e!217309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35406 (= res!196538 (validMask!0 mask!1842))))

(assert (=> start!35406 e!217309))

(assert (=> start!35406 true))

(declare-fun e!217311 () Bool)

(declare-fun array_inv!6762 (array!19316) Bool)

(assert (=> start!35406 (and (array_inv!6762 _values!1208) e!217311)))

(declare-fun array_inv!6763 (array!19318) Bool)

(assert (=> start!35406 (array_inv!6763 _keys!1456)))

(declare-fun b!354518 () Bool)

(assert (=> b!354518 (= e!217311 (and e!217312 mapRes!13317))))

(declare-fun condMapEmpty!13317 () Bool)

(declare-fun mapDefault!13317 () ValueCell!3593)

(assert (=> b!354518 (= condMapEmpty!13317 (= (arr!9151 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3593)) mapDefault!13317)))))

(assert (= (and start!35406 res!196538) b!354515))

(assert (= (and b!354515 res!196540) b!354514))

(assert (= (and b!354514 res!196539) b!354517))

(assert (= (and b!354518 condMapEmpty!13317) mapIsEmpty!13317))

(assert (= (and b!354518 (not condMapEmpty!13317)) mapNonEmpty!13317))

(get-info :version)

(assert (= (and mapNonEmpty!13317 ((_ is ValueCellFull!3593) mapValue!13317)) b!354516))

(assert (= (and b!354518 ((_ is ValueCellFull!3593) mapDefault!13317)) b!354513))

(assert (= start!35406 b!354518))

(declare-fun m!353763 () Bool)

(assert (=> mapNonEmpty!13317 m!353763))

(declare-fun m!353765 () Bool)

(assert (=> b!354514 m!353765))

(declare-fun m!353767 () Bool)

(assert (=> b!354517 m!353767))

(declare-fun m!353769 () Bool)

(assert (=> start!35406 m!353769))

(declare-fun m!353771 () Bool)

(assert (=> start!35406 m!353771))

(declare-fun m!353773 () Bool)

(assert (=> start!35406 m!353773))

(check-sat (not b!354514) tp_is_empty!7873 (not b!354517) (not mapNonEmpty!13317) (not start!35406))
(check-sat)
