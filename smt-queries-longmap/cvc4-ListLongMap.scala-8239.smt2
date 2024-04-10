; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100368 () Bool)

(assert start!100368)

(declare-fun mapIsEmpty!47459 () Bool)

(declare-fun mapRes!47459 () Bool)

(assert (=> mapIsEmpty!47459 mapRes!47459))

(declare-fun b!1197917 () Bool)

(declare-fun e!680492 () Bool)

(declare-fun e!680491 () Bool)

(assert (=> b!1197917 (= e!680492 e!680491)))

(declare-fun res!797235 () Bool)

(assert (=> b!1197917 (=> (not res!797235) (not e!680491))))

(declare-datatypes ((array!77603 0))(
  ( (array!77604 (arr!37447 (Array (_ BitVec 32) (_ BitVec 64))) (size!37983 (_ BitVec 32))) )
))
(declare-fun lt!543371 () array!77603)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77603 (_ BitVec 32)) Bool)

(assert (=> b!1197917 (= res!797235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543371 mask!1564))))

(declare-fun _keys!1208 () array!77603)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197917 (= lt!543371 (array!77604 (store (arr!37447 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37983 _keys!1208)))))

(declare-fun b!1197918 () Bool)

(declare-fun e!680495 () Bool)

(declare-fun tp_is_empty!30413 () Bool)

(assert (=> b!1197918 (= e!680495 tp_is_empty!30413)))

(declare-fun b!1197919 () Bool)

(declare-fun res!797238 () Bool)

(assert (=> b!1197919 (=> (not res!797238) (not e!680492))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45677 0))(
  ( (V!45678 (val!15263 Int)) )
))
(declare-datatypes ((ValueCell!14497 0))(
  ( (ValueCellFull!14497 (v!17901 V!45677)) (EmptyCell!14497) )
))
(declare-datatypes ((array!77605 0))(
  ( (array!77606 (arr!37448 (Array (_ BitVec 32) ValueCell!14497)) (size!37984 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77605)

(assert (=> b!1197919 (= res!797238 (and (= (size!37984 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37983 _keys!1208) (size!37984 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197920 () Bool)

(declare-fun e!680493 () Bool)

(assert (=> b!1197920 (= e!680493 tp_is_empty!30413)))

(declare-fun b!1197921 () Bool)

(declare-fun e!680490 () Bool)

(assert (=> b!1197921 (= e!680490 (and e!680493 mapRes!47459))))

(declare-fun condMapEmpty!47459 () Bool)

(declare-fun mapDefault!47459 () ValueCell!14497)

