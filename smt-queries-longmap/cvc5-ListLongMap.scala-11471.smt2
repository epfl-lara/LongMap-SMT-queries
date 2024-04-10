; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133624 () Bool)

(assert start!133624)

(declare-fun b_free!32041 () Bool)

(declare-fun b_next!32041 () Bool)

(assert (=> start!133624 (= b_free!32041 (not b_next!32041))))

(declare-fun tp!113247 () Bool)

(declare-fun b_and!51593 () Bool)

(assert (=> start!133624 (= tp!113247 b_and!51593)))

(declare-fun b!1562379 () Bool)

(declare-fun res!1068214 () Bool)

(declare-fun e!870643 () Bool)

(assert (=> b!1562379 (=> (not res!1068214) (not e!870643))))

(declare-datatypes ((array!104130 0))(
  ( (array!104131 (arr!50257 (Array (_ BitVec 32) (_ BitVec 64))) (size!50807 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104130)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562379 (= res!1068214 (validKeyInArray!0 (select (arr!50257 _keys!637) from!782)))))

(declare-fun b!1562380 () Bool)

(declare-fun res!1068211 () Bool)

(assert (=> b!1562380 (=> (not res!1068211) (not e!870643))))

(declare-datatypes ((List!36480 0))(
  ( (Nil!36477) (Cons!36476 (h!37922 (_ BitVec 64)) (t!51311 List!36480)) )
))
(declare-fun arrayNoDuplicates!0 (array!104130 (_ BitVec 32) List!36480) Bool)

(assert (=> b!1562380 (= res!1068211 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36477))))

(declare-fun res!1068216 () Bool)

(assert (=> start!133624 (=> (not res!1068216) (not e!870643))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133624 (= res!1068216 (validMask!0 mask!947))))

(assert (=> start!133624 e!870643))

(assert (=> start!133624 tp!113247))

(declare-fun tp_is_empty!38707 () Bool)

(assert (=> start!133624 tp_is_empty!38707))

(assert (=> start!133624 true))

(declare-fun array_inv!39061 (array!104130) Bool)

(assert (=> start!133624 (array_inv!39061 _keys!637)))

(declare-datatypes ((V!59817 0))(
  ( (V!59818 (val!19437 Int)) )
))
(declare-datatypes ((ValueCell!18323 0))(
  ( (ValueCellFull!18323 (v!22189 V!59817)) (EmptyCell!18323) )
))
(declare-datatypes ((array!104132 0))(
  ( (array!104133 (arr!50258 (Array (_ BitVec 32) ValueCell!18323)) (size!50808 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104132)

(declare-fun e!870640 () Bool)

(declare-fun array_inv!39062 (array!104132) Bool)

(assert (=> start!133624 (and (array_inv!39062 _values!487) e!870640)))

(declare-fun b!1562381 () Bool)

(declare-fun res!1068212 () Bool)

(assert (=> b!1562381 (=> (not res!1068212) (not e!870643))))

(assert (=> b!1562381 (= res!1068212 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50807 _keys!637)) (bvslt from!782 (size!50807 _keys!637))))))

(declare-fun b!1562382 () Bool)

(declare-fun e!870642 () Bool)

(assert (=> b!1562382 (= e!870642 tp_is_empty!38707)))

(declare-fun b!1562383 () Bool)

(assert (=> b!1562383 (= e!870643 (not true))))

(declare-fun lt!671632 () Bool)

(declare-datatypes ((tuple2!25108 0))(
  ( (tuple2!25109 (_1!12565 (_ BitVec 64)) (_2!12565 V!59817)) )
))
(declare-datatypes ((List!36481 0))(
  ( (Nil!36478) (Cons!36477 (h!37923 tuple2!25108) (t!51312 List!36481)) )
))
(declare-datatypes ((ListLongMap!22543 0))(
  ( (ListLongMap!22544 (toList!11287 List!36481)) )
))
(declare-fun lt!671633 () ListLongMap!22543)

(declare-fun contains!10277 (ListLongMap!22543 (_ BitVec 64)) Bool)

(assert (=> b!1562383 (= lt!671632 (contains!10277 lt!671633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562383 (not (contains!10277 lt!671633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671631 () ListLongMap!22543)

(declare-fun lt!671634 () V!59817)

(declare-fun +!5057 (ListLongMap!22543 tuple2!25108) ListLongMap!22543)

(assert (=> b!1562383 (= lt!671633 (+!5057 lt!671631 (tuple2!25109 (select (arr!50257 _keys!637) from!782) lt!671634)))))

(declare-datatypes ((Unit!51968 0))(
  ( (Unit!51969) )
))
(declare-fun lt!671630 () Unit!51968)

(declare-fun addStillNotContains!547 (ListLongMap!22543 (_ BitVec 64) V!59817 (_ BitVec 64)) Unit!51968)

(assert (=> b!1562383 (= lt!671630 (addStillNotContains!547 lt!671631 (select (arr!50257 _keys!637) from!782) lt!671634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26248 (ValueCell!18323 V!59817) V!59817)

(declare-fun dynLambda!3841 (Int (_ BitVec 64)) V!59817)

(assert (=> b!1562383 (= lt!671634 (get!26248 (select (arr!50258 _values!487) from!782) (dynLambda!3841 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59817)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59817)

(declare-fun getCurrentListMapNoExtraKeys!6671 (array!104130 array!104132 (_ BitVec 32) (_ BitVec 32) V!59817 V!59817 (_ BitVec 32) Int) ListLongMap!22543)

(assert (=> b!1562383 (= lt!671631 (getCurrentListMapNoExtraKeys!6671 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562384 () Bool)

(declare-fun e!870641 () Bool)

(assert (=> b!1562384 (= e!870641 tp_is_empty!38707)))

(declare-fun b!1562385 () Bool)

(declare-fun res!1068215 () Bool)

(assert (=> b!1562385 (=> (not res!1068215) (not e!870643))))

(assert (=> b!1562385 (= res!1068215 (and (= (size!50808 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50807 _keys!637) (size!50808 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562386 () Bool)

(declare-fun mapRes!59436 () Bool)

(assert (=> b!1562386 (= e!870640 (and e!870641 mapRes!59436))))

(declare-fun condMapEmpty!59436 () Bool)

(declare-fun mapDefault!59436 () ValueCell!18323)

