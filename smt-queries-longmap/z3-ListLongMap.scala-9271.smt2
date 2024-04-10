; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110976 () Bool)

(assert start!110976)

(declare-fun b_free!29811 () Bool)

(declare-fun b_next!29811 () Bool)

(assert (=> start!110976 (= b_free!29811 (not b_next!29811))))

(declare-fun tp!104755 () Bool)

(declare-fun b_and!48019 () Bool)

(assert (=> start!110976 (= tp!104755 b_and!48019)))

(declare-fun b!1313870 () Bool)

(declare-fun e!749446 () Bool)

(declare-fun tp_is_empty!35541 () Bool)

(assert (=> b!1313870 (= e!749446 tp_is_empty!35541)))

(declare-fun b!1313871 () Bool)

(declare-fun res!872265 () Bool)

(declare-fun e!749443 () Bool)

(assert (=> b!1313871 (=> (not res!872265) (not e!749443))))

(declare-datatypes ((array!88054 0))(
  ( (array!88055 (arr!42507 (Array (_ BitVec 32) (_ BitVec 64))) (size!43057 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88054)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52491 0))(
  ( (V!52492 (val!17845 Int)) )
))
(declare-datatypes ((ValueCell!16872 0))(
  ( (ValueCellFull!16872 (v!20472 V!52491)) (EmptyCell!16872) )
))
(declare-datatypes ((array!88056 0))(
  ( (array!88057 (arr!42508 (Array (_ BitVec 32) ValueCell!16872)) (size!43058 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88056)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313871 (= res!872265 (and (= (size!43058 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43057 _keys!1628) (size!43058 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313872 () Bool)

(declare-fun res!872267 () Bool)

(assert (=> b!1313872 (=> (not res!872267) (not e!749443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88054 (_ BitVec 32)) Bool)

(assert (=> b!1313872 (= res!872267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313873 () Bool)

(assert (=> b!1313873 (= e!749443 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52491)

(declare-fun zeroValue!1296 () V!52491)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585726 () Bool)

(declare-datatypes ((tuple2!23008 0))(
  ( (tuple2!23009 (_1!11515 (_ BitVec 64)) (_2!11515 V!52491)) )
))
(declare-datatypes ((List!30144 0))(
  ( (Nil!30141) (Cons!30140 (h!31349 tuple2!23008) (t!43750 List!30144)) )
))
(declare-datatypes ((ListLongMap!20665 0))(
  ( (ListLongMap!20666 (toList!10348 List!30144)) )
))
(declare-fun contains!8498 (ListLongMap!20665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5361 (array!88054 array!88056 (_ BitVec 32) (_ BitVec 32) V!52491 V!52491 (_ BitVec 32) Int) ListLongMap!20665)

(assert (=> b!1313873 (= lt!585726 (contains!8498 (getCurrentListMap!5361 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313874 () Bool)

(declare-fun e!749444 () Bool)

(declare-fun mapRes!54940 () Bool)

(assert (=> b!1313874 (= e!749444 (and e!749446 mapRes!54940))))

(declare-fun condMapEmpty!54940 () Bool)

(declare-fun mapDefault!54940 () ValueCell!16872)

(assert (=> b!1313874 (= condMapEmpty!54940 (= (arr!42508 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16872)) mapDefault!54940)))))

(declare-fun mapNonEmpty!54940 () Bool)

(declare-fun tp!104754 () Bool)

(declare-fun e!749445 () Bool)

(assert (=> mapNonEmpty!54940 (= mapRes!54940 (and tp!104754 e!749445))))

(declare-fun mapRest!54940 () (Array (_ BitVec 32) ValueCell!16872))

(declare-fun mapValue!54940 () ValueCell!16872)

(declare-fun mapKey!54940 () (_ BitVec 32))

(assert (=> mapNonEmpty!54940 (= (arr!42508 _values!1354) (store mapRest!54940 mapKey!54940 mapValue!54940))))

(declare-fun b!1313875 () Bool)

(declare-fun res!872268 () Bool)

(assert (=> b!1313875 (=> (not res!872268) (not e!749443))))

(assert (=> b!1313875 (= res!872268 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43057 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313876 () Bool)

(assert (=> b!1313876 (= e!749445 tp_is_empty!35541)))

(declare-fun res!872266 () Bool)

(assert (=> start!110976 (=> (not res!872266) (not e!749443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110976 (= res!872266 (validMask!0 mask!2040))))

(assert (=> start!110976 e!749443))

(assert (=> start!110976 tp!104755))

(declare-fun array_inv!32109 (array!88054) Bool)

(assert (=> start!110976 (array_inv!32109 _keys!1628)))

(assert (=> start!110976 true))

(assert (=> start!110976 tp_is_empty!35541))

(declare-fun array_inv!32110 (array!88056) Bool)

(assert (=> start!110976 (and (array_inv!32110 _values!1354) e!749444)))

(declare-fun mapIsEmpty!54940 () Bool)

(assert (=> mapIsEmpty!54940 mapRes!54940))

(declare-fun b!1313877 () Bool)

(declare-fun res!872264 () Bool)

(assert (=> b!1313877 (=> (not res!872264) (not e!749443))))

(declare-datatypes ((List!30145 0))(
  ( (Nil!30142) (Cons!30141 (h!31350 (_ BitVec 64)) (t!43751 List!30145)) )
))
(declare-fun arrayNoDuplicates!0 (array!88054 (_ BitVec 32) List!30145) Bool)

(assert (=> b!1313877 (= res!872264 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30142))))

(assert (= (and start!110976 res!872266) b!1313871))

(assert (= (and b!1313871 res!872265) b!1313872))

(assert (= (and b!1313872 res!872267) b!1313877))

(assert (= (and b!1313877 res!872264) b!1313875))

(assert (= (and b!1313875 res!872268) b!1313873))

(assert (= (and b!1313874 condMapEmpty!54940) mapIsEmpty!54940))

(assert (= (and b!1313874 (not condMapEmpty!54940)) mapNonEmpty!54940))

(get-info :version)

(assert (= (and mapNonEmpty!54940 ((_ is ValueCellFull!16872) mapValue!54940)) b!1313876))

(assert (= (and b!1313874 ((_ is ValueCellFull!16872) mapDefault!54940)) b!1313870))

(assert (= start!110976 b!1313874))

(declare-fun m!1202575 () Bool)

(assert (=> b!1313872 m!1202575))

(declare-fun m!1202577 () Bool)

(assert (=> mapNonEmpty!54940 m!1202577))

(declare-fun m!1202579 () Bool)

(assert (=> start!110976 m!1202579))

(declare-fun m!1202581 () Bool)

(assert (=> start!110976 m!1202581))

(declare-fun m!1202583 () Bool)

(assert (=> start!110976 m!1202583))

(declare-fun m!1202585 () Bool)

(assert (=> b!1313873 m!1202585))

(assert (=> b!1313873 m!1202585))

(declare-fun m!1202587 () Bool)

(assert (=> b!1313873 m!1202587))

(declare-fun m!1202589 () Bool)

(assert (=> b!1313877 m!1202589))

(check-sat (not b_next!29811) b_and!48019 tp_is_empty!35541 (not b!1313873) (not mapNonEmpty!54940) (not b!1313872) (not start!110976) (not b!1313877))
(check-sat b_and!48019 (not b_next!29811))
