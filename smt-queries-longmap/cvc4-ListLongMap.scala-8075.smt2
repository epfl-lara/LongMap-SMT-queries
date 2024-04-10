; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99320 () Bool)

(assert start!99320)

(declare-fun b_free!24899 () Bool)

(declare-fun b_next!24899 () Bool)

(assert (=> start!99320 (= b_free!24899 (not b_next!24899))))

(declare-fun tp!87410 () Bool)

(declare-fun b_and!40665 () Bool)

(assert (=> start!99320 (= tp!87410 b_and!40665)))

(declare-fun b!1170661 () Bool)

(declare-fun e!665388 () Bool)

(declare-fun e!665387 () Bool)

(assert (=> b!1170661 (= e!665388 e!665387)))

(declare-fun res!776966 () Bool)

(assert (=> b!1170661 (=> (not res!776966) (not e!665387))))

(declare-datatypes ((array!75677 0))(
  ( (array!75678 (arr!36488 (Array (_ BitVec 32) (_ BitVec 64))) (size!37024 (_ BitVec 32))) )
))
(declare-fun lt!527263 () array!75677)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75677 (_ BitVec 32)) Bool)

(assert (=> b!1170661 (= res!776966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527263 mask!1564))))

(declare-fun _keys!1208 () array!75677)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170661 (= lt!527263 (array!75678 (store (arr!36488 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37024 _keys!1208)))))

(declare-fun mapIsEmpty!45971 () Bool)

(declare-fun mapRes!45971 () Bool)

(assert (=> mapIsEmpty!45971 mapRes!45971))

(declare-fun b!1170662 () Bool)

(declare-fun e!665385 () Bool)

(declare-fun tp_is_empty!29429 () Bool)

(assert (=> b!1170662 (= e!665385 tp_is_empty!29429)))

(declare-fun b!1170663 () Bool)

(declare-fun e!665382 () Bool)

(assert (=> b!1170663 (= e!665382 (and e!665385 mapRes!45971))))

(declare-fun condMapEmpty!45971 () Bool)

(declare-datatypes ((V!44365 0))(
  ( (V!44366 (val!14771 Int)) )
))
(declare-datatypes ((ValueCell!14005 0))(
  ( (ValueCellFull!14005 (v!17409 V!44365)) (EmptyCell!14005) )
))
(declare-datatypes ((array!75679 0))(
  ( (array!75680 (arr!36489 (Array (_ BitVec 32) ValueCell!14005)) (size!37025 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75679)

(declare-fun mapDefault!45971 () ValueCell!14005)

