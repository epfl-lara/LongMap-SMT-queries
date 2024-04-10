; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112566 () Bool)

(assert start!112566)

(declare-fun b_free!30961 () Bool)

(declare-fun b_next!30961 () Bool)

(assert (=> start!112566 (= b_free!30961 (not b_next!30961))))

(declare-fun tp!108519 () Bool)

(declare-fun b_and!49869 () Bool)

(assert (=> start!112566 (= tp!108519 b_and!49869)))

(declare-fun b!1335273 () Bool)

(declare-fun res!886194 () Bool)

(declare-fun e!760488 () Bool)

(assert (=> b!1335273 (=> (not res!886194) (not e!760488))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90602 0))(
  ( (array!90603 (arr!43767 (Array (_ BitVec 32) (_ BitVec 64))) (size!44317 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90602)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1335273 (= res!886194 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44317 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335274 () Bool)

(declare-fun res!886192 () Bool)

(assert (=> b!1335274 (=> (not res!886192) (not e!760488))))

(declare-datatypes ((List!31009 0))(
  ( (Nil!31006) (Cons!31005 (h!32214 (_ BitVec 64)) (t!45273 List!31009)) )
))
(declare-fun arrayNoDuplicates!0 (array!90602 (_ BitVec 32) List!31009) Bool)

(assert (=> b!1335274 (= res!886192 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31006))))

(declare-fun b!1335275 () Bool)

(assert (=> b!1335275 (= e!760488 false)))

(declare-datatypes ((V!54265 0))(
  ( (V!54266 (val!18510 Int)) )
))
(declare-datatypes ((ValueCell!17537 0))(
  ( (ValueCellFull!17537 (v!21147 V!54265)) (EmptyCell!17537) )
))
(declare-datatypes ((array!90604 0))(
  ( (array!90605 (arr!43768 (Array (_ BitVec 32) ValueCell!17537)) (size!44318 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90604)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592438 () Bool)

(declare-fun minValue!1262 () V!54265)

(declare-fun zeroValue!1262 () V!54265)

(declare-datatypes ((tuple2!23868 0))(
  ( (tuple2!23869 (_1!11945 (_ BitVec 64)) (_2!11945 V!54265)) )
))
(declare-datatypes ((List!31010 0))(
  ( (Nil!31007) (Cons!31006 (h!32215 tuple2!23868) (t!45274 List!31010)) )
))
(declare-datatypes ((ListLongMap!21525 0))(
  ( (ListLongMap!21526 (toList!10778 List!31010)) )
))
(declare-fun contains!8942 (ListLongMap!21525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5752 (array!90602 array!90604 (_ BitVec 32) (_ BitVec 32) V!54265 V!54265 (_ BitVec 32) Int) ListLongMap!21525)

(assert (=> b!1335275 (= lt!592438 (contains!8942 (getCurrentListMap!5752 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1335276 () Bool)

(declare-fun e!760491 () Bool)

(declare-fun e!760490 () Bool)

(declare-fun mapRes!56980 () Bool)

(assert (=> b!1335276 (= e!760491 (and e!760490 mapRes!56980))))

(declare-fun condMapEmpty!56980 () Bool)

(declare-fun mapDefault!56980 () ValueCell!17537)

