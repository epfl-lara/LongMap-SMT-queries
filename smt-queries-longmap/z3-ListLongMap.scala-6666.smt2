; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83950 () Bool)

(assert start!83950)

(declare-fun b!980990 () Bool)

(declare-fun res!656500 () Bool)

(declare-fun e!553025 () Bool)

(assert (=> b!980990 (=> (not res!656500) (not e!553025))))

(declare-datatypes ((array!61472 0))(
  ( (array!61473 (arr!29594 (Array (_ BitVec 32) (_ BitVec 64))) (size!30075 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61472)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980990 (= res!656500 (validKeyInArray!0 (select (arr!29594 _keys!1544) from!1932)))))

(declare-fun res!656502 () Bool)

(assert (=> start!83950 (=> (not res!656502) (not e!553025))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83950 (= res!656502 (validMask!0 mask!1948))))

(assert (=> start!83950 e!553025))

(assert (=> start!83950 true))

(declare-datatypes ((V!35345 0))(
  ( (V!35346 (val!11436 Int)) )
))
(declare-datatypes ((ValueCell!10904 0))(
  ( (ValueCellFull!10904 (v!13997 V!35345)) (EmptyCell!10904) )
))
(declare-datatypes ((array!61474 0))(
  ( (array!61475 (arr!29595 (Array (_ BitVec 32) ValueCell!10904)) (size!30076 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61474)

(declare-fun e!553021 () Bool)

(declare-fun array_inv!22903 (array!61474) Bool)

(assert (=> start!83950 (and (array_inv!22903 _values!1278) e!553021)))

(declare-fun array_inv!22904 (array!61472) Bool)

(assert (=> start!83950 (array_inv!22904 _keys!1544)))

(declare-fun b!980991 () Bool)

(declare-fun e!553022 () Bool)

(declare-fun tp_is_empty!22771 () Bool)

(assert (=> b!980991 (= e!553022 tp_is_empty!22771)))

(declare-fun b!980992 () Bool)

(declare-fun res!656503 () Bool)

(assert (=> b!980992 (=> (not res!656503) (not e!553025))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980992 (= res!656503 (and (= (size!30076 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30075 _keys!1544) (size!30076 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980993 () Bool)

(declare-fun mapRes!36185 () Bool)

(assert (=> b!980993 (= e!553021 (and e!553022 mapRes!36185))))

(declare-fun condMapEmpty!36185 () Bool)

(declare-fun mapDefault!36185 () ValueCell!10904)

(assert (=> b!980993 (= condMapEmpty!36185 (= (arr!29595 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10904)) mapDefault!36185)))))

(declare-fun b!980994 () Bool)

(declare-fun res!656505 () Bool)

(assert (=> b!980994 (=> (not res!656505) (not e!553025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61472 (_ BitVec 32)) Bool)

(assert (=> b!980994 (= res!656505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980995 () Bool)

(declare-fun res!656501 () Bool)

(assert (=> b!980995 (=> (not res!656501) (not e!553025))))

(assert (=> b!980995 (= res!656501 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30075 _keys!1544))))))

(declare-fun b!980996 () Bool)

(declare-fun res!656504 () Bool)

(assert (=> b!980996 (=> (not res!656504) (not e!553025))))

(declare-datatypes ((List!20553 0))(
  ( (Nil!20550) (Cons!20549 (h!21711 (_ BitVec 64)) (t!29227 List!20553)) )
))
(declare-fun arrayNoDuplicates!0 (array!61472 (_ BitVec 32) List!20553) Bool)

(assert (=> b!980996 (= res!656504 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20550))))

(declare-fun b!980997 () Bool)

(assert (=> b!980997 (= e!553025 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!980998 () Bool)

(declare-fun e!553023 () Bool)

(assert (=> b!980998 (= e!553023 tp_is_empty!22771)))

(declare-fun mapNonEmpty!36185 () Bool)

(declare-fun tp!68699 () Bool)

(assert (=> mapNonEmpty!36185 (= mapRes!36185 (and tp!68699 e!553023))))

(declare-fun mapValue!36185 () ValueCell!10904)

(declare-fun mapRest!36185 () (Array (_ BitVec 32) ValueCell!10904))

(declare-fun mapKey!36185 () (_ BitVec 32))

(assert (=> mapNonEmpty!36185 (= (arr!29595 _values!1278) (store mapRest!36185 mapKey!36185 mapValue!36185))))

(declare-fun mapIsEmpty!36185 () Bool)

(assert (=> mapIsEmpty!36185 mapRes!36185))

(assert (= (and start!83950 res!656502) b!980992))

(assert (= (and b!980992 res!656503) b!980994))

(assert (= (and b!980994 res!656505) b!980996))

(assert (= (and b!980996 res!656504) b!980995))

(assert (= (and b!980995 res!656501) b!980990))

(assert (= (and b!980990 res!656500) b!980997))

(assert (= (and b!980993 condMapEmpty!36185) mapIsEmpty!36185))

(assert (= (and b!980993 (not condMapEmpty!36185)) mapNonEmpty!36185))

(get-info :version)

(assert (= (and mapNonEmpty!36185 ((_ is ValueCellFull!10904) mapValue!36185)) b!980998))

(assert (= (and b!980993 ((_ is ValueCellFull!10904) mapDefault!36185)) b!980991))

(assert (= start!83950 b!980993))

(declare-fun m!907913 () Bool)

(assert (=> b!980996 m!907913))

(declare-fun m!907915 () Bool)

(assert (=> mapNonEmpty!36185 m!907915))

(declare-fun m!907917 () Bool)

(assert (=> b!980990 m!907917))

(assert (=> b!980990 m!907917))

(declare-fun m!907919 () Bool)

(assert (=> b!980990 m!907919))

(declare-fun m!907921 () Bool)

(assert (=> start!83950 m!907921))

(declare-fun m!907923 () Bool)

(assert (=> start!83950 m!907923))

(declare-fun m!907925 () Bool)

(assert (=> start!83950 m!907925))

(declare-fun m!907927 () Bool)

(assert (=> b!980994 m!907927))

(check-sat (not b!980994) (not b!980996) tp_is_empty!22771 (not b!980990) (not mapNonEmpty!36185) (not start!83950))
(check-sat)
