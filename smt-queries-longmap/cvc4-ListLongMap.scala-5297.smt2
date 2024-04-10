; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70990 () Bool)

(assert start!70990)

(declare-fun b_free!13193 () Bool)

(declare-fun b_next!13193 () Bool)

(assert (=> start!70990 (= b_free!13193 (not b_next!13193))))

(declare-fun tp!46333 () Bool)

(declare-fun b_and!22097 () Bool)

(assert (=> start!70990 (= tp!46333 b_and!22097)))

(declare-fun b!824356 () Bool)

(declare-fun res!562028 () Bool)

(declare-fun e!458622 () Bool)

(assert (=> b!824356 (=> (not res!562028) (not e!458622))))

(declare-datatypes ((array!45994 0))(
  ( (array!45995 (arr!22044 (Array (_ BitVec 32) (_ BitVec 64))) (size!22465 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45994)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24871 0))(
  ( (V!24872 (val!7499 Int)) )
))
(declare-datatypes ((ValueCell!7036 0))(
  ( (ValueCellFull!7036 (v!9932 V!24871)) (EmptyCell!7036) )
))
(declare-datatypes ((array!45996 0))(
  ( (array!45997 (arr!22045 (Array (_ BitVec 32) ValueCell!7036)) (size!22466 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45996)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824356 (= res!562028 (and (= (size!22466 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22465 _keys!976) (size!22466 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824357 () Bool)

(declare-fun e!458625 () Bool)

(declare-fun tp_is_empty!14903 () Bool)

(assert (=> b!824357 (= e!458625 tp_is_empty!14903)))

(declare-fun res!562030 () Bool)

(assert (=> start!70990 (=> (not res!562030) (not e!458622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70990 (= res!562030 (validMask!0 mask!1312))))

(assert (=> start!70990 e!458622))

(assert (=> start!70990 tp_is_empty!14903))

(declare-fun array_inv!17589 (array!45994) Bool)

(assert (=> start!70990 (array_inv!17589 _keys!976)))

(assert (=> start!70990 true))

(declare-fun e!458626 () Bool)

(declare-fun array_inv!17590 (array!45996) Bool)

(assert (=> start!70990 (and (array_inv!17590 _values!788) e!458626)))

(assert (=> start!70990 tp!46333))

(declare-fun b!824358 () Bool)

(declare-fun res!562029 () Bool)

(assert (=> b!824358 (=> (not res!562029) (not e!458622))))

(declare-datatypes ((List!15734 0))(
  ( (Nil!15731) (Cons!15730 (h!16859 (_ BitVec 64)) (t!22077 List!15734)) )
))
(declare-fun arrayNoDuplicates!0 (array!45994 (_ BitVec 32) List!15734) Bool)

(assert (=> b!824358 (= res!562029 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15731))))

(declare-fun mapNonEmpty!23974 () Bool)

(declare-fun mapRes!23974 () Bool)

(declare-fun tp!46332 () Bool)

(declare-fun e!458624 () Bool)

(assert (=> mapNonEmpty!23974 (= mapRes!23974 (and tp!46332 e!458624))))

(declare-fun mapValue!23974 () ValueCell!7036)

(declare-fun mapKey!23974 () (_ BitVec 32))

(declare-fun mapRest!23974 () (Array (_ BitVec 32) ValueCell!7036))

(assert (=> mapNonEmpty!23974 (= (arr!22045 _values!788) (store mapRest!23974 mapKey!23974 mapValue!23974))))

(declare-fun b!824359 () Bool)

(declare-fun e!458623 () Bool)

(assert (=> b!824359 (= e!458622 (not e!458623))))

(declare-fun res!562032 () Bool)

(assert (=> b!824359 (=> res!562032 e!458623)))

(assert (=> b!824359 (= res!562032 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9922 0))(
  ( (tuple2!9923 (_1!4972 (_ BitVec 64)) (_2!4972 V!24871)) )
))
(declare-datatypes ((List!15735 0))(
  ( (Nil!15732) (Cons!15731 (h!16860 tuple2!9922) (t!22078 List!15735)) )
))
(declare-datatypes ((ListLongMap!8745 0))(
  ( (ListLongMap!8746 (toList!4388 List!15735)) )
))
(declare-fun lt!371786 () ListLongMap!8745)

(declare-fun lt!371783 () ListLongMap!8745)

(assert (=> b!824359 (= lt!371786 lt!371783)))

(declare-fun zeroValueBefore!34 () V!24871)

(declare-fun zeroValueAfter!34 () V!24871)

(declare-fun minValue!754 () V!24871)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28244 0))(
  ( (Unit!28245) )
))
(declare-fun lt!371784 () Unit!28244)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!513 (array!45994 array!45996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24871 V!24871 V!24871 V!24871 (_ BitVec 32) Int) Unit!28244)

(assert (=> b!824359 (= lt!371784 (lemmaNoChangeToArrayThenSameMapNoExtras!513 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2403 (array!45994 array!45996 (_ BitVec 32) (_ BitVec 32) V!24871 V!24871 (_ BitVec 32) Int) ListLongMap!8745)

(assert (=> b!824359 (= lt!371783 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824359 (= lt!371786 (getCurrentListMapNoExtraKeys!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824360 () Bool)

(assert (=> b!824360 (= e!458623 true)))

(declare-fun lt!371785 () ListLongMap!8745)

(declare-fun getCurrentListMap!2529 (array!45994 array!45996 (_ BitVec 32) (_ BitVec 32) V!24871 V!24871 (_ BitVec 32) Int) ListLongMap!8745)

(assert (=> b!824360 (= lt!371785 (getCurrentListMap!2529 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824361 () Bool)

(assert (=> b!824361 (= e!458624 tp_is_empty!14903)))

(declare-fun b!824362 () Bool)

(declare-fun res!562031 () Bool)

(assert (=> b!824362 (=> (not res!562031) (not e!458622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45994 (_ BitVec 32)) Bool)

(assert (=> b!824362 (= res!562031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824363 () Bool)

(assert (=> b!824363 (= e!458626 (and e!458625 mapRes!23974))))

(declare-fun condMapEmpty!23974 () Bool)

(declare-fun mapDefault!23974 () ValueCell!7036)

