; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101230 () Bool)

(assert start!101230)

(declare-fun b_free!26153 () Bool)

(declare-fun b_next!26153 () Bool)

(assert (=> start!101230 (= b_free!26153 (not b_next!26153))))

(declare-fun tp!91481 () Bool)

(declare-fun b_and!43423 () Bool)

(assert (=> start!101230 (= tp!91481 b_and!43423)))

(declare-fun b!1215640 () Bool)

(declare-fun res!807163 () Bool)

(declare-fun e!690240 () Bool)

(assert (=> b!1215640 (=> (not res!807163) (not e!690240))))

(declare-datatypes ((array!78487 0))(
  ( (array!78488 (arr!37878 (Array (_ BitVec 32) (_ BitVec 64))) (size!38414 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78487)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1215640 (= res!807163 (= (select (arr!37878 _keys!1208) i!673) k!934))))

(declare-fun res!807157 () Bool)

(assert (=> start!101230 (=> (not res!807157) (not e!690240))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101230 (= res!807157 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38414 _keys!1208))))))

(assert (=> start!101230 e!690240))

(declare-fun tp_is_empty!30857 () Bool)

(assert (=> start!101230 tp_is_empty!30857))

(declare-fun array_inv!28842 (array!78487) Bool)

(assert (=> start!101230 (array_inv!28842 _keys!1208)))

(assert (=> start!101230 true))

(assert (=> start!101230 tp!91481))

(declare-datatypes ((V!46269 0))(
  ( (V!46270 (val!15485 Int)) )
))
(declare-datatypes ((ValueCell!14719 0))(
  ( (ValueCellFull!14719 (v!18138 V!46269)) (EmptyCell!14719) )
))
(declare-datatypes ((array!78489 0))(
  ( (array!78490 (arr!37879 (Array (_ BitVec 32) ValueCell!14719)) (size!38415 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78489)

(declare-fun e!690244 () Bool)

(declare-fun array_inv!28843 (array!78489) Bool)

(assert (=> start!101230 (and (array_inv!28843 _values!996) e!690244)))

(declare-fun b!1215641 () Bool)

(declare-fun e!690239 () Bool)

(assert (=> b!1215641 (= e!690239 tp_is_empty!30857)))

(declare-fun b!1215642 () Bool)

(declare-fun res!807159 () Bool)

(declare-fun e!690241 () Bool)

(assert (=> b!1215642 (=> (not res!807159) (not e!690241))))

(declare-fun lt!552669 () array!78487)

(declare-datatypes ((List!26704 0))(
  ( (Nil!26701) (Cons!26700 (h!27909 (_ BitVec 64)) (t!39837 List!26704)) )
))
(declare-fun arrayNoDuplicates!0 (array!78487 (_ BitVec 32) List!26704) Bool)

(assert (=> b!1215642 (= res!807159 (arrayNoDuplicates!0 lt!552669 #b00000000000000000000000000000000 Nil!26701))))

(declare-fun b!1215643 () Bool)

(declare-fun e!690242 () Bool)

(assert (=> b!1215643 (= e!690242 tp_is_empty!30857)))

(declare-fun b!1215644 () Bool)

(declare-fun mapRes!48160 () Bool)

(assert (=> b!1215644 (= e!690244 (and e!690239 mapRes!48160))))

(declare-fun condMapEmpty!48160 () Bool)

(declare-fun mapDefault!48160 () ValueCell!14719)

