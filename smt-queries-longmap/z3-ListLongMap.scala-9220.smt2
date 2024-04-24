; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110892 () Bool)

(assert start!110892)

(declare-fun b_free!29503 () Bool)

(declare-fun b_next!29503 () Bool)

(assert (=> start!110892 (= b_free!29503 (not b_next!29503))))

(declare-fun tp!103831 () Bool)

(declare-fun b_and!47713 () Bool)

(assert (=> start!110892 (= tp!103831 b_and!47713)))

(declare-fun b!1310798 () Bool)

(declare-fun e!747977 () Bool)

(declare-fun tp_is_empty!35233 () Bool)

(assert (=> b!1310798 (= e!747977 tp_is_empty!35233)))

(declare-fun res!869797 () Bool)

(declare-fun e!747979 () Bool)

(assert (=> start!110892 (=> (not res!869797) (not e!747979))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110892 (= res!869797 (validMask!0 mask!2040))))

(assert (=> start!110892 e!747979))

(assert (=> start!110892 tp!103831))

(declare-datatypes ((array!87521 0))(
  ( (array!87522 (arr!42236 (Array (_ BitVec 32) (_ BitVec 64))) (size!42787 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87521)

(declare-fun array_inv!32187 (array!87521) Bool)

(assert (=> start!110892 (array_inv!32187 _keys!1628)))

(assert (=> start!110892 true))

(assert (=> start!110892 tp_is_empty!35233))

(declare-datatypes ((V!52081 0))(
  ( (V!52082 (val!17691 Int)) )
))
(declare-datatypes ((ValueCell!16718 0))(
  ( (ValueCellFull!16718 (v!20313 V!52081)) (EmptyCell!16718) )
))
(declare-datatypes ((array!87523 0))(
  ( (array!87524 (arr!42237 (Array (_ BitVec 32) ValueCell!16718)) (size!42788 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87523)

(declare-fun e!747976 () Bool)

(declare-fun array_inv!32188 (array!87523) Bool)

(assert (=> start!110892 (and (array_inv!32188 _values!1354) e!747976)))

(declare-fun mapNonEmpty!54478 () Bool)

(declare-fun mapRes!54478 () Bool)

(declare-fun tp!103830 () Bool)

(declare-fun e!747978 () Bool)

(assert (=> mapNonEmpty!54478 (= mapRes!54478 (and tp!103830 e!747978))))

(declare-fun mapValue!54478 () ValueCell!16718)

(declare-fun mapKey!54478 () (_ BitVec 32))

(declare-fun mapRest!54478 () (Array (_ BitVec 32) ValueCell!16718))

(assert (=> mapNonEmpty!54478 (= (arr!42237 _values!1354) (store mapRest!54478 mapKey!54478 mapValue!54478))))

(declare-fun b!1310799 () Bool)

(assert (=> b!1310799 (= e!747978 tp_is_empty!35233)))

(declare-fun b!1310800 () Bool)

(assert (=> b!1310800 (= e!747976 (and e!747977 mapRes!54478))))

(declare-fun condMapEmpty!54478 () Bool)

(declare-fun mapDefault!54478 () ValueCell!16718)

(assert (=> b!1310800 (= condMapEmpty!54478 (= (arr!42237 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16718)) mapDefault!54478)))))

(declare-fun b!1310801 () Bool)

(declare-fun res!869801 () Bool)

(assert (=> b!1310801 (=> (not res!869801) (not e!747979))))

(declare-datatypes ((List!29989 0))(
  ( (Nil!29986) (Cons!29985 (h!31203 (_ BitVec 64)) (t!43587 List!29989)) )
))
(declare-fun arrayNoDuplicates!0 (array!87521 (_ BitVec 32) List!29989) Bool)

(assert (=> b!1310801 (= res!869801 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29986))))

(declare-fun b!1310802 () Bool)

(declare-fun res!869799 () Bool)

(assert (=> b!1310802 (=> (not res!869799) (not e!747979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87521 (_ BitVec 32)) Bool)

(assert (=> b!1310802 (= res!869799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310803 () Bool)

(declare-fun res!869800 () Bool)

(assert (=> b!1310803 (=> (not res!869800) (not e!747979))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310803 (= res!869800 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42787 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310804 () Bool)

(declare-fun res!869798 () Bool)

(assert (=> b!1310804 (=> (not res!869798) (not e!747979))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310804 (= res!869798 (and (= (size!42788 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42787 _keys!1628) (size!42788 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310805 () Bool)

(assert (=> b!1310805 (= e!747979 false)))

(declare-fun minValue!1296 () V!52081)

(declare-fun zeroValue!1296 () V!52081)

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585749 () Bool)

(declare-datatypes ((tuple2!22828 0))(
  ( (tuple2!22829 (_1!11425 (_ BitVec 64)) (_2!11425 V!52081)) )
))
(declare-datatypes ((List!29990 0))(
  ( (Nil!29987) (Cons!29986 (h!31204 tuple2!22828) (t!43588 List!29990)) )
))
(declare-datatypes ((ListLongMap!20493 0))(
  ( (ListLongMap!20494 (toList!10262 List!29990)) )
))
(declare-fun contains!8424 (ListLongMap!20493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5266 (array!87521 array!87523 (_ BitVec 32) (_ BitVec 32) V!52081 V!52081 (_ BitVec 32) Int) ListLongMap!20493)

(assert (=> b!1310805 (= lt!585749 (contains!8424 (getCurrentListMap!5266 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54478 () Bool)

(assert (=> mapIsEmpty!54478 mapRes!54478))

(assert (= (and start!110892 res!869797) b!1310804))

(assert (= (and b!1310804 res!869798) b!1310802))

(assert (= (and b!1310802 res!869799) b!1310801))

(assert (= (and b!1310801 res!869801) b!1310803))

(assert (= (and b!1310803 res!869800) b!1310805))

(assert (= (and b!1310800 condMapEmpty!54478) mapIsEmpty!54478))

(assert (= (and b!1310800 (not condMapEmpty!54478)) mapNonEmpty!54478))

(get-info :version)

(assert (= (and mapNonEmpty!54478 ((_ is ValueCellFull!16718) mapValue!54478)) b!1310799))

(assert (= (and b!1310800 ((_ is ValueCellFull!16718) mapDefault!54478)) b!1310798))

(assert (= start!110892 b!1310800))

(declare-fun m!1201157 () Bool)

(assert (=> b!1310802 m!1201157))

(declare-fun m!1201159 () Bool)

(assert (=> b!1310805 m!1201159))

(assert (=> b!1310805 m!1201159))

(declare-fun m!1201161 () Bool)

(assert (=> b!1310805 m!1201161))

(declare-fun m!1201163 () Bool)

(assert (=> b!1310801 m!1201163))

(declare-fun m!1201165 () Bool)

(assert (=> start!110892 m!1201165))

(declare-fun m!1201167 () Bool)

(assert (=> start!110892 m!1201167))

(declare-fun m!1201169 () Bool)

(assert (=> start!110892 m!1201169))

(declare-fun m!1201171 () Bool)

(assert (=> mapNonEmpty!54478 m!1201171))

(check-sat tp_is_empty!35233 (not b_next!29503) (not b!1310805) (not b!1310802) (not mapNonEmpty!54478) (not start!110892) (not b!1310801) b_and!47713)
(check-sat b_and!47713 (not b_next!29503))
