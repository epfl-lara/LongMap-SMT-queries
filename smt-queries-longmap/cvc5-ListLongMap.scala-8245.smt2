; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100418 () Bool)

(assert start!100418)

(declare-fun b_free!25741 () Bool)

(declare-fun b_next!25741 () Bool)

(assert (=> start!100418 (= b_free!25741 (not b_next!25741))))

(declare-fun tp!90212 () Bool)

(declare-fun b_and!42369 () Bool)

(assert (=> start!100418 (= tp!90212 b_and!42369)))

(declare-fun b!1198704 () Bool)

(declare-fun e!680898 () Bool)

(declare-fun e!680895 () Bool)

(declare-fun mapRes!47510 () Bool)

(assert (=> b!1198704 (= e!680898 (and e!680895 mapRes!47510))))

(declare-fun condMapEmpty!47510 () Bool)

(declare-datatypes ((V!45721 0))(
  ( (V!45722 (val!15279 Int)) )
))
(declare-datatypes ((ValueCell!14513 0))(
  ( (ValueCellFull!14513 (v!17917 V!45721)) (EmptyCell!14513) )
))
(declare-datatypes ((array!77669 0))(
  ( (array!77670 (arr!37479 (Array (_ BitVec 32) ValueCell!14513)) (size!38015 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77669)

(declare-fun mapDefault!47510 () ValueCell!14513)

