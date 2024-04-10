; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69940 () Bool)

(assert start!69940)

(declare-fun b_free!12373 () Bool)

(declare-fun b_next!12373 () Bool)

(assert (=> start!69940 (= b_free!12373 (not b_next!12373))))

(declare-fun tp!43831 () Bool)

(declare-fun b_and!21141 () Bool)

(assert (=> start!69940 (= tp!43831 b_and!21141)))

(declare-fun b!812998 () Bool)

(declare-fun res!555471 () Bool)

(declare-fun e!450434 () Bool)

(assert (=> b!812998 (=> (not res!555471) (not e!450434))))

(declare-datatypes ((array!44382 0))(
  ( (array!44383 (arr!21252 (Array (_ BitVec 32) (_ BitVec 64))) (size!21673 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44382)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23779 0))(
  ( (V!23780 (val!7089 Int)) )
))
(declare-datatypes ((ValueCell!6626 0))(
  ( (ValueCellFull!6626 (v!9516 V!23779)) (EmptyCell!6626) )
))
(declare-datatypes ((array!44384 0))(
  ( (array!44385 (arr!21253 (Array (_ BitVec 32) ValueCell!6626)) (size!21674 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44384)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812998 (= res!555471 (and (= (size!21674 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21673 _keys!976) (size!21674 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812999 () Bool)

(declare-fun e!450433 () Bool)

(declare-fun tp_is_empty!14083 () Bool)

(assert (=> b!812999 (= e!450433 tp_is_empty!14083)))

(declare-fun b!813000 () Bool)

(declare-fun e!450432 () Bool)

(declare-fun e!450431 () Bool)

(declare-fun mapRes!22702 () Bool)

(assert (=> b!813000 (= e!450432 (and e!450431 mapRes!22702))))

(declare-fun condMapEmpty!22702 () Bool)

(declare-fun mapDefault!22702 () ValueCell!6626)

