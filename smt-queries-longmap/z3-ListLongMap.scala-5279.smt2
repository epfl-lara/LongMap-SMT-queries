; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70846 () Bool)

(assert start!70846)

(declare-fun b_free!13083 () Bool)

(declare-fun b_next!13083 () Bool)

(assert (=> start!70846 (= b_free!13083 (not b_next!13083))))

(declare-fun tp!45996 () Bool)

(declare-fun b_and!21967 () Bool)

(assert (=> start!70846 (= tp!45996 b_and!21967)))

(declare-fun b!822851 () Bool)

(declare-fun e!457547 () Bool)

(declare-fun tp_is_empty!14793 () Bool)

(assert (=> b!822851 (= e!457547 tp_is_empty!14793)))

(declare-fun res!561174 () Bool)

(declare-fun e!457550 () Bool)

(assert (=> start!70846 (=> (not res!561174) (not e!457550))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70846 (= res!561174 (validMask!0 mask!1312))))

(assert (=> start!70846 e!457550))

(assert (=> start!70846 tp_is_empty!14793))

(declare-datatypes ((array!45780 0))(
  ( (array!45781 (arr!21939 (Array (_ BitVec 32) (_ BitVec 64))) (size!22360 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45780)

(declare-fun array_inv!17525 (array!45780) Bool)

(assert (=> start!70846 (array_inv!17525 _keys!976)))

(assert (=> start!70846 true))

(declare-datatypes ((V!24725 0))(
  ( (V!24726 (val!7444 Int)) )
))
(declare-datatypes ((ValueCell!6981 0))(
  ( (ValueCellFull!6981 (v!9876 V!24725)) (EmptyCell!6981) )
))
(declare-datatypes ((array!45782 0))(
  ( (array!45783 (arr!21940 (Array (_ BitVec 32) ValueCell!6981)) (size!22361 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45782)

(declare-fun e!457546 () Bool)

(declare-fun array_inv!17526 (array!45782) Bool)

(assert (=> start!70846 (and (array_inv!17526 _values!788) e!457546)))

(assert (=> start!70846 tp!45996))

(declare-fun mapNonEmpty!23803 () Bool)

(declare-fun mapRes!23803 () Bool)

(declare-fun tp!45997 () Bool)

(assert (=> mapNonEmpty!23803 (= mapRes!23803 (and tp!45997 e!457547))))

(declare-fun mapValue!23803 () ValueCell!6981)

(declare-fun mapKey!23803 () (_ BitVec 32))

(declare-fun mapRest!23803 () (Array (_ BitVec 32) ValueCell!6981))

(assert (=> mapNonEmpty!23803 (= (arr!21940 _values!788) (store mapRest!23803 mapKey!23803 mapValue!23803))))

(declare-fun b!822852 () Bool)

(declare-fun e!457545 () Bool)

(assert (=> b!822852 (= e!457545 tp_is_empty!14793)))

(declare-fun b!822853 () Bool)

(assert (=> b!822853 (= e!457546 (and e!457545 mapRes!23803))))

(declare-fun condMapEmpty!23803 () Bool)

(declare-fun mapDefault!23803 () ValueCell!6981)

(assert (=> b!822853 (= condMapEmpty!23803 (= (arr!21940 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6981)) mapDefault!23803)))))

(declare-fun b!822854 () Bool)

(declare-fun e!457548 () Bool)

(assert (=> b!822854 (= e!457550 (not e!457548))))

(declare-fun res!561178 () Bool)

(assert (=> b!822854 (=> res!561178 e!457548)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822854 (= res!561178 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9834 0))(
  ( (tuple2!9835 (_1!4928 (_ BitVec 64)) (_2!4928 V!24725)) )
))
(declare-datatypes ((List!15649 0))(
  ( (Nil!15646) (Cons!15645 (h!16774 tuple2!9834) (t!21988 List!15649)) )
))
(declare-datatypes ((ListLongMap!8657 0))(
  ( (ListLongMap!8658 (toList!4344 List!15649)) )
))
(declare-fun lt!370553 () ListLongMap!8657)

(declare-fun lt!370561 () ListLongMap!8657)

(assert (=> b!822854 (= lt!370553 lt!370561)))

(declare-fun zeroValueBefore!34 () V!24725)

(declare-fun minValue!754 () V!24725)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24725)

(declare-datatypes ((Unit!28154 0))(
  ( (Unit!28155) )
))
(declare-fun lt!370562 () Unit!28154)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!472 (array!45780 array!45782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24725 V!24725 V!24725 V!24725 (_ BitVec 32) Int) Unit!28154)

(assert (=> b!822854 (= lt!370562 (lemmaNoChangeToArrayThenSameMapNoExtras!472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2362 (array!45780 array!45782 (_ BitVec 32) (_ BitVec 32) V!24725 V!24725 (_ BitVec 32) Int) ListLongMap!8657)

(assert (=> b!822854 (= lt!370561 (getCurrentListMapNoExtraKeys!2362 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822854 (= lt!370553 (getCurrentListMapNoExtraKeys!2362 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822855 () Bool)

(assert (=> b!822855 (= e!457548 true)))

(declare-fun lt!370560 () ListLongMap!8657)

(declare-fun lt!370559 () ListLongMap!8657)

(declare-fun lt!370555 () tuple2!9834)

(declare-fun +!1894 (ListLongMap!8657 tuple2!9834) ListLongMap!8657)

(assert (=> b!822855 (= lt!370560 (+!1894 lt!370559 lt!370555))))

(declare-fun lt!370556 () Unit!28154)

(declare-fun addCommutativeForDiffKeys!457 (ListLongMap!8657 (_ BitVec 64) V!24725 (_ BitVec 64) V!24725) Unit!28154)

(assert (=> b!822855 (= lt!370556 (addCommutativeForDiffKeys!457 lt!370553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370557 () ListLongMap!8657)

(assert (=> b!822855 (= lt!370557 lt!370560)))

(declare-fun lt!370554 () tuple2!9834)

(assert (=> b!822855 (= lt!370560 (+!1894 (+!1894 lt!370553 lt!370555) lt!370554))))

(assert (=> b!822855 (= lt!370555 (tuple2!9835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370558 () ListLongMap!8657)

(assert (=> b!822855 (= lt!370558 lt!370559)))

(assert (=> b!822855 (= lt!370559 (+!1894 lt!370553 lt!370554))))

(assert (=> b!822855 (= lt!370554 (tuple2!9835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2508 (array!45780 array!45782 (_ BitVec 32) (_ BitVec 32) V!24725 V!24725 (_ BitVec 32) Int) ListLongMap!8657)

(assert (=> b!822855 (= lt!370557 (getCurrentListMap!2508 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822855 (= lt!370558 (getCurrentListMap!2508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822856 () Bool)

(declare-fun res!561177 () Bool)

(assert (=> b!822856 (=> (not res!561177) (not e!457550))))

(assert (=> b!822856 (= res!561177 (and (= (size!22361 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22360 _keys!976) (size!22361 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822857 () Bool)

(declare-fun res!561176 () Bool)

(assert (=> b!822857 (=> (not res!561176) (not e!457550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45780 (_ BitVec 32)) Bool)

(assert (=> b!822857 (= res!561176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822858 () Bool)

(declare-fun res!561175 () Bool)

(assert (=> b!822858 (=> (not res!561175) (not e!457550))))

(declare-datatypes ((List!15650 0))(
  ( (Nil!15647) (Cons!15646 (h!16775 (_ BitVec 64)) (t!21989 List!15650)) )
))
(declare-fun arrayNoDuplicates!0 (array!45780 (_ BitVec 32) List!15650) Bool)

(assert (=> b!822858 (= res!561175 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15647))))

(declare-fun mapIsEmpty!23803 () Bool)

(assert (=> mapIsEmpty!23803 mapRes!23803))

(assert (= (and start!70846 res!561174) b!822856))

(assert (= (and b!822856 res!561177) b!822857))

(assert (= (and b!822857 res!561176) b!822858))

(assert (= (and b!822858 res!561175) b!822854))

(assert (= (and b!822854 (not res!561178)) b!822855))

(assert (= (and b!822853 condMapEmpty!23803) mapIsEmpty!23803))

(assert (= (and b!822853 (not condMapEmpty!23803)) mapNonEmpty!23803))

(get-info :version)

(assert (= (and mapNonEmpty!23803 ((_ is ValueCellFull!6981) mapValue!23803)) b!822851))

(assert (= (and b!822853 ((_ is ValueCellFull!6981) mapDefault!23803)) b!822852))

(assert (= start!70846 b!822853))

(declare-fun m!764817 () Bool)

(assert (=> b!822857 m!764817))

(declare-fun m!764819 () Bool)

(assert (=> b!822854 m!764819))

(declare-fun m!764821 () Bool)

(assert (=> b!822854 m!764821))

(declare-fun m!764823 () Bool)

(assert (=> b!822854 m!764823))

(declare-fun m!764825 () Bool)

(assert (=> mapNonEmpty!23803 m!764825))

(declare-fun m!764827 () Bool)

(assert (=> b!822855 m!764827))

(declare-fun m!764829 () Bool)

(assert (=> b!822855 m!764829))

(declare-fun m!764831 () Bool)

(assert (=> b!822855 m!764831))

(declare-fun m!764833 () Bool)

(assert (=> b!822855 m!764833))

(declare-fun m!764835 () Bool)

(assert (=> b!822855 m!764835))

(declare-fun m!764837 () Bool)

(assert (=> b!822855 m!764837))

(assert (=> b!822855 m!764833))

(declare-fun m!764839 () Bool)

(assert (=> b!822855 m!764839))

(declare-fun m!764841 () Bool)

(assert (=> start!70846 m!764841))

(declare-fun m!764843 () Bool)

(assert (=> start!70846 m!764843))

(declare-fun m!764845 () Bool)

(assert (=> start!70846 m!764845))

(declare-fun m!764847 () Bool)

(assert (=> b!822858 m!764847))

(check-sat (not b!822858) tp_is_empty!14793 (not mapNonEmpty!23803) (not b!822855) (not b!822854) (not b_next!13083) (not b!822857) b_and!21967 (not start!70846))
(check-sat b_and!21967 (not b_next!13083))
