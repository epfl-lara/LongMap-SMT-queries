; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109062 () Bool)

(assert start!109062)

(declare-fun b_free!28551 () Bool)

(declare-fun b_next!28551 () Bool)

(assert (=> start!109062 (= b_free!28551 (not b_next!28551))))

(declare-fun tp!100772 () Bool)

(declare-fun b_and!46641 () Bool)

(assert (=> start!109062 (= tp!100772 b_and!46641)))

(declare-fun b!1289201 () Bool)

(declare-fun res!856342 () Bool)

(declare-fun e!736099 () Bool)

(assert (=> b!1289201 (=> (not res!856342) (not e!736099))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85424 0))(
  ( (array!85425 (arr!41213 (Array (_ BitVec 32) (_ BitVec 64))) (size!41763 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85424)

(assert (=> b!1289201 (= res!856342 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41763 _keys!1741))))))

(declare-fun mapNonEmpty!52847 () Bool)

(declare-fun mapRes!52847 () Bool)

(declare-fun tp!100771 () Bool)

(declare-fun e!736098 () Bool)

(assert (=> mapNonEmpty!52847 (= mapRes!52847 (and tp!100771 e!736098))))

(declare-datatypes ((V!50691 0))(
  ( (V!50692 (val!17170 Int)) )
))
(declare-datatypes ((ValueCell!16197 0))(
  ( (ValueCellFull!16197 (v!19773 V!50691)) (EmptyCell!16197) )
))
(declare-fun mapValue!52847 () ValueCell!16197)

(declare-datatypes ((array!85426 0))(
  ( (array!85427 (arr!41214 (Array (_ BitVec 32) ValueCell!16197)) (size!41764 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85426)

(declare-fun mapRest!52847 () (Array (_ BitVec 32) ValueCell!16197))

(declare-fun mapKey!52847 () (_ BitVec 32))

(assert (=> mapNonEmpty!52847 (= (arr!41214 _values!1445) (store mapRest!52847 mapKey!52847 mapValue!52847))))

(declare-fun b!1289202 () Bool)

(declare-fun tp_is_empty!34191 () Bool)

(assert (=> b!1289202 (= e!736098 tp_is_empty!34191)))

(declare-fun res!856345 () Bool)

(assert (=> start!109062 (=> (not res!856345) (not e!736099))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109062 (= res!856345 (validMask!0 mask!2175))))

(assert (=> start!109062 e!736099))

(assert (=> start!109062 tp_is_empty!34191))

(assert (=> start!109062 true))

(declare-fun e!736097 () Bool)

(declare-fun array_inv!31243 (array!85426) Bool)

(assert (=> start!109062 (and (array_inv!31243 _values!1445) e!736097)))

(declare-fun array_inv!31244 (array!85424) Bool)

(assert (=> start!109062 (array_inv!31244 _keys!1741)))

(assert (=> start!109062 tp!100772))

(declare-fun b!1289203 () Bool)

(declare-fun res!856344 () Bool)

(assert (=> b!1289203 (=> (not res!856344) (not e!736099))))

(declare-fun minValue!1387 () V!50691)

(declare-fun zeroValue!1387 () V!50691)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22050 0))(
  ( (tuple2!22051 (_1!11036 (_ BitVec 64)) (_2!11036 V!50691)) )
))
(declare-datatypes ((List!29220 0))(
  ( (Nil!29217) (Cons!29216 (h!30425 tuple2!22050) (t!42784 List!29220)) )
))
(declare-datatypes ((ListLongMap!19707 0))(
  ( (ListLongMap!19708 (toList!9869 List!29220)) )
))
(declare-fun contains!7987 (ListLongMap!19707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4930 (array!85424 array!85426 (_ BitVec 32) (_ BitVec 32) V!50691 V!50691 (_ BitVec 32) Int) ListLongMap!19707)

(assert (=> b!1289203 (= res!856344 (contains!7987 (getCurrentListMap!4930 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289204 () Bool)

(declare-fun res!856341 () Bool)

(assert (=> b!1289204 (=> (not res!856341) (not e!736099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85424 (_ BitVec 32)) Bool)

(assert (=> b!1289204 (= res!856341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289205 () Bool)

(declare-fun e!736096 () Bool)

(assert (=> b!1289205 (= e!736099 (not e!736096))))

(declare-fun res!856339 () Bool)

(assert (=> b!1289205 (=> res!856339 e!736096)))

(assert (=> b!1289205 (= res!856339 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289205 (not (contains!7987 (ListLongMap!19708 Nil!29217) k0!1205))))

(declare-datatypes ((Unit!42656 0))(
  ( (Unit!42657) )
))
(declare-fun lt!578181 () Unit!42656)

(declare-fun emptyContainsNothing!56 ((_ BitVec 64)) Unit!42656)

(assert (=> b!1289205 (= lt!578181 (emptyContainsNothing!56 k0!1205))))

(declare-fun b!1289206 () Bool)

(declare-fun e!736100 () Bool)

(assert (=> b!1289206 (= e!736097 (and e!736100 mapRes!52847))))

(declare-fun condMapEmpty!52847 () Bool)

(declare-fun mapDefault!52847 () ValueCell!16197)

(assert (=> b!1289206 (= condMapEmpty!52847 (= (arr!41214 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16197)) mapDefault!52847)))))

(declare-fun b!1289207 () Bool)

(declare-fun res!856343 () Bool)

(assert (=> b!1289207 (=> (not res!856343) (not e!736099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289207 (= res!856343 (not (validKeyInArray!0 (select (arr!41213 _keys!1741) from!2144))))))

(declare-fun b!1289208 () Bool)

(assert (=> b!1289208 (= e!736096 (bvsle from!2144 (size!41763 _keys!1741)))))

(declare-fun lt!578183 () ListLongMap!19707)

(declare-fun +!4341 (ListLongMap!19707 tuple2!22050) ListLongMap!19707)

(assert (=> b!1289208 (not (contains!7987 (+!4341 lt!578183 (tuple2!22051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578182 () Unit!42656)

(declare-fun addStillNotContains!359 (ListLongMap!19707 (_ BitVec 64) V!50691 (_ BitVec 64)) Unit!42656)

(assert (=> b!1289208 (= lt!578182 (addStillNotContains!359 lt!578183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5972 (array!85424 array!85426 (_ BitVec 32) (_ BitVec 32) V!50691 V!50691 (_ BitVec 32) Int) ListLongMap!19707)

(assert (=> b!1289208 (= lt!578183 (getCurrentListMapNoExtraKeys!5972 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289209 () Bool)

(assert (=> b!1289209 (= e!736100 tp_is_empty!34191)))

(declare-fun mapIsEmpty!52847 () Bool)

(assert (=> mapIsEmpty!52847 mapRes!52847))

(declare-fun b!1289210 () Bool)

(declare-fun res!856346 () Bool)

(assert (=> b!1289210 (=> (not res!856346) (not e!736099))))

(assert (=> b!1289210 (= res!856346 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41763 _keys!1741))))))

(declare-fun b!1289211 () Bool)

(declare-fun res!856347 () Bool)

(assert (=> b!1289211 (=> (not res!856347) (not e!736099))))

(declare-datatypes ((List!29221 0))(
  ( (Nil!29218) (Cons!29217 (h!30426 (_ BitVec 64)) (t!42785 List!29221)) )
))
(declare-fun arrayNoDuplicates!0 (array!85424 (_ BitVec 32) List!29221) Bool)

(assert (=> b!1289211 (= res!856347 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29218))))

(declare-fun b!1289212 () Bool)

(declare-fun res!856340 () Bool)

(assert (=> b!1289212 (=> (not res!856340) (not e!736099))))

(assert (=> b!1289212 (= res!856340 (and (= (size!41764 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41763 _keys!1741) (size!41764 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109062 res!856345) b!1289212))

(assert (= (and b!1289212 res!856340) b!1289204))

(assert (= (and b!1289204 res!856341) b!1289211))

(assert (= (and b!1289211 res!856347) b!1289210))

(assert (= (and b!1289210 res!856346) b!1289203))

(assert (= (and b!1289203 res!856344) b!1289201))

(assert (= (and b!1289201 res!856342) b!1289207))

(assert (= (and b!1289207 res!856343) b!1289205))

(assert (= (and b!1289205 (not res!856339)) b!1289208))

(assert (= (and b!1289206 condMapEmpty!52847) mapIsEmpty!52847))

(assert (= (and b!1289206 (not condMapEmpty!52847)) mapNonEmpty!52847))

(get-info :version)

(assert (= (and mapNonEmpty!52847 ((_ is ValueCellFull!16197) mapValue!52847)) b!1289202))

(assert (= (and b!1289206 ((_ is ValueCellFull!16197) mapDefault!52847)) b!1289209))

(assert (= start!109062 b!1289206))

(declare-fun m!1181731 () Bool)

(assert (=> b!1289204 m!1181731))

(declare-fun m!1181733 () Bool)

(assert (=> b!1289211 m!1181733))

(declare-fun m!1181735 () Bool)

(assert (=> start!109062 m!1181735))

(declare-fun m!1181737 () Bool)

(assert (=> start!109062 m!1181737))

(declare-fun m!1181739 () Bool)

(assert (=> start!109062 m!1181739))

(declare-fun m!1181741 () Bool)

(assert (=> b!1289205 m!1181741))

(declare-fun m!1181743 () Bool)

(assert (=> b!1289205 m!1181743))

(declare-fun m!1181745 () Bool)

(assert (=> b!1289208 m!1181745))

(assert (=> b!1289208 m!1181745))

(declare-fun m!1181747 () Bool)

(assert (=> b!1289208 m!1181747))

(declare-fun m!1181749 () Bool)

(assert (=> b!1289208 m!1181749))

(declare-fun m!1181751 () Bool)

(assert (=> b!1289208 m!1181751))

(declare-fun m!1181753 () Bool)

(assert (=> mapNonEmpty!52847 m!1181753))

(declare-fun m!1181755 () Bool)

(assert (=> b!1289203 m!1181755))

(assert (=> b!1289203 m!1181755))

(declare-fun m!1181757 () Bool)

(assert (=> b!1289203 m!1181757))

(declare-fun m!1181759 () Bool)

(assert (=> b!1289207 m!1181759))

(assert (=> b!1289207 m!1181759))

(declare-fun m!1181761 () Bool)

(assert (=> b!1289207 m!1181761))

(check-sat (not mapNonEmpty!52847) (not b!1289204) (not start!109062) (not b!1289205) b_and!46641 (not b!1289207) (not b!1289208) (not b_next!28551) (not b!1289203) tp_is_empty!34191 (not b!1289211))
(check-sat b_and!46641 (not b_next!28551))
