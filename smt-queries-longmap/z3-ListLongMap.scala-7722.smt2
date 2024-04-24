; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97254 () Bool)

(assert start!97254)

(declare-fun mapNonEmpty!42766 () Bool)

(declare-fun mapRes!42766 () Bool)

(declare-fun tp!81686 () Bool)

(declare-fun e!630784 () Bool)

(assert (=> mapNonEmpty!42766 (= mapRes!42766 (and tp!81686 e!630784))))

(declare-datatypes ((V!41537 0))(
  ( (V!41538 (val!13710 Int)) )
))
(declare-datatypes ((ValueCell!12944 0))(
  ( (ValueCellFull!12944 (v!16338 V!41537)) (EmptyCell!12944) )
))
(declare-fun mapRest!42766 () (Array (_ BitVec 32) ValueCell!12944))

(declare-fun mapValue!42766 () ValueCell!12944)

(declare-datatypes ((array!71573 0))(
  ( (array!71574 (arr!34437 (Array (_ BitVec 32) ValueCell!12944)) (size!34974 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71573)

(declare-fun mapKey!42766 () (_ BitVec 32))

(assert (=> mapNonEmpty!42766 (= (arr!34437 _values!996) (store mapRest!42766 mapKey!42766 mapValue!42766))))

(declare-fun b!1104823 () Bool)

(declare-fun res!736711 () Bool)

(declare-fun e!630786 () Bool)

(assert (=> b!1104823 (=> (not res!736711) (not e!630786))))

(declare-datatypes ((array!71575 0))(
  ( (array!71576 (arr!34438 (Array (_ BitVec 32) (_ BitVec 64))) (size!34975 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71575)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71575 (_ BitVec 32)) Bool)

(assert (=> b!1104823 (= res!736711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104824 () Bool)

(declare-fun e!630783 () Bool)

(declare-fun tp_is_empty!27307 () Bool)

(assert (=> b!1104824 (= e!630783 tp_is_empty!27307)))

(declare-fun b!1104825 () Bool)

(declare-fun res!736713 () Bool)

(assert (=> b!1104825 (=> (not res!736713) (not e!630786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104825 (= res!736713 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42766 () Bool)

(assert (=> mapIsEmpty!42766 mapRes!42766))

(declare-fun b!1104826 () Bool)

(assert (=> b!1104826 (= e!630786 false)))

(declare-fun lt!495591 () Bool)

(declare-datatypes ((List!24061 0))(
  ( (Nil!24058) (Cons!24057 (h!25275 (_ BitVec 64)) (t!34318 List!24061)) )
))
(declare-fun arrayNoDuplicates!0 (array!71575 (_ BitVec 32) List!24061) Bool)

(assert (=> b!1104826 (= lt!495591 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24058))))

(declare-fun b!1104822 () Bool)

(declare-fun e!630785 () Bool)

(assert (=> b!1104822 (= e!630785 (and e!630783 mapRes!42766))))

(declare-fun condMapEmpty!42766 () Bool)

(declare-fun mapDefault!42766 () ValueCell!12944)

(assert (=> b!1104822 (= condMapEmpty!42766 (= (arr!34437 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12944)) mapDefault!42766)))))

(declare-fun res!736712 () Bool)

(assert (=> start!97254 (=> (not res!736712) (not e!630786))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97254 (= res!736712 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34975 _keys!1208))))))

(assert (=> start!97254 e!630786))

(declare-fun array_inv!26554 (array!71575) Bool)

(assert (=> start!97254 (array_inv!26554 _keys!1208)))

(assert (=> start!97254 true))

(declare-fun array_inv!26555 (array!71573) Bool)

(assert (=> start!97254 (and (array_inv!26555 _values!996) e!630785)))

(declare-fun b!1104827 () Bool)

(declare-fun res!736710 () Bool)

(assert (=> b!1104827 (=> (not res!736710) (not e!630786))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104827 (= res!736710 (and (= (size!34974 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34975 _keys!1208) (size!34974 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104828 () Bool)

(assert (=> b!1104828 (= e!630784 tp_is_empty!27307)))

(assert (= (and start!97254 res!736712) b!1104825))

(assert (= (and b!1104825 res!736713) b!1104827))

(assert (= (and b!1104827 res!736710) b!1104823))

(assert (= (and b!1104823 res!736711) b!1104826))

(assert (= (and b!1104822 condMapEmpty!42766) mapIsEmpty!42766))

(assert (= (and b!1104822 (not condMapEmpty!42766)) mapNonEmpty!42766))

(get-info :version)

(assert (= (and mapNonEmpty!42766 ((_ is ValueCellFull!12944) mapValue!42766)) b!1104828))

(assert (= (and b!1104822 ((_ is ValueCellFull!12944) mapDefault!42766)) b!1104824))

(assert (= start!97254 b!1104822))

(declare-fun m!1025305 () Bool)

(assert (=> b!1104823 m!1025305))

(declare-fun m!1025307 () Bool)

(assert (=> b!1104825 m!1025307))

(declare-fun m!1025309 () Bool)

(assert (=> start!97254 m!1025309))

(declare-fun m!1025311 () Bool)

(assert (=> start!97254 m!1025311))

(declare-fun m!1025313 () Bool)

(assert (=> mapNonEmpty!42766 m!1025313))

(declare-fun m!1025315 () Bool)

(assert (=> b!1104826 m!1025315))

(check-sat (not start!97254) (not b!1104826) (not b!1104823) tp_is_empty!27307 (not mapNonEmpty!42766) (not b!1104825))
(check-sat)
