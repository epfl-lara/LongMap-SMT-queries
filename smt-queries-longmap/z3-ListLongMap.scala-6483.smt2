; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82740 () Bool)

(assert start!82740)

(declare-fun b_free!18873 () Bool)

(declare-fun b_next!18873 () Bool)

(assert (=> start!82740 (= b_free!18873 (not b_next!18873))))

(declare-fun tp!65739 () Bool)

(declare-fun b_and!30361 () Bool)

(assert (=> start!82740 (= tp!65739 b_and!30361)))

(declare-fun b!965030 () Bool)

(declare-fun res!645965 () Bool)

(declare-fun e!544012 () Bool)

(assert (=> b!965030 (=> (not res!645965) (not e!544012))))

(declare-datatypes ((array!59435 0))(
  ( (array!59436 (arr!28586 (Array (_ BitVec 32) (_ BitVec 64))) (size!29065 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59435)

(declare-datatypes ((List!19840 0))(
  ( (Nil!19837) (Cons!19836 (h!20998 (_ BitVec 64)) (t!28203 List!19840)) )
))
(declare-fun arrayNoDuplicates!0 (array!59435 (_ BitVec 32) List!19840) Bool)

(assert (=> b!965030 (= res!645965 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19837))))

(declare-fun b!965031 () Bool)

(declare-fun res!645969 () Bool)

(assert (=> b!965031 (=> (not res!645969) (not e!544012))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33883 0))(
  ( (V!33884 (val!10888 Int)) )
))
(declare-datatypes ((ValueCell!10356 0))(
  ( (ValueCellFull!10356 (v!13446 V!33883)) (EmptyCell!10356) )
))
(declare-datatypes ((array!59437 0))(
  ( (array!59438 (arr!28587 (Array (_ BitVec 32) ValueCell!10356)) (size!29066 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59437)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965031 (= res!645969 (and (= (size!29066 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29065 _keys!1686) (size!29066 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965032 () Bool)

(declare-fun res!645968 () Bool)

(assert (=> b!965032 (=> (not res!645968) (not e!544012))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965032 (= res!645968 (validKeyInArray!0 (select (arr!28586 _keys!1686) i!803)))))

(declare-fun b!965033 () Bool)

(declare-fun res!645966 () Bool)

(assert (=> b!965033 (=> (not res!645966) (not e!544012))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!965033 (= res!645966 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29065 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29065 _keys!1686))))))

(declare-fun b!965034 () Bool)

(declare-fun e!544013 () Bool)

(declare-fun e!544016 () Bool)

(declare-fun mapRes!34507 () Bool)

(assert (=> b!965034 (= e!544013 (and e!544016 mapRes!34507))))

(declare-fun condMapEmpty!34507 () Bool)

(declare-fun mapDefault!34507 () ValueCell!10356)

(assert (=> b!965034 (= condMapEmpty!34507 (= (arr!28587 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10356)) mapDefault!34507)))))

(declare-fun res!645970 () Bool)

(assert (=> start!82740 (=> (not res!645970) (not e!544012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82740 (= res!645970 (validMask!0 mask!2110))))

(assert (=> start!82740 e!544012))

(assert (=> start!82740 true))

(declare-fun array_inv!22135 (array!59437) Bool)

(assert (=> start!82740 (and (array_inv!22135 _values!1400) e!544013)))

(declare-fun array_inv!22136 (array!59435) Bool)

(assert (=> start!82740 (array_inv!22136 _keys!1686)))

(assert (=> start!82740 tp!65739))

(declare-fun tp_is_empty!21675 () Bool)

(assert (=> start!82740 tp_is_empty!21675))

(declare-fun b!965035 () Bool)

(assert (=> b!965035 (= e!544012 false)))

(declare-fun minValue!1342 () V!33883)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33883)

(declare-fun lt!431194 () Bool)

(declare-datatypes ((tuple2!13996 0))(
  ( (tuple2!13997 (_1!7009 (_ BitVec 64)) (_2!7009 V!33883)) )
))
(declare-datatypes ((List!19841 0))(
  ( (Nil!19838) (Cons!19837 (h!20999 tuple2!13996) (t!28204 List!19841)) )
))
(declare-datatypes ((ListLongMap!12693 0))(
  ( (ListLongMap!12694 (toList!6362 List!19841)) )
))
(declare-fun contains!5465 (ListLongMap!12693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3595 (array!59435 array!59437 (_ BitVec 32) (_ BitVec 32) V!33883 V!33883 (_ BitVec 32) Int) ListLongMap!12693)

(assert (=> b!965035 (= lt!431194 (contains!5465 (getCurrentListMap!3595 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28586 _keys!1686) i!803)))))

(declare-fun b!965036 () Bool)

(declare-fun res!645967 () Bool)

(assert (=> b!965036 (=> (not res!645967) (not e!544012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59435 (_ BitVec 32)) Bool)

(assert (=> b!965036 (= res!645967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965037 () Bool)

(assert (=> b!965037 (= e!544016 tp_is_empty!21675)))

(declare-fun b!965038 () Bool)

(declare-fun e!544015 () Bool)

(assert (=> b!965038 (= e!544015 tp_is_empty!21675)))

(declare-fun mapNonEmpty!34507 () Bool)

(declare-fun tp!65738 () Bool)

(assert (=> mapNonEmpty!34507 (= mapRes!34507 (and tp!65738 e!544015))))

(declare-fun mapKey!34507 () (_ BitVec 32))

(declare-fun mapValue!34507 () ValueCell!10356)

(declare-fun mapRest!34507 () (Array (_ BitVec 32) ValueCell!10356))

(assert (=> mapNonEmpty!34507 (= (arr!28587 _values!1400) (store mapRest!34507 mapKey!34507 mapValue!34507))))

(declare-fun mapIsEmpty!34507 () Bool)

(assert (=> mapIsEmpty!34507 mapRes!34507))

(assert (= (and start!82740 res!645970) b!965031))

(assert (= (and b!965031 res!645969) b!965036))

(assert (= (and b!965036 res!645967) b!965030))

(assert (= (and b!965030 res!645965) b!965033))

(assert (= (and b!965033 res!645966) b!965032))

(assert (= (and b!965032 res!645968) b!965035))

(assert (= (and b!965034 condMapEmpty!34507) mapIsEmpty!34507))

(assert (= (and b!965034 (not condMapEmpty!34507)) mapNonEmpty!34507))

(get-info :version)

(assert (= (and mapNonEmpty!34507 ((_ is ValueCellFull!10356) mapValue!34507)) b!965038))

(assert (= (and b!965034 ((_ is ValueCellFull!10356) mapDefault!34507)) b!965037))

(assert (= start!82740 b!965034))

(declare-fun m!894209 () Bool)

(assert (=> b!965036 m!894209))

(declare-fun m!894211 () Bool)

(assert (=> b!965032 m!894211))

(assert (=> b!965032 m!894211))

(declare-fun m!894213 () Bool)

(assert (=> b!965032 m!894213))

(declare-fun m!894215 () Bool)

(assert (=> b!965030 m!894215))

(declare-fun m!894217 () Bool)

(assert (=> mapNonEmpty!34507 m!894217))

(declare-fun m!894219 () Bool)

(assert (=> b!965035 m!894219))

(assert (=> b!965035 m!894211))

(assert (=> b!965035 m!894219))

(assert (=> b!965035 m!894211))

(declare-fun m!894221 () Bool)

(assert (=> b!965035 m!894221))

(declare-fun m!894223 () Bool)

(assert (=> start!82740 m!894223))

(declare-fun m!894225 () Bool)

(assert (=> start!82740 m!894225))

(declare-fun m!894227 () Bool)

(assert (=> start!82740 m!894227))

(check-sat (not start!82740) tp_is_empty!21675 (not b!965035) (not b!965030) (not mapNonEmpty!34507) (not b!965032) (not b_next!18873) b_and!30361 (not b!965036))
(check-sat b_and!30361 (not b_next!18873))
