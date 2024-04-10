; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98552 () Bool)

(assert start!98552)

(declare-fun b_free!24157 () Bool)

(declare-fun b_next!24157 () Bool)

(assert (=> start!98552 (= b_free!24157 (not b_next!24157))))

(declare-fun tp!85181 () Bool)

(declare-fun b_and!39163 () Bool)

(assert (=> start!98552 (= tp!85181 b_and!39163)))

(declare-datatypes ((array!74227 0))(
  ( (array!74228 (arr!35764 (Array (_ BitVec 32) (_ BitVec 64))) (size!36300 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74227)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!649852 () Bool)

(declare-fun b!1142295 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142295 (= e!649852 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142296 () Bool)

(declare-fun e!649859 () Bool)

(declare-datatypes ((V!43377 0))(
  ( (V!43378 (val!14400 Int)) )
))
(declare-datatypes ((tuple2!18220 0))(
  ( (tuple2!18221 (_1!9121 (_ BitVec 64)) (_2!9121 V!43377)) )
))
(declare-datatypes ((List!24975 0))(
  ( (Nil!24972) (Cons!24971 (h!26180 tuple2!18220) (t!36124 List!24975)) )
))
(declare-datatypes ((ListLongMap!16189 0))(
  ( (ListLongMap!16190 (toList!8110 List!24975)) )
))
(declare-fun call!51427 () ListLongMap!16189)

(declare-fun call!51432 () ListLongMap!16189)

(assert (=> b!1142296 (= e!649859 (= call!51427 call!51432))))

(declare-fun b!1142297 () Bool)

(declare-fun e!649863 () Bool)

(declare-fun e!649848 () Bool)

(declare-fun mapRes!44855 () Bool)

(assert (=> b!1142297 (= e!649863 (and e!649848 mapRes!44855))))

(declare-fun condMapEmpty!44855 () Bool)

(declare-datatypes ((ValueCell!13634 0))(
  ( (ValueCellFull!13634 (v!17037 V!43377)) (EmptyCell!13634) )
))
(declare-datatypes ((array!74229 0))(
  ( (array!74230 (arr!35765 (Array (_ BitVec 32) ValueCell!13634)) (size!36301 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74229)

(declare-fun mapDefault!44855 () ValueCell!13634)

