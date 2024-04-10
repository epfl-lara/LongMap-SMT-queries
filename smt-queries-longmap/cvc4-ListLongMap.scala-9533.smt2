; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113064 () Bool)

(assert start!113064)

(declare-fun b_free!31115 () Bool)

(declare-fun b_next!31115 () Bool)

(assert (=> start!113064 (= b_free!31115 (not b_next!31115))))

(declare-fun tp!109149 () Bool)

(declare-fun b_and!50145 () Bool)

(assert (=> start!113064 (= tp!109149 b_and!50145)))

(declare-fun b!1340100 () Bool)

(declare-fun e!763340 () Bool)

(declare-fun tp_is_empty!37115 () Bool)

(assert (=> b!1340100 (= e!763340 tp_is_empty!37115)))

(declare-fun b!1340101 () Bool)

(declare-fun e!763343 () Bool)

(assert (=> b!1340101 (= e!763343 false)))

(declare-fun lt!593967 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91084 0))(
  ( (array!91085 (arr!43998 (Array (_ BitVec 32) (_ BitVec 64))) (size!44548 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91084)

(declare-datatypes ((V!54589 0))(
  ( (V!54590 (val!18632 Int)) )
))
(declare-fun zeroValue!1245 () V!54589)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17659 0))(
  ( (ValueCellFull!17659 (v!21280 V!54589)) (EmptyCell!17659) )
))
(declare-datatypes ((array!91086 0))(
  ( (array!91087 (arr!43999 (Array (_ BitVec 32) ValueCell!17659)) (size!44549 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91086)

(declare-fun minValue!1245 () V!54589)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23978 0))(
  ( (tuple2!23979 (_1!12000 (_ BitVec 64)) (_2!12000 V!54589)) )
))
(declare-datatypes ((List!31144 0))(
  ( (Nil!31141) (Cons!31140 (h!32349 tuple2!23978) (t!45476 List!31144)) )
))
(declare-datatypes ((ListLongMap!21635 0))(
  ( (ListLongMap!21636 (toList!10833 List!31144)) )
))
(declare-fun contains!9009 (ListLongMap!21635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5802 (array!91084 array!91086 (_ BitVec 32) (_ BitVec 32) V!54589 V!54589 (_ BitVec 32) Int) ListLongMap!21635)

(assert (=> b!1340101 (= lt!593967 (contains!9009 (getCurrentListMap!5802 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340102 () Bool)

(declare-fun res!888964 () Bool)

(assert (=> b!1340102 (=> (not res!888964) (not e!763343))))

(assert (=> b!1340102 (= res!888964 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44548 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!888962 () Bool)

(assert (=> start!113064 (=> (not res!888962) (not e!763343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113064 (= res!888962 (validMask!0 mask!1977))))

(assert (=> start!113064 e!763343))

(assert (=> start!113064 tp_is_empty!37115))

(assert (=> start!113064 true))

(declare-fun array_inv!33175 (array!91084) Bool)

(assert (=> start!113064 (array_inv!33175 _keys!1571)))

(declare-fun e!763342 () Bool)

(declare-fun array_inv!33176 (array!91086) Bool)

(assert (=> start!113064 (and (array_inv!33176 _values!1303) e!763342)))

(assert (=> start!113064 tp!109149))

(declare-fun b!1340103 () Bool)

(declare-fun e!763341 () Bool)

(declare-fun mapRes!57379 () Bool)

(assert (=> b!1340103 (= e!763342 (and e!763341 mapRes!57379))))

(declare-fun condMapEmpty!57379 () Bool)

(declare-fun mapDefault!57379 () ValueCell!17659)

