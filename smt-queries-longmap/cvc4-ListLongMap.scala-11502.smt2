; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133862 () Bool)

(assert start!133862)

(declare-fun b_free!32123 () Bool)

(declare-fun b_next!32123 () Bool)

(assert (=> start!133862 (= b_free!32123 (not b_next!32123))))

(declare-fun tp!113664 () Bool)

(declare-fun b_and!51693 () Bool)

(assert (=> start!133862 (= tp!113664 b_and!51693)))

(declare-fun res!1069841 () Bool)

(declare-fun e!872288 () Bool)

(assert (=> start!133862 (=> (not res!1069841) (not e!872288))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133862 (= res!1069841 (validMask!0 mask!947))))

(assert (=> start!133862 e!872288))

(assert (=> start!133862 tp!113664))

(declare-fun tp_is_empty!38897 () Bool)

(assert (=> start!133862 tp_is_empty!38897))

(assert (=> start!133862 true))

(declare-datatypes ((array!104482 0))(
  ( (array!104483 (arr!50430 (Array (_ BitVec 32) (_ BitVec 64))) (size!50980 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104482)

(declare-fun array_inv!39191 (array!104482) Bool)

(assert (=> start!133862 (array_inv!39191 _keys!637)))

(declare-datatypes ((V!60069 0))(
  ( (V!60070 (val!19532 Int)) )
))
(declare-datatypes ((ValueCell!18418 0))(
  ( (ValueCellFull!18418 (v!22286 V!60069)) (EmptyCell!18418) )
))
(declare-datatypes ((array!104484 0))(
  ( (array!104485 (arr!50431 (Array (_ BitVec 32) ValueCell!18418)) (size!50981 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104484)

(declare-fun e!872290 () Bool)

(declare-fun array_inv!39192 (array!104484) Bool)

(assert (=> start!133862 (and (array_inv!39192 _values!487) e!872290)))

(declare-fun b!1564971 () Bool)

(declare-fun e!872289 () Bool)

(assert (=> b!1564971 (= e!872289 tp_is_empty!38897)))

(declare-fun b!1564972 () Bool)

(declare-fun res!1069838 () Bool)

(assert (=> b!1564972 (=> (not res!1069838) (not e!872288))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564972 (= res!1069838 (validKeyInArray!0 (select (arr!50430 _keys!637) from!782)))))

(declare-fun b!1564973 () Bool)

(assert (=> b!1564973 (= e!872288 false)))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60069)

(declare-fun minValue!453 () V!60069)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((tuple2!25198 0))(
  ( (tuple2!25199 (_1!12610 (_ BitVec 64)) (_2!12610 V!60069)) )
))
(declare-datatypes ((List!36587 0))(
  ( (Nil!36584) (Cons!36583 (h!38029 tuple2!25198) (t!51434 List!36587)) )
))
(declare-datatypes ((ListLongMap!22633 0))(
  ( (ListLongMap!22634 (toList!11332 List!36587)) )
))
(declare-fun lt!672125 () ListLongMap!22633)

(declare-fun getCurrentListMapNoExtraKeys!6697 (array!104482 array!104484 (_ BitVec 32) (_ BitVec 32) V!60069 V!60069 (_ BitVec 32) Int) ListLongMap!22633)

(assert (=> b!1564973 (= lt!672125 (getCurrentListMapNoExtraKeys!6697 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564974 () Bool)

(declare-fun e!872287 () Bool)

(declare-fun mapRes!59731 () Bool)

(assert (=> b!1564974 (= e!872290 (and e!872287 mapRes!59731))))

(declare-fun condMapEmpty!59731 () Bool)

(declare-fun mapDefault!59731 () ValueCell!18418)

