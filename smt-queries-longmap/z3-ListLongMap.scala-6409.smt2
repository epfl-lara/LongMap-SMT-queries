; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82418 () Bool)

(assert start!82418)

(declare-fun b_free!18523 () Bool)

(declare-fun b_next!18523 () Bool)

(assert (=> start!82418 (= b_free!18523 (not b_next!18523))))

(declare-fun tp!64531 () Bool)

(declare-fun b_and!30021 () Bool)

(assert (=> start!82418 (= tp!64531 b_and!30021)))

(declare-fun b!959642 () Bool)

(declare-fun res!642092 () Bool)

(declare-fun e!541077 () Bool)

(assert (=> b!959642 (=> (not res!642092) (not e!541077))))

(declare-datatypes ((array!58586 0))(
  ( (array!58587 (arr!28162 (Array (_ BitVec 32) (_ BitVec 64))) (size!28642 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58586)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58586 (_ BitVec 32)) Bool)

(assert (=> b!959642 (= res!642092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959643 () Bool)

(declare-fun e!541076 () Bool)

(declare-fun e!541073 () Bool)

(declare-fun mapRes!33823 () Bool)

(assert (=> b!959643 (= e!541076 (and e!541073 mapRes!33823))))

(declare-fun condMapEmpty!33823 () Bool)

(declare-datatypes ((V!33289 0))(
  ( (V!33290 (val!10665 Int)) )
))
(declare-datatypes ((ValueCell!10133 0))(
  ( (ValueCellFull!10133 (v!13219 V!33289)) (EmptyCell!10133) )
))
(declare-datatypes ((array!58588 0))(
  ( (array!58589 (arr!28163 (Array (_ BitVec 32) ValueCell!10133)) (size!28643 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58588)

(declare-fun mapDefault!33823 () ValueCell!10133)

(assert (=> b!959643 (= condMapEmpty!33823 (= (arr!28163 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10133)) mapDefault!33823)))))

(declare-fun b!959644 () Bool)

(declare-fun res!642091 () Bool)

(assert (=> b!959644 (=> (not res!642091) (not e!541077))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959644 (= res!642091 (validKeyInArray!0 (select (arr!28162 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33823 () Bool)

(declare-fun tp!64530 () Bool)

(declare-fun e!541074 () Bool)

(assert (=> mapNonEmpty!33823 (= mapRes!33823 (and tp!64530 e!541074))))

(declare-fun mapValue!33823 () ValueCell!10133)

(declare-fun mapKey!33823 () (_ BitVec 32))

(declare-fun mapRest!33823 () (Array (_ BitVec 32) ValueCell!10133))

(assert (=> mapNonEmpty!33823 (= (arr!28163 _values!1386) (store mapRest!33823 mapKey!33823 mapValue!33823))))

(declare-fun res!642093 () Bool)

(assert (=> start!82418 (=> (not res!642093) (not e!541077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82418 (= res!642093 (validMask!0 mask!2088))))

(assert (=> start!82418 e!541077))

(assert (=> start!82418 true))

(declare-fun tp_is_empty!21229 () Bool)

(assert (=> start!82418 tp_is_empty!21229))

(declare-fun array_inv!21913 (array!58586) Bool)

(assert (=> start!82418 (array_inv!21913 _keys!1668)))

(declare-fun array_inv!21914 (array!58588) Bool)

(assert (=> start!82418 (and (array_inv!21914 _values!1386) e!541076)))

(assert (=> start!82418 tp!64531))

(declare-fun b!959645 () Bool)

(assert (=> b!959645 (= e!541077 false)))

(declare-fun minValue!1328 () V!33289)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430837 () Bool)

(declare-fun zeroValue!1328 () V!33289)

(declare-datatypes ((tuple2!13732 0))(
  ( (tuple2!13733 (_1!6877 (_ BitVec 64)) (_2!6877 V!33289)) )
))
(declare-datatypes ((List!19564 0))(
  ( (Nil!19561) (Cons!19560 (h!20728 tuple2!13732) (t!27919 List!19564)) )
))
(declare-datatypes ((ListLongMap!12431 0))(
  ( (ListLongMap!12432 (toList!6231 List!19564)) )
))
(declare-fun contains!5345 (ListLongMap!12431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3464 (array!58586 array!58588 (_ BitVec 32) (_ BitVec 32) V!33289 V!33289 (_ BitVec 32) Int) ListLongMap!12431)

(assert (=> b!959645 (= lt!430837 (contains!5345 (getCurrentListMap!3464 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28162 _keys!1668) i!793)))))

(declare-fun b!959646 () Bool)

(declare-fun res!642089 () Bool)

(assert (=> b!959646 (=> (not res!642089) (not e!541077))))

(assert (=> b!959646 (= res!642089 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28642 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28642 _keys!1668))))))

(declare-fun b!959647 () Bool)

(assert (=> b!959647 (= e!541074 tp_is_empty!21229)))

(declare-fun b!959648 () Bool)

(declare-fun res!642094 () Bool)

(assert (=> b!959648 (=> (not res!642094) (not e!541077))))

(declare-datatypes ((List!19565 0))(
  ( (Nil!19562) (Cons!19561 (h!20729 (_ BitVec 64)) (t!27920 List!19565)) )
))
(declare-fun arrayNoDuplicates!0 (array!58586 (_ BitVec 32) List!19565) Bool)

(assert (=> b!959648 (= res!642094 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19562))))

(declare-fun b!959649 () Bool)

(assert (=> b!959649 (= e!541073 tp_is_empty!21229)))

(declare-fun b!959650 () Bool)

(declare-fun res!642090 () Bool)

(assert (=> b!959650 (=> (not res!642090) (not e!541077))))

(assert (=> b!959650 (= res!642090 (and (= (size!28643 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28642 _keys!1668) (size!28643 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33823 () Bool)

(assert (=> mapIsEmpty!33823 mapRes!33823))

(assert (= (and start!82418 res!642093) b!959650))

(assert (= (and b!959650 res!642090) b!959642))

(assert (= (and b!959642 res!642092) b!959648))

(assert (= (and b!959648 res!642094) b!959646))

(assert (= (and b!959646 res!642089) b!959644))

(assert (= (and b!959644 res!642091) b!959645))

(assert (= (and b!959643 condMapEmpty!33823) mapIsEmpty!33823))

(assert (= (and b!959643 (not condMapEmpty!33823)) mapNonEmpty!33823))

(get-info :version)

(assert (= (and mapNonEmpty!33823 ((_ is ValueCellFull!10133) mapValue!33823)) b!959647))

(assert (= (and b!959643 ((_ is ValueCellFull!10133) mapDefault!33823)) b!959649))

(assert (= start!82418 b!959643))

(declare-fun m!890631 () Bool)

(assert (=> b!959645 m!890631))

(declare-fun m!890633 () Bool)

(assert (=> b!959645 m!890633))

(assert (=> b!959645 m!890631))

(assert (=> b!959645 m!890633))

(declare-fun m!890635 () Bool)

(assert (=> b!959645 m!890635))

(declare-fun m!890637 () Bool)

(assert (=> mapNonEmpty!33823 m!890637))

(declare-fun m!890639 () Bool)

(assert (=> start!82418 m!890639))

(declare-fun m!890641 () Bool)

(assert (=> start!82418 m!890641))

(declare-fun m!890643 () Bool)

(assert (=> start!82418 m!890643))

(assert (=> b!959644 m!890633))

(assert (=> b!959644 m!890633))

(declare-fun m!890645 () Bool)

(assert (=> b!959644 m!890645))

(declare-fun m!890647 () Bool)

(assert (=> b!959648 m!890647))

(declare-fun m!890649 () Bool)

(assert (=> b!959642 m!890649))

(check-sat (not b!959645) (not b!959642) (not mapNonEmpty!33823) (not b!959648) tp_is_empty!21229 b_and!30021 (not start!82418) (not b_next!18523) (not b!959644))
(check-sat b_and!30021 (not b_next!18523))
