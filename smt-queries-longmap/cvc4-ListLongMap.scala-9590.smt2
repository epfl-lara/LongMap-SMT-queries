; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113406 () Bool)

(assert start!113406)

(declare-fun b_free!31457 () Bool)

(declare-fun b_next!31457 () Bool)

(assert (=> start!113406 (= b_free!31457 (not b_next!31457))))

(declare-fun tp!110175 () Bool)

(declare-fun b_and!50745 () Bool)

(assert (=> start!113406 (= tp!110175 b_and!50745)))

(declare-fun mapIsEmpty!57892 () Bool)

(declare-fun mapRes!57892 () Bool)

(assert (=> mapIsEmpty!57892 mapRes!57892))

(declare-fun b!1346226 () Bool)

(declare-fun res!893295 () Bool)

(declare-fun e!765987 () Bool)

(assert (=> b!1346226 (=> (not res!893295) (not e!765987))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((array!91750 0))(
  ( (array!91751 (arr!44331 (Array (_ BitVec 32) (_ BitVec 64))) (size!44881 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91750)

(assert (=> b!1346226 (= res!893295 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44881 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346227 () Bool)

(declare-fun e!765989 () Bool)

(declare-fun tp_is_empty!37457 () Bool)

(assert (=> b!1346227 (= e!765989 tp_is_empty!37457)))

(declare-fun b!1346228 () Bool)

(declare-fun e!765988 () Bool)

(assert (=> b!1346228 (= e!765988 tp_is_empty!37457)))

(declare-fun b!1346229 () Bool)

(declare-fun res!893293 () Bool)

(assert (=> b!1346229 (=> (not res!893293) (not e!765987))))

(declare-datatypes ((List!31394 0))(
  ( (Nil!31391) (Cons!31390 (h!32599 (_ BitVec 64)) (t!45984 List!31394)) )
))
(declare-fun arrayNoDuplicates!0 (array!91750 (_ BitVec 32) List!31394) Bool)

(assert (=> b!1346229 (= res!893293 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31391))))

(declare-fun b!1346230 () Bool)

(assert (=> b!1346230 (= e!765987 false)))

(declare-datatypes ((V!55045 0))(
  ( (V!55046 (val!18803 Int)) )
))
(declare-fun minValue!1245 () V!55045)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun lt!595488 () Bool)

(declare-fun zeroValue!1245 () V!55045)

(declare-datatypes ((ValueCell!17830 0))(
  ( (ValueCellFull!17830 (v!21451 V!55045)) (EmptyCell!17830) )
))
(declare-datatypes ((array!91752 0))(
  ( (array!91753 (arr!44332 (Array (_ BitVec 32) ValueCell!17830)) (size!44882 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91752)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24240 0))(
  ( (tuple2!24241 (_1!12131 (_ BitVec 64)) (_2!12131 V!55045)) )
))
(declare-datatypes ((List!31395 0))(
  ( (Nil!31392) (Cons!31391 (h!32600 tuple2!24240) (t!45985 List!31395)) )
))
(declare-datatypes ((ListLongMap!21897 0))(
  ( (ListLongMap!21898 (toList!10964 List!31395)) )
))
(declare-fun contains!9140 (ListLongMap!21897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5916 (array!91750 array!91752 (_ BitVec 32) (_ BitVec 32) V!55045 V!55045 (_ BitVec 32) Int) ListLongMap!21897)

(assert (=> b!1346230 (= lt!595488 (contains!9140 (getCurrentListMap!5916 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346231 () Bool)

(declare-fun e!765985 () Bool)

(assert (=> b!1346231 (= e!765985 (and e!765989 mapRes!57892))))

(declare-fun condMapEmpty!57892 () Bool)

(declare-fun mapDefault!57892 () ValueCell!17830)

