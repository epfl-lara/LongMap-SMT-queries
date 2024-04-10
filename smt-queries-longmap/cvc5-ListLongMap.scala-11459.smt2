; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133552 () Bool)

(assert start!133552)

(declare-fun b_free!31969 () Bool)

(declare-fun b_next!31969 () Bool)

(assert (=> start!133552 (= b_free!31969 (not b_next!31969))))

(declare-fun tp!113031 () Bool)

(declare-fun b_and!51449 () Bool)

(assert (=> start!133552 (= tp!113031 b_and!51449)))

(declare-fun mapNonEmpty!59328 () Bool)

(declare-fun mapRes!59328 () Bool)

(declare-fun tp!113030 () Bool)

(declare-fun e!870093 () Bool)

(assert (=> mapNonEmpty!59328 (= mapRes!59328 (and tp!113030 e!870093))))

(declare-datatypes ((V!59721 0))(
  ( (V!59722 (val!19401 Int)) )
))
(declare-datatypes ((ValueCell!18287 0))(
  ( (ValueCellFull!18287 (v!22153 V!59721)) (EmptyCell!18287) )
))
(declare-fun mapRest!59328 () (Array (_ BitVec 32) ValueCell!18287))

(declare-datatypes ((array!103988 0))(
  ( (array!103989 (arr!50186 (Array (_ BitVec 32) ValueCell!18287)) (size!50736 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103988)

(declare-fun mapValue!59328 () ValueCell!18287)

(declare-fun mapKey!59328 () (_ BitVec 32))

(assert (=> mapNonEmpty!59328 (= (arr!50186 _values!487) (store mapRest!59328 mapKey!59328 mapValue!59328))))

(declare-fun b!1561326 () Bool)

(declare-fun tp_is_empty!38635 () Bool)

(assert (=> b!1561326 (= e!870093 tp_is_empty!38635)))

(declare-fun mapIsEmpty!59328 () Bool)

(assert (=> mapIsEmpty!59328 mapRes!59328))

(declare-fun res!1067558 () Bool)

(declare-fun e!870091 () Bool)

(assert (=> start!133552 (=> (not res!1067558) (not e!870091))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133552 (= res!1067558 (validMask!0 mask!947))))

(assert (=> start!133552 e!870091))

(assert (=> start!133552 tp!113031))

(assert (=> start!133552 tp_is_empty!38635))

(assert (=> start!133552 true))

(declare-datatypes ((array!103990 0))(
  ( (array!103991 (arr!50187 (Array (_ BitVec 32) (_ BitVec 64))) (size!50737 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103990)

(declare-fun array_inv!39009 (array!103990) Bool)

(assert (=> start!133552 (array_inv!39009 _keys!637)))

(declare-fun e!870094 () Bool)

(declare-fun array_inv!39010 (array!103988) Bool)

(assert (=> start!133552 (and (array_inv!39010 _values!487) e!870094)))

(declare-fun b!1561327 () Bool)

(declare-fun e!870092 () Bool)

(assert (=> b!1561327 (= e!870092 tp_is_empty!38635)))

(declare-fun b!1561328 () Bool)

(declare-fun res!1067554 () Bool)

(assert (=> b!1561328 (=> (not res!1067554) (not e!870091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103990 (_ BitVec 32)) Bool)

(assert (=> b!1561328 (= res!1067554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561329 () Bool)

(declare-fun res!1067556 () Bool)

(assert (=> b!1561329 (=> (not res!1067556) (not e!870091))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561329 (= res!1067556 (validKeyInArray!0 (select (arr!50187 _keys!637) from!782)))))

(declare-fun b!1561330 () Bool)

(declare-fun res!1067559 () Bool)

(assert (=> b!1561330 (=> (not res!1067559) (not e!870091))))

(assert (=> b!1561330 (= res!1067559 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50737 _keys!637)) (bvslt from!782 (size!50737 _keys!637))))))

(declare-fun b!1561331 () Bool)

(assert (=> b!1561331 (= e!870091 (not true))))

(declare-datatypes ((tuple2!25062 0))(
  ( (tuple2!25063 (_1!12542 (_ BitVec 64)) (_2!12542 V!59721)) )
))
(declare-datatypes ((List!36432 0))(
  ( (Nil!36429) (Cons!36428 (h!37874 tuple2!25062) (t!51191 List!36432)) )
))
(declare-datatypes ((ListLongMap!22497 0))(
  ( (ListLongMap!22498 (toList!11264 List!36432)) )
))
(declare-fun lt!671177 () ListLongMap!22497)

(declare-fun lt!671178 () V!59721)

(declare-fun contains!10254 (ListLongMap!22497 (_ BitVec 64)) Bool)

(declare-fun +!5034 (ListLongMap!22497 tuple2!25062) ListLongMap!22497)

(assert (=> b!1561331 (not (contains!10254 (+!5034 lt!671177 (tuple2!25063 (select (arr!50187 _keys!637) from!782) lt!671178)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51922 0))(
  ( (Unit!51923) )
))
(declare-fun lt!671176 () Unit!51922)

(declare-fun addStillNotContains!524 (ListLongMap!22497 (_ BitVec 64) V!59721 (_ BitVec 64)) Unit!51922)

(assert (=> b!1561331 (= lt!671176 (addStillNotContains!524 lt!671177 (select (arr!50187 _keys!637) from!782) lt!671178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26201 (ValueCell!18287 V!59721) V!59721)

(declare-fun dynLambda!3818 (Int (_ BitVec 64)) V!59721)

(assert (=> b!1561331 (= lt!671178 (get!26201 (select (arr!50186 _values!487) from!782) (dynLambda!3818 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59721)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59721)

(declare-fun getCurrentListMapNoExtraKeys!6648 (array!103990 array!103988 (_ BitVec 32) (_ BitVec 32) V!59721 V!59721 (_ BitVec 32) Int) ListLongMap!22497)

(assert (=> b!1561331 (= lt!671177 (getCurrentListMapNoExtraKeys!6648 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561332 () Bool)

(declare-fun res!1067557 () Bool)

(assert (=> b!1561332 (=> (not res!1067557) (not e!870091))))

(assert (=> b!1561332 (= res!1067557 (and (= (size!50736 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50737 _keys!637) (size!50736 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561333 () Bool)

(assert (=> b!1561333 (= e!870094 (and e!870092 mapRes!59328))))

(declare-fun condMapEmpty!59328 () Bool)

(declare-fun mapDefault!59328 () ValueCell!18287)

