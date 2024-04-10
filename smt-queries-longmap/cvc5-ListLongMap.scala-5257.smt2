; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70662 () Bool)

(assert start!70662)

(declare-fun b_free!12949 () Bool)

(declare-fun b_next!12949 () Bool)

(assert (=> start!70662 (= b_free!12949 (not b_next!12949))))

(declare-fun tp!45586 () Bool)

(declare-fun b_and!21803 () Bool)

(assert (=> start!70662 (= tp!45586 b_and!21803)))

(declare-fun mapIsEmpty!23593 () Bool)

(declare-fun mapRes!23593 () Bool)

(assert (=> mapIsEmpty!23593 mapRes!23593))

(declare-fun res!560017 () Bool)

(declare-fun e!456097 () Bool)

(assert (=> start!70662 (=> (not res!560017) (not e!456097))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70662 (= res!560017 (validMask!0 mask!1312))))

(assert (=> start!70662 e!456097))

(declare-fun tp_is_empty!14659 () Bool)

(assert (=> start!70662 tp_is_empty!14659))

(declare-datatypes ((array!45512 0))(
  ( (array!45513 (arr!21808 (Array (_ BitVec 32) (_ BitVec 64))) (size!22229 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45512)

(declare-fun array_inv!17431 (array!45512) Bool)

(assert (=> start!70662 (array_inv!17431 _keys!976)))

(assert (=> start!70662 true))

(declare-datatypes ((V!24547 0))(
  ( (V!24548 (val!7377 Int)) )
))
(declare-datatypes ((ValueCell!6914 0))(
  ( (ValueCellFull!6914 (v!9808 V!24547)) (EmptyCell!6914) )
))
(declare-datatypes ((array!45514 0))(
  ( (array!45515 (arr!21809 (Array (_ BitVec 32) ValueCell!6914)) (size!22230 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45514)

(declare-fun e!456094 () Bool)

(declare-fun array_inv!17432 (array!45514) Bool)

(assert (=> start!70662 (and (array_inv!17432 _values!788) e!456094)))

(assert (=> start!70662 tp!45586))

(declare-fun b!820845 () Bool)

(declare-fun res!560018 () Bool)

(assert (=> b!820845 (=> (not res!560018) (not e!456097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45512 (_ BitVec 32)) Bool)

(assert (=> b!820845 (= res!560018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820846 () Bool)

(declare-fun res!560019 () Bool)

(assert (=> b!820846 (=> (not res!560019) (not e!456097))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820846 (= res!560019 (and (= (size!22230 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22229 _keys!976) (size!22230 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820847 () Bool)

(declare-fun res!560020 () Bool)

(assert (=> b!820847 (=> (not res!560020) (not e!456097))))

(declare-datatypes ((List!15544 0))(
  ( (Nil!15541) (Cons!15540 (h!16669 (_ BitVec 64)) (t!21877 List!15544)) )
))
(declare-fun arrayNoDuplicates!0 (array!45512 (_ BitVec 32) List!15544) Bool)

(assert (=> b!820847 (= res!560020 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15541))))

(declare-fun mapNonEmpty!23593 () Bool)

(declare-fun tp!45585 () Bool)

(declare-fun e!456095 () Bool)

(assert (=> mapNonEmpty!23593 (= mapRes!23593 (and tp!45585 e!456095))))

(declare-fun mapRest!23593 () (Array (_ BitVec 32) ValueCell!6914))

(declare-fun mapKey!23593 () (_ BitVec 32))

(declare-fun mapValue!23593 () ValueCell!6914)

(assert (=> mapNonEmpty!23593 (= (arr!21809 _values!788) (store mapRest!23593 mapKey!23593 mapValue!23593))))

(declare-fun b!820848 () Bool)

(assert (=> b!820848 (= e!456095 tp_is_empty!14659)))

(declare-fun b!820849 () Bool)

(assert (=> b!820849 (= e!456097 (not true))))

(declare-datatypes ((tuple2!9724 0))(
  ( (tuple2!9725 (_1!4873 (_ BitVec 64)) (_2!4873 V!24547)) )
))
(declare-datatypes ((List!15545 0))(
  ( (Nil!15542) (Cons!15541 (h!16670 tuple2!9724) (t!21878 List!15545)) )
))
(declare-datatypes ((ListLongMap!8547 0))(
  ( (ListLongMap!8548 (toList!4289 List!15545)) )
))
(declare-fun lt!368940 () ListLongMap!8547)

(declare-fun lt!368939 () ListLongMap!8547)

(assert (=> b!820849 (= lt!368940 lt!368939)))

(declare-fun zeroValueBefore!34 () V!24547)

(declare-fun zeroValueAfter!34 () V!24547)

(declare-fun minValue!754 () V!24547)

(declare-datatypes ((Unit!28055 0))(
  ( (Unit!28056) )
))
(declare-fun lt!368941 () Unit!28055)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!425 (array!45512 array!45514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24547 V!24547 V!24547 V!24547 (_ BitVec 32) Int) Unit!28055)

(assert (=> b!820849 (= lt!368941 (lemmaNoChangeToArrayThenSameMapNoExtras!425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2315 (array!45512 array!45514 (_ BitVec 32) (_ BitVec 32) V!24547 V!24547 (_ BitVec 32) Int) ListLongMap!8547)

(assert (=> b!820849 (= lt!368939 (getCurrentListMapNoExtraKeys!2315 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820849 (= lt!368940 (getCurrentListMapNoExtraKeys!2315 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820850 () Bool)

(declare-fun e!456093 () Bool)

(assert (=> b!820850 (= e!456094 (and e!456093 mapRes!23593))))

(declare-fun condMapEmpty!23593 () Bool)

(declare-fun mapDefault!23593 () ValueCell!6914)

