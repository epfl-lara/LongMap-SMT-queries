; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70940 () Bool)

(assert start!70940)

(declare-fun b_free!13177 () Bool)

(declare-fun b_next!13177 () Bool)

(assert (=> start!70940 (= b_free!13177 (not b_next!13177))))

(declare-fun tp!46282 () Bool)

(declare-fun b_and!22047 () Bool)

(assert (=> start!70940 (= tp!46282 b_and!22047)))

(declare-fun mapIsEmpty!23947 () Bool)

(declare-fun mapRes!23947 () Bool)

(assert (=> mapIsEmpty!23947 mapRes!23947))

(declare-fun b!823849 () Bool)

(declare-fun e!458291 () Bool)

(declare-fun e!458289 () Bool)

(assert (=> b!823849 (= e!458291 (and e!458289 mapRes!23947))))

(declare-fun condMapEmpty!23947 () Bool)

(declare-datatypes ((V!24851 0))(
  ( (V!24852 (val!7491 Int)) )
))
(declare-datatypes ((ValueCell!7028 0))(
  ( (ValueCellFull!7028 (v!9918 V!24851)) (EmptyCell!7028) )
))
(declare-datatypes ((array!45933 0))(
  ( (array!45934 (arr!22015 (Array (_ BitVec 32) ValueCell!7028)) (size!22436 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45933)

(declare-fun mapDefault!23947 () ValueCell!7028)

(assert (=> b!823849 (= condMapEmpty!23947 (= (arr!22015 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7028)) mapDefault!23947)))))

(declare-fun b!823850 () Bool)

(declare-fun res!561787 () Bool)

(declare-fun e!458290 () Bool)

(assert (=> b!823850 (=> (not res!561787) (not e!458290))))

(declare-datatypes ((array!45935 0))(
  ( (array!45936 (arr!22016 (Array (_ BitVec 32) (_ BitVec 64))) (size!22437 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45935)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45935 (_ BitVec 32)) Bool)

(assert (=> b!823850 (= res!561787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823851 () Bool)

(declare-fun res!561790 () Bool)

(assert (=> b!823851 (=> (not res!561790) (not e!458290))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823851 (= res!561790 (and (= (size!22436 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22437 _keys!976) (size!22436 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823852 () Bool)

(declare-fun e!458293 () Bool)

(declare-fun tp_is_empty!14887 () Bool)

(assert (=> b!823852 (= e!458293 tp_is_empty!14887)))

(declare-fun b!823854 () Bool)

(declare-fun res!561788 () Bool)

(assert (=> b!823854 (=> (not res!561788) (not e!458290))))

(declare-datatypes ((List!15715 0))(
  ( (Nil!15712) (Cons!15711 (h!16840 (_ BitVec 64)) (t!22047 List!15715)) )
))
(declare-fun arrayNoDuplicates!0 (array!45935 (_ BitVec 32) List!15715) Bool)

(assert (=> b!823854 (= res!561788 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15712))))

(declare-fun b!823855 () Bool)

(assert (=> b!823855 (= e!458289 tp_is_empty!14887)))

(declare-fun mapNonEmpty!23947 () Bool)

(declare-fun tp!46281 () Bool)

(assert (=> mapNonEmpty!23947 (= mapRes!23947 (and tp!46281 e!458293))))

(declare-fun mapRest!23947 () (Array (_ BitVec 32) ValueCell!7028))

(declare-fun mapKey!23947 () (_ BitVec 32))

(declare-fun mapValue!23947 () ValueCell!7028)

(assert (=> mapNonEmpty!23947 (= (arr!22015 _values!788) (store mapRest!23947 mapKey!23947 mapValue!23947))))

(declare-fun b!823853 () Bool)

(assert (=> b!823853 (= e!458290 (not true))))

(declare-datatypes ((tuple2!9916 0))(
  ( (tuple2!9917 (_1!4969 (_ BitVec 64)) (_2!4969 V!24851)) )
))
(declare-datatypes ((List!15716 0))(
  ( (Nil!15713) (Cons!15712 (h!16841 tuple2!9916) (t!22048 List!15716)) )
))
(declare-datatypes ((ListLongMap!8729 0))(
  ( (ListLongMap!8730 (toList!4380 List!15716)) )
))
(declare-fun lt!371421 () ListLongMap!8729)

(declare-fun lt!371422 () ListLongMap!8729)

(assert (=> b!823853 (= lt!371421 lt!371422)))

(declare-fun zeroValueBefore!34 () V!24851)

(declare-fun zeroValueAfter!34 () V!24851)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24851)

(declare-datatypes ((Unit!28184 0))(
  ( (Unit!28185) )
))
(declare-fun lt!371420 () Unit!28184)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!517 (array!45935 array!45933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24851 V!24851 V!24851 V!24851 (_ BitVec 32) Int) Unit!28184)

(assert (=> b!823853 (= lt!371420 (lemmaNoChangeToArrayThenSameMapNoExtras!517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2424 (array!45935 array!45933 (_ BitVec 32) (_ BitVec 32) V!24851 V!24851 (_ BitVec 32) Int) ListLongMap!8729)

(assert (=> b!823853 (= lt!371422 (getCurrentListMapNoExtraKeys!2424 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823853 (= lt!371421 (getCurrentListMapNoExtraKeys!2424 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561789 () Bool)

(assert (=> start!70940 (=> (not res!561789) (not e!458290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70940 (= res!561789 (validMask!0 mask!1312))))

(assert (=> start!70940 e!458290))

(assert (=> start!70940 tp_is_empty!14887))

(declare-fun array_inv!17633 (array!45935) Bool)

(assert (=> start!70940 (array_inv!17633 _keys!976)))

(assert (=> start!70940 true))

(declare-fun array_inv!17634 (array!45933) Bool)

(assert (=> start!70940 (and (array_inv!17634 _values!788) e!458291)))

(assert (=> start!70940 tp!46282))

(assert (= (and start!70940 res!561789) b!823851))

(assert (= (and b!823851 res!561790) b!823850))

(assert (= (and b!823850 res!561787) b!823854))

(assert (= (and b!823854 res!561788) b!823853))

(assert (= (and b!823849 condMapEmpty!23947) mapIsEmpty!23947))

(assert (= (and b!823849 (not condMapEmpty!23947)) mapNonEmpty!23947))

(get-info :version)

(assert (= (and mapNonEmpty!23947 ((_ is ValueCellFull!7028) mapValue!23947)) b!823852))

(assert (= (and b!823849 ((_ is ValueCellFull!7028) mapDefault!23947)) b!823855))

(assert (= start!70940 b!823849))

(declare-fun m!765491 () Bool)

(assert (=> mapNonEmpty!23947 m!765491))

(declare-fun m!765493 () Bool)

(assert (=> start!70940 m!765493))

(declare-fun m!765495 () Bool)

(assert (=> start!70940 m!765495))

(declare-fun m!765497 () Bool)

(assert (=> start!70940 m!765497))

(declare-fun m!765499 () Bool)

(assert (=> b!823853 m!765499))

(declare-fun m!765501 () Bool)

(assert (=> b!823853 m!765501))

(declare-fun m!765503 () Bool)

(assert (=> b!823853 m!765503))

(declare-fun m!765505 () Bool)

(assert (=> b!823850 m!765505))

(declare-fun m!765507 () Bool)

(assert (=> b!823854 m!765507))

(check-sat tp_is_empty!14887 (not b_next!13177) (not start!70940) (not b!823850) b_and!22047 (not b!823853) (not mapNonEmpty!23947) (not b!823854))
(check-sat b_and!22047 (not b_next!13177))
