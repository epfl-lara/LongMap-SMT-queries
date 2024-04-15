; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110674 () Bool)

(assert start!110674)

(declare-fun b_free!29509 () Bool)

(declare-fun b_next!29509 () Bool)

(assert (=> start!110674 (= b_free!29509 (not b_next!29509))))

(declare-fun tp!103849 () Bool)

(declare-fun b_and!47699 () Bool)

(assert (=> start!110674 (= tp!103849 b_and!47699)))

(declare-fun mapIsEmpty!54487 () Bool)

(declare-fun mapRes!54487 () Bool)

(assert (=> mapIsEmpty!54487 mapRes!54487))

(declare-fun b!1309501 () Bool)

(declare-fun res!869299 () Bool)

(declare-fun e!747149 () Bool)

(assert (=> b!1309501 (=> (not res!869299) (not e!747149))))

(declare-datatypes ((array!87383 0))(
  ( (array!87384 (arr!42172 (Array (_ BitVec 32) (_ BitVec 64))) (size!42724 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87383)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52089 0))(
  ( (V!52090 (val!17694 Int)) )
))
(declare-datatypes ((ValueCell!16721 0))(
  ( (ValueCellFull!16721 (v!20320 V!52089)) (EmptyCell!16721) )
))
(declare-datatypes ((array!87385 0))(
  ( (array!87386 (arr!42173 (Array (_ BitVec 32) ValueCell!16721)) (size!42725 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87385)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309501 (= res!869299 (and (= (size!42725 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42724 _keys!1628) (size!42725 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54487 () Bool)

(declare-fun tp!103850 () Bool)

(declare-fun e!747145 () Bool)

(assert (=> mapNonEmpty!54487 (= mapRes!54487 (and tp!103850 e!747145))))

(declare-fun mapKey!54487 () (_ BitVec 32))

(declare-fun mapValue!54487 () ValueCell!16721)

(declare-fun mapRest!54487 () (Array (_ BitVec 32) ValueCell!16721))

(assert (=> mapNonEmpty!54487 (= (arr!42173 _values!1354) (store mapRest!54487 mapKey!54487 mapValue!54487))))

(declare-fun b!1309502 () Bool)

(assert (=> b!1309502 (= e!747149 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585096 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52089)

(declare-fun zeroValue!1296 () V!52089)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22872 0))(
  ( (tuple2!22873 (_1!11447 (_ BitVec 64)) (_2!11447 V!52089)) )
))
(declare-datatypes ((List!30000 0))(
  ( (Nil!29997) (Cons!29996 (h!31205 tuple2!22872) (t!43598 List!30000)) )
))
(declare-datatypes ((ListLongMap!20529 0))(
  ( (ListLongMap!20530 (toList!10280 List!30000)) )
))
(declare-fun contains!8357 (ListLongMap!20529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5175 (array!87383 array!87385 (_ BitVec 32) (_ BitVec 32) V!52089 V!52089 (_ BitVec 32) Int) ListLongMap!20529)

(assert (=> b!1309502 (= lt!585096 (contains!8357 (getCurrentListMap!5175 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309503 () Bool)

(declare-fun res!869298 () Bool)

(assert (=> b!1309503 (=> (not res!869298) (not e!747149))))

(declare-datatypes ((List!30001 0))(
  ( (Nil!29998) (Cons!29997 (h!31206 (_ BitVec 64)) (t!43599 List!30001)) )
))
(declare-fun arrayNoDuplicates!0 (array!87383 (_ BitVec 32) List!30001) Bool)

(assert (=> b!1309503 (= res!869298 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29998))))

(declare-fun b!1309504 () Bool)

(declare-fun tp_is_empty!35239 () Bool)

(assert (=> b!1309504 (= e!747145 tp_is_empty!35239)))

(declare-fun b!1309505 () Bool)

(declare-fun e!747147 () Bool)

(declare-fun e!747146 () Bool)

(assert (=> b!1309505 (= e!747147 (and e!747146 mapRes!54487))))

(declare-fun condMapEmpty!54487 () Bool)

(declare-fun mapDefault!54487 () ValueCell!16721)

(assert (=> b!1309505 (= condMapEmpty!54487 (= (arr!42173 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16721)) mapDefault!54487)))))

(declare-fun b!1309507 () Bool)

(declare-fun res!869296 () Bool)

(assert (=> b!1309507 (=> (not res!869296) (not e!747149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87383 (_ BitVec 32)) Bool)

(assert (=> b!1309507 (= res!869296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309508 () Bool)

(assert (=> b!1309508 (= e!747146 tp_is_empty!35239)))

(declare-fun res!869297 () Bool)

(assert (=> start!110674 (=> (not res!869297) (not e!747149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110674 (= res!869297 (validMask!0 mask!2040))))

(assert (=> start!110674 e!747149))

(assert (=> start!110674 tp!103849))

(declare-fun array_inv!32061 (array!87383) Bool)

(assert (=> start!110674 (array_inv!32061 _keys!1628)))

(assert (=> start!110674 true))

(assert (=> start!110674 tp_is_empty!35239))

(declare-fun array_inv!32062 (array!87385) Bool)

(assert (=> start!110674 (and (array_inv!32062 _values!1354) e!747147)))

(declare-fun b!1309506 () Bool)

(declare-fun res!869295 () Bool)

(assert (=> b!1309506 (=> (not res!869295) (not e!747149))))

(assert (=> b!1309506 (= res!869295 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42724 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110674 res!869297) b!1309501))

(assert (= (and b!1309501 res!869299) b!1309507))

(assert (= (and b!1309507 res!869296) b!1309503))

(assert (= (and b!1309503 res!869298) b!1309506))

(assert (= (and b!1309506 res!869295) b!1309502))

(assert (= (and b!1309505 condMapEmpty!54487) mapIsEmpty!54487))

(assert (= (and b!1309505 (not condMapEmpty!54487)) mapNonEmpty!54487))

(get-info :version)

(assert (= (and mapNonEmpty!54487 ((_ is ValueCellFull!16721) mapValue!54487)) b!1309504))

(assert (= (and b!1309505 ((_ is ValueCellFull!16721) mapDefault!54487)) b!1309508))

(assert (= start!110674 b!1309505))

(declare-fun m!1199091 () Bool)

(assert (=> b!1309507 m!1199091))

(declare-fun m!1199093 () Bool)

(assert (=> mapNonEmpty!54487 m!1199093))

(declare-fun m!1199095 () Bool)

(assert (=> b!1309503 m!1199095))

(declare-fun m!1199097 () Bool)

(assert (=> b!1309502 m!1199097))

(assert (=> b!1309502 m!1199097))

(declare-fun m!1199099 () Bool)

(assert (=> b!1309502 m!1199099))

(declare-fun m!1199101 () Bool)

(assert (=> start!110674 m!1199101))

(declare-fun m!1199103 () Bool)

(assert (=> start!110674 m!1199103))

(declare-fun m!1199105 () Bool)

(assert (=> start!110674 m!1199105))

(check-sat b_and!47699 (not mapNonEmpty!54487) (not b!1309507) (not start!110674) tp_is_empty!35239 (not b!1309503) (not b_next!29509) (not b!1309502))
(check-sat b_and!47699 (not b_next!29509))
