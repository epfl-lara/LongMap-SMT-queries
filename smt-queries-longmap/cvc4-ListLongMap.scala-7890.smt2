; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98088 () Bool)

(assert start!98088)

(declare-fun b_free!23789 () Bool)

(declare-fun b_next!23789 () Bool)

(assert (=> start!98088 (= b_free!23789 (not b_next!23789))))

(declare-fun tp!84071 () Bool)

(declare-fun b_and!38361 () Bool)

(assert (=> start!98088 (= tp!84071 b_and!38361)))

(declare-fun mapNonEmpty!44296 () Bool)

(declare-fun mapRes!44296 () Bool)

(declare-fun tp!84070 () Bool)

(declare-fun e!641304 () Bool)

(assert (=> mapNonEmpty!44296 (= mapRes!44296 (and tp!84070 e!641304))))

(declare-fun mapKey!44296 () (_ BitVec 32))

(declare-datatypes ((V!42885 0))(
  ( (V!42886 (val!14216 Int)) )
))
(declare-datatypes ((ValueCell!13450 0))(
  ( (ValueCellFull!13450 (v!16849 V!42885)) (EmptyCell!13450) )
))
(declare-datatypes ((array!73501 0))(
  ( (array!73502 (arr!35403 (Array (_ BitVec 32) ValueCell!13450)) (size!35939 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73501)

(declare-fun mapRest!44296 () (Array (_ BitVec 32) ValueCell!13450))

(declare-fun mapValue!44296 () ValueCell!13450)

(assert (=> mapNonEmpty!44296 (= (arr!35403 _values!996) (store mapRest!44296 mapKey!44296 mapValue!44296))))

(declare-fun b!1126682 () Bool)

(declare-fun tp_is_empty!28319 () Bool)

(assert (=> b!1126682 (= e!641304 tp_is_empty!28319)))

(declare-fun b!1126683 () Bool)

(declare-fun res!752897 () Bool)

(declare-fun e!641307 () Bool)

(assert (=> b!1126683 (=> (not res!752897) (not e!641307))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126683 (= res!752897 (validKeyInArray!0 k!934))))

(declare-fun b!1126685 () Bool)

(declare-fun e!641305 () Bool)

(declare-fun e!641303 () Bool)

(assert (=> b!1126685 (= e!641305 (and e!641303 mapRes!44296))))

(declare-fun condMapEmpty!44296 () Bool)

(declare-fun mapDefault!44296 () ValueCell!13450)

