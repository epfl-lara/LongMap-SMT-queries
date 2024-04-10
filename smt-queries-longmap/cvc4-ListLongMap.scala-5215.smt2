; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70344 () Bool)

(assert start!70344)

(declare-fun b_free!12701 () Bool)

(declare-fun b_next!12701 () Bool)

(assert (=> start!70344 (= b_free!12701 (not b_next!12701))))

(declare-fun tp!44829 () Bool)

(declare-fun b_and!21513 () Bool)

(assert (=> start!70344 (= tp!44829 b_and!21513)))

(declare-fun mapNonEmpty!23209 () Bool)

(declare-fun mapRes!23209 () Bool)

(declare-fun tp!44830 () Bool)

(declare-fun e!453431 () Bool)

(assert (=> mapNonEmpty!23209 (= mapRes!23209 (and tp!44830 e!453431))))

(declare-datatypes ((V!24215 0))(
  ( (V!24216 (val!7253 Int)) )
))
(declare-datatypes ((ValueCell!6790 0))(
  ( (ValueCellFull!6790 (v!9682 V!24215)) (EmptyCell!6790) )
))
(declare-fun mapRest!23209 () (Array (_ BitVec 32) ValueCell!6790))

(declare-datatypes ((array!45022 0))(
  ( (array!45023 (arr!21567 (Array (_ BitVec 32) ValueCell!6790)) (size!21988 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45022)

(declare-fun mapKey!23209 () (_ BitVec 32))

(declare-fun mapValue!23209 () ValueCell!6790)

(assert (=> mapNonEmpty!23209 (= (arr!21567 _values!788) (store mapRest!23209 mapKey!23209 mapValue!23209))))

(declare-fun b!817215 () Bool)

(declare-fun e!453434 () Bool)

(declare-fun tp_is_empty!14411 () Bool)

(assert (=> b!817215 (= e!453434 tp_is_empty!14411)))

(declare-fun b!817216 () Bool)

(declare-fun res!557852 () Bool)

(declare-fun e!453433 () Bool)

(assert (=> b!817216 (=> (not res!557852) (not e!453433))))

(declare-datatypes ((array!45024 0))(
  ( (array!45025 (arr!21568 (Array (_ BitVec 32) (_ BitVec 64))) (size!21989 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45024)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817216 (= res!557852 (and (= (size!21988 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21989 _keys!976) (size!21988 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817217 () Bool)

(declare-fun res!557854 () Bool)

(assert (=> b!817217 (=> (not res!557854) (not e!453433))))

(declare-datatypes ((List!15362 0))(
  ( (Nil!15359) (Cons!15358 (h!16487 (_ BitVec 64)) (t!21687 List!15362)) )
))
(declare-fun arrayNoDuplicates!0 (array!45024 (_ BitVec 32) List!15362) Bool)

(assert (=> b!817217 (= res!557854 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15359))))

(declare-fun b!817218 () Bool)

(declare-fun e!453432 () Bool)

(assert (=> b!817218 (= e!453432 (and e!453434 mapRes!23209))))

(declare-fun condMapEmpty!23209 () Bool)

(declare-fun mapDefault!23209 () ValueCell!6790)

