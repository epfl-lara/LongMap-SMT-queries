; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70640 () Bool)

(assert start!70640)

(declare-fun b_free!12927 () Bool)

(declare-fun b_next!12927 () Bool)

(assert (=> start!70640 (= b_free!12927 (not b_next!12927))))

(declare-fun tp!45519 () Bool)

(declare-fun b_and!21781 () Bool)

(assert (=> start!70640 (= tp!45519 b_and!21781)))

(declare-fun b!820614 () Bool)

(declare-fun res!559886 () Bool)

(declare-fun e!455930 () Bool)

(assert (=> b!820614 (=> (not res!559886) (not e!455930))))

(declare-datatypes ((array!45468 0))(
  ( (array!45469 (arr!21786 (Array (_ BitVec 32) (_ BitVec 64))) (size!22207 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45468)

(declare-datatypes ((List!15524 0))(
  ( (Nil!15521) (Cons!15520 (h!16649 (_ BitVec 64)) (t!21857 List!15524)) )
))
(declare-fun arrayNoDuplicates!0 (array!45468 (_ BitVec 32) List!15524) Bool)

(assert (=> b!820614 (= res!559886 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15521))))

(declare-fun b!820615 () Bool)

(declare-fun e!455932 () Bool)

(declare-fun e!455928 () Bool)

(declare-fun mapRes!23560 () Bool)

(assert (=> b!820615 (= e!455932 (and e!455928 mapRes!23560))))

(declare-fun condMapEmpty!23560 () Bool)

(declare-datatypes ((V!24517 0))(
  ( (V!24518 (val!7366 Int)) )
))
(declare-datatypes ((ValueCell!6903 0))(
  ( (ValueCellFull!6903 (v!9797 V!24517)) (EmptyCell!6903) )
))
(declare-datatypes ((array!45470 0))(
  ( (array!45471 (arr!21787 (Array (_ BitVec 32) ValueCell!6903)) (size!22208 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45470)

(declare-fun mapDefault!23560 () ValueCell!6903)

(assert (=> b!820615 (= condMapEmpty!23560 (= (arr!21787 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6903)) mapDefault!23560)))))

(declare-fun res!559887 () Bool)

(assert (=> start!70640 (=> (not res!559887) (not e!455930))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70640 (= res!559887 (validMask!0 mask!1312))))

(assert (=> start!70640 e!455930))

(declare-fun tp_is_empty!14637 () Bool)

(assert (=> start!70640 tp_is_empty!14637))

(declare-fun array_inv!17411 (array!45468) Bool)

(assert (=> start!70640 (array_inv!17411 _keys!976)))

(assert (=> start!70640 true))

(declare-fun array_inv!17412 (array!45470) Bool)

(assert (=> start!70640 (and (array_inv!17412 _values!788) e!455932)))

(assert (=> start!70640 tp!45519))

(declare-fun b!820616 () Bool)

(declare-fun e!455929 () Bool)

(assert (=> b!820616 (= e!455929 tp_is_empty!14637)))

(declare-fun b!820617 () Bool)

(assert (=> b!820617 (= e!455928 tp_is_empty!14637)))

(declare-fun mapIsEmpty!23560 () Bool)

(assert (=> mapIsEmpty!23560 mapRes!23560))

(declare-fun b!820618 () Bool)

(declare-fun res!559885 () Bool)

(assert (=> b!820618 (=> (not res!559885) (not e!455930))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820618 (= res!559885 (and (= (size!22208 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22207 _keys!976) (size!22208 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820619 () Bool)

(declare-fun res!559888 () Bool)

(assert (=> b!820619 (=> (not res!559888) (not e!455930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45468 (_ BitVec 32)) Bool)

(assert (=> b!820619 (= res!559888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820620 () Bool)

(assert (=> b!820620 (= e!455930 (not true))))

(declare-datatypes ((tuple2!9704 0))(
  ( (tuple2!9705 (_1!4863 (_ BitVec 64)) (_2!4863 V!24517)) )
))
(declare-datatypes ((List!15525 0))(
  ( (Nil!15522) (Cons!15521 (h!16650 tuple2!9704) (t!21858 List!15525)) )
))
(declare-datatypes ((ListLongMap!8527 0))(
  ( (ListLongMap!8528 (toList!4279 List!15525)) )
))
(declare-fun lt!368842 () ListLongMap!8527)

(declare-fun lt!368840 () ListLongMap!8527)

(assert (=> b!820620 (= lt!368842 lt!368840)))

(declare-datatypes ((Unit!28035 0))(
  ( (Unit!28036) )
))
(declare-fun lt!368841 () Unit!28035)

(declare-fun zeroValueBefore!34 () V!24517)

(declare-fun zeroValueAfter!34 () V!24517)

(declare-fun minValue!754 () V!24517)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!415 (array!45468 array!45470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24517 V!24517 V!24517 V!24517 (_ BitVec 32) Int) Unit!28035)

(assert (=> b!820620 (= lt!368841 (lemmaNoChangeToArrayThenSameMapNoExtras!415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2305 (array!45468 array!45470 (_ BitVec 32) (_ BitVec 32) V!24517 V!24517 (_ BitVec 32) Int) ListLongMap!8527)

(assert (=> b!820620 (= lt!368840 (getCurrentListMapNoExtraKeys!2305 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820620 (= lt!368842 (getCurrentListMapNoExtraKeys!2305 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23560 () Bool)

(declare-fun tp!45520 () Bool)

(assert (=> mapNonEmpty!23560 (= mapRes!23560 (and tp!45520 e!455929))))

(declare-fun mapRest!23560 () (Array (_ BitVec 32) ValueCell!6903))

(declare-fun mapValue!23560 () ValueCell!6903)

(declare-fun mapKey!23560 () (_ BitVec 32))

(assert (=> mapNonEmpty!23560 (= (arr!21787 _values!788) (store mapRest!23560 mapKey!23560 mapValue!23560))))

(assert (= (and start!70640 res!559887) b!820618))

(assert (= (and b!820618 res!559885) b!820619))

(assert (= (and b!820619 res!559888) b!820614))

(assert (= (and b!820614 res!559886) b!820620))

(assert (= (and b!820615 condMapEmpty!23560) mapIsEmpty!23560))

(assert (= (and b!820615 (not condMapEmpty!23560)) mapNonEmpty!23560))

(get-info :version)

(assert (= (and mapNonEmpty!23560 ((_ is ValueCellFull!6903) mapValue!23560)) b!820616))

(assert (= (and b!820615 ((_ is ValueCellFull!6903) mapDefault!23560)) b!820617))

(assert (= start!70640 b!820615))

(declare-fun m!762543 () Bool)

(assert (=> b!820619 m!762543))

(declare-fun m!762545 () Bool)

(assert (=> b!820614 m!762545))

(declare-fun m!762547 () Bool)

(assert (=> b!820620 m!762547))

(declare-fun m!762549 () Bool)

(assert (=> b!820620 m!762549))

(declare-fun m!762551 () Bool)

(assert (=> b!820620 m!762551))

(declare-fun m!762553 () Bool)

(assert (=> mapNonEmpty!23560 m!762553))

(declare-fun m!762555 () Bool)

(assert (=> start!70640 m!762555))

(declare-fun m!762557 () Bool)

(assert (=> start!70640 m!762557))

(declare-fun m!762559 () Bool)

(assert (=> start!70640 m!762559))

(check-sat (not b!820614) (not b!820619) b_and!21781 tp_is_empty!14637 (not b!820620) (not start!70640) (not b_next!12927) (not mapNonEmpty!23560))
(check-sat b_and!21781 (not b_next!12927))
