; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110842 () Bool)

(assert start!110842)

(declare-fun b_free!29677 () Bool)

(declare-fun b_next!29677 () Bool)

(assert (=> start!110842 (= b_free!29677 (not b_next!29677))))

(declare-fun tp!104354 () Bool)

(declare-fun b_and!47867 () Bool)

(assert (=> start!110842 (= tp!104354 b_and!47867)))

(declare-fun mapIsEmpty!54739 () Bool)

(declare-fun mapRes!54739 () Bool)

(assert (=> mapIsEmpty!54739 mapRes!54739))

(declare-fun b!1312029 () Bool)

(declare-fun e!748409 () Bool)

(declare-fun tp_is_empty!35407 () Bool)

(assert (=> b!1312029 (= e!748409 tp_is_empty!35407)))

(declare-fun res!871068 () Bool)

(declare-fun e!748408 () Bool)

(assert (=> start!110842 (=> (not res!871068) (not e!748408))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110842 (= res!871068 (validMask!0 mask!2040))))

(assert (=> start!110842 e!748408))

(assert (=> start!110842 tp!104354))

(declare-datatypes ((array!87707 0))(
  ( (array!87708 (arr!42334 (Array (_ BitVec 32) (_ BitVec 64))) (size!42886 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87707)

(declare-fun array_inv!32173 (array!87707) Bool)

(assert (=> start!110842 (array_inv!32173 _keys!1628)))

(assert (=> start!110842 true))

(assert (=> start!110842 tp_is_empty!35407))

(declare-datatypes ((V!52313 0))(
  ( (V!52314 (val!17778 Int)) )
))
(declare-datatypes ((ValueCell!16805 0))(
  ( (ValueCellFull!16805 (v!20404 V!52313)) (EmptyCell!16805) )
))
(declare-datatypes ((array!87709 0))(
  ( (array!87710 (arr!42335 (Array (_ BitVec 32) ValueCell!16805)) (size!42887 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87709)

(declare-fun e!748407 () Bool)

(declare-fun array_inv!32174 (array!87709) Bool)

(assert (=> start!110842 (and (array_inv!32174 _values!1354) e!748407)))

(declare-fun b!1312030 () Bool)

(declare-fun res!871074 () Bool)

(assert (=> b!1312030 (=> (not res!871074) (not e!748408))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312030 (= res!871074 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42886 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312031 () Bool)

(assert (=> b!1312031 (= e!748407 (and e!748409 mapRes!54739))))

(declare-fun condMapEmpty!54739 () Bool)

(declare-fun mapDefault!54739 () ValueCell!16805)

(assert (=> b!1312031 (= condMapEmpty!54739 (= (arr!42335 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16805)) mapDefault!54739)))))

(declare-fun b!1312032 () Bool)

(declare-fun res!871075 () Bool)

(assert (=> b!1312032 (=> (not res!871075) (not e!748408))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312032 (= res!871075 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312033 () Bool)

(assert (=> b!1312033 (= e!748408 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52313)

(declare-fun zeroValue!1296 () V!52313)

(declare-datatypes ((tuple2!23002 0))(
  ( (tuple2!23003 (_1!11512 (_ BitVec 64)) (_2!11512 V!52313)) )
))
(declare-datatypes ((List!30122 0))(
  ( (Nil!30119) (Cons!30118 (h!31327 tuple2!23002) (t!43720 List!30122)) )
))
(declare-datatypes ((ListLongMap!20659 0))(
  ( (ListLongMap!20660 (toList!10345 List!30122)) )
))
(declare-fun contains!8422 (ListLongMap!20659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5240 (array!87707 array!87709 (_ BitVec 32) (_ BitVec 32) V!52313 V!52313 (_ BitVec 32) Int) ListLongMap!20659)

(assert (=> b!1312033 (contains!8422 (getCurrentListMap!5240 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43205 0))(
  ( (Unit!43206) )
))
(declare-fun lt!585348 () Unit!43205)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!13 (array!87707 array!87709 (_ BitVec 32) (_ BitVec 32) V!52313 V!52313 (_ BitVec 64) (_ BitVec 32) Int) Unit!43205)

(assert (=> b!1312033 (= lt!585348 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!13 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312034 () Bool)

(declare-fun res!871070 () Bool)

(assert (=> b!1312034 (=> (not res!871070) (not e!748408))))

(declare-datatypes ((List!30123 0))(
  ( (Nil!30120) (Cons!30119 (h!31328 (_ BitVec 64)) (t!43721 List!30123)) )
))
(declare-fun arrayNoDuplicates!0 (array!87707 (_ BitVec 32) List!30123) Bool)

(assert (=> b!1312034 (= res!871070 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30120))))

(declare-fun b!1312035 () Bool)

(declare-fun res!871073 () Bool)

(assert (=> b!1312035 (=> (not res!871073) (not e!748408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87707 (_ BitVec 32)) Bool)

(assert (=> b!1312035 (= res!871073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312036 () Bool)

(declare-fun res!871071 () Bool)

(assert (=> b!1312036 (=> (not res!871071) (not e!748408))))

(assert (=> b!1312036 (= res!871071 (not (= (select (arr!42334 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312037 () Bool)

(declare-fun res!871067 () Bool)

(assert (=> b!1312037 (=> (not res!871067) (not e!748408))))

(assert (=> b!1312037 (= res!871067 (contains!8422 (getCurrentListMap!5240 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312038 () Bool)

(declare-fun e!748405 () Bool)

(assert (=> b!1312038 (= e!748405 tp_is_empty!35407)))

(declare-fun mapNonEmpty!54739 () Bool)

(declare-fun tp!104353 () Bool)

(assert (=> mapNonEmpty!54739 (= mapRes!54739 (and tp!104353 e!748405))))

(declare-fun mapRest!54739 () (Array (_ BitVec 32) ValueCell!16805))

(declare-fun mapValue!54739 () ValueCell!16805)

(declare-fun mapKey!54739 () (_ BitVec 32))

(assert (=> mapNonEmpty!54739 (= (arr!42335 _values!1354) (store mapRest!54739 mapKey!54739 mapValue!54739))))

(declare-fun b!1312039 () Bool)

(declare-fun res!871072 () Bool)

(assert (=> b!1312039 (=> (not res!871072) (not e!748408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312039 (= res!871072 (validKeyInArray!0 (select (arr!42334 _keys!1628) from!2020)))))

(declare-fun b!1312040 () Bool)

(declare-fun res!871069 () Bool)

(assert (=> b!1312040 (=> (not res!871069) (not e!748408))))

(assert (=> b!1312040 (= res!871069 (and (= (size!42887 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42886 _keys!1628) (size!42887 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110842 res!871068) b!1312040))

(assert (= (and b!1312040 res!871069) b!1312035))

(assert (= (and b!1312035 res!871073) b!1312034))

(assert (= (and b!1312034 res!871070) b!1312030))

(assert (= (and b!1312030 res!871074) b!1312037))

(assert (= (and b!1312037 res!871067) b!1312036))

(assert (= (and b!1312036 res!871071) b!1312039))

(assert (= (and b!1312039 res!871072) b!1312032))

(assert (= (and b!1312032 res!871075) b!1312033))

(assert (= (and b!1312031 condMapEmpty!54739) mapIsEmpty!54739))

(assert (= (and b!1312031 (not condMapEmpty!54739)) mapNonEmpty!54739))

(get-info :version)

(assert (= (and mapNonEmpty!54739 ((_ is ValueCellFull!16805) mapValue!54739)) b!1312038))

(assert (= (and b!1312031 ((_ is ValueCellFull!16805) mapDefault!54739)) b!1312029))

(assert (= start!110842 b!1312031))

(declare-fun m!1200855 () Bool)

(assert (=> b!1312039 m!1200855))

(assert (=> b!1312039 m!1200855))

(declare-fun m!1200857 () Bool)

(assert (=> b!1312039 m!1200857))

(declare-fun m!1200859 () Bool)

(assert (=> b!1312033 m!1200859))

(assert (=> b!1312033 m!1200859))

(declare-fun m!1200861 () Bool)

(assert (=> b!1312033 m!1200861))

(declare-fun m!1200863 () Bool)

(assert (=> b!1312033 m!1200863))

(declare-fun m!1200865 () Bool)

(assert (=> start!110842 m!1200865))

(declare-fun m!1200867 () Bool)

(assert (=> start!110842 m!1200867))

(declare-fun m!1200869 () Bool)

(assert (=> start!110842 m!1200869))

(declare-fun m!1200871 () Bool)

(assert (=> mapNonEmpty!54739 m!1200871))

(declare-fun m!1200873 () Bool)

(assert (=> b!1312037 m!1200873))

(assert (=> b!1312037 m!1200873))

(declare-fun m!1200875 () Bool)

(assert (=> b!1312037 m!1200875))

(declare-fun m!1200877 () Bool)

(assert (=> b!1312034 m!1200877))

(declare-fun m!1200879 () Bool)

(assert (=> b!1312035 m!1200879))

(assert (=> b!1312036 m!1200855))

(check-sat (not b!1312033) (not b!1312035) b_and!47867 (not start!110842) (not b!1312037) tp_is_empty!35407 (not b!1312034) (not b_next!29677) (not b!1312039) (not mapNonEmpty!54739))
(check-sat b_and!47867 (not b_next!29677))
