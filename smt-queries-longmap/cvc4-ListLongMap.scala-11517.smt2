; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134080 () Bool)

(assert start!134080)

(declare-fun b_free!32207 () Bool)

(declare-fun b_next!32207 () Bool)

(assert (=> start!134080 (= b_free!32207 (not b_next!32207))))

(declare-fun tp!113939 () Bool)

(declare-fun b_and!51851 () Bool)

(assert (=> start!134080 (= tp!113939 b_and!51851)))

(declare-fun b!1567063 () Bool)

(declare-fun res!1071020 () Bool)

(declare-fun e!873512 () Bool)

(assert (=> b!1567063 (=> (not res!1071020) (not e!873512))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104664 0))(
  ( (array!104665 (arr!50517 (Array (_ BitVec 32) (_ BitVec 64))) (size!51067 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104664)

(assert (=> b!1567063 (= res!1071020 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51067 _keys!637)) (bvslt from!782 (size!51067 _keys!637))))))

(declare-fun b!1567064 () Bool)

(declare-fun res!1071019 () Bool)

(assert (=> b!1567064 (=> (not res!1071019) (not e!873512))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104664 (_ BitVec 32)) Bool)

(assert (=> b!1567064 (= res!1071019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567065 () Bool)

(declare-fun e!873513 () Bool)

(declare-fun tp_is_empty!38987 () Bool)

(assert (=> b!1567065 (= e!873513 tp_is_empty!38987)))

(declare-fun b!1567066 () Bool)

(declare-fun e!873517 () Bool)

(assert (=> b!1567066 (= e!873512 e!873517)))

(declare-fun res!1071021 () Bool)

(assert (=> b!1567066 (=> (not res!1071021) (not e!873517))))

(declare-datatypes ((V!60189 0))(
  ( (V!60190 (val!19577 Int)) )
))
(declare-datatypes ((tuple2!25260 0))(
  ( (tuple2!25261 (_1!12641 (_ BitVec 64)) (_2!12641 V!60189)) )
))
(declare-datatypes ((List!36647 0))(
  ( (Nil!36644) (Cons!36643 (h!38090 tuple2!25260) (t!51551 List!36647)) )
))
(declare-datatypes ((ListLongMap!22695 0))(
  ( (ListLongMap!22696 (toList!11363 List!36647)) )
))
(declare-fun lt!672856 () ListLongMap!22695)

(declare-fun contains!10357 (ListLongMap!22695 (_ BitVec 64)) Bool)

(assert (=> b!1567066 (= res!1071021 (not (contains!10357 lt!672856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60189)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60189)

(declare-datatypes ((ValueCell!18463 0))(
  ( (ValueCellFull!18463 (v!22336 V!60189)) (EmptyCell!18463) )
))
(declare-datatypes ((array!104666 0))(
  ( (array!104667 (arr!50518 (Array (_ BitVec 32) ValueCell!18463)) (size!51068 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104666)

(declare-fun getCurrentListMapNoExtraKeys!6728 (array!104664 array!104666 (_ BitVec 32) (_ BitVec 32) V!60189 V!60189 (_ BitVec 32) Int) ListLongMap!22695)

(assert (=> b!1567066 (= lt!672856 (getCurrentListMapNoExtraKeys!6728 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567068 () Bool)

(declare-fun e!873514 () Bool)

(declare-fun e!873515 () Bool)

(declare-fun mapRes!59880 () Bool)

(assert (=> b!1567068 (= e!873514 (and e!873515 mapRes!59880))))

(declare-fun condMapEmpty!59880 () Bool)

(declare-fun mapDefault!59880 () ValueCell!18463)

