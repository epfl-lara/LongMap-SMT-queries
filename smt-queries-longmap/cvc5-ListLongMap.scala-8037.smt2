; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99062 () Bool)

(assert start!99062)

(declare-fun b_free!24667 () Bool)

(declare-fun b_next!24667 () Bool)

(assert (=> start!99062 (= b_free!24667 (not b_next!24667))))

(declare-fun tp!86711 () Bool)

(declare-fun b_and!40183 () Bool)

(assert (=> start!99062 (= tp!86711 b_and!40183)))

(declare-fun mapIsEmpty!45620 () Bool)

(declare-fun mapRes!45620 () Bool)

(assert (=> mapIsEmpty!45620 mapRes!45620))

(declare-fun b!1164798 () Bool)

(declare-fun res!772450 () Bool)

(declare-fun e!662238 () Bool)

(assert (=> b!1164798 (=> (not res!772450) (not e!662238))))

(declare-datatypes ((array!75225 0))(
  ( (array!75226 (arr!36263 (Array (_ BitVec 32) (_ BitVec 64))) (size!36799 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75225)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75225 (_ BitVec 32)) Bool)

(assert (=> b!1164798 (= res!772450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164799 () Bool)

(declare-fun res!772452 () Bool)

(assert (=> b!1164799 (=> (not res!772452) (not e!662238))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164799 (= res!772452 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36799 _keys!1208))))))

(declare-fun b!1164800 () Bool)

(declare-fun e!662235 () Bool)

(declare-fun e!662232 () Bool)

(assert (=> b!1164800 (= e!662235 (and e!662232 mapRes!45620))))

(declare-fun condMapEmpty!45620 () Bool)

(declare-datatypes ((V!44057 0))(
  ( (V!44058 (val!14655 Int)) )
))
(declare-datatypes ((ValueCell!13889 0))(
  ( (ValueCellFull!13889 (v!17292 V!44057)) (EmptyCell!13889) )
))
(declare-datatypes ((array!75227 0))(
  ( (array!75228 (arr!36264 (Array (_ BitVec 32) ValueCell!13889)) (size!36800 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75227)

(declare-fun mapDefault!45620 () ValueCell!13889)

