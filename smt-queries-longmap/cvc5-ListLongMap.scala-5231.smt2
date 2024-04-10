; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70450 () Bool)

(assert start!70450)

(declare-fun b_free!12793 () Bool)

(declare-fun b_next!12793 () Bool)

(assert (=> start!70450 (= b_free!12793 (not b_next!12793))))

(declare-fun tp!45108 () Bool)

(declare-fun b_and!21613 () Bool)

(assert (=> start!70450 (= tp!45108 b_and!21613)))

(declare-fun b!818331 () Bool)

(declare-fun e!454242 () Bool)

(declare-fun tp_is_empty!14503 () Bool)

(assert (=> b!818331 (= e!454242 tp_is_empty!14503)))

(declare-fun b!818332 () Bool)

(declare-fun res!558503 () Bool)

(declare-fun e!454245 () Bool)

(assert (=> b!818332 (=> (not res!558503) (not e!454245))))

(declare-datatypes ((array!45206 0))(
  ( (array!45207 (arr!21658 (Array (_ BitVec 32) (_ BitVec 64))) (size!22079 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45206)

(declare-datatypes ((List!15427 0))(
  ( (Nil!15424) (Cons!15423 (h!16552 (_ BitVec 64)) (t!21754 List!15427)) )
))
(declare-fun arrayNoDuplicates!0 (array!45206 (_ BitVec 32) List!15427) Bool)

(assert (=> b!818332 (= res!558503 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15424))))

(declare-fun mapNonEmpty!23350 () Bool)

(declare-fun mapRes!23350 () Bool)

(declare-fun tp!45109 () Bool)

(assert (=> mapNonEmpty!23350 (= mapRes!23350 (and tp!45109 e!454242))))

(declare-datatypes ((V!24339 0))(
  ( (V!24340 (val!7299 Int)) )
))
(declare-datatypes ((ValueCell!6836 0))(
  ( (ValueCellFull!6836 (v!9728 V!24339)) (EmptyCell!6836) )
))
(declare-fun mapRest!23350 () (Array (_ BitVec 32) ValueCell!6836))

(declare-fun mapKey!23350 () (_ BitVec 32))

(declare-datatypes ((array!45208 0))(
  ( (array!45209 (arr!21659 (Array (_ BitVec 32) ValueCell!6836)) (size!22080 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45208)

(declare-fun mapValue!23350 () ValueCell!6836)

(assert (=> mapNonEmpty!23350 (= (arr!21659 _values!788) (store mapRest!23350 mapKey!23350 mapValue!23350))))

(declare-fun mapIsEmpty!23350 () Bool)

(assert (=> mapIsEmpty!23350 mapRes!23350))

(declare-fun b!818333 () Bool)

(declare-fun res!558499 () Bool)

(assert (=> b!818333 (=> (not res!558499) (not e!454245))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818333 (= res!558499 (and (= (size!22080 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22079 _keys!976) (size!22080 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818334 () Bool)

(declare-fun e!454243 () Bool)

(assert (=> b!818334 (= e!454243 tp_is_empty!14503)))

(declare-fun b!818336 () Bool)

(declare-fun e!454246 () Bool)

(assert (=> b!818336 (= e!454246 (and e!454243 mapRes!23350))))

(declare-fun condMapEmpty!23350 () Bool)

(declare-fun mapDefault!23350 () ValueCell!6836)

