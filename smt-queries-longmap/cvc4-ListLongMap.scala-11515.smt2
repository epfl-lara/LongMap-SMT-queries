; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134068 () Bool)

(assert start!134068)

(declare-fun b_free!32195 () Bool)

(declare-fun b_next!32195 () Bool)

(assert (=> start!134068 (= b_free!32195 (not b_next!32195))))

(declare-fun tp!113903 () Bool)

(declare-fun b_and!51839 () Bool)

(assert (=> start!134068 (= tp!113903 b_and!51839)))

(declare-fun mapNonEmpty!59862 () Bool)

(declare-fun mapRes!59862 () Bool)

(declare-fun tp!113904 () Bool)

(declare-fun e!873405 () Bool)

(assert (=> mapNonEmpty!59862 (= mapRes!59862 (and tp!113904 e!873405))))

(declare-datatypes ((V!60173 0))(
  ( (V!60174 (val!19571 Int)) )
))
(declare-datatypes ((ValueCell!18457 0))(
  ( (ValueCellFull!18457 (v!22330 V!60173)) (EmptyCell!18457) )
))
(declare-fun mapRest!59862 () (Array (_ BitVec 32) ValueCell!18457))

(declare-fun mapKey!59862 () (_ BitVec 32))

(declare-datatypes ((array!104640 0))(
  ( (array!104641 (arr!50505 (Array (_ BitVec 32) ValueCell!18457)) (size!51055 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104640)

(declare-fun mapValue!59862 () ValueCell!18457)

(assert (=> mapNonEmpty!59862 (= (arr!50505 _values!487) (store mapRest!59862 mapKey!59862 mapValue!59862))))

(declare-fun b!1566883 () Bool)

(declare-fun e!873406 () Bool)

(declare-fun e!873407 () Bool)

(assert (=> b!1566883 (= e!873406 e!873407)))

(declare-fun res!1070893 () Bool)

(assert (=> b!1566883 (=> (not res!1070893) (not e!873407))))

(declare-datatypes ((tuple2!25250 0))(
  ( (tuple2!25251 (_1!12636 (_ BitVec 64)) (_2!12636 V!60173)) )
))
(declare-datatypes ((List!36639 0))(
  ( (Nil!36636) (Cons!36635 (h!38082 tuple2!25250) (t!51543 List!36639)) )
))
(declare-datatypes ((ListLongMap!22685 0))(
  ( (ListLongMap!22686 (toList!11358 List!36639)) )
))
(declare-fun lt!672821 () ListLongMap!22685)

(declare-fun contains!10352 (ListLongMap!22685 (_ BitVec 64)) Bool)

(assert (=> b!1566883 (= res!1070893 (not (contains!10352 lt!672821 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60173)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60173)

(declare-datatypes ((array!104642 0))(
  ( (array!104643 (arr!50506 (Array (_ BitVec 32) (_ BitVec 64))) (size!51056 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104642)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6723 (array!104642 array!104640 (_ BitVec 32) (_ BitVec 32) V!60173 V!60173 (_ BitVec 32) Int) ListLongMap!22685)

(assert (=> b!1566883 (= lt!672821 (getCurrentListMapNoExtraKeys!6723 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59862 () Bool)

(assert (=> mapIsEmpty!59862 mapRes!59862))

(declare-fun res!1070894 () Bool)

(assert (=> start!134068 (=> (not res!1070894) (not e!873406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134068 (= res!1070894 (validMask!0 mask!947))))

(assert (=> start!134068 e!873406))

(assert (=> start!134068 tp!113903))

(declare-fun tp_is_empty!38975 () Bool)

(assert (=> start!134068 tp_is_empty!38975))

(assert (=> start!134068 true))

(declare-fun array_inv!39243 (array!104642) Bool)

(assert (=> start!134068 (array_inv!39243 _keys!637)))

(declare-fun e!873409 () Bool)

(declare-fun array_inv!39244 (array!104640) Bool)

(assert (=> start!134068 (and (array_inv!39244 _values!487) e!873409)))

(declare-fun b!1566884 () Bool)

(declare-fun res!1070896 () Bool)

(assert (=> b!1566884 (=> (not res!1070896) (not e!873406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104642 (_ BitVec 32)) Bool)

(assert (=> b!1566884 (= res!1070896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566885 () Bool)

(declare-fun e!873404 () Bool)

(assert (=> b!1566885 (= e!873409 (and e!873404 mapRes!59862))))

(declare-fun condMapEmpty!59862 () Bool)

(declare-fun mapDefault!59862 () ValueCell!18457)

