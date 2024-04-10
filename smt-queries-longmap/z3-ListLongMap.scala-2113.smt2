; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35848 () Bool)

(assert start!35848)

(declare-fun b!360315 () Bool)

(declare-fun res!200370 () Bool)

(declare-fun e!220633 () Bool)

(assert (=> b!360315 (=> (not res!200370) (not e!220633))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20153 0))(
  ( (array!20154 (arr!9570 (Array (_ BitVec 32) (_ BitVec 64))) (size!9922 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20153)

(declare-datatypes ((V!12045 0))(
  ( (V!12046 (val!4195 Int)) )
))
(declare-datatypes ((ValueCell!3807 0))(
  ( (ValueCellFull!3807 (v!6389 V!12045)) (EmptyCell!3807) )
))
(declare-datatypes ((array!20155 0))(
  ( (array!20156 (arr!9571 (Array (_ BitVec 32) ValueCell!3807)) (size!9923 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20155)

(assert (=> b!360315 (= res!200370 (and (= (size!9923 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9922 _keys!1456) (size!9923 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!200369 () Bool)

(assert (=> start!35848 (=> (not res!200369) (not e!220633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35848 (= res!200369 (validMask!0 mask!1842))))

(assert (=> start!35848 e!220633))

(declare-fun tp_is_empty!8301 () Bool)

(assert (=> start!35848 tp_is_empty!8301))

(assert (=> start!35848 true))

(declare-fun array_inv!7038 (array!20153) Bool)

(assert (=> start!35848 (array_inv!7038 _keys!1456)))

(declare-fun e!220637 () Bool)

(declare-fun array_inv!7039 (array!20155) Bool)

(assert (=> start!35848 (and (array_inv!7039 _values!1208) e!220637)))

(declare-fun b!360316 () Bool)

(declare-fun res!200365 () Bool)

(assert (=> b!360316 (=> (not res!200365) (not e!220633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20153 (_ BitVec 32)) Bool)

(assert (=> b!360316 (= res!200365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13959 () Bool)

(declare-fun mapRes!13959 () Bool)

(declare-fun tp!28026 () Bool)

(declare-fun e!220635 () Bool)

(assert (=> mapNonEmpty!13959 (= mapRes!13959 (and tp!28026 e!220635))))

(declare-fun mapKey!13959 () (_ BitVec 32))

(declare-fun mapValue!13959 () ValueCell!3807)

(declare-fun mapRest!13959 () (Array (_ BitVec 32) ValueCell!3807))

(assert (=> mapNonEmpty!13959 (= (arr!9571 _values!1208) (store mapRest!13959 mapKey!13959 mapValue!13959))))

(declare-fun b!360317 () Bool)

(declare-fun res!200368 () Bool)

(assert (=> b!360317 (=> (not res!200368) (not e!220633))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360317 (= res!200368 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360318 () Bool)

(declare-fun res!200364 () Bool)

(assert (=> b!360318 (=> (not res!200364) (not e!220633))))

(assert (=> b!360318 (= res!200364 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9922 _keys!1456))))))

(declare-fun b!360319 () Bool)

(declare-fun res!200366 () Bool)

(assert (=> b!360319 (=> (not res!200366) (not e!220633))))

(assert (=> b!360319 (= res!200366 (not (= (select (arr!9570 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360320 () Bool)

(assert (=> b!360320 (= e!220635 tp_is_empty!8301)))

(declare-fun mapIsEmpty!13959 () Bool)

(assert (=> mapIsEmpty!13959 mapRes!13959))

(declare-fun b!360321 () Bool)

(assert (=> b!360321 (= e!220633 (not true))))

(assert (=> b!360321 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12045)

(declare-datatypes ((Unit!11082 0))(
  ( (Unit!11083) )
))
(declare-fun lt!166439 () Unit!11082)

(declare-fun zeroValue!1150 () V!12045)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!56 (array!20153 array!20155 (_ BitVec 32) (_ BitVec 32) V!12045 V!12045 (_ BitVec 64) (_ BitVec 32)) Unit!11082)

(assert (=> b!360321 (= lt!166439 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!56 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360322 () Bool)

(declare-fun e!220636 () Bool)

(assert (=> b!360322 (= e!220636 tp_is_empty!8301)))

(declare-fun b!360323 () Bool)

(assert (=> b!360323 (= e!220637 (and e!220636 mapRes!13959))))

(declare-fun condMapEmpty!13959 () Bool)

(declare-fun mapDefault!13959 () ValueCell!3807)

(assert (=> b!360323 (= condMapEmpty!13959 (= (arr!9571 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3807)) mapDefault!13959)))))

(declare-fun b!360324 () Bool)

(declare-fun res!200371 () Bool)

(assert (=> b!360324 (=> (not res!200371) (not e!220633))))

(declare-datatypes ((List!5486 0))(
  ( (Nil!5483) (Cons!5482 (h!6338 (_ BitVec 64)) (t!10636 List!5486)) )
))
(declare-fun arrayNoDuplicates!0 (array!20153 (_ BitVec 32) List!5486) Bool)

(assert (=> b!360324 (= res!200371 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5483))))

(declare-fun b!360325 () Bool)

(declare-fun res!200367 () Bool)

(assert (=> b!360325 (=> (not res!200367) (not e!220633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360325 (= res!200367 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35848 res!200369) b!360315))

(assert (= (and b!360315 res!200370) b!360316))

(assert (= (and b!360316 res!200365) b!360324))

(assert (= (and b!360324 res!200371) b!360325))

(assert (= (and b!360325 res!200367) b!360318))

(assert (= (and b!360318 res!200364) b!360317))

(assert (= (and b!360317 res!200368) b!360319))

(assert (= (and b!360319 res!200366) b!360321))

(assert (= (and b!360323 condMapEmpty!13959) mapIsEmpty!13959))

(assert (= (and b!360323 (not condMapEmpty!13959)) mapNonEmpty!13959))

(get-info :version)

(assert (= (and mapNonEmpty!13959 ((_ is ValueCellFull!3807) mapValue!13959)) b!360320))

(assert (= (and b!360323 ((_ is ValueCellFull!3807) mapDefault!13959)) b!360322))

(assert (= start!35848 b!360323))

(declare-fun m!357521 () Bool)

(assert (=> b!360325 m!357521))

(declare-fun m!357523 () Bool)

(assert (=> start!35848 m!357523))

(declare-fun m!357525 () Bool)

(assert (=> start!35848 m!357525))

(declare-fun m!357527 () Bool)

(assert (=> start!35848 m!357527))

(declare-fun m!357529 () Bool)

(assert (=> mapNonEmpty!13959 m!357529))

(declare-fun m!357531 () Bool)

(assert (=> b!360321 m!357531))

(declare-fun m!357533 () Bool)

(assert (=> b!360321 m!357533))

(declare-fun m!357535 () Bool)

(assert (=> b!360324 m!357535))

(declare-fun m!357537 () Bool)

(assert (=> b!360317 m!357537))

(declare-fun m!357539 () Bool)

(assert (=> b!360316 m!357539))

(declare-fun m!357541 () Bool)

(assert (=> b!360319 m!357541))

(check-sat tp_is_empty!8301 (not mapNonEmpty!13959) (not b!360317) (not b!360325) (not b!360324) (not start!35848) (not b!360316) (not b!360321))
(check-sat)
