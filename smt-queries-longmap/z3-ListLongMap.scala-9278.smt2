; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111018 () Bool)

(assert start!111018)

(declare-fun b_free!29853 () Bool)

(declare-fun b_next!29853 () Bool)

(assert (=> start!111018 (= b_free!29853 (not b_next!29853))))

(declare-fun tp!104881 () Bool)

(declare-fun b_and!48061 () Bool)

(assert (=> start!111018 (= tp!104881 b_and!48061)))

(declare-fun b!1314410 () Bool)

(declare-fun res!872618 () Bool)

(declare-fun e!749758 () Bool)

(assert (=> b!1314410 (=> (not res!872618) (not e!749758))))

(declare-datatypes ((array!88136 0))(
  ( (array!88137 (arr!42548 (Array (_ BitVec 32) (_ BitVec 64))) (size!43098 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88136)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314410 (= res!872618 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43098 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314411 () Bool)

(declare-fun e!749762 () Bool)

(declare-fun e!749760 () Bool)

(declare-fun mapRes!55003 () Bool)

(assert (=> b!1314411 (= e!749762 (and e!749760 mapRes!55003))))

(declare-fun condMapEmpty!55003 () Bool)

(declare-datatypes ((V!52547 0))(
  ( (V!52548 (val!17866 Int)) )
))
(declare-datatypes ((ValueCell!16893 0))(
  ( (ValueCellFull!16893 (v!20493 V!52547)) (EmptyCell!16893) )
))
(declare-datatypes ((array!88138 0))(
  ( (array!88139 (arr!42549 (Array (_ BitVec 32) ValueCell!16893)) (size!43099 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88138)

(declare-fun mapDefault!55003 () ValueCell!16893)

(assert (=> b!1314411 (= condMapEmpty!55003 (= (arr!42549 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16893)) mapDefault!55003)))))

(declare-fun mapNonEmpty!55003 () Bool)

(declare-fun tp!104880 () Bool)

(declare-fun e!749759 () Bool)

(assert (=> mapNonEmpty!55003 (= mapRes!55003 (and tp!104880 e!749759))))

(declare-fun mapRest!55003 () (Array (_ BitVec 32) ValueCell!16893))

(declare-fun mapKey!55003 () (_ BitVec 32))

(declare-fun mapValue!55003 () ValueCell!16893)

(assert (=> mapNonEmpty!55003 (= (arr!42549 _values!1354) (store mapRest!55003 mapKey!55003 mapValue!55003))))

(declare-fun b!1314412 () Bool)

(declare-fun res!872617 () Bool)

(assert (=> b!1314412 (=> (not res!872617) (not e!749758))))

(declare-datatypes ((List!30174 0))(
  ( (Nil!30171) (Cons!30170 (h!31379 (_ BitVec 64)) (t!43780 List!30174)) )
))
(declare-fun arrayNoDuplicates!0 (array!88136 (_ BitVec 32) List!30174) Bool)

(assert (=> b!1314412 (= res!872617 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30171))))

(declare-fun b!1314413 () Bool)

(declare-fun res!872616 () Bool)

(assert (=> b!1314413 (=> (not res!872616) (not e!749758))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314413 (= res!872616 (and (= (size!43099 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43098 _keys!1628) (size!43099 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872615 () Bool)

(assert (=> start!111018 (=> (not res!872615) (not e!749758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111018 (= res!872615 (validMask!0 mask!2040))))

(assert (=> start!111018 e!749758))

(assert (=> start!111018 tp!104881))

(declare-fun array_inv!32137 (array!88136) Bool)

(assert (=> start!111018 (array_inv!32137 _keys!1628)))

(assert (=> start!111018 true))

(declare-fun tp_is_empty!35583 () Bool)

(assert (=> start!111018 tp_is_empty!35583))

(declare-fun array_inv!32138 (array!88138) Bool)

(assert (=> start!111018 (and (array_inv!32138 _values!1354) e!749762)))

(declare-fun b!1314414 () Bool)

(declare-fun res!872619 () Bool)

(assert (=> b!1314414 (=> (not res!872619) (not e!749758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88136 (_ BitVec 32)) Bool)

(assert (=> b!1314414 (= res!872619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314415 () Bool)

(assert (=> b!1314415 (= e!749758 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52547)

(declare-fun zeroValue!1296 () V!52547)

(declare-fun lt!585789 () Bool)

(declare-datatypes ((tuple2!23038 0))(
  ( (tuple2!23039 (_1!11530 (_ BitVec 64)) (_2!11530 V!52547)) )
))
(declare-datatypes ((List!30175 0))(
  ( (Nil!30172) (Cons!30171 (h!31380 tuple2!23038) (t!43781 List!30175)) )
))
(declare-datatypes ((ListLongMap!20695 0))(
  ( (ListLongMap!20696 (toList!10363 List!30175)) )
))
(declare-fun contains!8513 (ListLongMap!20695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5376 (array!88136 array!88138 (_ BitVec 32) (_ BitVec 32) V!52547 V!52547 (_ BitVec 32) Int) ListLongMap!20695)

(assert (=> b!1314415 (= lt!585789 (contains!8513 (getCurrentListMap!5376 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55003 () Bool)

(assert (=> mapIsEmpty!55003 mapRes!55003))

(declare-fun b!1314416 () Bool)

(assert (=> b!1314416 (= e!749759 tp_is_empty!35583)))

(declare-fun b!1314417 () Bool)

(assert (=> b!1314417 (= e!749760 tp_is_empty!35583)))

(assert (= (and start!111018 res!872615) b!1314413))

(assert (= (and b!1314413 res!872616) b!1314414))

(assert (= (and b!1314414 res!872619) b!1314412))

(assert (= (and b!1314412 res!872617) b!1314410))

(assert (= (and b!1314410 res!872618) b!1314415))

(assert (= (and b!1314411 condMapEmpty!55003) mapIsEmpty!55003))

(assert (= (and b!1314411 (not condMapEmpty!55003)) mapNonEmpty!55003))

(get-info :version)

(assert (= (and mapNonEmpty!55003 ((_ is ValueCellFull!16893) mapValue!55003)) b!1314416))

(assert (= (and b!1314411 ((_ is ValueCellFull!16893) mapDefault!55003)) b!1314417))

(assert (= start!111018 b!1314411))

(declare-fun m!1202941 () Bool)

(assert (=> b!1314415 m!1202941))

(assert (=> b!1314415 m!1202941))

(declare-fun m!1202943 () Bool)

(assert (=> b!1314415 m!1202943))

(declare-fun m!1202945 () Bool)

(assert (=> b!1314414 m!1202945))

(declare-fun m!1202947 () Bool)

(assert (=> start!111018 m!1202947))

(declare-fun m!1202949 () Bool)

(assert (=> start!111018 m!1202949))

(declare-fun m!1202951 () Bool)

(assert (=> start!111018 m!1202951))

(declare-fun m!1202953 () Bool)

(assert (=> mapNonEmpty!55003 m!1202953))

(declare-fun m!1202955 () Bool)

(assert (=> b!1314412 m!1202955))

(check-sat (not b!1314412) (not mapNonEmpty!55003) (not b!1314415) tp_is_empty!35583 (not b!1314414) (not start!111018) b_and!48061 (not b_next!29853))
(check-sat b_and!48061 (not b_next!29853))
