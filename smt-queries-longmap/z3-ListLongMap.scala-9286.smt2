; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111064 () Bool)

(assert start!111064)

(declare-fun b_free!29899 () Bool)

(declare-fun b_next!29899 () Bool)

(assert (=> start!111064 (= b_free!29899 (not b_next!29899))))

(declare-fun tp!105019 () Bool)

(declare-fun b_and!48089 () Bool)

(assert (=> start!111064 (= tp!105019 b_and!48089)))

(declare-fun b!1314892 () Bool)

(declare-fun res!872931 () Bool)

(declare-fun e!750071 () Bool)

(assert (=> b!1314892 (=> (not res!872931) (not e!750071))))

(declare-datatypes ((array!88131 0))(
  ( (array!88132 (arr!42546 (Array (_ BitVec 32) (_ BitVec 64))) (size!43098 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88131)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88131 (_ BitVec 32)) Bool)

(assert (=> b!1314892 (= res!872931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55072 () Bool)

(declare-fun mapRes!55072 () Bool)

(declare-fun tp!105020 () Bool)

(declare-fun e!750074 () Bool)

(assert (=> mapNonEmpty!55072 (= mapRes!55072 (and tp!105020 e!750074))))

(declare-fun mapKey!55072 () (_ BitVec 32))

(declare-datatypes ((V!52609 0))(
  ( (V!52610 (val!17889 Int)) )
))
(declare-datatypes ((ValueCell!16916 0))(
  ( (ValueCellFull!16916 (v!20515 V!52609)) (EmptyCell!16916) )
))
(declare-fun mapValue!55072 () ValueCell!16916)

(declare-fun mapRest!55072 () (Array (_ BitVec 32) ValueCell!16916))

(declare-datatypes ((array!88133 0))(
  ( (array!88134 (arr!42547 (Array (_ BitVec 32) ValueCell!16916)) (size!43099 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88133)

(assert (=> mapNonEmpty!55072 (= (arr!42547 _values!1354) (store mapRest!55072 mapKey!55072 mapValue!55072))))

(declare-fun b!1314893 () Bool)

(declare-fun res!872935 () Bool)

(assert (=> b!1314893 (=> (not res!872935) (not e!750071))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314893 (= res!872935 (and (= (size!43099 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43098 _keys!1628) (size!43099 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314894 () Bool)

(assert (=> b!1314894 (= e!750071 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52609)

(declare-fun zeroValue!1296 () V!52609)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585672 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!23160 0))(
  ( (tuple2!23161 (_1!11591 (_ BitVec 64)) (_2!11591 V!52609)) )
))
(declare-datatypes ((List!30274 0))(
  ( (Nil!30271) (Cons!30270 (h!31479 tuple2!23160) (t!43872 List!30274)) )
))
(declare-datatypes ((ListLongMap!20817 0))(
  ( (ListLongMap!20818 (toList!10424 List!30274)) )
))
(declare-fun contains!8501 (ListLongMap!20817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5319 (array!88131 array!88133 (_ BitVec 32) (_ BitVec 32) V!52609 V!52609 (_ BitVec 32) Int) ListLongMap!20817)

(assert (=> b!1314894 (= lt!585672 (contains!8501 (getCurrentListMap!5319 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!872934 () Bool)

(assert (=> start!111064 (=> (not res!872934) (not e!750071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111064 (= res!872934 (validMask!0 mask!2040))))

(assert (=> start!111064 e!750071))

(assert (=> start!111064 tp!105019))

(declare-fun array_inv!32321 (array!88131) Bool)

(assert (=> start!111064 (array_inv!32321 _keys!1628)))

(assert (=> start!111064 true))

(declare-fun tp_is_empty!35629 () Bool)

(assert (=> start!111064 tp_is_empty!35629))

(declare-fun e!750072 () Bool)

(declare-fun array_inv!32322 (array!88133) Bool)

(assert (=> start!111064 (and (array_inv!32322 _values!1354) e!750072)))

(declare-fun b!1314895 () Bool)

(declare-fun e!750070 () Bool)

(assert (=> b!1314895 (= e!750072 (and e!750070 mapRes!55072))))

(declare-fun condMapEmpty!55072 () Bool)

(declare-fun mapDefault!55072 () ValueCell!16916)

(assert (=> b!1314895 (= condMapEmpty!55072 (= (arr!42547 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16916)) mapDefault!55072)))))

(declare-fun mapIsEmpty!55072 () Bool)

(assert (=> mapIsEmpty!55072 mapRes!55072))

(declare-fun b!1314896 () Bool)

(declare-fun res!872933 () Bool)

(assert (=> b!1314896 (=> (not res!872933) (not e!750071))))

(declare-datatypes ((List!30275 0))(
  ( (Nil!30272) (Cons!30271 (h!31480 (_ BitVec 64)) (t!43873 List!30275)) )
))
(declare-fun arrayNoDuplicates!0 (array!88131 (_ BitVec 32) List!30275) Bool)

(assert (=> b!1314896 (= res!872933 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30272))))

(declare-fun b!1314897 () Bool)

(assert (=> b!1314897 (= e!750070 tp_is_empty!35629)))

(declare-fun b!1314898 () Bool)

(assert (=> b!1314898 (= e!750074 tp_is_empty!35629)))

(declare-fun b!1314899 () Bool)

(declare-fun res!872932 () Bool)

(assert (=> b!1314899 (=> (not res!872932) (not e!750071))))

(assert (=> b!1314899 (= res!872932 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43098 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111064 res!872934) b!1314893))

(assert (= (and b!1314893 res!872935) b!1314892))

(assert (= (and b!1314892 res!872931) b!1314896))

(assert (= (and b!1314896 res!872933) b!1314899))

(assert (= (and b!1314899 res!872932) b!1314894))

(assert (= (and b!1314895 condMapEmpty!55072) mapIsEmpty!55072))

(assert (= (and b!1314895 (not condMapEmpty!55072)) mapNonEmpty!55072))

(get-info :version)

(assert (= (and mapNonEmpty!55072 ((_ is ValueCellFull!16916) mapValue!55072)) b!1314898))

(assert (= (and b!1314895 ((_ is ValueCellFull!16916) mapDefault!55072)) b!1314897))

(assert (= start!111064 b!1314895))

(declare-fun m!1202793 () Bool)

(assert (=> start!111064 m!1202793))

(declare-fun m!1202795 () Bool)

(assert (=> start!111064 m!1202795))

(declare-fun m!1202797 () Bool)

(assert (=> start!111064 m!1202797))

(declare-fun m!1202799 () Bool)

(assert (=> b!1314894 m!1202799))

(assert (=> b!1314894 m!1202799))

(declare-fun m!1202801 () Bool)

(assert (=> b!1314894 m!1202801))

(declare-fun m!1202803 () Bool)

(assert (=> mapNonEmpty!55072 m!1202803))

(declare-fun m!1202805 () Bool)

(assert (=> b!1314892 m!1202805))

(declare-fun m!1202807 () Bool)

(assert (=> b!1314896 m!1202807))

(check-sat tp_is_empty!35629 (not b!1314892) (not b!1314896) (not mapNonEmpty!55072) (not start!111064) (not b!1314894) b_and!48089 (not b_next!29899))
(check-sat b_and!48089 (not b_next!29899))
