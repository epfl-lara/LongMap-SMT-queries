; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82824 () Bool)

(assert start!82824)

(declare-fun b_free!18951 () Bool)

(declare-fun b_next!18951 () Bool)

(assert (=> start!82824 (= b_free!18951 (not b_next!18951))))

(declare-fun tp!65981 () Bool)

(declare-fun b_and!30439 () Bool)

(assert (=> start!82824 (= tp!65981 b_and!30439)))

(declare-fun mapIsEmpty!34633 () Bool)

(declare-fun mapRes!34633 () Bool)

(assert (=> mapIsEmpty!34633 mapRes!34633))

(declare-fun b!966155 () Bool)

(declare-fun e!544646 () Bool)

(declare-fun e!544645 () Bool)

(assert (=> b!966155 (= e!544646 (and e!544645 mapRes!34633))))

(declare-fun condMapEmpty!34633 () Bool)

(declare-datatypes ((V!33995 0))(
  ( (V!33996 (val!10930 Int)) )
))
(declare-datatypes ((ValueCell!10398 0))(
  ( (ValueCellFull!10398 (v!13488 V!33995)) (EmptyCell!10398) )
))
(declare-datatypes ((array!59603 0))(
  ( (array!59604 (arr!28670 (Array (_ BitVec 32) ValueCell!10398)) (size!29149 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59603)

(declare-fun mapDefault!34633 () ValueCell!10398)

(assert (=> b!966155 (= condMapEmpty!34633 (= (arr!28670 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10398)) mapDefault!34633)))))

(declare-fun b!966156 () Bool)

(declare-fun res!646712 () Bool)

(declare-fun e!544642 () Bool)

(assert (=> b!966156 (=> (not res!646712) (not e!544642))))

(declare-datatypes ((array!59605 0))(
  ( (array!59606 (arr!28671 (Array (_ BitVec 32) (_ BitVec 64))) (size!29150 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59605)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966156 (= res!646712 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29150 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29150 _keys!1686))))))

(declare-fun b!966157 () Bool)

(declare-fun e!544644 () Bool)

(declare-fun tp_is_empty!21759 () Bool)

(assert (=> b!966157 (= e!544644 tp_is_empty!21759)))

(declare-fun b!966158 () Bool)

(declare-fun res!646714 () Bool)

(assert (=> b!966158 (=> (not res!646714) (not e!544642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966158 (= res!646714 (validKeyInArray!0 (select (arr!28671 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34633 () Bool)

(declare-fun tp!65982 () Bool)

(assert (=> mapNonEmpty!34633 (= mapRes!34633 (and tp!65982 e!544644))))

(declare-fun mapKey!34633 () (_ BitVec 32))

(declare-fun mapValue!34633 () ValueCell!10398)

(declare-fun mapRest!34633 () (Array (_ BitVec 32) ValueCell!10398))

(assert (=> mapNonEmpty!34633 (= (arr!28670 _values!1400) (store mapRest!34633 mapKey!34633 mapValue!34633))))

(declare-fun b!966159 () Bool)

(declare-fun res!646713 () Bool)

(assert (=> b!966159 (=> (not res!646713) (not e!544642))))

(declare-datatypes ((List!19899 0))(
  ( (Nil!19896) (Cons!19895 (h!21057 (_ BitVec 64)) (t!28262 List!19899)) )
))
(declare-fun arrayNoDuplicates!0 (array!59605 (_ BitVec 32) List!19899) Bool)

(assert (=> b!966159 (= res!646713 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19896))))

(declare-fun b!966160 () Bool)

(declare-fun res!646715 () Bool)

(assert (=> b!966160 (=> (not res!646715) (not e!544642))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966160 (= res!646715 (and (= (size!29149 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29150 _keys!1686) (size!29149 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966161 () Bool)

(declare-fun res!646717 () Bool)

(assert (=> b!966161 (=> (not res!646717) (not e!544642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59605 (_ BitVec 32)) Bool)

(assert (=> b!966161 (= res!646717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!646716 () Bool)

(assert (=> start!82824 (=> (not res!646716) (not e!544642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82824 (= res!646716 (validMask!0 mask!2110))))

(assert (=> start!82824 e!544642))

(assert (=> start!82824 true))

(declare-fun array_inv!22207 (array!59603) Bool)

(assert (=> start!82824 (and (array_inv!22207 _values!1400) e!544646)))

(declare-fun array_inv!22208 (array!59605) Bool)

(assert (=> start!82824 (array_inv!22208 _keys!1686)))

(assert (=> start!82824 tp!65981))

(assert (=> start!82824 tp_is_empty!21759))

(declare-fun b!966162 () Bool)

(assert (=> b!966162 (= e!544642 false)))

(declare-fun minValue!1342 () V!33995)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431302 () Bool)

(declare-fun zeroValue!1342 () V!33995)

(declare-datatypes ((tuple2!14058 0))(
  ( (tuple2!14059 (_1!7040 (_ BitVec 64)) (_2!7040 V!33995)) )
))
(declare-datatypes ((List!19900 0))(
  ( (Nil!19897) (Cons!19896 (h!21058 tuple2!14058) (t!28263 List!19900)) )
))
(declare-datatypes ((ListLongMap!12755 0))(
  ( (ListLongMap!12756 (toList!6393 List!19900)) )
))
(declare-fun contains!5494 (ListLongMap!12755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3626 (array!59605 array!59603 (_ BitVec 32) (_ BitVec 32) V!33995 V!33995 (_ BitVec 32) Int) ListLongMap!12755)

(assert (=> b!966162 (= lt!431302 (contains!5494 (getCurrentListMap!3626 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28671 _keys!1686) i!803)))))

(declare-fun b!966163 () Bool)

(assert (=> b!966163 (= e!544645 tp_is_empty!21759)))

(assert (= (and start!82824 res!646716) b!966160))

(assert (= (and b!966160 res!646715) b!966161))

(assert (= (and b!966161 res!646717) b!966159))

(assert (= (and b!966159 res!646713) b!966156))

(assert (= (and b!966156 res!646712) b!966158))

(assert (= (and b!966158 res!646714) b!966162))

(assert (= (and b!966155 condMapEmpty!34633) mapIsEmpty!34633))

(assert (= (and b!966155 (not condMapEmpty!34633)) mapNonEmpty!34633))

(get-info :version)

(assert (= (and mapNonEmpty!34633 ((_ is ValueCellFull!10398) mapValue!34633)) b!966157))

(assert (= (and b!966155 ((_ is ValueCellFull!10398) mapDefault!34633)) b!966163))

(assert (= start!82824 b!966155))

(declare-fun m!895019 () Bool)

(assert (=> b!966158 m!895019))

(assert (=> b!966158 m!895019))

(declare-fun m!895021 () Bool)

(assert (=> b!966158 m!895021))

(declare-fun m!895023 () Bool)

(assert (=> b!966159 m!895023))

(declare-fun m!895025 () Bool)

(assert (=> b!966162 m!895025))

(assert (=> b!966162 m!895019))

(assert (=> b!966162 m!895025))

(assert (=> b!966162 m!895019))

(declare-fun m!895027 () Bool)

(assert (=> b!966162 m!895027))

(declare-fun m!895029 () Bool)

(assert (=> mapNonEmpty!34633 m!895029))

(declare-fun m!895031 () Bool)

(assert (=> b!966161 m!895031))

(declare-fun m!895033 () Bool)

(assert (=> start!82824 m!895033))

(declare-fun m!895035 () Bool)

(assert (=> start!82824 m!895035))

(declare-fun m!895037 () Bool)

(assert (=> start!82824 m!895037))

(check-sat (not b_next!18951) (not b!966159) tp_is_empty!21759 (not b!966158) b_and!30439 (not start!82824) (not b!966161) (not mapNonEmpty!34633) (not b!966162))
(check-sat b_and!30439 (not b_next!18951))
