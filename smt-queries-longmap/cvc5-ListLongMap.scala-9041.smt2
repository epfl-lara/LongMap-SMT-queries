; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109030 () Bool)

(assert start!109030)

(declare-fun b_free!28519 () Bool)

(declare-fun b_next!28519 () Bool)

(assert (=> start!109030 (= b_free!28519 (not b_next!28519))))

(declare-fun tp!100675 () Bool)

(declare-fun b_and!46609 () Bool)

(assert (=> start!109030 (= tp!100675 b_and!46609)))

(declare-fun b!1288625 () Bool)

(declare-fun e!735811 () Bool)

(assert (=> b!1288625 (= e!735811 true)))

(declare-datatypes ((V!50649 0))(
  ( (V!50650 (val!17154 Int)) )
))
(declare-datatypes ((tuple2!22022 0))(
  ( (tuple2!22023 (_1!11022 (_ BitVec 64)) (_2!11022 V!50649)) )
))
(declare-datatypes ((List!29196 0))(
  ( (Nil!29193) (Cons!29192 (h!30401 tuple2!22022) (t!42760 List!29196)) )
))
(declare-datatypes ((ListLongMap!19679 0))(
  ( (ListLongMap!19680 (toList!9855 List!29196)) )
))
(declare-fun lt!578038 () ListLongMap!19679)

(declare-fun zeroValue!1387 () V!50649)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7973 (ListLongMap!19679 (_ BitVec 64)) Bool)

(declare-fun +!4329 (ListLongMap!19679 tuple2!22022) ListLongMap!19679)

(assert (=> b!1288625 (not (contains!7973 (+!4329 lt!578038 (tuple2!22023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42630 0))(
  ( (Unit!42631) )
))
(declare-fun lt!578039 () Unit!42630)

(declare-fun addStillNotContains!347 (ListLongMap!19679 (_ BitVec 64) V!50649 (_ BitVec 64)) Unit!42630)

(assert (=> b!1288625 (= lt!578039 (addStillNotContains!347 lt!578038 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50649)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16181 0))(
  ( (ValueCellFull!16181 (v!19757 V!50649)) (EmptyCell!16181) )
))
(declare-datatypes ((array!85362 0))(
  ( (array!85363 (arr!41182 (Array (_ BitVec 32) ValueCell!16181)) (size!41732 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85362)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85364 0))(
  ( (array!85365 (arr!41183 (Array (_ BitVec 32) (_ BitVec 64))) (size!41733 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85364)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5960 (array!85364 array!85362 (_ BitVec 32) (_ BitVec 32) V!50649 V!50649 (_ BitVec 32) Int) ListLongMap!19679)

(assert (=> b!1288625 (= lt!578038 (getCurrentListMapNoExtraKeys!5960 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288626 () Bool)

(declare-fun res!855910 () Bool)

(declare-fun e!735810 () Bool)

(assert (=> b!1288626 (=> (not res!855910) (not e!735810))))

(declare-datatypes ((List!29197 0))(
  ( (Nil!29194) (Cons!29193 (h!30402 (_ BitVec 64)) (t!42761 List!29197)) )
))
(declare-fun arrayNoDuplicates!0 (array!85364 (_ BitVec 32) List!29197) Bool)

(assert (=> b!1288626 (= res!855910 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29194))))

(declare-fun b!1288627 () Bool)

(assert (=> b!1288627 (= e!735810 (not e!735811))))

(declare-fun res!855907 () Bool)

(assert (=> b!1288627 (=> res!855907 e!735811)))

(assert (=> b!1288627 (= res!855907 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288627 (not (contains!7973 (ListLongMap!19680 Nil!29193) k!1205))))

(declare-fun lt!578037 () Unit!42630)

(declare-fun emptyContainsNothing!44 ((_ BitVec 64)) Unit!42630)

(assert (=> b!1288627 (= lt!578037 (emptyContainsNothing!44 k!1205))))

(declare-fun mapNonEmpty!52799 () Bool)

(declare-fun mapRes!52799 () Bool)

(declare-fun tp!100676 () Bool)

(declare-fun e!735812 () Bool)

(assert (=> mapNonEmpty!52799 (= mapRes!52799 (and tp!100676 e!735812))))

(declare-fun mapKey!52799 () (_ BitVec 32))

(declare-fun mapRest!52799 () (Array (_ BitVec 32) ValueCell!16181))

(declare-fun mapValue!52799 () ValueCell!16181)

(assert (=> mapNonEmpty!52799 (= (arr!41182 _values!1445) (store mapRest!52799 mapKey!52799 mapValue!52799))))

(declare-fun b!1288628 () Bool)

(declare-fun res!855908 () Bool)

(assert (=> b!1288628 (=> (not res!855908) (not e!735810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288628 (= res!855908 (not (validKeyInArray!0 (select (arr!41183 _keys!1741) from!2144))))))

(declare-fun b!1288629 () Bool)

(declare-fun e!735809 () Bool)

(declare-fun tp_is_empty!34159 () Bool)

(assert (=> b!1288629 (= e!735809 tp_is_empty!34159)))

(declare-fun b!1288631 () Bool)

(declare-fun res!855912 () Bool)

(assert (=> b!1288631 (=> (not res!855912) (not e!735810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85364 (_ BitVec 32)) Bool)

(assert (=> b!1288631 (= res!855912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288632 () Bool)

(declare-fun e!735807 () Bool)

(assert (=> b!1288632 (= e!735807 (and e!735809 mapRes!52799))))

(declare-fun condMapEmpty!52799 () Bool)

(declare-fun mapDefault!52799 () ValueCell!16181)

