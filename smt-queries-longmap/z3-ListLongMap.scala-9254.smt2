; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110874 () Bool)

(assert start!110874)

(declare-fun b_free!29709 () Bool)

(declare-fun b_next!29709 () Bool)

(assert (=> start!110874 (= b_free!29709 (not b_next!29709))))

(declare-fun tp!104449 () Bool)

(declare-fun b_and!47917 () Bool)

(assert (=> start!110874 (= tp!104449 b_and!47917)))

(declare-fun b!1312619 () Bool)

(declare-fun e!748682 () Bool)

(declare-fun e!748678 () Bool)

(declare-fun mapRes!54787 () Bool)

(assert (=> b!1312619 (= e!748682 (and e!748678 mapRes!54787))))

(declare-fun condMapEmpty!54787 () Bool)

(declare-datatypes ((V!52355 0))(
  ( (V!52356 (val!17794 Int)) )
))
(declare-datatypes ((ValueCell!16821 0))(
  ( (ValueCellFull!16821 (v!20421 V!52355)) (EmptyCell!16821) )
))
(declare-datatypes ((array!87860 0))(
  ( (array!87861 (arr!42410 (Array (_ BitVec 32) ValueCell!16821)) (size!42960 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87860)

(declare-fun mapDefault!54787 () ValueCell!16821)

(assert (=> b!1312619 (= condMapEmpty!54787 (= (arr!42410 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16821)) mapDefault!54787)))))

(declare-fun b!1312620 () Bool)

(declare-fun tp_is_empty!35439 () Bool)

(assert (=> b!1312620 (= e!748678 tp_is_empty!35439)))

(declare-fun b!1312621 () Bool)

(declare-fun e!748681 () Bool)

(assert (=> b!1312621 (= e!748681 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87862 0))(
  ( (array!87863 (arr!42411 (Array (_ BitVec 32) (_ BitVec 64))) (size!42961 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87862)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52355)

(declare-fun zeroValue!1296 () V!52355)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585582 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22936 0))(
  ( (tuple2!22937 (_1!11479 (_ BitVec 64)) (_2!11479 V!52355)) )
))
(declare-datatypes ((List!30074 0))(
  ( (Nil!30071) (Cons!30070 (h!31279 tuple2!22936) (t!43680 List!30074)) )
))
(declare-datatypes ((ListLongMap!20593 0))(
  ( (ListLongMap!20594 (toList!10312 List!30074)) )
))
(declare-fun contains!8462 (ListLongMap!20593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5325 (array!87862 array!87860 (_ BitVec 32) (_ BitVec 32) V!52355 V!52355 (_ BitVec 32) Int) ListLongMap!20593)

(assert (=> b!1312621 (= lt!585582 (contains!8462 (getCurrentListMap!5325 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312622 () Bool)

(declare-fun e!748680 () Bool)

(assert (=> b!1312622 (= e!748680 tp_is_empty!35439)))

(declare-fun b!1312623 () Bool)

(declare-fun res!871472 () Bool)

(assert (=> b!1312623 (=> (not res!871472) (not e!748681))))

(assert (=> b!1312623 (= res!871472 (and (= (size!42960 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42961 _keys!1628) (size!42960 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312624 () Bool)

(declare-fun res!871474 () Bool)

(assert (=> b!1312624 (=> (not res!871474) (not e!748681))))

(assert (=> b!1312624 (= res!871474 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42961 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312625 () Bool)

(declare-fun res!871473 () Bool)

(assert (=> b!1312625 (=> (not res!871473) (not e!748681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87862 (_ BitVec 32)) Bool)

(assert (=> b!1312625 (= res!871473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54787 () Bool)

(declare-fun tp!104448 () Bool)

(assert (=> mapNonEmpty!54787 (= mapRes!54787 (and tp!104448 e!748680))))

(declare-fun mapRest!54787 () (Array (_ BitVec 32) ValueCell!16821))

(declare-fun mapKey!54787 () (_ BitVec 32))

(declare-fun mapValue!54787 () ValueCell!16821)

(assert (=> mapNonEmpty!54787 (= (arr!42410 _values!1354) (store mapRest!54787 mapKey!54787 mapValue!54787))))

(declare-fun res!871475 () Bool)

(assert (=> start!110874 (=> (not res!871475) (not e!748681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110874 (= res!871475 (validMask!0 mask!2040))))

(assert (=> start!110874 e!748681))

(assert (=> start!110874 tp!104449))

(declare-fun array_inv!32043 (array!87862) Bool)

(assert (=> start!110874 (array_inv!32043 _keys!1628)))

(assert (=> start!110874 true))

(assert (=> start!110874 tp_is_empty!35439))

(declare-fun array_inv!32044 (array!87860) Bool)

(assert (=> start!110874 (and (array_inv!32044 _values!1354) e!748682)))

(declare-fun mapIsEmpty!54787 () Bool)

(assert (=> mapIsEmpty!54787 mapRes!54787))

(declare-fun b!1312626 () Bool)

(declare-fun res!871476 () Bool)

(assert (=> b!1312626 (=> (not res!871476) (not e!748681))))

(declare-datatypes ((List!30075 0))(
  ( (Nil!30072) (Cons!30071 (h!31280 (_ BitVec 64)) (t!43681 List!30075)) )
))
(declare-fun arrayNoDuplicates!0 (array!87862 (_ BitVec 32) List!30075) Bool)

(assert (=> b!1312626 (= res!871476 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30072))))

(assert (= (and start!110874 res!871475) b!1312623))

(assert (= (and b!1312623 res!871472) b!1312625))

(assert (= (and b!1312625 res!871473) b!1312626))

(assert (= (and b!1312626 res!871476) b!1312624))

(assert (= (and b!1312624 res!871474) b!1312621))

(assert (= (and b!1312619 condMapEmpty!54787) mapIsEmpty!54787))

(assert (= (and b!1312619 (not condMapEmpty!54787)) mapNonEmpty!54787))

(get-info :version)

(assert (= (and mapNonEmpty!54787 ((_ is ValueCellFull!16821) mapValue!54787)) b!1312622))

(assert (= (and b!1312619 ((_ is ValueCellFull!16821) mapDefault!54787)) b!1312620))

(assert (= start!110874 b!1312619))

(declare-fun m!1201747 () Bool)

(assert (=> b!1312625 m!1201747))

(declare-fun m!1201749 () Bool)

(assert (=> mapNonEmpty!54787 m!1201749))

(declare-fun m!1201751 () Bool)

(assert (=> b!1312626 m!1201751))

(declare-fun m!1201753 () Bool)

(assert (=> b!1312621 m!1201753))

(assert (=> b!1312621 m!1201753))

(declare-fun m!1201755 () Bool)

(assert (=> b!1312621 m!1201755))

(declare-fun m!1201757 () Bool)

(assert (=> start!110874 m!1201757))

(declare-fun m!1201759 () Bool)

(assert (=> start!110874 m!1201759))

(declare-fun m!1201761 () Bool)

(assert (=> start!110874 m!1201761))

(check-sat (not b!1312625) tp_is_empty!35439 (not b!1312621) b_and!47917 (not b!1312626) (not start!110874) (not mapNonEmpty!54787) (not b_next!29709))
(check-sat b_and!47917 (not b_next!29709))
