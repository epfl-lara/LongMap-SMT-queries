; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110946 () Bool)

(assert start!110946)

(declare-fun b_free!29557 () Bool)

(declare-fun b_next!29557 () Bool)

(assert (=> start!110946 (= b_free!29557 (not b_next!29557))))

(declare-fun tp!103992 () Bool)

(declare-fun b_and!47767 () Bool)

(assert (=> start!110946 (= tp!103992 b_and!47767)))

(declare-fun b!1311670 () Bool)

(declare-fun res!870430 () Bool)

(declare-fun e!748383 () Bool)

(assert (=> b!1311670 (=> (not res!870430) (not e!748383))))

(declare-datatypes ((array!87627 0))(
  ( (array!87628 (arr!42289 (Array (_ BitVec 32) (_ BitVec 64))) (size!42840 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87627)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311670 (= res!870430 (validKeyInArray!0 (select (arr!42289 _keys!1628) from!2020)))))

(declare-fun res!870433 () Bool)

(assert (=> start!110946 (=> (not res!870433) (not e!748383))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110946 (= res!870433 (validMask!0 mask!2040))))

(assert (=> start!110946 e!748383))

(assert (=> start!110946 tp!103992))

(declare-fun array_inv!32227 (array!87627) Bool)

(assert (=> start!110946 (array_inv!32227 _keys!1628)))

(assert (=> start!110946 true))

(declare-fun tp_is_empty!35287 () Bool)

(assert (=> start!110946 tp_is_empty!35287))

(declare-datatypes ((V!52153 0))(
  ( (V!52154 (val!17718 Int)) )
))
(declare-datatypes ((ValueCell!16745 0))(
  ( (ValueCellFull!16745 (v!20340 V!52153)) (EmptyCell!16745) )
))
(declare-datatypes ((array!87629 0))(
  ( (array!87630 (arr!42290 (Array (_ BitVec 32) ValueCell!16745)) (size!42841 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87629)

(declare-fun e!748384 () Bool)

(declare-fun array_inv!32228 (array!87629) Bool)

(assert (=> start!110946 (and (array_inv!32228 _values!1354) e!748384)))

(declare-fun b!1311671 () Bool)

(declare-fun res!870427 () Bool)

(assert (=> b!1311671 (=> (not res!870427) (not e!748383))))

(declare-datatypes ((List!30023 0))(
  ( (Nil!30020) (Cons!30019 (h!31237 (_ BitVec 64)) (t!43621 List!30023)) )
))
(declare-fun arrayNoDuplicates!0 (array!87627 (_ BitVec 32) List!30023) Bool)

(assert (=> b!1311671 (= res!870427 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30020))))

(declare-fun b!1311672 () Bool)

(declare-fun res!870426 () Bool)

(assert (=> b!1311672 (=> (not res!870426) (not e!748383))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311672 (= res!870426 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311673 () Bool)

(declare-fun res!870431 () Bool)

(assert (=> b!1311673 (=> (not res!870431) (not e!748383))))

(assert (=> b!1311673 (= res!870431 (and (= (size!42841 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42840 _keys!1628) (size!42841 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311674 () Bool)

(declare-fun res!870434 () Bool)

(assert (=> b!1311674 (=> (not res!870434) (not e!748383))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1311674 (= res!870434 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42840 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311675 () Bool)

(declare-fun e!748385 () Bool)

(assert (=> b!1311675 (= e!748385 tp_is_empty!35287)))

(declare-fun b!1311676 () Bool)

(declare-fun res!870432 () Bool)

(assert (=> b!1311676 (=> (not res!870432) (not e!748383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87627 (_ BitVec 32)) Bool)

(assert (=> b!1311676 (= res!870432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311677 () Bool)

(assert (=> b!1311677 (= e!748383 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52153)

(declare-fun zeroValue!1296 () V!52153)

(declare-datatypes ((tuple2!22872 0))(
  ( (tuple2!22873 (_1!11447 (_ BitVec 64)) (_2!11447 V!52153)) )
))
(declare-datatypes ((List!30024 0))(
  ( (Nil!30021) (Cons!30020 (h!31238 tuple2!22872) (t!43622 List!30024)) )
))
(declare-datatypes ((ListLongMap!20537 0))(
  ( (ListLongMap!20538 (toList!10284 List!30024)) )
))
(declare-fun contains!8446 (ListLongMap!20537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5288 (array!87627 array!87629 (_ BitVec 32) (_ BitVec 32) V!52153 V!52153 (_ BitVec 32) Int) ListLongMap!20537)

(assert (=> b!1311677 (contains!8446 (getCurrentListMap!5288 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43309 0))(
  ( (Unit!43310) )
))
(declare-fun lt!585830 () Unit!43309)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!16 (array!87627 array!87629 (_ BitVec 32) (_ BitVec 32) V!52153 V!52153 (_ BitVec 64) (_ BitVec 32) Int) Unit!43309)

(assert (=> b!1311677 (= lt!585830 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!16 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54559 () Bool)

(declare-fun mapRes!54559 () Bool)

(assert (=> mapIsEmpty!54559 mapRes!54559))

(declare-fun mapNonEmpty!54559 () Bool)

(declare-fun tp!103993 () Bool)

(assert (=> mapNonEmpty!54559 (= mapRes!54559 (and tp!103993 e!748385))))

(declare-fun mapRest!54559 () (Array (_ BitVec 32) ValueCell!16745))

(declare-fun mapValue!54559 () ValueCell!16745)

(declare-fun mapKey!54559 () (_ BitVec 32))

(assert (=> mapNonEmpty!54559 (= (arr!42290 _values!1354) (store mapRest!54559 mapKey!54559 mapValue!54559))))

(declare-fun b!1311678 () Bool)

(declare-fun e!748381 () Bool)

(assert (=> b!1311678 (= e!748384 (and e!748381 mapRes!54559))))

(declare-fun condMapEmpty!54559 () Bool)

(declare-fun mapDefault!54559 () ValueCell!16745)

(assert (=> b!1311678 (= condMapEmpty!54559 (= (arr!42290 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16745)) mapDefault!54559)))))

(declare-fun b!1311679 () Bool)

(assert (=> b!1311679 (= e!748381 tp_is_empty!35287)))

(declare-fun b!1311680 () Bool)

(declare-fun res!870428 () Bool)

(assert (=> b!1311680 (=> (not res!870428) (not e!748383))))

(assert (=> b!1311680 (= res!870428 (contains!8446 (getCurrentListMap!5288 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311681 () Bool)

(declare-fun res!870429 () Bool)

(assert (=> b!1311681 (=> (not res!870429) (not e!748383))))

(assert (=> b!1311681 (= res!870429 (not (= (select (arr!42289 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!110946 res!870433) b!1311673))

(assert (= (and b!1311673 res!870431) b!1311676))

(assert (= (and b!1311676 res!870432) b!1311671))

(assert (= (and b!1311671 res!870427) b!1311674))

(assert (= (and b!1311674 res!870434) b!1311680))

(assert (= (and b!1311680 res!870428) b!1311681))

(assert (= (and b!1311681 res!870429) b!1311670))

(assert (= (and b!1311670 res!870430) b!1311672))

(assert (= (and b!1311672 res!870426) b!1311677))

(assert (= (and b!1311678 condMapEmpty!54559) mapIsEmpty!54559))

(assert (= (and b!1311678 (not condMapEmpty!54559)) mapNonEmpty!54559))

(get-info :version)

(assert (= (and mapNonEmpty!54559 ((_ is ValueCellFull!16745) mapValue!54559)) b!1311675))

(assert (= (and b!1311678 ((_ is ValueCellFull!16745) mapDefault!54559)) b!1311679))

(assert (= start!110946 b!1311678))

(declare-fun m!1201769 () Bool)

(assert (=> start!110946 m!1201769))

(declare-fun m!1201771 () Bool)

(assert (=> start!110946 m!1201771))

(declare-fun m!1201773 () Bool)

(assert (=> start!110946 m!1201773))

(declare-fun m!1201775 () Bool)

(assert (=> b!1311671 m!1201775))

(declare-fun m!1201777 () Bool)

(assert (=> b!1311670 m!1201777))

(assert (=> b!1311670 m!1201777))

(declare-fun m!1201779 () Bool)

(assert (=> b!1311670 m!1201779))

(declare-fun m!1201781 () Bool)

(assert (=> mapNonEmpty!54559 m!1201781))

(declare-fun m!1201783 () Bool)

(assert (=> b!1311676 m!1201783))

(declare-fun m!1201785 () Bool)

(assert (=> b!1311677 m!1201785))

(assert (=> b!1311677 m!1201785))

(declare-fun m!1201787 () Bool)

(assert (=> b!1311677 m!1201787))

(declare-fun m!1201789 () Bool)

(assert (=> b!1311677 m!1201789))

(declare-fun m!1201791 () Bool)

(assert (=> b!1311680 m!1201791))

(assert (=> b!1311680 m!1201791))

(declare-fun m!1201793 () Bool)

(assert (=> b!1311680 m!1201793))

(assert (=> b!1311681 m!1201777))

(check-sat (not b!1311680) (not mapNonEmpty!54559) b_and!47767 (not b!1311677) (not b!1311671) (not b!1311676) (not start!110946) tp_is_empty!35287 (not b!1311670) (not b_next!29557))
(check-sat b_and!47767 (not b_next!29557))
