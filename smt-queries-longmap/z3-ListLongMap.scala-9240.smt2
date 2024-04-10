; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110790 () Bool)

(assert start!110790)

(declare-fun b_free!29625 () Bool)

(declare-fun b_next!29625 () Bool)

(assert (=> start!110790 (= b_free!29625 (not b_next!29625))))

(declare-fun tp!104197 () Bool)

(declare-fun b_and!47833 () Bool)

(assert (=> start!110790 (= tp!104197 b_and!47833)))

(declare-fun b!1311287 () Bool)

(declare-fun res!870519 () Bool)

(declare-fun e!748050 () Bool)

(assert (=> b!1311287 (=> (not res!870519) (not e!748050))))

(declare-datatypes ((array!87698 0))(
  ( (array!87699 (arr!42329 (Array (_ BitVec 32) (_ BitVec 64))) (size!42879 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87698)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87698 (_ BitVec 32)) Bool)

(assert (=> b!1311287 (= res!870519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311288 () Bool)

(declare-fun res!870518 () Bool)

(assert (=> b!1311288 (=> (not res!870518) (not e!748050))))

(declare-datatypes ((V!52243 0))(
  ( (V!52244 (val!17752 Int)) )
))
(declare-datatypes ((ValueCell!16779 0))(
  ( (ValueCellFull!16779 (v!20379 V!52243)) (EmptyCell!16779) )
))
(declare-datatypes ((array!87700 0))(
  ( (array!87701 (arr!42330 (Array (_ BitVec 32) ValueCell!16779)) (size!42880 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87700)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311288 (= res!870518 (and (= (size!42880 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42879 _keys!1628) (size!42880 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311289 () Bool)

(declare-fun e!748052 () Bool)

(declare-fun e!748049 () Bool)

(declare-fun mapRes!54661 () Bool)

(assert (=> b!1311289 (= e!748052 (and e!748049 mapRes!54661))))

(declare-fun condMapEmpty!54661 () Bool)

(declare-fun mapDefault!54661 () ValueCell!16779)

(assert (=> b!1311289 (= condMapEmpty!54661 (= (arr!42330 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16779)) mapDefault!54661)))))

(declare-fun res!870520 () Bool)

(assert (=> start!110790 (=> (not res!870520) (not e!748050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110790 (= res!870520 (validMask!0 mask!2040))))

(assert (=> start!110790 e!748050))

(assert (=> start!110790 tp!104197))

(declare-fun array_inv!31985 (array!87698) Bool)

(assert (=> start!110790 (array_inv!31985 _keys!1628)))

(assert (=> start!110790 true))

(declare-fun tp_is_empty!35355 () Bool)

(assert (=> start!110790 tp_is_empty!35355))

(declare-fun array_inv!31986 (array!87700) Bool)

(assert (=> start!110790 (and (array_inv!31986 _values!1354) e!748052)))

(declare-fun mapNonEmpty!54661 () Bool)

(declare-fun tp!104196 () Bool)

(declare-fun e!748048 () Bool)

(assert (=> mapNonEmpty!54661 (= mapRes!54661 (and tp!104196 e!748048))))

(declare-fun mapRest!54661 () (Array (_ BitVec 32) ValueCell!16779))

(declare-fun mapKey!54661 () (_ BitVec 32))

(declare-fun mapValue!54661 () ValueCell!16779)

(assert (=> mapNonEmpty!54661 (= (arr!42330 _values!1354) (store mapRest!54661 mapKey!54661 mapValue!54661))))

(declare-fun mapIsEmpty!54661 () Bool)

(assert (=> mapIsEmpty!54661 mapRes!54661))

(declare-fun b!1311290 () Bool)

(assert (=> b!1311290 (= e!748048 tp_is_empty!35355)))

(declare-fun b!1311291 () Bool)

(declare-fun res!870522 () Bool)

(assert (=> b!1311291 (=> (not res!870522) (not e!748050))))

(declare-datatypes ((List!30018 0))(
  ( (Nil!30015) (Cons!30014 (h!31223 (_ BitVec 64)) (t!43624 List!30018)) )
))
(declare-fun arrayNoDuplicates!0 (array!87698 (_ BitVec 32) List!30018) Bool)

(assert (=> b!1311291 (= res!870522 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30015))))

(declare-fun b!1311292 () Bool)

(declare-fun res!870521 () Bool)

(assert (=> b!1311292 (=> (not res!870521) (not e!748050))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311292 (= res!870521 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42879 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311293 () Bool)

(assert (=> b!1311293 (= e!748050 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585456 () Bool)

(declare-fun minValue!1296 () V!52243)

(declare-fun zeroValue!1296 () V!52243)

(declare-datatypes ((tuple2!22878 0))(
  ( (tuple2!22879 (_1!11450 (_ BitVec 64)) (_2!11450 V!52243)) )
))
(declare-datatypes ((List!30019 0))(
  ( (Nil!30016) (Cons!30015 (h!31224 tuple2!22878) (t!43625 List!30019)) )
))
(declare-datatypes ((ListLongMap!20535 0))(
  ( (ListLongMap!20536 (toList!10283 List!30019)) )
))
(declare-fun contains!8433 (ListLongMap!20535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5296 (array!87698 array!87700 (_ BitVec 32) (_ BitVec 32) V!52243 V!52243 (_ BitVec 32) Int) ListLongMap!20535)

(assert (=> b!1311293 (= lt!585456 (contains!8433 (getCurrentListMap!5296 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311294 () Bool)

(assert (=> b!1311294 (= e!748049 tp_is_empty!35355)))

(assert (= (and start!110790 res!870520) b!1311288))

(assert (= (and b!1311288 res!870518) b!1311287))

(assert (= (and b!1311287 res!870519) b!1311291))

(assert (= (and b!1311291 res!870522) b!1311292))

(assert (= (and b!1311292 res!870521) b!1311293))

(assert (= (and b!1311289 condMapEmpty!54661) mapIsEmpty!54661))

(assert (= (and b!1311289 (not condMapEmpty!54661)) mapNonEmpty!54661))

(get-info :version)

(assert (= (and mapNonEmpty!54661 ((_ is ValueCellFull!16779) mapValue!54661)) b!1311290))

(assert (= (and b!1311289 ((_ is ValueCellFull!16779) mapDefault!54661)) b!1311294))

(assert (= start!110790 b!1311289))

(declare-fun m!1200805 () Bool)

(assert (=> mapNonEmpty!54661 m!1200805))

(declare-fun m!1200807 () Bool)

(assert (=> b!1311291 m!1200807))

(declare-fun m!1200809 () Bool)

(assert (=> b!1311293 m!1200809))

(assert (=> b!1311293 m!1200809))

(declare-fun m!1200811 () Bool)

(assert (=> b!1311293 m!1200811))

(declare-fun m!1200813 () Bool)

(assert (=> b!1311287 m!1200813))

(declare-fun m!1200815 () Bool)

(assert (=> start!110790 m!1200815))

(declare-fun m!1200817 () Bool)

(assert (=> start!110790 m!1200817))

(declare-fun m!1200819 () Bool)

(assert (=> start!110790 m!1200819))

(check-sat (not mapNonEmpty!54661) (not b!1311291) tp_is_empty!35355 (not start!110790) (not b_next!29625) (not b!1311293) (not b!1311287) b_and!47833)
(check-sat b_and!47833 (not b_next!29625))
