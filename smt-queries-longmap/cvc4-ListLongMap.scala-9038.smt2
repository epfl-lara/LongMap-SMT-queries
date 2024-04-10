; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109016 () Bool)

(assert start!109016)

(declare-fun b_free!28505 () Bool)

(declare-fun b_next!28505 () Bool)

(assert (=> start!109016 (= b_free!28505 (not b_next!28505))))

(declare-fun tp!100634 () Bool)

(declare-fun b_and!46595 () Bool)

(assert (=> start!109016 (= tp!100634 b_and!46595)))

(declare-fun b!1288373 () Bool)

(declare-fun res!855719 () Bool)

(declare-fun e!735686 () Bool)

(assert (=> b!1288373 (=> (not res!855719) (not e!735686))))

(declare-datatypes ((array!85336 0))(
  ( (array!85337 (arr!41169 (Array (_ BitVec 32) (_ BitVec 64))) (size!41719 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85336)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288373 (= res!855719 (not (validKeyInArray!0 (select (arr!41169 _keys!1741) from!2144))))))

(declare-fun res!855726 () Bool)

(assert (=> start!109016 (=> (not res!855726) (not e!735686))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109016 (= res!855726 (validMask!0 mask!2175))))

(assert (=> start!109016 e!735686))

(declare-fun tp_is_empty!34145 () Bool)

(assert (=> start!109016 tp_is_empty!34145))

(assert (=> start!109016 true))

(declare-datatypes ((V!50629 0))(
  ( (V!50630 (val!17147 Int)) )
))
(declare-datatypes ((ValueCell!16174 0))(
  ( (ValueCellFull!16174 (v!19750 V!50629)) (EmptyCell!16174) )
))
(declare-datatypes ((array!85338 0))(
  ( (array!85339 (arr!41170 (Array (_ BitVec 32) ValueCell!16174)) (size!41720 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85338)

(declare-fun e!735683 () Bool)

(declare-fun array_inv!31217 (array!85338) Bool)

(assert (=> start!109016 (and (array_inv!31217 _values!1445) e!735683)))

(declare-fun array_inv!31218 (array!85336) Bool)

(assert (=> start!109016 (array_inv!31218 _keys!1741)))

(assert (=> start!109016 tp!100634))

(declare-fun b!1288374 () Bool)

(declare-fun e!735681 () Bool)

(assert (=> b!1288374 (= e!735681 true)))

(declare-datatypes ((tuple2!22010 0))(
  ( (tuple2!22011 (_1!11016 (_ BitVec 64)) (_2!11016 V!50629)) )
))
(declare-datatypes ((List!29184 0))(
  ( (Nil!29181) (Cons!29180 (h!30389 tuple2!22010) (t!42748 List!29184)) )
))
(declare-datatypes ((ListLongMap!19667 0))(
  ( (ListLongMap!19668 (toList!9849 List!29184)) )
))
(declare-fun lt!577975 () ListLongMap!19667)

(declare-fun zeroValue!1387 () V!50629)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7967 (ListLongMap!19667 (_ BitVec 64)) Bool)

(declare-fun +!4325 (ListLongMap!19667 tuple2!22010) ListLongMap!19667)

(assert (=> b!1288374 (not (contains!7967 (+!4325 lt!577975 (tuple2!22011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42618 0))(
  ( (Unit!42619) )
))
(declare-fun lt!577974 () Unit!42618)

(declare-fun addStillNotContains!343 (ListLongMap!19667 (_ BitVec 64) V!50629 (_ BitVec 64)) Unit!42618)

(assert (=> b!1288374 (= lt!577974 (addStillNotContains!343 lt!577975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50629)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5956 (array!85336 array!85338 (_ BitVec 32) (_ BitVec 32) V!50629 V!50629 (_ BitVec 32) Int) ListLongMap!19667)

(assert (=> b!1288374 (= lt!577975 (getCurrentListMapNoExtraKeys!5956 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288375 () Bool)

(declare-fun res!855721 () Bool)

(assert (=> b!1288375 (=> (not res!855721) (not e!735686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85336 (_ BitVec 32)) Bool)

(assert (=> b!1288375 (= res!855721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52778 () Bool)

(declare-fun mapRes!52778 () Bool)

(assert (=> mapIsEmpty!52778 mapRes!52778))

(declare-fun b!1288376 () Bool)

(declare-fun e!735685 () Bool)

(assert (=> b!1288376 (= e!735685 tp_is_empty!34145)))

(declare-fun b!1288377 () Bool)

(declare-fun res!855723 () Bool)

(assert (=> b!1288377 (=> (not res!855723) (not e!735686))))

(assert (=> b!1288377 (= res!855723 (and (= (size!41720 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41719 _keys!1741) (size!41720 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52778 () Bool)

(declare-fun tp!100633 () Bool)

(assert (=> mapNonEmpty!52778 (= mapRes!52778 (and tp!100633 e!735685))))

(declare-fun mapRest!52778 () (Array (_ BitVec 32) ValueCell!16174))

(declare-fun mapKey!52778 () (_ BitVec 32))

(declare-fun mapValue!52778 () ValueCell!16174)

(assert (=> mapNonEmpty!52778 (= (arr!41170 _values!1445) (store mapRest!52778 mapKey!52778 mapValue!52778))))

(declare-fun b!1288378 () Bool)

(assert (=> b!1288378 (= e!735686 (not e!735681))))

(declare-fun res!855724 () Bool)

(assert (=> b!1288378 (=> res!855724 e!735681)))

(assert (=> b!1288378 (= res!855724 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288378 (not (contains!7967 (ListLongMap!19668 Nil!29181) k!1205))))

(declare-fun lt!577976 () Unit!42618)

(declare-fun emptyContainsNothing!38 ((_ BitVec 64)) Unit!42618)

(assert (=> b!1288378 (= lt!577976 (emptyContainsNothing!38 k!1205))))

(declare-fun b!1288379 () Bool)

(declare-fun e!735684 () Bool)

(assert (=> b!1288379 (= e!735684 tp_is_empty!34145)))

(declare-fun b!1288380 () Bool)

(declare-fun res!855725 () Bool)

(assert (=> b!1288380 (=> (not res!855725) (not e!735686))))

(declare-datatypes ((List!29185 0))(
  ( (Nil!29182) (Cons!29181 (h!30390 (_ BitVec 64)) (t!42749 List!29185)) )
))
(declare-fun arrayNoDuplicates!0 (array!85336 (_ BitVec 32) List!29185) Bool)

(assert (=> b!1288380 (= res!855725 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29182))))

(declare-fun b!1288381 () Bool)

(declare-fun res!855722 () Bool)

(assert (=> b!1288381 (=> (not res!855722) (not e!735686))))

(assert (=> b!1288381 (= res!855722 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41719 _keys!1741))))))

(declare-fun b!1288382 () Bool)

(declare-fun res!855718 () Bool)

(assert (=> b!1288382 (=> (not res!855718) (not e!735686))))

(assert (=> b!1288382 (= res!855718 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41719 _keys!1741))))))

(declare-fun b!1288383 () Bool)

(assert (=> b!1288383 (= e!735683 (and e!735684 mapRes!52778))))

(declare-fun condMapEmpty!52778 () Bool)

(declare-fun mapDefault!52778 () ValueCell!16174)

