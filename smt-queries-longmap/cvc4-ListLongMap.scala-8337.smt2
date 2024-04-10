; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101480 () Bool)

(assert start!101480)

(declare-fun b_free!26297 () Bool)

(declare-fun b_next!26297 () Bool)

(assert (=> start!101480 (= b_free!26297 (not b_next!26297))))

(declare-fun tp!91924 () Bool)

(declare-fun b_and!43783 () Bool)

(assert (=> start!101480 (= tp!91924 b_and!43783)))

(declare-datatypes ((array!78779 0))(
  ( (array!78780 (arr!38020 (Array (_ BitVec 32) (_ BitVec 64))) (size!38556 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78779)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!692713 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1219959 () Bool)

(declare-fun arrayContainsKey!0 (array!78779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219959 (= e!692713 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219960 () Bool)

(declare-fun e!692710 () Bool)

(declare-fun e!692706 () Bool)

(assert (=> b!1219960 (= e!692710 (not e!692706))))

(declare-fun res!810358 () Bool)

(assert (=> b!1219960 (=> res!810358 e!692706)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219960 (= res!810358 (bvsgt from!1455 i!673))))

(assert (=> b!1219960 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40426 0))(
  ( (Unit!40427) )
))
(declare-fun lt!554724 () Unit!40426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78779 (_ BitVec 64) (_ BitVec 32)) Unit!40426)

(assert (=> b!1219960 (= lt!554724 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219961 () Bool)

(declare-fun e!692712 () Bool)

(declare-fun tp_is_empty!31001 () Bool)

(assert (=> b!1219961 (= e!692712 tp_is_empty!31001)))

(declare-fun b!1219962 () Bool)

(declare-fun res!810356 () Bool)

(declare-fun e!692714 () Bool)

(assert (=> b!1219962 (=> (not res!810356) (not e!692714))))

(declare-datatypes ((List!26825 0))(
  ( (Nil!26822) (Cons!26821 (h!28030 (_ BitVec 64)) (t!40102 List!26825)) )
))
(declare-fun arrayNoDuplicates!0 (array!78779 (_ BitVec 32) List!26825) Bool)

(assert (=> b!1219962 (= res!810356 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26822))))

(declare-fun mapIsEmpty!48388 () Bool)

(declare-fun mapRes!48388 () Bool)

(assert (=> mapIsEmpty!48388 mapRes!48388))

(declare-fun res!810347 () Bool)

(assert (=> start!101480 (=> (not res!810347) (not e!692714))))

(assert (=> start!101480 (= res!810347 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38556 _keys!1208))))))

(assert (=> start!101480 e!692714))

(assert (=> start!101480 tp_is_empty!31001))

(declare-fun array_inv!28934 (array!78779) Bool)

(assert (=> start!101480 (array_inv!28934 _keys!1208)))

(assert (=> start!101480 true))

(assert (=> start!101480 tp!91924))

(declare-datatypes ((V!46461 0))(
  ( (V!46462 (val!15557 Int)) )
))
(declare-datatypes ((ValueCell!14791 0))(
  ( (ValueCellFull!14791 (v!18214 V!46461)) (EmptyCell!14791) )
))
(declare-datatypes ((array!78781 0))(
  ( (array!78782 (arr!38021 (Array (_ BitVec 32) ValueCell!14791)) (size!38557 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78781)

(declare-fun e!692715 () Bool)

(declare-fun array_inv!28935 (array!78781) Bool)

(assert (=> start!101480 (and (array_inv!28935 _values!996) e!692715)))

(declare-fun b!1219963 () Bool)

(declare-fun e!692709 () Bool)

(assert (=> b!1219963 (= e!692709 true)))

(assert (=> b!1219963 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554727 () Unit!40426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78779 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40426)

(assert (=> b!1219963 (= lt!554727 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219964 () Bool)

(declare-fun e!692705 () Bool)

(assert (=> b!1219964 (= e!692715 (and e!692705 mapRes!48388))))

(declare-fun condMapEmpty!48388 () Bool)

(declare-fun mapDefault!48388 () ValueCell!14791)

