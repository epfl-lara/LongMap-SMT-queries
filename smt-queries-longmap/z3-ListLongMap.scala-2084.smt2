; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35658 () Bool)

(assert start!35658)

(declare-fun b!358062 () Bool)

(declare-fun e!219137 () Bool)

(declare-fun tp_is_empty!8125 () Bool)

(assert (=> b!358062 (= e!219137 tp_is_empty!8125)))

(declare-fun b!358063 () Bool)

(declare-fun e!219141 () Bool)

(assert (=> b!358063 (= e!219141 false)))

(declare-fun lt!165940 () Bool)

(declare-datatypes ((array!19801 0))(
  ( (array!19802 (arr!9394 (Array (_ BitVec 32) (_ BitVec 64))) (size!9747 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19801)

(declare-datatypes ((List!5393 0))(
  ( (Nil!5390) (Cons!5389 (h!6245 (_ BitVec 64)) (t!10534 List!5393)) )
))
(declare-fun arrayNoDuplicates!0 (array!19801 (_ BitVec 32) List!5393) Bool)

(assert (=> b!358063 (= lt!165940 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5390))))

(declare-fun mapIsEmpty!13695 () Bool)

(declare-fun mapRes!13695 () Bool)

(assert (=> mapIsEmpty!13695 mapRes!13695))

(declare-fun b!358064 () Bool)

(declare-fun res!199049 () Bool)

(assert (=> b!358064 (=> (not res!199049) (not e!219141))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11811 0))(
  ( (V!11812 (val!4107 Int)) )
))
(declare-datatypes ((ValueCell!3719 0))(
  ( (ValueCellFull!3719 (v!6295 V!11811)) (EmptyCell!3719) )
))
(declare-datatypes ((array!19803 0))(
  ( (array!19804 (arr!9395 (Array (_ BitVec 32) ValueCell!3719)) (size!9748 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19803)

(assert (=> b!358064 (= res!199049 (and (= (size!9748 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9747 _keys!1456) (size!9748 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358065 () Bool)

(declare-fun res!199050 () Bool)

(assert (=> b!358065 (=> (not res!199050) (not e!219141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19801 (_ BitVec 32)) Bool)

(assert (=> b!358065 (= res!199050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13695 () Bool)

(declare-fun tp!27753 () Bool)

(assert (=> mapNonEmpty!13695 (= mapRes!13695 (and tp!27753 e!219137))))

(declare-fun mapRest!13695 () (Array (_ BitVec 32) ValueCell!3719))

(declare-fun mapKey!13695 () (_ BitVec 32))

(declare-fun mapValue!13695 () ValueCell!3719)

(assert (=> mapNonEmpty!13695 (= (arr!9395 _values!1208) (store mapRest!13695 mapKey!13695 mapValue!13695))))

(declare-fun res!199051 () Bool)

(assert (=> start!35658 (=> (not res!199051) (not e!219141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35658 (= res!199051 (validMask!0 mask!1842))))

(assert (=> start!35658 e!219141))

(assert (=> start!35658 true))

(declare-fun e!219139 () Bool)

(declare-fun array_inv!6930 (array!19803) Bool)

(assert (=> start!35658 (and (array_inv!6930 _values!1208) e!219139)))

(declare-fun array_inv!6931 (array!19801) Bool)

(assert (=> start!35658 (array_inv!6931 _keys!1456)))

(declare-fun b!358066 () Bool)

(declare-fun e!219140 () Bool)

(assert (=> b!358066 (= e!219139 (and e!219140 mapRes!13695))))

(declare-fun condMapEmpty!13695 () Bool)

(declare-fun mapDefault!13695 () ValueCell!3719)

(assert (=> b!358066 (= condMapEmpty!13695 (= (arr!9395 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3719)) mapDefault!13695)))))

(declare-fun b!358067 () Bool)

(assert (=> b!358067 (= e!219140 tp_is_empty!8125)))

(assert (= (and start!35658 res!199051) b!358064))

(assert (= (and b!358064 res!199049) b!358065))

(assert (= (and b!358065 res!199050) b!358063))

(assert (= (and b!358066 condMapEmpty!13695) mapIsEmpty!13695))

(assert (= (and b!358066 (not condMapEmpty!13695)) mapNonEmpty!13695))

(get-info :version)

(assert (= (and mapNonEmpty!13695 ((_ is ValueCellFull!3719) mapValue!13695)) b!358062))

(assert (= (and b!358066 ((_ is ValueCellFull!3719) mapDefault!13695)) b!358067))

(assert (= start!35658 b!358066))

(declare-fun m!355473 () Bool)

(assert (=> b!358063 m!355473))

(declare-fun m!355475 () Bool)

(assert (=> b!358065 m!355475))

(declare-fun m!355477 () Bool)

(assert (=> mapNonEmpty!13695 m!355477))

(declare-fun m!355479 () Bool)

(assert (=> start!35658 m!355479))

(declare-fun m!355481 () Bool)

(assert (=> start!35658 m!355481))

(declare-fun m!355483 () Bool)

(assert (=> start!35658 m!355483))

(check-sat tp_is_empty!8125 (not mapNonEmpty!13695) (not b!358063) (not start!35658) (not b!358065))
(check-sat)
