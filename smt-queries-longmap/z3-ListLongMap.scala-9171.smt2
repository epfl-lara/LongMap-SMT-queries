; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110476 () Bool)

(assert start!110476)

(declare-fun b_free!29299 () Bool)

(declare-fun b_next!29299 () Bool)

(assert (=> start!110476 (= b_free!29299 (not b_next!29299))))

(declare-fun tp!103061 () Bool)

(declare-fun b_and!47497 () Bool)

(assert (=> start!110476 (= tp!103061 b_and!47497)))

(declare-fun b!1306365 () Bool)

(declare-fun res!867173 () Bool)

(declare-fun e!745272 () Bool)

(assert (=> b!1306365 (=> (not res!867173) (not e!745272))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86939 0))(
  ( (array!86940 (arr!41952 (Array (_ BitVec 32) (_ BitVec 64))) (size!42503 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86939)

(assert (=> b!1306365 (= res!867173 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42503 _keys!1741))))))

(declare-fun b!1306366 () Bool)

(declare-fun e!745277 () Bool)

(declare-fun tp_is_empty!34939 () Bool)

(assert (=> b!1306366 (= e!745277 tp_is_empty!34939)))

(declare-fun b!1306367 () Bool)

(declare-fun e!745276 () Bool)

(assert (=> b!1306367 (= e!745276 tp_is_empty!34939)))

(declare-fun b!1306368 () Bool)

(declare-fun res!867175 () Bool)

(assert (=> b!1306368 (=> (not res!867175) (not e!745272))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86939 (_ BitVec 32)) Bool)

(assert (=> b!1306368 (= res!867175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1306370 () Bool)

(declare-fun e!745275 () Bool)

(assert (=> b!1306370 (= e!745272 (not e!745275))))

(declare-fun res!867171 () Bool)

(assert (=> b!1306370 (=> res!867171 e!745275)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1306370 (= res!867171 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!51689 0))(
  ( (V!51690 (val!17544 Int)) )
))
(declare-datatypes ((tuple2!22670 0))(
  ( (tuple2!22671 (_1!11346 (_ BitVec 64)) (_2!11346 V!51689)) )
))
(declare-datatypes ((List!29815 0))(
  ( (Nil!29812) (Cons!29811 (h!31029 tuple2!22670) (t!43409 List!29815)) )
))
(declare-datatypes ((ListLongMap!20335 0))(
  ( (ListLongMap!20336 (toList!10183 List!29815)) )
))
(declare-fun contains!8339 (ListLongMap!20335 (_ BitVec 64)) Bool)

(assert (=> b!1306370 (not (contains!8339 (ListLongMap!20336 Nil!29812) k0!1205))))

(declare-datatypes ((Unit!43186 0))(
  ( (Unit!43187) )
))
(declare-fun lt!584663 () Unit!43186)

(declare-fun emptyContainsNothing!231 ((_ BitVec 64)) Unit!43186)

(assert (=> b!1306370 (= lt!584663 (emptyContainsNothing!231 k0!1205))))

(declare-fun b!1306371 () Bool)

(declare-fun res!867169 () Bool)

(assert (=> b!1306371 (=> (not res!867169) (not e!745272))))

(declare-datatypes ((List!29816 0))(
  ( (Nil!29813) (Cons!29812 (h!31030 (_ BitVec 64)) (t!43410 List!29816)) )
))
(declare-fun arrayNoDuplicates!0 (array!86939 (_ BitVec 32) List!29816) Bool)

(assert (=> b!1306371 (= res!867169 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29813))))

(declare-fun b!1306372 () Bool)

(declare-fun res!867174 () Bool)

(assert (=> b!1306372 (=> (not res!867174) (not e!745272))))

(assert (=> b!1306372 (= res!867174 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42503 _keys!1741))))))

(declare-fun b!1306373 () Bool)

(assert (=> b!1306373 (= e!745275 true)))

(declare-fun lt!584662 () ListLongMap!20335)

(declare-fun minValue!1387 () V!51689)

(declare-fun +!4536 (ListLongMap!20335 tuple2!22670) ListLongMap!20335)

(assert (=> b!1306373 (not (contains!8339 (+!4536 lt!584662 (tuple2!22671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584661 () Unit!43186)

(declare-fun addStillNotContains!487 (ListLongMap!20335 (_ BitVec 64) V!51689 (_ BitVec 64)) Unit!43186)

(assert (=> b!1306373 (= lt!584661 (addStillNotContains!487 lt!584662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51689)

(declare-datatypes ((ValueCell!16571 0))(
  ( (ValueCellFull!16571 (v!20161 V!51689)) (EmptyCell!16571) )
))
(declare-datatypes ((array!86941 0))(
  ( (array!86942 (arr!41953 (Array (_ BitVec 32) ValueCell!16571)) (size!42504 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86941)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6176 (array!86939 array!86941 (_ BitVec 32) (_ BitVec 32) V!51689 V!51689 (_ BitVec 32) Int) ListLongMap!20335)

(assert (=> b!1306373 (= lt!584662 (getCurrentListMapNoExtraKeys!6176 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!54015 () Bool)

(declare-fun mapRes!54015 () Bool)

(declare-fun tp!103062 () Bool)

(assert (=> mapNonEmpty!54015 (= mapRes!54015 (and tp!103062 e!745276))))

(declare-fun mapRest!54015 () (Array (_ BitVec 32) ValueCell!16571))

(declare-fun mapValue!54015 () ValueCell!16571)

(declare-fun mapKey!54015 () (_ BitVec 32))

(assert (=> mapNonEmpty!54015 (= (arr!41953 _values!1445) (store mapRest!54015 mapKey!54015 mapValue!54015))))

(declare-fun b!1306374 () Bool)

(declare-fun e!745273 () Bool)

(assert (=> b!1306374 (= e!745273 (and e!745277 mapRes!54015))))

(declare-fun condMapEmpty!54015 () Bool)

(declare-fun mapDefault!54015 () ValueCell!16571)

(assert (=> b!1306374 (= condMapEmpty!54015 (= (arr!41953 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16571)) mapDefault!54015)))))

(declare-fun b!1306375 () Bool)

(declare-fun res!867172 () Bool)

(assert (=> b!1306375 (=> (not res!867172) (not e!745272))))

(assert (=> b!1306375 (= res!867172 (and (= (size!42504 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42503 _keys!1741) (size!42504 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1306376 () Bool)

(declare-fun res!867167 () Bool)

(assert (=> b!1306376 (=> (not res!867167) (not e!745272))))

(declare-fun getCurrentListMap!5191 (array!86939 array!86941 (_ BitVec 32) (_ BitVec 32) V!51689 V!51689 (_ BitVec 32) Int) ListLongMap!20335)

(assert (=> b!1306376 (= res!867167 (contains!8339 (getCurrentListMap!5191 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!54015 () Bool)

(assert (=> mapIsEmpty!54015 mapRes!54015))

(declare-fun res!867170 () Bool)

(assert (=> start!110476 (=> (not res!867170) (not e!745272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110476 (= res!867170 (validMask!0 mask!2175))))

(assert (=> start!110476 e!745272))

(assert (=> start!110476 tp_is_empty!34939))

(assert (=> start!110476 true))

(declare-fun array_inv!31973 (array!86941) Bool)

(assert (=> start!110476 (and (array_inv!31973 _values!1445) e!745273)))

(declare-fun array_inv!31974 (array!86939) Bool)

(assert (=> start!110476 (array_inv!31974 _keys!1741)))

(assert (=> start!110476 tp!103061))

(declare-fun b!1306369 () Bool)

(declare-fun res!867168 () Bool)

(assert (=> b!1306369 (=> (not res!867168) (not e!745272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306369 (= res!867168 (not (validKeyInArray!0 (select (arr!41952 _keys!1741) from!2144))))))

(assert (= (and start!110476 res!867170) b!1306375))

(assert (= (and b!1306375 res!867172) b!1306368))

(assert (= (and b!1306368 res!867175) b!1306371))

(assert (= (and b!1306371 res!867169) b!1306372))

(assert (= (and b!1306372 res!867174) b!1306376))

(assert (= (and b!1306376 res!867167) b!1306365))

(assert (= (and b!1306365 res!867173) b!1306369))

(assert (= (and b!1306369 res!867168) b!1306370))

(assert (= (and b!1306370 (not res!867171)) b!1306373))

(assert (= (and b!1306374 condMapEmpty!54015) mapIsEmpty!54015))

(assert (= (and b!1306374 (not condMapEmpty!54015)) mapNonEmpty!54015))

(get-info :version)

(assert (= (and mapNonEmpty!54015 ((_ is ValueCellFull!16571) mapValue!54015)) b!1306367))

(assert (= (and b!1306374 ((_ is ValueCellFull!16571) mapDefault!54015)) b!1306366))

(assert (= start!110476 b!1306374))

(declare-fun m!1197697 () Bool)

(assert (=> b!1306370 m!1197697))

(declare-fun m!1197699 () Bool)

(assert (=> b!1306370 m!1197699))

(declare-fun m!1197701 () Bool)

(assert (=> b!1306376 m!1197701))

(assert (=> b!1306376 m!1197701))

(declare-fun m!1197703 () Bool)

(assert (=> b!1306376 m!1197703))

(declare-fun m!1197705 () Bool)

(assert (=> mapNonEmpty!54015 m!1197705))

(declare-fun m!1197707 () Bool)

(assert (=> b!1306368 m!1197707))

(declare-fun m!1197709 () Bool)

(assert (=> b!1306371 m!1197709))

(declare-fun m!1197711 () Bool)

(assert (=> b!1306369 m!1197711))

(assert (=> b!1306369 m!1197711))

(declare-fun m!1197713 () Bool)

(assert (=> b!1306369 m!1197713))

(declare-fun m!1197715 () Bool)

(assert (=> b!1306373 m!1197715))

(assert (=> b!1306373 m!1197715))

(declare-fun m!1197717 () Bool)

(assert (=> b!1306373 m!1197717))

(declare-fun m!1197719 () Bool)

(assert (=> b!1306373 m!1197719))

(declare-fun m!1197721 () Bool)

(assert (=> b!1306373 m!1197721))

(declare-fun m!1197723 () Bool)

(assert (=> start!110476 m!1197723))

(declare-fun m!1197725 () Bool)

(assert (=> start!110476 m!1197725))

(declare-fun m!1197727 () Bool)

(assert (=> start!110476 m!1197727))

(check-sat (not b!1306376) (not b!1306368) (not b_next!29299) (not b!1306371) (not mapNonEmpty!54015) (not b!1306369) tp_is_empty!34939 b_and!47497 (not b!1306370) (not start!110476) (not b!1306373))
(check-sat b_and!47497 (not b_next!29299))
