; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70668 () Bool)

(assert start!70668)

(declare-fun b_free!12955 () Bool)

(declare-fun b_next!12955 () Bool)

(assert (=> start!70668 (= b_free!12955 (not b_next!12955))))

(declare-fun tp!45604 () Bool)

(declare-fun b_and!21809 () Bool)

(assert (=> start!70668 (= tp!45604 b_and!21809)))

(declare-fun b!820908 () Bool)

(declare-fun res!560056 () Bool)

(declare-fun e!456142 () Bool)

(assert (=> b!820908 (=> (not res!560056) (not e!456142))))

(declare-datatypes ((array!45524 0))(
  ( (array!45525 (arr!21814 (Array (_ BitVec 32) (_ BitVec 64))) (size!22235 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45524)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24555 0))(
  ( (V!24556 (val!7380 Int)) )
))
(declare-datatypes ((ValueCell!6917 0))(
  ( (ValueCellFull!6917 (v!9811 V!24555)) (EmptyCell!6917) )
))
(declare-datatypes ((array!45526 0))(
  ( (array!45527 (arr!21815 (Array (_ BitVec 32) ValueCell!6917)) (size!22236 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45526)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820908 (= res!560056 (and (= (size!22236 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22235 _keys!976) (size!22236 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820909 () Bool)

(declare-fun e!456140 () Bool)

(declare-fun tp_is_empty!14665 () Bool)

(assert (=> b!820909 (= e!456140 tp_is_empty!14665)))

(declare-fun b!820910 () Bool)

(declare-fun e!456138 () Bool)

(assert (=> b!820910 (= e!456138 tp_is_empty!14665)))

(declare-fun res!560054 () Bool)

(assert (=> start!70668 (=> (not res!560054) (not e!456142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70668 (= res!560054 (validMask!0 mask!1312))))

(assert (=> start!70668 e!456142))

(assert (=> start!70668 tp_is_empty!14665))

(declare-fun array_inv!17435 (array!45524) Bool)

(assert (=> start!70668 (array_inv!17435 _keys!976)))

(assert (=> start!70668 true))

(declare-fun e!456141 () Bool)

(declare-fun array_inv!17436 (array!45526) Bool)

(assert (=> start!70668 (and (array_inv!17436 _values!788) e!456141)))

(assert (=> start!70668 tp!45604))

(declare-fun b!820911 () Bool)

(declare-fun res!560053 () Bool)

(assert (=> b!820911 (=> (not res!560053) (not e!456142))))

(declare-datatypes ((List!15549 0))(
  ( (Nil!15546) (Cons!15545 (h!16674 (_ BitVec 64)) (t!21882 List!15549)) )
))
(declare-fun arrayNoDuplicates!0 (array!45524 (_ BitVec 32) List!15549) Bool)

(assert (=> b!820911 (= res!560053 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15546))))

(declare-fun mapNonEmpty!23602 () Bool)

(declare-fun mapRes!23602 () Bool)

(declare-fun tp!45603 () Bool)

(assert (=> mapNonEmpty!23602 (= mapRes!23602 (and tp!45603 e!456140))))

(declare-fun mapKey!23602 () (_ BitVec 32))

(declare-fun mapRest!23602 () (Array (_ BitVec 32) ValueCell!6917))

(declare-fun mapValue!23602 () ValueCell!6917)

(assert (=> mapNonEmpty!23602 (= (arr!21815 _values!788) (store mapRest!23602 mapKey!23602 mapValue!23602))))

(declare-fun b!820912 () Bool)

(assert (=> b!820912 (= e!456142 (not true))))

(declare-datatypes ((tuple2!9730 0))(
  ( (tuple2!9731 (_1!4876 (_ BitVec 64)) (_2!4876 V!24555)) )
))
(declare-datatypes ((List!15550 0))(
  ( (Nil!15547) (Cons!15546 (h!16675 tuple2!9730) (t!21883 List!15550)) )
))
(declare-datatypes ((ListLongMap!8553 0))(
  ( (ListLongMap!8554 (toList!4292 List!15550)) )
))
(declare-fun lt!368968 () ListLongMap!8553)

(declare-fun lt!368966 () ListLongMap!8553)

(assert (=> b!820912 (= lt!368968 lt!368966)))

(declare-fun zeroValueBefore!34 () V!24555)

(declare-fun zeroValueAfter!34 () V!24555)

(declare-fun minValue!754 () V!24555)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28061 0))(
  ( (Unit!28062) )
))
(declare-fun lt!368967 () Unit!28061)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!428 (array!45524 array!45526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24555 V!24555 V!24555 V!24555 (_ BitVec 32) Int) Unit!28061)

(assert (=> b!820912 (= lt!368967 (lemmaNoChangeToArrayThenSameMapNoExtras!428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2318 (array!45524 array!45526 (_ BitVec 32) (_ BitVec 32) V!24555 V!24555 (_ BitVec 32) Int) ListLongMap!8553)

(assert (=> b!820912 (= lt!368966 (getCurrentListMapNoExtraKeys!2318 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820912 (= lt!368968 (getCurrentListMapNoExtraKeys!2318 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23602 () Bool)

(assert (=> mapIsEmpty!23602 mapRes!23602))

(declare-fun b!820913 () Bool)

(declare-fun res!560055 () Bool)

(assert (=> b!820913 (=> (not res!560055) (not e!456142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45524 (_ BitVec 32)) Bool)

(assert (=> b!820913 (= res!560055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820914 () Bool)

(assert (=> b!820914 (= e!456141 (and e!456138 mapRes!23602))))

(declare-fun condMapEmpty!23602 () Bool)

(declare-fun mapDefault!23602 () ValueCell!6917)

