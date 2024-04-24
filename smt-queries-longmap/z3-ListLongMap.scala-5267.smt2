; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70902 () Bool)

(assert start!70902)

(declare-fun b_free!13009 () Bool)

(declare-fun b_next!13009 () Bool)

(assert (=> start!70902 (= b_free!13009 (not b_next!13009))))

(declare-fun tp!45769 () Bool)

(declare-fun b_and!21881 () Bool)

(assert (=> start!70902 (= tp!45769 b_and!21881)))

(declare-fun b!822519 () Bool)

(declare-fun e!457245 () Bool)

(declare-fun e!457241 () Bool)

(declare-fun mapRes!23686 () Bool)

(assert (=> b!822519 (= e!457245 (and e!457241 mapRes!23686))))

(declare-fun condMapEmpty!23686 () Bool)

(declare-datatypes ((V!24627 0))(
  ( (V!24628 (val!7407 Int)) )
))
(declare-datatypes ((ValueCell!6944 0))(
  ( (ValueCellFull!6944 (v!9838 V!24627)) (EmptyCell!6944) )
))
(declare-datatypes ((array!45635 0))(
  ( (array!45636 (arr!21864 (Array (_ BitVec 32) ValueCell!6944)) (size!22284 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45635)

(declare-fun mapDefault!23686 () ValueCell!6944)

(assert (=> b!822519 (= condMapEmpty!23686 (= (arr!21864 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6944)) mapDefault!23686)))))

(declare-fun b!822520 () Bool)

(declare-fun res!560819 () Bool)

(declare-fun e!457244 () Bool)

(assert (=> b!822520 (=> (not res!560819) (not e!457244))))

(declare-datatypes ((array!45637 0))(
  ( (array!45638 (arr!21865 (Array (_ BitVec 32) (_ BitVec 64))) (size!22285 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45637)

(declare-datatypes ((List!15482 0))(
  ( (Nil!15479) (Cons!15478 (h!16613 (_ BitVec 64)) (t!21809 List!15482)) )
))
(declare-fun arrayNoDuplicates!0 (array!45637 (_ BitVec 32) List!15482) Bool)

(assert (=> b!822520 (= res!560819 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15479))))

(declare-fun b!822521 () Bool)

(declare-fun res!560821 () Bool)

(assert (=> b!822521 (=> (not res!560821) (not e!457244))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822521 (= res!560821 (and (= (size!22284 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22285 _keys!976) (size!22284 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822522 () Bool)

(declare-fun e!457246 () Bool)

(declare-fun tp_is_empty!14719 () Bool)

(assert (=> b!822522 (= e!457246 tp_is_empty!14719)))

(declare-fun b!822523 () Bool)

(assert (=> b!822523 (= e!457241 tp_is_empty!14719)))

(declare-fun b!822524 () Bool)

(declare-fun res!560823 () Bool)

(assert (=> b!822524 (=> (not res!560823) (not e!457244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45637 (_ BitVec 32)) Bool)

(assert (=> b!822524 (= res!560823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822525 () Bool)

(declare-fun e!457242 () Bool)

(assert (=> b!822525 (= e!457244 (not e!457242))))

(declare-fun res!560822 () Bool)

(assert (=> b!822525 (=> res!560822 e!457242)))

(assert (=> b!822525 (= res!560822 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9690 0))(
  ( (tuple2!9691 (_1!4856 (_ BitVec 64)) (_2!4856 V!24627)) )
))
(declare-datatypes ((List!15483 0))(
  ( (Nil!15480) (Cons!15479 (h!16614 tuple2!9690) (t!21810 List!15483)) )
))
(declare-datatypes ((ListLongMap!8515 0))(
  ( (ListLongMap!8516 (toList!4273 List!15483)) )
))
(declare-fun lt!369671 () ListLongMap!8515)

(declare-fun lt!369670 () ListLongMap!8515)

(assert (=> b!822525 (= lt!369671 lt!369670)))

(declare-fun zeroValueBefore!34 () V!24627)

(declare-fun zeroValueAfter!34 () V!24627)

(declare-fun minValue!754 () V!24627)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28096 0))(
  ( (Unit!28097) )
))
(declare-fun lt!369669 () Unit!28096)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!451 (array!45637 array!45635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24627 V!24627 V!24627 V!24627 (_ BitVec 32) Int) Unit!28096)

(assert (=> b!822525 (= lt!369669 (lemmaNoChangeToArrayThenSameMapNoExtras!451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2363 (array!45637 array!45635 (_ BitVec 32) (_ BitVec 32) V!24627 V!24627 (_ BitVec 32) Int) ListLongMap!8515)

(assert (=> b!822525 (= lt!369670 (getCurrentListMapNoExtraKeys!2363 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822525 (= lt!369671 (getCurrentListMapNoExtraKeys!2363 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822526 () Bool)

(assert (=> b!822526 (= e!457242 true)))

(declare-fun lt!369668 () ListLongMap!8515)

(declare-fun getCurrentListMap!2429 (array!45637 array!45635 (_ BitVec 32) (_ BitVec 32) V!24627 V!24627 (_ BitVec 32) Int) ListLongMap!8515)

(assert (=> b!822526 (= lt!369668 (getCurrentListMap!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560820 () Bool)

(assert (=> start!70902 (=> (not res!560820) (not e!457244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70902 (= res!560820 (validMask!0 mask!1312))))

(assert (=> start!70902 e!457244))

(assert (=> start!70902 tp_is_empty!14719))

(declare-fun array_inv!17499 (array!45637) Bool)

(assert (=> start!70902 (array_inv!17499 _keys!976)))

(assert (=> start!70902 true))

(declare-fun array_inv!17500 (array!45635) Bool)

(assert (=> start!70902 (and (array_inv!17500 _values!788) e!457245)))

(assert (=> start!70902 tp!45769))

(declare-fun mapIsEmpty!23686 () Bool)

(assert (=> mapIsEmpty!23686 mapRes!23686))

(declare-fun mapNonEmpty!23686 () Bool)

(declare-fun tp!45768 () Bool)

(assert (=> mapNonEmpty!23686 (= mapRes!23686 (and tp!45768 e!457246))))

(declare-fun mapValue!23686 () ValueCell!6944)

(declare-fun mapKey!23686 () (_ BitVec 32))

(declare-fun mapRest!23686 () (Array (_ BitVec 32) ValueCell!6944))

(assert (=> mapNonEmpty!23686 (= (arr!21864 _values!788) (store mapRest!23686 mapKey!23686 mapValue!23686))))

(assert (= (and start!70902 res!560820) b!822521))

(assert (= (and b!822521 res!560821) b!822524))

(assert (= (and b!822524 res!560823) b!822520))

(assert (= (and b!822520 res!560819) b!822525))

(assert (= (and b!822525 (not res!560822)) b!822526))

(assert (= (and b!822519 condMapEmpty!23686) mapIsEmpty!23686))

(assert (= (and b!822519 (not condMapEmpty!23686)) mapNonEmpty!23686))

(get-info :version)

(assert (= (and mapNonEmpty!23686 ((_ is ValueCellFull!6944) mapValue!23686)) b!822522))

(assert (= (and b!822519 ((_ is ValueCellFull!6944) mapDefault!23686)) b!822523))

(assert (= start!70902 b!822519))

(declare-fun m!764671 () Bool)

(assert (=> b!822526 m!764671))

(declare-fun m!764673 () Bool)

(assert (=> b!822525 m!764673))

(declare-fun m!764675 () Bool)

(assert (=> b!822525 m!764675))

(declare-fun m!764677 () Bool)

(assert (=> b!822525 m!764677))

(declare-fun m!764679 () Bool)

(assert (=> mapNonEmpty!23686 m!764679))

(declare-fun m!764681 () Bool)

(assert (=> b!822524 m!764681))

(declare-fun m!764683 () Bool)

(assert (=> b!822520 m!764683))

(declare-fun m!764685 () Bool)

(assert (=> start!70902 m!764685))

(declare-fun m!764687 () Bool)

(assert (=> start!70902 m!764687))

(declare-fun m!764689 () Bool)

(assert (=> start!70902 m!764689))

(check-sat b_and!21881 (not mapNonEmpty!23686) (not b!822526) (not b!822520) tp_is_empty!14719 (not start!70902) (not b_next!13009) (not b!822524) (not b!822525))
(check-sat b_and!21881 (not b_next!13009))
