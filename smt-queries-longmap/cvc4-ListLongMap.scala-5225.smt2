; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70418 () Bool)

(assert start!70418)

(declare-fun b_free!12761 () Bool)

(declare-fun b_next!12761 () Bool)

(assert (=> start!70418 (= b_free!12761 (not b_next!12761))))

(declare-fun tp!45012 () Bool)

(declare-fun b_and!21581 () Bool)

(assert (=> start!70418 (= tp!45012 b_and!21581)))

(declare-fun mapIsEmpty!23302 () Bool)

(declare-fun mapRes!23302 () Bool)

(assert (=> mapIsEmpty!23302 mapRes!23302))

(declare-fun b!817948 () Bool)

(declare-fun res!558262 () Bool)

(declare-fun e!453957 () Bool)

(assert (=> b!817948 (=> (not res!558262) (not e!453957))))

(declare-datatypes ((array!45142 0))(
  ( (array!45143 (arr!21626 (Array (_ BitVec 32) (_ BitVec 64))) (size!22047 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45142)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24295 0))(
  ( (V!24296 (val!7283 Int)) )
))
(declare-datatypes ((ValueCell!6820 0))(
  ( (ValueCellFull!6820 (v!9712 V!24295)) (EmptyCell!6820) )
))
(declare-datatypes ((array!45144 0))(
  ( (array!45145 (arr!21627 (Array (_ BitVec 32) ValueCell!6820)) (size!22048 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45144)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817948 (= res!558262 (and (= (size!22048 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22047 _keys!976) (size!22048 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817949 () Bool)

(declare-fun e!453953 () Bool)

(declare-fun e!453956 () Bool)

(assert (=> b!817949 (= e!453953 (and e!453956 mapRes!23302))))

(declare-fun condMapEmpty!23302 () Bool)

(declare-fun mapDefault!23302 () ValueCell!6820)

