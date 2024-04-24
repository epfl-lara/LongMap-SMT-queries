; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109518 () Bool)

(assert start!109518)

(declare-fun b_free!28783 () Bool)

(declare-fun b_next!28783 () Bool)

(assert (=> start!109518 (= b_free!28783 (not b_next!28783))))

(declare-fun tp!101468 () Bool)

(declare-fun b_and!46875 () Bool)

(assert (=> start!109518 (= tp!101468 b_and!46875)))

(declare-fun b!1294601 () Bool)

(declare-fun res!859912 () Bool)

(declare-fun e!738950 () Bool)

(assert (=> b!1294601 (=> (not res!859912) (not e!738950))))

(declare-datatypes ((V!51001 0))(
  ( (V!51002 (val!17286 Int)) )
))
(declare-fun minValue!1387 () V!51001)

(declare-fun zeroValue!1387 () V!51001)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16313 0))(
  ( (ValueCellFull!16313 (v!19884 V!51001)) (EmptyCell!16313) )
))
(declare-datatypes ((array!85907 0))(
  ( (array!85908 (arr!41450 (Array (_ BitVec 32) ValueCell!16313)) (size!42001 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85907)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85909 0))(
  ( (array!85910 (arr!41451 (Array (_ BitVec 32) (_ BitVec 64))) (size!42002 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85909)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22258 0))(
  ( (tuple2!22259 (_1!11140 (_ BitVec 64)) (_2!11140 V!51001)) )
))
(declare-datatypes ((List!29424 0))(
  ( (Nil!29421) (Cons!29420 (h!30638 tuple2!22258) (t!42980 List!29424)) )
))
(declare-datatypes ((ListLongMap!19923 0))(
  ( (ListLongMap!19924 (toList!9977 List!29424)) )
))
(declare-fun contains!8108 (ListLongMap!19923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5007 (array!85909 array!85907 (_ BitVec 32) (_ BitVec 32) V!51001 V!51001 (_ BitVec 32) Int) ListLongMap!19923)

(assert (=> b!1294601 (= res!859912 (contains!8108 (getCurrentListMap!5007 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294602 () Bool)

(declare-fun e!738949 () Bool)

(assert (=> b!1294602 (= e!738949 true)))

(declare-fun lt!579999 () ListLongMap!19923)

(declare-fun +!4446 (ListLongMap!19923 tuple2!22258) ListLongMap!19923)

(assert (=> b!1294602 (not (contains!8108 (+!4446 lt!579999 (tuple2!22259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42791 0))(
  ( (Unit!42792) )
))
(declare-fun lt!579997 () Unit!42791)

(declare-fun addStillNotContains!422 (ListLongMap!19923 (_ BitVec 64) V!51001 (_ BitVec 64)) Unit!42791)

(assert (=> b!1294602 (= lt!579997 (addStillNotContains!422 lt!579999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6086 (array!85909 array!85907 (_ BitVec 32) (_ BitVec 32) V!51001 V!51001 (_ BitVec 32) Int) ListLongMap!19923)

(assert (=> b!1294602 (= lt!579999 (getCurrentListMapNoExtraKeys!6086 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!859916 () Bool)

(assert (=> start!109518 (=> (not res!859916) (not e!738950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109518 (= res!859916 (validMask!0 mask!2175))))

(assert (=> start!109518 e!738950))

(declare-fun tp_is_empty!34423 () Bool)

(assert (=> start!109518 tp_is_empty!34423))

(assert (=> start!109518 true))

(declare-fun e!738953 () Bool)

(declare-fun array_inv!31631 (array!85907) Bool)

(assert (=> start!109518 (and (array_inv!31631 _values!1445) e!738953)))

(declare-fun array_inv!31632 (array!85909) Bool)

(assert (=> start!109518 (array_inv!31632 _keys!1741)))

(assert (=> start!109518 tp!101468))

(declare-fun b!1294603 () Bool)

(declare-fun res!859917 () Bool)

(assert (=> b!1294603 (=> (not res!859917) (not e!738950))))

(assert (=> b!1294603 (= res!859917 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42002 _keys!1741))))))

(declare-fun b!1294604 () Bool)

(declare-fun res!859913 () Bool)

(assert (=> b!1294604 (=> (not res!859913) (not e!738950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294604 (= res!859913 (not (validKeyInArray!0 (select (arr!41451 _keys!1741) from!2144))))))

(declare-fun b!1294605 () Bool)

(declare-fun e!738951 () Bool)

(assert (=> b!1294605 (= e!738951 tp_is_empty!34423)))

(declare-fun b!1294606 () Bool)

(assert (=> b!1294606 (= e!738950 (not e!738949))))

(declare-fun res!859911 () Bool)

(assert (=> b!1294606 (=> res!859911 e!738949)))

(assert (=> b!1294606 (= res!859911 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294606 (not (contains!8108 (ListLongMap!19924 Nil!29421) k0!1205))))

(declare-fun lt!579998 () Unit!42791)

(declare-fun emptyContainsNothing!138 ((_ BitVec 64)) Unit!42791)

(assert (=> b!1294606 (= lt!579998 (emptyContainsNothing!138 k0!1205))))

(declare-fun b!1294607 () Bool)

(declare-fun e!738952 () Bool)

(assert (=> b!1294607 (= e!738952 tp_is_empty!34423)))

(declare-fun b!1294608 () Bool)

(declare-fun res!859910 () Bool)

(assert (=> b!1294608 (=> (not res!859910) (not e!738950))))

(declare-datatypes ((List!29425 0))(
  ( (Nil!29422) (Cons!29421 (h!30639 (_ BitVec 64)) (t!42981 List!29425)) )
))
(declare-fun arrayNoDuplicates!0 (array!85909 (_ BitVec 32) List!29425) Bool)

(assert (=> b!1294608 (= res!859910 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29422))))

(declare-fun mapNonEmpty!53195 () Bool)

(declare-fun mapRes!53195 () Bool)

(declare-fun tp!101467 () Bool)

(assert (=> mapNonEmpty!53195 (= mapRes!53195 (and tp!101467 e!738952))))

(declare-fun mapRest!53195 () (Array (_ BitVec 32) ValueCell!16313))

(declare-fun mapValue!53195 () ValueCell!16313)

(declare-fun mapKey!53195 () (_ BitVec 32))

(assert (=> mapNonEmpty!53195 (= (arr!41450 _values!1445) (store mapRest!53195 mapKey!53195 mapValue!53195))))

(declare-fun b!1294609 () Bool)

(declare-fun res!859915 () Bool)

(assert (=> b!1294609 (=> (not res!859915) (not e!738950))))

(assert (=> b!1294609 (= res!859915 (and (= (size!42001 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42002 _keys!1741) (size!42001 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294610 () Bool)

(assert (=> b!1294610 (= e!738953 (and e!738951 mapRes!53195))))

(declare-fun condMapEmpty!53195 () Bool)

(declare-fun mapDefault!53195 () ValueCell!16313)

(assert (=> b!1294610 (= condMapEmpty!53195 (= (arr!41450 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16313)) mapDefault!53195)))))

(declare-fun mapIsEmpty!53195 () Bool)

(assert (=> mapIsEmpty!53195 mapRes!53195))

(declare-fun b!1294611 () Bool)

(declare-fun res!859914 () Bool)

(assert (=> b!1294611 (=> (not res!859914) (not e!738950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85909 (_ BitVec 32)) Bool)

(assert (=> b!1294611 (= res!859914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294612 () Bool)

(declare-fun res!859918 () Bool)

(assert (=> b!1294612 (=> (not res!859918) (not e!738950))))

(assert (=> b!1294612 (= res!859918 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42002 _keys!1741))))))

(assert (= (and start!109518 res!859916) b!1294609))

(assert (= (and b!1294609 res!859915) b!1294611))

(assert (= (and b!1294611 res!859914) b!1294608))

(assert (= (and b!1294608 res!859910) b!1294612))

(assert (= (and b!1294612 res!859918) b!1294601))

(assert (= (and b!1294601 res!859912) b!1294603))

(assert (= (and b!1294603 res!859917) b!1294604))

(assert (= (and b!1294604 res!859913) b!1294606))

(assert (= (and b!1294606 (not res!859911)) b!1294602))

(assert (= (and b!1294610 condMapEmpty!53195) mapIsEmpty!53195))

(assert (= (and b!1294610 (not condMapEmpty!53195)) mapNonEmpty!53195))

(get-info :version)

(assert (= (and mapNonEmpty!53195 ((_ is ValueCellFull!16313) mapValue!53195)) b!1294607))

(assert (= (and b!1294610 ((_ is ValueCellFull!16313) mapDefault!53195)) b!1294605))

(assert (= start!109518 b!1294610))

(declare-fun m!1187325 () Bool)

(assert (=> b!1294606 m!1187325))

(declare-fun m!1187327 () Bool)

(assert (=> b!1294606 m!1187327))

(declare-fun m!1187329 () Bool)

(assert (=> start!109518 m!1187329))

(declare-fun m!1187331 () Bool)

(assert (=> start!109518 m!1187331))

(declare-fun m!1187333 () Bool)

(assert (=> start!109518 m!1187333))

(declare-fun m!1187335 () Bool)

(assert (=> mapNonEmpty!53195 m!1187335))

(declare-fun m!1187337 () Bool)

(assert (=> b!1294608 m!1187337))

(declare-fun m!1187339 () Bool)

(assert (=> b!1294601 m!1187339))

(assert (=> b!1294601 m!1187339))

(declare-fun m!1187341 () Bool)

(assert (=> b!1294601 m!1187341))

(declare-fun m!1187343 () Bool)

(assert (=> b!1294602 m!1187343))

(assert (=> b!1294602 m!1187343))

(declare-fun m!1187345 () Bool)

(assert (=> b!1294602 m!1187345))

(declare-fun m!1187347 () Bool)

(assert (=> b!1294602 m!1187347))

(declare-fun m!1187349 () Bool)

(assert (=> b!1294602 m!1187349))

(declare-fun m!1187351 () Bool)

(assert (=> b!1294604 m!1187351))

(assert (=> b!1294604 m!1187351))

(declare-fun m!1187353 () Bool)

(assert (=> b!1294604 m!1187353))

(declare-fun m!1187355 () Bool)

(assert (=> b!1294611 m!1187355))

(check-sat (not b!1294601) (not b!1294604) (not b!1294611) (not b!1294608) (not start!109518) b_and!46875 (not b!1294606) (not b!1294602) (not b_next!28783) (not mapNonEmpty!53195) tp_is_empty!34423)
(check-sat b_and!46875 (not b_next!28783))
