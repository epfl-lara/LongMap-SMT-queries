; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100100 () Bool)

(assert start!100100)

(declare-fun b_free!25673 () Bool)

(declare-fun b_next!25673 () Bool)

(assert (=> start!100100 (= b_free!25673 (not b_next!25673))))

(declare-fun tp!89742 () Bool)

(declare-fun b_and!42213 () Bool)

(assert (=> start!100100 (= tp!89742 b_and!42213)))

(declare-fun b!1193622 () Bool)

(declare-fun e!678379 () Bool)

(declare-fun tp_is_empty!30209 () Bool)

(assert (=> b!1193622 (= e!678379 tp_is_empty!30209)))

(declare-fun b!1193623 () Bool)

(declare-fun res!794147 () Bool)

(declare-fun e!678385 () Bool)

(assert (=> b!1193623 (=> (not res!794147) (not e!678385))))

(declare-datatypes ((array!77197 0))(
  ( (array!77198 (arr!37248 (Array (_ BitVec 32) (_ BitVec 64))) (size!37784 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77197)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45405 0))(
  ( (V!45406 (val!15161 Int)) )
))
(declare-datatypes ((ValueCell!14395 0))(
  ( (ValueCellFull!14395 (v!17799 V!45405)) (EmptyCell!14395) )
))
(declare-datatypes ((array!77199 0))(
  ( (array!77200 (arr!37249 (Array (_ BitVec 32) ValueCell!14395)) (size!37785 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77199)

(assert (=> b!1193623 (= res!794147 (and (= (size!37785 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37784 _keys!1208) (size!37785 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193624 () Bool)

(declare-fun res!794145 () Bool)

(assert (=> b!1193624 (=> (not res!794145) (not e!678385))))

(declare-datatypes ((List!26237 0))(
  ( (Nil!26234) (Cons!26233 (h!27442 (_ BitVec 64)) (t!38902 List!26237)) )
))
(declare-fun arrayNoDuplicates!0 (array!77197 (_ BitVec 32) List!26237) Bool)

(assert (=> b!1193624 (= res!794145 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26234))))

(declare-fun zeroValue!944 () V!45405)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19490 0))(
  ( (tuple2!19491 (_1!9756 (_ BitVec 64)) (_2!9756 V!45405)) )
))
(declare-datatypes ((List!26238 0))(
  ( (Nil!26235) (Cons!26234 (h!27443 tuple2!19490) (t!38903 List!26238)) )
))
(declare-datatypes ((ListLongMap!17459 0))(
  ( (ListLongMap!17460 (toList!8745 List!26238)) )
))
(declare-fun call!57135 () ListLongMap!17459)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57131 () Bool)

(declare-fun minValue!944 () V!45405)

(declare-fun getCurrentListMapNoExtraKeys!5186 (array!77197 array!77199 (_ BitVec 32) (_ BitVec 32) V!45405 V!45405 (_ BitVec 32) Int) ListLongMap!17459)

(assert (=> bm!57131 (= call!57135 (getCurrentListMapNoExtraKeys!5186 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!57134 () ListLongMap!17459)

(declare-fun b!1193626 () Bool)

(declare-fun e!678377 () Bool)

(declare-fun -!1769 (ListLongMap!17459 (_ BitVec 64)) ListLongMap!17459)

(assert (=> b!1193626 (= e!678377 (= call!57134 (-!1769 call!57135 k!934)))))

(declare-fun b!1193627 () Bool)

(declare-fun res!794139 () Bool)

(assert (=> b!1193627 (=> (not res!794139) (not e!678385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77197 (_ BitVec 32)) Bool)

(assert (=> b!1193627 (= res!794139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193628 () Bool)

(assert (=> b!1193628 (= e!678377 (= call!57134 call!57135))))

(declare-fun lt!542635 () array!77197)

(declare-fun bm!57132 () Bool)

(declare-fun lt!542640 () array!77199)

(assert (=> bm!57132 (= call!57134 (getCurrentListMapNoExtraKeys!5186 lt!542635 lt!542640 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193629 () Bool)

(declare-fun res!794140 () Bool)

(declare-fun e!678378 () Bool)

(assert (=> b!1193629 (=> (not res!794140) (not e!678378))))

(assert (=> b!1193629 (= res!794140 (arrayNoDuplicates!0 lt!542635 #b00000000000000000000000000000000 Nil!26234))))

(declare-fun b!1193630 () Bool)

(declare-fun res!794144 () Bool)

(assert (=> b!1193630 (=> (not res!794144) (not e!678385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193630 (= res!794144 (validMask!0 mask!1564))))

(declare-fun b!1193631 () Bool)

(declare-fun res!794148 () Bool)

(assert (=> b!1193631 (=> (not res!794148) (not e!678385))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193631 (= res!794148 (= (select (arr!37248 _keys!1208) i!673) k!934))))

(declare-fun b!1193632 () Bool)

(declare-fun res!794141 () Bool)

(assert (=> b!1193632 (=> (not res!794141) (not e!678385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193632 (= res!794141 (validKeyInArray!0 k!934))))

(declare-fun b!1193633 () Bool)

(declare-fun e!678384 () Bool)

(assert (=> b!1193633 (= e!678384 tp_is_empty!30209)))

(declare-fun res!794138 () Bool)

(assert (=> start!100100 (=> (not res!794138) (not e!678385))))

(assert (=> start!100100 (= res!794138 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37784 _keys!1208))))))

(assert (=> start!100100 e!678385))

(assert (=> start!100100 tp_is_empty!30209))

(declare-fun array_inv!28398 (array!77197) Bool)

(assert (=> start!100100 (array_inv!28398 _keys!1208)))

(assert (=> start!100100 true))

(assert (=> start!100100 tp!89742))

(declare-fun e!678381 () Bool)

(declare-fun array_inv!28399 (array!77199) Bool)

(assert (=> start!100100 (and (array_inv!28399 _values!996) e!678381)))

(declare-fun b!1193625 () Bool)

(declare-fun e!678383 () Bool)

(assert (=> b!1193625 (= e!678378 (not e!678383))))

(declare-fun res!794142 () Bool)

(assert (=> b!1193625 (=> res!794142 e!678383)))

(assert (=> b!1193625 (= res!794142 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193625 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39596 0))(
  ( (Unit!39597) )
))
(declare-fun lt!542638 () Unit!39596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77197 (_ BitVec 64) (_ BitVec 32)) Unit!39596)

(assert (=> b!1193625 (= lt!542638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47141 () Bool)

(declare-fun mapRes!47141 () Bool)

(declare-fun tp!89741 () Bool)

(assert (=> mapNonEmpty!47141 (= mapRes!47141 (and tp!89741 e!678379))))

(declare-fun mapKey!47141 () (_ BitVec 32))

(declare-fun mapValue!47141 () ValueCell!14395)

(declare-fun mapRest!47141 () (Array (_ BitVec 32) ValueCell!14395))

(assert (=> mapNonEmpty!47141 (= (arr!37249 _values!996) (store mapRest!47141 mapKey!47141 mapValue!47141))))

(declare-fun b!1193634 () Bool)

(declare-fun res!794146 () Bool)

(assert (=> b!1193634 (=> (not res!794146) (not e!678385))))

(assert (=> b!1193634 (= res!794146 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37784 _keys!1208))))))

(declare-fun b!1193635 () Bool)

(assert (=> b!1193635 (= e!678381 (and e!678384 mapRes!47141))))

(declare-fun condMapEmpty!47141 () Bool)

(declare-fun mapDefault!47141 () ValueCell!14395)

