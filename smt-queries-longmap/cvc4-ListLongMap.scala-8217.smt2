; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100214 () Bool)

(assert start!100214)

(declare-fun mapIsEmpty!47258 () Bool)

(declare-fun mapRes!47258 () Bool)

(assert (=> mapIsEmpty!47258 mapRes!47258))

(declare-fun b!1195047 () Bool)

(declare-fun e!679125 () Bool)

(declare-fun tp_is_empty!30281 () Bool)

(assert (=> b!1195047 (= e!679125 tp_is_empty!30281)))

(declare-fun mapNonEmpty!47258 () Bool)

(declare-fun tp!89868 () Bool)

(declare-fun e!679129 () Bool)

(assert (=> mapNonEmpty!47258 (= mapRes!47258 (and tp!89868 e!679129))))

(declare-fun mapKey!47258 () (_ BitVec 32))

(declare-datatypes ((V!45501 0))(
  ( (V!45502 (val!15197 Int)) )
))
(declare-datatypes ((ValueCell!14431 0))(
  ( (ValueCellFull!14431 (v!17835 V!45501)) (EmptyCell!14431) )
))
(declare-datatypes ((array!77343 0))(
  ( (array!77344 (arr!37318 (Array (_ BitVec 32) ValueCell!14431)) (size!37854 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77343)

(declare-fun mapRest!47258 () (Array (_ BitVec 32) ValueCell!14431))

(declare-fun mapValue!47258 () ValueCell!14431)

(assert (=> mapNonEmpty!47258 (= (arr!37318 _values!996) (store mapRest!47258 mapKey!47258 mapValue!47258))))

(declare-fun b!1195048 () Bool)

(declare-fun res!795160 () Bool)

(declare-fun e!679127 () Bool)

(assert (=> b!1195048 (=> (not res!795160) (not e!679127))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195048 (= res!795160 (validKeyInArray!0 k!934))))

(declare-fun b!1195049 () Bool)

(declare-fun e!679128 () Bool)

(assert (=> b!1195049 (= e!679128 (not true))))

(declare-datatypes ((array!77345 0))(
  ( (array!77346 (arr!37319 (Array (_ BitVec 32) (_ BitVec 64))) (size!37855 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77345)

(declare-fun arrayContainsKey!0 (array!77345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195049 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39616 0))(
  ( (Unit!39617) )
))
(declare-fun lt!542868 () Unit!39616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77345 (_ BitVec 64) (_ BitVec 32)) Unit!39616)

(assert (=> b!1195049 (= lt!542868 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195050 () Bool)

(declare-fun res!795166 () Bool)

(assert (=> b!1195050 (=> (not res!795166) (not e!679127))))

(assert (=> b!1195050 (= res!795166 (= (select (arr!37319 _keys!1208) i!673) k!934))))

(declare-fun b!1195051 () Bool)

(declare-fun res!795165 () Bool)

(assert (=> b!1195051 (=> (not res!795165) (not e!679127))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1195051 (= res!795165 (and (= (size!37854 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37855 _keys!1208) (size!37854 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195052 () Bool)

(declare-fun res!795157 () Bool)

(assert (=> b!1195052 (=> (not res!795157) (not e!679127))))

(assert (=> b!1195052 (= res!795157 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37855 _keys!1208))))))

(declare-fun b!1195053 () Bool)

(declare-fun e!679126 () Bool)

(assert (=> b!1195053 (= e!679126 (and e!679125 mapRes!47258))))

(declare-fun condMapEmpty!47258 () Bool)

(declare-fun mapDefault!47258 () ValueCell!14431)

