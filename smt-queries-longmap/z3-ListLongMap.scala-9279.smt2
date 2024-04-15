; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111022 () Bool)

(assert start!111022)

(declare-fun b_free!29857 () Bool)

(declare-fun b_next!29857 () Bool)

(assert (=> start!111022 (= b_free!29857 (not b_next!29857))))

(declare-fun tp!104893 () Bool)

(declare-fun b_and!48047 () Bool)

(assert (=> start!111022 (= tp!104893 b_and!48047)))

(declare-fun mapIsEmpty!55009 () Bool)

(declare-fun mapRes!55009 () Bool)

(assert (=> mapIsEmpty!55009 mapRes!55009))

(declare-fun b!1314388 () Bool)

(declare-fun res!872618 () Bool)

(declare-fun e!749759 () Bool)

(assert (=> b!1314388 (=> (not res!872618) (not e!749759))))

(declare-datatypes ((array!88051 0))(
  ( (array!88052 (arr!42506 (Array (_ BitVec 32) (_ BitVec 64))) (size!43058 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88051)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314388 (= res!872618 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43058 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314389 () Bool)

(assert (=> b!1314389 (= e!749759 false)))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585609 () Bool)

(declare-datatypes ((V!52553 0))(
  ( (V!52554 (val!17868 Int)) )
))
(declare-fun minValue!1296 () V!52553)

(declare-datatypes ((ValueCell!16895 0))(
  ( (ValueCellFull!16895 (v!20494 V!52553)) (EmptyCell!16895) )
))
(declare-datatypes ((array!88053 0))(
  ( (array!88054 (arr!42507 (Array (_ BitVec 32) ValueCell!16895)) (size!43059 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88053)

(declare-fun zeroValue!1296 () V!52553)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!23130 0))(
  ( (tuple2!23131 (_1!11576 (_ BitVec 64)) (_2!11576 V!52553)) )
))
(declare-datatypes ((List!30246 0))(
  ( (Nil!30243) (Cons!30242 (h!31451 tuple2!23130) (t!43844 List!30246)) )
))
(declare-datatypes ((ListLongMap!20787 0))(
  ( (ListLongMap!20788 (toList!10409 List!30246)) )
))
(declare-fun contains!8486 (ListLongMap!20787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5304 (array!88051 array!88053 (_ BitVec 32) (_ BitVec 32) V!52553 V!52553 (_ BitVec 32) Int) ListLongMap!20787)

(assert (=> b!1314389 (= lt!585609 (contains!8486 (getCurrentListMap!5304 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314390 () Bool)

(declare-fun e!749755 () Bool)

(declare-fun tp_is_empty!35587 () Bool)

(assert (=> b!1314390 (= e!749755 tp_is_empty!35587)))

(declare-fun mapNonEmpty!55009 () Bool)

(declare-fun tp!104894 () Bool)

(assert (=> mapNonEmpty!55009 (= mapRes!55009 (and tp!104894 e!749755))))

(declare-fun mapKey!55009 () (_ BitVec 32))

(declare-fun mapRest!55009 () (Array (_ BitVec 32) ValueCell!16895))

(declare-fun mapValue!55009 () ValueCell!16895)

(assert (=> mapNonEmpty!55009 (= (arr!42507 _values!1354) (store mapRest!55009 mapKey!55009 mapValue!55009))))

(declare-fun res!872617 () Bool)

(assert (=> start!111022 (=> (not res!872617) (not e!749759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111022 (= res!872617 (validMask!0 mask!2040))))

(assert (=> start!111022 e!749759))

(assert (=> start!111022 tp!104893))

(declare-fun array_inv!32293 (array!88051) Bool)

(assert (=> start!111022 (array_inv!32293 _keys!1628)))

(assert (=> start!111022 true))

(assert (=> start!111022 tp_is_empty!35587))

(declare-fun e!749757 () Bool)

(declare-fun array_inv!32294 (array!88053) Bool)

(assert (=> start!111022 (and (array_inv!32294 _values!1354) e!749757)))

(declare-fun b!1314391 () Bool)

(declare-fun res!872616 () Bool)

(assert (=> b!1314391 (=> (not res!872616) (not e!749759))))

(declare-datatypes ((List!30247 0))(
  ( (Nil!30244) (Cons!30243 (h!31452 (_ BitVec 64)) (t!43845 List!30247)) )
))
(declare-fun arrayNoDuplicates!0 (array!88051 (_ BitVec 32) List!30247) Bool)

(assert (=> b!1314391 (= res!872616 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30244))))

(declare-fun b!1314392 () Bool)

(declare-fun e!749756 () Bool)

(assert (=> b!1314392 (= e!749757 (and e!749756 mapRes!55009))))

(declare-fun condMapEmpty!55009 () Bool)

(declare-fun mapDefault!55009 () ValueCell!16895)

(assert (=> b!1314392 (= condMapEmpty!55009 (= (arr!42507 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16895)) mapDefault!55009)))))

(declare-fun b!1314393 () Bool)

(declare-fun res!872619 () Bool)

(assert (=> b!1314393 (=> (not res!872619) (not e!749759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88051 (_ BitVec 32)) Bool)

(assert (=> b!1314393 (= res!872619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314394 () Bool)

(declare-fun res!872620 () Bool)

(assert (=> b!1314394 (=> (not res!872620) (not e!749759))))

(assert (=> b!1314394 (= res!872620 (and (= (size!43059 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43058 _keys!1628) (size!43059 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314395 () Bool)

(assert (=> b!1314395 (= e!749756 tp_is_empty!35587)))

(assert (= (and start!111022 res!872617) b!1314394))

(assert (= (and b!1314394 res!872620) b!1314393))

(assert (= (and b!1314393 res!872619) b!1314391))

(assert (= (and b!1314391 res!872616) b!1314388))

(assert (= (and b!1314388 res!872618) b!1314389))

(assert (= (and b!1314392 condMapEmpty!55009) mapIsEmpty!55009))

(assert (= (and b!1314392 (not condMapEmpty!55009)) mapNonEmpty!55009))

(get-info :version)

(assert (= (and mapNonEmpty!55009 ((_ is ValueCellFull!16895) mapValue!55009)) b!1314390))

(assert (= (and b!1314392 ((_ is ValueCellFull!16895) mapDefault!55009)) b!1314395))

(assert (= start!111022 b!1314392))

(declare-fun m!1202457 () Bool)

(assert (=> b!1314391 m!1202457))

(declare-fun m!1202459 () Bool)

(assert (=> start!111022 m!1202459))

(declare-fun m!1202461 () Bool)

(assert (=> start!111022 m!1202461))

(declare-fun m!1202463 () Bool)

(assert (=> start!111022 m!1202463))

(declare-fun m!1202465 () Bool)

(assert (=> b!1314389 m!1202465))

(assert (=> b!1314389 m!1202465))

(declare-fun m!1202467 () Bool)

(assert (=> b!1314389 m!1202467))

(declare-fun m!1202469 () Bool)

(assert (=> b!1314393 m!1202469))

(declare-fun m!1202471 () Bool)

(assert (=> mapNonEmpty!55009 m!1202471))

(check-sat (not mapNonEmpty!55009) (not b!1314393) (not b_next!29857) (not start!111022) (not b!1314389) b_and!48047 (not b!1314391) tp_is_empty!35587)
(check-sat b_and!48047 (not b_next!29857))
