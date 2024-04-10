; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83724 () Bool)

(assert start!83724)

(declare-fun res!654273 () Bool)

(declare-fun e!551178 () Bool)

(assert (=> start!83724 (=> (not res!654273) (not e!551178))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83724 (= res!654273 (validMask!0 mask!1948))))

(assert (=> start!83724 e!551178))

(assert (=> start!83724 true))

(declare-datatypes ((V!35019 0))(
  ( (V!35020 (val!11314 Int)) )
))
(declare-datatypes ((ValueCell!10782 0))(
  ( (ValueCellFull!10782 (v!13876 V!35019)) (EmptyCell!10782) )
))
(declare-datatypes ((array!61081 0))(
  ( (array!61082 (arr!29398 (Array (_ BitVec 32) ValueCell!10782)) (size!29877 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61081)

(declare-fun e!551179 () Bool)

(declare-fun array_inv!22729 (array!61081) Bool)

(assert (=> start!83724 (and (array_inv!22729 _values!1278) e!551179)))

(declare-datatypes ((array!61083 0))(
  ( (array!61084 (arr!29399 (Array (_ BitVec 32) (_ BitVec 64))) (size!29878 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61083)

(declare-fun array_inv!22730 (array!61083) Bool)

(assert (=> start!83724 (array_inv!22730 _keys!1544)))

(declare-fun mapIsEmpty!35819 () Bool)

(declare-fun mapRes!35819 () Bool)

(assert (=> mapIsEmpty!35819 mapRes!35819))

(declare-fun mapNonEmpty!35819 () Bool)

(declare-fun tp!68071 () Bool)

(declare-fun e!551177 () Bool)

(assert (=> mapNonEmpty!35819 (= mapRes!35819 (and tp!68071 e!551177))))

(declare-fun mapValue!35819 () ValueCell!10782)

(declare-fun mapRest!35819 () (Array (_ BitVec 32) ValueCell!10782))

(declare-fun mapKey!35819 () (_ BitVec 32))

(assert (=> mapNonEmpty!35819 (= (arr!29398 _values!1278) (store mapRest!35819 mapKey!35819 mapValue!35819))))

(declare-fun b!977626 () Bool)

(declare-fun e!551180 () Bool)

(assert (=> b!977626 (= e!551179 (and e!551180 mapRes!35819))))

(declare-fun condMapEmpty!35819 () Bool)

(declare-fun mapDefault!35819 () ValueCell!10782)

(assert (=> b!977626 (= condMapEmpty!35819 (= (arr!29398 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10782)) mapDefault!35819)))))

(declare-fun b!977627 () Bool)

(declare-fun tp_is_empty!22527 () Bool)

(assert (=> b!977627 (= e!551177 tp_is_empty!22527)))

(declare-fun b!977628 () Bool)

(assert (=> b!977628 (= e!551180 tp_is_empty!22527)))

(declare-fun b!977629 () Bool)

(declare-fun res!654274 () Bool)

(assert (=> b!977629 (=> (not res!654274) (not e!551178))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977629 (= res!654274 (and (= (size!29877 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29878 _keys!1544) (size!29877 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977630 () Bool)

(assert (=> b!977630 (= e!551178 false)))

(declare-fun lt!433499 () Bool)

(declare-datatypes ((List!20381 0))(
  ( (Nil!20378) (Cons!20377 (h!21539 (_ BitVec 64)) (t!28896 List!20381)) )
))
(declare-fun arrayNoDuplicates!0 (array!61083 (_ BitVec 32) List!20381) Bool)

(assert (=> b!977630 (= lt!433499 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20378))))

(declare-fun b!977631 () Bool)

(declare-fun res!654275 () Bool)

(assert (=> b!977631 (=> (not res!654275) (not e!551178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61083 (_ BitVec 32)) Bool)

(assert (=> b!977631 (= res!654275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83724 res!654273) b!977629))

(assert (= (and b!977629 res!654274) b!977631))

(assert (= (and b!977631 res!654275) b!977630))

(assert (= (and b!977626 condMapEmpty!35819) mapIsEmpty!35819))

(assert (= (and b!977626 (not condMapEmpty!35819)) mapNonEmpty!35819))

(get-info :version)

(assert (= (and mapNonEmpty!35819 ((_ is ValueCellFull!10782) mapValue!35819)) b!977627))

(assert (= (and b!977626 ((_ is ValueCellFull!10782) mapDefault!35819)) b!977628))

(assert (= start!83724 b!977626))

(declare-fun m!904831 () Bool)

(assert (=> start!83724 m!904831))

(declare-fun m!904833 () Bool)

(assert (=> start!83724 m!904833))

(declare-fun m!904835 () Bool)

(assert (=> start!83724 m!904835))

(declare-fun m!904837 () Bool)

(assert (=> mapNonEmpty!35819 m!904837))

(declare-fun m!904839 () Bool)

(assert (=> b!977630 m!904839))

(declare-fun m!904841 () Bool)

(assert (=> b!977631 m!904841))

(check-sat tp_is_empty!22527 (not b!977630) (not mapNonEmpty!35819) (not b!977631) (not start!83724))
(check-sat)
