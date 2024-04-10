; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70370 () Bool)

(assert start!70370)

(declare-fun b_free!12727 () Bool)

(declare-fun b_next!12727 () Bool)

(assert (=> start!70370 (= b_free!12727 (not b_next!12727))))

(declare-fun tp!44907 () Bool)

(declare-fun b_and!21539 () Bool)

(assert (=> start!70370 (= tp!44907 b_and!21539)))

(declare-fun mapIsEmpty!23248 () Bool)

(declare-fun mapRes!23248 () Bool)

(assert (=> mapIsEmpty!23248 mapRes!23248))

(declare-fun b!817488 () Bool)

(declare-fun res!558009 () Bool)

(declare-fun e!453630 () Bool)

(assert (=> b!817488 (=> (not res!558009) (not e!453630))))

(declare-datatypes ((array!45074 0))(
  ( (array!45075 (arr!21593 (Array (_ BitVec 32) (_ BitVec 64))) (size!22014 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45074)

(declare-datatypes ((List!15379 0))(
  ( (Nil!15376) (Cons!15375 (h!16504 (_ BitVec 64)) (t!21704 List!15379)) )
))
(declare-fun arrayNoDuplicates!0 (array!45074 (_ BitVec 32) List!15379) Bool)

(assert (=> b!817488 (= res!558009 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15376))))

(declare-fun b!817489 () Bool)

(declare-fun e!453628 () Bool)

(declare-fun tp_is_empty!14437 () Bool)

(assert (=> b!817489 (= e!453628 tp_is_empty!14437)))

(declare-fun b!817490 () Bool)

(declare-fun res!558008 () Bool)

(assert (=> b!817490 (=> (not res!558008) (not e!453630))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24251 0))(
  ( (V!24252 (val!7266 Int)) )
))
(declare-datatypes ((ValueCell!6803 0))(
  ( (ValueCellFull!6803 (v!9695 V!24251)) (EmptyCell!6803) )
))
(declare-datatypes ((array!45076 0))(
  ( (array!45077 (arr!21594 (Array (_ BitVec 32) ValueCell!6803)) (size!22015 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45076)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817490 (= res!558008 (and (= (size!22015 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22014 _keys!976) (size!22015 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817491 () Bool)

(declare-fun e!453626 () Bool)

(declare-fun e!453629 () Bool)

(assert (=> b!817491 (= e!453626 (and e!453629 mapRes!23248))))

(declare-fun condMapEmpty!23248 () Bool)

(declare-fun mapDefault!23248 () ValueCell!6803)

