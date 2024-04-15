; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70792 () Bool)

(assert start!70792)

(declare-fun b_free!13069 () Bool)

(declare-fun b_next!13069 () Bool)

(assert (=> start!70792 (= b_free!13069 (not b_next!13069))))

(declare-fun tp!45951 () Bool)

(declare-fun b_and!21915 () Bool)

(assert (=> start!70792 (= tp!45951 b_and!21915)))

(declare-fun b!822256 () Bool)

(declare-fun e!457157 () Bool)

(declare-fun tp_is_empty!14779 () Bool)

(assert (=> b!822256 (= e!457157 tp_is_empty!14779)))

(declare-fun mapIsEmpty!23779 () Bool)

(declare-fun mapRes!23779 () Bool)

(assert (=> mapIsEmpty!23779 mapRes!23779))

(declare-fun b!822258 () Bool)

(declare-fun e!457156 () Bool)

(assert (=> b!822258 (= e!457156 true)))

(declare-datatypes ((V!24707 0))(
  ( (V!24708 (val!7437 Int)) )
))
(declare-datatypes ((tuple2!9828 0))(
  ( (tuple2!9829 (_1!4925 (_ BitVec 64)) (_2!4925 V!24707)) )
))
(declare-datatypes ((List!15639 0))(
  ( (Nil!15636) (Cons!15635 (h!16764 tuple2!9828) (t!21967 List!15639)) )
))
(declare-datatypes ((ListLongMap!8641 0))(
  ( (ListLongMap!8642 (toList!4336 List!15639)) )
))
(declare-fun lt!369954 () ListLongMap!8641)

(declare-fun lt!369952 () ListLongMap!8641)

(declare-fun lt!369951 () tuple2!9828)

(declare-fun +!1915 (ListLongMap!8641 tuple2!9828) ListLongMap!8641)

(assert (=> b!822258 (= lt!369954 (+!1915 lt!369952 lt!369951))))

(declare-fun lt!369950 () ListLongMap!8641)

(declare-fun zeroValueAfter!34 () V!24707)

(declare-fun minValue!754 () V!24707)

(declare-datatypes ((Unit!28092 0))(
  ( (Unit!28093) )
))
(declare-fun lt!369945 () Unit!28092)

(declare-fun addCommutativeForDiffKeys!446 (ListLongMap!8641 (_ BitVec 64) V!24707 (_ BitVec 64) V!24707) Unit!28092)

(assert (=> b!822258 (= lt!369945 (addCommutativeForDiffKeys!446 lt!369950 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369953 () ListLongMap!8641)

(assert (=> b!822258 (= lt!369953 lt!369954)))

(declare-fun lt!369946 () tuple2!9828)

(assert (=> b!822258 (= lt!369954 (+!1915 (+!1915 lt!369950 lt!369951) lt!369946))))

(assert (=> b!822258 (= lt!369951 (tuple2!9829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369948 () ListLongMap!8641)

(assert (=> b!822258 (= lt!369948 lt!369952)))

(assert (=> b!822258 (= lt!369952 (+!1915 lt!369950 lt!369946))))

(assert (=> b!822258 (= lt!369946 (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45719 0))(
  ( (array!45720 (arr!21910 (Array (_ BitVec 32) (_ BitVec 64))) (size!22331 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45719)

(declare-datatypes ((ValueCell!6974 0))(
  ( (ValueCellFull!6974 (v!9862 V!24707)) (EmptyCell!6974) )
))
(declare-datatypes ((array!45721 0))(
  ( (array!45722 (arr!21911 (Array (_ BitVec 32) ValueCell!6974)) (size!22332 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45721)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2457 (array!45719 array!45721 (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 (_ BitVec 32) Int) ListLongMap!8641)

(assert (=> b!822258 (= lt!369953 (getCurrentListMap!2457 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24707)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822258 (= lt!369948 (getCurrentListMap!2457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23779 () Bool)

(declare-fun tp!45952 () Bool)

(declare-fun e!457158 () Bool)

(assert (=> mapNonEmpty!23779 (= mapRes!23779 (and tp!45952 e!457158))))

(declare-fun mapRest!23779 () (Array (_ BitVec 32) ValueCell!6974))

(declare-fun mapValue!23779 () ValueCell!6974)

(declare-fun mapKey!23779 () (_ BitVec 32))

(assert (=> mapNonEmpty!23779 (= (arr!21911 _values!788) (store mapRest!23779 mapKey!23779 mapValue!23779))))

(declare-fun b!822259 () Bool)

(assert (=> b!822259 (= e!457158 tp_is_empty!14779)))

(declare-fun b!822260 () Bool)

(declare-fun res!560887 () Bool)

(declare-fun e!457161 () Bool)

(assert (=> b!822260 (=> (not res!560887) (not e!457161))))

(declare-datatypes ((List!15640 0))(
  ( (Nil!15637) (Cons!15636 (h!16765 (_ BitVec 64)) (t!21968 List!15640)) )
))
(declare-fun arrayNoDuplicates!0 (array!45719 (_ BitVec 32) List!15640) Bool)

(assert (=> b!822260 (= res!560887 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15637))))

(declare-fun b!822261 () Bool)

(assert (=> b!822261 (= e!457161 (not e!457156))))

(declare-fun res!560884 () Bool)

(assert (=> b!822261 (=> res!560884 e!457156)))

(assert (=> b!822261 (= res!560884 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369947 () ListLongMap!8641)

(assert (=> b!822261 (= lt!369950 lt!369947)))

(declare-fun lt!369949 () Unit!28092)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!475 (array!45719 array!45721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 V!24707 V!24707 (_ BitVec 32) Int) Unit!28092)

(assert (=> b!822261 (= lt!369949 (lemmaNoChangeToArrayThenSameMapNoExtras!475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2382 (array!45719 array!45721 (_ BitVec 32) (_ BitVec 32) V!24707 V!24707 (_ BitVec 32) Int) ListLongMap!8641)

(assert (=> b!822261 (= lt!369947 (getCurrentListMapNoExtraKeys!2382 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822261 (= lt!369950 (getCurrentListMapNoExtraKeys!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822257 () Bool)

(declare-fun res!560886 () Bool)

(assert (=> b!822257 (=> (not res!560886) (not e!457161))))

(assert (=> b!822257 (= res!560886 (and (= (size!22332 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22331 _keys!976) (size!22332 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560885 () Bool)

(assert (=> start!70792 (=> (not res!560885) (not e!457161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70792 (= res!560885 (validMask!0 mask!1312))))

(assert (=> start!70792 e!457161))

(assert (=> start!70792 tp_is_empty!14779))

(declare-fun array_inv!17563 (array!45719) Bool)

(assert (=> start!70792 (array_inv!17563 _keys!976)))

(assert (=> start!70792 true))

(declare-fun e!457159 () Bool)

(declare-fun array_inv!17564 (array!45721) Bool)

(assert (=> start!70792 (and (array_inv!17564 _values!788) e!457159)))

(assert (=> start!70792 tp!45951))

(declare-fun b!822262 () Bool)

(declare-fun res!560888 () Bool)

(assert (=> b!822262 (=> (not res!560888) (not e!457161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45719 (_ BitVec 32)) Bool)

(assert (=> b!822262 (= res!560888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822263 () Bool)

(assert (=> b!822263 (= e!457159 (and e!457157 mapRes!23779))))

(declare-fun condMapEmpty!23779 () Bool)

(declare-fun mapDefault!23779 () ValueCell!6974)

(assert (=> b!822263 (= condMapEmpty!23779 (= (arr!21911 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6974)) mapDefault!23779)))))

(assert (= (and start!70792 res!560885) b!822257))

(assert (= (and b!822257 res!560886) b!822262))

(assert (= (and b!822262 res!560888) b!822260))

(assert (= (and b!822260 res!560887) b!822261))

(assert (= (and b!822261 (not res!560884)) b!822258))

(assert (= (and b!822263 condMapEmpty!23779) mapIsEmpty!23779))

(assert (= (and b!822263 (not condMapEmpty!23779)) mapNonEmpty!23779))

(get-info :version)

(assert (= (and mapNonEmpty!23779 ((_ is ValueCellFull!6974) mapValue!23779)) b!822259))

(assert (= (and b!822263 ((_ is ValueCellFull!6974) mapDefault!23779)) b!822256))

(assert (= start!70792 b!822263))

(declare-fun m!763625 () Bool)

(assert (=> b!822260 m!763625))

(declare-fun m!763627 () Bool)

(assert (=> b!822258 m!763627))

(declare-fun m!763629 () Bool)

(assert (=> b!822258 m!763629))

(declare-fun m!763631 () Bool)

(assert (=> b!822258 m!763631))

(declare-fun m!763633 () Bool)

(assert (=> b!822258 m!763633))

(declare-fun m!763635 () Bool)

(assert (=> b!822258 m!763635))

(declare-fun m!763637 () Bool)

(assert (=> b!822258 m!763637))

(assert (=> b!822258 m!763633))

(declare-fun m!763639 () Bool)

(assert (=> b!822258 m!763639))

(declare-fun m!763641 () Bool)

(assert (=> mapNonEmpty!23779 m!763641))

(declare-fun m!763643 () Bool)

(assert (=> b!822261 m!763643))

(declare-fun m!763645 () Bool)

(assert (=> b!822261 m!763645))

(declare-fun m!763647 () Bool)

(assert (=> b!822261 m!763647))

(declare-fun m!763649 () Bool)

(assert (=> b!822262 m!763649))

(declare-fun m!763651 () Bool)

(assert (=> start!70792 m!763651))

(declare-fun m!763653 () Bool)

(assert (=> start!70792 m!763653))

(declare-fun m!763655 () Bool)

(assert (=> start!70792 m!763655))

(check-sat (not mapNonEmpty!23779) (not b!822261) b_and!21915 tp_is_empty!14779 (not b!822262) (not b!822258) (not b_next!13069) (not b!822260) (not start!70792))
(check-sat b_and!21915 (not b_next!13069))
