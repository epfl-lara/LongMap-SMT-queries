; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98918 () Bool)

(assert start!98918)

(declare-fun b_free!24523 () Bool)

(declare-fun b_next!24523 () Bool)

(assert (=> start!98918 (= b_free!24523 (not b_next!24523))))

(declare-fun tp!86279 () Bool)

(declare-fun b_and!39895 () Bool)

(assert (=> start!98918 (= tp!86279 b_and!39895)))

(declare-datatypes ((array!74947 0))(
  ( (array!74948 (arr!36124 (Array (_ BitVec 32) (_ BitVec 64))) (size!36660 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74947)

(declare-fun e!659134 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1159070 () Bool)

(declare-fun arrayContainsKey!0 (array!74947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159070 (= e!659134 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159071 () Bool)

(declare-fun e!659135 () Bool)

(declare-fun e!659128 () Bool)

(declare-fun mapRes!45404 () Bool)

(assert (=> b!1159071 (= e!659135 (and e!659128 mapRes!45404))))

(declare-fun condMapEmpty!45404 () Bool)

(declare-datatypes ((V!43865 0))(
  ( (V!43866 (val!14583 Int)) )
))
(declare-datatypes ((ValueCell!13817 0))(
  ( (ValueCellFull!13817 (v!17220 V!43865)) (EmptyCell!13817) )
))
(declare-datatypes ((array!74949 0))(
  ( (array!74950 (arr!36125 (Array (_ BitVec 32) ValueCell!13817)) (size!36661 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74949)

(declare-fun mapDefault!45404 () ValueCell!13817)

