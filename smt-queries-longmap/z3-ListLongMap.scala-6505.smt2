; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82852 () Bool)

(assert start!82852)

(declare-fun b_free!18997 () Bool)

(declare-fun b_next!18997 () Bool)

(assert (=> start!82852 (= b_free!18997 (not b_next!18997))))

(declare-fun tp!66120 () Bool)

(declare-fun b_and!30459 () Bool)

(assert (=> start!82852 (= tp!66120 b_and!30459)))

(declare-fun b!966550 () Bool)

(declare-fun res!647036 () Bool)

(declare-fun e!544842 () Bool)

(assert (=> b!966550 (=> (not res!647036) (not e!544842))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966550 (= res!647036 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966551 () Bool)

(assert (=> b!966551 (= e!544842 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34057 0))(
  ( (V!34058 (val!10953 Int)) )
))
(declare-datatypes ((ValueCell!10421 0))(
  ( (ValueCellFull!10421 (v!13510 V!34057)) (EmptyCell!10421) )
))
(declare-datatypes ((array!59618 0))(
  ( (array!59619 (arr!28678 (Array (_ BitVec 32) ValueCell!10421)) (size!29159 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59618)

(declare-datatypes ((array!59620 0))(
  ( (array!59621 (arr!28679 (Array (_ BitVec 32) (_ BitVec 64))) (size!29160 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59620)

(declare-fun minValue!1342 () V!34057)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34057)

(declare-datatypes ((tuple2!14154 0))(
  ( (tuple2!14155 (_1!7088 (_ BitVec 64)) (_2!7088 V!34057)) )
))
(declare-datatypes ((List!19961 0))(
  ( (Nil!19958) (Cons!19957 (h!21119 tuple2!14154) (t!28315 List!19961)) )
))
(declare-datatypes ((ListLongMap!12841 0))(
  ( (ListLongMap!12842 (toList!6436 List!19961)) )
))
(declare-fun contains!5481 (ListLongMap!12841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3598 (array!59620 array!59618 (_ BitVec 32) (_ BitVec 32) V!34057 V!34057 (_ BitVec 32) Int) ListLongMap!12841)

(assert (=> b!966551 (contains!5481 (getCurrentListMap!3598 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28679 _keys!1686) i!803))))

(declare-datatypes ((Unit!32168 0))(
  ( (Unit!32169) )
))
(declare-fun lt!431126 () Unit!32168)

(declare-fun lemmaInListMapFromThenInFromMinusOne!48 (array!59620 array!59618 (_ BitVec 32) (_ BitVec 32) V!34057 V!34057 (_ BitVec 32) (_ BitVec 32) Int) Unit!32168)

(assert (=> b!966551 (= lt!431126 (lemmaInListMapFromThenInFromMinusOne!48 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!966552 () Bool)

(declare-fun e!544839 () Bool)

(declare-fun tp_is_empty!21805 () Bool)

(assert (=> b!966552 (= e!544839 tp_is_empty!21805)))

(declare-fun mapIsEmpty!34702 () Bool)

(declare-fun mapRes!34702 () Bool)

(assert (=> mapIsEmpty!34702 mapRes!34702))

(declare-fun b!966553 () Bool)

(declare-fun res!647034 () Bool)

(assert (=> b!966553 (=> (not res!647034) (not e!544842))))

(assert (=> b!966553 (= res!647034 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29160 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29160 _keys!1686))))))

(declare-fun b!966554 () Bool)

(declare-fun res!647032 () Bool)

(assert (=> b!966554 (=> (not res!647032) (not e!544842))))

(assert (=> b!966554 (= res!647032 (and (= (size!29159 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29160 _keys!1686) (size!29159 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966555 () Bool)

(declare-fun res!647033 () Bool)

(assert (=> b!966555 (=> (not res!647033) (not e!544842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59620 (_ BitVec 32)) Bool)

(assert (=> b!966555 (= res!647033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966556 () Bool)

(declare-fun e!544843 () Bool)

(assert (=> b!966556 (= e!544843 tp_is_empty!21805)))

(declare-fun mapNonEmpty!34702 () Bool)

(declare-fun tp!66121 () Bool)

(assert (=> mapNonEmpty!34702 (= mapRes!34702 (and tp!66121 e!544839))))

(declare-fun mapValue!34702 () ValueCell!10421)

(declare-fun mapKey!34702 () (_ BitVec 32))

(declare-fun mapRest!34702 () (Array (_ BitVec 32) ValueCell!10421))

(assert (=> mapNonEmpty!34702 (= (arr!28678 _values!1400) (store mapRest!34702 mapKey!34702 mapValue!34702))))

(declare-fun res!647029 () Bool)

(assert (=> start!82852 (=> (not res!647029) (not e!544842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82852 (= res!647029 (validMask!0 mask!2110))))

(assert (=> start!82852 e!544842))

(assert (=> start!82852 true))

(declare-fun e!544840 () Bool)

(declare-fun array_inv!22267 (array!59618) Bool)

(assert (=> start!82852 (and (array_inv!22267 _values!1400) e!544840)))

(declare-fun array_inv!22268 (array!59620) Bool)

(assert (=> start!82852 (array_inv!22268 _keys!1686)))

(assert (=> start!82852 tp!66120))

(assert (=> start!82852 tp_is_empty!21805))

(declare-fun b!966557 () Bool)

(assert (=> b!966557 (= e!544840 (and e!544843 mapRes!34702))))

(declare-fun condMapEmpty!34702 () Bool)

(declare-fun mapDefault!34702 () ValueCell!10421)

(assert (=> b!966557 (= condMapEmpty!34702 (= (arr!28678 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10421)) mapDefault!34702)))))

(declare-fun b!966558 () Bool)

(declare-fun res!647030 () Bool)

(assert (=> b!966558 (=> (not res!647030) (not e!544842))))

(declare-datatypes ((List!19962 0))(
  ( (Nil!19959) (Cons!19958 (h!21120 (_ BitVec 64)) (t!28316 List!19962)) )
))
(declare-fun arrayNoDuplicates!0 (array!59620 (_ BitVec 32) List!19962) Bool)

(assert (=> b!966558 (= res!647030 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19959))))

(declare-fun b!966559 () Bool)

(declare-fun res!647035 () Bool)

(assert (=> b!966559 (=> (not res!647035) (not e!544842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966559 (= res!647035 (validKeyInArray!0 (select (arr!28679 _keys!1686) i!803)))))

(declare-fun b!966560 () Bool)

(declare-fun res!647031 () Bool)

(assert (=> b!966560 (=> (not res!647031) (not e!544842))))

(assert (=> b!966560 (= res!647031 (contains!5481 (getCurrentListMap!3598 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28679 _keys!1686) i!803)))))

(assert (= (and start!82852 res!647029) b!966554))

(assert (= (and b!966554 res!647032) b!966555))

(assert (= (and b!966555 res!647033) b!966558))

(assert (= (and b!966558 res!647030) b!966553))

(assert (= (and b!966553 res!647034) b!966559))

(assert (= (and b!966559 res!647035) b!966560))

(assert (= (and b!966560 res!647031) b!966550))

(assert (= (and b!966550 res!647036) b!966551))

(assert (= (and b!966557 condMapEmpty!34702) mapIsEmpty!34702))

(assert (= (and b!966557 (not condMapEmpty!34702)) mapNonEmpty!34702))

(get-info :version)

(assert (= (and mapNonEmpty!34702 ((_ is ValueCellFull!10421) mapValue!34702)) b!966552))

(assert (= (and b!966557 ((_ is ValueCellFull!10421) mapDefault!34702)) b!966556))

(assert (= start!82852 b!966557))

(declare-fun m!894721 () Bool)

(assert (=> mapNonEmpty!34702 m!894721))

(declare-fun m!894723 () Bool)

(assert (=> start!82852 m!894723))

(declare-fun m!894725 () Bool)

(assert (=> start!82852 m!894725))

(declare-fun m!894727 () Bool)

(assert (=> start!82852 m!894727))

(declare-fun m!894729 () Bool)

(assert (=> b!966555 m!894729))

(declare-fun m!894731 () Bool)

(assert (=> b!966558 m!894731))

(declare-fun m!894733 () Bool)

(assert (=> b!966551 m!894733))

(declare-fun m!894735 () Bool)

(assert (=> b!966551 m!894735))

(assert (=> b!966551 m!894733))

(assert (=> b!966551 m!894735))

(declare-fun m!894737 () Bool)

(assert (=> b!966551 m!894737))

(declare-fun m!894739 () Bool)

(assert (=> b!966551 m!894739))

(declare-fun m!894741 () Bool)

(assert (=> b!966560 m!894741))

(assert (=> b!966560 m!894735))

(assert (=> b!966560 m!894741))

(assert (=> b!966560 m!894735))

(declare-fun m!894743 () Bool)

(assert (=> b!966560 m!894743))

(assert (=> b!966559 m!894735))

(assert (=> b!966559 m!894735))

(declare-fun m!894745 () Bool)

(assert (=> b!966559 m!894745))

(check-sat (not b!966558) (not b!966560) (not mapNonEmpty!34702) (not b!966555) (not b!966559) tp_is_empty!21805 (not start!82852) (not b_next!18997) b_and!30459 (not b!966551))
(check-sat b_and!30459 (not b_next!18997))
