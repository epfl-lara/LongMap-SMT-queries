; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110808 () Bool)

(assert start!110808)

(declare-fun b_free!29643 () Bool)

(declare-fun b_next!29643 () Bool)

(assert (=> start!110808 (= b_free!29643 (not b_next!29643))))

(declare-fun tp!104250 () Bool)

(declare-fun b_and!47851 () Bool)

(assert (=> start!110808 (= tp!104250 b_and!47851)))

(declare-fun b!1311503 () Bool)

(declare-fun e!748183 () Bool)

(declare-fun tp_is_empty!35373 () Bool)

(assert (=> b!1311503 (= e!748183 tp_is_empty!35373)))

(declare-fun res!870657 () Bool)

(declare-fun e!748186 () Bool)

(assert (=> start!110808 (=> (not res!870657) (not e!748186))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110808 (= res!870657 (validMask!0 mask!2040))))

(assert (=> start!110808 e!748186))

(assert (=> start!110808 tp!104250))

(declare-datatypes ((array!87734 0))(
  ( (array!87735 (arr!42347 (Array (_ BitVec 32) (_ BitVec 64))) (size!42897 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87734)

(declare-fun array_inv!32001 (array!87734) Bool)

(assert (=> start!110808 (array_inv!32001 _keys!1628)))

(assert (=> start!110808 true))

(assert (=> start!110808 tp_is_empty!35373))

(declare-datatypes ((V!52267 0))(
  ( (V!52268 (val!17761 Int)) )
))
(declare-datatypes ((ValueCell!16788 0))(
  ( (ValueCellFull!16788 (v!20388 V!52267)) (EmptyCell!16788) )
))
(declare-datatypes ((array!87736 0))(
  ( (array!87737 (arr!42348 (Array (_ BitVec 32) ValueCell!16788)) (size!42898 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87736)

(declare-fun e!748184 () Bool)

(declare-fun array_inv!32002 (array!87736) Bool)

(assert (=> start!110808 (and (array_inv!32002 _values!1354) e!748184)))

(declare-fun b!1311504 () Bool)

(declare-fun e!748187 () Bool)

(assert (=> b!1311504 (= e!748187 tp_is_empty!35373)))

(declare-fun b!1311505 () Bool)

(declare-fun res!870654 () Bool)

(assert (=> b!1311505 (=> (not res!870654) (not e!748186))))

(declare-datatypes ((List!30029 0))(
  ( (Nil!30026) (Cons!30025 (h!31234 (_ BitVec 64)) (t!43635 List!30029)) )
))
(declare-fun arrayNoDuplicates!0 (array!87734 (_ BitVec 32) List!30029) Bool)

(assert (=> b!1311505 (= res!870654 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30026))))

(declare-fun b!1311506 () Bool)

(declare-fun res!870656 () Bool)

(assert (=> b!1311506 (=> (not res!870656) (not e!748186))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311506 (= res!870656 (and (= (size!42898 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42897 _keys!1628) (size!42898 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311507 () Bool)

(declare-fun res!870653 () Bool)

(assert (=> b!1311507 (=> (not res!870653) (not e!748186))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311507 (= res!870653 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42897 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311508 () Bool)

(assert (=> b!1311508 (= e!748186 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585483 () Bool)

(declare-fun minValue!1296 () V!52267)

(declare-fun zeroValue!1296 () V!52267)

(declare-datatypes ((tuple2!22886 0))(
  ( (tuple2!22887 (_1!11454 (_ BitVec 64)) (_2!11454 V!52267)) )
))
(declare-datatypes ((List!30030 0))(
  ( (Nil!30027) (Cons!30026 (h!31235 tuple2!22886) (t!43636 List!30030)) )
))
(declare-datatypes ((ListLongMap!20543 0))(
  ( (ListLongMap!20544 (toList!10287 List!30030)) )
))
(declare-fun contains!8437 (ListLongMap!20543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5300 (array!87734 array!87736 (_ BitVec 32) (_ BitVec 32) V!52267 V!52267 (_ BitVec 32) Int) ListLongMap!20543)

(assert (=> b!1311508 (= lt!585483 (contains!8437 (getCurrentListMap!5300 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311509 () Bool)

(declare-fun mapRes!54688 () Bool)

(assert (=> b!1311509 (= e!748184 (and e!748183 mapRes!54688))))

(declare-fun condMapEmpty!54688 () Bool)

(declare-fun mapDefault!54688 () ValueCell!16788)

(assert (=> b!1311509 (= condMapEmpty!54688 (= (arr!42348 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16788)) mapDefault!54688)))))

(declare-fun b!1311510 () Bool)

(declare-fun res!870655 () Bool)

(assert (=> b!1311510 (=> (not res!870655) (not e!748186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87734 (_ BitVec 32)) Bool)

(assert (=> b!1311510 (= res!870655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54688 () Bool)

(assert (=> mapIsEmpty!54688 mapRes!54688))

(declare-fun mapNonEmpty!54688 () Bool)

(declare-fun tp!104251 () Bool)

(assert (=> mapNonEmpty!54688 (= mapRes!54688 (and tp!104251 e!748187))))

(declare-fun mapRest!54688 () (Array (_ BitVec 32) ValueCell!16788))

(declare-fun mapValue!54688 () ValueCell!16788)

(declare-fun mapKey!54688 () (_ BitVec 32))

(assert (=> mapNonEmpty!54688 (= (arr!42348 _values!1354) (store mapRest!54688 mapKey!54688 mapValue!54688))))

(assert (= (and start!110808 res!870657) b!1311506))

(assert (= (and b!1311506 res!870656) b!1311510))

(assert (= (and b!1311510 res!870655) b!1311505))

(assert (= (and b!1311505 res!870654) b!1311507))

(assert (= (and b!1311507 res!870653) b!1311508))

(assert (= (and b!1311509 condMapEmpty!54688) mapIsEmpty!54688))

(assert (= (and b!1311509 (not condMapEmpty!54688)) mapNonEmpty!54688))

(get-info :version)

(assert (= (and mapNonEmpty!54688 ((_ is ValueCellFull!16788) mapValue!54688)) b!1311504))

(assert (= (and b!1311509 ((_ is ValueCellFull!16788) mapDefault!54688)) b!1311503))

(assert (= start!110808 b!1311509))

(declare-fun m!1200949 () Bool)

(assert (=> b!1311508 m!1200949))

(assert (=> b!1311508 m!1200949))

(declare-fun m!1200951 () Bool)

(assert (=> b!1311508 m!1200951))

(declare-fun m!1200953 () Bool)

(assert (=> b!1311510 m!1200953))

(declare-fun m!1200955 () Bool)

(assert (=> mapNonEmpty!54688 m!1200955))

(declare-fun m!1200957 () Bool)

(assert (=> b!1311505 m!1200957))

(declare-fun m!1200959 () Bool)

(assert (=> start!110808 m!1200959))

(declare-fun m!1200961 () Bool)

(assert (=> start!110808 m!1200961))

(declare-fun m!1200963 () Bool)

(assert (=> start!110808 m!1200963))

(check-sat (not start!110808) tp_is_empty!35373 b_and!47851 (not b!1311510) (not b!1311508) (not mapNonEmpty!54688) (not b!1311505) (not b_next!29643))
(check-sat b_and!47851 (not b_next!29643))
