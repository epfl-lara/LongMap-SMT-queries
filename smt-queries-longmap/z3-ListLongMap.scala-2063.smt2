; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35548 () Bool)

(assert start!35548)

(declare-fun b!356229 () Bool)

(declare-fun res!197629 () Bool)

(declare-fun e!218304 () Bool)

(assert (=> b!356229 (=> (not res!197629) (not e!218304))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356229 (= res!197629 (validKeyInArray!0 k0!1077))))

(declare-fun b!356230 () Bool)

(declare-fun res!197630 () Bool)

(assert (=> b!356230 (=> (not res!197630) (not e!218304))))

(declare-datatypes ((array!19573 0))(
  ( (array!19574 (arr!9280 (Array (_ BitVec 32) (_ BitVec 64))) (size!9632 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19573)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19573 (_ BitVec 32)) Bool)

(assert (=> b!356230 (= res!197630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356231 () Bool)

(declare-fun res!197631 () Bool)

(assert (=> b!356231 (=> (not res!197631) (not e!218304))))

(declare-datatypes ((List!5365 0))(
  ( (Nil!5362) (Cons!5361 (h!6217 (_ BitVec 64)) (t!10515 List!5365)) )
))
(declare-fun arrayNoDuplicates!0 (array!19573 (_ BitVec 32) List!5365) Bool)

(assert (=> b!356231 (= res!197631 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5362))))

(declare-fun b!356232 () Bool)

(declare-fun e!218305 () Bool)

(declare-fun tp_is_empty!8001 () Bool)

(assert (=> b!356232 (= e!218305 tp_is_empty!8001)))

(declare-fun b!356233 () Bool)

(declare-fun res!197628 () Bool)

(assert (=> b!356233 (=> (not res!197628) (not e!218304))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356233 (= res!197628 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9632 _keys!1456))))))

(declare-fun b!356234 () Bool)

(declare-fun res!197634 () Bool)

(assert (=> b!356234 (=> (not res!197634) (not e!218304))))

(declare-fun arrayContainsKey!0 (array!19573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356234 (= res!197634 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356236 () Bool)

(declare-fun res!197635 () Bool)

(assert (=> b!356236 (=> (not res!197635) (not e!218304))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11645 0))(
  ( (V!11646 (val!4045 Int)) )
))
(declare-datatypes ((ValueCell!3657 0))(
  ( (ValueCellFull!3657 (v!6239 V!11645)) (EmptyCell!3657) )
))
(declare-datatypes ((array!19575 0))(
  ( (array!19576 (arr!9281 (Array (_ BitVec 32) ValueCell!3657)) (size!9633 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19575)

(assert (=> b!356236 (= res!197635 (and (= (size!9633 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9632 _keys!1456) (size!9633 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356237 () Bool)

(assert (=> b!356237 (= e!218304 (not true))))

(assert (=> b!356237 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11645)

(declare-datatypes ((Unit!10964 0))(
  ( (Unit!10965) )
))
(declare-fun lt!165917 () Unit!10964)

(declare-fun zeroValue!1150 () V!11645)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!1 (array!19573 array!19575 (_ BitVec 32) (_ BitVec 32) V!11645 V!11645 (_ BitVec 64) (_ BitVec 32)) Unit!10964)

(assert (=> b!356237 (= lt!165917 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!1 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356235 () Bool)

(declare-fun e!218303 () Bool)

(declare-fun e!218306 () Bool)

(declare-fun mapRes!13509 () Bool)

(assert (=> b!356235 (= e!218303 (and e!218306 mapRes!13509))))

(declare-fun condMapEmpty!13509 () Bool)

(declare-fun mapDefault!13509 () ValueCell!3657)

(assert (=> b!356235 (= condMapEmpty!13509 (= (arr!9281 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3657)) mapDefault!13509)))))

(declare-fun res!197633 () Bool)

(assert (=> start!35548 (=> (not res!197633) (not e!218304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35548 (= res!197633 (validMask!0 mask!1842))))

(assert (=> start!35548 e!218304))

(assert (=> start!35548 tp_is_empty!8001))

(assert (=> start!35548 true))

(declare-fun array_inv!6822 (array!19573) Bool)

(assert (=> start!35548 (array_inv!6822 _keys!1456)))

(declare-fun array_inv!6823 (array!19575) Bool)

(assert (=> start!35548 (and (array_inv!6823 _values!1208) e!218303)))

(declare-fun b!356238 () Bool)

(declare-fun res!197632 () Bool)

(assert (=> b!356238 (=> (not res!197632) (not e!218304))))

(assert (=> b!356238 (= res!197632 (not (= (select (arr!9280 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapNonEmpty!13509 () Bool)

(declare-fun tp!27486 () Bool)

(assert (=> mapNonEmpty!13509 (= mapRes!13509 (and tp!27486 e!218305))))

(declare-fun mapKey!13509 () (_ BitVec 32))

(declare-fun mapRest!13509 () (Array (_ BitVec 32) ValueCell!3657))

(declare-fun mapValue!13509 () ValueCell!3657)

(assert (=> mapNonEmpty!13509 (= (arr!9281 _values!1208) (store mapRest!13509 mapKey!13509 mapValue!13509))))

(declare-fun mapIsEmpty!13509 () Bool)

(assert (=> mapIsEmpty!13509 mapRes!13509))

(declare-fun b!356239 () Bool)

(assert (=> b!356239 (= e!218306 tp_is_empty!8001)))

(assert (= (and start!35548 res!197633) b!356236))

(assert (= (and b!356236 res!197635) b!356230))

(assert (= (and b!356230 res!197630) b!356231))

(assert (= (and b!356231 res!197631) b!356229))

(assert (= (and b!356229 res!197629) b!356233))

(assert (= (and b!356233 res!197628) b!356234))

(assert (= (and b!356234 res!197634) b!356238))

(assert (= (and b!356238 res!197632) b!356237))

(assert (= (and b!356235 condMapEmpty!13509) mapIsEmpty!13509))

(assert (= (and b!356235 (not condMapEmpty!13509)) mapNonEmpty!13509))

(get-info :version)

(assert (= (and mapNonEmpty!13509 ((_ is ValueCellFull!3657) mapValue!13509)) b!356232))

(assert (= (and b!356235 ((_ is ValueCellFull!3657) mapDefault!13509)) b!356239))

(assert (= start!35548 b!356235))

(declare-fun m!354695 () Bool)

(assert (=> mapNonEmpty!13509 m!354695))

(declare-fun m!354697 () Bool)

(assert (=> start!35548 m!354697))

(declare-fun m!354699 () Bool)

(assert (=> start!35548 m!354699))

(declare-fun m!354701 () Bool)

(assert (=> start!35548 m!354701))

(declare-fun m!354703 () Bool)

(assert (=> b!356229 m!354703))

(declare-fun m!354705 () Bool)

(assert (=> b!356237 m!354705))

(declare-fun m!354707 () Bool)

(assert (=> b!356237 m!354707))

(declare-fun m!354709 () Bool)

(assert (=> b!356231 m!354709))

(declare-fun m!354711 () Bool)

(assert (=> b!356230 m!354711))

(declare-fun m!354713 () Bool)

(assert (=> b!356238 m!354713))

(declare-fun m!354715 () Bool)

(assert (=> b!356234 m!354715))

(check-sat tp_is_empty!8001 (not b!356229) (not mapNonEmpty!13509) (not b!356230) (not b!356231) (not b!356237) (not b!356234) (not start!35548))
(check-sat)
