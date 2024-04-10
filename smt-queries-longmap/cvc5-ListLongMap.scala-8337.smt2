; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101476 () Bool)

(assert start!101476)

(declare-fun b_free!26293 () Bool)

(declare-fun b_next!26293 () Bool)

(assert (=> start!101476 (= b_free!26293 (not b_next!26293))))

(declare-fun tp!91912 () Bool)

(declare-fun b_and!43775 () Bool)

(assert (=> start!101476 (= tp!91912 b_and!43775)))

(declare-fun b!1219841 () Bool)

(declare-fun res!810260 () Bool)

(declare-fun e!692633 () Bool)

(assert (=> b!1219841 (=> (not res!810260) (not e!692633))))

(declare-datatypes ((array!78771 0))(
  ( (array!78772 (arr!38016 (Array (_ BitVec 32) (_ BitVec 64))) (size!38552 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78771)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1219841 (= res!810260 (= (select (arr!38016 _keys!1208) i!673) k!934))))

(declare-fun b!1219842 () Bool)

(declare-fun res!810251 () Bool)

(assert (=> b!1219842 (=> (not res!810251) (not e!692633))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219842 (= res!810251 (validMask!0 mask!1564))))

(declare-fun b!1219843 () Bool)

(declare-fun e!692635 () Bool)

(assert (=> b!1219843 (= e!692635 true)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219843 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!40422 0))(
  ( (Unit!40423) )
))
(declare-fun lt!554664 () Unit!40422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78771 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40422)

(assert (=> b!1219843 (= lt!554664 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!810253 () Bool)

(assert (=> start!101476 (=> (not res!810253) (not e!692633))))

(assert (=> start!101476 (= res!810253 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38552 _keys!1208))))))

(assert (=> start!101476 e!692633))

(declare-fun tp_is_empty!30997 () Bool)

(assert (=> start!101476 tp_is_empty!30997))

(declare-fun array_inv!28930 (array!78771) Bool)

(assert (=> start!101476 (array_inv!28930 _keys!1208)))

(assert (=> start!101476 true))

(assert (=> start!101476 tp!91912))

(declare-datatypes ((V!46457 0))(
  ( (V!46458 (val!15555 Int)) )
))
(declare-datatypes ((ValueCell!14789 0))(
  ( (ValueCellFull!14789 (v!18212 V!46457)) (EmptyCell!14789) )
))
(declare-datatypes ((array!78773 0))(
  ( (array!78774 (arr!38017 (Array (_ BitVec 32) ValueCell!14789)) (size!38553 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78773)

(declare-fun e!692640 () Bool)

(declare-fun array_inv!28931 (array!78773) Bool)

(assert (=> start!101476 (and (array_inv!28931 _values!996) e!692640)))

(declare-fun b!1219844 () Bool)

(declare-fun res!810256 () Bool)

(assert (=> b!1219844 (=> (not res!810256) (not e!692633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219844 (= res!810256 (validKeyInArray!0 k!934))))

(declare-fun b!1219845 () Bool)

(declare-fun e!692637 () Bool)

(assert (=> b!1219845 (= e!692637 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!48382 () Bool)

(declare-fun mapRes!48382 () Bool)

(assert (=> mapIsEmpty!48382 mapRes!48382))

(declare-fun b!1219846 () Bool)

(declare-fun e!692642 () Bool)

(assert (=> b!1219846 (= e!692642 e!692635)))

(declare-fun res!810262 () Bool)

(assert (=> b!1219846 (=> res!810262 e!692635)))

(assert (=> b!1219846 (= res!810262 (not (= (select (arr!38016 _keys!1208) from!1455) k!934)))))

(declare-fun e!692639 () Bool)

(assert (=> b!1219846 e!692639))

(declare-fun res!810258 () Bool)

(assert (=> b!1219846 (=> (not res!810258) (not e!692639))))

(declare-datatypes ((tuple2!20022 0))(
  ( (tuple2!20023 (_1!10022 (_ BitVec 64)) (_2!10022 V!46457)) )
))
(declare-datatypes ((List!26821 0))(
  ( (Nil!26818) (Cons!26817 (h!28026 tuple2!20022) (t!40094 List!26821)) )
))
(declare-datatypes ((ListLongMap!17991 0))(
  ( (ListLongMap!17992 (toList!9011 List!26821)) )
))
(declare-fun lt!554659 () ListLongMap!17991)

(declare-fun lt!554655 () ListLongMap!17991)

(declare-fun lt!554660 () V!46457)

(declare-fun +!4079 (ListLongMap!17991 tuple2!20022) ListLongMap!17991)

(declare-fun get!19392 (ValueCell!14789 V!46457) V!46457)

(assert (=> b!1219846 (= res!810258 (= lt!554655 (+!4079 lt!554659 (tuple2!20023 (select (arr!38016 _keys!1208) from!1455) (get!19392 (select (arr!38017 _values!996) from!1455) lt!554660)))))))

(declare-fun b!1219847 () Bool)

(declare-fun res!810257 () Bool)

(declare-fun e!692634 () Bool)

(assert (=> b!1219847 (=> (not res!810257) (not e!692634))))

(declare-fun lt!554656 () array!78771)

(declare-datatypes ((List!26822 0))(
  ( (Nil!26819) (Cons!26818 (h!28027 (_ BitVec 64)) (t!40095 List!26822)) )
))
(declare-fun arrayNoDuplicates!0 (array!78771 (_ BitVec 32) List!26822) Bool)

(assert (=> b!1219847 (= res!810257 (arrayNoDuplicates!0 lt!554656 #b00000000000000000000000000000000 Nil!26819))))

(declare-fun b!1219848 () Bool)

(declare-fun res!810250 () Bool)

(assert (=> b!1219848 (=> (not res!810250) (not e!692633))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1219848 (= res!810250 (and (= (size!38553 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38552 _keys!1208) (size!38553 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219849 () Bool)

(assert (=> b!1219849 (= e!692639 e!692637)))

(declare-fun res!810264 () Bool)

(assert (=> b!1219849 (=> res!810264 e!692637)))

(assert (=> b!1219849 (= res!810264 (not (= (select (arr!38016 _keys!1208) from!1455) k!934)))))

(declare-fun b!1219850 () Bool)

(declare-fun e!692643 () Bool)

(assert (=> b!1219850 (= e!692643 tp_is_empty!30997)))

(declare-fun b!1219851 () Bool)

(declare-fun e!692638 () Bool)

(assert (=> b!1219851 (= e!692640 (and e!692638 mapRes!48382))))

(declare-fun condMapEmpty!48382 () Bool)

(declare-fun mapDefault!48382 () ValueCell!14789)

