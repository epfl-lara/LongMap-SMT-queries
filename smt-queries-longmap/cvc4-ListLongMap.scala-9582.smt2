; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113358 () Bool)

(assert start!113358)

(declare-fun b_free!31409 () Bool)

(declare-fun b_next!31409 () Bool)

(assert (=> start!113358 (= b_free!31409 (not b_next!31409))))

(declare-fun tp!110032 () Bool)

(declare-fun b_and!50671 () Bool)

(assert (=> start!113358 (= tp!110032 b_and!50671)))

(declare-fun b!1345402 () Bool)

(declare-fun e!765592 () Bool)

(declare-fun tp_is_empty!37409 () Bool)

(assert (=> b!1345402 (= e!765592 tp_is_empty!37409)))

(declare-fun b!1345403 () Bool)

(declare-fun e!765588 () Bool)

(declare-fun e!765593 () Bool)

(assert (=> b!1345403 (= e!765588 e!765593)))

(declare-fun res!892715 () Bool)

(assert (=> b!1345403 (=> (not res!892715) (not e!765593))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91658 0))(
  ( (array!91659 (arr!44285 (Array (_ BitVec 32) (_ BitVec 64))) (size!44835 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91658)

(declare-datatypes ((V!54981 0))(
  ( (V!54982 (val!18779 Int)) )
))
(declare-datatypes ((tuple2!24208 0))(
  ( (tuple2!24209 (_1!12115 (_ BitVec 64)) (_2!12115 V!54981)) )
))
(declare-datatypes ((List!31364 0))(
  ( (Nil!31361) (Cons!31360 (h!32569 tuple2!24208) (t!45930 List!31364)) )
))
(declare-datatypes ((ListLongMap!21865 0))(
  ( (ListLongMap!21866 (toList!10948 List!31364)) )
))
(declare-fun lt!595344 () ListLongMap!21865)

(declare-fun lt!595343 () V!54981)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun contains!9124 (ListLongMap!21865 (_ BitVec 64)) Bool)

(declare-fun +!4829 (ListLongMap!21865 tuple2!24208) ListLongMap!21865)

(assert (=> b!1345403 (= res!892715 (contains!9124 (+!4829 lt!595344 (tuple2!24209 (select (arr!44285 _keys!1571) from!1960) lt!595343)) k!1142))))

(declare-fun minValue!1245 () V!54981)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54981)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17806 0))(
  ( (ValueCellFull!17806 (v!21427 V!54981)) (EmptyCell!17806) )
))
(declare-datatypes ((array!91660 0))(
  ( (array!91661 (arr!44286 (Array (_ BitVec 32) ValueCell!17806)) (size!44836 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91660)

(declare-fun getCurrentListMapNoExtraKeys!6471 (array!91658 array!91660 (_ BitVec 32) (_ BitVec 32) V!54981 V!54981 (_ BitVec 32) Int) ListLongMap!21865)

(assert (=> b!1345403 (= lt!595344 (getCurrentListMapNoExtraKeys!6471 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22370 (ValueCell!17806 V!54981) V!54981)

(declare-fun dynLambda!3768 (Int (_ BitVec 64)) V!54981)

(assert (=> b!1345403 (= lt!595343 (get!22370 (select (arr!44286 _values!1303) from!1960) (dynLambda!3768 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345404 () Bool)

(declare-fun res!892717 () Bool)

(assert (=> b!1345404 (=> (not res!892717) (not e!765588))))

(assert (=> b!1345404 (= res!892717 (not (= (select (arr!44285 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1345405 () Bool)

(declare-fun e!765591 () Bool)

(declare-fun mapRes!57820 () Bool)

(assert (=> b!1345405 (= e!765591 (and e!765592 mapRes!57820))))

(declare-fun condMapEmpty!57820 () Bool)

(declare-fun mapDefault!57820 () ValueCell!17806)

