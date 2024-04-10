; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134070 () Bool)

(assert start!134070)

(declare-fun b_free!32197 () Bool)

(declare-fun b_next!32197 () Bool)

(assert (=> start!134070 (= b_free!32197 (not b_next!32197))))

(declare-fun tp!113910 () Bool)

(declare-fun b_and!51841 () Bool)

(assert (=> start!134070 (= tp!113910 b_and!51841)))

(declare-fun mapIsEmpty!59865 () Bool)

(declare-fun mapRes!59865 () Bool)

(assert (=> mapIsEmpty!59865 mapRes!59865))

(declare-fun res!1070914 () Bool)

(declare-fun e!873427 () Bool)

(assert (=> start!134070 (=> (not res!1070914) (not e!873427))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134070 (= res!1070914 (validMask!0 mask!947))))

(assert (=> start!134070 e!873427))

(assert (=> start!134070 tp!113910))

(declare-fun tp_is_empty!38977 () Bool)

(assert (=> start!134070 tp_is_empty!38977))

(assert (=> start!134070 true))

(declare-datatypes ((array!104644 0))(
  ( (array!104645 (arr!50507 (Array (_ BitVec 32) (_ BitVec 64))) (size!51057 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104644)

(declare-fun array_inv!39245 (array!104644) Bool)

(assert (=> start!134070 (array_inv!39245 _keys!637)))

(declare-datatypes ((V!60177 0))(
  ( (V!60178 (val!19572 Int)) )
))
(declare-datatypes ((ValueCell!18458 0))(
  ( (ValueCellFull!18458 (v!22331 V!60177)) (EmptyCell!18458) )
))
(declare-datatypes ((array!104646 0))(
  ( (array!104647 (arr!50508 (Array (_ BitVec 32) ValueCell!18458)) (size!51058 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104646)

(declare-fun e!873426 () Bool)

(declare-fun array_inv!39246 (array!104646) Bool)

(assert (=> start!134070 (and (array_inv!39246 _values!487) e!873426)))

(declare-fun b!1566913 () Bool)

(declare-fun e!873422 () Bool)

(assert (=> b!1566913 (= e!873427 e!873422)))

(declare-fun res!1070918 () Bool)

(assert (=> b!1566913 (=> (not res!1070918) (not e!873422))))

(declare-datatypes ((tuple2!25252 0))(
  ( (tuple2!25253 (_1!12637 (_ BitVec 64)) (_2!12637 V!60177)) )
))
(declare-datatypes ((List!36640 0))(
  ( (Nil!36637) (Cons!36636 (h!38083 tuple2!25252) (t!51544 List!36640)) )
))
(declare-datatypes ((ListLongMap!22687 0))(
  ( (ListLongMap!22688 (toList!11359 List!36640)) )
))
(declare-fun lt!672826 () ListLongMap!22687)

(declare-fun contains!10353 (ListLongMap!22687 (_ BitVec 64)) Bool)

(assert (=> b!1566913 (= res!1070918 (not (contains!10353 lt!672826 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60177)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60177)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6724 (array!104644 array!104646 (_ BitVec 32) (_ BitVec 32) V!60177 V!60177 (_ BitVec 32) Int) ListLongMap!22687)

(assert (=> b!1566913 (= lt!672826 (getCurrentListMapNoExtraKeys!6724 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566914 () Bool)

(declare-fun e!873425 () Bool)

(assert (=> b!1566914 (= e!873426 (and e!873425 mapRes!59865))))

(declare-fun condMapEmpty!59865 () Bool)

(declare-fun mapDefault!59865 () ValueCell!18458)

