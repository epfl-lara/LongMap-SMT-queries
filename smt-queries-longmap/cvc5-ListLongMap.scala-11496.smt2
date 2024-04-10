; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133784 () Bool)

(assert start!133784)

(declare-fun b!1564322 () Bool)

(declare-fun e!871885 () Bool)

(declare-fun tp_is_empty!38857 () Bool)

(assert (=> b!1564322 (= e!871885 tp_is_empty!38857)))

(declare-fun b!1564324 () Bool)

(declare-fun e!871882 () Bool)

(assert (=> b!1564324 (= e!871882 tp_is_empty!38857)))

(declare-fun b!1564325 () Bool)

(declare-fun res!1069444 () Bool)

(declare-fun e!871881 () Bool)

(assert (=> b!1564325 (=> (not res!1069444) (not e!871881))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104404 0))(
  ( (array!104405 (arr!50393 (Array (_ BitVec 32) (_ BitVec 64))) (size!50943 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104404)

(assert (=> b!1564325 (= res!1069444 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50943 _keys!637)) (bvsge from!782 (size!50943 _keys!637))))))

(declare-fun mapNonEmpty!59664 () Bool)

(declare-fun mapRes!59664 () Bool)

(declare-fun tp!113589 () Bool)

(assert (=> mapNonEmpty!59664 (= mapRes!59664 (and tp!113589 e!871882))))

(declare-datatypes ((V!60017 0))(
  ( (V!60018 (val!19512 Int)) )
))
(declare-datatypes ((ValueCell!18398 0))(
  ( (ValueCellFull!18398 (v!22264 V!60017)) (EmptyCell!18398) )
))
(declare-fun mapValue!59664 () ValueCell!18398)

(declare-datatypes ((array!104406 0))(
  ( (array!104407 (arr!50394 (Array (_ BitVec 32) ValueCell!18398)) (size!50944 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104406)

(declare-fun mapKey!59664 () (_ BitVec 32))

(declare-fun mapRest!59664 () (Array (_ BitVec 32) ValueCell!18398))

(assert (=> mapNonEmpty!59664 (= (arr!50394 _values!487) (store mapRest!59664 mapKey!59664 mapValue!59664))))

(declare-fun b!1564326 () Bool)

(assert (=> b!1564326 (= e!871881 false)))

(declare-fun lt!672027 () Bool)

(declare-datatypes ((tuple2!25172 0))(
  ( (tuple2!25173 (_1!12597 (_ BitVec 64)) (_2!12597 V!60017)) )
))
(declare-datatypes ((List!36560 0))(
  ( (Nil!36557) (Cons!36556 (h!38002 tuple2!25172) (t!51407 List!36560)) )
))
(declare-datatypes ((ListLongMap!22607 0))(
  ( (ListLongMap!22608 (toList!11319 List!36560)) )
))
(declare-fun contains!10310 (ListLongMap!22607 (_ BitVec 64)) Bool)

(assert (=> b!1564326 (= lt!672027 (contains!10310 (ListLongMap!22608 Nil!36557) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564327 () Bool)

(declare-fun res!1069441 () Bool)

(assert (=> b!1564327 (=> (not res!1069441) (not e!871881))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564327 (= res!1069441 (and (= (size!50944 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50943 _keys!637) (size!50944 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564328 () Bool)

(declare-fun res!1069443 () Bool)

(assert (=> b!1564328 (=> (not res!1069443) (not e!871881))))

(assert (=> b!1564328 (= res!1069443 (not (contains!10310 (ListLongMap!22608 Nil!36557) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!59664 () Bool)

(assert (=> mapIsEmpty!59664 mapRes!59664))

(declare-fun b!1564323 () Bool)

(declare-fun res!1069442 () Bool)

(assert (=> b!1564323 (=> (not res!1069442) (not e!871881))))

(declare-datatypes ((List!36561 0))(
  ( (Nil!36558) (Cons!36557 (h!38003 (_ BitVec 64)) (t!51408 List!36561)) )
))
(declare-fun arrayNoDuplicates!0 (array!104404 (_ BitVec 32) List!36561) Bool)

(assert (=> b!1564323 (= res!1069442 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36558))))

(declare-fun res!1069445 () Bool)

(assert (=> start!133784 (=> (not res!1069445) (not e!871881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133784 (= res!1069445 (validMask!0 mask!947))))

(assert (=> start!133784 e!871881))

(assert (=> start!133784 true))

(declare-fun array_inv!39163 (array!104404) Bool)

(assert (=> start!133784 (array_inv!39163 _keys!637)))

(declare-fun e!871883 () Bool)

(declare-fun array_inv!39164 (array!104406) Bool)

(assert (=> start!133784 (and (array_inv!39164 _values!487) e!871883)))

(declare-fun b!1564329 () Bool)

(assert (=> b!1564329 (= e!871883 (and e!871885 mapRes!59664))))

(declare-fun condMapEmpty!59664 () Bool)

(declare-fun mapDefault!59664 () ValueCell!18398)

