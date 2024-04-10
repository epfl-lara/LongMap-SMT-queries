; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101232 () Bool)

(assert start!101232)

(declare-fun b_free!26155 () Bool)

(declare-fun b_next!26155 () Bool)

(assert (=> start!101232 (= b_free!26155 (not b_next!26155))))

(declare-fun tp!91486 () Bool)

(declare-fun b_and!43427 () Bool)

(assert (=> start!101232 (= tp!91486 b_and!43427)))

(declare-fun b!1215684 () Bool)

(declare-fun res!807195 () Bool)

(declare-fun e!690265 () Bool)

(assert (=> b!1215684 (=> (not res!807195) (not e!690265))))

(declare-datatypes ((array!78491 0))(
  ( (array!78492 (arr!37880 (Array (_ BitVec 32) (_ BitVec 64))) (size!38416 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78491)

(declare-datatypes ((List!26705 0))(
  ( (Nil!26702) (Cons!26701 (h!27910 (_ BitVec 64)) (t!39840 List!26705)) )
))
(declare-fun arrayNoDuplicates!0 (array!78491 (_ BitVec 32) List!26705) Bool)

(assert (=> b!1215684 (= res!807195 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26702))))

(declare-fun b!1215685 () Bool)

(declare-fun res!807189 () Bool)

(assert (=> b!1215685 (=> (not res!807189) (not e!690265))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215685 (= res!807189 (validMask!0 mask!1564))))

(declare-fun b!1215686 () Bool)

(declare-fun e!690260 () Bool)

(declare-fun e!690262 () Bool)

(assert (=> b!1215686 (= e!690260 (not e!690262))))

(declare-fun res!807188 () Bool)

(assert (=> b!1215686 (=> res!807188 e!690262)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215686 (= res!807188 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215686 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40306 0))(
  ( (Unit!40307) )
))
(declare-fun lt!552684 () Unit!40306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78491 (_ BitVec 64) (_ BitVec 32)) Unit!40306)

(assert (=> b!1215686 (= lt!552684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1215687 () Bool)

(declare-fun res!807190 () Bool)

(assert (=> b!1215687 (=> (not res!807190) (not e!690265))))

(assert (=> b!1215687 (= res!807190 (= (select (arr!37880 _keys!1208) i!673) k!934))))

(declare-fun b!1215688 () Bool)

(declare-fun e!690261 () Bool)

(declare-fun tp_is_empty!30859 () Bool)

(assert (=> b!1215688 (= e!690261 tp_is_empty!30859)))

(declare-fun b!1215689 () Bool)

(declare-fun res!807193 () Bool)

(assert (=> b!1215689 (=> (not res!807193) (not e!690265))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46273 0))(
  ( (V!46274 (val!15486 Int)) )
))
(declare-datatypes ((ValueCell!14720 0))(
  ( (ValueCellFull!14720 (v!18139 V!46273)) (EmptyCell!14720) )
))
(declare-datatypes ((array!78493 0))(
  ( (array!78494 (arr!37881 (Array (_ BitVec 32) ValueCell!14720)) (size!38417 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78493)

(assert (=> b!1215689 (= res!807193 (and (= (size!38417 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38416 _keys!1208) (size!38417 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215690 () Bool)

(declare-fun e!690264 () Bool)

(assert (=> b!1215690 (= e!690264 tp_is_empty!30859)))

(declare-fun res!807187 () Bool)

(assert (=> start!101232 (=> (not res!807187) (not e!690265))))

(assert (=> start!101232 (= res!807187 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38416 _keys!1208))))))

(assert (=> start!101232 e!690265))

(assert (=> start!101232 tp_is_empty!30859))

(declare-fun array_inv!28844 (array!78491) Bool)

(assert (=> start!101232 (array_inv!28844 _keys!1208)))

(assert (=> start!101232 true))

(assert (=> start!101232 tp!91486))

(declare-fun e!690259 () Bool)

(declare-fun array_inv!28845 (array!78493) Bool)

(assert (=> start!101232 (and (array_inv!28845 _values!996) e!690259)))

(declare-fun b!1215691 () Bool)

(assert (=> b!1215691 (= e!690265 e!690260)))

(declare-fun res!807194 () Bool)

(assert (=> b!1215691 (=> (not res!807194) (not e!690260))))

(declare-fun lt!552682 () array!78491)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78491 (_ BitVec 32)) Bool)

(assert (=> b!1215691 (= res!807194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552682 mask!1564))))

(assert (=> b!1215691 (= lt!552682 (array!78492 (store (arr!37880 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38416 _keys!1208)))))

(declare-fun b!1215692 () Bool)

(declare-fun res!807197 () Bool)

(assert (=> b!1215692 (=> (not res!807197) (not e!690265))))

(assert (=> b!1215692 (= res!807197 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38416 _keys!1208))))))

(declare-fun mapNonEmpty!48163 () Bool)

(declare-fun mapRes!48163 () Bool)

(declare-fun tp!91487 () Bool)

(assert (=> mapNonEmpty!48163 (= mapRes!48163 (and tp!91487 e!690264))))

(declare-fun mapValue!48163 () ValueCell!14720)

(declare-fun mapRest!48163 () (Array (_ BitVec 32) ValueCell!14720))

(declare-fun mapKey!48163 () (_ BitVec 32))

(assert (=> mapNonEmpty!48163 (= (arr!37881 _values!996) (store mapRest!48163 mapKey!48163 mapValue!48163))))

(declare-fun b!1215693 () Bool)

(declare-fun res!807196 () Bool)

(assert (=> b!1215693 (=> (not res!807196) (not e!690265))))

(assert (=> b!1215693 (= res!807196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215694 () Bool)

(declare-fun res!807192 () Bool)

(assert (=> b!1215694 (=> (not res!807192) (not e!690260))))

(assert (=> b!1215694 (= res!807192 (arrayNoDuplicates!0 lt!552682 #b00000000000000000000000000000000 Nil!26702))))

(declare-fun b!1215695 () Bool)

(declare-fun res!807191 () Bool)

(assert (=> b!1215695 (=> (not res!807191) (not e!690265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215695 (= res!807191 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!48163 () Bool)

(assert (=> mapIsEmpty!48163 mapRes!48163))

(declare-fun b!1215696 () Bool)

(assert (=> b!1215696 (= e!690259 (and e!690261 mapRes!48163))))

(declare-fun condMapEmpty!48163 () Bool)

(declare-fun mapDefault!48163 () ValueCell!14720)

