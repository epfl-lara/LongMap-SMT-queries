; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83736 () Bool)

(assert start!83736)

(declare-fun b!977734 () Bool)

(declare-fun e!551267 () Bool)

(declare-fun e!551270 () Bool)

(declare-fun mapRes!35837 () Bool)

(assert (=> b!977734 (= e!551267 (and e!551270 mapRes!35837))))

(declare-fun condMapEmpty!35837 () Bool)

(declare-datatypes ((V!35035 0))(
  ( (V!35036 (val!11320 Int)) )
))
(declare-datatypes ((ValueCell!10788 0))(
  ( (ValueCellFull!10788 (v!13882 V!35035)) (EmptyCell!10788) )
))
(declare-datatypes ((array!61105 0))(
  ( (array!61106 (arr!29410 (Array (_ BitVec 32) ValueCell!10788)) (size!29889 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61105)

(declare-fun mapDefault!35837 () ValueCell!10788)

(assert (=> b!977734 (= condMapEmpty!35837 (= (arr!29410 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10788)) mapDefault!35837)))))

(declare-fun b!977735 () Bool)

(declare-fun e!551271 () Bool)

(assert (=> b!977735 (= e!551271 false)))

(declare-fun lt!433517 () Bool)

(declare-datatypes ((array!61107 0))(
  ( (array!61108 (arr!29411 (Array (_ BitVec 32) (_ BitVec 64))) (size!29890 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61107)

(declare-datatypes ((List!20386 0))(
  ( (Nil!20383) (Cons!20382 (h!21544 (_ BitVec 64)) (t!28901 List!20386)) )
))
(declare-fun arrayNoDuplicates!0 (array!61107 (_ BitVec 32) List!20386) Bool)

(assert (=> b!977735 (= lt!433517 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20383))))

(declare-fun b!977736 () Bool)

(declare-fun tp_is_empty!22539 () Bool)

(assert (=> b!977736 (= e!551270 tp_is_empty!22539)))

(declare-fun b!977737 () Bool)

(declare-fun res!654328 () Bool)

(assert (=> b!977737 (=> (not res!654328) (not e!551271))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61107 (_ BitVec 32)) Bool)

(assert (=> b!977737 (= res!654328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35837 () Bool)

(assert (=> mapIsEmpty!35837 mapRes!35837))

(declare-fun mapNonEmpty!35837 () Bool)

(declare-fun tp!68089 () Bool)

(declare-fun e!551268 () Bool)

(assert (=> mapNonEmpty!35837 (= mapRes!35837 (and tp!68089 e!551268))))

(declare-fun mapRest!35837 () (Array (_ BitVec 32) ValueCell!10788))

(declare-fun mapKey!35837 () (_ BitVec 32))

(declare-fun mapValue!35837 () ValueCell!10788)

(assert (=> mapNonEmpty!35837 (= (arr!29410 _values!1278) (store mapRest!35837 mapKey!35837 mapValue!35837))))

(declare-fun b!977739 () Bool)

(assert (=> b!977739 (= e!551268 tp_is_empty!22539)))

(declare-fun res!654329 () Bool)

(assert (=> start!83736 (=> (not res!654329) (not e!551271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83736 (= res!654329 (validMask!0 mask!1948))))

(assert (=> start!83736 e!551271))

(assert (=> start!83736 true))

(declare-fun array_inv!22737 (array!61105) Bool)

(assert (=> start!83736 (and (array_inv!22737 _values!1278) e!551267)))

(declare-fun array_inv!22738 (array!61107) Bool)

(assert (=> start!83736 (array_inv!22738 _keys!1544)))

(declare-fun b!977738 () Bool)

(declare-fun res!654327 () Bool)

(assert (=> b!977738 (=> (not res!654327) (not e!551271))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977738 (= res!654327 (and (= (size!29889 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29890 _keys!1544) (size!29889 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83736 res!654329) b!977738))

(assert (= (and b!977738 res!654327) b!977737))

(assert (= (and b!977737 res!654328) b!977735))

(assert (= (and b!977734 condMapEmpty!35837) mapIsEmpty!35837))

(assert (= (and b!977734 (not condMapEmpty!35837)) mapNonEmpty!35837))

(get-info :version)

(assert (= (and mapNonEmpty!35837 ((_ is ValueCellFull!10788) mapValue!35837)) b!977739))

(assert (= (and b!977734 ((_ is ValueCellFull!10788) mapDefault!35837)) b!977736))

(assert (= start!83736 b!977734))

(declare-fun m!904903 () Bool)

(assert (=> b!977735 m!904903))

(declare-fun m!904905 () Bool)

(assert (=> b!977737 m!904905))

(declare-fun m!904907 () Bool)

(assert (=> mapNonEmpty!35837 m!904907))

(declare-fun m!904909 () Bool)

(assert (=> start!83736 m!904909))

(declare-fun m!904911 () Bool)

(assert (=> start!83736 m!904911))

(declare-fun m!904913 () Bool)

(assert (=> start!83736 m!904913))

(check-sat tp_is_empty!22539 (not b!977735) (not start!83736) (not mapNonEmpty!35837) (not b!977737))
(check-sat)
