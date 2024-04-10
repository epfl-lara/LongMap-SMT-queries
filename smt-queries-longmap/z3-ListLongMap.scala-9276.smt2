; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111006 () Bool)

(assert start!111006)

(declare-fun b_free!29841 () Bool)

(declare-fun b_next!29841 () Bool)

(assert (=> start!111006 (= b_free!29841 (not b_next!29841))))

(declare-fun tp!104844 () Bool)

(declare-fun b_and!48049 () Bool)

(assert (=> start!111006 (= tp!104844 b_and!48049)))

(declare-fun b!1314250 () Bool)

(declare-fun res!872514 () Bool)

(declare-fun e!749671 () Bool)

(assert (=> b!1314250 (=> (not res!872514) (not e!749671))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88114 0))(
  ( (array!88115 (arr!42537 (Array (_ BitVec 32) (_ BitVec 64))) (size!43087 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88114)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52531 0))(
  ( (V!52532 (val!17860 Int)) )
))
(declare-fun minValue!1296 () V!52531)

(declare-datatypes ((ValueCell!16887 0))(
  ( (ValueCellFull!16887 (v!20487 V!52531)) (EmptyCell!16887) )
))
(declare-datatypes ((array!88116 0))(
  ( (array!88117 (arr!42538 (Array (_ BitVec 32) ValueCell!16887)) (size!43088 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88116)

(declare-fun zeroValue!1296 () V!52531)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23028 0))(
  ( (tuple2!23029 (_1!11525 (_ BitVec 64)) (_2!11525 V!52531)) )
))
(declare-datatypes ((List!30165 0))(
  ( (Nil!30162) (Cons!30161 (h!31370 tuple2!23028) (t!43771 List!30165)) )
))
(declare-datatypes ((ListLongMap!20685 0))(
  ( (ListLongMap!20686 (toList!10358 List!30165)) )
))
(declare-fun contains!8508 (ListLongMap!20685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5371 (array!88114 array!88116 (_ BitVec 32) (_ BitVec 32) V!52531 V!52531 (_ BitVec 32) Int) ListLongMap!20685)

(assert (=> b!1314250 (= res!872514 (contains!8508 (getCurrentListMap!5371 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314251 () Bool)

(declare-fun res!872513 () Bool)

(assert (=> b!1314251 (=> (not res!872513) (not e!749671))))

(assert (=> b!1314251 (= res!872513 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1314252 () Bool)

(declare-fun res!872517 () Bool)

(assert (=> b!1314252 (=> (not res!872517) (not e!749671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88114 (_ BitVec 32)) Bool)

(assert (=> b!1314252 (= res!872517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314253 () Bool)

(declare-fun e!749670 () Bool)

(declare-fun tp_is_empty!35571 () Bool)

(assert (=> b!1314253 (= e!749670 tp_is_empty!35571)))

(declare-fun b!1314254 () Bool)

(declare-fun res!872515 () Bool)

(assert (=> b!1314254 (=> (not res!872515) (not e!749671))))

(assert (=> b!1314254 (= res!872515 (and (= (size!43088 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43087 _keys!1628) (size!43088 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314255 () Bool)

(declare-fun res!872511 () Bool)

(assert (=> b!1314255 (=> (not res!872511) (not e!749671))))

(declare-datatypes ((List!30166 0))(
  ( (Nil!30163) (Cons!30162 (h!31371 (_ BitVec 64)) (t!43772 List!30166)) )
))
(declare-fun arrayNoDuplicates!0 (array!88114 (_ BitVec 32) List!30166) Bool)

(assert (=> b!1314255 (= res!872511 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30163))))

(declare-fun b!1314256 () Bool)

(assert (=> b!1314256 (= e!749671 (not true))))

(assert (=> b!1314256 (contains!8508 (getCurrentListMap!5371 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43386 0))(
  ( (Unit!43387) )
))
(declare-fun lt!585771 () Unit!43386)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!19 (array!88114 array!88116 (_ BitVec 32) (_ BitVec 32) V!52531 V!52531 (_ BitVec 64) (_ BitVec 32) Int) Unit!43386)

(assert (=> b!1314256 (= lt!585771 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!19 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1314257 () Bool)

(declare-fun res!872509 () Bool)

(assert (=> b!1314257 (=> (not res!872509) (not e!749671))))

(assert (=> b!1314257 (= res!872509 (not (= (select (arr!42537 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54985 () Bool)

(declare-fun mapRes!54985 () Bool)

(assert (=> mapIsEmpty!54985 mapRes!54985))

(declare-fun res!872516 () Bool)

(assert (=> start!111006 (=> (not res!872516) (not e!749671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111006 (= res!872516 (validMask!0 mask!2040))))

(assert (=> start!111006 e!749671))

(assert (=> start!111006 tp!104844))

(declare-fun array_inv!32131 (array!88114) Bool)

(assert (=> start!111006 (array_inv!32131 _keys!1628)))

(assert (=> start!111006 true))

(assert (=> start!111006 tp_is_empty!35571))

(declare-fun e!749668 () Bool)

(declare-fun array_inv!32132 (array!88116) Bool)

(assert (=> start!111006 (and (array_inv!32132 _values!1354) e!749668)))

(declare-fun mapNonEmpty!54985 () Bool)

(declare-fun tp!104845 () Bool)

(assert (=> mapNonEmpty!54985 (= mapRes!54985 (and tp!104845 e!749670))))

(declare-fun mapKey!54985 () (_ BitVec 32))

(declare-fun mapRest!54985 () (Array (_ BitVec 32) ValueCell!16887))

(declare-fun mapValue!54985 () ValueCell!16887)

(assert (=> mapNonEmpty!54985 (= (arr!42538 _values!1354) (store mapRest!54985 mapKey!54985 mapValue!54985))))

(declare-fun b!1314258 () Bool)

(declare-fun res!872510 () Bool)

(assert (=> b!1314258 (=> (not res!872510) (not e!749671))))

(assert (=> b!1314258 (= res!872510 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43087 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314259 () Bool)

(declare-fun res!872512 () Bool)

(assert (=> b!1314259 (=> (not res!872512) (not e!749671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1314259 (= res!872512 (validKeyInArray!0 (select (arr!42537 _keys!1628) from!2020)))))

(declare-fun b!1314260 () Bool)

(declare-fun e!749669 () Bool)

(assert (=> b!1314260 (= e!749668 (and e!749669 mapRes!54985))))

(declare-fun condMapEmpty!54985 () Bool)

(declare-fun mapDefault!54985 () ValueCell!16887)

(assert (=> b!1314260 (= condMapEmpty!54985 (= (arr!42538 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16887)) mapDefault!54985)))))

(declare-fun b!1314261 () Bool)

(assert (=> b!1314261 (= e!749669 tp_is_empty!35571)))

(assert (= (and start!111006 res!872516) b!1314254))

(assert (= (and b!1314254 res!872515) b!1314252))

(assert (= (and b!1314252 res!872517) b!1314255))

(assert (= (and b!1314255 res!872511) b!1314258))

(assert (= (and b!1314258 res!872510) b!1314250))

(assert (= (and b!1314250 res!872514) b!1314257))

(assert (= (and b!1314257 res!872509) b!1314259))

(assert (= (and b!1314259 res!872512) b!1314251))

(assert (= (and b!1314251 res!872513) b!1314256))

(assert (= (and b!1314260 condMapEmpty!54985) mapIsEmpty!54985))

(assert (= (and b!1314260 (not condMapEmpty!54985)) mapNonEmpty!54985))

(get-info :version)

(assert (= (and mapNonEmpty!54985 ((_ is ValueCellFull!16887) mapValue!54985)) b!1314253))

(assert (= (and b!1314260 ((_ is ValueCellFull!16887) mapDefault!54985)) b!1314261))

(assert (= start!111006 b!1314260))

(declare-fun m!1202825 () Bool)

(assert (=> b!1314250 m!1202825))

(assert (=> b!1314250 m!1202825))

(declare-fun m!1202827 () Bool)

(assert (=> b!1314250 m!1202827))

(declare-fun m!1202829 () Bool)

(assert (=> start!111006 m!1202829))

(declare-fun m!1202831 () Bool)

(assert (=> start!111006 m!1202831))

(declare-fun m!1202833 () Bool)

(assert (=> start!111006 m!1202833))

(declare-fun m!1202835 () Bool)

(assert (=> b!1314259 m!1202835))

(assert (=> b!1314259 m!1202835))

(declare-fun m!1202837 () Bool)

(assert (=> b!1314259 m!1202837))

(declare-fun m!1202839 () Bool)

(assert (=> b!1314255 m!1202839))

(declare-fun m!1202841 () Bool)

(assert (=> mapNonEmpty!54985 m!1202841))

(declare-fun m!1202843 () Bool)

(assert (=> b!1314252 m!1202843))

(assert (=> b!1314257 m!1202835))

(declare-fun m!1202845 () Bool)

(assert (=> b!1314256 m!1202845))

(assert (=> b!1314256 m!1202845))

(declare-fun m!1202847 () Bool)

(assert (=> b!1314256 m!1202847))

(declare-fun m!1202849 () Bool)

(assert (=> b!1314256 m!1202849))

(check-sat (not mapNonEmpty!54985) tp_is_empty!35571 (not b!1314259) (not b!1314256) (not b_next!29841) (not b!1314255) (not b!1314252) (not b!1314250) b_and!48049 (not start!111006))
(check-sat b_and!48049 (not b_next!29841))
