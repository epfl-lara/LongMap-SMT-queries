; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99968 () Bool)

(assert start!99968)

(declare-fun b_free!25547 () Bool)

(declare-fun b_next!25547 () Bool)

(assert (=> start!99968 (= b_free!25547 (not b_next!25547))))

(declare-fun tp!89354 () Bool)

(declare-fun b_and!41961 () Bool)

(assert (=> start!99968 (= tp!89354 b_and!41961)))

(declare-fun b!1190528 () Bool)

(declare-fun res!791784 () Bool)

(declare-fun e!676803 () Bool)

(assert (=> b!1190528 (=> (not res!791784) (not e!676803))))

(declare-datatypes ((array!76945 0))(
  ( (array!76946 (arr!37122 (Array (_ BitVec 32) (_ BitVec 64))) (size!37658 (_ BitVec 32))) )
))
(declare-fun lt!541483 () array!76945)

(declare-datatypes ((List!26138 0))(
  ( (Nil!26135) (Cons!26134 (h!27343 (_ BitVec 64)) (t!38677 List!26138)) )
))
(declare-fun arrayNoDuplicates!0 (array!76945 (_ BitVec 32) List!26138) Bool)

(assert (=> b!1190528 (= res!791784 (arrayNoDuplicates!0 lt!541483 #b00000000000000000000000000000000 Nil!26135))))

(declare-fun b!1190529 () Bool)

(declare-fun e!676807 () Bool)

(assert (=> b!1190529 (= e!676803 (not e!676807))))

(declare-fun res!791786 () Bool)

(assert (=> b!1190529 (=> res!791786 e!676807)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190529 (= res!791786 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!76945)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190529 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39488 0))(
  ( (Unit!39489) )
))
(declare-fun lt!541488 () Unit!39488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76945 (_ BitVec 64) (_ BitVec 32)) Unit!39488)

(assert (=> b!1190529 (= lt!541488 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190530 () Bool)

(declare-fun e!676805 () Bool)

(declare-fun tp_is_empty!30077 () Bool)

(assert (=> b!1190530 (= e!676805 tp_is_empty!30077)))

(declare-fun b!1190531 () Bool)

(declare-fun e!676810 () Bool)

(assert (=> b!1190531 (= e!676810 tp_is_empty!30077)))

(declare-fun res!791785 () Bool)

(declare-fun e!676806 () Bool)

(assert (=> start!99968 (=> (not res!791785) (not e!676806))))

(assert (=> start!99968 (= res!791785 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37658 _keys!1208))))))

(assert (=> start!99968 e!676806))

(assert (=> start!99968 tp_is_empty!30077))

(declare-fun array_inv!28310 (array!76945) Bool)

(assert (=> start!99968 (array_inv!28310 _keys!1208)))

(assert (=> start!99968 true))

(assert (=> start!99968 tp!89354))

(declare-datatypes ((V!45229 0))(
  ( (V!45230 (val!15095 Int)) )
))
(declare-datatypes ((ValueCell!14329 0))(
  ( (ValueCellFull!14329 (v!17733 V!45229)) (EmptyCell!14329) )
))
(declare-datatypes ((array!76947 0))(
  ( (array!76948 (arr!37123 (Array (_ BitVec 32) ValueCell!14329)) (size!37659 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76947)

(declare-fun e!676808 () Bool)

(declare-fun array_inv!28311 (array!76947) Bool)

(assert (=> start!99968 (and (array_inv!28311 _values!996) e!676808)))

(declare-fun b!1190532 () Bool)

(declare-fun mapRes!46943 () Bool)

(assert (=> b!1190532 (= e!676808 (and e!676810 mapRes!46943))))

(declare-fun condMapEmpty!46943 () Bool)

(declare-fun mapDefault!46943 () ValueCell!14329)

