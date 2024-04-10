; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70654 () Bool)

(assert start!70654)

(declare-fun b_free!12941 () Bool)

(declare-fun b_next!12941 () Bool)

(assert (=> start!70654 (= b_free!12941 (not b_next!12941))))

(declare-fun tp!45561 () Bool)

(declare-fun b_and!21795 () Bool)

(assert (=> start!70654 (= tp!45561 b_and!21795)))

(declare-fun b!820761 () Bool)

(declare-fun e!456037 () Bool)

(declare-fun tp_is_empty!14651 () Bool)

(assert (=> b!820761 (= e!456037 tp_is_empty!14651)))

(declare-fun b!820762 () Bool)

(declare-fun res!559969 () Bool)

(declare-fun e!456034 () Bool)

(assert (=> b!820762 (=> (not res!559969) (not e!456034))))

(declare-datatypes ((array!45496 0))(
  ( (array!45497 (arr!21800 (Array (_ BitVec 32) (_ BitVec 64))) (size!22221 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45496)

(declare-datatypes ((List!15536 0))(
  ( (Nil!15533) (Cons!15532 (h!16661 (_ BitVec 64)) (t!21869 List!15536)) )
))
(declare-fun arrayNoDuplicates!0 (array!45496 (_ BitVec 32) List!15536) Bool)

(assert (=> b!820762 (= res!559969 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15533))))

(declare-fun b!820763 () Bool)

(declare-fun res!559972 () Bool)

(assert (=> b!820763 (=> (not res!559972) (not e!456034))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24535 0))(
  ( (V!24536 (val!7373 Int)) )
))
(declare-datatypes ((ValueCell!6910 0))(
  ( (ValueCellFull!6910 (v!9804 V!24535)) (EmptyCell!6910) )
))
(declare-datatypes ((array!45498 0))(
  ( (array!45499 (arr!21801 (Array (_ BitVec 32) ValueCell!6910)) (size!22222 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45498)

(assert (=> b!820763 (= res!559972 (and (= (size!22222 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22221 _keys!976) (size!22222 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820764 () Bool)

(assert (=> b!820764 (= e!456034 (not true))))

(declare-datatypes ((tuple2!9716 0))(
  ( (tuple2!9717 (_1!4869 (_ BitVec 64)) (_2!4869 V!24535)) )
))
(declare-datatypes ((List!15537 0))(
  ( (Nil!15534) (Cons!15533 (h!16662 tuple2!9716) (t!21870 List!15537)) )
))
(declare-datatypes ((ListLongMap!8539 0))(
  ( (ListLongMap!8540 (toList!4285 List!15537)) )
))
(declare-fun lt!368903 () ListLongMap!8539)

(declare-fun lt!368904 () ListLongMap!8539)

(assert (=> b!820764 (= lt!368903 lt!368904)))

(declare-fun zeroValueBefore!34 () V!24535)

(declare-fun zeroValueAfter!34 () V!24535)

(declare-fun minValue!754 () V!24535)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28047 0))(
  ( (Unit!28048) )
))
(declare-fun lt!368905 () Unit!28047)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!421 (array!45496 array!45498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24535 V!24535 V!24535 V!24535 (_ BitVec 32) Int) Unit!28047)

(assert (=> b!820764 (= lt!368905 (lemmaNoChangeToArrayThenSameMapNoExtras!421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2311 (array!45496 array!45498 (_ BitVec 32) (_ BitVec 32) V!24535 V!24535 (_ BitVec 32) Int) ListLongMap!8539)

(assert (=> b!820764 (= lt!368904 (getCurrentListMapNoExtraKeys!2311 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820764 (= lt!368903 (getCurrentListMapNoExtraKeys!2311 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820765 () Bool)

(declare-fun e!456035 () Bool)

(assert (=> b!820765 (= e!456035 tp_is_empty!14651)))

(declare-fun mapNonEmpty!23581 () Bool)

(declare-fun mapRes!23581 () Bool)

(declare-fun tp!45562 () Bool)

(assert (=> mapNonEmpty!23581 (= mapRes!23581 (and tp!45562 e!456037))))

(declare-fun mapValue!23581 () ValueCell!6910)

(declare-fun mapKey!23581 () (_ BitVec 32))

(declare-fun mapRest!23581 () (Array (_ BitVec 32) ValueCell!6910))

(assert (=> mapNonEmpty!23581 (= (arr!21801 _values!788) (store mapRest!23581 mapKey!23581 mapValue!23581))))

(declare-fun mapIsEmpty!23581 () Bool)

(assert (=> mapIsEmpty!23581 mapRes!23581))

(declare-fun b!820767 () Bool)

(declare-fun res!559971 () Bool)

(assert (=> b!820767 (=> (not res!559971) (not e!456034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45496 (_ BitVec 32)) Bool)

(assert (=> b!820767 (= res!559971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!559970 () Bool)

(assert (=> start!70654 (=> (not res!559970) (not e!456034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70654 (= res!559970 (validMask!0 mask!1312))))

(assert (=> start!70654 e!456034))

(assert (=> start!70654 tp_is_empty!14651))

(declare-fun array_inv!17425 (array!45496) Bool)

(assert (=> start!70654 (array_inv!17425 _keys!976)))

(assert (=> start!70654 true))

(declare-fun e!456033 () Bool)

(declare-fun array_inv!17426 (array!45498) Bool)

(assert (=> start!70654 (and (array_inv!17426 _values!788) e!456033)))

(assert (=> start!70654 tp!45561))

(declare-fun b!820766 () Bool)

(assert (=> b!820766 (= e!456033 (and e!456035 mapRes!23581))))

(declare-fun condMapEmpty!23581 () Bool)

(declare-fun mapDefault!23581 () ValueCell!6910)

