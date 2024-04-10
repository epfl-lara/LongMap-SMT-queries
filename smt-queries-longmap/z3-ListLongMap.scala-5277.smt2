; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70814 () Bool)

(assert start!70814)

(declare-fun b_free!13071 () Bool)

(declare-fun b_next!13071 () Bool)

(assert (=> start!70814 (= b_free!13071 (not b_next!13071))))

(declare-fun tp!45957 () Bool)

(declare-fun b_and!21943 () Bool)

(assert (=> start!70814 (= tp!45957 b_and!21943)))

(declare-fun b!822526 () Bool)

(declare-fun res!561008 () Bool)

(declare-fun e!457326 () Bool)

(assert (=> b!822526 (=> (not res!561008) (not e!457326))))

(declare-datatypes ((array!45754 0))(
  ( (array!45755 (arr!21927 (Array (_ BitVec 32) (_ BitVec 64))) (size!22348 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45754)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45754 (_ BitVec 32)) Bool)

(assert (=> b!822526 (= res!561008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822527 () Bool)

(declare-fun e!457328 () Bool)

(declare-fun e!457327 () Bool)

(declare-fun mapRes!23782 () Bool)

(assert (=> b!822527 (= e!457328 (and e!457327 mapRes!23782))))

(declare-fun condMapEmpty!23782 () Bool)

(declare-datatypes ((V!24709 0))(
  ( (V!24710 (val!7438 Int)) )
))
(declare-datatypes ((ValueCell!6975 0))(
  ( (ValueCellFull!6975 (v!9869 V!24709)) (EmptyCell!6975) )
))
(declare-datatypes ((array!45756 0))(
  ( (array!45757 (arr!21928 (Array (_ BitVec 32) ValueCell!6975)) (size!22349 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45756)

(declare-fun mapDefault!23782 () ValueCell!6975)

(assert (=> b!822527 (= condMapEmpty!23782 (= (arr!21928 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6975)) mapDefault!23782)))))

(declare-fun b!822528 () Bool)

(declare-fun res!561007 () Bool)

(assert (=> b!822528 (=> (not res!561007) (not e!457326))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822528 (= res!561007 (and (= (size!22349 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22348 _keys!976) (size!22349 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822529 () Bool)

(declare-fun e!457329 () Bool)

(assert (=> b!822529 (= e!457329 true)))

(declare-datatypes ((tuple2!9826 0))(
  ( (tuple2!9827 (_1!4924 (_ BitVec 64)) (_2!4924 V!24709)) )
))
(declare-datatypes ((List!15640 0))(
  ( (Nil!15637) (Cons!15636 (h!16765 tuple2!9826) (t!21977 List!15640)) )
))
(declare-datatypes ((ListLongMap!8649 0))(
  ( (ListLongMap!8650 (toList!4340 List!15640)) )
))
(declare-fun lt!370225 () ListLongMap!8649)

(declare-fun lt!370221 () ListLongMap!8649)

(declare-fun lt!370219 () tuple2!9826)

(declare-fun +!1890 (ListLongMap!8649 tuple2!9826) ListLongMap!8649)

(assert (=> b!822529 (= lt!370225 (+!1890 lt!370221 lt!370219))))

(declare-fun lt!370227 () ListLongMap!8649)

(declare-fun zeroValueAfter!34 () V!24709)

(declare-fun minValue!754 () V!24709)

(declare-datatypes ((Unit!28144 0))(
  ( (Unit!28145) )
))
(declare-fun lt!370218 () Unit!28144)

(declare-fun addCommutativeForDiffKeys!453 (ListLongMap!8649 (_ BitVec 64) V!24709 (_ BitVec 64) V!24709) Unit!28144)

(assert (=> b!822529 (= lt!370218 (addCommutativeForDiffKeys!453 lt!370227 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370226 () ListLongMap!8649)

(assert (=> b!822529 (= lt!370226 lt!370225)))

(declare-fun lt!370220 () tuple2!9826)

(assert (=> b!822529 (= lt!370225 (+!1890 (+!1890 lt!370227 lt!370219) lt!370220))))

(assert (=> b!822529 (= lt!370219 (tuple2!9827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370222 () ListLongMap!8649)

(assert (=> b!822529 (= lt!370222 lt!370221)))

(assert (=> b!822529 (= lt!370221 (+!1890 lt!370227 lt!370220))))

(assert (=> b!822529 (= lt!370220 (tuple2!9827 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2504 (array!45754 array!45756 (_ BitVec 32) (_ BitVec 32) V!24709 V!24709 (_ BitVec 32) Int) ListLongMap!8649)

(assert (=> b!822529 (= lt!370226 (getCurrentListMap!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24709)

(assert (=> b!822529 (= lt!370222 (getCurrentListMap!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561005 () Bool)

(assert (=> start!70814 (=> (not res!561005) (not e!457326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70814 (= res!561005 (validMask!0 mask!1312))))

(assert (=> start!70814 e!457326))

(declare-fun tp_is_empty!14781 () Bool)

(assert (=> start!70814 tp_is_empty!14781))

(declare-fun array_inv!17515 (array!45754) Bool)

(assert (=> start!70814 (array_inv!17515 _keys!976)))

(assert (=> start!70814 true))

(declare-fun array_inv!17516 (array!45756) Bool)

(assert (=> start!70814 (and (array_inv!17516 _values!788) e!457328)))

(assert (=> start!70814 tp!45957))

(declare-fun b!822530 () Bool)

(assert (=> b!822530 (= e!457326 (not e!457329))))

(declare-fun res!561006 () Bool)

(assert (=> b!822530 (=> res!561006 e!457329)))

(assert (=> b!822530 (= res!561006 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370223 () ListLongMap!8649)

(assert (=> b!822530 (= lt!370227 lt!370223)))

(declare-fun lt!370224 () Unit!28144)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!469 (array!45754 array!45756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24709 V!24709 V!24709 V!24709 (_ BitVec 32) Int) Unit!28144)

(assert (=> b!822530 (= lt!370224 (lemmaNoChangeToArrayThenSameMapNoExtras!469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2359 (array!45754 array!45756 (_ BitVec 32) (_ BitVec 32) V!24709 V!24709 (_ BitVec 32) Int) ListLongMap!8649)

(assert (=> b!822530 (= lt!370223 (getCurrentListMapNoExtraKeys!2359 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822530 (= lt!370227 (getCurrentListMapNoExtraKeys!2359 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23782 () Bool)

(declare-fun tp!45958 () Bool)

(declare-fun e!457324 () Bool)

(assert (=> mapNonEmpty!23782 (= mapRes!23782 (and tp!45958 e!457324))))

(declare-fun mapValue!23782 () ValueCell!6975)

(declare-fun mapRest!23782 () (Array (_ BitVec 32) ValueCell!6975))

(declare-fun mapKey!23782 () (_ BitVec 32))

(assert (=> mapNonEmpty!23782 (= (arr!21928 _values!788) (store mapRest!23782 mapKey!23782 mapValue!23782))))

(declare-fun b!822531 () Bool)

(assert (=> b!822531 (= e!457327 tp_is_empty!14781)))

(declare-fun mapIsEmpty!23782 () Bool)

(assert (=> mapIsEmpty!23782 mapRes!23782))

(declare-fun b!822532 () Bool)

(declare-fun res!561009 () Bool)

(assert (=> b!822532 (=> (not res!561009) (not e!457326))))

(declare-datatypes ((List!15641 0))(
  ( (Nil!15638) (Cons!15637 (h!16766 (_ BitVec 64)) (t!21978 List!15641)) )
))
(declare-fun arrayNoDuplicates!0 (array!45754 (_ BitVec 32) List!15641) Bool)

(assert (=> b!822532 (= res!561009 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15638))))

(declare-fun b!822533 () Bool)

(assert (=> b!822533 (= e!457324 tp_is_empty!14781)))

(assert (= (and start!70814 res!561005) b!822528))

(assert (= (and b!822528 res!561007) b!822526))

(assert (= (and b!822526 res!561008) b!822532))

(assert (= (and b!822532 res!561009) b!822530))

(assert (= (and b!822530 (not res!561006)) b!822529))

(assert (= (and b!822527 condMapEmpty!23782) mapIsEmpty!23782))

(assert (= (and b!822527 (not condMapEmpty!23782)) mapNonEmpty!23782))

(get-info :version)

(assert (= (and mapNonEmpty!23782 ((_ is ValueCellFull!6975) mapValue!23782)) b!822533))

(assert (= (and b!822527 ((_ is ValueCellFull!6975) mapDefault!23782)) b!822531))

(assert (= start!70814 b!822527))

(declare-fun m!764409 () Bool)

(assert (=> b!822526 m!764409))

(declare-fun m!764411 () Bool)

(assert (=> b!822529 m!764411))

(declare-fun m!764413 () Bool)

(assert (=> b!822529 m!764413))

(declare-fun m!764415 () Bool)

(assert (=> b!822529 m!764415))

(declare-fun m!764417 () Bool)

(assert (=> b!822529 m!764417))

(assert (=> b!822529 m!764415))

(declare-fun m!764419 () Bool)

(assert (=> b!822529 m!764419))

(declare-fun m!764421 () Bool)

(assert (=> b!822529 m!764421))

(declare-fun m!764423 () Bool)

(assert (=> b!822529 m!764423))

(declare-fun m!764425 () Bool)

(assert (=> start!70814 m!764425))

(declare-fun m!764427 () Bool)

(assert (=> start!70814 m!764427))

(declare-fun m!764429 () Bool)

(assert (=> start!70814 m!764429))

(declare-fun m!764431 () Bool)

(assert (=> b!822530 m!764431))

(declare-fun m!764433 () Bool)

(assert (=> b!822530 m!764433))

(declare-fun m!764435 () Bool)

(assert (=> b!822530 m!764435))

(declare-fun m!764437 () Bool)

(assert (=> mapNonEmpty!23782 m!764437))

(declare-fun m!764439 () Bool)

(assert (=> b!822532 m!764439))

(check-sat (not b!822526) (not start!70814) (not b!822529) tp_is_empty!14781 (not b!822532) (not b_next!13071) (not b!822530) b_and!21943 (not mapNonEmpty!23782))
(check-sat b_and!21943 (not b_next!13071))
