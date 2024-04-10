; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101736 () Bool)

(assert start!101736)

(declare-fun b_free!26425 () Bool)

(declare-fun b_next!26425 () Bool)

(assert (=> start!101736 (= b_free!26425 (not b_next!26425))))

(declare-fun tp!92321 () Bool)

(declare-fun b_and!44111 () Bool)

(assert (=> start!101736 (= tp!92321 b_and!44111)))

(declare-fun b!1224637 () Bool)

(declare-fun res!813774 () Bool)

(declare-fun e!695546 () Bool)

(assert (=> b!1224637 (=> (not res!813774) (not e!695546))))

(declare-datatypes ((array!79041 0))(
  ( (array!79042 (arr!38147 (Array (_ BitVec 32) (_ BitVec 64))) (size!38683 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79041)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224637 (= res!813774 (= (select (arr!38147 _keys!1208) i!673) k!934))))

(declare-fun b!1224638 () Bool)

(declare-fun res!813776 () Bool)

(assert (=> b!1224638 (=> (not res!813776) (not e!695546))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46633 0))(
  ( (V!46634 (val!15621 Int)) )
))
(declare-datatypes ((ValueCell!14855 0))(
  ( (ValueCellFull!14855 (v!18283 V!46633)) (EmptyCell!14855) )
))
(declare-datatypes ((array!79043 0))(
  ( (array!79044 (arr!38148 (Array (_ BitVec 32) ValueCell!14855)) (size!38684 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79043)

(assert (=> b!1224638 (= res!813776 (and (= (size!38684 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38683 _keys!1208) (size!38684 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224639 () Bool)

(declare-fun e!695548 () Bool)

(assert (=> b!1224639 (= e!695546 e!695548)))

(declare-fun res!813783 () Bool)

(assert (=> b!1224639 (=> (not res!813783) (not e!695548))))

(declare-fun lt!557662 () array!79041)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79041 (_ BitVec 32)) Bool)

(assert (=> b!1224639 (= res!813783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557662 mask!1564))))

(assert (=> b!1224639 (= lt!557662 (array!79042 (store (arr!38147 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38683 _keys!1208)))))

(declare-fun res!813777 () Bool)

(assert (=> start!101736 (=> (not res!813777) (not e!695546))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101736 (= res!813777 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38683 _keys!1208))))))

(assert (=> start!101736 e!695546))

(declare-fun tp_is_empty!31129 () Bool)

(assert (=> start!101736 tp_is_empty!31129))

(declare-fun array_inv!29018 (array!79041) Bool)

(assert (=> start!101736 (array_inv!29018 _keys!1208)))

(assert (=> start!101736 true))

(assert (=> start!101736 tp!92321))

(declare-fun e!695544 () Bool)

(declare-fun array_inv!29019 (array!79043) Bool)

(assert (=> start!101736 (and (array_inv!29019 _values!996) e!695544)))

(declare-fun b!1224640 () Bool)

(declare-datatypes ((Unit!40579 0))(
  ( (Unit!40580) )
))
(declare-fun e!695540 () Unit!40579)

(declare-fun Unit!40581 () Unit!40579)

(assert (=> b!1224640 (= e!695540 Unit!40581)))

(declare-fun e!695539 () Bool)

(declare-fun b!1224641 () Bool)

(declare-fun arrayContainsKey!0 (array!79041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224641 (= e!695539 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!48592 () Bool)

(declare-fun mapRes!48592 () Bool)

(declare-fun tp!92320 () Bool)

(declare-fun e!695547 () Bool)

(assert (=> mapNonEmpty!48592 (= mapRes!48592 (and tp!92320 e!695547))))

(declare-fun mapValue!48592 () ValueCell!14855)

(declare-fun mapKey!48592 () (_ BitVec 32))

(declare-fun mapRest!48592 () (Array (_ BitVec 32) ValueCell!14855))

(assert (=> mapNonEmpty!48592 (= (arr!38148 _values!996) (store mapRest!48592 mapKey!48592 mapValue!48592))))

(declare-fun b!1224642 () Bool)

(declare-fun e!695545 () Bool)

(assert (=> b!1224642 (= e!695544 (and e!695545 mapRes!48592))))

(declare-fun condMapEmpty!48592 () Bool)

(declare-fun mapDefault!48592 () ValueCell!14855)

