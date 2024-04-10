; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113072 () Bool)

(assert start!113072)

(declare-fun b_free!31123 () Bool)

(declare-fun b_next!31123 () Bool)

(assert (=> start!113072 (= b_free!31123 (not b_next!31123))))

(declare-fun tp!109174 () Bool)

(declare-fun b_and!50153 () Bool)

(assert (=> start!113072 (= tp!109174 b_and!50153)))

(declare-fun b!1340231 () Bool)

(declare-fun res!889064 () Bool)

(declare-fun e!763401 () Bool)

(assert (=> b!1340231 (=> (not res!889064) (not e!763401))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91098 0))(
  ( (array!91099 (arr!44005 (Array (_ BitVec 32) (_ BitVec 64))) (size!44555 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91098)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54601 0))(
  ( (V!54602 (val!18636 Int)) )
))
(declare-datatypes ((ValueCell!17663 0))(
  ( (ValueCellFull!17663 (v!21284 V!54601)) (EmptyCell!17663) )
))
(declare-datatypes ((array!91100 0))(
  ( (array!91101 (arr!44006 (Array (_ BitVec 32) ValueCell!17663)) (size!44556 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91100)

(assert (=> b!1340231 (= res!889064 (and (= (size!44556 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44555 _keys!1571) (size!44556 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340232 () Bool)

(assert (=> b!1340232 (= e!763401 false)))

(declare-fun minValue!1245 () V!54601)

(declare-fun zeroValue!1245 () V!54601)

(declare-fun lt!593970 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23984 0))(
  ( (tuple2!23985 (_1!12003 (_ BitVec 64)) (_2!12003 V!54601)) )
))
(declare-datatypes ((List!31148 0))(
  ( (Nil!31145) (Cons!31144 (h!32353 tuple2!23984) (t!45482 List!31148)) )
))
(declare-datatypes ((ListLongMap!21641 0))(
  ( (ListLongMap!21642 (toList!10836 List!31148)) )
))
(declare-fun contains!9012 (ListLongMap!21641 (_ BitVec 64)) Bool)

(declare-fun +!4754 (ListLongMap!21641 tuple2!23984) ListLongMap!21641)

(declare-fun getCurrentListMapNoExtraKeys!6396 (array!91098 array!91100 (_ BitVec 32) (_ BitVec 32) V!54601 V!54601 (_ BitVec 32) Int) ListLongMap!21641)

(declare-fun get!22201 (ValueCell!17663 V!54601) V!54601)

(declare-fun dynLambda!3693 (Int (_ BitVec 64)) V!54601)

(assert (=> b!1340232 (= lt!593970 (contains!9012 (+!4754 (+!4754 (getCurrentListMapNoExtraKeys!6396 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!23985 (select (arr!44005 _keys!1571) from!1960) (get!22201 (select (arr!44006 _values!1303) from!1960) (dynLambda!3693 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142))))

(declare-fun mapNonEmpty!57391 () Bool)

(declare-fun mapRes!57391 () Bool)

(declare-fun tp!109173 () Bool)

(declare-fun e!763400 () Bool)

(assert (=> mapNonEmpty!57391 (= mapRes!57391 (and tp!109173 e!763400))))

(declare-fun mapRest!57391 () (Array (_ BitVec 32) ValueCell!17663))

(declare-fun mapKey!57391 () (_ BitVec 32))

(declare-fun mapValue!57391 () ValueCell!17663)

(assert (=> mapNonEmpty!57391 (= (arr!44006 _values!1303) (store mapRest!57391 mapKey!57391 mapValue!57391))))

(declare-fun b!1340234 () Bool)

(declare-fun res!889058 () Bool)

(assert (=> b!1340234 (=> (not res!889058) (not e!763401))))

(assert (=> b!1340234 (= res!889058 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44555 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340235 () Bool)

(declare-fun e!763399 () Bool)

(declare-fun tp_is_empty!37123 () Bool)

(assert (=> b!1340235 (= e!763399 tp_is_empty!37123)))

(declare-fun b!1340236 () Bool)

(declare-fun res!889057 () Bool)

(assert (=> b!1340236 (=> (not res!889057) (not e!763401))))

(assert (=> b!1340236 (= res!889057 (not (= (select (arr!44005 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340237 () Bool)

(declare-fun res!889065 () Bool)

(assert (=> b!1340237 (=> (not res!889065) (not e!763401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340237 (= res!889065 (validKeyInArray!0 (select (arr!44005 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57391 () Bool)

(assert (=> mapIsEmpty!57391 mapRes!57391))

(declare-fun b!1340238 () Bool)

(declare-fun e!763402 () Bool)

(assert (=> b!1340238 (= e!763402 (and e!763399 mapRes!57391))))

(declare-fun condMapEmpty!57391 () Bool)

(declare-fun mapDefault!57391 () ValueCell!17663)

