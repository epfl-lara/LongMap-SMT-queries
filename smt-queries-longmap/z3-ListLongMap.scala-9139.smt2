; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109620 () Bool)

(assert start!109620)

(declare-fun b_free!29109 () Bool)

(declare-fun b_next!29109 () Bool)

(assert (=> start!109620 (= b_free!29109 (not b_next!29109))))

(declare-fun tp!102445 () Bool)

(declare-fun b_and!47199 () Bool)

(assert (=> start!109620 (= tp!102445 b_and!47199)))

(declare-fun b!1298497 () Bool)

(declare-fun e!740792 () Bool)

(declare-fun tp_is_empty!34749 () Bool)

(assert (=> b!1298497 (= e!740792 tp_is_empty!34749)))

(declare-fun b!1298498 () Bool)

(declare-fun e!740791 () Bool)

(declare-fun e!740790 () Bool)

(declare-fun mapRes!53684 () Bool)

(assert (=> b!1298498 (= e!740791 (and e!740790 mapRes!53684))))

(declare-fun condMapEmpty!53684 () Bool)

(declare-datatypes ((V!51435 0))(
  ( (V!51436 (val!17449 Int)) )
))
(declare-datatypes ((ValueCell!16476 0))(
  ( (ValueCellFull!16476 (v!20052 V!51435)) (EmptyCell!16476) )
))
(declare-datatypes ((array!86504 0))(
  ( (array!86505 (arr!41753 (Array (_ BitVec 32) ValueCell!16476)) (size!42303 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86504)

(declare-fun mapDefault!53684 () ValueCell!16476)

(assert (=> b!1298498 (= condMapEmpty!53684 (= (arr!41753 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16476)) mapDefault!53684)))))

(declare-fun b!1298499 () Bool)

(declare-fun res!862967 () Bool)

(declare-fun e!740788 () Bool)

(assert (=> b!1298499 (=> (not res!862967) (not e!740788))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86506 0))(
  ( (array!86507 (arr!41754 (Array (_ BitVec 32) (_ BitVec 64))) (size!42304 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86506)

(assert (=> b!1298499 (= res!862967 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42304 _keys!1741))))))

(declare-fun b!1298500 () Bool)

(assert (=> b!1298500 (= e!740790 tp_is_empty!34749)))

(declare-fun b!1298501 () Bool)

(declare-fun res!862964 () Bool)

(assert (=> b!1298501 (=> (not res!862964) (not e!740788))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86506 (_ BitVec 32)) Bool)

(assert (=> b!1298501 (= res!862964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298502 () Bool)

(declare-fun res!862968 () Bool)

(assert (=> b!1298502 (=> (not res!862968) (not e!740788))))

(declare-fun zeroValue!1387 () V!51435)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!51435)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22500 0))(
  ( (tuple2!22501 (_1!11261 (_ BitVec 64)) (_2!11261 V!51435)) )
))
(declare-datatypes ((List!29628 0))(
  ( (Nil!29625) (Cons!29624 (h!30833 tuple2!22500) (t!43192 List!29628)) )
))
(declare-datatypes ((ListLongMap!20157 0))(
  ( (ListLongMap!20158 (toList!10094 List!29628)) )
))
(declare-fun contains!8212 (ListLongMap!20157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5123 (array!86506 array!86504 (_ BitVec 32) (_ BitVec 32) V!51435 V!51435 (_ BitVec 32) Int) ListLongMap!20157)

(assert (=> b!1298502 (= res!862968 (contains!8212 (getCurrentListMap!5123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298503 () Bool)

(declare-fun res!862965 () Bool)

(assert (=> b!1298503 (=> (not res!862965) (not e!740788))))

(assert (=> b!1298503 (= res!862965 (and (= (size!42303 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42304 _keys!1741) (size!42303 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298504 () Bool)

(declare-fun res!862966 () Bool)

(assert (=> b!1298504 (=> (not res!862966) (not e!740788))))

(declare-datatypes ((List!29629 0))(
  ( (Nil!29626) (Cons!29625 (h!30834 (_ BitVec 64)) (t!43193 List!29629)) )
))
(declare-fun arrayNoDuplicates!0 (array!86506 (_ BitVec 32) List!29629) Bool)

(assert (=> b!1298504 (= res!862966 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29626))))

(declare-fun b!1298506 () Bool)

(assert (=> b!1298506 (= e!740788 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000)))))

(assert (=> b!1298506 (contains!8212 (getCurrentListMap!5123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42997 0))(
  ( (Unit!42998) )
))
(declare-fun lt!580709 () Unit!42997)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!51 (array!86506 array!86504 (_ BitVec 32) (_ BitVec 32) V!51435 V!51435 (_ BitVec 64) (_ BitVec 32) Int) Unit!42997)

(assert (=> b!1298506 (= lt!580709 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!51 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53684 () Bool)

(declare-fun tp!102446 () Bool)

(assert (=> mapNonEmpty!53684 (= mapRes!53684 (and tp!102446 e!740792))))

(declare-fun mapKey!53684 () (_ BitVec 32))

(declare-fun mapValue!53684 () ValueCell!16476)

(declare-fun mapRest!53684 () (Array (_ BitVec 32) ValueCell!16476))

(assert (=> mapNonEmpty!53684 (= (arr!41753 _values!1445) (store mapRest!53684 mapKey!53684 mapValue!53684))))

(declare-fun mapIsEmpty!53684 () Bool)

(assert (=> mapIsEmpty!53684 mapRes!53684))

(declare-fun b!1298505 () Bool)

(declare-fun res!862963 () Bool)

(assert (=> b!1298505 (=> (not res!862963) (not e!740788))))

(assert (=> b!1298505 (= res!862963 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42304 _keys!1741)) (not (= (select (arr!41754 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!862962 () Bool)

(assert (=> start!109620 (=> (not res!862962) (not e!740788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109620 (= res!862962 (validMask!0 mask!2175))))

(assert (=> start!109620 e!740788))

(assert (=> start!109620 tp_is_empty!34749))

(assert (=> start!109620 true))

(declare-fun array_inv!31603 (array!86504) Bool)

(assert (=> start!109620 (and (array_inv!31603 _values!1445) e!740791)))

(declare-fun array_inv!31604 (array!86506) Bool)

(assert (=> start!109620 (array_inv!31604 _keys!1741)))

(assert (=> start!109620 tp!102445))

(assert (= (and start!109620 res!862962) b!1298503))

(assert (= (and b!1298503 res!862965) b!1298501))

(assert (= (and b!1298501 res!862964) b!1298504))

(assert (= (and b!1298504 res!862966) b!1298499))

(assert (= (and b!1298499 res!862967) b!1298502))

(assert (= (and b!1298502 res!862968) b!1298505))

(assert (= (and b!1298505 res!862963) b!1298506))

(assert (= (and b!1298498 condMapEmpty!53684) mapIsEmpty!53684))

(assert (= (and b!1298498 (not condMapEmpty!53684)) mapNonEmpty!53684))

(get-info :version)

(assert (= (and mapNonEmpty!53684 ((_ is ValueCellFull!16476) mapValue!53684)) b!1298497))

(assert (= (and b!1298498 ((_ is ValueCellFull!16476) mapDefault!53684)) b!1298500))

(assert (= start!109620 b!1298498))

(declare-fun m!1189835 () Bool)

(assert (=> start!109620 m!1189835))

(declare-fun m!1189837 () Bool)

(assert (=> start!109620 m!1189837))

(declare-fun m!1189839 () Bool)

(assert (=> start!109620 m!1189839))

(declare-fun m!1189841 () Bool)

(assert (=> b!1298502 m!1189841))

(assert (=> b!1298502 m!1189841))

(declare-fun m!1189843 () Bool)

(assert (=> b!1298502 m!1189843))

(declare-fun m!1189845 () Bool)

(assert (=> b!1298505 m!1189845))

(declare-fun m!1189847 () Bool)

(assert (=> mapNonEmpty!53684 m!1189847))

(declare-fun m!1189849 () Bool)

(assert (=> b!1298504 m!1189849))

(declare-fun m!1189851 () Bool)

(assert (=> b!1298506 m!1189851))

(assert (=> b!1298506 m!1189851))

(declare-fun m!1189853 () Bool)

(assert (=> b!1298506 m!1189853))

(declare-fun m!1189855 () Bool)

(assert (=> b!1298506 m!1189855))

(declare-fun m!1189857 () Bool)

(assert (=> b!1298501 m!1189857))

(check-sat (not b!1298502) b_and!47199 (not start!109620) (not b!1298501) (not b!1298506) (not mapNonEmpty!53684) (not b_next!29109) tp_is_empty!34749 (not b!1298504))
(check-sat b_and!47199 (not b_next!29109))
