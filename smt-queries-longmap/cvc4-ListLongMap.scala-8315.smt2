; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101242 () Bool)

(assert start!101242)

(declare-fun b_free!26165 () Bool)

(declare-fun b_next!26165 () Bool)

(assert (=> start!101242 (= b_free!26165 (not b_next!26165))))

(declare-fun tp!91517 () Bool)

(declare-fun b_and!43447 () Bool)

(assert (=> start!101242 (= tp!91517 b_and!43447)))

(declare-fun res!807354 () Bool)

(declare-fun e!690367 () Bool)

(assert (=> start!101242 (=> (not res!807354) (not e!690367))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78511 0))(
  ( (array!78512 (arr!37890 (Array (_ BitVec 32) (_ BitVec 64))) (size!38426 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78511)

(assert (=> start!101242 (= res!807354 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38426 _keys!1208))))))

(assert (=> start!101242 e!690367))

(declare-fun tp_is_empty!30869 () Bool)

(assert (=> start!101242 tp_is_empty!30869))

(declare-fun array_inv!28850 (array!78511) Bool)

(assert (=> start!101242 (array_inv!28850 _keys!1208)))

(assert (=> start!101242 true))

(assert (=> start!101242 tp!91517))

(declare-datatypes ((V!46285 0))(
  ( (V!46286 (val!15491 Int)) )
))
(declare-datatypes ((ValueCell!14725 0))(
  ( (ValueCellFull!14725 (v!18144 V!46285)) (EmptyCell!14725) )
))
(declare-datatypes ((array!78513 0))(
  ( (array!78514 (arr!37891 (Array (_ BitVec 32) ValueCell!14725)) (size!38427 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78513)

(declare-fun e!690369 () Bool)

(declare-fun array_inv!28851 (array!78513) Bool)

(assert (=> start!101242 (and (array_inv!28851 _values!996) e!690369)))

(declare-fun b!1215904 () Bool)

(declare-fun res!807359 () Bool)

(assert (=> b!1215904 (=> (not res!807359) (not e!690367))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215904 (= res!807359 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38426 _keys!1208))))))

(declare-fun b!1215905 () Bool)

(declare-fun e!690368 () Bool)

(declare-fun mapRes!48178 () Bool)

(assert (=> b!1215905 (= e!690369 (and e!690368 mapRes!48178))))

(declare-fun condMapEmpty!48178 () Bool)

(declare-fun mapDefault!48178 () ValueCell!14725)

