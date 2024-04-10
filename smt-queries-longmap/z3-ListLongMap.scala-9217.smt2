; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110652 () Bool)

(assert start!110652)

(declare-fun b_free!29487 () Bool)

(declare-fun b_next!29487 () Bool)

(assert (=> start!110652 (= b_free!29487 (not b_next!29487))))

(declare-fun tp!103782 () Bool)

(declare-fun b_and!47695 () Bool)

(assert (=> start!110652 (= tp!103782 b_and!47695)))

(declare-fun b!1309307 () Bool)

(declare-fun res!869161 () Bool)

(declare-fun e!747014 () Bool)

(assert (=> b!1309307 (=> (not res!869161) (not e!747014))))

(declare-datatypes ((array!87426 0))(
  ( (array!87427 (arr!42193 (Array (_ BitVec 32) (_ BitVec 64))) (size!42743 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87426)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87426 (_ BitVec 32)) Bool)

(assert (=> b!1309307 (= res!869161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309308 () Bool)

(declare-fun res!869159 () Bool)

(assert (=> b!1309308 (=> (not res!869159) (not e!747014))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1309308 (= res!869159 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42743 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309309 () Bool)

(declare-fun res!869160 () Bool)

(assert (=> b!1309309 (=> (not res!869160) (not e!747014))))

(declare-datatypes ((List!29911 0))(
  ( (Nil!29908) (Cons!29907 (h!31116 (_ BitVec 64)) (t!43517 List!29911)) )
))
(declare-fun arrayNoDuplicates!0 (array!87426 (_ BitVec 32) List!29911) Bool)

(assert (=> b!1309309 (= res!869160 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29908))))

(declare-fun res!869162 () Bool)

(assert (=> start!110652 (=> (not res!869162) (not e!747014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110652 (= res!869162 (validMask!0 mask!2040))))

(assert (=> start!110652 e!747014))

(assert (=> start!110652 tp!103782))

(declare-fun array_inv!31887 (array!87426) Bool)

(assert (=> start!110652 (array_inv!31887 _keys!1628)))

(assert (=> start!110652 true))

(declare-fun tp_is_empty!35217 () Bool)

(assert (=> start!110652 tp_is_empty!35217))

(declare-datatypes ((V!52059 0))(
  ( (V!52060 (val!17683 Int)) )
))
(declare-datatypes ((ValueCell!16710 0))(
  ( (ValueCellFull!16710 (v!20310 V!52059)) (EmptyCell!16710) )
))
(declare-datatypes ((array!87428 0))(
  ( (array!87429 (arr!42194 (Array (_ BitVec 32) ValueCell!16710)) (size!42744 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87428)

(declare-fun e!747013 () Bool)

(declare-fun array_inv!31888 (array!87428) Bool)

(assert (=> start!110652 (and (array_inv!31888 _values!1354) e!747013)))

(declare-fun b!1309310 () Bool)

(declare-fun res!869163 () Bool)

(assert (=> b!1309310 (=> (not res!869163) (not e!747014))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309310 (= res!869163 (and (= (size!42744 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42743 _keys!1628) (size!42744 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309311 () Bool)

(declare-fun e!747016 () Bool)

(declare-fun mapRes!54454 () Bool)

(assert (=> b!1309311 (= e!747013 (and e!747016 mapRes!54454))))

(declare-fun condMapEmpty!54454 () Bool)

(declare-fun mapDefault!54454 () ValueCell!16710)

(assert (=> b!1309311 (= condMapEmpty!54454 (= (arr!42194 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16710)) mapDefault!54454)))))

(declare-fun mapIsEmpty!54454 () Bool)

(assert (=> mapIsEmpty!54454 mapRes!54454))

(declare-fun mapNonEmpty!54454 () Bool)

(declare-fun tp!103783 () Bool)

(declare-fun e!747015 () Bool)

(assert (=> mapNonEmpty!54454 (= mapRes!54454 (and tp!103783 e!747015))))

(declare-fun mapValue!54454 () ValueCell!16710)

(declare-fun mapRest!54454 () (Array (_ BitVec 32) ValueCell!16710))

(declare-fun mapKey!54454 () (_ BitVec 32))

(assert (=> mapNonEmpty!54454 (= (arr!42194 _values!1354) (store mapRest!54454 mapKey!54454 mapValue!54454))))

(declare-fun b!1309312 () Bool)

(assert (=> b!1309312 (= e!747015 tp_is_empty!35217)))

(declare-fun b!1309313 () Bool)

(assert (=> b!1309313 (= e!747014 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585249 () Bool)

(declare-fun minValue!1296 () V!52059)

(declare-fun zeroValue!1296 () V!52059)

(declare-datatypes ((tuple2!22768 0))(
  ( (tuple2!22769 (_1!11395 (_ BitVec 64)) (_2!11395 V!52059)) )
))
(declare-datatypes ((List!29912 0))(
  ( (Nil!29909) (Cons!29908 (h!31117 tuple2!22768) (t!43518 List!29912)) )
))
(declare-datatypes ((ListLongMap!20425 0))(
  ( (ListLongMap!20426 (toList!10228 List!29912)) )
))
(declare-fun contains!8378 (ListLongMap!20425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5241 (array!87426 array!87428 (_ BitVec 32) (_ BitVec 32) V!52059 V!52059 (_ BitVec 32) Int) ListLongMap!20425)

(assert (=> b!1309313 (= lt!585249 (contains!8378 (getCurrentListMap!5241 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309314 () Bool)

(assert (=> b!1309314 (= e!747016 tp_is_empty!35217)))

(assert (= (and start!110652 res!869162) b!1309310))

(assert (= (and b!1309310 res!869163) b!1309307))

(assert (= (and b!1309307 res!869161) b!1309309))

(assert (= (and b!1309309 res!869160) b!1309308))

(assert (= (and b!1309308 res!869159) b!1309313))

(assert (= (and b!1309311 condMapEmpty!54454) mapIsEmpty!54454))

(assert (= (and b!1309311 (not condMapEmpty!54454)) mapNonEmpty!54454))

(get-info :version)

(assert (= (and mapNonEmpty!54454 ((_ is ValueCellFull!16710) mapValue!54454)) b!1309312))

(assert (= (and b!1309311 ((_ is ValueCellFull!16710) mapDefault!54454)) b!1309314))

(assert (= start!110652 b!1309311))

(declare-fun m!1199431 () Bool)

(assert (=> mapNonEmpty!54454 m!1199431))

(declare-fun m!1199433 () Bool)

(assert (=> b!1309307 m!1199433))

(declare-fun m!1199435 () Bool)

(assert (=> start!110652 m!1199435))

(declare-fun m!1199437 () Bool)

(assert (=> start!110652 m!1199437))

(declare-fun m!1199439 () Bool)

(assert (=> start!110652 m!1199439))

(declare-fun m!1199441 () Bool)

(assert (=> b!1309309 m!1199441))

(declare-fun m!1199443 () Bool)

(assert (=> b!1309313 m!1199443))

(assert (=> b!1309313 m!1199443))

(declare-fun m!1199445 () Bool)

(assert (=> b!1309313 m!1199445))

(check-sat b_and!47695 tp_is_empty!35217 (not b!1309309) (not start!110652) (not mapNonEmpty!54454) (not b!1309307) (not b_next!29487) (not b!1309313))
(check-sat b_and!47695 (not b_next!29487))
