; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70426 () Bool)

(assert start!70426)

(declare-fun b_free!12769 () Bool)

(declare-fun b_next!12769 () Bool)

(assert (=> start!70426 (= b_free!12769 (not b_next!12769))))

(declare-fun tp!45036 () Bool)

(declare-fun b_and!21589 () Bool)

(assert (=> start!70426 (= tp!45036 b_and!21589)))

(declare-fun b!818043 () Bool)

(declare-fun res!558322 () Bool)

(declare-fun e!454029 () Bool)

(assert (=> b!818043 (=> (not res!558322) (not e!454029))))

(declare-datatypes ((array!45158 0))(
  ( (array!45159 (arr!21634 (Array (_ BitVec 32) (_ BitVec 64))) (size!22055 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45158)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24307 0))(
  ( (V!24308 (val!7287 Int)) )
))
(declare-datatypes ((ValueCell!6824 0))(
  ( (ValueCellFull!6824 (v!9716 V!24307)) (EmptyCell!6824) )
))
(declare-datatypes ((array!45160 0))(
  ( (array!45161 (arr!21635 (Array (_ BitVec 32) ValueCell!6824)) (size!22056 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45160)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818043 (= res!558322 (and (= (size!22056 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22055 _keys!976) (size!22056 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818044 () Bool)

(declare-fun e!454027 () Bool)

(declare-fun e!454025 () Bool)

(declare-fun mapRes!23314 () Bool)

(assert (=> b!818044 (= e!454027 (and e!454025 mapRes!23314))))

(declare-fun condMapEmpty!23314 () Bool)

(declare-fun mapDefault!23314 () ValueCell!6824)

