; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97362 () Bool)

(assert start!97362)

(declare-fun b!1106067 () Bool)

(declare-fun res!737595 () Bool)

(declare-fun e!631426 () Bool)

(assert (=> b!1106067 (=> (not res!737595) (not e!631426))))

(declare-datatypes ((array!71703 0))(
  ( (array!71704 (arr!34499 (Array (_ BitVec 32) (_ BitVec 64))) (size!35036 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71703)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71703 (_ BitVec 32)) Bool)

(assert (=> b!1106067 (= res!737595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!737597 () Bool)

(assert (=> start!97362 (=> (not res!737597) (not e!631426))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97362 (= res!737597 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35036 _keys!1208))))))

(assert (=> start!97362 e!631426))

(declare-fun array_inv!26596 (array!71703) Bool)

(assert (=> start!97362 (array_inv!26596 _keys!1208)))

(assert (=> start!97362 true))

(declare-datatypes ((V!41625 0))(
  ( (V!41626 (val!13743 Int)) )
))
(declare-datatypes ((ValueCell!12977 0))(
  ( (ValueCellFull!12977 (v!16372 V!41625)) (EmptyCell!12977) )
))
(declare-datatypes ((array!71705 0))(
  ( (array!71706 (arr!34500 (Array (_ BitVec 32) ValueCell!12977)) (size!35037 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71705)

(declare-fun e!631429 () Bool)

(declare-fun array_inv!26597 (array!71705) Bool)

(assert (=> start!97362 (and (array_inv!26597 _values!996) e!631429)))

(declare-fun b!1106068 () Bool)

(declare-fun res!737592 () Bool)

(assert (=> b!1106068 (=> (not res!737592) (not e!631426))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106068 (= res!737592 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35036 _keys!1208))))))

(declare-fun b!1106069 () Bool)

(declare-fun res!737599 () Bool)

(assert (=> b!1106069 (=> (not res!737599) (not e!631426))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106069 (= res!737599 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42874 () Bool)

(declare-fun mapRes!42874 () Bool)

(declare-fun tp!81794 () Bool)

(declare-fun e!631428 () Bool)

(assert (=> mapNonEmpty!42874 (= mapRes!42874 (and tp!81794 e!631428))))

(declare-fun mapValue!42874 () ValueCell!12977)

(declare-fun mapRest!42874 () (Array (_ BitVec 32) ValueCell!12977))

(declare-fun mapKey!42874 () (_ BitVec 32))

(assert (=> mapNonEmpty!42874 (= (arr!34500 _values!996) (store mapRest!42874 mapKey!42874 mapValue!42874))))

(declare-fun mapIsEmpty!42874 () Bool)

(assert (=> mapIsEmpty!42874 mapRes!42874))

(declare-fun b!1106070 () Bool)

(declare-fun e!631427 () Bool)

(assert (=> b!1106070 (= e!631429 (and e!631427 mapRes!42874))))

(declare-fun condMapEmpty!42874 () Bool)

(declare-fun mapDefault!42874 () ValueCell!12977)

(assert (=> b!1106070 (= condMapEmpty!42874 (= (arr!34500 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12977)) mapDefault!42874)))))

(declare-fun b!1106071 () Bool)

(declare-fun res!737598 () Bool)

(assert (=> b!1106071 (=> (not res!737598) (not e!631426))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106071 (= res!737598 (and (= (size!35037 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35036 _keys!1208) (size!35037 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106072 () Bool)

(declare-fun res!737596 () Bool)

(assert (=> b!1106072 (=> (not res!737596) (not e!631426))))

(assert (=> b!1106072 (= res!737596 (= (select (arr!34499 _keys!1208) i!673) k0!934))))

(declare-fun b!1106073 () Bool)

(declare-fun e!631425 () Bool)

(assert (=> b!1106073 (= e!631425 false)))

(declare-fun lt!495705 () Bool)

(declare-fun lt!495706 () array!71703)

(declare-datatypes ((List!24084 0))(
  ( (Nil!24081) (Cons!24080 (h!25298 (_ BitVec 64)) (t!34341 List!24084)) )
))
(declare-fun arrayNoDuplicates!0 (array!71703 (_ BitVec 32) List!24084) Bool)

(assert (=> b!1106073 (= lt!495705 (arrayNoDuplicates!0 lt!495706 #b00000000000000000000000000000000 Nil!24081))))

(declare-fun b!1106074 () Bool)

(declare-fun tp_is_empty!27373 () Bool)

(assert (=> b!1106074 (= e!631428 tp_is_empty!27373)))

(declare-fun b!1106075 () Bool)

(declare-fun res!737600 () Bool)

(assert (=> b!1106075 (=> (not res!737600) (not e!631426))))

(assert (=> b!1106075 (= res!737600 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24081))))

(declare-fun b!1106076 () Bool)

(declare-fun res!737594 () Bool)

(assert (=> b!1106076 (=> (not res!737594) (not e!631426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106076 (= res!737594 (validMask!0 mask!1564))))

(declare-fun b!1106077 () Bool)

(assert (=> b!1106077 (= e!631426 e!631425)))

(declare-fun res!737593 () Bool)

(assert (=> b!1106077 (=> (not res!737593) (not e!631425))))

(assert (=> b!1106077 (= res!737593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495706 mask!1564))))

(assert (=> b!1106077 (= lt!495706 (array!71704 (store (arr!34499 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35036 _keys!1208)))))

(declare-fun b!1106078 () Bool)

(assert (=> b!1106078 (= e!631427 tp_is_empty!27373)))

(assert (= (and start!97362 res!737597) b!1106076))

(assert (= (and b!1106076 res!737594) b!1106071))

(assert (= (and b!1106071 res!737598) b!1106067))

(assert (= (and b!1106067 res!737595) b!1106075))

(assert (= (and b!1106075 res!737600) b!1106068))

(assert (= (and b!1106068 res!737592) b!1106069))

(assert (= (and b!1106069 res!737599) b!1106072))

(assert (= (and b!1106072 res!737596) b!1106077))

(assert (= (and b!1106077 res!737593) b!1106073))

(assert (= (and b!1106070 condMapEmpty!42874) mapIsEmpty!42874))

(assert (= (and b!1106070 (not condMapEmpty!42874)) mapNonEmpty!42874))

(get-info :version)

(assert (= (and mapNonEmpty!42874 ((_ is ValueCellFull!12977) mapValue!42874)) b!1106074))

(assert (= (and b!1106070 ((_ is ValueCellFull!12977) mapDefault!42874)) b!1106078))

(assert (= start!97362 b!1106070))

(declare-fun m!1026043 () Bool)

(assert (=> b!1106076 m!1026043))

(declare-fun m!1026045 () Bool)

(assert (=> b!1106075 m!1026045))

(declare-fun m!1026047 () Bool)

(assert (=> b!1106067 m!1026047))

(declare-fun m!1026049 () Bool)

(assert (=> mapNonEmpty!42874 m!1026049))

(declare-fun m!1026051 () Bool)

(assert (=> start!97362 m!1026051))

(declare-fun m!1026053 () Bool)

(assert (=> start!97362 m!1026053))

(declare-fun m!1026055 () Bool)

(assert (=> b!1106077 m!1026055))

(declare-fun m!1026057 () Bool)

(assert (=> b!1106077 m!1026057))

(declare-fun m!1026059 () Bool)

(assert (=> b!1106069 m!1026059))

(declare-fun m!1026061 () Bool)

(assert (=> b!1106072 m!1026061))

(declare-fun m!1026063 () Bool)

(assert (=> b!1106073 m!1026063))

(check-sat (not mapNonEmpty!42874) (not b!1106073) (not b!1106075) (not b!1106069) (not b!1106076) (not b!1106077) (not start!97362) (not b!1106067) tp_is_empty!27373)
(check-sat)
