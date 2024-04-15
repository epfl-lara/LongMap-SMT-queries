; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111004 () Bool)

(assert start!111004)

(declare-fun b_free!29839 () Bool)

(declare-fun b_next!29839 () Bool)

(assert (=> start!111004 (= b_free!29839 (not b_next!29839))))

(declare-fun tp!104840 () Bool)

(declare-fun b_and!48029 () Bool)

(assert (=> start!111004 (= tp!104840 b_and!48029)))

(declare-fun b!1314144 () Bool)

(declare-fun res!872457 () Bool)

(declare-fun e!749622 () Bool)

(assert (=> b!1314144 (=> (not res!872457) (not e!749622))))

(declare-datatypes ((array!88015 0))(
  ( (array!88016 (arr!42488 (Array (_ BitVec 32) (_ BitVec 64))) (size!43040 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88015)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1314144 (= res!872457 (validKeyInArray!0 (select (arr!42488 _keys!1628) from!2020)))))

(declare-fun b!1314146 () Bool)

(declare-fun res!872455 () Bool)

(assert (=> b!1314146 (=> (not res!872455) (not e!749622))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314146 (= res!872455 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1314147 () Bool)

(declare-fun e!749620 () Bool)

(declare-fun e!749624 () Bool)

(declare-fun mapRes!54982 () Bool)

(assert (=> b!1314147 (= e!749620 (and e!749624 mapRes!54982))))

(declare-fun condMapEmpty!54982 () Bool)

(declare-datatypes ((V!52529 0))(
  ( (V!52530 (val!17859 Int)) )
))
(declare-datatypes ((ValueCell!16886 0))(
  ( (ValueCellFull!16886 (v!20485 V!52529)) (EmptyCell!16886) )
))
(declare-datatypes ((array!88017 0))(
  ( (array!88018 (arr!42489 (Array (_ BitVec 32) ValueCell!16886)) (size!43041 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88017)

(declare-fun mapDefault!54982 () ValueCell!16886)

(assert (=> b!1314147 (= condMapEmpty!54982 (= (arr!42489 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16886)) mapDefault!54982)))))

(declare-fun b!1314148 () Bool)

(declare-fun res!872460 () Bool)

(assert (=> b!1314148 (=> (not res!872460) (not e!749622))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1314148 (= res!872460 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43040 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314149 () Bool)

(declare-fun res!872454 () Bool)

(assert (=> b!1314149 (=> (not res!872454) (not e!749622))))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1314149 (= res!872454 (and (= (size!43041 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43040 _keys!1628) (size!43041 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314150 () Bool)

(declare-fun res!872458 () Bool)

(assert (=> b!1314150 (=> (not res!872458) (not e!749622))))

(assert (=> b!1314150 (= res!872458 (not (= (select (arr!42488 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54982 () Bool)

(assert (=> mapIsEmpty!54982 mapRes!54982))

(declare-fun b!1314151 () Bool)

(declare-fun res!872453 () Bool)

(assert (=> b!1314151 (=> (not res!872453) (not e!749622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88015 (_ BitVec 32)) Bool)

(assert (=> b!1314151 (= res!872453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314152 () Bool)

(declare-fun res!872461 () Bool)

(assert (=> b!1314152 (=> (not res!872461) (not e!749622))))

(declare-datatypes ((List!30232 0))(
  ( (Nil!30229) (Cons!30228 (h!31437 (_ BitVec 64)) (t!43830 List!30232)) )
))
(declare-fun arrayNoDuplicates!0 (array!88015 (_ BitVec 32) List!30232) Bool)

(assert (=> b!1314152 (= res!872461 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30229))))

(declare-fun b!1314153 () Bool)

(declare-fun e!749623 () Bool)

(declare-fun tp_is_empty!35569 () Bool)

(assert (=> b!1314153 (= e!749623 tp_is_empty!35569)))

(declare-fun res!872459 () Bool)

(assert (=> start!111004 (=> (not res!872459) (not e!749622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111004 (= res!872459 (validMask!0 mask!2040))))

(assert (=> start!111004 e!749622))

(assert (=> start!111004 tp!104840))

(declare-fun array_inv!32281 (array!88015) Bool)

(assert (=> start!111004 (array_inv!32281 _keys!1628)))

(assert (=> start!111004 true))

(assert (=> start!111004 tp_is_empty!35569))

(declare-fun array_inv!32282 (array!88017) Bool)

(assert (=> start!111004 (and (array_inv!32282 _values!1354) e!749620)))

(declare-fun b!1314145 () Bool)

(declare-fun res!872456 () Bool)

(assert (=> b!1314145 (=> (not res!872456) (not e!749622))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52529)

(declare-fun zeroValue!1296 () V!52529)

(declare-datatypes ((tuple2!23114 0))(
  ( (tuple2!23115 (_1!11568 (_ BitVec 64)) (_2!11568 V!52529)) )
))
(declare-datatypes ((List!30233 0))(
  ( (Nil!30230) (Cons!30229 (h!31438 tuple2!23114) (t!43831 List!30233)) )
))
(declare-datatypes ((ListLongMap!20771 0))(
  ( (ListLongMap!20772 (toList!10401 List!30233)) )
))
(declare-fun contains!8478 (ListLongMap!20771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5296 (array!88015 array!88017 (_ BitVec 32) (_ BitVec 32) V!52529 V!52529 (_ BitVec 32) Int) ListLongMap!20771)

(assert (=> b!1314145 (= res!872456 (contains!8478 (getCurrentListMap!5296 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54982 () Bool)

(declare-fun tp!104839 () Bool)

(assert (=> mapNonEmpty!54982 (= mapRes!54982 (and tp!104839 e!749623))))

(declare-fun mapValue!54982 () ValueCell!16886)

(declare-fun mapKey!54982 () (_ BitVec 32))

(declare-fun mapRest!54982 () (Array (_ BitVec 32) ValueCell!16886))

(assert (=> mapNonEmpty!54982 (= (arr!42489 _values!1354) (store mapRest!54982 mapKey!54982 mapValue!54982))))

(declare-fun b!1314154 () Bool)

(assert (=> b!1314154 (= e!749624 tp_is_empty!35569)))

(declare-fun b!1314155 () Bool)

(assert (=> b!1314155 (= e!749622 (not true))))

(assert (=> b!1314155 (contains!8478 (getCurrentListMap!5296 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43221 0))(
  ( (Unit!43222) )
))
(declare-fun lt!585582 () Unit!43221)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!19 (array!88015 array!88017 (_ BitVec 32) (_ BitVec 32) V!52529 V!52529 (_ BitVec 64) (_ BitVec 32) Int) Unit!43221)

(assert (=> b!1314155 (= lt!585582 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!19 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(assert (= (and start!111004 res!872459) b!1314149))

(assert (= (and b!1314149 res!872454) b!1314151))

(assert (= (and b!1314151 res!872453) b!1314152))

(assert (= (and b!1314152 res!872461) b!1314148))

(assert (= (and b!1314148 res!872460) b!1314145))

(assert (= (and b!1314145 res!872456) b!1314150))

(assert (= (and b!1314150 res!872458) b!1314144))

(assert (= (and b!1314144 res!872457) b!1314146))

(assert (= (and b!1314146 res!872455) b!1314155))

(assert (= (and b!1314147 condMapEmpty!54982) mapIsEmpty!54982))

(assert (= (and b!1314147 (not condMapEmpty!54982)) mapNonEmpty!54982))

(get-info :version)

(assert (= (and mapNonEmpty!54982 ((_ is ValueCellFull!16886) mapValue!54982)) b!1314153))

(assert (= (and b!1314147 ((_ is ValueCellFull!16886) mapDefault!54982)) b!1314154))

(assert (= start!111004 b!1314147))

(declare-fun m!1202283 () Bool)

(assert (=> mapNonEmpty!54982 m!1202283))

(declare-fun m!1202285 () Bool)

(assert (=> b!1314144 m!1202285))

(assert (=> b!1314144 m!1202285))

(declare-fun m!1202287 () Bool)

(assert (=> b!1314144 m!1202287))

(assert (=> b!1314150 m!1202285))

(declare-fun m!1202289 () Bool)

(assert (=> b!1314145 m!1202289))

(assert (=> b!1314145 m!1202289))

(declare-fun m!1202291 () Bool)

(assert (=> b!1314145 m!1202291))

(declare-fun m!1202293 () Bool)

(assert (=> b!1314155 m!1202293))

(assert (=> b!1314155 m!1202293))

(declare-fun m!1202295 () Bool)

(assert (=> b!1314155 m!1202295))

(declare-fun m!1202297 () Bool)

(assert (=> b!1314155 m!1202297))

(declare-fun m!1202299 () Bool)

(assert (=> start!111004 m!1202299))

(declare-fun m!1202301 () Bool)

(assert (=> start!111004 m!1202301))

(declare-fun m!1202303 () Bool)

(assert (=> start!111004 m!1202303))

(declare-fun m!1202305 () Bool)

(assert (=> b!1314152 m!1202305))

(declare-fun m!1202307 () Bool)

(assert (=> b!1314151 m!1202307))

(check-sat (not b!1314155) (not b!1314144) (not b!1314151) (not mapNonEmpty!54982) (not b!1314152) b_and!48029 tp_is_empty!35569 (not start!111004) (not b_next!29839) (not b!1314145))
(check-sat b_and!48029 (not b_next!29839))
