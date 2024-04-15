; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110686 () Bool)

(assert start!110686)

(declare-fun b_free!29521 () Bool)

(declare-fun b_next!29521 () Bool)

(assert (=> start!110686 (= b_free!29521 (not b_next!29521))))

(declare-fun tp!103885 () Bool)

(declare-fun b_and!47711 () Bool)

(assert (=> start!110686 (= tp!103885 b_and!47711)))

(declare-fun b!1309653 () Bool)

(declare-fun e!747236 () Bool)

(declare-fun tp_is_empty!35251 () Bool)

(assert (=> b!1309653 (= e!747236 tp_is_empty!35251)))

(declare-fun res!869395 () Bool)

(declare-fun e!747239 () Bool)

(assert (=> start!110686 (=> (not res!869395) (not e!747239))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110686 (= res!869395 (validMask!0 mask!2040))))

(assert (=> start!110686 e!747239))

(assert (=> start!110686 tp!103885))

(declare-datatypes ((array!87407 0))(
  ( (array!87408 (arr!42184 (Array (_ BitVec 32) (_ BitVec 64))) (size!42736 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87407)

(declare-fun array_inv!32067 (array!87407) Bool)

(assert (=> start!110686 (array_inv!32067 _keys!1628)))

(assert (=> start!110686 true))

(assert (=> start!110686 tp_is_empty!35251))

(declare-datatypes ((V!52105 0))(
  ( (V!52106 (val!17700 Int)) )
))
(declare-datatypes ((ValueCell!16727 0))(
  ( (ValueCellFull!16727 (v!20326 V!52105)) (EmptyCell!16727) )
))
(declare-datatypes ((array!87409 0))(
  ( (array!87410 (arr!42185 (Array (_ BitVec 32) ValueCell!16727)) (size!42737 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87409)

(declare-fun e!747235 () Bool)

(declare-fun array_inv!32068 (array!87409) Bool)

(assert (=> start!110686 (and (array_inv!32068 _values!1354) e!747235)))

(declare-fun mapIsEmpty!54505 () Bool)

(declare-fun mapRes!54505 () Bool)

(assert (=> mapIsEmpty!54505 mapRes!54505))

(declare-fun b!1309654 () Bool)

(declare-fun res!869400 () Bool)

(assert (=> b!1309654 (=> (not res!869400) (not e!747239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87407 (_ BitVec 32)) Bool)

(assert (=> b!1309654 (= res!869400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309655 () Bool)

(declare-fun res!869401 () Bool)

(assert (=> b!1309655 (=> (not res!869401) (not e!747239))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309655 (= res!869401 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309656 () Bool)

(declare-fun res!869396 () Bool)

(assert (=> b!1309656 (=> (not res!869396) (not e!747239))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52105)

(declare-fun zeroValue!1296 () V!52105)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22882 0))(
  ( (tuple2!22883 (_1!11452 (_ BitVec 64)) (_2!11452 V!52105)) )
))
(declare-datatypes ((List!30009 0))(
  ( (Nil!30006) (Cons!30005 (h!31214 tuple2!22882) (t!43607 List!30009)) )
))
(declare-datatypes ((ListLongMap!20539 0))(
  ( (ListLongMap!20540 (toList!10285 List!30009)) )
))
(declare-fun contains!8362 (ListLongMap!20539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5180 (array!87407 array!87409 (_ BitVec 32) (_ BitVec 32) V!52105 V!52105 (_ BitVec 32) Int) ListLongMap!20539)

(assert (=> b!1309656 (= res!869396 (contains!8362 (getCurrentListMap!5180 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309657 () Bool)

(declare-fun res!869394 () Bool)

(assert (=> b!1309657 (=> (not res!869394) (not e!747239))))

(assert (=> b!1309657 (= res!869394 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42736 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309658 () Bool)

(assert (=> b!1309658 (= e!747235 (and e!747236 mapRes!54505))))

(declare-fun condMapEmpty!54505 () Bool)

(declare-fun mapDefault!54505 () ValueCell!16727)

(assert (=> b!1309658 (= condMapEmpty!54505 (= (arr!42185 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16727)) mapDefault!54505)))))

(declare-fun b!1309659 () Bool)

(declare-fun res!869397 () Bool)

(assert (=> b!1309659 (=> (not res!869397) (not e!747239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309659 (= res!869397 (validKeyInArray!0 (select (arr!42184 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54505 () Bool)

(declare-fun tp!103886 () Bool)

(declare-fun e!747237 () Bool)

(assert (=> mapNonEmpty!54505 (= mapRes!54505 (and tp!103886 e!747237))))

(declare-fun mapValue!54505 () ValueCell!16727)

(declare-fun mapRest!54505 () (Array (_ BitVec 32) ValueCell!16727))

(declare-fun mapKey!54505 () (_ BitVec 32))

(assert (=> mapNonEmpty!54505 (= (arr!42185 _values!1354) (store mapRest!54505 mapKey!54505 mapValue!54505))))

(declare-fun b!1309660 () Bool)

(assert (=> b!1309660 (= e!747237 tp_is_empty!35251)))

(declare-fun b!1309661 () Bool)

(declare-fun res!869399 () Bool)

(assert (=> b!1309661 (=> (not res!869399) (not e!747239))))

(declare-datatypes ((List!30010 0))(
  ( (Nil!30007) (Cons!30006 (h!31215 (_ BitVec 64)) (t!43608 List!30010)) )
))
(declare-fun arrayNoDuplicates!0 (array!87407 (_ BitVec 32) List!30010) Bool)

(assert (=> b!1309661 (= res!869399 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30007))))

(declare-fun b!1309662 () Bool)

(declare-fun res!869398 () Bool)

(assert (=> b!1309662 (=> (not res!869398) (not e!747239))))

(assert (=> b!1309662 (= res!869398 (not (= (select (arr!42184 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309663 () Bool)

(declare-fun res!869393 () Bool)

(assert (=> b!1309663 (=> (not res!869393) (not e!747239))))

(assert (=> b!1309663 (= res!869393 (and (= (size!42737 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42736 _keys!1628) (size!42737 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309664 () Bool)

(assert (=> b!1309664 (= e!747239 (not true))))

(assert (=> b!1309664 (contains!8362 (getCurrentListMap!5180 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43149 0))(
  ( (Unit!43150) )
))
(declare-fun lt!585114 () Unit!43149)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!1 (array!87407 array!87409 (_ BitVec 32) (_ BitVec 32) V!52105 V!52105 (_ BitVec 64) (_ BitVec 32) Int) Unit!43149)

(assert (=> b!1309664 (= lt!585114 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(assert (= (and start!110686 res!869395) b!1309663))

(assert (= (and b!1309663 res!869393) b!1309654))

(assert (= (and b!1309654 res!869400) b!1309661))

(assert (= (and b!1309661 res!869399) b!1309657))

(assert (= (and b!1309657 res!869394) b!1309656))

(assert (= (and b!1309656 res!869396) b!1309662))

(assert (= (and b!1309662 res!869398) b!1309659))

(assert (= (and b!1309659 res!869397) b!1309655))

(assert (= (and b!1309655 res!869401) b!1309664))

(assert (= (and b!1309658 condMapEmpty!54505) mapIsEmpty!54505))

(assert (= (and b!1309658 (not condMapEmpty!54505)) mapNonEmpty!54505))

(get-info :version)

(assert (= (and mapNonEmpty!54505 ((_ is ValueCellFull!16727) mapValue!54505)) b!1309660))

(assert (= (and b!1309658 ((_ is ValueCellFull!16727) mapDefault!54505)) b!1309653))

(assert (= start!110686 b!1309658))

(declare-fun m!1199187 () Bool)

(assert (=> mapNonEmpty!54505 m!1199187))

(declare-fun m!1199189 () Bool)

(assert (=> b!1309661 m!1199189))

(declare-fun m!1199191 () Bool)

(assert (=> b!1309654 m!1199191))

(declare-fun m!1199193 () Bool)

(assert (=> b!1309656 m!1199193))

(assert (=> b!1309656 m!1199193))

(declare-fun m!1199195 () Bool)

(assert (=> b!1309656 m!1199195))

(declare-fun m!1199197 () Bool)

(assert (=> start!110686 m!1199197))

(declare-fun m!1199199 () Bool)

(assert (=> start!110686 m!1199199))

(declare-fun m!1199201 () Bool)

(assert (=> start!110686 m!1199201))

(declare-fun m!1199203 () Bool)

(assert (=> b!1309659 m!1199203))

(assert (=> b!1309659 m!1199203))

(declare-fun m!1199205 () Bool)

(assert (=> b!1309659 m!1199205))

(assert (=> b!1309662 m!1199203))

(declare-fun m!1199207 () Bool)

(assert (=> b!1309664 m!1199207))

(assert (=> b!1309664 m!1199207))

(declare-fun m!1199209 () Bool)

(assert (=> b!1309664 m!1199209))

(declare-fun m!1199211 () Bool)

(assert (=> b!1309664 m!1199211))

(check-sat (not b_next!29521) tp_is_empty!35251 (not b!1309661) (not start!110686) (not b!1309659) b_and!47711 (not mapNonEmpty!54505) (not b!1309654) (not b!1309656) (not b!1309664))
(check-sat b_and!47711 (not b_next!29521))
