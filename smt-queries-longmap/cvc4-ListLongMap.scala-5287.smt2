; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70896 () Bool)

(assert start!70896)

(declare-fun b_free!13133 () Bool)

(declare-fun b_next!13133 () Bool)

(assert (=> start!70896 (= b_free!13133 (not b_next!13133))))

(declare-fun tp!46147 () Bool)

(declare-fun b_and!22017 () Bool)

(assert (=> start!70896 (= tp!46147 b_and!22017)))

(declare-fun b!823451 () Bool)

(declare-fun res!561553 () Bool)

(declare-fun e!457995 () Bool)

(assert (=> b!823451 (=> (not res!561553) (not e!457995))))

(declare-datatypes ((array!45876 0))(
  ( (array!45877 (arr!21987 (Array (_ BitVec 32) (_ BitVec 64))) (size!22408 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45876)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45876 (_ BitVec 32)) Bool)

(assert (=> b!823451 (= res!561553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823452 () Bool)

(declare-fun res!561549 () Bool)

(assert (=> b!823452 (=> (not res!561549) (not e!457995))))

(declare-datatypes ((List!15690 0))(
  ( (Nil!15687) (Cons!15686 (h!16815 (_ BitVec 64)) (t!22029 List!15690)) )
))
(declare-fun arrayNoDuplicates!0 (array!45876 (_ BitVec 32) List!15690) Bool)

(assert (=> b!823452 (= res!561549 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15687))))

(declare-fun b!823453 () Bool)

(declare-fun e!457999 () Bool)

(assert (=> b!823453 (= e!457995 (not e!457999))))

(declare-fun res!561552 () Bool)

(assert (=> b!823453 (=> res!561552 e!457999)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823453 (= res!561552 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24791 0))(
  ( (V!24792 (val!7469 Int)) )
))
(declare-datatypes ((tuple2!9878 0))(
  ( (tuple2!9879 (_1!4950 (_ BitVec 64)) (_2!4950 V!24791)) )
))
(declare-datatypes ((List!15691 0))(
  ( (Nil!15688) (Cons!15687 (h!16816 tuple2!9878) (t!22030 List!15691)) )
))
(declare-datatypes ((ListLongMap!8701 0))(
  ( (ListLongMap!8702 (toList!4366 List!15691)) )
))
(declare-fun lt!371304 () ListLongMap!8701)

(declare-fun lt!371311 () ListLongMap!8701)

(assert (=> b!823453 (= lt!371304 lt!371311)))

(declare-fun zeroValueBefore!34 () V!24791)

(declare-fun zeroValueAfter!34 () V!24791)

(declare-fun minValue!754 () V!24791)

(declare-datatypes ((ValueCell!7006 0))(
  ( (ValueCellFull!7006 (v!9901 V!24791)) (EmptyCell!7006) )
))
(declare-datatypes ((array!45878 0))(
  ( (array!45879 (arr!21988 (Array (_ BitVec 32) ValueCell!7006)) (size!22409 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45878)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28198 0))(
  ( (Unit!28199) )
))
(declare-fun lt!371309 () Unit!28198)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!491 (array!45876 array!45878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24791 V!24791 V!24791 V!24791 (_ BitVec 32) Int) Unit!28198)

(assert (=> b!823453 (= lt!371309 (lemmaNoChangeToArrayThenSameMapNoExtras!491 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2381 (array!45876 array!45878 (_ BitVec 32) (_ BitVec 32) V!24791 V!24791 (_ BitVec 32) Int) ListLongMap!8701)

(assert (=> b!823453 (= lt!371311 (getCurrentListMapNoExtraKeys!2381 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823453 (= lt!371304 (getCurrentListMapNoExtraKeys!2381 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823454 () Bool)

(declare-fun e!457996 () Bool)

(declare-fun e!458000 () Bool)

(declare-fun mapRes!23878 () Bool)

(assert (=> b!823454 (= e!457996 (and e!458000 mapRes!23878))))

(declare-fun condMapEmpty!23878 () Bool)

(declare-fun mapDefault!23878 () ValueCell!7006)

