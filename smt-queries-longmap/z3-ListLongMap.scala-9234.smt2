; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110976 () Bool)

(assert start!110976)

(declare-fun b_free!29587 () Bool)

(declare-fun b_next!29587 () Bool)

(assert (=> start!110976 (= b_free!29587 (not b_next!29587))))

(declare-fun tp!104083 () Bool)

(declare-fun b_and!47797 () Bool)

(assert (=> start!110976 (= tp!104083 b_and!47797)))

(declare-fun b!1312130 () Bool)

(declare-fun e!748610 () Bool)

(assert (=> b!1312130 (= e!748610 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87681 0))(
  ( (array!87682 (arr!42316 (Array (_ BitVec 32) (_ BitVec 64))) (size!42867 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87681)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52193 0))(
  ( (V!52194 (val!17733 Int)) )
))
(declare-fun minValue!1296 () V!52193)

(declare-datatypes ((ValueCell!16760 0))(
  ( (ValueCellFull!16760 (v!20355 V!52193)) (EmptyCell!16760) )
))
(declare-datatypes ((array!87683 0))(
  ( (array!87684 (arr!42317 (Array (_ BitVec 32) ValueCell!16760)) (size!42868 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87683)

(declare-fun zeroValue!1296 () V!52193)

(declare-fun lt!585875 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22890 0))(
  ( (tuple2!22891 (_1!11456 (_ BitVec 64)) (_2!11456 V!52193)) )
))
(declare-datatypes ((List!30043 0))(
  ( (Nil!30040) (Cons!30039 (h!31257 tuple2!22890) (t!43641 List!30043)) )
))
(declare-datatypes ((ListLongMap!20555 0))(
  ( (ListLongMap!20556 (toList!10293 List!30043)) )
))
(declare-fun contains!8455 (ListLongMap!20555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5297 (array!87681 array!87683 (_ BitVec 32) (_ BitVec 32) V!52193 V!52193 (_ BitVec 32) Int) ListLongMap!20555)

(assert (=> b!1312130 (= lt!585875 (contains!8455 (getCurrentListMap!5297 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312131 () Bool)

(declare-fun e!748606 () Bool)

(declare-fun tp_is_empty!35317 () Bool)

(assert (=> b!1312131 (= e!748606 tp_is_empty!35317)))

(declare-fun b!1312132 () Bool)

(declare-fun res!870755 () Bool)

(assert (=> b!1312132 (=> (not res!870755) (not e!748610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87681 (_ BitVec 32)) Bool)

(assert (=> b!1312132 (= res!870755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870754 () Bool)

(assert (=> start!110976 (=> (not res!870754) (not e!748610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110976 (= res!870754 (validMask!0 mask!2040))))

(assert (=> start!110976 e!748610))

(assert (=> start!110976 tp!104083))

(declare-fun array_inv!32247 (array!87681) Bool)

(assert (=> start!110976 (array_inv!32247 _keys!1628)))

(assert (=> start!110976 true))

(assert (=> start!110976 tp_is_empty!35317))

(declare-fun e!748608 () Bool)

(declare-fun array_inv!32248 (array!87683) Bool)

(assert (=> start!110976 (and (array_inv!32248 _values!1354) e!748608)))

(declare-fun b!1312133 () Bool)

(declare-fun e!748609 () Bool)

(assert (=> b!1312133 (= e!748609 tp_is_empty!35317)))

(declare-fun b!1312134 () Bool)

(declare-fun res!870751 () Bool)

(assert (=> b!1312134 (=> (not res!870751) (not e!748610))))

(declare-datatypes ((List!30044 0))(
  ( (Nil!30041) (Cons!30040 (h!31258 (_ BitVec 64)) (t!43642 List!30044)) )
))
(declare-fun arrayNoDuplicates!0 (array!87681 (_ BitVec 32) List!30044) Bool)

(assert (=> b!1312134 (= res!870751 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30041))))

(declare-fun b!1312135 () Bool)

(declare-fun res!870753 () Bool)

(assert (=> b!1312135 (=> (not res!870753) (not e!748610))))

(assert (=> b!1312135 (= res!870753 (and (= (size!42868 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42867 _keys!1628) (size!42868 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54604 () Bool)

(declare-fun mapRes!54604 () Bool)

(assert (=> mapIsEmpty!54604 mapRes!54604))

(declare-fun b!1312136 () Bool)

(assert (=> b!1312136 (= e!748608 (and e!748609 mapRes!54604))))

(declare-fun condMapEmpty!54604 () Bool)

(declare-fun mapDefault!54604 () ValueCell!16760)

(assert (=> b!1312136 (= condMapEmpty!54604 (= (arr!42317 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16760)) mapDefault!54604)))))

(declare-fun b!1312137 () Bool)

(declare-fun res!870752 () Bool)

(assert (=> b!1312137 (=> (not res!870752) (not e!748610))))

(assert (=> b!1312137 (= res!870752 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42867 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54604 () Bool)

(declare-fun tp!104082 () Bool)

(assert (=> mapNonEmpty!54604 (= mapRes!54604 (and tp!104082 e!748606))))

(declare-fun mapValue!54604 () ValueCell!16760)

(declare-fun mapRest!54604 () (Array (_ BitVec 32) ValueCell!16760))

(declare-fun mapKey!54604 () (_ BitVec 32))

(assert (=> mapNonEmpty!54604 (= (arr!42317 _values!1354) (store mapRest!54604 mapKey!54604 mapValue!54604))))

(assert (= (and start!110976 res!870754) b!1312135))

(assert (= (and b!1312135 res!870753) b!1312132))

(assert (= (and b!1312132 res!870755) b!1312134))

(assert (= (and b!1312134 res!870751) b!1312137))

(assert (= (and b!1312137 res!870752) b!1312130))

(assert (= (and b!1312136 condMapEmpty!54604) mapIsEmpty!54604))

(assert (= (and b!1312136 (not condMapEmpty!54604)) mapNonEmpty!54604))

(get-info :version)

(assert (= (and mapNonEmpty!54604 ((_ is ValueCellFull!16760) mapValue!54604)) b!1312131))

(assert (= (and b!1312136 ((_ is ValueCellFull!16760) mapDefault!54604)) b!1312133))

(assert (= start!110976 b!1312136))

(declare-fun m!1202099 () Bool)

(assert (=> b!1312132 m!1202099))

(declare-fun m!1202101 () Bool)

(assert (=> mapNonEmpty!54604 m!1202101))

(declare-fun m!1202103 () Bool)

(assert (=> b!1312130 m!1202103))

(assert (=> b!1312130 m!1202103))

(declare-fun m!1202105 () Bool)

(assert (=> b!1312130 m!1202105))

(declare-fun m!1202107 () Bool)

(assert (=> start!110976 m!1202107))

(declare-fun m!1202109 () Bool)

(assert (=> start!110976 m!1202109))

(declare-fun m!1202111 () Bool)

(assert (=> start!110976 m!1202111))

(declare-fun m!1202113 () Bool)

(assert (=> b!1312134 m!1202113))

(check-sat (not b_next!29587) (not b!1312134) (not b!1312132) (not mapNonEmpty!54604) (not b!1312130) tp_is_empty!35317 (not start!110976) b_and!47797)
(check-sat b_and!47797 (not b_next!29587))
