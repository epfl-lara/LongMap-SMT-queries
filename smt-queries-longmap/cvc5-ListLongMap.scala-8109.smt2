; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99520 () Bool)

(assert start!99520)

(declare-fun b_free!25099 () Bool)

(declare-fun b_next!25099 () Bool)

(assert (=> start!99520 (= b_free!25099 (not b_next!25099))))

(declare-fun tp!88010 () Bool)

(declare-fun b_and!41065 () Bool)

(assert (=> start!99520 (= tp!88010 b_and!41065)))

(declare-fun b!1177060 () Bool)

(declare-fun e!669106 () Bool)

(declare-fun e!669111 () Bool)

(assert (=> b!1177060 (= e!669106 e!669111)))

(declare-fun res!781848 () Bool)

(assert (=> b!1177060 (=> (not res!781848) (not e!669111))))

(declare-datatypes ((array!76065 0))(
  ( (array!76066 (arr!36682 (Array (_ BitVec 32) (_ BitVec 64))) (size!37218 (_ BitVec 32))) )
))
(declare-fun lt!531402 () array!76065)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76065 (_ BitVec 32)) Bool)

(assert (=> b!1177060 (= res!781848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531402 mask!1564))))

(declare-fun _keys!1208 () array!76065)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177060 (= lt!531402 (array!76066 (store (arr!36682 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37218 _keys!1208)))))

(declare-fun b!1177061 () Bool)

(declare-fun e!669116 () Bool)

(assert (=> b!1177061 (= e!669116 true)))

(declare-fun e!669113 () Bool)

(assert (=> b!1177061 e!669113))

(declare-fun res!781839 () Bool)

(assert (=> b!1177061 (=> (not res!781839) (not e!669113))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177061 (= res!781839 (not (= (select (arr!36682 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38866 0))(
  ( (Unit!38867) )
))
(declare-fun lt!531396 () Unit!38866)

(declare-fun e!669117 () Unit!38866)

(assert (=> b!1177061 (= lt!531396 e!669117)))

(declare-fun c!116772 () Bool)

(assert (=> b!1177061 (= c!116772 (= (select (arr!36682 _keys!1208) from!1455) k!934))))

(declare-fun e!669118 () Bool)

(assert (=> b!1177061 e!669118))

(declare-fun res!781838 () Bool)

(assert (=> b!1177061 (=> (not res!781838) (not e!669118))))

(declare-datatypes ((V!44633 0))(
  ( (V!44634 (val!14871 Int)) )
))
(declare-datatypes ((tuple2!19022 0))(
  ( (tuple2!19023 (_1!9522 (_ BitVec 64)) (_2!9522 V!44633)) )
))
(declare-datatypes ((List!25760 0))(
  ( (Nil!25757) (Cons!25756 (h!26965 tuple2!19022) (t!37851 List!25760)) )
))
(declare-datatypes ((ListLongMap!16991 0))(
  ( (ListLongMap!16992 (toList!8511 List!25760)) )
))
(declare-fun lt!531407 () ListLongMap!16991)

(declare-fun lt!531401 () ListLongMap!16991)

(declare-fun lt!531405 () tuple2!19022)

(declare-fun +!3826 (ListLongMap!16991 tuple2!19022) ListLongMap!16991)

(assert (=> b!1177061 (= res!781838 (= lt!531401 (+!3826 lt!531407 lt!531405)))))

(declare-fun lt!531403 () V!44633)

(declare-datatypes ((ValueCell!14105 0))(
  ( (ValueCellFull!14105 (v!17509 V!44633)) (EmptyCell!14105) )
))
(declare-datatypes ((array!76067 0))(
  ( (array!76068 (arr!36683 (Array (_ BitVec 32) ValueCell!14105)) (size!37219 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76067)

(declare-fun get!18740 (ValueCell!14105 V!44633) V!44633)

(assert (=> b!1177061 (= lt!531405 (tuple2!19023 (select (arr!36682 _keys!1208) from!1455) (get!18740 (select (arr!36683 _values!996) from!1455) lt!531403)))))

(declare-fun b!1177062 () Bool)

(declare-fun res!781849 () Bool)

(assert (=> b!1177062 (=> (not res!781849) (not e!669106))))

(declare-datatypes ((List!25761 0))(
  ( (Nil!25758) (Cons!25757 (h!26966 (_ BitVec 64)) (t!37852 List!25761)) )
))
(declare-fun arrayNoDuplicates!0 (array!76065 (_ BitVec 32) List!25761) Bool)

(assert (=> b!1177062 (= res!781849 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25758))))

(declare-fun b!1177063 () Bool)

(declare-fun e!669115 () Bool)

(declare-fun e!669108 () Bool)

(declare-fun mapRes!46271 () Bool)

(assert (=> b!1177063 (= e!669115 (and e!669108 mapRes!46271))))

(declare-fun condMapEmpty!46271 () Bool)

(declare-fun mapDefault!46271 () ValueCell!14105)

