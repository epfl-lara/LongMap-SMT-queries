; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111162 () Bool)

(assert start!111162)

(declare-fun b_free!29773 () Bool)

(declare-fun b_next!29773 () Bool)

(assert (=> start!111162 (= b_free!29773 (not b_next!29773))))

(declare-fun tp!104640 () Bool)

(declare-fun b_and!47983 () Bool)

(assert (=> start!111162 (= tp!104640 b_and!47983)))

(declare-fun mapIsEmpty!54883 () Bool)

(declare-fun mapRes!54883 () Bool)

(assert (=> mapIsEmpty!54883 mapRes!54883))

(declare-fun b!1314713 () Bool)

(declare-fun res!872501 () Bool)

(declare-fun e!750004 () Bool)

(assert (=> b!1314713 (=> (not res!872501) (not e!750004))))

(declare-datatypes ((array!88035 0))(
  ( (array!88036 (arr!42493 (Array (_ BitVec 32) (_ BitVec 64))) (size!43044 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88035)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314713 (= res!872501 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43044 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314714 () Bool)

(declare-fun res!872500 () Bool)

(assert (=> b!1314714 (=> (not res!872500) (not e!750004))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88035 (_ BitVec 32)) Bool)

(assert (=> b!1314714 (= res!872500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314715 () Bool)

(declare-fun res!872499 () Bool)

(assert (=> b!1314715 (=> (not res!872499) (not e!750004))))

(declare-datatypes ((List!30164 0))(
  ( (Nil!30161) (Cons!30160 (h!31378 (_ BitVec 64)) (t!43762 List!30164)) )
))
(declare-fun arrayNoDuplicates!0 (array!88035 (_ BitVec 32) List!30164) Bool)

(assert (=> b!1314715 (= res!872499 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30161))))

(declare-fun b!1314716 () Bool)

(assert (=> b!1314716 (= e!750004 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586145 () Bool)

(declare-datatypes ((V!52441 0))(
  ( (V!52442 (val!17826 Int)) )
))
(declare-fun minValue!1296 () V!52441)

(declare-datatypes ((ValueCell!16853 0))(
  ( (ValueCellFull!16853 (v!20448 V!52441)) (EmptyCell!16853) )
))
(declare-datatypes ((array!88037 0))(
  ( (array!88038 (arr!42494 (Array (_ BitVec 32) ValueCell!16853)) (size!43045 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88037)

(declare-fun zeroValue!1296 () V!52441)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23014 0))(
  ( (tuple2!23015 (_1!11518 (_ BitVec 64)) (_2!11518 V!52441)) )
))
(declare-datatypes ((List!30165 0))(
  ( (Nil!30162) (Cons!30161 (h!31379 tuple2!23014) (t!43763 List!30165)) )
))
(declare-datatypes ((ListLongMap!20679 0))(
  ( (ListLongMap!20680 (toList!10355 List!30165)) )
))
(declare-fun contains!8517 (ListLongMap!20679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5359 (array!88035 array!88037 (_ BitVec 32) (_ BitVec 32) V!52441 V!52441 (_ BitVec 32) Int) ListLongMap!20679)

(assert (=> b!1314716 (= lt!586145 (contains!8517 (getCurrentListMap!5359 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54883 () Bool)

(declare-fun tp!104641 () Bool)

(declare-fun e!750003 () Bool)

(assert (=> mapNonEmpty!54883 (= mapRes!54883 (and tp!104641 e!750003))))

(declare-fun mapKey!54883 () (_ BitVec 32))

(declare-fun mapValue!54883 () ValueCell!16853)

(declare-fun mapRest!54883 () (Array (_ BitVec 32) ValueCell!16853))

(assert (=> mapNonEmpty!54883 (= (arr!42494 _values!1354) (store mapRest!54883 mapKey!54883 mapValue!54883))))

(declare-fun b!1314718 () Bool)

(declare-fun res!872497 () Bool)

(assert (=> b!1314718 (=> (not res!872497) (not e!750004))))

(assert (=> b!1314718 (= res!872497 (and (= (size!43045 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43044 _keys!1628) (size!43045 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314717 () Bool)

(declare-fun e!750001 () Bool)

(declare-fun tp_is_empty!35503 () Bool)

(assert (=> b!1314717 (= e!750001 tp_is_empty!35503)))

(declare-fun res!872498 () Bool)

(assert (=> start!111162 (=> (not res!872498) (not e!750004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111162 (= res!872498 (validMask!0 mask!2040))))

(assert (=> start!111162 e!750004))

(assert (=> start!111162 tp!104640))

(declare-fun array_inv!32359 (array!88035) Bool)

(assert (=> start!111162 (array_inv!32359 _keys!1628)))

(assert (=> start!111162 true))

(assert (=> start!111162 tp_is_empty!35503))

(declare-fun e!750002 () Bool)

(declare-fun array_inv!32360 (array!88037) Bool)

(assert (=> start!111162 (and (array_inv!32360 _values!1354) e!750002)))

(declare-fun b!1314719 () Bool)

(assert (=> b!1314719 (= e!750002 (and e!750001 mapRes!54883))))

(declare-fun condMapEmpty!54883 () Bool)

(declare-fun mapDefault!54883 () ValueCell!16853)

(assert (=> b!1314719 (= condMapEmpty!54883 (= (arr!42494 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16853)) mapDefault!54883)))))

(declare-fun b!1314720 () Bool)

(assert (=> b!1314720 (= e!750003 tp_is_empty!35503)))

(assert (= (and start!111162 res!872498) b!1314718))

(assert (= (and b!1314718 res!872497) b!1314714))

(assert (= (and b!1314714 res!872500) b!1314715))

(assert (= (and b!1314715 res!872499) b!1314713))

(assert (= (and b!1314713 res!872501) b!1314716))

(assert (= (and b!1314719 condMapEmpty!54883) mapIsEmpty!54883))

(assert (= (and b!1314719 (not condMapEmpty!54883)) mapNonEmpty!54883))

(get-info :version)

(assert (= (and mapNonEmpty!54883 ((_ is ValueCellFull!16853) mapValue!54883)) b!1314720))

(assert (= (and b!1314719 ((_ is ValueCellFull!16853) mapDefault!54883)) b!1314717))

(assert (= start!111162 b!1314719))

(declare-fun m!1203869 () Bool)

(assert (=> b!1314715 m!1203869))

(declare-fun m!1203871 () Bool)

(assert (=> mapNonEmpty!54883 m!1203871))

(declare-fun m!1203873 () Bool)

(assert (=> b!1314716 m!1203873))

(assert (=> b!1314716 m!1203873))

(declare-fun m!1203875 () Bool)

(assert (=> b!1314716 m!1203875))

(declare-fun m!1203877 () Bool)

(assert (=> start!111162 m!1203877))

(declare-fun m!1203879 () Bool)

(assert (=> start!111162 m!1203879))

(declare-fun m!1203881 () Bool)

(assert (=> start!111162 m!1203881))

(declare-fun m!1203883 () Bool)

(assert (=> b!1314714 m!1203883))

(check-sat (not start!111162) (not b!1314716) (not b!1314714) (not b!1314715) b_and!47983 (not b_next!29773) tp_is_empty!35503 (not mapNonEmpty!54883))
(check-sat b_and!47983 (not b_next!29773))
