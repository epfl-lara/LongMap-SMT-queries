; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35704 () Bool)

(assert start!35704)

(declare-fun b!358625 () Bool)

(declare-fun e!219555 () Bool)

(declare-fun tp_is_empty!8157 () Bool)

(assert (=> b!358625 (= e!219555 tp_is_empty!8157)))

(declare-fun res!199322 () Bool)

(declare-fun e!219556 () Bool)

(assert (=> start!35704 (=> (not res!199322) (not e!219556))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35704 (= res!199322 (validMask!0 mask!1842))))

(assert (=> start!35704 e!219556))

(assert (=> start!35704 true))

(declare-datatypes ((V!11853 0))(
  ( (V!11854 (val!4123 Int)) )
))
(declare-datatypes ((ValueCell!3735 0))(
  ( (ValueCellFull!3735 (v!6317 V!11853)) (EmptyCell!3735) )
))
(declare-datatypes ((array!19879 0))(
  ( (array!19880 (arr!9433 (Array (_ BitVec 32) ValueCell!3735)) (size!9785 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19879)

(declare-fun e!219557 () Bool)

(declare-fun array_inv!6938 (array!19879) Bool)

(assert (=> start!35704 (and (array_inv!6938 _values!1208) e!219557)))

(declare-datatypes ((array!19881 0))(
  ( (array!19882 (arr!9434 (Array (_ BitVec 32) (_ BitVec 64))) (size!9786 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19881)

(declare-fun array_inv!6939 (array!19881) Bool)

(assert (=> start!35704 (array_inv!6939 _keys!1456)))

(declare-fun b!358626 () Bool)

(assert (=> b!358626 (= e!219556 false)))

(declare-fun lt!166223 () Bool)

(declare-datatypes ((List!5439 0))(
  ( (Nil!5436) (Cons!5435 (h!6291 (_ BitVec 64)) (t!10589 List!5439)) )
))
(declare-fun arrayNoDuplicates!0 (array!19881 (_ BitVec 32) List!5439) Bool)

(assert (=> b!358626 (= lt!166223 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5436))))

(declare-fun b!358627 () Bool)

(declare-fun res!199324 () Bool)

(assert (=> b!358627 (=> (not res!199324) (not e!219556))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358627 (= res!199324 (and (= (size!9785 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9786 _keys!1456) (size!9785 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358628 () Bool)

(declare-fun e!219554 () Bool)

(assert (=> b!358628 (= e!219554 tp_is_empty!8157)))

(declare-fun b!358629 () Bool)

(declare-fun res!199323 () Bool)

(assert (=> b!358629 (=> (not res!199323) (not e!219556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19881 (_ BitVec 32)) Bool)

(assert (=> b!358629 (= res!199323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358630 () Bool)

(declare-fun mapRes!13743 () Bool)

(assert (=> b!358630 (= e!219557 (and e!219554 mapRes!13743))))

(declare-fun condMapEmpty!13743 () Bool)

(declare-fun mapDefault!13743 () ValueCell!3735)

(assert (=> b!358630 (= condMapEmpty!13743 (= (arr!9433 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3735)) mapDefault!13743)))))

(declare-fun mapNonEmpty!13743 () Bool)

(declare-fun tp!27801 () Bool)

(assert (=> mapNonEmpty!13743 (= mapRes!13743 (and tp!27801 e!219555))))

(declare-fun mapRest!13743 () (Array (_ BitVec 32) ValueCell!3735))

(declare-fun mapKey!13743 () (_ BitVec 32))

(declare-fun mapValue!13743 () ValueCell!3735)

(assert (=> mapNonEmpty!13743 (= (arr!9433 _values!1208) (store mapRest!13743 mapKey!13743 mapValue!13743))))

(declare-fun mapIsEmpty!13743 () Bool)

(assert (=> mapIsEmpty!13743 mapRes!13743))

(assert (= (and start!35704 res!199322) b!358627))

(assert (= (and b!358627 res!199324) b!358629))

(assert (= (and b!358629 res!199323) b!358626))

(assert (= (and b!358630 condMapEmpty!13743) mapIsEmpty!13743))

(assert (= (and b!358630 (not condMapEmpty!13743)) mapNonEmpty!13743))

(get-info :version)

(assert (= (and mapNonEmpty!13743 ((_ is ValueCellFull!3735) mapValue!13743)) b!358625))

(assert (= (and b!358630 ((_ is ValueCellFull!3735) mapDefault!13743)) b!358628))

(assert (= start!35704 b!358630))

(declare-fun m!356395 () Bool)

(assert (=> start!35704 m!356395))

(declare-fun m!356397 () Bool)

(assert (=> start!35704 m!356397))

(declare-fun m!356399 () Bool)

(assert (=> start!35704 m!356399))

(declare-fun m!356401 () Bool)

(assert (=> b!358626 m!356401))

(declare-fun m!356403 () Bool)

(assert (=> b!358629 m!356403))

(declare-fun m!356405 () Bool)

(assert (=> mapNonEmpty!13743 m!356405))

(check-sat (not b!358626) (not b!358629) (not start!35704) tp_is_empty!8157 (not mapNonEmpty!13743))
(check-sat)
