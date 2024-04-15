; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4466 () Bool)

(assert start!4466)

(declare-fun b_free!1237 () Bool)

(declare-fun b_next!1237 () Bool)

(assert (=> start!4466 (= b_free!1237 (not b_next!1237))))

(declare-fun tp!5148 () Bool)

(declare-fun b_and!2053 () Bool)

(assert (=> start!4466 (= tp!5148 b_and!2053)))

(declare-fun b!34717 () Bool)

(declare-fun e!21971 () Bool)

(declare-fun tp_is_empty!1591 () Bool)

(assert (=> b!34717 (= e!21971 tp_is_empty!1591)))

(declare-fun b!34718 () Bool)

(declare-fun e!21968 () Bool)

(assert (=> b!34718 (= e!21968 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!156 0))(
  ( (MissingZero!156 (index!2746 (_ BitVec 32))) (Found!156 (index!2747 (_ BitVec 32))) (Intermediate!156 (undefined!968 Bool) (index!2748 (_ BitVec 32)) (x!6958 (_ BitVec 32))) (Undefined!156) (MissingVacant!156 (index!2749 (_ BitVec 32))) )
))
(declare-fun lt!12809 () SeekEntryResult!156)

(declare-datatypes ((array!2371 0))(
  ( (array!2372 (arr!1133 (Array (_ BitVec 32) (_ BitVec 64))) (size!1234 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2371)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2371 (_ BitVec 32)) SeekEntryResult!156)

(assert (=> b!34718 (= lt!12809 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34719 () Bool)

(declare-fun res!21088 () Bool)

(assert (=> b!34719 (=> (not res!21088) (not e!21968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34719 (= res!21088 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1933 () Bool)

(declare-fun mapRes!1933 () Bool)

(declare-fun tp!5149 () Bool)

(declare-fun e!21972 () Bool)

(assert (=> mapNonEmpty!1933 (= mapRes!1933 (and tp!5149 e!21972))))

(declare-fun mapKey!1933 () (_ BitVec 32))

(declare-datatypes ((V!1947 0))(
  ( (V!1948 (val!822 Int)) )
))
(declare-datatypes ((ValueCell!596 0))(
  ( (ValueCellFull!596 (v!1916 V!1947)) (EmptyCell!596) )
))
(declare-datatypes ((array!2373 0))(
  ( (array!2374 (arr!1134 (Array (_ BitVec 32) ValueCell!596)) (size!1235 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2373)

(declare-fun mapRest!1933 () (Array (_ BitVec 32) ValueCell!596))

(declare-fun mapValue!1933 () ValueCell!596)

(assert (=> mapNonEmpty!1933 (= (arr!1134 _values!1501) (store mapRest!1933 mapKey!1933 mapValue!1933))))

(declare-fun b!34720 () Bool)

(declare-fun res!21094 () Bool)

(assert (=> b!34720 (=> (not res!21094) (not e!21968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2371 (_ BitVec 32)) Bool)

(assert (=> b!34720 (= res!21094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1933 () Bool)

(assert (=> mapIsEmpty!1933 mapRes!1933))

(declare-fun b!34721 () Bool)

(declare-fun res!21093 () Bool)

(assert (=> b!34721 (=> (not res!21093) (not e!21968))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34721 (= res!21093 (and (= (size!1235 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1234 _keys!1833) (size!1235 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34722 () Bool)

(declare-fun res!21090 () Bool)

(assert (=> b!34722 (=> (not res!21090) (not e!21968))))

(declare-fun arrayContainsKey!0 (array!2371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34722 (= res!21090 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34723 () Bool)

(declare-fun e!21969 () Bool)

(assert (=> b!34723 (= e!21969 (and e!21971 mapRes!1933))))

(declare-fun condMapEmpty!1933 () Bool)

(declare-fun mapDefault!1933 () ValueCell!596)

(assert (=> b!34723 (= condMapEmpty!1933 (= (arr!1134 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!596)) mapDefault!1933)))))

(declare-fun b!34724 () Bool)

(declare-fun res!21089 () Bool)

(assert (=> b!34724 (=> (not res!21089) (not e!21968))))

(declare-datatypes ((List!910 0))(
  ( (Nil!907) (Cons!906 (h!1473 (_ BitVec 64)) (t!3608 List!910)) )
))
(declare-fun arrayNoDuplicates!0 (array!2371 (_ BitVec 32) List!910) Bool)

(assert (=> b!34724 (= res!21089 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!907))))

(declare-fun res!21092 () Bool)

(assert (=> start!4466 (=> (not res!21092) (not e!21968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4466 (= res!21092 (validMask!0 mask!2294))))

(assert (=> start!4466 e!21968))

(assert (=> start!4466 true))

(assert (=> start!4466 tp!5148))

(declare-fun array_inv!801 (array!2373) Bool)

(assert (=> start!4466 (and (array_inv!801 _values!1501) e!21969)))

(declare-fun array_inv!802 (array!2371) Bool)

(assert (=> start!4466 (array_inv!802 _keys!1833)))

(assert (=> start!4466 tp_is_empty!1591))

(declare-fun b!34725 () Bool)

(declare-fun res!21091 () Bool)

(assert (=> b!34725 (=> (not res!21091) (not e!21968))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1947)

(declare-fun minValue!1443 () V!1947)

(declare-datatypes ((tuple2!1328 0))(
  ( (tuple2!1329 (_1!675 (_ BitVec 64)) (_2!675 V!1947)) )
))
(declare-datatypes ((List!911 0))(
  ( (Nil!908) (Cons!907 (h!1474 tuple2!1328) (t!3609 List!911)) )
))
(declare-datatypes ((ListLongMap!893 0))(
  ( (ListLongMap!894 (toList!462 List!911)) )
))
(declare-fun contains!409 (ListLongMap!893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!281 (array!2371 array!2373 (_ BitVec 32) (_ BitVec 32) V!1947 V!1947 (_ BitVec 32) Int) ListLongMap!893)

(assert (=> b!34725 (= res!21091 (not (contains!409 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34726 () Bool)

(assert (=> b!34726 (= e!21972 tp_is_empty!1591)))

(assert (= (and start!4466 res!21092) b!34721))

(assert (= (and b!34721 res!21093) b!34720))

(assert (= (and b!34720 res!21094) b!34724))

(assert (= (and b!34724 res!21089) b!34719))

(assert (= (and b!34719 res!21088) b!34725))

(assert (= (and b!34725 res!21091) b!34722))

(assert (= (and b!34722 res!21090) b!34718))

(assert (= (and b!34723 condMapEmpty!1933) mapIsEmpty!1933))

(assert (= (and b!34723 (not condMapEmpty!1933)) mapNonEmpty!1933))

(get-info :version)

(assert (= (and mapNonEmpty!1933 ((_ is ValueCellFull!596) mapValue!1933)) b!34726))

(assert (= (and b!34723 ((_ is ValueCellFull!596) mapDefault!1933)) b!34717))

(assert (= start!4466 b!34723))

(declare-fun m!27941 () Bool)

(assert (=> b!34725 m!27941))

(assert (=> b!34725 m!27941))

(declare-fun m!27943 () Bool)

(assert (=> b!34725 m!27943))

(declare-fun m!27945 () Bool)

(assert (=> b!34718 m!27945))

(declare-fun m!27947 () Bool)

(assert (=> b!34724 m!27947))

(declare-fun m!27949 () Bool)

(assert (=> b!34722 m!27949))

(declare-fun m!27951 () Bool)

(assert (=> mapNonEmpty!1933 m!27951))

(declare-fun m!27953 () Bool)

(assert (=> b!34720 m!27953))

(declare-fun m!27955 () Bool)

(assert (=> b!34719 m!27955))

(declare-fun m!27957 () Bool)

(assert (=> start!4466 m!27957))

(declare-fun m!27959 () Bool)

(assert (=> start!4466 m!27959))

(declare-fun m!27961 () Bool)

(assert (=> start!4466 m!27961))

(check-sat (not b_next!1237) (not b!34719) (not b!34725) (not b!34722) (not b!34720) tp_is_empty!1591 (not start!4466) (not b!34718) (not b!34724) (not mapNonEmpty!1933) b_and!2053)
(check-sat b_and!2053 (not b_next!1237))
