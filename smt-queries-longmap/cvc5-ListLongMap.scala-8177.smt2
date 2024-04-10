; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99928 () Bool)

(assert start!99928)

(declare-fun b_free!25507 () Bool)

(declare-fun b_next!25507 () Bool)

(assert (=> start!99928 (= b_free!25507 (not b_next!25507))))

(declare-fun tp!89235 () Bool)

(declare-fun b_and!41881 () Bool)

(assert (=> start!99928 (= tp!89235 b_and!41881)))

(declare-fun b!1189588 () Bool)

(declare-fun e!676326 () Bool)

(declare-fun e!676327 () Bool)

(declare-fun mapRes!46883 () Bool)

(assert (=> b!1189588 (= e!676326 (and e!676327 mapRes!46883))))

(declare-fun condMapEmpty!46883 () Bool)

(declare-datatypes ((V!45177 0))(
  ( (V!45178 (val!15075 Int)) )
))
(declare-datatypes ((ValueCell!14309 0))(
  ( (ValueCellFull!14309 (v!17713 V!45177)) (EmptyCell!14309) )
))
(declare-datatypes ((array!76869 0))(
  ( (array!76870 (arr!37084 (Array (_ BitVec 32) ValueCell!14309)) (size!37620 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76869)

(declare-fun mapDefault!46883 () ValueCell!14309)

