; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111036 () Bool)

(assert start!111036)

(declare-fun b_free!29647 () Bool)

(declare-fun b_next!29647 () Bool)

(assert (=> start!111036 (= b_free!29647 (not b_next!29647))))

(declare-fun tp!104262 () Bool)

(declare-fun b_and!47857 () Bool)

(assert (=> start!111036 (= tp!104262 b_and!47857)))

(declare-fun b!1312858 () Bool)

(declare-fun res!871215 () Bool)

(declare-fun e!749056 () Bool)

(assert (=> b!1312858 (=> (not res!871215) (not e!749056))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312858 (= res!871215 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!871209 () Bool)

(assert (=> start!111036 (=> (not res!871209) (not e!749056))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111036 (= res!871209 (validMask!0 mask!2040))))

(assert (=> start!111036 e!749056))

(assert (=> start!111036 tp!104262))

(declare-datatypes ((array!87791 0))(
  ( (array!87792 (arr!42371 (Array (_ BitVec 32) (_ BitVec 64))) (size!42922 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87791)

(declare-fun array_inv!32277 (array!87791) Bool)

(assert (=> start!111036 (array_inv!32277 _keys!1628)))

(assert (=> start!111036 true))

(declare-fun tp_is_empty!35377 () Bool)

(assert (=> start!111036 tp_is_empty!35377))

(declare-datatypes ((V!52273 0))(
  ( (V!52274 (val!17763 Int)) )
))
(declare-datatypes ((ValueCell!16790 0))(
  ( (ValueCellFull!16790 (v!20385 V!52273)) (EmptyCell!16790) )
))
(declare-datatypes ((array!87793 0))(
  ( (array!87794 (arr!42372 (Array (_ BitVec 32) ValueCell!16790)) (size!42923 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87793)

(declare-fun e!749058 () Bool)

(declare-fun array_inv!32278 (array!87793) Bool)

(assert (=> start!111036 (and (array_inv!32278 _values!1354) e!749058)))

(declare-fun b!1312859 () Bool)

(declare-fun res!871212 () Bool)

(assert (=> b!1312859 (=> (not res!871212) (not e!749056))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312859 (= res!871212 (validKeyInArray!0 (select (arr!42371 _keys!1628) from!2020)))))

(declare-fun b!1312860 () Bool)

(declare-fun res!871213 () Bool)

(assert (=> b!1312860 (=> (not res!871213) (not e!749056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87791 (_ BitVec 32)) Bool)

(assert (=> b!1312860 (= res!871213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54694 () Bool)

(declare-fun mapRes!54694 () Bool)

(declare-fun tp!104263 () Bool)

(declare-fun e!749059 () Bool)

(assert (=> mapNonEmpty!54694 (= mapRes!54694 (and tp!104263 e!749059))))

(declare-fun mapValue!54694 () ValueCell!16790)

(declare-fun mapKey!54694 () (_ BitVec 32))

(declare-fun mapRest!54694 () (Array (_ BitVec 32) ValueCell!16790))

(assert (=> mapNonEmpty!54694 (= (arr!42372 _values!1354) (store mapRest!54694 mapKey!54694 mapValue!54694))))

(declare-fun b!1312861 () Bool)

(declare-fun res!871217 () Bool)

(assert (=> b!1312861 (=> (not res!871217) (not e!749056))))

(declare-datatypes ((List!30081 0))(
  ( (Nil!30078) (Cons!30077 (h!31295 (_ BitVec 64)) (t!43679 List!30081)) )
))
(declare-fun arrayNoDuplicates!0 (array!87791 (_ BitVec 32) List!30081) Bool)

(assert (=> b!1312861 (= res!871217 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30078))))

(declare-fun b!1312862 () Bool)

(declare-fun res!871214 () Bool)

(assert (=> b!1312862 (=> (not res!871214) (not e!749056))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52273)

(declare-fun zeroValue!1296 () V!52273)

(declare-datatypes ((tuple2!22926 0))(
  ( (tuple2!22927 (_1!11474 (_ BitVec 64)) (_2!11474 V!52273)) )
))
(declare-datatypes ((List!30082 0))(
  ( (Nil!30079) (Cons!30078 (h!31296 tuple2!22926) (t!43680 List!30082)) )
))
(declare-datatypes ((ListLongMap!20591 0))(
  ( (ListLongMap!20592 (toList!10311 List!30082)) )
))
(declare-fun contains!8473 (ListLongMap!20591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5315 (array!87791 array!87793 (_ BitVec 32) (_ BitVec 32) V!52273 V!52273 (_ BitVec 32) Int) ListLongMap!20591)

(assert (=> b!1312862 (= res!871214 (contains!8473 (getCurrentListMap!5315 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312863 () Bool)

(declare-fun res!871210 () Bool)

(assert (=> b!1312863 (=> (not res!871210) (not e!749056))))

(assert (=> b!1312863 (= res!871210 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42922 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312864 () Bool)

(declare-fun res!871216 () Bool)

(assert (=> b!1312864 (=> (not res!871216) (not e!749056))))

(assert (=> b!1312864 (= res!871216 (and (= (size!42923 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42922 _keys!1628) (size!42923 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312865 () Bool)

(declare-fun res!871211 () Bool)

(assert (=> b!1312865 (=> (not res!871211) (not e!749056))))

(assert (=> b!1312865 (= res!871211 (not (= (select (arr!42371 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312866 () Bool)

(assert (=> b!1312866 (= e!749056 (not true))))

(assert (=> b!1312866 (contains!8473 (getCurrentListMap!5315 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43321 0))(
  ( (Unit!43322) )
))
(declare-fun lt!585965 () Unit!43321)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!1 (array!87791 array!87793 (_ BitVec 32) (_ BitVec 32) V!52273 V!52273 (_ BitVec 64) (_ BitVec 32) Int) Unit!43321)

(assert (=> b!1312866 (= lt!585965 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312867 () Bool)

(assert (=> b!1312867 (= e!749059 tp_is_empty!35377)))

(declare-fun b!1312868 () Bool)

(declare-fun e!749060 () Bool)

(assert (=> b!1312868 (= e!749058 (and e!749060 mapRes!54694))))

(declare-fun condMapEmpty!54694 () Bool)

(declare-fun mapDefault!54694 () ValueCell!16790)

(assert (=> b!1312868 (= condMapEmpty!54694 (= (arr!42372 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16790)) mapDefault!54694)))))

(declare-fun mapIsEmpty!54694 () Bool)

(assert (=> mapIsEmpty!54694 mapRes!54694))

(declare-fun b!1312869 () Bool)

(assert (=> b!1312869 (= e!749060 tp_is_empty!35377)))

(assert (= (and start!111036 res!871209) b!1312864))

(assert (= (and b!1312864 res!871216) b!1312860))

(assert (= (and b!1312860 res!871213) b!1312861))

(assert (= (and b!1312861 res!871217) b!1312863))

(assert (= (and b!1312863 res!871210) b!1312862))

(assert (= (and b!1312862 res!871214) b!1312865))

(assert (= (and b!1312865 res!871211) b!1312859))

(assert (= (and b!1312859 res!871212) b!1312858))

(assert (= (and b!1312858 res!871215) b!1312866))

(assert (= (and b!1312868 condMapEmpty!54694) mapIsEmpty!54694))

(assert (= (and b!1312868 (not condMapEmpty!54694)) mapNonEmpty!54694))

(get-info :version)

(assert (= (and mapNonEmpty!54694 ((_ is ValueCellFull!16790) mapValue!54694)) b!1312867))

(assert (= (and b!1312868 ((_ is ValueCellFull!16790) mapDefault!54694)) b!1312869))

(assert (= start!111036 b!1312868))

(declare-fun m!1202579 () Bool)

(assert (=> b!1312865 m!1202579))

(assert (=> b!1312859 m!1202579))

(assert (=> b!1312859 m!1202579))

(declare-fun m!1202581 () Bool)

(assert (=> b!1312859 m!1202581))

(declare-fun m!1202583 () Bool)

(assert (=> b!1312866 m!1202583))

(assert (=> b!1312866 m!1202583))

(declare-fun m!1202585 () Bool)

(assert (=> b!1312866 m!1202585))

(declare-fun m!1202587 () Bool)

(assert (=> b!1312866 m!1202587))

(declare-fun m!1202589 () Bool)

(assert (=> b!1312861 m!1202589))

(declare-fun m!1202591 () Bool)

(assert (=> start!111036 m!1202591))

(declare-fun m!1202593 () Bool)

(assert (=> start!111036 m!1202593))

(declare-fun m!1202595 () Bool)

(assert (=> start!111036 m!1202595))

(declare-fun m!1202597 () Bool)

(assert (=> b!1312860 m!1202597))

(declare-fun m!1202599 () Bool)

(assert (=> b!1312862 m!1202599))

(assert (=> b!1312862 m!1202599))

(declare-fun m!1202601 () Bool)

(assert (=> b!1312862 m!1202601))

(declare-fun m!1202603 () Bool)

(assert (=> mapNonEmpty!54694 m!1202603))

(check-sat (not b!1312860) (not mapNonEmpty!54694) (not b!1312861) (not b!1312866) (not b_next!29647) b_and!47857 (not start!111036) (not b!1312859) (not b!1312862) tp_is_empty!35377)
(check-sat b_and!47857 (not b_next!29647))
