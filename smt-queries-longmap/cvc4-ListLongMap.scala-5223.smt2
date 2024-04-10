; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70392 () Bool)

(assert start!70392)

(declare-fun b_free!12749 () Bool)

(declare-fun b_next!12749 () Bool)

(assert (=> start!70392 (= b_free!12749 (not b_next!12749))))

(declare-fun tp!44974 () Bool)

(declare-fun b_and!21561 () Bool)

(assert (=> start!70392 (= tp!44974 b_and!21561)))

(declare-fun b!817719 () Bool)

(declare-fun e!453791 () Bool)

(declare-fun tp_is_empty!14459 () Bool)

(assert (=> b!817719 (= e!453791 tp_is_empty!14459)))

(declare-fun b!817720 () Bool)

(declare-fun res!558141 () Bool)

(declare-fun e!453794 () Bool)

(assert (=> b!817720 (=> (not res!558141) (not e!453794))))

(declare-datatypes ((array!45116 0))(
  ( (array!45117 (arr!21614 (Array (_ BitVec 32) (_ BitVec 64))) (size!22035 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45116)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24279 0))(
  ( (V!24280 (val!7277 Int)) )
))
(declare-datatypes ((ValueCell!6814 0))(
  ( (ValueCellFull!6814 (v!9706 V!24279)) (EmptyCell!6814) )
))
(declare-datatypes ((array!45118 0))(
  ( (array!45119 (arr!21615 (Array (_ BitVec 32) ValueCell!6814)) (size!22036 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45118)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817720 (= res!558141 (and (= (size!22036 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22035 _keys!976) (size!22036 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817721 () Bool)

(declare-fun res!558142 () Bool)

(assert (=> b!817721 (=> (not res!558142) (not e!453794))))

(declare-datatypes ((List!15393 0))(
  ( (Nil!15390) (Cons!15389 (h!16518 (_ BitVec 64)) (t!21718 List!15393)) )
))
(declare-fun arrayNoDuplicates!0 (array!45116 (_ BitVec 32) List!15393) Bool)

(assert (=> b!817721 (= res!558142 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15390))))

(declare-fun res!558140 () Bool)

(assert (=> start!70392 (=> (not res!558140) (not e!453794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70392 (= res!558140 (validMask!0 mask!1312))))

(assert (=> start!70392 e!453794))

(assert (=> start!70392 tp_is_empty!14459))

(declare-fun array_inv!17287 (array!45116) Bool)

(assert (=> start!70392 (array_inv!17287 _keys!976)))

(assert (=> start!70392 true))

(declare-fun e!453795 () Bool)

(declare-fun array_inv!17288 (array!45118) Bool)

(assert (=> start!70392 (and (array_inv!17288 _values!788) e!453795)))

(assert (=> start!70392 tp!44974))

(declare-fun b!817722 () Bool)

(declare-fun mapRes!23281 () Bool)

(assert (=> b!817722 (= e!453795 (and e!453791 mapRes!23281))))

(declare-fun condMapEmpty!23281 () Bool)

(declare-fun mapDefault!23281 () ValueCell!6814)

