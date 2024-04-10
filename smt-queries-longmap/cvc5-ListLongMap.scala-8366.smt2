; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101778 () Bool)

(assert start!101778)

(declare-fun b_free!26467 () Bool)

(declare-fun b_next!26467 () Bool)

(assert (=> start!101778 (= b_free!26467 (not b_next!26467))))

(declare-fun tp!92447 () Bool)

(declare-fun b_and!44195 () Bool)

(assert (=> start!101778 (= tp!92447 b_and!44195)))

(declare-fun b!1225848 () Bool)

(declare-fun res!814671 () Bool)

(declare-fun e!696224 () Bool)

(assert (=> b!1225848 (=> (not res!814671) (not e!696224))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225848 (= res!814671 (validMask!0 mask!1564))))

(declare-fun b!1225849 () Bool)

(declare-fun e!696228 () Bool)

(declare-fun e!696227 () Bool)

(declare-fun mapRes!48655 () Bool)

(assert (=> b!1225849 (= e!696228 (and e!696227 mapRes!48655))))

(declare-fun condMapEmpty!48655 () Bool)

(declare-datatypes ((V!46689 0))(
  ( (V!46690 (val!15642 Int)) )
))
(declare-datatypes ((ValueCell!14876 0))(
  ( (ValueCellFull!14876 (v!18304 V!46689)) (EmptyCell!14876) )
))
(declare-datatypes ((array!79121 0))(
  ( (array!79122 (arr!38187 (Array (_ BitVec 32) ValueCell!14876)) (size!38723 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79121)

(declare-fun mapDefault!48655 () ValueCell!14876)

