; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111048 () Bool)

(assert start!111048)

(declare-fun b_free!29883 () Bool)

(declare-fun b_next!29883 () Bool)

(assert (=> start!111048 (= b_free!29883 (not b_next!29883))))

(declare-fun tp!104971 () Bool)

(declare-fun b_and!48091 () Bool)

(assert (=> start!111048 (= tp!104971 b_and!48091)))

(declare-fun mapNonEmpty!55048 () Bool)

(declare-fun mapRes!55048 () Bool)

(declare-fun tp!104970 () Bool)

(declare-fun e!749987 () Bool)

(assert (=> mapNonEmpty!55048 (= mapRes!55048 (and tp!104970 e!749987))))

(declare-datatypes ((V!52587 0))(
  ( (V!52588 (val!17881 Int)) )
))
(declare-datatypes ((ValueCell!16908 0))(
  ( (ValueCellFull!16908 (v!20508 V!52587)) (EmptyCell!16908) )
))
(declare-fun mapRest!55048 () (Array (_ BitVec 32) ValueCell!16908))

(declare-datatypes ((array!88194 0))(
  ( (array!88195 (arr!42577 (Array (_ BitVec 32) ValueCell!16908)) (size!43127 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88194)

(declare-fun mapValue!55048 () ValueCell!16908)

(declare-fun mapKey!55048 () (_ BitVec 32))

(assert (=> mapNonEmpty!55048 (= (arr!42577 _values!1354) (store mapRest!55048 mapKey!55048 mapValue!55048))))

(declare-fun b!1314770 () Bool)

(declare-fun res!872841 () Bool)

(declare-fun e!749986 () Bool)

(assert (=> b!1314770 (=> (not res!872841) (not e!749986))))

(declare-datatypes ((array!88196 0))(
  ( (array!88197 (arr!42578 (Array (_ BitVec 32) (_ BitVec 64))) (size!43128 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88196)

(declare-datatypes ((List!30198 0))(
  ( (Nil!30195) (Cons!30194 (h!31403 (_ BitVec 64)) (t!43804 List!30198)) )
))
(declare-fun arrayNoDuplicates!0 (array!88196 (_ BitVec 32) List!30198) Bool)

(assert (=> b!1314770 (= res!872841 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30195))))

(declare-fun b!1314771 () Bool)

(declare-fun res!872843 () Bool)

(assert (=> b!1314771 (=> (not res!872843) (not e!749986))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88196 (_ BitVec 32)) Bool)

(assert (=> b!1314771 (= res!872843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314773 () Bool)

(declare-fun tp_is_empty!35613 () Bool)

(assert (=> b!1314773 (= e!749987 tp_is_empty!35613)))

(declare-fun b!1314774 () Bool)

(declare-fun res!872842 () Bool)

(assert (=> b!1314774 (=> (not res!872842) (not e!749986))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314774 (= res!872842 (and (= (size!43127 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43128 _keys!1628) (size!43127 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314775 () Bool)

(declare-fun res!872844 () Bool)

(assert (=> b!1314775 (=> (not res!872844) (not e!749986))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314775 (= res!872844 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43128 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55048 () Bool)

(assert (=> mapIsEmpty!55048 mapRes!55048))

(declare-fun b!1314772 () Bool)

(declare-fun e!749983 () Bool)

(assert (=> b!1314772 (= e!749983 tp_is_empty!35613)))

(declare-fun res!872840 () Bool)

(assert (=> start!111048 (=> (not res!872840) (not e!749986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111048 (= res!872840 (validMask!0 mask!2040))))

(assert (=> start!111048 e!749986))

(assert (=> start!111048 tp!104971))

(declare-fun array_inv!32153 (array!88196) Bool)

(assert (=> start!111048 (array_inv!32153 _keys!1628)))

(assert (=> start!111048 true))

(assert (=> start!111048 tp_is_empty!35613))

(declare-fun e!749984 () Bool)

(declare-fun array_inv!32154 (array!88194) Bool)

(assert (=> start!111048 (and (array_inv!32154 _values!1354) e!749984)))

(declare-fun b!1314776 () Bool)

(assert (=> b!1314776 (= e!749984 (and e!749983 mapRes!55048))))

(declare-fun condMapEmpty!55048 () Bool)

(declare-fun mapDefault!55048 () ValueCell!16908)

(assert (=> b!1314776 (= condMapEmpty!55048 (= (arr!42577 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16908)) mapDefault!55048)))))

(declare-fun b!1314777 () Bool)

(assert (=> b!1314777 (= e!749986 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52587)

(declare-fun zeroValue!1296 () V!52587)

(declare-fun lt!585834 () Bool)

(declare-datatypes ((tuple2!23062 0))(
  ( (tuple2!23063 (_1!11542 (_ BitVec 64)) (_2!11542 V!52587)) )
))
(declare-datatypes ((List!30199 0))(
  ( (Nil!30196) (Cons!30195 (h!31404 tuple2!23062) (t!43805 List!30199)) )
))
(declare-datatypes ((ListLongMap!20719 0))(
  ( (ListLongMap!20720 (toList!10375 List!30199)) )
))
(declare-fun contains!8525 (ListLongMap!20719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5388 (array!88196 array!88194 (_ BitVec 32) (_ BitVec 32) V!52587 V!52587 (_ BitVec 32) Int) ListLongMap!20719)

(assert (=> b!1314777 (= lt!585834 (contains!8525 (getCurrentListMap!5388 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!111048 res!872840) b!1314774))

(assert (= (and b!1314774 res!872842) b!1314771))

(assert (= (and b!1314771 res!872843) b!1314770))

(assert (= (and b!1314770 res!872841) b!1314775))

(assert (= (and b!1314775 res!872844) b!1314777))

(assert (= (and b!1314776 condMapEmpty!55048) mapIsEmpty!55048))

(assert (= (and b!1314776 (not condMapEmpty!55048)) mapNonEmpty!55048))

(get-info :version)

(assert (= (and mapNonEmpty!55048 ((_ is ValueCellFull!16908) mapValue!55048)) b!1314773))

(assert (= (and b!1314776 ((_ is ValueCellFull!16908) mapDefault!55048)) b!1314772))

(assert (= start!111048 b!1314776))

(declare-fun m!1203181 () Bool)

(assert (=> b!1314770 m!1203181))

(declare-fun m!1203183 () Bool)

(assert (=> mapNonEmpty!55048 m!1203183))

(declare-fun m!1203185 () Bool)

(assert (=> b!1314777 m!1203185))

(assert (=> b!1314777 m!1203185))

(declare-fun m!1203187 () Bool)

(assert (=> b!1314777 m!1203187))

(declare-fun m!1203189 () Bool)

(assert (=> b!1314771 m!1203189))

(declare-fun m!1203191 () Bool)

(assert (=> start!111048 m!1203191))

(declare-fun m!1203193 () Bool)

(assert (=> start!111048 m!1203193))

(declare-fun m!1203195 () Bool)

(assert (=> start!111048 m!1203195))

(check-sat (not b!1314771) (not b!1314777) (not b_next!29883) (not start!111048) b_and!48091 (not mapNonEmpty!55048) (not b!1314770) tp_is_empty!35613)
(check-sat b_and!48091 (not b_next!29883))
