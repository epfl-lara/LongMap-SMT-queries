; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99934 () Bool)

(assert start!99934)

(declare-fun b_free!25513 () Bool)

(declare-fun b_next!25513 () Bool)

(assert (=> start!99934 (= b_free!25513 (not b_next!25513))))

(declare-fun tp!89253 () Bool)

(declare-fun b_and!41893 () Bool)

(assert (=> start!99934 (= tp!89253 b_and!41893)))

(declare-fun b!1189729 () Bool)

(declare-fun e!676397 () Bool)

(declare-fun e!676399 () Bool)

(declare-fun mapRes!46892 () Bool)

(assert (=> b!1189729 (= e!676397 (and e!676399 mapRes!46892))))

(declare-fun condMapEmpty!46892 () Bool)

(declare-datatypes ((V!45185 0))(
  ( (V!45186 (val!15078 Int)) )
))
(declare-datatypes ((ValueCell!14312 0))(
  ( (ValueCellFull!14312 (v!17716 V!45185)) (EmptyCell!14312) )
))
(declare-datatypes ((array!76879 0))(
  ( (array!76880 (arr!37089 (Array (_ BitVec 32) ValueCell!14312)) (size!37625 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76879)

(declare-fun mapDefault!46892 () ValueCell!14312)

