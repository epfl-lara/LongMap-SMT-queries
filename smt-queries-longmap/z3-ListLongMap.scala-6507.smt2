; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82864 () Bool)

(assert start!82864)

(declare-fun b_free!19009 () Bool)

(declare-fun b_next!19009 () Bool)

(assert (=> start!82864 (= b_free!19009 (not b_next!19009))))

(declare-fun tp!66157 () Bool)

(declare-fun b_and!30471 () Bool)

(assert (=> start!82864 (= tp!66157 b_and!30471)))

(declare-fun b!966748 () Bool)

(declare-fun res!647179 () Bool)

(declare-fun e!544931 () Bool)

(assert (=> b!966748 (=> (not res!647179) (not e!544931))))

(declare-datatypes ((array!59638 0))(
  ( (array!59639 (arr!28688 (Array (_ BitVec 32) (_ BitVec 64))) (size!29169 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59638)

(declare-datatypes ((List!19969 0))(
  ( (Nil!19966) (Cons!19965 (h!21127 (_ BitVec 64)) (t!28323 List!19969)) )
))
(declare-fun arrayNoDuplicates!0 (array!59638 (_ BitVec 32) List!19969) Bool)

(assert (=> b!966748 (= res!647179 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19966))))

(declare-fun mapIsEmpty!34720 () Bool)

(declare-fun mapRes!34720 () Bool)

(assert (=> mapIsEmpty!34720 mapRes!34720))

(declare-fun b!966749 () Bool)

(declare-fun e!544930 () Bool)

(declare-fun tp_is_empty!21817 () Bool)

(assert (=> b!966749 (= e!544930 tp_is_empty!21817)))

(declare-fun b!966750 () Bool)

(declare-fun res!647180 () Bool)

(assert (=> b!966750 (=> (not res!647180) (not e!544931))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966750 (= res!647180 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29169 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29169 _keys!1686))))))

(declare-fun b!966751 () Bool)

(declare-fun res!647178 () Bool)

(assert (=> b!966751 (=> (not res!647178) (not e!544931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966751 (= res!647178 (validKeyInArray!0 (select (arr!28688 _keys!1686) i!803)))))

(declare-fun res!647174 () Bool)

(assert (=> start!82864 (=> (not res!647174) (not e!544931))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82864 (= res!647174 (validMask!0 mask!2110))))

(assert (=> start!82864 e!544931))

(assert (=> start!82864 true))

(declare-datatypes ((V!34073 0))(
  ( (V!34074 (val!10959 Int)) )
))
(declare-datatypes ((ValueCell!10427 0))(
  ( (ValueCellFull!10427 (v!13516 V!34073)) (EmptyCell!10427) )
))
(declare-datatypes ((array!59640 0))(
  ( (array!59641 (arr!28689 (Array (_ BitVec 32) ValueCell!10427)) (size!29170 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59640)

(declare-fun e!544932 () Bool)

(declare-fun array_inv!22273 (array!59640) Bool)

(assert (=> start!82864 (and (array_inv!22273 _values!1400) e!544932)))

(declare-fun array_inv!22274 (array!59638) Bool)

(assert (=> start!82864 (array_inv!22274 _keys!1686)))

(assert (=> start!82864 tp!66157))

(assert (=> start!82864 tp_is_empty!21817))

(declare-fun b!966752 () Bool)

(assert (=> b!966752 (= e!544931 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34073)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34073)

(declare-datatypes ((tuple2!14162 0))(
  ( (tuple2!14163 (_1!7092 (_ BitVec 64)) (_2!7092 V!34073)) )
))
(declare-datatypes ((List!19970 0))(
  ( (Nil!19967) (Cons!19966 (h!21128 tuple2!14162) (t!28324 List!19970)) )
))
(declare-datatypes ((ListLongMap!12849 0))(
  ( (ListLongMap!12850 (toList!6440 List!19970)) )
))
(declare-fun contains!5485 (ListLongMap!12849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3602 (array!59638 array!59640 (_ BitVec 32) (_ BitVec 32) V!34073 V!34073 (_ BitVec 32) Int) ListLongMap!12849)

(assert (=> b!966752 (contains!5485 (getCurrentListMap!3602 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28688 _keys!1686) i!803))))

(declare-datatypes ((Unit!32176 0))(
  ( (Unit!32177) )
))
(declare-fun lt!431144 () Unit!32176)

(declare-fun lemmaInListMapFromThenInFromMinusOne!52 (array!59638 array!59640 (_ BitVec 32) (_ BitVec 32) V!34073 V!34073 (_ BitVec 32) (_ BitVec 32) Int) Unit!32176)

(assert (=> b!966752 (= lt!431144 (lemmaInListMapFromThenInFromMinusOne!52 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!966753 () Bool)

(declare-fun res!647173 () Bool)

(assert (=> b!966753 (=> (not res!647173) (not e!544931))))

(assert (=> b!966753 (= res!647173 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966754 () Bool)

(declare-fun res!647175 () Bool)

(assert (=> b!966754 (=> (not res!647175) (not e!544931))))

(assert (=> b!966754 (= res!647175 (contains!5485 (getCurrentListMap!3602 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28688 _keys!1686) i!803)))))

(declare-fun b!966755 () Bool)

(declare-fun e!544933 () Bool)

(assert (=> b!966755 (= e!544933 tp_is_empty!21817)))

(declare-fun b!966756 () Bool)

(declare-fun res!647177 () Bool)

(assert (=> b!966756 (=> (not res!647177) (not e!544931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59638 (_ BitVec 32)) Bool)

(assert (=> b!966756 (= res!647177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966757 () Bool)

(declare-fun res!647176 () Bool)

(assert (=> b!966757 (=> (not res!647176) (not e!544931))))

(assert (=> b!966757 (= res!647176 (and (= (size!29170 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29169 _keys!1686) (size!29170 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966758 () Bool)

(assert (=> b!966758 (= e!544932 (and e!544933 mapRes!34720))))

(declare-fun condMapEmpty!34720 () Bool)

(declare-fun mapDefault!34720 () ValueCell!10427)

(assert (=> b!966758 (= condMapEmpty!34720 (= (arr!28689 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10427)) mapDefault!34720)))))

(declare-fun mapNonEmpty!34720 () Bool)

(declare-fun tp!66156 () Bool)

(assert (=> mapNonEmpty!34720 (= mapRes!34720 (and tp!66156 e!544930))))

(declare-fun mapValue!34720 () ValueCell!10427)

(declare-fun mapKey!34720 () (_ BitVec 32))

(declare-fun mapRest!34720 () (Array (_ BitVec 32) ValueCell!10427))

(assert (=> mapNonEmpty!34720 (= (arr!28689 _values!1400) (store mapRest!34720 mapKey!34720 mapValue!34720))))

(assert (= (and start!82864 res!647174) b!966757))

(assert (= (and b!966757 res!647176) b!966756))

(assert (= (and b!966756 res!647177) b!966748))

(assert (= (and b!966748 res!647179) b!966750))

(assert (= (and b!966750 res!647180) b!966751))

(assert (= (and b!966751 res!647178) b!966754))

(assert (= (and b!966754 res!647175) b!966753))

(assert (= (and b!966753 res!647173) b!966752))

(assert (= (and b!966758 condMapEmpty!34720) mapIsEmpty!34720))

(assert (= (and b!966758 (not condMapEmpty!34720)) mapNonEmpty!34720))

(get-info :version)

(assert (= (and mapNonEmpty!34720 ((_ is ValueCellFull!10427) mapValue!34720)) b!966749))

(assert (= (and b!966758 ((_ is ValueCellFull!10427) mapDefault!34720)) b!966755))

(assert (= start!82864 b!966758))

(declare-fun m!894877 () Bool)

(assert (=> b!966752 m!894877))

(declare-fun m!894879 () Bool)

(assert (=> b!966752 m!894879))

(assert (=> b!966752 m!894877))

(assert (=> b!966752 m!894879))

(declare-fun m!894881 () Bool)

(assert (=> b!966752 m!894881))

(declare-fun m!894883 () Bool)

(assert (=> b!966752 m!894883))

(declare-fun m!894885 () Bool)

(assert (=> mapNonEmpty!34720 m!894885))

(declare-fun m!894887 () Bool)

(assert (=> b!966754 m!894887))

(assert (=> b!966754 m!894879))

(assert (=> b!966754 m!894887))

(assert (=> b!966754 m!894879))

(declare-fun m!894889 () Bool)

(assert (=> b!966754 m!894889))

(declare-fun m!894891 () Bool)

(assert (=> b!966748 m!894891))

(declare-fun m!894893 () Bool)

(assert (=> b!966756 m!894893))

(declare-fun m!894895 () Bool)

(assert (=> start!82864 m!894895))

(declare-fun m!894897 () Bool)

(assert (=> start!82864 m!894897))

(declare-fun m!894899 () Bool)

(assert (=> start!82864 m!894899))

(assert (=> b!966751 m!894879))

(assert (=> b!966751 m!894879))

(declare-fun m!894901 () Bool)

(assert (=> b!966751 m!894901))

(check-sat (not b!966752) (not mapNonEmpty!34720) tp_is_empty!21817 (not b!966756) b_and!30471 (not b!966748) (not start!82864) (not b!966754) (not b!966751) (not b_next!19009))
(check-sat b_and!30471 (not b_next!19009))
