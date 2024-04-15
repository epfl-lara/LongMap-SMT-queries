; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97030 () Bool)

(assert start!97030)

(declare-fun b!1103564 () Bool)

(declare-fun res!736261 () Bool)

(declare-fun e!629973 () Bool)

(assert (=> b!1103564 (=> (not res!736261) (not e!629973))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103564 (= res!736261 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42793 () Bool)

(declare-fun mapRes!42793 () Bool)

(assert (=> mapIsEmpty!42793 mapRes!42793))

(declare-fun b!1103566 () Bool)

(declare-fun e!629971 () Bool)

(declare-fun tp_is_empty!27325 () Bool)

(assert (=> b!1103566 (= e!629971 tp_is_empty!27325)))

(declare-fun b!1103567 () Bool)

(declare-fun res!736264 () Bool)

(assert (=> b!1103567 (=> (not res!736264) (not e!629973))))

(declare-datatypes ((array!71480 0))(
  ( (array!71481 (arr!34397 (Array (_ BitVec 32) (_ BitVec 64))) (size!34935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71480)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71480 (_ BitVec 32)) Bool)

(assert (=> b!1103567 (= res!736264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1103568 () Bool)

(assert (=> b!1103568 (= e!629973 (and (= (select (arr!34397 _keys!1208) i!673) k0!934) (= (size!34935 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34935 _keys!1208))))))

(declare-fun b!1103569 () Bool)

(declare-fun res!736266 () Bool)

(assert (=> b!1103569 (=> (not res!736266) (not e!629973))))

(assert (=> b!1103569 (= res!736266 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34935 _keys!1208))))))

(declare-fun b!1103570 () Bool)

(declare-fun res!736263 () Bool)

(assert (=> b!1103570 (=> (not res!736263) (not e!629973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103570 (= res!736263 (validKeyInArray!0 k0!934))))

(declare-fun b!1103565 () Bool)

(declare-fun res!736265 () Bool)

(assert (=> b!1103565 (=> (not res!736265) (not e!629973))))

(declare-datatypes ((List!24077 0))(
  ( (Nil!24074) (Cons!24073 (h!25282 (_ BitVec 64)) (t!34333 List!24077)) )
))
(declare-fun arrayNoDuplicates!0 (array!71480 (_ BitVec 32) List!24077) Bool)

(assert (=> b!1103565 (= res!736265 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24074))))

(declare-fun res!736260 () Bool)

(assert (=> start!97030 (=> (not res!736260) (not e!629973))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97030 (= res!736260 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34935 _keys!1208))))))

(assert (=> start!97030 e!629973))

(declare-fun array_inv!26524 (array!71480) Bool)

(assert (=> start!97030 (array_inv!26524 _keys!1208)))

(assert (=> start!97030 true))

(declare-datatypes ((V!41561 0))(
  ( (V!41562 (val!13719 Int)) )
))
(declare-datatypes ((ValueCell!12953 0))(
  ( (ValueCellFull!12953 (v!16350 V!41561)) (EmptyCell!12953) )
))
(declare-datatypes ((array!71482 0))(
  ( (array!71483 (arr!34398 (Array (_ BitVec 32) ValueCell!12953)) (size!34936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71482)

(declare-fun e!629969 () Bool)

(declare-fun array_inv!26525 (array!71482) Bool)

(assert (=> start!97030 (and (array_inv!26525 _values!996) e!629969)))

(declare-fun b!1103571 () Bool)

(declare-fun res!736262 () Bool)

(assert (=> b!1103571 (=> (not res!736262) (not e!629973))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103571 (= res!736262 (and (= (size!34936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34935 _keys!1208) (size!34936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103572 () Bool)

(declare-fun e!629972 () Bool)

(assert (=> b!1103572 (= e!629969 (and e!629972 mapRes!42793))))

(declare-fun condMapEmpty!42793 () Bool)

(declare-fun mapDefault!42793 () ValueCell!12953)

(assert (=> b!1103572 (= condMapEmpty!42793 (= (arr!34398 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12953)) mapDefault!42793)))))

(declare-fun mapNonEmpty!42793 () Bool)

(declare-fun tp!81713 () Bool)

(assert (=> mapNonEmpty!42793 (= mapRes!42793 (and tp!81713 e!629971))))

(declare-fun mapRest!42793 () (Array (_ BitVec 32) ValueCell!12953))

(declare-fun mapKey!42793 () (_ BitVec 32))

(declare-fun mapValue!42793 () ValueCell!12953)

(assert (=> mapNonEmpty!42793 (= (arr!34398 _values!996) (store mapRest!42793 mapKey!42793 mapValue!42793))))

(declare-fun b!1103573 () Bool)

(assert (=> b!1103573 (= e!629972 tp_is_empty!27325)))

(assert (= (and start!97030 res!736260) b!1103564))

(assert (= (and b!1103564 res!736261) b!1103571))

(assert (= (and b!1103571 res!736262) b!1103567))

(assert (= (and b!1103567 res!736264) b!1103565))

(assert (= (and b!1103565 res!736265) b!1103569))

(assert (= (and b!1103569 res!736266) b!1103570))

(assert (= (and b!1103570 res!736263) b!1103568))

(assert (= (and b!1103572 condMapEmpty!42793) mapIsEmpty!42793))

(assert (= (and b!1103572 (not condMapEmpty!42793)) mapNonEmpty!42793))

(get-info :version)

(assert (= (and mapNonEmpty!42793 ((_ is ValueCellFull!12953) mapValue!42793)) b!1103566))

(assert (= (and b!1103572 ((_ is ValueCellFull!12953) mapDefault!42793)) b!1103573))

(assert (= start!97030 b!1103572))

(declare-fun m!1023127 () Bool)

(assert (=> start!97030 m!1023127))

(declare-fun m!1023129 () Bool)

(assert (=> start!97030 m!1023129))

(declare-fun m!1023131 () Bool)

(assert (=> b!1103565 m!1023131))

(declare-fun m!1023133 () Bool)

(assert (=> b!1103568 m!1023133))

(declare-fun m!1023135 () Bool)

(assert (=> mapNonEmpty!42793 m!1023135))

(declare-fun m!1023137 () Bool)

(assert (=> b!1103567 m!1023137))

(declare-fun m!1023139 () Bool)

(assert (=> b!1103570 m!1023139))

(declare-fun m!1023141 () Bool)

(assert (=> b!1103564 m!1023141))

(check-sat (not start!97030) (not b!1103564) (not b!1103567) (not mapNonEmpty!42793) (not b!1103570) tp_is_empty!27325 (not b!1103565))
(check-sat)
