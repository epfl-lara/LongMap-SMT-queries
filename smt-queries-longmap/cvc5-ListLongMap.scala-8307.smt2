; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101190 () Bool)

(assert start!101190)

(declare-fun b_free!26113 () Bool)

(declare-fun b_next!26113 () Bool)

(assert (=> start!101190 (= b_free!26113 (not b_next!26113))))

(declare-fun tp!91360 () Bool)

(declare-fun b_and!43343 () Bool)

(assert (=> start!101190 (= tp!91360 b_and!43343)))

(declare-fun b!1214760 () Bool)

(declare-fun res!806497 () Bool)

(declare-fun e!689822 () Bool)

(assert (=> b!1214760 (=> (not res!806497) (not e!689822))))

(declare-datatypes ((array!78413 0))(
  ( (array!78414 (arr!37841 (Array (_ BitVec 32) (_ BitVec 64))) (size!38377 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78413)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78413 (_ BitVec 32)) Bool)

(assert (=> b!1214760 (= res!806497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48100 () Bool)

(declare-fun mapRes!48100 () Bool)

(assert (=> mapIsEmpty!48100 mapRes!48100))

(declare-fun b!1214762 () Bool)

(declare-fun e!689823 () Bool)

(declare-fun tp_is_empty!30817 () Bool)

(assert (=> b!1214762 (= e!689823 tp_is_empty!30817)))

(declare-fun b!1214763 () Bool)

(declare-fun res!806504 () Bool)

(assert (=> b!1214763 (=> (not res!806504) (not e!689822))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214763 (= res!806504 (validKeyInArray!0 k!934))))

(declare-fun b!1214764 () Bool)

(declare-fun e!689818 () Bool)

(declare-fun e!689821 () Bool)

(assert (=> b!1214764 (= e!689818 (and e!689821 mapRes!48100))))

(declare-fun condMapEmpty!48100 () Bool)

(declare-datatypes ((V!46217 0))(
  ( (V!46218 (val!15465 Int)) )
))
(declare-datatypes ((ValueCell!14699 0))(
  ( (ValueCellFull!14699 (v!18118 V!46217)) (EmptyCell!14699) )
))
(declare-datatypes ((array!78415 0))(
  ( (array!78416 (arr!37842 (Array (_ BitVec 32) ValueCell!14699)) (size!38378 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78415)

(declare-fun mapDefault!48100 () ValueCell!14699)

