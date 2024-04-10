; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110994 () Bool)

(assert start!110994)

(declare-fun b_free!29829 () Bool)

(declare-fun b_next!29829 () Bool)

(assert (=> start!110994 (= b_free!29829 (not b_next!29829))))

(declare-fun tp!104808 () Bool)

(declare-fun b_and!48037 () Bool)

(assert (=> start!110994 (= tp!104808 b_and!48037)))

(declare-fun b!1314086 () Bool)

(declare-fun e!749580 () Bool)

(declare-fun tp_is_empty!35559 () Bool)

(assert (=> b!1314086 (= e!749580 tp_is_empty!35559)))

(declare-fun b!1314087 () Bool)

(declare-fun e!749579 () Bool)

(declare-fun mapRes!54967 () Bool)

(assert (=> b!1314087 (= e!749579 (and e!749580 mapRes!54967))))

(declare-fun condMapEmpty!54967 () Bool)

(declare-datatypes ((V!52515 0))(
  ( (V!52516 (val!17854 Int)) )
))
(declare-datatypes ((ValueCell!16881 0))(
  ( (ValueCellFull!16881 (v!20481 V!52515)) (EmptyCell!16881) )
))
(declare-datatypes ((array!88090 0))(
  ( (array!88091 (arr!42525 (Array (_ BitVec 32) ValueCell!16881)) (size!43075 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88090)

(declare-fun mapDefault!54967 () ValueCell!16881)

(assert (=> b!1314087 (= condMapEmpty!54967 (= (arr!42525 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16881)) mapDefault!54967)))))

(declare-fun mapIsEmpty!54967 () Bool)

(assert (=> mapIsEmpty!54967 mapRes!54967))

(declare-fun b!1314088 () Bool)

(declare-fun res!872402 () Bool)

(declare-fun e!749582 () Bool)

(assert (=> b!1314088 (=> (not res!872402) (not e!749582))))

(declare-datatypes ((array!88092 0))(
  ( (array!88093 (arr!42526 (Array (_ BitVec 32) (_ BitVec 64))) (size!43076 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88092)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314088 (= res!872402 (and (= (size!43075 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43076 _keys!1628) (size!43075 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314089 () Bool)

(declare-fun e!749578 () Bool)

(assert (=> b!1314089 (= e!749578 tp_is_empty!35559)))

(declare-fun b!1314091 () Bool)

(declare-fun res!872399 () Bool)

(assert (=> b!1314091 (=> (not res!872399) (not e!749582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88092 (_ BitVec 32)) Bool)

(assert (=> b!1314091 (= res!872399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54967 () Bool)

(declare-fun tp!104809 () Bool)

(assert (=> mapNonEmpty!54967 (= mapRes!54967 (and tp!104809 e!749578))))

(declare-fun mapValue!54967 () ValueCell!16881)

(declare-fun mapKey!54967 () (_ BitVec 32))

(declare-fun mapRest!54967 () (Array (_ BitVec 32) ValueCell!16881))

(assert (=> mapNonEmpty!54967 (= (arr!42525 _values!1354) (store mapRest!54967 mapKey!54967 mapValue!54967))))

(declare-fun b!1314092 () Bool)

(declare-fun res!872401 () Bool)

(assert (=> b!1314092 (=> (not res!872401) (not e!749582))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1314092 (= res!872401 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43076 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314093 () Bool)

(declare-fun res!872403 () Bool)

(assert (=> b!1314093 (=> (not res!872403) (not e!749582))))

(declare-datatypes ((List!30156 0))(
  ( (Nil!30153) (Cons!30152 (h!31361 (_ BitVec 64)) (t!43762 List!30156)) )
))
(declare-fun arrayNoDuplicates!0 (array!88092 (_ BitVec 32) List!30156) Bool)

(assert (=> b!1314093 (= res!872403 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30153))))

(declare-fun res!872400 () Bool)

(assert (=> start!110994 (=> (not res!872400) (not e!749582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110994 (= res!872400 (validMask!0 mask!2040))))

(assert (=> start!110994 e!749582))

(assert (=> start!110994 tp!104808))

(declare-fun array_inv!32123 (array!88092) Bool)

(assert (=> start!110994 (array_inv!32123 _keys!1628)))

(assert (=> start!110994 true))

(assert (=> start!110994 tp_is_empty!35559))

(declare-fun array_inv!32124 (array!88090) Bool)

(assert (=> start!110994 (and (array_inv!32124 _values!1354) e!749579)))

(declare-fun b!1314090 () Bool)

(assert (=> b!1314090 (= e!749582 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52515)

(declare-fun zeroValue!1296 () V!52515)

(declare-fun lt!585753 () Bool)

(declare-datatypes ((tuple2!23020 0))(
  ( (tuple2!23021 (_1!11521 (_ BitVec 64)) (_2!11521 V!52515)) )
))
(declare-datatypes ((List!30157 0))(
  ( (Nil!30154) (Cons!30153 (h!31362 tuple2!23020) (t!43763 List!30157)) )
))
(declare-datatypes ((ListLongMap!20677 0))(
  ( (ListLongMap!20678 (toList!10354 List!30157)) )
))
(declare-fun contains!8504 (ListLongMap!20677 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5367 (array!88092 array!88090 (_ BitVec 32) (_ BitVec 32) V!52515 V!52515 (_ BitVec 32) Int) ListLongMap!20677)

(assert (=> b!1314090 (= lt!585753 (contains!8504 (getCurrentListMap!5367 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110994 res!872400) b!1314088))

(assert (= (and b!1314088 res!872402) b!1314091))

(assert (= (and b!1314091 res!872399) b!1314093))

(assert (= (and b!1314093 res!872403) b!1314092))

(assert (= (and b!1314092 res!872401) b!1314090))

(assert (= (and b!1314087 condMapEmpty!54967) mapIsEmpty!54967))

(assert (= (and b!1314087 (not condMapEmpty!54967)) mapNonEmpty!54967))

(get-info :version)

(assert (= (and mapNonEmpty!54967 ((_ is ValueCellFull!16881) mapValue!54967)) b!1314089))

(assert (= (and b!1314087 ((_ is ValueCellFull!16881) mapDefault!54967)) b!1314086))

(assert (= start!110994 b!1314087))

(declare-fun m!1202719 () Bool)

(assert (=> b!1314091 m!1202719))

(declare-fun m!1202721 () Bool)

(assert (=> b!1314093 m!1202721))

(declare-fun m!1202723 () Bool)

(assert (=> mapNonEmpty!54967 m!1202723))

(declare-fun m!1202725 () Bool)

(assert (=> start!110994 m!1202725))

(declare-fun m!1202727 () Bool)

(assert (=> start!110994 m!1202727))

(declare-fun m!1202729 () Bool)

(assert (=> start!110994 m!1202729))

(declare-fun m!1202731 () Bool)

(assert (=> b!1314090 m!1202731))

(assert (=> b!1314090 m!1202731))

(declare-fun m!1202733 () Bool)

(assert (=> b!1314090 m!1202733))

(check-sat (not start!110994) (not b_next!29829) (not b!1314090) tp_is_empty!35559 b_and!48037 (not mapNonEmpty!54967) (not b!1314093) (not b!1314091))
(check-sat b_and!48037 (not b_next!29829))
