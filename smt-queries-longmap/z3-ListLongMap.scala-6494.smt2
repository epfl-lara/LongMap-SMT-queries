; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82972 () Bool)

(assert start!82972)

(declare-fun b_free!18931 () Bool)

(declare-fun b_next!18931 () Bool)

(assert (=> start!82972 (= b_free!18931 (not b_next!18931))))

(declare-fun tp!65922 () Bool)

(declare-fun b_and!30429 () Bool)

(assert (=> start!82972 (= tp!65922 b_and!30429)))

(declare-fun b!966788 () Bool)

(declare-fun res!646879 () Bool)

(declare-fun e!545077 () Bool)

(assert (=> b!966788 (=> (not res!646879) (not e!545077))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33969 0))(
  ( (V!33970 (val!10920 Int)) )
))
(declare-datatypes ((ValueCell!10388 0))(
  ( (ValueCellFull!10388 (v!13475 V!33969)) (EmptyCell!10388) )
))
(declare-datatypes ((array!59576 0))(
  ( (array!59577 (arr!28652 (Array (_ BitVec 32) ValueCell!10388)) (size!29132 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59576)

(declare-datatypes ((array!59578 0))(
  ( (array!59579 (arr!28653 (Array (_ BitVec 32) (_ BitVec 64))) (size!29133 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59578)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966788 (= res!646879 (and (= (size!29132 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29133 _keys!1686) (size!29132 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966789 () Bool)

(declare-fun res!646880 () Bool)

(assert (=> b!966789 (=> (not res!646880) (not e!545077))))

(declare-datatypes ((List!19872 0))(
  ( (Nil!19869) (Cons!19868 (h!21036 (_ BitVec 64)) (t!28227 List!19872)) )
))
(declare-fun arrayNoDuplicates!0 (array!59578 (_ BitVec 32) List!19872) Bool)

(assert (=> b!966789 (= res!646880 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19869))))

(declare-fun b!966790 () Bool)

(declare-fun res!646878 () Bool)

(assert (=> b!966790 (=> (not res!646878) (not e!545077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59578 (_ BitVec 32)) Bool)

(assert (=> b!966790 (= res!646878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966791 () Bool)

(declare-fun e!545075 () Bool)

(declare-fun tp_is_empty!21739 () Bool)

(assert (=> b!966791 (= e!545075 tp_is_empty!21739)))

(declare-fun b!966792 () Bool)

(declare-fun res!646877 () Bool)

(assert (=> b!966792 (=> (not res!646877) (not e!545077))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!966792 (= res!646877 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29133 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29133 _keys!1686))))))

(declare-fun res!646881 () Bool)

(assert (=> start!82972 (=> (not res!646881) (not e!545077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82972 (= res!646881 (validMask!0 mask!2110))))

(assert (=> start!82972 e!545077))

(assert (=> start!82972 true))

(declare-fun e!545078 () Bool)

(declare-fun array_inv!22243 (array!59576) Bool)

(assert (=> start!82972 (and (array_inv!22243 _values!1400) e!545078)))

(declare-fun array_inv!22244 (array!59578) Bool)

(assert (=> start!82972 (array_inv!22244 _keys!1686)))

(assert (=> start!82972 tp!65922))

(assert (=> start!82972 tp_is_empty!21739))

(declare-fun mapNonEmpty!34603 () Bool)

(declare-fun mapRes!34603 () Bool)

(declare-fun tp!65923 () Bool)

(assert (=> mapNonEmpty!34603 (= mapRes!34603 (and tp!65923 e!545075))))

(declare-fun mapRest!34603 () (Array (_ BitVec 32) ValueCell!10388))

(declare-fun mapValue!34603 () ValueCell!10388)

(declare-fun mapKey!34603 () (_ BitVec 32))

(assert (=> mapNonEmpty!34603 (= (arr!28652 _values!1400) (store mapRest!34603 mapKey!34603 mapValue!34603))))

(declare-fun b!966793 () Bool)

(declare-fun e!545074 () Bool)

(assert (=> b!966793 (= e!545074 tp_is_empty!21739)))

(declare-fun b!966794 () Bool)

(assert (=> b!966794 (= e!545078 (and e!545074 mapRes!34603))))

(declare-fun condMapEmpty!34603 () Bool)

(declare-fun mapDefault!34603 () ValueCell!10388)

(assert (=> b!966794 (= condMapEmpty!34603 (= (arr!28652 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10388)) mapDefault!34603)))))

(declare-fun mapIsEmpty!34603 () Bool)

(assert (=> mapIsEmpty!34603 mapRes!34603))

(declare-fun b!966795 () Bool)

(declare-fun res!646876 () Bool)

(assert (=> b!966795 (=> (not res!646876) (not e!545077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966795 (= res!646876 (validKeyInArray!0 (select (arr!28653 _keys!1686) i!803)))))

(declare-fun b!966796 () Bool)

(assert (=> b!966796 (= e!545077 false)))

(declare-fun minValue!1342 () V!33969)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33969)

(declare-fun lt!431633 () Bool)

(declare-datatypes ((tuple2!14024 0))(
  ( (tuple2!14025 (_1!7023 (_ BitVec 64)) (_2!7023 V!33969)) )
))
(declare-datatypes ((List!19873 0))(
  ( (Nil!19870) (Cons!19869 (h!21037 tuple2!14024) (t!28228 List!19873)) )
))
(declare-datatypes ((ListLongMap!12723 0))(
  ( (ListLongMap!12724 (toList!6377 List!19873)) )
))
(declare-fun contains!5489 (ListLongMap!12723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3610 (array!59578 array!59576 (_ BitVec 32) (_ BitVec 32) V!33969 V!33969 (_ BitVec 32) Int) ListLongMap!12723)

(assert (=> b!966796 (= lt!431633 (contains!5489 (getCurrentListMap!3610 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28653 _keys!1686) i!803)))))

(assert (= (and start!82972 res!646881) b!966788))

(assert (= (and b!966788 res!646879) b!966790))

(assert (= (and b!966790 res!646878) b!966789))

(assert (= (and b!966789 res!646880) b!966792))

(assert (= (and b!966792 res!646877) b!966795))

(assert (= (and b!966795 res!646876) b!966796))

(assert (= (and b!966794 condMapEmpty!34603) mapIsEmpty!34603))

(assert (= (and b!966794 (not condMapEmpty!34603)) mapNonEmpty!34603))

(get-info :version)

(assert (= (and mapNonEmpty!34603 ((_ is ValueCellFull!10388) mapValue!34603)) b!966791))

(assert (= (and b!966794 ((_ is ValueCellFull!10388) mapDefault!34603)) b!966793))

(assert (= start!82972 b!966794))

(declare-fun m!896113 () Bool)

(assert (=> b!966796 m!896113))

(declare-fun m!896115 () Bool)

(assert (=> b!966796 m!896115))

(assert (=> b!966796 m!896113))

(assert (=> b!966796 m!896115))

(declare-fun m!896117 () Bool)

(assert (=> b!966796 m!896117))

(declare-fun m!896119 () Bool)

(assert (=> mapNonEmpty!34603 m!896119))

(declare-fun m!896121 () Bool)

(assert (=> b!966790 m!896121))

(declare-fun m!896123 () Bool)

(assert (=> b!966789 m!896123))

(assert (=> b!966795 m!896115))

(assert (=> b!966795 m!896115))

(declare-fun m!896125 () Bool)

(assert (=> b!966795 m!896125))

(declare-fun m!896127 () Bool)

(assert (=> start!82972 m!896127))

(declare-fun m!896129 () Bool)

(assert (=> start!82972 m!896129))

(declare-fun m!896131 () Bool)

(assert (=> start!82972 m!896131))

(check-sat tp_is_empty!21739 (not b!966796) (not b!966790) (not mapNonEmpty!34603) (not b!966789) (not start!82972) b_and!30429 (not b!966795) (not b_next!18931))
(check-sat b_and!30429 (not b_next!18931))
