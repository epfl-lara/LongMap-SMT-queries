; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133892 () Bool)

(assert start!133892)

(declare-fun b_free!32137 () Bool)

(declare-fun b_next!32137 () Bool)

(assert (=> start!133892 (= b_free!32137 (not b_next!32137))))

(declare-fun tp!113710 () Bool)

(declare-fun b_and!51711 () Bool)

(assert (=> start!133892 (= tp!113710 b_and!51711)))

(declare-fun b!1565251 () Bool)

(declare-fun e!872458 () Bool)

(declare-fun tp_is_empty!38911 () Bool)

(assert (=> b!1565251 (= e!872458 tp_is_empty!38911)))

(declare-fun b!1565252 () Bool)

(declare-fun e!872454 () Bool)

(declare-datatypes ((array!104510 0))(
  ( (array!104511 (arr!50443 (Array (_ BitVec 32) (_ BitVec 64))) (size!50993 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104510)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565252 (= e!872454 (not (bvslt (bvsub (size!50993 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50993 _keys!637)) from!782))))))

(declare-datatypes ((V!60089 0))(
  ( (V!60090 (val!19539 Int)) )
))
(declare-datatypes ((tuple2!25206 0))(
  ( (tuple2!25207 (_1!12614 (_ BitVec 64)) (_2!12614 V!60089)) )
))
(declare-datatypes ((List!36595 0))(
  ( (Nil!36592) (Cons!36591 (h!38037 tuple2!25206) (t!51446 List!36595)) )
))
(declare-datatypes ((ListLongMap!22641 0))(
  ( (ListLongMap!22642 (toList!11336 List!36595)) )
))
(declare-fun lt!672184 () ListLongMap!22641)

(declare-fun lt!672183 () V!60089)

(declare-fun contains!10325 (ListLongMap!22641 (_ BitVec 64)) Bool)

(declare-fun +!5066 (ListLongMap!22641 tuple2!25206) ListLongMap!22641)

(assert (=> b!1565252 (not (contains!10325 (+!5066 lt!672184 (tuple2!25207 (select (arr!50443 _keys!637) from!782) lt!672183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51995 0))(
  ( (Unit!51996) )
))
(declare-fun lt!672185 () Unit!51995)

(declare-fun addStillNotContains!556 (ListLongMap!22641 (_ BitVec 64) V!60089 (_ BitVec 64)) Unit!51995)

(assert (=> b!1565252 (= lt!672185 (addStillNotContains!556 lt!672184 (select (arr!50443 _keys!637) from!782) lt!672183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18425 0))(
  ( (ValueCellFull!18425 (v!22294 V!60089)) (EmptyCell!18425) )
))
(declare-datatypes ((array!104512 0))(
  ( (array!104513 (arr!50444 (Array (_ BitVec 32) ValueCell!18425)) (size!50994 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104512)

(declare-fun get!26325 (ValueCell!18425 V!60089) V!60089)

(declare-fun dynLambda!3850 (Int (_ BitVec 64)) V!60089)

(assert (=> b!1565252 (= lt!672183 (get!26325 (select (arr!50444 _values!487) from!782) (dynLambda!3850 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60089)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60089)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6701 (array!104510 array!104512 (_ BitVec 32) (_ BitVec 32) V!60089 V!60089 (_ BitVec 32) Int) ListLongMap!22641)

(assert (=> b!1565252 (= lt!672184 (getCurrentListMapNoExtraKeys!6701 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565253 () Bool)

(declare-fun res!1070006 () Bool)

(assert (=> b!1565253 (=> (not res!1070006) (not e!872454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565253 (= res!1070006 (validKeyInArray!0 (select (arr!50443 _keys!637) from!782)))))

(declare-fun b!1565254 () Bool)

(declare-fun e!872457 () Bool)

(declare-fun mapRes!59755 () Bool)

(assert (=> b!1565254 (= e!872457 (and e!872458 mapRes!59755))))

(declare-fun condMapEmpty!59755 () Bool)

(declare-fun mapDefault!59755 () ValueCell!18425)

