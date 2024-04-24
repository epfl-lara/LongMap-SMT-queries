; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83134 () Bool)

(assert start!83134)

(declare-fun b_free!19093 () Bool)

(declare-fun b_next!19093 () Bool)

(assert (=> start!83134 (= b_free!19093 (not b_next!19093))))

(declare-fun tp!66409 () Bool)

(declare-fun b_and!30591 () Bool)

(assert (=> start!83134 (= tp!66409 b_and!30591)))

(declare-fun mapIsEmpty!34846 () Bool)

(declare-fun mapRes!34846 () Bool)

(assert (=> mapIsEmpty!34846 mapRes!34846))

(declare-fun b!969294 () Bool)

(declare-fun res!648653 () Bool)

(declare-fun e!546308 () Bool)

(assert (=> b!969294 (=> (not res!648653) (not e!546308))))

(declare-datatypes ((array!59888 0))(
  ( (array!59889 (arr!28808 (Array (_ BitVec 32) (_ BitVec 64))) (size!29288 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59888)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!969294 (= res!648653 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29288 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29288 _keys!1686))))))

(declare-fun b!969295 () Bool)

(declare-fun e!546307 () Bool)

(declare-fun e!546309 () Bool)

(assert (=> b!969295 (= e!546307 (and e!546309 mapRes!34846))))

(declare-fun condMapEmpty!34846 () Bool)

(declare-datatypes ((V!34185 0))(
  ( (V!34186 (val!11001 Int)) )
))
(declare-datatypes ((ValueCell!10469 0))(
  ( (ValueCellFull!10469 (v!13556 V!34185)) (EmptyCell!10469) )
))
(declare-datatypes ((array!59890 0))(
  ( (array!59891 (arr!28809 (Array (_ BitVec 32) ValueCell!10469)) (size!29289 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59890)

(declare-fun mapDefault!34846 () ValueCell!10469)

(assert (=> b!969295 (= condMapEmpty!34846 (= (arr!28809 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10469)) mapDefault!34846)))))

(declare-fun b!969296 () Bool)

(declare-fun e!546311 () Bool)

(declare-fun tp_is_empty!21901 () Bool)

(assert (=> b!969296 (= e!546311 tp_is_empty!21901)))

(declare-fun b!969297 () Bool)

(assert (=> b!969297 (= e!546309 tp_is_empty!21901)))

(declare-fun res!648655 () Bool)

(assert (=> start!83134 (=> (not res!648655) (not e!546308))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83134 (= res!648655 (validMask!0 mask!2110))))

(assert (=> start!83134 e!546308))

(assert (=> start!83134 true))

(declare-fun array_inv!22363 (array!59890) Bool)

(assert (=> start!83134 (and (array_inv!22363 _values!1400) e!546307)))

(declare-fun array_inv!22364 (array!59888) Bool)

(assert (=> start!83134 (array_inv!22364 _keys!1686)))

(assert (=> start!83134 tp!66409))

(assert (=> start!83134 tp_is_empty!21901))

(declare-fun b!969298 () Bool)

(declare-fun res!648658 () Bool)

(assert (=> b!969298 (=> (not res!648658) (not e!546308))))

(declare-datatypes ((List!19990 0))(
  ( (Nil!19987) (Cons!19986 (h!21154 (_ BitVec 64)) (t!28345 List!19990)) )
))
(declare-fun arrayNoDuplicates!0 (array!59888 (_ BitVec 32) List!19990) Bool)

(assert (=> b!969298 (= res!648658 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19987))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34185)

(declare-fun defaultEntry!1403 () Int)

(declare-fun b!969299 () Bool)

(declare-fun minValue!1342 () V!34185)

(declare-datatypes ((tuple2!14148 0))(
  ( (tuple2!14149 (_1!7085 (_ BitVec 64)) (_2!7085 V!34185)) )
))
(declare-datatypes ((List!19991 0))(
  ( (Nil!19988) (Cons!19987 (h!21155 tuple2!14148) (t!28346 List!19991)) )
))
(declare-datatypes ((ListLongMap!12847 0))(
  ( (ListLongMap!12848 (toList!6439 List!19991)) )
))
(declare-fun contains!5551 (ListLongMap!12847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3672 (array!59888 array!59890 (_ BitVec 32) (_ BitVec 32) V!34185 V!34185 (_ BitVec 32) Int) ListLongMap!12847)

(assert (=> b!969299 (= e!546308 (not (contains!5551 (getCurrentListMap!3672 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28808 _keys!1686) i!803))))))

(declare-fun b!969300 () Bool)

(declare-fun res!648654 () Bool)

(assert (=> b!969300 (=> (not res!648654) (not e!546308))))

(assert (=> b!969300 (= res!648654 (contains!5551 (getCurrentListMap!3672 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28808 _keys!1686) i!803)))))

(declare-fun b!969301 () Bool)

(declare-fun res!648657 () Bool)

(assert (=> b!969301 (=> (not res!648657) (not e!546308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969301 (= res!648657 (validKeyInArray!0 (select (arr!28808 _keys!1686) i!803)))))

(declare-fun b!969302 () Bool)

(declare-fun res!648659 () Bool)

(assert (=> b!969302 (=> (not res!648659) (not e!546308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59888 (_ BitVec 32)) Bool)

(assert (=> b!969302 (= res!648659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!969303 () Bool)

(declare-fun res!648656 () Bool)

(assert (=> b!969303 (=> (not res!648656) (not e!546308))))

(assert (=> b!969303 (= res!648656 (and (= (size!29289 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29288 _keys!1686) (size!29289 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!969304 () Bool)

(declare-fun res!648660 () Bool)

(assert (=> b!969304 (=> (not res!648660) (not e!546308))))

(assert (=> b!969304 (= res!648660 (bvsle from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34846 () Bool)

(declare-fun tp!66408 () Bool)

(assert (=> mapNonEmpty!34846 (= mapRes!34846 (and tp!66408 e!546311))))

(declare-fun mapRest!34846 () (Array (_ BitVec 32) ValueCell!10469))

(declare-fun mapKey!34846 () (_ BitVec 32))

(declare-fun mapValue!34846 () ValueCell!10469)

(assert (=> mapNonEmpty!34846 (= (arr!28809 _values!1400) (store mapRest!34846 mapKey!34846 mapValue!34846))))

(assert (= (and start!83134 res!648655) b!969303))

(assert (= (and b!969303 res!648656) b!969302))

(assert (= (and b!969302 res!648659) b!969298))

(assert (= (and b!969298 res!648658) b!969294))

(assert (= (and b!969294 res!648653) b!969301))

(assert (= (and b!969301 res!648657) b!969300))

(assert (= (and b!969300 res!648654) b!969304))

(assert (= (and b!969304 res!648660) b!969299))

(assert (= (and b!969295 condMapEmpty!34846) mapIsEmpty!34846))

(assert (= (and b!969295 (not condMapEmpty!34846)) mapNonEmpty!34846))

(get-info :version)

(assert (= (and mapNonEmpty!34846 ((_ is ValueCellFull!10469) mapValue!34846)) b!969296))

(assert (= (and b!969295 ((_ is ValueCellFull!10469) mapDefault!34846)) b!969297))

(assert (= start!83134 b!969295))

(declare-fun m!898045 () Bool)

(assert (=> b!969300 m!898045))

(declare-fun m!898047 () Bool)

(assert (=> b!969300 m!898047))

(assert (=> b!969300 m!898045))

(assert (=> b!969300 m!898047))

(declare-fun m!898049 () Bool)

(assert (=> b!969300 m!898049))

(declare-fun m!898051 () Bool)

(assert (=> b!969302 m!898051))

(declare-fun m!898053 () Bool)

(assert (=> b!969298 m!898053))

(assert (=> b!969301 m!898047))

(assert (=> b!969301 m!898047))

(declare-fun m!898055 () Bool)

(assert (=> b!969301 m!898055))

(declare-fun m!898057 () Bool)

(assert (=> start!83134 m!898057))

(declare-fun m!898059 () Bool)

(assert (=> start!83134 m!898059))

(declare-fun m!898061 () Bool)

(assert (=> start!83134 m!898061))

(declare-fun m!898063 () Bool)

(assert (=> b!969299 m!898063))

(assert (=> b!969299 m!898047))

(assert (=> b!969299 m!898063))

(assert (=> b!969299 m!898047))

(declare-fun m!898065 () Bool)

(assert (=> b!969299 m!898065))

(declare-fun m!898067 () Bool)

(assert (=> mapNonEmpty!34846 m!898067))

(check-sat (not b!969302) (not b!969299) (not b!969301) tp_is_empty!21901 (not b!969300) b_and!30591 (not mapNonEmpty!34846) (not b_next!19093) (not b!969298) (not start!83134))
(check-sat b_and!30591 (not b_next!19093))
