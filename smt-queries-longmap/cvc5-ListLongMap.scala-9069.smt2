; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109198 () Bool)

(assert start!109198)

(declare-fun b_free!28687 () Bool)

(declare-fun b_next!28687 () Bool)

(assert (=> start!109198 (= b_free!28687 (not b_next!28687))))

(declare-fun tp!101180 () Bool)

(declare-fun b_and!46777 () Bool)

(assert (=> start!109198 (= tp!101180 b_and!46777)))

(declare-fun b!1291649 () Bool)

(declare-fun e!737320 () Bool)

(declare-fun e!737319 () Bool)

(assert (=> b!1291649 (= e!737320 (not e!737319))))

(declare-fun res!858175 () Bool)

(assert (=> b!1291649 (=> res!858175 e!737319)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291649 (= res!858175 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50873 0))(
  ( (V!50874 (val!17238 Int)) )
))
(declare-datatypes ((tuple2!22168 0))(
  ( (tuple2!22169 (_1!11095 (_ BitVec 64)) (_2!11095 V!50873)) )
))
(declare-datatypes ((List!29324 0))(
  ( (Nil!29321) (Cons!29320 (h!30529 tuple2!22168) (t!42888 List!29324)) )
))
(declare-datatypes ((ListLongMap!19825 0))(
  ( (ListLongMap!19826 (toList!9928 List!29324)) )
))
(declare-fun contains!8046 (ListLongMap!19825 (_ BitVec 64)) Bool)

(assert (=> b!1291649 (not (contains!8046 (ListLongMap!19826 Nil!29321) k!1205))))

(declare-datatypes ((Unit!42766 0))(
  ( (Unit!42767) )
))
(declare-fun lt!579231 () Unit!42766)

(declare-fun emptyContainsNothing!105 ((_ BitVec 64)) Unit!42766)

(assert (=> b!1291649 (= lt!579231 (emptyContainsNothing!105 k!1205))))

(declare-fun b!1291650 () Bool)

(declare-fun e!737321 () Bool)

(declare-fun tp_is_empty!34327 () Bool)

(assert (=> b!1291650 (= e!737321 tp_is_empty!34327)))

(declare-fun b!1291651 () Bool)

(declare-fun res!858181 () Bool)

(assert (=> b!1291651 (=> (not res!858181) (not e!737320))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85690 0))(
  ( (array!85691 (arr!41346 (Array (_ BitVec 32) (_ BitVec 64))) (size!41896 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85690)

(assert (=> b!1291651 (= res!858181 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41896 _keys!1741))))))

(declare-fun b!1291652 () Bool)

(declare-fun res!858183 () Bool)

(assert (=> b!1291652 (=> (not res!858183) (not e!737320))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16265 0))(
  ( (ValueCellFull!16265 (v!19841 V!50873)) (EmptyCell!16265) )
))
(declare-datatypes ((array!85692 0))(
  ( (array!85693 (arr!41347 (Array (_ BitVec 32) ValueCell!16265)) (size!41897 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85692)

(assert (=> b!1291652 (= res!858183 (and (= (size!41897 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41896 _keys!1741) (size!41897 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53051 () Bool)

(declare-fun mapRes!53051 () Bool)

(declare-fun tp!101179 () Bool)

(assert (=> mapNonEmpty!53051 (= mapRes!53051 (and tp!101179 e!737321))))

(declare-fun mapRest!53051 () (Array (_ BitVec 32) ValueCell!16265))

(declare-fun mapValue!53051 () ValueCell!16265)

(declare-fun mapKey!53051 () (_ BitVec 32))

(assert (=> mapNonEmpty!53051 (= (arr!41347 _values!1445) (store mapRest!53051 mapKey!53051 mapValue!53051))))

(declare-fun b!1291653 () Bool)

(declare-fun res!858179 () Bool)

(assert (=> b!1291653 (=> (not res!858179) (not e!737320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291653 (= res!858179 (not (validKeyInArray!0 (select (arr!41346 _keys!1741) from!2144))))))

(declare-fun b!1291654 () Bool)

(declare-fun e!737324 () Bool)

(assert (=> b!1291654 (= e!737324 tp_is_empty!34327)))

(declare-fun b!1291655 () Bool)

(declare-fun e!737323 () Bool)

(assert (=> b!1291655 (= e!737323 (and e!737324 mapRes!53051))))

(declare-fun condMapEmpty!53051 () Bool)

(declare-fun mapDefault!53051 () ValueCell!16265)

