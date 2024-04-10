; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133610 () Bool)

(assert start!133610)

(declare-fun b_free!32027 () Bool)

(declare-fun b_next!32027 () Bool)

(assert (=> start!133610 (= b_free!32027 (not b_next!32027))))

(declare-fun tp!113205 () Bool)

(declare-fun b_and!51565 () Bool)

(assert (=> start!133610 (= tp!113205 b_and!51565)))

(declare-fun b!1562176 () Bool)

(declare-fun res!1068089 () Bool)

(declare-fun e!870534 () Bool)

(assert (=> b!1562176 (=> (not res!1068089) (not e!870534))))

(declare-datatypes ((array!104104 0))(
  ( (array!104105 (arr!50244 (Array (_ BitVec 32) (_ BitVec 64))) (size!50794 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104104)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562176 (= res!1068089 (validKeyInArray!0 (select (arr!50244 _keys!637) from!782)))))

(declare-fun res!1068086 () Bool)

(assert (=> start!133610 (=> (not res!1068086) (not e!870534))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133610 (= res!1068086 (validMask!0 mask!947))))

(assert (=> start!133610 e!870534))

(assert (=> start!133610 tp!113205))

(declare-fun tp_is_empty!38693 () Bool)

(assert (=> start!133610 tp_is_empty!38693))

(assert (=> start!133610 true))

(declare-fun array_inv!39053 (array!104104) Bool)

(assert (=> start!133610 (array_inv!39053 _keys!637)))

(declare-datatypes ((V!59797 0))(
  ( (V!59798 (val!19430 Int)) )
))
(declare-datatypes ((ValueCell!18316 0))(
  ( (ValueCellFull!18316 (v!22182 V!59797)) (EmptyCell!18316) )
))
(declare-datatypes ((array!104106 0))(
  ( (array!104107 (arr!50245 (Array (_ BitVec 32) ValueCell!18316)) (size!50795 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104106)

(declare-fun e!870535 () Bool)

(declare-fun array_inv!39054 (array!104106) Bool)

(assert (=> start!133610 (and (array_inv!39054 _values!487) e!870535)))

(declare-fun b!1562177 () Bool)

(assert (=> b!1562177 (= e!870534 (not true))))

(declare-fun lt!671529 () Bool)

(declare-datatypes ((tuple2!25100 0))(
  ( (tuple2!25101 (_1!12561 (_ BitVec 64)) (_2!12561 V!59797)) )
))
(declare-datatypes ((List!36472 0))(
  ( (Nil!36469) (Cons!36468 (h!37914 tuple2!25100) (t!51289 List!36472)) )
))
(declare-datatypes ((ListLongMap!22535 0))(
  ( (ListLongMap!22536 (toList!11283 List!36472)) )
))
(declare-fun lt!671526 () ListLongMap!22535)

(declare-fun contains!10273 (ListLongMap!22535 (_ BitVec 64)) Bool)

(assert (=> b!1562177 (= lt!671529 (contains!10273 lt!671526 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562177 (not (contains!10273 lt!671526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671525 () ListLongMap!22535)

(declare-fun lt!671528 () V!59797)

(declare-fun +!5053 (ListLongMap!22535 tuple2!25100) ListLongMap!22535)

(assert (=> b!1562177 (= lt!671526 (+!5053 lt!671525 (tuple2!25101 (select (arr!50244 _keys!637) from!782) lt!671528)))))

(declare-datatypes ((Unit!51960 0))(
  ( (Unit!51961) )
))
(declare-fun lt!671527 () Unit!51960)

(declare-fun addStillNotContains!543 (ListLongMap!22535 (_ BitVec 64) V!59797 (_ BitVec 64)) Unit!51960)

(assert (=> b!1562177 (= lt!671527 (addStillNotContains!543 lt!671525 (select (arr!50244 _keys!637) from!782) lt!671528 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26238 (ValueCell!18316 V!59797) V!59797)

(declare-fun dynLambda!3837 (Int (_ BitVec 64)) V!59797)

(assert (=> b!1562177 (= lt!671528 (get!26238 (select (arr!50245 _values!487) from!782) (dynLambda!3837 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59797)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59797)

(declare-fun getCurrentListMapNoExtraKeys!6667 (array!104104 array!104106 (_ BitVec 32) (_ BitVec 32) V!59797 V!59797 (_ BitVec 32) Int) ListLongMap!22535)

(assert (=> b!1562177 (= lt!671525 (getCurrentListMapNoExtraKeys!6667 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59415 () Bool)

(declare-fun mapRes!59415 () Bool)

(assert (=> mapIsEmpty!59415 mapRes!59415))

(declare-fun b!1562178 () Bool)

(declare-fun e!870536 () Bool)

(assert (=> b!1562178 (= e!870536 tp_is_empty!38693)))

(declare-fun b!1562179 () Bool)

(declare-fun res!1068088 () Bool)

(assert (=> b!1562179 (=> (not res!1068088) (not e!870534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104104 (_ BitVec 32)) Bool)

(assert (=> b!1562179 (= res!1068088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59415 () Bool)

(declare-fun tp!113204 () Bool)

(assert (=> mapNonEmpty!59415 (= mapRes!59415 (and tp!113204 e!870536))))

(declare-fun mapValue!59415 () ValueCell!18316)

(declare-fun mapKey!59415 () (_ BitVec 32))

(declare-fun mapRest!59415 () (Array (_ BitVec 32) ValueCell!18316))

(assert (=> mapNonEmpty!59415 (= (arr!50245 _values!487) (store mapRest!59415 mapKey!59415 mapValue!59415))))

(declare-fun b!1562180 () Bool)

(declare-fun res!1068085 () Bool)

(assert (=> b!1562180 (=> (not res!1068085) (not e!870534))))

(assert (=> b!1562180 (= res!1068085 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50794 _keys!637)) (bvslt from!782 (size!50794 _keys!637))))))

(declare-fun b!1562181 () Bool)

(declare-fun e!870538 () Bool)

(assert (=> b!1562181 (= e!870538 tp_is_empty!38693)))

(declare-fun b!1562182 () Bool)

(assert (=> b!1562182 (= e!870535 (and e!870538 mapRes!59415))))

(declare-fun condMapEmpty!59415 () Bool)

(declare-fun mapDefault!59415 () ValueCell!18316)

