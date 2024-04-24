; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111156 () Bool)

(assert start!111156)

(declare-fun b_free!29767 () Bool)

(declare-fun b_next!29767 () Bool)

(assert (=> start!111156 (= b_free!29767 (not b_next!29767))))

(declare-fun tp!104623 () Bool)

(declare-fun b_and!47977 () Bool)

(assert (=> start!111156 (= tp!104623 b_and!47977)))

(declare-fun b!1314641 () Bool)

(declare-fun e!749958 () Bool)

(declare-fun tp_is_empty!35497 () Bool)

(assert (=> b!1314641 (= e!749958 tp_is_empty!35497)))

(declare-fun b!1314642 () Bool)

(declare-fun e!749957 () Bool)

(assert (=> b!1314642 (= e!749957 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586136 () Bool)

(declare-datatypes ((array!88023 0))(
  ( (array!88024 (arr!42487 (Array (_ BitVec 32) (_ BitVec 64))) (size!43038 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88023)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52433 0))(
  ( (V!52434 (val!17823 Int)) )
))
(declare-fun minValue!1296 () V!52433)

(declare-datatypes ((ValueCell!16850 0))(
  ( (ValueCellFull!16850 (v!20445 V!52433)) (EmptyCell!16850) )
))
(declare-datatypes ((array!88025 0))(
  ( (array!88026 (arr!42488 (Array (_ BitVec 32) ValueCell!16850)) (size!43039 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88025)

(declare-fun zeroValue!1296 () V!52433)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23008 0))(
  ( (tuple2!23009 (_1!11515 (_ BitVec 64)) (_2!11515 V!52433)) )
))
(declare-datatypes ((List!30158 0))(
  ( (Nil!30155) (Cons!30154 (h!31372 tuple2!23008) (t!43756 List!30158)) )
))
(declare-datatypes ((ListLongMap!20673 0))(
  ( (ListLongMap!20674 (toList!10352 List!30158)) )
))
(declare-fun contains!8514 (ListLongMap!20673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5356 (array!88023 array!88025 (_ BitVec 32) (_ BitVec 32) V!52433 V!52433 (_ BitVec 32) Int) ListLongMap!20673)

(assert (=> b!1314642 (= lt!586136 (contains!8514 (getCurrentListMap!5356 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314643 () Bool)

(declare-fun e!749956 () Bool)

(declare-fun mapRes!54874 () Bool)

(assert (=> b!1314643 (= e!749956 (and e!749958 mapRes!54874))))

(declare-fun condMapEmpty!54874 () Bool)

(declare-fun mapDefault!54874 () ValueCell!16850)

(assert (=> b!1314643 (= condMapEmpty!54874 (= (arr!42488 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16850)) mapDefault!54874)))))

(declare-fun mapNonEmpty!54874 () Bool)

(declare-fun tp!104622 () Bool)

(declare-fun e!749960 () Bool)

(assert (=> mapNonEmpty!54874 (= mapRes!54874 (and tp!104622 e!749960))))

(declare-fun mapKey!54874 () (_ BitVec 32))

(declare-fun mapRest!54874 () (Array (_ BitVec 32) ValueCell!16850))

(declare-fun mapValue!54874 () ValueCell!16850)

(assert (=> mapNonEmpty!54874 (= (arr!42488 _values!1354) (store mapRest!54874 mapKey!54874 mapValue!54874))))

(declare-fun mapIsEmpty!54874 () Bool)

(assert (=> mapIsEmpty!54874 mapRes!54874))

(declare-fun b!1314644 () Bool)

(assert (=> b!1314644 (= e!749960 tp_is_empty!35497)))

(declare-fun res!872454 () Bool)

(assert (=> start!111156 (=> (not res!872454) (not e!749957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111156 (= res!872454 (validMask!0 mask!2040))))

(assert (=> start!111156 e!749957))

(assert (=> start!111156 tp!104623))

(declare-fun array_inv!32353 (array!88023) Bool)

(assert (=> start!111156 (array_inv!32353 _keys!1628)))

(assert (=> start!111156 true))

(assert (=> start!111156 tp_is_empty!35497))

(declare-fun array_inv!32354 (array!88025) Bool)

(assert (=> start!111156 (and (array_inv!32354 _values!1354) e!749956)))

(declare-fun b!1314645 () Bool)

(declare-fun res!872452 () Bool)

(assert (=> b!1314645 (=> (not res!872452) (not e!749957))))

(assert (=> b!1314645 (= res!872452 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43038 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314646 () Bool)

(declare-fun res!872453 () Bool)

(assert (=> b!1314646 (=> (not res!872453) (not e!749957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88023 (_ BitVec 32)) Bool)

(assert (=> b!1314646 (= res!872453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314647 () Bool)

(declare-fun res!872455 () Bool)

(assert (=> b!1314647 (=> (not res!872455) (not e!749957))))

(declare-datatypes ((List!30159 0))(
  ( (Nil!30156) (Cons!30155 (h!31373 (_ BitVec 64)) (t!43757 List!30159)) )
))
(declare-fun arrayNoDuplicates!0 (array!88023 (_ BitVec 32) List!30159) Bool)

(assert (=> b!1314647 (= res!872455 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30156))))

(declare-fun b!1314648 () Bool)

(declare-fun res!872456 () Bool)

(assert (=> b!1314648 (=> (not res!872456) (not e!749957))))

(assert (=> b!1314648 (= res!872456 (and (= (size!43039 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43038 _keys!1628) (size!43039 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111156 res!872454) b!1314648))

(assert (= (and b!1314648 res!872456) b!1314646))

(assert (= (and b!1314646 res!872453) b!1314647))

(assert (= (and b!1314647 res!872455) b!1314645))

(assert (= (and b!1314645 res!872452) b!1314642))

(assert (= (and b!1314643 condMapEmpty!54874) mapIsEmpty!54874))

(assert (= (and b!1314643 (not condMapEmpty!54874)) mapNonEmpty!54874))

(get-info :version)

(assert (= (and mapNonEmpty!54874 ((_ is ValueCellFull!16850) mapValue!54874)) b!1314644))

(assert (= (and b!1314643 ((_ is ValueCellFull!16850) mapDefault!54874)) b!1314641))

(assert (= start!111156 b!1314643))

(declare-fun m!1203821 () Bool)

(assert (=> b!1314647 m!1203821))

(declare-fun m!1203823 () Bool)

(assert (=> b!1314646 m!1203823))

(declare-fun m!1203825 () Bool)

(assert (=> mapNonEmpty!54874 m!1203825))

(declare-fun m!1203827 () Bool)

(assert (=> start!111156 m!1203827))

(declare-fun m!1203829 () Bool)

(assert (=> start!111156 m!1203829))

(declare-fun m!1203831 () Bool)

(assert (=> start!111156 m!1203831))

(declare-fun m!1203833 () Bool)

(assert (=> b!1314642 m!1203833))

(assert (=> b!1314642 m!1203833))

(declare-fun m!1203835 () Bool)

(assert (=> b!1314642 m!1203835))

(check-sat tp_is_empty!35497 (not b!1314646) b_and!47977 (not mapNonEmpty!54874) (not b!1314642) (not start!111156) (not b_next!29767) (not b!1314647))
(check-sat b_and!47977 (not b_next!29767))
