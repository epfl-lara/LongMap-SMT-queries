; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100478 () Bool)

(assert start!100478)

(declare-fun b_free!25801 () Bool)

(declare-fun b_next!25801 () Bool)

(assert (=> start!100478 (= b_free!25801 (not b_next!25801))))

(declare-fun tp!90393 () Bool)

(declare-fun b_and!42489 () Bool)

(assert (=> start!100478 (= tp!90393 b_and!42489)))

(declare-fun b!1200025 () Bool)

(declare-fun res!798804 () Bool)

(declare-fun e!681525 () Bool)

(assert (=> b!1200025 (=> (not res!798804) (not e!681525))))

(declare-datatypes ((array!77783 0))(
  ( (array!77784 (arr!37536 (Array (_ BitVec 32) (_ BitVec 64))) (size!38072 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77783)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1200025 (= res!798804 (= (select (arr!37536 _keys!1208) i!673) k!934))))

(declare-fun b!1200026 () Bool)

(declare-fun res!798797 () Bool)

(assert (=> b!1200026 (=> (not res!798797) (not e!681525))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77783 (_ BitVec 32)) Bool)

(assert (=> b!1200026 (= res!798797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200027 () Bool)

(declare-fun e!681526 () Bool)

(assert (=> b!1200027 (= e!681525 e!681526)))

(declare-fun res!798800 () Bool)

(assert (=> b!1200027 (=> (not res!798800) (not e!681526))))

(declare-fun lt!543929 () array!77783)

(assert (=> b!1200027 (= res!798800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543929 mask!1564))))

(assert (=> b!1200027 (= lt!543929 (array!77784 (store (arr!37536 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38072 _keys!1208)))))

(declare-fun b!1200028 () Bool)

(declare-fun res!798795 () Bool)

(assert (=> b!1200028 (=> (not res!798795) (not e!681525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200028 (= res!798795 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47600 () Bool)

(declare-fun mapRes!47600 () Bool)

(assert (=> mapIsEmpty!47600 mapRes!47600))

(declare-fun b!1200029 () Bool)

(declare-fun e!681527 () Bool)

(declare-fun tp_is_empty!30505 () Bool)

(assert (=> b!1200029 (= e!681527 tp_is_empty!30505)))

(declare-fun b!1200030 () Bool)

(declare-fun res!798801 () Bool)

(assert (=> b!1200030 (=> (not res!798801) (not e!681526))))

(declare-datatypes ((List!26414 0))(
  ( (Nil!26411) (Cons!26410 (h!27619 (_ BitVec 64)) (t!39195 List!26414)) )
))
(declare-fun arrayNoDuplicates!0 (array!77783 (_ BitVec 32) List!26414) Bool)

(assert (=> b!1200030 (= res!798801 (arrayNoDuplicates!0 lt!543929 #b00000000000000000000000000000000 Nil!26411))))

(declare-fun mapNonEmpty!47600 () Bool)

(declare-fun tp!90392 () Bool)

(assert (=> mapNonEmpty!47600 (= mapRes!47600 (and tp!90392 e!681527))))

(declare-fun mapKey!47600 () (_ BitVec 32))

(declare-datatypes ((V!45801 0))(
  ( (V!45802 (val!15309 Int)) )
))
(declare-datatypes ((ValueCell!14543 0))(
  ( (ValueCellFull!14543 (v!17947 V!45801)) (EmptyCell!14543) )
))
(declare-fun mapRest!47600 () (Array (_ BitVec 32) ValueCell!14543))

(declare-fun mapValue!47600 () ValueCell!14543)

(declare-datatypes ((array!77785 0))(
  ( (array!77786 (arr!37537 (Array (_ BitVec 32) ValueCell!14543)) (size!38073 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77785)

(assert (=> mapNonEmpty!47600 (= (arr!37537 _values!996) (store mapRest!47600 mapKey!47600 mapValue!47600))))

(declare-fun b!1200031 () Bool)

(declare-fun e!681523 () Bool)

(declare-fun e!681524 () Bool)

(assert (=> b!1200031 (= e!681523 (and e!681524 mapRes!47600))))

(declare-fun condMapEmpty!47600 () Bool)

(declare-fun mapDefault!47600 () ValueCell!14543)

