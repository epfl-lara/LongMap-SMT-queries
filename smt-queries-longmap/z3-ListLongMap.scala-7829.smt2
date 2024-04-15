; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97712 () Bool)

(assert start!97712)

(declare-fun b!1117110 () Bool)

(declare-fun res!745993 () Bool)

(declare-fun e!636381 () Bool)

(assert (=> b!1117110 (=> (not res!745993) (not e!636381))))

(declare-datatypes ((array!72694 0))(
  ( (array!72695 (arr!35000 (Array (_ BitVec 32) (_ BitVec 64))) (size!35538 (_ BitVec 32))) )
))
(declare-fun lt!497057 () array!72694)

(declare-datatypes ((List!24421 0))(
  ( (Nil!24418) (Cons!24417 (h!25626 (_ BitVec 64)) (t!34893 List!24421)) )
))
(declare-fun arrayNoDuplicates!0 (array!72694 (_ BitVec 32) List!24421) Bool)

(assert (=> b!1117110 (= res!745993 (arrayNoDuplicates!0 lt!497057 #b00000000000000000000000000000000 Nil!24418))))

(declare-fun b!1117111 () Bool)

(declare-fun res!745989 () Bool)

(declare-fun e!636383 () Bool)

(assert (=> b!1117111 (=> (not res!745989) (not e!636383))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117111 (= res!745989 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43741 () Bool)

(declare-fun mapRes!43741 () Bool)

(declare-fun tp!82985 () Bool)

(declare-fun e!636379 () Bool)

(assert (=> mapNonEmpty!43741 (= mapRes!43741 (and tp!82985 e!636379))))

(declare-datatypes ((V!42393 0))(
  ( (V!42394 (val!14031 Int)) )
))
(declare-datatypes ((ValueCell!13265 0))(
  ( (ValueCellFull!13265 (v!16663 V!42393)) (EmptyCell!13265) )
))
(declare-fun mapValue!43741 () ValueCell!13265)

(declare-datatypes ((array!72696 0))(
  ( (array!72697 (arr!35001 (Array (_ BitVec 32) ValueCell!13265)) (size!35539 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72696)

(declare-fun mapKey!43741 () (_ BitVec 32))

(declare-fun mapRest!43741 () (Array (_ BitVec 32) ValueCell!13265))

(assert (=> mapNonEmpty!43741 (= (arr!35001 _values!996) (store mapRest!43741 mapKey!43741 mapValue!43741))))

(declare-fun mapIsEmpty!43741 () Bool)

(assert (=> mapIsEmpty!43741 mapRes!43741))

(declare-fun b!1117113 () Bool)

(declare-fun res!745985 () Bool)

(assert (=> b!1117113 (=> (not res!745985) (not e!636383))))

(declare-fun _keys!1208 () array!72694)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117113 (= res!745985 (= (select (arr!35000 _keys!1208) i!673) k0!934))))

(declare-fun b!1117114 () Bool)

(assert (=> b!1117114 (= e!636383 e!636381)))

(declare-fun res!745987 () Bool)

(assert (=> b!1117114 (=> (not res!745987) (not e!636381))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72694 (_ BitVec 32)) Bool)

(assert (=> b!1117114 (= res!745987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497057 mask!1564))))

(assert (=> b!1117114 (= lt!497057 (array!72695 (store (arr!35000 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35538 _keys!1208)))))

(declare-fun b!1117115 () Bool)

(declare-fun e!636382 () Bool)

(declare-fun tp_is_empty!27949 () Bool)

(assert (=> b!1117115 (= e!636382 tp_is_empty!27949)))

(declare-fun b!1117116 () Bool)

(assert (=> b!1117116 (= e!636381 (not true))))

(declare-fun arrayContainsKey!0 (array!72694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117116 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36491 0))(
  ( (Unit!36492) )
))
(declare-fun lt!497058 () Unit!36491)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72694 (_ BitVec 64) (_ BitVec 32)) Unit!36491)

(assert (=> b!1117116 (= lt!497058 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117117 () Bool)

(declare-fun res!745992 () Bool)

(assert (=> b!1117117 (=> (not res!745992) (not e!636383))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117117 (= res!745992 (and (= (size!35539 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35538 _keys!1208) (size!35539 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!745990 () Bool)

(assert (=> start!97712 (=> (not res!745990) (not e!636383))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97712 (= res!745990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35538 _keys!1208))))))

(assert (=> start!97712 e!636383))

(declare-fun array_inv!26970 (array!72694) Bool)

(assert (=> start!97712 (array_inv!26970 _keys!1208)))

(assert (=> start!97712 true))

(declare-fun e!636380 () Bool)

(declare-fun array_inv!26971 (array!72696) Bool)

(assert (=> start!97712 (and (array_inv!26971 _values!996) e!636380)))

(declare-fun b!1117112 () Bool)

(declare-fun res!745986 () Bool)

(assert (=> b!1117112 (=> (not res!745986) (not e!636383))))

(assert (=> b!1117112 (= res!745986 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24418))))

(declare-fun b!1117118 () Bool)

(declare-fun res!745991 () Bool)

(assert (=> b!1117118 (=> (not res!745991) (not e!636383))))

(assert (=> b!1117118 (= res!745991 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35538 _keys!1208))))))

(declare-fun b!1117119 () Bool)

(assert (=> b!1117119 (= e!636380 (and e!636382 mapRes!43741))))

(declare-fun condMapEmpty!43741 () Bool)

(declare-fun mapDefault!43741 () ValueCell!13265)

(assert (=> b!1117119 (= condMapEmpty!43741 (= (arr!35001 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13265)) mapDefault!43741)))))

(declare-fun b!1117120 () Bool)

(assert (=> b!1117120 (= e!636379 tp_is_empty!27949)))

(declare-fun b!1117121 () Bool)

(declare-fun res!745984 () Bool)

(assert (=> b!1117121 (=> (not res!745984) (not e!636383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117121 (= res!745984 (validMask!0 mask!1564))))

(declare-fun b!1117122 () Bool)

(declare-fun res!745988 () Bool)

(assert (=> b!1117122 (=> (not res!745988) (not e!636383))))

(assert (=> b!1117122 (= res!745988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97712 res!745990) b!1117121))

(assert (= (and b!1117121 res!745984) b!1117117))

(assert (= (and b!1117117 res!745992) b!1117122))

(assert (= (and b!1117122 res!745988) b!1117112))

(assert (= (and b!1117112 res!745986) b!1117118))

(assert (= (and b!1117118 res!745991) b!1117111))

(assert (= (and b!1117111 res!745989) b!1117113))

(assert (= (and b!1117113 res!745985) b!1117114))

(assert (= (and b!1117114 res!745987) b!1117110))

(assert (= (and b!1117110 res!745993) b!1117116))

(assert (= (and b!1117119 condMapEmpty!43741) mapIsEmpty!43741))

(assert (= (and b!1117119 (not condMapEmpty!43741)) mapNonEmpty!43741))

(get-info :version)

(assert (= (and mapNonEmpty!43741 ((_ is ValueCellFull!13265) mapValue!43741)) b!1117120))

(assert (= (and b!1117119 ((_ is ValueCellFull!13265) mapDefault!43741)) b!1117115))

(assert (= start!97712 b!1117119))

(declare-fun m!1032555 () Bool)

(assert (=> b!1117112 m!1032555))

(declare-fun m!1032557 () Bool)

(assert (=> mapNonEmpty!43741 m!1032557))

(declare-fun m!1032559 () Bool)

(assert (=> b!1117111 m!1032559))

(declare-fun m!1032561 () Bool)

(assert (=> b!1117116 m!1032561))

(declare-fun m!1032563 () Bool)

(assert (=> b!1117116 m!1032563))

(declare-fun m!1032565 () Bool)

(assert (=> b!1117114 m!1032565))

(declare-fun m!1032567 () Bool)

(assert (=> b!1117114 m!1032567))

(declare-fun m!1032569 () Bool)

(assert (=> b!1117121 m!1032569))

(declare-fun m!1032571 () Bool)

(assert (=> b!1117110 m!1032571))

(declare-fun m!1032573 () Bool)

(assert (=> b!1117122 m!1032573))

(declare-fun m!1032575 () Bool)

(assert (=> b!1117113 m!1032575))

(declare-fun m!1032577 () Bool)

(assert (=> start!97712 m!1032577))

(declare-fun m!1032579 () Bool)

(assert (=> start!97712 m!1032579))

(check-sat (not b!1117114) (not b!1117111) (not b!1117122) (not b!1117121) tp_is_empty!27949 (not start!97712) (not mapNonEmpty!43741) (not b!1117112) (not b!1117116) (not b!1117110))
(check-sat)
