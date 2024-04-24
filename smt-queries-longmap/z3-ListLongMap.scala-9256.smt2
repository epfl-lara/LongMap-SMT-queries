; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111108 () Bool)

(assert start!111108)

(declare-fun b_free!29719 () Bool)

(declare-fun b_next!29719 () Bool)

(assert (=> start!111108 (= b_free!29719 (not b_next!29719))))

(declare-fun tp!104479 () Bool)

(declare-fun b_and!47929 () Bool)

(assert (=> start!111108 (= tp!104479 b_and!47929)))

(declare-fun mapNonEmpty!54802 () Bool)

(declare-fun mapRes!54802 () Bool)

(declare-fun tp!104478 () Bool)

(declare-fun e!749597 () Bool)

(assert (=> mapNonEmpty!54802 (= mapRes!54802 (and tp!104478 e!749597))))

(declare-datatypes ((V!52369 0))(
  ( (V!52370 (val!17799 Int)) )
))
(declare-datatypes ((ValueCell!16826 0))(
  ( (ValueCellFull!16826 (v!20421 V!52369)) (EmptyCell!16826) )
))
(declare-fun mapValue!54802 () ValueCell!16826)

(declare-datatypes ((array!87933 0))(
  ( (array!87934 (arr!42442 (Array (_ BitVec 32) ValueCell!16826)) (size!42993 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87933)

(declare-fun mapRest!54802 () (Array (_ BitVec 32) ValueCell!16826))

(declare-fun mapKey!54802 () (_ BitVec 32))

(assert (=> mapNonEmpty!54802 (= (arr!42442 _values!1354) (store mapRest!54802 mapKey!54802 mapValue!54802))))

(declare-fun b!1314038 () Bool)

(declare-fun res!872069 () Bool)

(declare-fun e!749599 () Bool)

(assert (=> b!1314038 (=> (not res!872069) (not e!749599))))

(declare-datatypes ((array!87935 0))(
  ( (array!87936 (arr!42443 (Array (_ BitVec 32) (_ BitVec 64))) (size!42994 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87935)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314038 (= res!872069 (and (= (size!42993 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42994 _keys!1628) (size!42993 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314039 () Bool)

(declare-fun tp_is_empty!35449 () Bool)

(assert (=> b!1314039 (= e!749597 tp_is_empty!35449)))

(declare-fun b!1314040 () Bool)

(declare-fun e!749596 () Bool)

(declare-fun e!749600 () Bool)

(assert (=> b!1314040 (= e!749596 (and e!749600 mapRes!54802))))

(declare-fun condMapEmpty!54802 () Bool)

(declare-fun mapDefault!54802 () ValueCell!16826)

(assert (=> b!1314040 (= condMapEmpty!54802 (= (arr!42442 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16826)) mapDefault!54802)))))

(declare-fun b!1314041 () Bool)

(assert (=> b!1314041 (= e!749599 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52369)

(declare-fun zeroValue!1296 () V!52369)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586073 () Bool)

(declare-datatypes ((tuple2!22972 0))(
  ( (tuple2!22973 (_1!11497 (_ BitVec 64)) (_2!11497 V!52369)) )
))
(declare-datatypes ((List!30124 0))(
  ( (Nil!30121) (Cons!30120 (h!31338 tuple2!22972) (t!43722 List!30124)) )
))
(declare-datatypes ((ListLongMap!20637 0))(
  ( (ListLongMap!20638 (toList!10334 List!30124)) )
))
(declare-fun contains!8496 (ListLongMap!20637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5338 (array!87935 array!87933 (_ BitVec 32) (_ BitVec 32) V!52369 V!52369 (_ BitVec 32) Int) ListLongMap!20637)

(assert (=> b!1314041 (= lt!586073 (contains!8496 (getCurrentListMap!5338 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!872068 () Bool)

(assert (=> start!111108 (=> (not res!872068) (not e!749599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111108 (= res!872068 (validMask!0 mask!2040))))

(assert (=> start!111108 e!749599))

(assert (=> start!111108 tp!104479))

(declare-fun array_inv!32323 (array!87935) Bool)

(assert (=> start!111108 (array_inv!32323 _keys!1628)))

(assert (=> start!111108 true))

(assert (=> start!111108 tp_is_empty!35449))

(declare-fun array_inv!32324 (array!87933) Bool)

(assert (=> start!111108 (and (array_inv!32324 _values!1354) e!749596)))

(declare-fun b!1314042 () Bool)

(declare-fun res!872066 () Bool)

(assert (=> b!1314042 (=> (not res!872066) (not e!749599))))

(assert (=> b!1314042 (= res!872066 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42994 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54802 () Bool)

(assert (=> mapIsEmpty!54802 mapRes!54802))

(declare-fun b!1314043 () Bool)

(declare-fun res!872065 () Bool)

(assert (=> b!1314043 (=> (not res!872065) (not e!749599))))

(declare-datatypes ((List!30125 0))(
  ( (Nil!30122) (Cons!30121 (h!31339 (_ BitVec 64)) (t!43723 List!30125)) )
))
(declare-fun arrayNoDuplicates!0 (array!87935 (_ BitVec 32) List!30125) Bool)

(assert (=> b!1314043 (= res!872065 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30122))))

(declare-fun b!1314044 () Bool)

(assert (=> b!1314044 (= e!749600 tp_is_empty!35449)))

(declare-fun b!1314045 () Bool)

(declare-fun res!872067 () Bool)

(assert (=> b!1314045 (=> (not res!872067) (not e!749599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87935 (_ BitVec 32)) Bool)

(assert (=> b!1314045 (= res!872067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111108 res!872068) b!1314038))

(assert (= (and b!1314038 res!872069) b!1314045))

(assert (= (and b!1314045 res!872067) b!1314043))

(assert (= (and b!1314043 res!872065) b!1314042))

(assert (= (and b!1314042 res!872066) b!1314041))

(assert (= (and b!1314040 condMapEmpty!54802) mapIsEmpty!54802))

(assert (= (and b!1314040 (not condMapEmpty!54802)) mapNonEmpty!54802))

(get-info :version)

(assert (= (and mapNonEmpty!54802 ((_ is ValueCellFull!16826) mapValue!54802)) b!1314039))

(assert (= (and b!1314040 ((_ is ValueCellFull!16826) mapDefault!54802)) b!1314044))

(assert (= start!111108 b!1314040))

(declare-fun m!1203425 () Bool)

(assert (=> mapNonEmpty!54802 m!1203425))

(declare-fun m!1203427 () Bool)

(assert (=> b!1314041 m!1203427))

(assert (=> b!1314041 m!1203427))

(declare-fun m!1203429 () Bool)

(assert (=> b!1314041 m!1203429))

(declare-fun m!1203431 () Bool)

(assert (=> start!111108 m!1203431))

(declare-fun m!1203433 () Bool)

(assert (=> start!111108 m!1203433))

(declare-fun m!1203435 () Bool)

(assert (=> start!111108 m!1203435))

(declare-fun m!1203437 () Bool)

(assert (=> b!1314045 m!1203437))

(declare-fun m!1203439 () Bool)

(assert (=> b!1314043 m!1203439))

(check-sat (not b!1314041) tp_is_empty!35449 (not b!1314045) (not mapNonEmpty!54802) b_and!47929 (not b_next!29719) (not b!1314043) (not start!111108))
(check-sat b_and!47929 (not b_next!29719))
