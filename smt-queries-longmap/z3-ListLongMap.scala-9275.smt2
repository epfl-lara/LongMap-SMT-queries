; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111000 () Bool)

(assert start!111000)

(declare-fun b_free!29835 () Bool)

(declare-fun b_next!29835 () Bool)

(assert (=> start!111000 (= b_free!29835 (not b_next!29835))))

(declare-fun tp!104827 () Bool)

(declare-fun b_and!48043 () Bool)

(assert (=> start!111000 (= tp!104827 b_and!48043)))

(declare-fun b!1314158 () Bool)

(declare-fun e!749626 () Bool)

(declare-fun tp_is_empty!35565 () Bool)

(assert (=> b!1314158 (= e!749626 tp_is_empty!35565)))

(declare-fun b!1314159 () Bool)

(declare-fun res!872445 () Bool)

(declare-fun e!749623 () Bool)

(assert (=> b!1314159 (=> (not res!872445) (not e!749623))))

(declare-datatypes ((array!88102 0))(
  ( (array!88103 (arr!42531 (Array (_ BitVec 32) (_ BitVec 64))) (size!43081 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88102)

(declare-datatypes ((List!30161 0))(
  ( (Nil!30158) (Cons!30157 (h!31366 (_ BitVec 64)) (t!43767 List!30161)) )
))
(declare-fun arrayNoDuplicates!0 (array!88102 (_ BitVec 32) List!30161) Bool)

(assert (=> b!1314159 (= res!872445 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30158))))

(declare-fun b!1314160 () Bool)

(declare-fun e!749625 () Bool)

(assert (=> b!1314160 (= e!749625 tp_is_empty!35565)))

(declare-fun b!1314161 () Bool)

(declare-fun res!872446 () Bool)

(assert (=> b!1314161 (=> (not res!872446) (not e!749623))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52523 0))(
  ( (V!52524 (val!17857 Int)) )
))
(declare-datatypes ((ValueCell!16884 0))(
  ( (ValueCellFull!16884 (v!20484 V!52523)) (EmptyCell!16884) )
))
(declare-datatypes ((array!88104 0))(
  ( (array!88105 (arr!42532 (Array (_ BitVec 32) ValueCell!16884)) (size!43082 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88104)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314161 (= res!872446 (and (= (size!43082 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43081 _keys!1628) (size!43082 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872448 () Bool)

(assert (=> start!111000 (=> (not res!872448) (not e!749623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111000 (= res!872448 (validMask!0 mask!2040))))

(assert (=> start!111000 e!749623))

(assert (=> start!111000 tp!104827))

(declare-fun array_inv!32129 (array!88102) Bool)

(assert (=> start!111000 (array_inv!32129 _keys!1628)))

(assert (=> start!111000 true))

(assert (=> start!111000 tp_is_empty!35565))

(declare-fun e!749624 () Bool)

(declare-fun array_inv!32130 (array!88104) Bool)

(assert (=> start!111000 (and (array_inv!32130 _values!1354) e!749624)))

(declare-fun b!1314162 () Bool)

(declare-fun res!872444 () Bool)

(assert (=> b!1314162 (=> (not res!872444) (not e!749623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88102 (_ BitVec 32)) Bool)

(assert (=> b!1314162 (= res!872444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314163 () Bool)

(declare-fun res!872447 () Bool)

(assert (=> b!1314163 (=> (not res!872447) (not e!749623))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314163 (= res!872447 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43081 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314164 () Bool)

(declare-fun mapRes!54976 () Bool)

(assert (=> b!1314164 (= e!749624 (and e!749626 mapRes!54976))))

(declare-fun condMapEmpty!54976 () Bool)

(declare-fun mapDefault!54976 () ValueCell!16884)

(assert (=> b!1314164 (= condMapEmpty!54976 (= (arr!42532 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16884)) mapDefault!54976)))))

(declare-fun mapNonEmpty!54976 () Bool)

(declare-fun tp!104826 () Bool)

(assert (=> mapNonEmpty!54976 (= mapRes!54976 (and tp!104826 e!749625))))

(declare-fun mapKey!54976 () (_ BitVec 32))

(declare-fun mapRest!54976 () (Array (_ BitVec 32) ValueCell!16884))

(declare-fun mapValue!54976 () ValueCell!16884)

(assert (=> mapNonEmpty!54976 (= (arr!42532 _values!1354) (store mapRest!54976 mapKey!54976 mapValue!54976))))

(declare-fun mapIsEmpty!54976 () Bool)

(assert (=> mapIsEmpty!54976 mapRes!54976))

(declare-fun b!1314165 () Bool)

(assert (=> b!1314165 (= e!749623 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585762 () Bool)

(declare-fun minValue!1296 () V!52523)

(declare-fun zeroValue!1296 () V!52523)

(declare-datatypes ((tuple2!23024 0))(
  ( (tuple2!23025 (_1!11523 (_ BitVec 64)) (_2!11523 V!52523)) )
))
(declare-datatypes ((List!30162 0))(
  ( (Nil!30159) (Cons!30158 (h!31367 tuple2!23024) (t!43768 List!30162)) )
))
(declare-datatypes ((ListLongMap!20681 0))(
  ( (ListLongMap!20682 (toList!10356 List!30162)) )
))
(declare-fun contains!8506 (ListLongMap!20681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5369 (array!88102 array!88104 (_ BitVec 32) (_ BitVec 32) V!52523 V!52523 (_ BitVec 32) Int) ListLongMap!20681)

(assert (=> b!1314165 (= lt!585762 (contains!8506 (getCurrentListMap!5369 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!111000 res!872448) b!1314161))

(assert (= (and b!1314161 res!872446) b!1314162))

(assert (= (and b!1314162 res!872444) b!1314159))

(assert (= (and b!1314159 res!872445) b!1314163))

(assert (= (and b!1314163 res!872447) b!1314165))

(assert (= (and b!1314164 condMapEmpty!54976) mapIsEmpty!54976))

(assert (= (and b!1314164 (not condMapEmpty!54976)) mapNonEmpty!54976))

(get-info :version)

(assert (= (and mapNonEmpty!54976 ((_ is ValueCellFull!16884) mapValue!54976)) b!1314160))

(assert (= (and b!1314164 ((_ is ValueCellFull!16884) mapDefault!54976)) b!1314158))

(assert (= start!111000 b!1314164))

(declare-fun m!1202767 () Bool)

(assert (=> mapNonEmpty!54976 m!1202767))

(declare-fun m!1202769 () Bool)

(assert (=> b!1314165 m!1202769))

(assert (=> b!1314165 m!1202769))

(declare-fun m!1202771 () Bool)

(assert (=> b!1314165 m!1202771))

(declare-fun m!1202773 () Bool)

(assert (=> start!111000 m!1202773))

(declare-fun m!1202775 () Bool)

(assert (=> start!111000 m!1202775))

(declare-fun m!1202777 () Bool)

(assert (=> start!111000 m!1202777))

(declare-fun m!1202779 () Bool)

(assert (=> b!1314159 m!1202779))

(declare-fun m!1202781 () Bool)

(assert (=> b!1314162 m!1202781))

(check-sat (not mapNonEmpty!54976) (not b_next!29835) (not b!1314165) b_and!48043 (not b!1314162) (not start!111000) tp_is_empty!35565 (not b!1314159))
(check-sat b_and!48043 (not b_next!29835))
