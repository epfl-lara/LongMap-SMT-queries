; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70964 () Bool)

(assert start!70964)

(declare-fun b_free!13181 () Bool)

(declare-fun b_next!13181 () Bool)

(assert (=> start!70964 (= b_free!13181 (not b_next!13181))))

(declare-fun tp!46293 () Bool)

(declare-fun b_and!22077 () Bool)

(assert (=> start!70964 (= tp!46293 b_and!22077)))

(declare-fun b!824137 () Bool)

(declare-fun res!561920 () Bool)

(declare-fun e!458473 () Bool)

(assert (=> b!824137 (=> (not res!561920) (not e!458473))))

(declare-datatypes ((array!45970 0))(
  ( (array!45971 (arr!22033 (Array (_ BitVec 32) (_ BitVec 64))) (size!22454 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45970)

(declare-datatypes ((List!15725 0))(
  ( (Nil!15722) (Cons!15721 (h!16850 (_ BitVec 64)) (t!22066 List!15725)) )
))
(declare-fun arrayNoDuplicates!0 (array!45970 (_ BitVec 32) List!15725) Bool)

(assert (=> b!824137 (= res!561920 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15722))))

(declare-fun mapNonEmpty!23953 () Bool)

(declare-fun mapRes!23953 () Bool)

(declare-fun tp!46294 () Bool)

(declare-fun e!458471 () Bool)

(assert (=> mapNonEmpty!23953 (= mapRes!23953 (and tp!46294 e!458471))))

(declare-datatypes ((V!24855 0))(
  ( (V!24856 (val!7493 Int)) )
))
(declare-datatypes ((ValueCell!7030 0))(
  ( (ValueCellFull!7030 (v!9926 V!24855)) (EmptyCell!7030) )
))
(declare-fun mapValue!23953 () ValueCell!7030)

(declare-datatypes ((array!45972 0))(
  ( (array!45973 (arr!22034 (Array (_ BitVec 32) ValueCell!7030)) (size!22455 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45972)

(declare-fun mapKey!23953 () (_ BitVec 32))

(declare-fun mapRest!23953 () (Array (_ BitVec 32) ValueCell!7030))

(assert (=> mapNonEmpty!23953 (= (arr!22034 _values!788) (store mapRest!23953 mapKey!23953 mapValue!23953))))

(declare-fun b!824138 () Bool)

(assert (=> b!824138 (= e!458473 (not true))))

(declare-datatypes ((tuple2!9914 0))(
  ( (tuple2!9915 (_1!4968 (_ BitVec 64)) (_2!4968 V!24855)) )
))
(declare-datatypes ((List!15726 0))(
  ( (Nil!15723) (Cons!15722 (h!16851 tuple2!9914) (t!22067 List!15726)) )
))
(declare-datatypes ((ListLongMap!8737 0))(
  ( (ListLongMap!8738 (toList!4384 List!15726)) )
))
(declare-fun lt!371683 () ListLongMap!8737)

(declare-fun lt!371681 () ListLongMap!8737)

(assert (=> b!824138 (= lt!371683 lt!371681)))

(declare-datatypes ((Unit!28236 0))(
  ( (Unit!28237) )
))
(declare-fun lt!371682 () Unit!28236)

(declare-fun zeroValueBefore!34 () V!24855)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24855)

(declare-fun minValue!754 () V!24855)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!509 (array!45970 array!45972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24855 V!24855 V!24855 V!24855 (_ BitVec 32) Int) Unit!28236)

(assert (=> b!824138 (= lt!371682 (lemmaNoChangeToArrayThenSameMapNoExtras!509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2399 (array!45970 array!45972 (_ BitVec 32) (_ BitVec 32) V!24855 V!24855 (_ BitVec 32) Int) ListLongMap!8737)

(assert (=> b!824138 (= lt!371681 (getCurrentListMapNoExtraKeys!2399 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824138 (= lt!371683 (getCurrentListMapNoExtraKeys!2399 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23953 () Bool)

(assert (=> mapIsEmpty!23953 mapRes!23953))

(declare-fun b!824139 () Bool)

(declare-fun res!561917 () Bool)

(assert (=> b!824139 (=> (not res!561917) (not e!458473))))

(assert (=> b!824139 (= res!561917 (and (= (size!22455 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22454 _keys!976) (size!22455 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561918 () Bool)

(assert (=> start!70964 (=> (not res!561918) (not e!458473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70964 (= res!561918 (validMask!0 mask!1312))))

(assert (=> start!70964 e!458473))

(declare-fun tp_is_empty!14891 () Bool)

(assert (=> start!70964 tp_is_empty!14891))

(declare-fun array_inv!17581 (array!45970) Bool)

(assert (=> start!70964 (array_inv!17581 _keys!976)))

(assert (=> start!70964 true))

(declare-fun e!458470 () Bool)

(declare-fun array_inv!17582 (array!45972) Bool)

(assert (=> start!70964 (and (array_inv!17582 _values!788) e!458470)))

(assert (=> start!70964 tp!46293))

(declare-fun b!824140 () Bool)

(assert (=> b!824140 (= e!458471 tp_is_empty!14891)))

(declare-fun b!824141 () Bool)

(declare-fun e!458469 () Bool)

(assert (=> b!824141 (= e!458469 tp_is_empty!14891)))

(declare-fun b!824142 () Bool)

(declare-fun res!561919 () Bool)

(assert (=> b!824142 (=> (not res!561919) (not e!458473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45970 (_ BitVec 32)) Bool)

(assert (=> b!824142 (= res!561919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824143 () Bool)

(assert (=> b!824143 (= e!458470 (and e!458469 mapRes!23953))))

(declare-fun condMapEmpty!23953 () Bool)

(declare-fun mapDefault!23953 () ValueCell!7030)

