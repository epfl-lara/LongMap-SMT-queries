; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133586 () Bool)

(assert start!133586)

(declare-fun b_free!32003 () Bool)

(declare-fun b_next!32003 () Bool)

(assert (=> start!133586 (= b_free!32003 (not b_next!32003))))

(declare-fun tp!113133 () Bool)

(declare-fun b_and!51517 () Bool)

(assert (=> start!133586 (= tp!113133 b_and!51517)))

(declare-fun b!1561827 () Bool)

(declare-fun res!1067868 () Bool)

(declare-fun e!870358 () Bool)

(assert (=> b!1561827 (=> (not res!1067868) (not e!870358))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104056 0))(
  ( (array!104057 (arr!50220 (Array (_ BitVec 32) (_ BitVec 64))) (size!50770 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104056)

(declare-datatypes ((V!59765 0))(
  ( (V!59766 (val!19418 Int)) )
))
(declare-datatypes ((ValueCell!18304 0))(
  ( (ValueCellFull!18304 (v!22170 V!59765)) (EmptyCell!18304) )
))
(declare-datatypes ((array!104058 0))(
  ( (array!104059 (arr!50221 (Array (_ BitVec 32) ValueCell!18304)) (size!50771 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104058)

(declare-fun mask!947 () (_ BitVec 32))

(assert (=> b!1561827 (= res!1067868 (and (= (size!50771 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50770 _keys!637) (size!50771 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561828 () Bool)

(declare-fun res!1067871 () Bool)

(assert (=> b!1561828 (=> (not res!1067871) (not e!870358))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561828 (= res!1067871 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50770 _keys!637)) (bvslt from!782 (size!50770 _keys!637))))))

(declare-fun mapNonEmpty!59379 () Bool)

(declare-fun mapRes!59379 () Bool)

(declare-fun tp!113132 () Bool)

(declare-fun e!870354 () Bool)

(assert (=> mapNonEmpty!59379 (= mapRes!59379 (and tp!113132 e!870354))))

(declare-fun mapRest!59379 () (Array (_ BitVec 32) ValueCell!18304))

(declare-fun mapKey!59379 () (_ BitVec 32))

(declare-fun mapValue!59379 () ValueCell!18304)

(assert (=> mapNonEmpty!59379 (= (arr!50221 _values!487) (store mapRest!59379 mapKey!59379 mapValue!59379))))

(declare-fun b!1561829 () Bool)

(declare-fun res!1067869 () Bool)

(assert (=> b!1561829 (=> (not res!1067869) (not e!870358))))

(declare-datatypes ((List!36457 0))(
  ( (Nil!36454) (Cons!36453 (h!37899 (_ BitVec 64)) (t!51250 List!36457)) )
))
(declare-fun arrayNoDuplicates!0 (array!104056 (_ BitVec 32) List!36457) Bool)

(assert (=> b!1561829 (= res!1067869 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36454))))

(declare-fun b!1561830 () Bool)

(declare-fun res!1067873 () Bool)

(assert (=> b!1561830 (=> (not res!1067873) (not e!870358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104056 (_ BitVec 32)) Bool)

(assert (=> b!1561830 (= res!1067873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561831 () Bool)

(declare-fun e!870356 () Bool)

(assert (=> b!1561831 (= e!870358 (not e!870356))))

(declare-fun res!1067872 () Bool)

(assert (=> b!1561831 (=> res!1067872 e!870356)))

(declare-datatypes ((tuple2!25086 0))(
  ( (tuple2!25087 (_1!12554 (_ BitVec 64)) (_2!12554 V!59765)) )
))
(declare-datatypes ((List!36458 0))(
  ( (Nil!36455) (Cons!36454 (h!37900 tuple2!25086) (t!51251 List!36458)) )
))
(declare-datatypes ((ListLongMap!22521 0))(
  ( (ListLongMap!22522 (toList!11276 List!36458)) )
))
(declare-fun lt!671348 () ListLongMap!22521)

(declare-fun contains!10266 (ListLongMap!22521 (_ BitVec 64)) Bool)

(assert (=> b!1561831 (= res!1067872 (contains!10266 lt!671348 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561831 (not (contains!10266 lt!671348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671346 () V!59765)

(declare-fun lt!671349 () ListLongMap!22521)

(declare-fun +!5046 (ListLongMap!22521 tuple2!25086) ListLongMap!22521)

(assert (=> b!1561831 (= lt!671348 (+!5046 lt!671349 (tuple2!25087 (select (arr!50220 _keys!637) from!782) lt!671346)))))

(declare-datatypes ((Unit!51946 0))(
  ( (Unit!51947) )
))
(declare-fun lt!671345 () Unit!51946)

(declare-fun addStillNotContains!536 (ListLongMap!22521 (_ BitVec 64) V!59765 (_ BitVec 64)) Unit!51946)

(assert (=> b!1561831 (= lt!671345 (addStillNotContains!536 lt!671349 (select (arr!50220 _keys!637) from!782) lt!671346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26223 (ValueCell!18304 V!59765) V!59765)

(declare-fun dynLambda!3830 (Int (_ BitVec 64)) V!59765)

(assert (=> b!1561831 (= lt!671346 (get!26223 (select (arr!50221 _values!487) from!782) (dynLambda!3830 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59765)

(declare-fun minValue!453 () V!59765)

(declare-fun getCurrentListMapNoExtraKeys!6660 (array!104056 array!104058 (_ BitVec 32) (_ BitVec 32) V!59765 V!59765 (_ BitVec 32) Int) ListLongMap!22521)

(assert (=> b!1561831 (= lt!671349 (getCurrentListMapNoExtraKeys!6660 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561832 () Bool)

(declare-fun tp_is_empty!38669 () Bool)

(assert (=> b!1561832 (= e!870354 tp_is_empty!38669)))

(declare-fun mapIsEmpty!59379 () Bool)

(assert (=> mapIsEmpty!59379 mapRes!59379))

(declare-fun b!1561833 () Bool)

(assert (=> b!1561833 (= e!870356 true)))

(declare-fun lt!671347 () Bool)

(assert (=> b!1561833 (= lt!671347 (contains!10266 lt!671348 (select (arr!50220 _keys!637) from!782)))))

(declare-fun b!1561834 () Bool)

(declare-fun e!870355 () Bool)

(declare-fun e!870353 () Bool)

(assert (=> b!1561834 (= e!870355 (and e!870353 mapRes!59379))))

(declare-fun condMapEmpty!59379 () Bool)

(declare-fun mapDefault!59379 () ValueCell!18304)

