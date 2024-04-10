; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99068 () Bool)

(assert start!99068)

(declare-fun b_free!24673 () Bool)

(declare-fun b_next!24673 () Bool)

(assert (=> start!99068 (= b_free!24673 (not b_next!24673))))

(declare-fun tp!86730 () Bool)

(declare-fun b_and!40195 () Bool)

(assert (=> start!99068 (= tp!86730 b_and!40195)))

(declare-fun b!1164930 () Bool)

(declare-fun res!772552 () Bool)

(declare-fun e!662298 () Bool)

(assert (=> b!1164930 (=> (not res!772552) (not e!662298))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164930 (= res!772552 (validKeyInArray!0 k!934))))

(declare-fun b!1164931 () Bool)

(declare-fun e!662295 () Bool)

(declare-fun tp_is_empty!29203 () Bool)

(assert (=> b!1164931 (= e!662295 tp_is_empty!29203)))

(declare-fun b!1164932 () Bool)

(declare-fun e!662296 () Bool)

(assert (=> b!1164932 (= e!662296 tp_is_empty!29203)))

(declare-fun b!1164933 () Bool)

(declare-fun res!772554 () Bool)

(assert (=> b!1164933 (=> (not res!772554) (not e!662298))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75237 0))(
  ( (array!75238 (arr!36269 (Array (_ BitVec 32) (_ BitVec 64))) (size!36805 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75237)

(assert (=> b!1164933 (= res!772554 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36805 _keys!1208))))))

(declare-fun b!1164934 () Bool)

(declare-fun e!662300 () Bool)

(declare-fun mapRes!45629 () Bool)

(assert (=> b!1164934 (= e!662300 (and e!662296 mapRes!45629))))

(declare-fun condMapEmpty!45629 () Bool)

(declare-datatypes ((V!44065 0))(
  ( (V!44066 (val!14658 Int)) )
))
(declare-datatypes ((ValueCell!13892 0))(
  ( (ValueCellFull!13892 (v!17295 V!44065)) (EmptyCell!13892) )
))
(declare-datatypes ((array!75239 0))(
  ( (array!75240 (arr!36270 (Array (_ BitVec 32) ValueCell!13892)) (size!36806 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75239)

(declare-fun mapDefault!45629 () ValueCell!13892)

