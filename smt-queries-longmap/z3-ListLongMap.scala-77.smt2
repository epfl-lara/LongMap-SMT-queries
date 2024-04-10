; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1040 () Bool)

(assert start!1040)

(declare-fun b_free!369 () Bool)

(declare-fun b_next!369 () Bool)

(assert (=> start!1040 (= b_free!369 (not b_next!369))))

(declare-fun tp!1346 () Bool)

(declare-fun b_and!521 () Bool)

(assert (=> start!1040 (= tp!1346 b_and!521)))

(declare-fun b!9159 () Bool)

(declare-fun e!5231 () Bool)

(declare-fun e!5226 () Bool)

(declare-fun mapRes!650 () Bool)

(assert (=> b!9159 (= e!5231 (and e!5226 mapRes!650))))

(declare-fun condMapEmpty!650 () Bool)

(declare-datatypes ((V!773 0))(
  ( (V!774 (val!229 Int)) )
))
(declare-datatypes ((ValueCell!207 0))(
  ( (ValueCellFull!207 (v!1323 V!773)) (EmptyCell!207) )
))
(declare-datatypes ((array!825 0))(
  ( (array!826 (arr!398 (Array (_ BitVec 32) ValueCell!207)) (size!460 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!825)

(declare-fun mapDefault!650 () ValueCell!207)

(assert (=> b!9159 (= condMapEmpty!650 (= (arr!398 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!207)) mapDefault!650)))))

(declare-fun b!9160 () Bool)

(declare-fun e!5228 () Bool)

(declare-datatypes ((array!827 0))(
  ( (array!828 (arr!399 (Array (_ BitVec 32) (_ BitVec 64))) (size!461 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!827)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9160 (= e!5228 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9161 () Bool)

(declare-fun res!8358 () Bool)

(declare-fun e!5229 () Bool)

(assert (=> b!9161 (=> (not res!8358) (not e!5229))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9161 (= res!8358 (and (= (size!460 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!461 _keys!1806) (size!460 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9162 () Bool)

(declare-fun tp_is_empty!447 () Bool)

(assert (=> b!9162 (= e!5226 tp_is_empty!447)))

(declare-fun b!9163 () Bool)

(assert (=> b!9163 (= e!5228 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9164 () Bool)

(declare-fun res!8362 () Bool)

(assert (=> b!9164 (=> (not res!8362) (not e!5229))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!773)

(declare-fun zeroValue!1434 () V!773)

(declare-datatypes ((tuple2!266 0))(
  ( (tuple2!267 (_1!133 (_ BitVec 64)) (_2!133 V!773)) )
))
(declare-datatypes ((List!277 0))(
  ( (Nil!274) (Cons!273 (h!839 tuple2!266) (t!2418 List!277)) )
))
(declare-datatypes ((ListLongMap!271 0))(
  ( (ListLongMap!272 (toList!151 List!277)) )
))
(declare-fun contains!128 (ListLongMap!271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!110 (array!827 array!825 (_ BitVec 32) (_ BitVec 32) V!773 V!773 (_ BitVec 32) Int) ListLongMap!271)

(assert (=> b!9164 (= res!8362 (contains!128 (getCurrentListMap!110 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9165 () Bool)

(declare-fun e!5225 () Bool)

(assert (=> b!9165 (= e!5229 (not e!5225))))

(declare-fun res!8356 () Bool)

(assert (=> b!9165 (=> res!8356 e!5225)))

(assert (=> b!9165 (= res!8356 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9165 e!5228))

(declare-fun c!701 () Bool)

(assert (=> b!9165 (= c!701 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!187 0))(
  ( (Unit!188) )
))
(declare-fun lt!1988 () Unit!187)

(declare-fun lemmaKeyInListMapIsInArray!70 (array!827 array!825 (_ BitVec 32) (_ BitVec 32) V!773 V!773 (_ BitVec 64) Int) Unit!187)

(assert (=> b!9165 (= lt!1988 (lemmaKeyInListMapIsInArray!70 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9167 () Bool)

(declare-fun res!8360 () Bool)

(assert (=> b!9167 (=> (not res!8360) (not e!5229))))

(declare-datatypes ((List!278 0))(
  ( (Nil!275) (Cons!274 (h!840 (_ BitVec 64)) (t!2419 List!278)) )
))
(declare-fun arrayNoDuplicates!0 (array!827 (_ BitVec 32) List!278) Bool)

(assert (=> b!9167 (= res!8360 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!275))))

(declare-fun b!9168 () Bool)

(declare-fun res!8359 () Bool)

(assert (=> b!9168 (=> (not res!8359) (not e!5229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9168 (= res!8359 (validKeyInArray!0 k0!1278))))

(declare-fun mapIsEmpty!650 () Bool)

(assert (=> mapIsEmpty!650 mapRes!650))

(declare-fun b!9169 () Bool)

(declare-fun res!8361 () Bool)

(assert (=> b!9169 (=> (not res!8361) (not e!5229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!827 (_ BitVec 32)) Bool)

(assert (=> b!9169 (= res!8361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!8357 () Bool)

(assert (=> start!1040 (=> (not res!8357) (not e!5229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1040 (= res!8357 (validMask!0 mask!2250))))

(assert (=> start!1040 e!5229))

(assert (=> start!1040 tp!1346))

(assert (=> start!1040 true))

(declare-fun array_inv!293 (array!825) Bool)

(assert (=> start!1040 (and (array_inv!293 _values!1492) e!5231)))

(assert (=> start!1040 tp_is_empty!447))

(declare-fun array_inv!294 (array!827) Bool)

(assert (=> start!1040 (array_inv!294 _keys!1806)))

(declare-fun b!9166 () Bool)

(declare-fun e!5227 () Bool)

(assert (=> b!9166 (= e!5227 tp_is_empty!447)))

(declare-fun b!9170 () Bool)

(assert (=> b!9170 (= e!5225 true)))

(declare-fun lt!1989 () (_ BitVec 32))

(assert (=> b!9170 (arrayForallSeekEntryOrOpenFound!0 lt!1989 _keys!1806 mask!2250)))

(declare-fun lt!1987 () Unit!187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!187)

(assert (=> b!9170 (= lt!1987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1989))))

(declare-fun arrayScanForKey!0 (array!827 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9170 (= lt!1989 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!650 () Bool)

(declare-fun tp!1345 () Bool)

(assert (=> mapNonEmpty!650 (= mapRes!650 (and tp!1345 e!5227))))

(declare-fun mapValue!650 () ValueCell!207)

(declare-fun mapRest!650 () (Array (_ BitVec 32) ValueCell!207))

(declare-fun mapKey!650 () (_ BitVec 32))

(assert (=> mapNonEmpty!650 (= (arr!398 _values!1492) (store mapRest!650 mapKey!650 mapValue!650))))

(assert (= (and start!1040 res!8357) b!9161))

(assert (= (and b!9161 res!8358) b!9169))

(assert (= (and b!9169 res!8361) b!9167))

(assert (= (and b!9167 res!8360) b!9164))

(assert (= (and b!9164 res!8362) b!9168))

(assert (= (and b!9168 res!8359) b!9165))

(assert (= (and b!9165 c!701) b!9160))

(assert (= (and b!9165 (not c!701)) b!9163))

(assert (= (and b!9165 (not res!8356)) b!9170))

(assert (= (and b!9159 condMapEmpty!650) mapIsEmpty!650))

(assert (= (and b!9159 (not condMapEmpty!650)) mapNonEmpty!650))

(get-info :version)

(assert (= (and mapNonEmpty!650 ((_ is ValueCellFull!207) mapValue!650)) b!9166))

(assert (= (and b!9159 ((_ is ValueCellFull!207) mapDefault!650)) b!9162))

(assert (= start!1040 b!9159))

(declare-fun m!5717 () Bool)

(assert (=> start!1040 m!5717))

(declare-fun m!5719 () Bool)

(assert (=> start!1040 m!5719))

(declare-fun m!5721 () Bool)

(assert (=> start!1040 m!5721))

(declare-fun m!5723 () Bool)

(assert (=> b!9167 m!5723))

(declare-fun m!5725 () Bool)

(assert (=> b!9168 m!5725))

(declare-fun m!5727 () Bool)

(assert (=> b!9165 m!5727))

(declare-fun m!5729 () Bool)

(assert (=> b!9165 m!5729))

(declare-fun m!5731 () Bool)

(assert (=> mapNonEmpty!650 m!5731))

(declare-fun m!5733 () Bool)

(assert (=> b!9164 m!5733))

(assert (=> b!9164 m!5733))

(declare-fun m!5735 () Bool)

(assert (=> b!9164 m!5735))

(declare-fun m!5737 () Bool)

(assert (=> b!9170 m!5737))

(declare-fun m!5739 () Bool)

(assert (=> b!9170 m!5739))

(declare-fun m!5741 () Bool)

(assert (=> b!9170 m!5741))

(assert (=> b!9160 m!5727))

(declare-fun m!5743 () Bool)

(assert (=> b!9169 m!5743))

(check-sat (not b!9169) tp_is_empty!447 (not b!9170) b_and!521 (not b!9165) (not b!9160) (not b!9164) (not b_next!369) (not mapNonEmpty!650) (not b!9168) (not start!1040) (not b!9167))
(check-sat b_and!521 (not b_next!369))
