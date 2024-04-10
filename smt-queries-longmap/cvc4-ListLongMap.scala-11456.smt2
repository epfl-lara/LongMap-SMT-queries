; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133538 () Bool)

(assert start!133538)

(declare-fun b_free!31955 () Bool)

(declare-fun b_next!31955 () Bool)

(assert (=> start!133538 (= b_free!31955 (not b_next!31955))))

(declare-fun tp!112989 () Bool)

(declare-fun b_and!51421 () Bool)

(assert (=> start!133538 (= tp!112989 b_and!51421)))

(declare-fun b!1561123 () Bool)

(declare-fun res!1067430 () Bool)

(declare-fun e!869988 () Bool)

(assert (=> b!1561123 (=> (not res!1067430) (not e!869988))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103960 0))(
  ( (array!103961 (arr!50172 (Array (_ BitVec 32) (_ BitVec 64))) (size!50722 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103960)

(declare-datatypes ((V!59701 0))(
  ( (V!59702 (val!19394 Int)) )
))
(declare-datatypes ((ValueCell!18280 0))(
  ( (ValueCellFull!18280 (v!22146 V!59701)) (EmptyCell!18280) )
))
(declare-datatypes ((array!103962 0))(
  ( (array!103963 (arr!50173 (Array (_ BitVec 32) ValueCell!18280)) (size!50723 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103962)

(assert (=> b!1561123 (= res!1067430 (and (= (size!50723 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50722 _keys!637) (size!50723 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561124 () Bool)

(declare-fun res!1067433 () Bool)

(assert (=> b!1561124 (=> (not res!1067433) (not e!869988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103960 (_ BitVec 32)) Bool)

(assert (=> b!1561124 (= res!1067433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561125 () Bool)

(declare-fun res!1067432 () Bool)

(assert (=> b!1561125 (=> (not res!1067432) (not e!869988))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561125 (= res!1067432 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50722 _keys!637)) (bvslt from!782 (size!50722 _keys!637))))))

(declare-fun b!1561126 () Bool)

(assert (=> b!1561126 (= e!869988 (not true))))

(declare-fun lt!671114 () V!59701)

(declare-datatypes ((tuple2!25050 0))(
  ( (tuple2!25051 (_1!12536 (_ BitVec 64)) (_2!12536 V!59701)) )
))
(declare-datatypes ((List!36423 0))(
  ( (Nil!36420) (Cons!36419 (h!37865 tuple2!25050) (t!51168 List!36423)) )
))
(declare-datatypes ((ListLongMap!22485 0))(
  ( (ListLongMap!22486 (toList!11258 List!36423)) )
))
(declare-fun lt!671113 () ListLongMap!22485)

(declare-fun contains!10248 (ListLongMap!22485 (_ BitVec 64)) Bool)

(declare-fun +!5028 (ListLongMap!22485 tuple2!25050) ListLongMap!22485)

(assert (=> b!1561126 (not (contains!10248 (+!5028 lt!671113 (tuple2!25051 (select (arr!50172 _keys!637) from!782) lt!671114)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51910 0))(
  ( (Unit!51911) )
))
(declare-fun lt!671115 () Unit!51910)

(declare-fun addStillNotContains!518 (ListLongMap!22485 (_ BitVec 64) V!59701 (_ BitVec 64)) Unit!51910)

(assert (=> b!1561126 (= lt!671115 (addStillNotContains!518 lt!671113 (select (arr!50172 _keys!637) from!782) lt!671114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26189 (ValueCell!18280 V!59701) V!59701)

(declare-fun dynLambda!3812 (Int (_ BitVec 64)) V!59701)

(assert (=> b!1561126 (= lt!671114 (get!26189 (select (arr!50173 _values!487) from!782) (dynLambda!3812 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59701)

(declare-fun minValue!453 () V!59701)

(declare-fun getCurrentListMapNoExtraKeys!6642 (array!103960 array!103962 (_ BitVec 32) (_ BitVec 32) V!59701 V!59701 (_ BitVec 32) Int) ListLongMap!22485)

(assert (=> b!1561126 (= lt!671113 (getCurrentListMapNoExtraKeys!6642 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561127 () Bool)

(declare-fun res!1067431 () Bool)

(assert (=> b!1561127 (=> (not res!1067431) (not e!869988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561127 (= res!1067431 (validKeyInArray!0 (select (arr!50172 _keys!637) from!782)))))

(declare-fun b!1561128 () Bool)

(declare-fun res!1067429 () Bool)

(assert (=> b!1561128 (=> (not res!1067429) (not e!869988))))

(declare-datatypes ((List!36424 0))(
  ( (Nil!36421) (Cons!36420 (h!37866 (_ BitVec 64)) (t!51169 List!36424)) )
))
(declare-fun arrayNoDuplicates!0 (array!103960 (_ BitVec 32) List!36424) Bool)

(assert (=> b!1561128 (= res!1067429 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36421))))

(declare-fun mapNonEmpty!59307 () Bool)

(declare-fun mapRes!59307 () Bool)

(declare-fun tp!112988 () Bool)

(declare-fun e!869985 () Bool)

(assert (=> mapNonEmpty!59307 (= mapRes!59307 (and tp!112988 e!869985))))

(declare-fun mapRest!59307 () (Array (_ BitVec 32) ValueCell!18280))

(declare-fun mapKey!59307 () (_ BitVec 32))

(declare-fun mapValue!59307 () ValueCell!18280)

(assert (=> mapNonEmpty!59307 (= (arr!50173 _values!487) (store mapRest!59307 mapKey!59307 mapValue!59307))))

(declare-fun b!1561129 () Bool)

(declare-fun e!869989 () Bool)

(declare-fun tp_is_empty!38621 () Bool)

(assert (=> b!1561129 (= e!869989 tp_is_empty!38621)))

(declare-fun b!1561130 () Bool)

(assert (=> b!1561130 (= e!869985 tp_is_empty!38621)))

(declare-fun b!1561131 () Bool)

(declare-fun e!869986 () Bool)

(assert (=> b!1561131 (= e!869986 (and e!869989 mapRes!59307))))

(declare-fun condMapEmpty!59307 () Bool)

(declare-fun mapDefault!59307 () ValueCell!18280)

