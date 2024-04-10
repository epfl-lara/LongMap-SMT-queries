; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109060 () Bool)

(assert start!109060)

(declare-fun b_free!28549 () Bool)

(declare-fun b_next!28549 () Bool)

(assert (=> start!109060 (= b_free!28549 (not b_next!28549))))

(declare-fun tp!100765 () Bool)

(declare-fun b_and!46639 () Bool)

(assert (=> start!109060 (= tp!100765 b_and!46639)))

(declare-fun b!1289165 () Bool)

(declare-fun res!856320 () Bool)

(declare-fun e!736079 () Bool)

(assert (=> b!1289165 (=> (not res!856320) (not e!736079))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85420 0))(
  ( (array!85421 (arr!41211 (Array (_ BitVec 32) (_ BitVec 64))) (size!41761 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85420)

(assert (=> b!1289165 (= res!856320 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41761 _keys!1741))))))

(declare-fun mapNonEmpty!52844 () Bool)

(declare-fun mapRes!52844 () Bool)

(declare-fun tp!100766 () Bool)

(declare-fun e!736082 () Bool)

(assert (=> mapNonEmpty!52844 (= mapRes!52844 (and tp!100766 e!736082))))

(declare-fun mapKey!52844 () (_ BitVec 32))

(declare-datatypes ((V!50689 0))(
  ( (V!50690 (val!17169 Int)) )
))
(declare-datatypes ((ValueCell!16196 0))(
  ( (ValueCellFull!16196 (v!19772 V!50689)) (EmptyCell!16196) )
))
(declare-datatypes ((array!85422 0))(
  ( (array!85423 (arr!41212 (Array (_ BitVec 32) ValueCell!16196)) (size!41762 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85422)

(declare-fun mapRest!52844 () (Array (_ BitVec 32) ValueCell!16196))

(declare-fun mapValue!52844 () ValueCell!16196)

(assert (=> mapNonEmpty!52844 (= (arr!41212 _values!1445) (store mapRest!52844 mapKey!52844 mapValue!52844))))

(declare-fun b!1289167 () Bool)

(declare-fun res!856317 () Bool)

(assert (=> b!1289167 (=> (not res!856317) (not e!736079))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1289167 (= res!856317 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41761 _keys!1741))))))

(declare-fun b!1289168 () Bool)

(declare-fun res!856313 () Bool)

(assert (=> b!1289168 (=> (not res!856313) (not e!736079))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289168 (= res!856313 (and (= (size!41762 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41761 _keys!1741) (size!41762 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289169 () Bool)

(declare-fun res!856316 () Bool)

(assert (=> b!1289169 (=> (not res!856316) (not e!736079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289169 (= res!856316 (not (validKeyInArray!0 (select (arr!41211 _keys!1741) from!2144))))))

(declare-fun b!1289170 () Bool)

(declare-fun e!736077 () Bool)

(declare-fun tp_is_empty!34189 () Bool)

(assert (=> b!1289170 (= e!736077 tp_is_empty!34189)))

(declare-fun b!1289171 () Bool)

(declare-fun res!856319 () Bool)

(assert (=> b!1289171 (=> (not res!856319) (not e!736079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85420 (_ BitVec 32)) Bool)

(assert (=> b!1289171 (= res!856319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!856315 () Bool)

(assert (=> start!109060 (=> (not res!856315) (not e!736079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109060 (= res!856315 (validMask!0 mask!2175))))

(assert (=> start!109060 e!736079))

(assert (=> start!109060 tp_is_empty!34189))

(assert (=> start!109060 true))

(declare-fun e!736078 () Bool)

(declare-fun array_inv!31241 (array!85422) Bool)

(assert (=> start!109060 (and (array_inv!31241 _values!1445) e!736078)))

(declare-fun array_inv!31242 (array!85420) Bool)

(assert (=> start!109060 (array_inv!31242 _keys!1741)))

(assert (=> start!109060 tp!100765))

(declare-fun b!1289166 () Bool)

(declare-fun e!736081 () Bool)

(assert (=> b!1289166 (= e!736079 (not e!736081))))

(declare-fun res!856312 () Bool)

(assert (=> b!1289166 (=> res!856312 e!736081)))

(assert (=> b!1289166 (= res!856312 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22048 0))(
  ( (tuple2!22049 (_1!11035 (_ BitVec 64)) (_2!11035 V!50689)) )
))
(declare-datatypes ((List!29218 0))(
  ( (Nil!29215) (Cons!29214 (h!30423 tuple2!22048) (t!42782 List!29218)) )
))
(declare-datatypes ((ListLongMap!19705 0))(
  ( (ListLongMap!19706 (toList!9868 List!29218)) )
))
(declare-fun contains!7986 (ListLongMap!19705 (_ BitVec 64)) Bool)

(assert (=> b!1289166 (not (contains!7986 (ListLongMap!19706 Nil!29215) k!1205))))

(declare-datatypes ((Unit!42654 0))(
  ( (Unit!42655) )
))
(declare-fun lt!578172 () Unit!42654)

(declare-fun emptyContainsNothing!55 ((_ BitVec 64)) Unit!42654)

(assert (=> b!1289166 (= lt!578172 (emptyContainsNothing!55 k!1205))))

(declare-fun b!1289172 () Bool)

(assert (=> b!1289172 (= e!736082 tp_is_empty!34189)))

(declare-fun b!1289173 () Bool)

(declare-fun res!856318 () Bool)

(assert (=> b!1289173 (=> (not res!856318) (not e!736079))))

(declare-datatypes ((List!29219 0))(
  ( (Nil!29216) (Cons!29215 (h!30424 (_ BitVec 64)) (t!42783 List!29219)) )
))
(declare-fun arrayNoDuplicates!0 (array!85420 (_ BitVec 32) List!29219) Bool)

(assert (=> b!1289173 (= res!856318 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29216))))

(declare-fun mapIsEmpty!52844 () Bool)

(assert (=> mapIsEmpty!52844 mapRes!52844))

(declare-fun b!1289174 () Bool)

(declare-fun res!856314 () Bool)

(assert (=> b!1289174 (=> (not res!856314) (not e!736079))))

(declare-fun minValue!1387 () V!50689)

(declare-fun zeroValue!1387 () V!50689)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4929 (array!85420 array!85422 (_ BitVec 32) (_ BitVec 32) V!50689 V!50689 (_ BitVec 32) Int) ListLongMap!19705)

(assert (=> b!1289174 (= res!856314 (contains!7986 (getCurrentListMap!4929 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289175 () Bool)

(assert (=> b!1289175 (= e!736081 (bvsle from!2144 (size!41761 _keys!1741)))))

(declare-fun lt!578174 () ListLongMap!19705)

(declare-fun +!4340 (ListLongMap!19705 tuple2!22048) ListLongMap!19705)

(assert (=> b!1289175 (not (contains!7986 (+!4340 lt!578174 (tuple2!22049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578173 () Unit!42654)

(declare-fun addStillNotContains!358 (ListLongMap!19705 (_ BitVec 64) V!50689 (_ BitVec 64)) Unit!42654)

(assert (=> b!1289175 (= lt!578173 (addStillNotContains!358 lt!578174 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5971 (array!85420 array!85422 (_ BitVec 32) (_ BitVec 32) V!50689 V!50689 (_ BitVec 32) Int) ListLongMap!19705)

(assert (=> b!1289175 (= lt!578174 (getCurrentListMapNoExtraKeys!5971 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289176 () Bool)

(assert (=> b!1289176 (= e!736078 (and e!736077 mapRes!52844))))

(declare-fun condMapEmpty!52844 () Bool)

(declare-fun mapDefault!52844 () ValueCell!16196)

