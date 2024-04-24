; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83056 () Bool)

(assert start!83056)

(declare-fun b_free!19015 () Bool)

(declare-fun b_next!19015 () Bool)

(assert (=> start!83056 (= b_free!19015 (not b_next!19015))))

(declare-fun tp!66174 () Bool)

(declare-fun b_and!30513 () Bool)

(assert (=> start!83056 (= tp!66174 b_and!30513)))

(declare-fun b!967989 () Bool)

(declare-fun e!545707 () Bool)

(declare-fun tp_is_empty!21823 () Bool)

(assert (=> b!967989 (= e!545707 tp_is_empty!21823)))

(declare-fun b!967990 () Bool)

(declare-fun res!647702 () Bool)

(declare-fun e!545708 () Bool)

(assert (=> b!967990 (=> (not res!647702) (not e!545708))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967990 (= res!647702 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967991 () Bool)

(declare-fun e!545706 () Bool)

(declare-fun e!545705 () Bool)

(declare-fun mapRes!34729 () Bool)

(assert (=> b!967991 (= e!545706 (and e!545705 mapRes!34729))))

(declare-fun condMapEmpty!34729 () Bool)

(declare-datatypes ((V!34081 0))(
  ( (V!34082 (val!10962 Int)) )
))
(declare-datatypes ((ValueCell!10430 0))(
  ( (ValueCellFull!10430 (v!13517 V!34081)) (EmptyCell!10430) )
))
(declare-datatypes ((array!59744 0))(
  ( (array!59745 (arr!28736 (Array (_ BitVec 32) ValueCell!10430)) (size!29216 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59744)

(declare-fun mapDefault!34729 () ValueCell!10430)

(assert (=> b!967991 (= condMapEmpty!34729 (= (arr!28736 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10430)) mapDefault!34729)))))

(declare-fun b!967992 () Bool)

(assert (=> b!967992 (= e!545708 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59746 0))(
  ( (array!59747 (arr!28737 (Array (_ BitVec 32) (_ BitVec 64))) (size!29217 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59746)

(declare-fun minValue!1342 () V!34081)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34081)

(declare-datatypes ((tuple2!14088 0))(
  ( (tuple2!14089 (_1!7055 (_ BitVec 64)) (_2!7055 V!34081)) )
))
(declare-datatypes ((List!19933 0))(
  ( (Nil!19930) (Cons!19929 (h!21097 tuple2!14088) (t!28288 List!19933)) )
))
(declare-datatypes ((ListLongMap!12787 0))(
  ( (ListLongMap!12788 (toList!6409 List!19933)) )
))
(declare-fun contains!5521 (ListLongMap!12787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3642 (array!59746 array!59744 (_ BitVec 32) (_ BitVec 32) V!34081 V!34081 (_ BitVec 32) Int) ListLongMap!12787)

(assert (=> b!967992 (contains!5521 (getCurrentListMap!3642 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28737 _keys!1686) i!803))))

(declare-datatypes ((Unit!32274 0))(
  ( (Unit!32275) )
))
(declare-fun lt!431750 () Unit!32274)

(declare-fun lemmaInListMapFromThenInFromMinusOne!48 (array!59746 array!59744 (_ BitVec 32) (_ BitVec 32) V!34081 V!34081 (_ BitVec 32) (_ BitVec 32) Int) Unit!32274)

(assert (=> b!967992 (= lt!431750 (lemmaInListMapFromThenInFromMinusOne!48 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967993 () Bool)

(declare-fun res!647706 () Bool)

(assert (=> b!967993 (=> (not res!647706) (not e!545708))))

(assert (=> b!967993 (= res!647706 (contains!5521 (getCurrentListMap!3642 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28737 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34729 () Bool)

(assert (=> mapIsEmpty!34729 mapRes!34729))

(declare-fun mapNonEmpty!34729 () Bool)

(declare-fun tp!66175 () Bool)

(assert (=> mapNonEmpty!34729 (= mapRes!34729 (and tp!66175 e!545707))))

(declare-fun mapKey!34729 () (_ BitVec 32))

(declare-fun mapValue!34729 () ValueCell!10430)

(declare-fun mapRest!34729 () (Array (_ BitVec 32) ValueCell!10430))

(assert (=> mapNonEmpty!34729 (= (arr!28736 _values!1400) (store mapRest!34729 mapKey!34729 mapValue!34729))))

(declare-fun b!967994 () Bool)

(assert (=> b!967994 (= e!545705 tp_is_empty!21823)))

(declare-fun b!967995 () Bool)

(declare-fun res!647704 () Bool)

(assert (=> b!967995 (=> (not res!647704) (not e!545708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59746 (_ BitVec 32)) Bool)

(assert (=> b!967995 (= res!647704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967996 () Bool)

(declare-fun res!647700 () Bool)

(assert (=> b!967996 (=> (not res!647700) (not e!545708))))

(assert (=> b!967996 (= res!647700 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29217 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29217 _keys!1686))))))

(declare-fun res!647703 () Bool)

(assert (=> start!83056 (=> (not res!647703) (not e!545708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83056 (= res!647703 (validMask!0 mask!2110))))

(assert (=> start!83056 e!545708))

(assert (=> start!83056 true))

(declare-fun array_inv!22307 (array!59744) Bool)

(assert (=> start!83056 (and (array_inv!22307 _values!1400) e!545706)))

(declare-fun array_inv!22308 (array!59746) Bool)

(assert (=> start!83056 (array_inv!22308 _keys!1686)))

(assert (=> start!83056 tp!66174))

(assert (=> start!83056 tp_is_empty!21823))

(declare-fun b!967997 () Bool)

(declare-fun res!647701 () Bool)

(assert (=> b!967997 (=> (not res!647701) (not e!545708))))

(declare-datatypes ((List!19934 0))(
  ( (Nil!19931) (Cons!19930 (h!21098 (_ BitVec 64)) (t!28289 List!19934)) )
))
(declare-fun arrayNoDuplicates!0 (array!59746 (_ BitVec 32) List!19934) Bool)

(assert (=> b!967997 (= res!647701 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19931))))

(declare-fun b!967998 () Bool)

(declare-fun res!647699 () Bool)

(assert (=> b!967998 (=> (not res!647699) (not e!545708))))

(assert (=> b!967998 (= res!647699 (and (= (size!29216 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29217 _keys!1686) (size!29216 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967999 () Bool)

(declare-fun res!647705 () Bool)

(assert (=> b!967999 (=> (not res!647705) (not e!545708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967999 (= res!647705 (validKeyInArray!0 (select (arr!28737 _keys!1686) i!803)))))

(assert (= (and start!83056 res!647703) b!967998))

(assert (= (and b!967998 res!647699) b!967995))

(assert (= (and b!967995 res!647704) b!967997))

(assert (= (and b!967997 res!647701) b!967996))

(assert (= (and b!967996 res!647700) b!967999))

(assert (= (and b!967999 res!647705) b!967993))

(assert (= (and b!967993 res!647706) b!967990))

(assert (= (and b!967990 res!647702) b!967992))

(assert (= (and b!967991 condMapEmpty!34729) mapIsEmpty!34729))

(assert (= (and b!967991 (not condMapEmpty!34729)) mapNonEmpty!34729))

(get-info :version)

(assert (= (and mapNonEmpty!34729 ((_ is ValueCellFull!10430) mapValue!34729)) b!967989))

(assert (= (and b!967991 ((_ is ValueCellFull!10430) mapDefault!34729)) b!967994))

(assert (= start!83056 b!967991))

(declare-fun m!897007 () Bool)

(assert (=> b!967992 m!897007))

(declare-fun m!897009 () Bool)

(assert (=> b!967992 m!897009))

(assert (=> b!967992 m!897007))

(assert (=> b!967992 m!897009))

(declare-fun m!897011 () Bool)

(assert (=> b!967992 m!897011))

(declare-fun m!897013 () Bool)

(assert (=> b!967992 m!897013))

(declare-fun m!897015 () Bool)

(assert (=> b!967993 m!897015))

(assert (=> b!967993 m!897009))

(assert (=> b!967993 m!897015))

(assert (=> b!967993 m!897009))

(declare-fun m!897017 () Bool)

(assert (=> b!967993 m!897017))

(declare-fun m!897019 () Bool)

(assert (=> b!967995 m!897019))

(declare-fun m!897021 () Bool)

(assert (=> mapNonEmpty!34729 m!897021))

(declare-fun m!897023 () Bool)

(assert (=> b!967997 m!897023))

(assert (=> b!967999 m!897009))

(assert (=> b!967999 m!897009))

(declare-fun m!897025 () Bool)

(assert (=> b!967999 m!897025))

(declare-fun m!897027 () Bool)

(assert (=> start!83056 m!897027))

(declare-fun m!897029 () Bool)

(assert (=> start!83056 m!897029))

(declare-fun m!897031 () Bool)

(assert (=> start!83056 m!897031))

(check-sat tp_is_empty!21823 (not mapNonEmpty!34729) (not b_next!19015) (not b!967993) (not b!967999) (not b!967992) (not b!967995) (not start!83056) b_and!30513 (not b!967997))
(check-sat b_and!30513 (not b_next!19015))
