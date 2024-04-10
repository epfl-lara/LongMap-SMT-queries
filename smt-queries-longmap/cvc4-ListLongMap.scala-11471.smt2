; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133628 () Bool)

(assert start!133628)

(declare-fun b_free!32045 () Bool)

(declare-fun b_next!32045 () Bool)

(assert (=> start!133628 (= b_free!32045 (not b_next!32045))))

(declare-fun tp!113259 () Bool)

(declare-fun b_and!51601 () Bool)

(assert (=> start!133628 (= tp!113259 b_and!51601)))

(declare-fun mapIsEmpty!59442 () Bool)

(declare-fun mapRes!59442 () Bool)

(assert (=> mapIsEmpty!59442 mapRes!59442))

(declare-fun b!1562437 () Bool)

(declare-fun res!1068252 () Bool)

(declare-fun e!870671 () Bool)

(assert (=> b!1562437 (=> (not res!1068252) (not e!870671))))

(declare-datatypes ((array!104138 0))(
  ( (array!104139 (arr!50261 (Array (_ BitVec 32) (_ BitVec 64))) (size!50811 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104138)

(declare-datatypes ((List!36484 0))(
  ( (Nil!36481) (Cons!36480 (h!37926 (_ BitVec 64)) (t!51319 List!36484)) )
))
(declare-fun arrayNoDuplicates!0 (array!104138 (_ BitVec 32) List!36484) Bool)

(assert (=> b!1562437 (= res!1068252 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36481))))

(declare-fun res!1068251 () Bool)

(assert (=> start!133628 (=> (not res!1068251) (not e!870671))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133628 (= res!1068251 (validMask!0 mask!947))))

(assert (=> start!133628 e!870671))

(assert (=> start!133628 tp!113259))

(declare-fun tp_is_empty!38711 () Bool)

(assert (=> start!133628 tp_is_empty!38711))

(assert (=> start!133628 true))

(declare-fun array_inv!39065 (array!104138) Bool)

(assert (=> start!133628 (array_inv!39065 _keys!637)))

(declare-datatypes ((V!59821 0))(
  ( (V!59822 (val!19439 Int)) )
))
(declare-datatypes ((ValueCell!18325 0))(
  ( (ValueCellFull!18325 (v!22191 V!59821)) (EmptyCell!18325) )
))
(declare-datatypes ((array!104140 0))(
  ( (array!104141 (arr!50262 (Array (_ BitVec 32) ValueCell!18325)) (size!50812 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104140)

(declare-fun e!870673 () Bool)

(declare-fun array_inv!39066 (array!104140) Bool)

(assert (=> start!133628 (and (array_inv!39066 _values!487) e!870673)))

(declare-fun b!1562438 () Bool)

(declare-fun res!1068250 () Bool)

(assert (=> b!1562438 (=> (not res!1068250) (not e!870671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104138 (_ BitVec 32)) Bool)

(assert (=> b!1562438 (= res!1068250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562439 () Bool)

(declare-fun res!1068249 () Bool)

(assert (=> b!1562439 (=> (not res!1068249) (not e!870671))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562439 (= res!1068249 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50811 _keys!637)) (bvslt from!782 (size!50811 _keys!637))))))

(declare-fun b!1562440 () Bool)

(declare-fun e!870669 () Bool)

(assert (=> b!1562440 (= e!870669 tp_is_empty!38711)))

(declare-fun b!1562441 () Bool)

(assert (=> b!1562441 (= e!870671 (not true))))

(declare-fun lt!671664 () Bool)

(declare-datatypes ((tuple2!25112 0))(
  ( (tuple2!25113 (_1!12567 (_ BitVec 64)) (_2!12567 V!59821)) )
))
(declare-datatypes ((List!36485 0))(
  ( (Nil!36482) (Cons!36481 (h!37927 tuple2!25112) (t!51320 List!36485)) )
))
(declare-datatypes ((ListLongMap!22547 0))(
  ( (ListLongMap!22548 (toList!11289 List!36485)) )
))
(declare-fun lt!671660 () ListLongMap!22547)

(declare-fun contains!10279 (ListLongMap!22547 (_ BitVec 64)) Bool)

(assert (=> b!1562441 (= lt!671664 (contains!10279 lt!671660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562441 (not (contains!10279 lt!671660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671663 () ListLongMap!22547)

(declare-fun lt!671662 () V!59821)

(declare-fun +!5059 (ListLongMap!22547 tuple2!25112) ListLongMap!22547)

(assert (=> b!1562441 (= lt!671660 (+!5059 lt!671663 (tuple2!25113 (select (arr!50261 _keys!637) from!782) lt!671662)))))

(declare-datatypes ((Unit!51972 0))(
  ( (Unit!51973) )
))
(declare-fun lt!671661 () Unit!51972)

(declare-fun addStillNotContains!549 (ListLongMap!22547 (_ BitVec 64) V!59821 (_ BitVec 64)) Unit!51972)

(assert (=> b!1562441 (= lt!671661 (addStillNotContains!549 lt!671663 (select (arr!50261 _keys!637) from!782) lt!671662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26250 (ValueCell!18325 V!59821) V!59821)

(declare-fun dynLambda!3843 (Int (_ BitVec 64)) V!59821)

(assert (=> b!1562441 (= lt!671662 (get!26250 (select (arr!50262 _values!487) from!782) (dynLambda!3843 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59821)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59821)

(declare-fun getCurrentListMapNoExtraKeys!6673 (array!104138 array!104140 (_ BitVec 32) (_ BitVec 32) V!59821 V!59821 (_ BitVec 32) Int) ListLongMap!22547)

(assert (=> b!1562441 (= lt!671663 (getCurrentListMapNoExtraKeys!6673 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59442 () Bool)

(declare-fun tp!113258 () Bool)

(declare-fun e!870670 () Bool)

(assert (=> mapNonEmpty!59442 (= mapRes!59442 (and tp!113258 e!870670))))

(declare-fun mapKey!59442 () (_ BitVec 32))

(declare-fun mapValue!59442 () ValueCell!18325)

(declare-fun mapRest!59442 () (Array (_ BitVec 32) ValueCell!18325))

(assert (=> mapNonEmpty!59442 (= (arr!50262 _values!487) (store mapRest!59442 mapKey!59442 mapValue!59442))))

(declare-fun b!1562442 () Bool)

(assert (=> b!1562442 (= e!870670 tp_is_empty!38711)))

(declare-fun b!1562443 () Bool)

(assert (=> b!1562443 (= e!870673 (and e!870669 mapRes!59442))))

(declare-fun condMapEmpty!59442 () Bool)

(declare-fun mapDefault!59442 () ValueCell!18325)

