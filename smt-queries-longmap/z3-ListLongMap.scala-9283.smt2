; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111046 () Bool)

(assert start!111046)

(declare-fun b_free!29881 () Bool)

(declare-fun b_next!29881 () Bool)

(assert (=> start!111046 (= b_free!29881 (not b_next!29881))))

(declare-fun tp!104966 () Bool)

(declare-fun b_and!48071 () Bool)

(assert (=> start!111046 (= tp!104966 b_and!48071)))

(declare-fun b!1314676 () Bool)

(declare-fun e!749936 () Bool)

(assert (=> b!1314676 (= e!749936 false)))

(declare-fun lt!585645 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88097 0))(
  ( (array!88098 (arr!42529 (Array (_ BitVec 32) (_ BitVec 64))) (size!43081 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88097)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52585 0))(
  ( (V!52586 (val!17880 Int)) )
))
(declare-fun minValue!1296 () V!52585)

(declare-datatypes ((ValueCell!16907 0))(
  ( (ValueCellFull!16907 (v!20506 V!52585)) (EmptyCell!16907) )
))
(declare-datatypes ((array!88099 0))(
  ( (array!88100 (arr!42530 (Array (_ BitVec 32) ValueCell!16907)) (size!43082 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88099)

(declare-fun zeroValue!1296 () V!52585)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23150 0))(
  ( (tuple2!23151 (_1!11586 (_ BitVec 64)) (_2!11586 V!52585)) )
))
(declare-datatypes ((List!30264 0))(
  ( (Nil!30261) (Cons!30260 (h!31469 tuple2!23150) (t!43862 List!30264)) )
))
(declare-datatypes ((ListLongMap!20807 0))(
  ( (ListLongMap!20808 (toList!10419 List!30264)) )
))
(declare-fun contains!8496 (ListLongMap!20807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5314 (array!88097 array!88099 (_ BitVec 32) (_ BitVec 32) V!52585 V!52585 (_ BitVec 32) Int) ListLongMap!20807)

(assert (=> b!1314676 (= lt!585645 (contains!8496 (getCurrentListMap!5314 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314677 () Bool)

(declare-fun res!872799 () Bool)

(assert (=> b!1314677 (=> (not res!872799) (not e!749936))))

(assert (=> b!1314677 (= res!872799 (and (= (size!43082 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43081 _keys!1628) (size!43082 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314678 () Bool)

(declare-fun e!749939 () Bool)

(declare-fun tp_is_empty!35611 () Bool)

(assert (=> b!1314678 (= e!749939 tp_is_empty!35611)))

(declare-fun mapIsEmpty!55045 () Bool)

(declare-fun mapRes!55045 () Bool)

(assert (=> mapIsEmpty!55045 mapRes!55045))

(declare-fun mapNonEmpty!55045 () Bool)

(declare-fun tp!104965 () Bool)

(assert (=> mapNonEmpty!55045 (= mapRes!55045 (and tp!104965 e!749939))))

(declare-fun mapKey!55045 () (_ BitVec 32))

(declare-fun mapRest!55045 () (Array (_ BitVec 32) ValueCell!16907))

(declare-fun mapValue!55045 () ValueCell!16907)

(assert (=> mapNonEmpty!55045 (= (arr!42530 _values!1354) (store mapRest!55045 mapKey!55045 mapValue!55045))))

(declare-fun res!872798 () Bool)

(assert (=> start!111046 (=> (not res!872798) (not e!749936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111046 (= res!872798 (validMask!0 mask!2040))))

(assert (=> start!111046 e!749936))

(assert (=> start!111046 tp!104966))

(declare-fun array_inv!32309 (array!88097) Bool)

(assert (=> start!111046 (array_inv!32309 _keys!1628)))

(assert (=> start!111046 true))

(assert (=> start!111046 tp_is_empty!35611))

(declare-fun e!749935 () Bool)

(declare-fun array_inv!32310 (array!88099) Bool)

(assert (=> start!111046 (and (array_inv!32310 _values!1354) e!749935)))

(declare-fun b!1314679 () Bool)

(declare-fun res!872800 () Bool)

(assert (=> b!1314679 (=> (not res!872800) (not e!749936))))

(declare-datatypes ((List!30265 0))(
  ( (Nil!30262) (Cons!30261 (h!31470 (_ BitVec 64)) (t!43863 List!30265)) )
))
(declare-fun arrayNoDuplicates!0 (array!88097 (_ BitVec 32) List!30265) Bool)

(assert (=> b!1314679 (= res!872800 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30262))))

(declare-fun b!1314680 () Bool)

(declare-fun e!749938 () Bool)

(assert (=> b!1314680 (= e!749935 (and e!749938 mapRes!55045))))

(declare-fun condMapEmpty!55045 () Bool)

(declare-fun mapDefault!55045 () ValueCell!16907)

(assert (=> b!1314680 (= condMapEmpty!55045 (= (arr!42530 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16907)) mapDefault!55045)))))

(declare-fun b!1314681 () Bool)

(declare-fun res!872796 () Bool)

(assert (=> b!1314681 (=> (not res!872796) (not e!749936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88097 (_ BitVec 32)) Bool)

(assert (=> b!1314681 (= res!872796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314682 () Bool)

(declare-fun res!872797 () Bool)

(assert (=> b!1314682 (=> (not res!872797) (not e!749936))))

(assert (=> b!1314682 (= res!872797 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43081 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314683 () Bool)

(assert (=> b!1314683 (= e!749938 tp_is_empty!35611)))

(assert (= (and start!111046 res!872798) b!1314677))

(assert (= (and b!1314677 res!872799) b!1314681))

(assert (= (and b!1314681 res!872796) b!1314679))

(assert (= (and b!1314679 res!872800) b!1314682))

(assert (= (and b!1314682 res!872797) b!1314676))

(assert (= (and b!1314680 condMapEmpty!55045) mapIsEmpty!55045))

(assert (= (and b!1314680 (not condMapEmpty!55045)) mapNonEmpty!55045))

(get-info :version)

(assert (= (and mapNonEmpty!55045 ((_ is ValueCellFull!16907) mapValue!55045)) b!1314678))

(assert (= (and b!1314680 ((_ is ValueCellFull!16907) mapDefault!55045)) b!1314683))

(assert (= start!111046 b!1314680))

(declare-fun m!1202649 () Bool)

(assert (=> b!1314681 m!1202649))

(declare-fun m!1202651 () Bool)

(assert (=> b!1314676 m!1202651))

(assert (=> b!1314676 m!1202651))

(declare-fun m!1202653 () Bool)

(assert (=> b!1314676 m!1202653))

(declare-fun m!1202655 () Bool)

(assert (=> mapNonEmpty!55045 m!1202655))

(declare-fun m!1202657 () Bool)

(assert (=> b!1314679 m!1202657))

(declare-fun m!1202659 () Bool)

(assert (=> start!111046 m!1202659))

(declare-fun m!1202661 () Bool)

(assert (=> start!111046 m!1202661))

(declare-fun m!1202663 () Bool)

(assert (=> start!111046 m!1202663))

(check-sat tp_is_empty!35611 (not mapNonEmpty!55045) b_and!48071 (not b_next!29881) (not b!1314676) (not start!111046) (not b!1314679) (not b!1314681))
(check-sat b_and!48071 (not b_next!29881))
