; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97012 () Bool)

(assert start!97012)

(declare-fun b!1103342 () Bool)

(declare-fun res!736121 () Bool)

(declare-fun e!629836 () Bool)

(assert (=> b!1103342 (=> (not res!736121) (not e!629836))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103342 (= res!736121 (validMask!0 mask!1564))))

(declare-fun b!1103343 () Bool)

(declare-fun res!736120 () Bool)

(assert (=> b!1103343 (=> (not res!736120) (not e!629836))))

(declare-datatypes ((array!71444 0))(
  ( (array!71445 (arr!34379 (Array (_ BitVec 32) (_ BitVec 64))) (size!34917 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71444)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71444 (_ BitVec 32)) Bool)

(assert (=> b!1103343 (= res!736120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103344 () Bool)

(assert (=> b!1103344 (= e!629836 false)))

(declare-fun lt!494876 () Bool)

(declare-datatypes ((List!24070 0))(
  ( (Nil!24067) (Cons!24066 (h!25275 (_ BitVec 64)) (t!34326 List!24070)) )
))
(declare-fun arrayNoDuplicates!0 (array!71444 (_ BitVec 32) List!24070) Bool)

(assert (=> b!1103344 (= lt!494876 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24067))))

(declare-fun b!1103345 () Bool)

(declare-fun e!629838 () Bool)

(declare-fun e!629835 () Bool)

(declare-fun mapRes!42766 () Bool)

(assert (=> b!1103345 (= e!629838 (and e!629835 mapRes!42766))))

(declare-fun condMapEmpty!42766 () Bool)

(declare-datatypes ((V!41537 0))(
  ( (V!41538 (val!13710 Int)) )
))
(declare-datatypes ((ValueCell!12944 0))(
  ( (ValueCellFull!12944 (v!16341 V!41537)) (EmptyCell!12944) )
))
(declare-datatypes ((array!71446 0))(
  ( (array!71447 (arr!34380 (Array (_ BitVec 32) ValueCell!12944)) (size!34918 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71446)

(declare-fun mapDefault!42766 () ValueCell!12944)

(assert (=> b!1103345 (= condMapEmpty!42766 (= (arr!34380 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12944)) mapDefault!42766)))))

(declare-fun mapNonEmpty!42766 () Bool)

(declare-fun tp!81686 () Bool)

(declare-fun e!629837 () Bool)

(assert (=> mapNonEmpty!42766 (= mapRes!42766 (and tp!81686 e!629837))))

(declare-fun mapKey!42766 () (_ BitVec 32))

(declare-fun mapValue!42766 () ValueCell!12944)

(declare-fun mapRest!42766 () (Array (_ BitVec 32) ValueCell!12944))

(assert (=> mapNonEmpty!42766 (= (arr!34380 _values!996) (store mapRest!42766 mapKey!42766 mapValue!42766))))

(declare-fun mapIsEmpty!42766 () Bool)

(assert (=> mapIsEmpty!42766 mapRes!42766))

(declare-fun b!1103346 () Bool)

(declare-fun tp_is_empty!27307 () Bool)

(assert (=> b!1103346 (= e!629837 tp_is_empty!27307)))

(declare-fun b!1103347 () Bool)

(assert (=> b!1103347 (= e!629835 tp_is_empty!27307)))

(declare-fun res!736119 () Bool)

(assert (=> start!97012 (=> (not res!736119) (not e!629836))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97012 (= res!736119 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34917 _keys!1208))))))

(assert (=> start!97012 e!629836))

(declare-fun array_inv!26510 (array!71444) Bool)

(assert (=> start!97012 (array_inv!26510 _keys!1208)))

(assert (=> start!97012 true))

(declare-fun array_inv!26511 (array!71446) Bool)

(assert (=> start!97012 (and (array_inv!26511 _values!996) e!629838)))

(declare-fun b!1103348 () Bool)

(declare-fun res!736122 () Bool)

(assert (=> b!1103348 (=> (not res!736122) (not e!629836))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103348 (= res!736122 (and (= (size!34918 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34917 _keys!1208) (size!34918 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97012 res!736119) b!1103342))

(assert (= (and b!1103342 res!736121) b!1103348))

(assert (= (and b!1103348 res!736122) b!1103343))

(assert (= (and b!1103343 res!736120) b!1103344))

(assert (= (and b!1103345 condMapEmpty!42766) mapIsEmpty!42766))

(assert (= (and b!1103345 (not condMapEmpty!42766)) mapNonEmpty!42766))

(get-info :version)

(assert (= (and mapNonEmpty!42766 ((_ is ValueCellFull!12944) mapValue!42766)) b!1103346))

(assert (= (and b!1103345 ((_ is ValueCellFull!12944) mapDefault!42766)) b!1103347))

(assert (= start!97012 b!1103345))

(declare-fun m!1023007 () Bool)

(assert (=> b!1103342 m!1023007))

(declare-fun m!1023009 () Bool)

(assert (=> mapNonEmpty!42766 m!1023009))

(declare-fun m!1023011 () Bool)

(assert (=> start!97012 m!1023011))

(declare-fun m!1023013 () Bool)

(assert (=> start!97012 m!1023013))

(declare-fun m!1023015 () Bool)

(assert (=> b!1103343 m!1023015))

(declare-fun m!1023017 () Bool)

(assert (=> b!1103344 m!1023017))

(check-sat tp_is_empty!27307 (not mapNonEmpty!42766) (not b!1103343) (not b!1103344) (not start!97012) (not b!1103342))
(check-sat)
