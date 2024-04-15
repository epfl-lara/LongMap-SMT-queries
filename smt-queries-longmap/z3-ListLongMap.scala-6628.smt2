; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83722 () Bool)

(assert start!83722)

(declare-fun b!977537 () Bool)

(declare-fun res!654245 () Bool)

(declare-fun e!551149 () Bool)

(assert (=> b!977537 (=> (not res!654245) (not e!551149))))

(declare-datatypes ((array!61044 0))(
  ( (array!61045 (arr!29380 (Array (_ BitVec 32) (_ BitVec 64))) (size!29861 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61044)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977537 (= res!654245 (validKeyInArray!0 (select (arr!29380 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35843 () Bool)

(declare-fun mapRes!35843 () Bool)

(assert (=> mapIsEmpty!35843 mapRes!35843))

(declare-fun res!654246 () Bool)

(assert (=> start!83722 (=> (not res!654246) (not e!551149))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83722 (= res!654246 (validMask!0 mask!1948))))

(assert (=> start!83722 e!551149))

(assert (=> start!83722 true))

(declare-datatypes ((V!35041 0))(
  ( (V!35042 (val!11322 Int)) )
))
(declare-datatypes ((ValueCell!10790 0))(
  ( (ValueCellFull!10790 (v!13883 V!35041)) (EmptyCell!10790) )
))
(declare-datatypes ((array!61046 0))(
  ( (array!61047 (arr!29381 (Array (_ BitVec 32) ValueCell!10790)) (size!29862 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61046)

(declare-fun e!551151 () Bool)

(declare-fun array_inv!22751 (array!61046) Bool)

(assert (=> start!83722 (and (array_inv!22751 _values!1278) e!551151)))

(declare-fun array_inv!22752 (array!61044) Bool)

(assert (=> start!83722 (array_inv!22752 _keys!1544)))

(declare-fun b!977538 () Bool)

(declare-fun res!654243 () Bool)

(assert (=> b!977538 (=> (not res!654243) (not e!551149))))

(assert (=> b!977538 (= res!654243 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29861 _keys!1544))))))

(declare-fun b!977539 () Bool)

(declare-fun res!654244 () Bool)

(assert (=> b!977539 (=> (not res!654244) (not e!551149))))

(declare-datatypes ((List!20400 0))(
  ( (Nil!20397) (Cons!20396 (h!21558 (_ BitVec 64)) (t!28906 List!20400)) )
))
(declare-fun arrayNoDuplicates!0 (array!61044 (_ BitVec 32) List!20400) Bool)

(assert (=> b!977539 (= res!654244 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20397))))

(declare-fun mapNonEmpty!35843 () Bool)

(declare-fun tp!68096 () Bool)

(declare-fun e!551150 () Bool)

(assert (=> mapNonEmpty!35843 (= mapRes!35843 (and tp!68096 e!551150))))

(declare-fun mapKey!35843 () (_ BitVec 32))

(declare-fun mapValue!35843 () ValueCell!10790)

(declare-fun mapRest!35843 () (Array (_ BitVec 32) ValueCell!10790))

(assert (=> mapNonEmpty!35843 (= (arr!29381 _values!1278) (store mapRest!35843 mapKey!35843 mapValue!35843))))

(declare-fun b!977540 () Bool)

(declare-fun tp_is_empty!22543 () Bool)

(assert (=> b!977540 (= e!551150 tp_is_empty!22543)))

(declare-fun b!977541 () Bool)

(declare-fun res!654241 () Bool)

(assert (=> b!977541 (=> (not res!654241) (not e!551149))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977541 (= res!654241 (and (= (size!29862 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29861 _keys!1544) (size!29862 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977542 () Bool)

(assert (=> b!977542 (= e!551149 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!977543 () Bool)

(declare-fun e!551153 () Bool)

(assert (=> b!977543 (= e!551151 (and e!551153 mapRes!35843))))

(declare-fun condMapEmpty!35843 () Bool)

(declare-fun mapDefault!35843 () ValueCell!10790)

(assert (=> b!977543 (= condMapEmpty!35843 (= (arr!29381 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10790)) mapDefault!35843)))))

(declare-fun b!977544 () Bool)

(assert (=> b!977544 (= e!551153 tp_is_empty!22543)))

(declare-fun b!977545 () Bool)

(declare-fun res!654242 () Bool)

(assert (=> b!977545 (=> (not res!654242) (not e!551149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61044 (_ BitVec 32)) Bool)

(assert (=> b!977545 (= res!654242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83722 res!654246) b!977541))

(assert (= (and b!977541 res!654241) b!977545))

(assert (= (and b!977545 res!654242) b!977539))

(assert (= (and b!977539 res!654244) b!977538))

(assert (= (and b!977538 res!654243) b!977537))

(assert (= (and b!977537 res!654245) b!977542))

(assert (= (and b!977543 condMapEmpty!35843) mapIsEmpty!35843))

(assert (= (and b!977543 (not condMapEmpty!35843)) mapNonEmpty!35843))

(get-info :version)

(assert (= (and mapNonEmpty!35843 ((_ is ValueCellFull!10790) mapValue!35843)) b!977540))

(assert (= (and b!977543 ((_ is ValueCellFull!10790) mapDefault!35843)) b!977544))

(assert (= start!83722 b!977543))

(declare-fun m!904169 () Bool)

(assert (=> mapNonEmpty!35843 m!904169))

(declare-fun m!904171 () Bool)

(assert (=> b!977539 m!904171))

(declare-fun m!904173 () Bool)

(assert (=> b!977545 m!904173))

(declare-fun m!904175 () Bool)

(assert (=> start!83722 m!904175))

(declare-fun m!904177 () Bool)

(assert (=> start!83722 m!904177))

(declare-fun m!904179 () Bool)

(assert (=> start!83722 m!904179))

(declare-fun m!904181 () Bool)

(assert (=> b!977537 m!904181))

(assert (=> b!977537 m!904181))

(declare-fun m!904183 () Bool)

(assert (=> b!977537 m!904183))

(check-sat (not mapNonEmpty!35843) (not b!977537) (not b!977539) (not start!83722) (not b!977545) tp_is_empty!22543)
(check-sat)
