; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95066 () Bool)

(assert start!95066)

(declare-fun b_free!22183 () Bool)

(declare-fun b_next!22183 () Bool)

(assert (=> start!95066 (= b_free!22183 (not b_next!22183))))

(declare-fun tp!78029 () Bool)

(declare-fun b_and!35091 () Bool)

(assert (=> start!95066 (= tp!78029 b_and!35091)))

(declare-fun b!1074704 () Bool)

(declare-fun e!614120 () Bool)

(declare-fun e!614122 () Bool)

(declare-fun mapRes!40717 () Bool)

(assert (=> b!1074704 (= e!614120 (and e!614122 mapRes!40717))))

(declare-fun condMapEmpty!40717 () Bool)

(declare-datatypes ((V!39793 0))(
  ( (V!39794 (val!13047 Int)) )
))
(declare-datatypes ((ValueCell!12293 0))(
  ( (ValueCellFull!12293 (v!15669 V!39793)) (EmptyCell!12293) )
))
(declare-datatypes ((array!68955 0))(
  ( (array!68956 (arr!33166 (Array (_ BitVec 32) ValueCell!12293)) (size!33702 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68955)

(declare-fun mapDefault!40717 () ValueCell!12293)

