; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70966 () Bool)

(assert start!70966)

(declare-fun b_free!13183 () Bool)

(declare-fun b_next!13183 () Bool)

(assert (=> start!70966 (= b_free!13183 (not b_next!13183))))

(declare-fun tp!46299 () Bool)

(declare-fun b_and!22079 () Bool)

(assert (=> start!70966 (= tp!46299 b_and!22079)))

(declare-fun b!824158 () Bool)

(declare-fun res!561931 () Bool)

(declare-fun e!458487 () Bool)

(assert (=> b!824158 (=> (not res!561931) (not e!458487))))

(declare-datatypes ((array!45974 0))(
  ( (array!45975 (arr!22035 (Array (_ BitVec 32) (_ BitVec 64))) (size!22456 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45974)

(declare-datatypes ((List!15727 0))(
  ( (Nil!15724) (Cons!15723 (h!16852 (_ BitVec 64)) (t!22068 List!15727)) )
))
(declare-fun arrayNoDuplicates!0 (array!45974 (_ BitVec 32) List!15727) Bool)

(assert (=> b!824158 (= res!561931 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15724))))

(declare-fun b!824159 () Bool)

(declare-fun res!561929 () Bool)

(assert (=> b!824159 (=> (not res!561929) (not e!458487))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24859 0))(
  ( (V!24860 (val!7494 Int)) )
))
(declare-datatypes ((ValueCell!7031 0))(
  ( (ValueCellFull!7031 (v!9927 V!24859)) (EmptyCell!7031) )
))
(declare-datatypes ((array!45976 0))(
  ( (array!45977 (arr!22036 (Array (_ BitVec 32) ValueCell!7031)) (size!22457 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45976)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824159 (= res!561929 (and (= (size!22457 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22456 _keys!976) (size!22457 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824160 () Bool)

(declare-fun e!458485 () Bool)

(declare-fun tp_is_empty!14893 () Bool)

(assert (=> b!824160 (= e!458485 tp_is_empty!14893)))

(declare-fun res!561932 () Bool)

(assert (=> start!70966 (=> (not res!561932) (not e!458487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70966 (= res!561932 (validMask!0 mask!1312))))

(assert (=> start!70966 e!458487))

(assert (=> start!70966 tp_is_empty!14893))

(declare-fun array_inv!17583 (array!45974) Bool)

(assert (=> start!70966 (array_inv!17583 _keys!976)))

(assert (=> start!70966 true))

(declare-fun e!458486 () Bool)

(declare-fun array_inv!17584 (array!45976) Bool)

(assert (=> start!70966 (and (array_inv!17584 _values!788) e!458486)))

(assert (=> start!70966 tp!46299))

(declare-fun mapNonEmpty!23956 () Bool)

(declare-fun mapRes!23956 () Bool)

(declare-fun tp!46300 () Bool)

(assert (=> mapNonEmpty!23956 (= mapRes!23956 (and tp!46300 e!458485))))

(declare-fun mapRest!23956 () (Array (_ BitVec 32) ValueCell!7031))

(declare-fun mapValue!23956 () ValueCell!7031)

(declare-fun mapKey!23956 () (_ BitVec 32))

(assert (=> mapNonEmpty!23956 (= (arr!22036 _values!788) (store mapRest!23956 mapKey!23956 mapValue!23956))))

(declare-fun mapIsEmpty!23956 () Bool)

(assert (=> mapIsEmpty!23956 mapRes!23956))

(declare-fun b!824161 () Bool)

(assert (=> b!824161 (= e!458487 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22456 _keys!976)))))))

(declare-datatypes ((tuple2!9916 0))(
  ( (tuple2!9917 (_1!4969 (_ BitVec 64)) (_2!4969 V!24859)) )
))
(declare-datatypes ((List!15728 0))(
  ( (Nil!15725) (Cons!15724 (h!16853 tuple2!9916) (t!22069 List!15728)) )
))
(declare-datatypes ((ListLongMap!8739 0))(
  ( (ListLongMap!8740 (toList!4385 List!15728)) )
))
(declare-fun lt!371690 () ListLongMap!8739)

(declare-fun lt!371691 () ListLongMap!8739)

(assert (=> b!824161 (= lt!371690 lt!371691)))

(declare-fun zeroValueAfter!34 () V!24859)

(declare-fun minValue!754 () V!24859)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28238 0))(
  ( (Unit!28239) )
))
(declare-fun lt!371692 () Unit!28238)

(declare-fun zeroValueBefore!34 () V!24859)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!510 (array!45974 array!45976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 V!24859 V!24859 (_ BitVec 32) Int) Unit!28238)

(assert (=> b!824161 (= lt!371692 (lemmaNoChangeToArrayThenSameMapNoExtras!510 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2400 (array!45974 array!45976 (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 (_ BitVec 32) Int) ListLongMap!8739)

(assert (=> b!824161 (= lt!371691 (getCurrentListMapNoExtraKeys!2400 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824161 (= lt!371690 (getCurrentListMapNoExtraKeys!2400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824162 () Bool)

(declare-fun res!561930 () Bool)

(assert (=> b!824162 (=> (not res!561930) (not e!458487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45974 (_ BitVec 32)) Bool)

(assert (=> b!824162 (= res!561930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824163 () Bool)

(declare-fun e!458484 () Bool)

(assert (=> b!824163 (= e!458486 (and e!458484 mapRes!23956))))

(declare-fun condMapEmpty!23956 () Bool)

(declare-fun mapDefault!23956 () ValueCell!7031)

