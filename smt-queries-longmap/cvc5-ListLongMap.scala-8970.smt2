; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108546 () Bool)

(assert start!108546)

(declare-fun b_free!28093 () Bool)

(declare-fun b_next!28093 () Bool)

(assert (=> start!108546 (= b_free!28093 (not b_next!28093))))

(declare-fun tp!99388 () Bool)

(declare-fun b_and!46153 () Bool)

(assert (=> start!108546 (= tp!99388 b_and!46153)))

(declare-fun b!1281295 () Bool)

(declare-fun e!732061 () Bool)

(declare-fun tp_is_empty!33733 () Bool)

(assert (=> b!1281295 (= e!732061 tp_is_empty!33733)))

(declare-fun mapIsEmpty!52151 () Bool)

(declare-fun mapRes!52151 () Bool)

(assert (=> mapIsEmpty!52151 mapRes!52151))

(declare-fun res!851137 () Bool)

(declare-fun e!732064 () Bool)

(assert (=> start!108546 (=> (not res!851137) (not e!732064))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108546 (= res!851137 (validMask!0 mask!2175))))

(assert (=> start!108546 e!732064))

(assert (=> start!108546 tp_is_empty!33733))

(assert (=> start!108546 true))

(declare-datatypes ((V!50081 0))(
  ( (V!50082 (val!16941 Int)) )
))
(declare-datatypes ((ValueCell!15968 0))(
  ( (ValueCellFull!15968 (v!19541 V!50081)) (EmptyCell!15968) )
))
(declare-datatypes ((array!84536 0))(
  ( (array!84537 (arr!40772 (Array (_ BitVec 32) ValueCell!15968)) (size!41322 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84536)

(declare-fun e!732062 () Bool)

(declare-fun array_inv!30937 (array!84536) Bool)

(assert (=> start!108546 (and (array_inv!30937 _values!1445) e!732062)))

(declare-datatypes ((array!84538 0))(
  ( (array!84539 (arr!40773 (Array (_ BitVec 32) (_ BitVec 64))) (size!41323 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84538)

(declare-fun array_inv!30938 (array!84538) Bool)

(assert (=> start!108546 (array_inv!30938 _keys!1741)))

(assert (=> start!108546 tp!99388))

(declare-fun b!1281296 () Bool)

(declare-fun res!851135 () Bool)

(assert (=> b!1281296 (=> (not res!851135) (not e!732064))))

(declare-datatypes ((List!28882 0))(
  ( (Nil!28879) (Cons!28878 (h!30087 (_ BitVec 64)) (t!42422 List!28882)) )
))
(declare-fun arrayNoDuplicates!0 (array!84538 (_ BitVec 32) List!28882) Bool)

(assert (=> b!1281296 (= res!851135 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28879))))

(declare-fun b!1281297 () Bool)

(assert (=> b!1281297 (= e!732064 (not true))))

(declare-fun minValue!1387 () V!50081)

(declare-fun zeroValue!1387 () V!50081)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21688 0))(
  ( (tuple2!21689 (_1!10855 (_ BitVec 64)) (_2!10855 V!50081)) )
))
(declare-datatypes ((List!28883 0))(
  ( (Nil!28880) (Cons!28879 (h!30088 tuple2!21688) (t!42423 List!28883)) )
))
(declare-datatypes ((ListLongMap!19345 0))(
  ( (ListLongMap!19346 (toList!9688 List!28883)) )
))
(declare-fun contains!7803 (ListLongMap!19345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4772 (array!84538 array!84536 (_ BitVec 32) (_ BitVec 32) V!50081 V!50081 (_ BitVec 32) Int) ListLongMap!19345)

(assert (=> b!1281297 (contains!7803 (getCurrentListMap!4772 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42433 0))(
  ( (Unit!42434) )
))
(declare-fun lt!576212 () Unit!42433)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!21 (array!84538 array!84536 (_ BitVec 32) (_ BitVec 32) V!50081 V!50081 (_ BitVec 64) (_ BitVec 32) Int) Unit!42433)

(assert (=> b!1281297 (= lt!576212 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!21 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281298 () Bool)

(declare-fun res!851134 () Bool)

(assert (=> b!1281298 (=> (not res!851134) (not e!732064))))

(assert (=> b!1281298 (= res!851134 (contains!7803 (getCurrentListMap!4772 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1281299 () Bool)

(declare-fun res!851138 () Bool)

(assert (=> b!1281299 (=> (not res!851138) (not e!732064))))

(assert (=> b!1281299 (= res!851138 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41323 _keys!1741)) (not (= (select (arr!40773 _keys!1741) from!2144) k!1205))))))

(declare-fun mapNonEmpty!52151 () Bool)

(declare-fun tp!99389 () Bool)

(declare-fun e!732065 () Bool)

(assert (=> mapNonEmpty!52151 (= mapRes!52151 (and tp!99389 e!732065))))

(declare-fun mapValue!52151 () ValueCell!15968)

(declare-fun mapRest!52151 () (Array (_ BitVec 32) ValueCell!15968))

(declare-fun mapKey!52151 () (_ BitVec 32))

(assert (=> mapNonEmpty!52151 (= (arr!40772 _values!1445) (store mapRest!52151 mapKey!52151 mapValue!52151))))

(declare-fun b!1281300 () Bool)

(declare-fun res!851133 () Bool)

(assert (=> b!1281300 (=> (not res!851133) (not e!732064))))

(assert (=> b!1281300 (= res!851133 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41323 _keys!1741))))))

(declare-fun b!1281301 () Bool)

(assert (=> b!1281301 (= e!732065 tp_is_empty!33733)))

(declare-fun b!1281302 () Bool)

(declare-fun res!851132 () Bool)

(assert (=> b!1281302 (=> (not res!851132) (not e!732064))))

(assert (=> b!1281302 (= res!851132 (and (= (size!41322 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41323 _keys!1741) (size!41322 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281303 () Bool)

(assert (=> b!1281303 (= e!732062 (and e!732061 mapRes!52151))))

(declare-fun condMapEmpty!52151 () Bool)

(declare-fun mapDefault!52151 () ValueCell!15968)

