; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70306 () Bool)

(assert start!70306)

(declare-fun b_free!12681 () Bool)

(declare-fun b_next!12681 () Bool)

(assert (=> start!70306 (= b_free!12681 (not b_next!12681))))

(declare-fun tp!44767 () Bool)

(declare-fun b_and!21481 () Bool)

(assert (=> start!70306 (= tp!44767 b_and!21481)))

(declare-fun b!816799 () Bool)

(declare-fun res!557630 () Bool)

(declare-fun e!453149 () Bool)

(assert (=> b!816799 (=> (not res!557630) (not e!453149))))

(declare-datatypes ((array!44980 0))(
  ( (array!44981 (arr!21547 (Array (_ BitVec 32) (_ BitVec 64))) (size!21968 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44980)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44980 (_ BitVec 32)) Bool)

(assert (=> b!816799 (= res!557630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816800 () Bool)

(declare-fun res!557627 () Bool)

(assert (=> b!816800 (=> (not res!557627) (not e!453149))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!24189 0))(
  ( (V!24190 (val!7243 Int)) )
))
(declare-datatypes ((ValueCell!6780 0))(
  ( (ValueCellFull!6780 (v!9671 V!24189)) (EmptyCell!6780) )
))
(declare-datatypes ((array!44982 0))(
  ( (array!44983 (arr!21548 (Array (_ BitVec 32) ValueCell!6780)) (size!21969 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44982)

(assert (=> b!816800 (= res!557627 (and (= (size!21969 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21968 _keys!976) (size!21969 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816801 () Bool)

(declare-fun e!453153 () Bool)

(declare-fun e!453150 () Bool)

(declare-fun mapRes!23176 () Bool)

(assert (=> b!816801 (= e!453153 (and e!453150 mapRes!23176))))

(declare-fun condMapEmpty!23176 () Bool)

(declare-fun mapDefault!23176 () ValueCell!6780)

(assert (=> b!816801 (= condMapEmpty!23176 (= (arr!21548 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6780)) mapDefault!23176)))))

(declare-fun b!816802 () Bool)

(declare-fun e!453151 () Bool)

(declare-fun tp_is_empty!14391 () Bool)

(assert (=> b!816802 (= e!453151 tp_is_empty!14391)))

(declare-fun b!816803 () Bool)

(declare-fun e!453154 () Bool)

(assert (=> b!816803 (= e!453154 true)))

(declare-fun zeroValueAfter!34 () V!24189)

(declare-fun minValue!754 () V!24189)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9518 0))(
  ( (tuple2!9519 (_1!4770 (_ BitVec 64)) (_2!4770 V!24189)) )
))
(declare-datatypes ((List!15346 0))(
  ( (Nil!15343) (Cons!15342 (h!16471 tuple2!9518) (t!21669 List!15346)) )
))
(declare-datatypes ((ListLongMap!8341 0))(
  ( (ListLongMap!8342 (toList!4186 List!15346)) )
))
(declare-fun lt!365898 () ListLongMap!8341)

(declare-fun getCurrentListMap!2411 (array!44980 array!44982 (_ BitVec 32) (_ BitVec 32) V!24189 V!24189 (_ BitVec 32) Int) ListLongMap!8341)

(assert (=> b!816803 (= lt!365898 (getCurrentListMap!2411 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24189)

(declare-fun lt!365901 () ListLongMap!8341)

(declare-fun +!1817 (ListLongMap!8341 tuple2!9518) ListLongMap!8341)

(assert (=> b!816803 (= lt!365901 (+!1817 (getCurrentListMap!2411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816804 () Bool)

(assert (=> b!816804 (= e!453150 tp_is_empty!14391)))

(declare-fun res!557631 () Bool)

(assert (=> start!70306 (=> (not res!557631) (not e!453149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70306 (= res!557631 (validMask!0 mask!1312))))

(assert (=> start!70306 e!453149))

(assert (=> start!70306 tp_is_empty!14391))

(declare-fun array_inv!17237 (array!44980) Bool)

(assert (=> start!70306 (array_inv!17237 _keys!976)))

(assert (=> start!70306 true))

(declare-fun array_inv!17238 (array!44982) Bool)

(assert (=> start!70306 (and (array_inv!17238 _values!788) e!453153)))

(assert (=> start!70306 tp!44767))

(declare-fun b!816805 () Bool)

(declare-fun res!557628 () Bool)

(assert (=> b!816805 (=> (not res!557628) (not e!453149))))

(declare-datatypes ((List!15347 0))(
  ( (Nil!15344) (Cons!15343 (h!16472 (_ BitVec 64)) (t!21670 List!15347)) )
))
(declare-fun arrayNoDuplicates!0 (array!44980 (_ BitVec 32) List!15347) Bool)

(assert (=> b!816805 (= res!557628 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15344))))

(declare-fun mapIsEmpty!23176 () Bool)

(assert (=> mapIsEmpty!23176 mapRes!23176))

(declare-fun mapNonEmpty!23176 () Bool)

(declare-fun tp!44766 () Bool)

(assert (=> mapNonEmpty!23176 (= mapRes!23176 (and tp!44766 e!453151))))

(declare-fun mapValue!23176 () ValueCell!6780)

(declare-fun mapRest!23176 () (Array (_ BitVec 32) ValueCell!6780))

(declare-fun mapKey!23176 () (_ BitVec 32))

(assert (=> mapNonEmpty!23176 (= (arr!21548 _values!788) (store mapRest!23176 mapKey!23176 mapValue!23176))))

(declare-fun b!816806 () Bool)

(assert (=> b!816806 (= e!453149 (not e!453154))))

(declare-fun res!557629 () Bool)

(assert (=> b!816806 (=> res!557629 e!453154)))

(assert (=> b!816806 (= res!557629 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365902 () ListLongMap!8341)

(declare-fun lt!365899 () ListLongMap!8341)

(assert (=> b!816806 (= lt!365902 lt!365899)))

(declare-datatypes ((Unit!27856 0))(
  ( (Unit!27857) )
))
(declare-fun lt!365900 () Unit!27856)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!338 (array!44980 array!44982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24189 V!24189 V!24189 V!24189 (_ BitVec 32) Int) Unit!27856)

(assert (=> b!816806 (= lt!365900 (lemmaNoChangeToArrayThenSameMapNoExtras!338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2228 (array!44980 array!44982 (_ BitVec 32) (_ BitVec 32) V!24189 V!24189 (_ BitVec 32) Int) ListLongMap!8341)

(assert (=> b!816806 (= lt!365899 (getCurrentListMapNoExtraKeys!2228 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816806 (= lt!365902 (getCurrentListMapNoExtraKeys!2228 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70306 res!557631) b!816800))

(assert (= (and b!816800 res!557627) b!816799))

(assert (= (and b!816799 res!557630) b!816805))

(assert (= (and b!816805 res!557628) b!816806))

(assert (= (and b!816806 (not res!557629)) b!816803))

(assert (= (and b!816801 condMapEmpty!23176) mapIsEmpty!23176))

(assert (= (and b!816801 (not condMapEmpty!23176)) mapNonEmpty!23176))

(get-info :version)

(assert (= (and mapNonEmpty!23176 ((_ is ValueCellFull!6780) mapValue!23176)) b!816802))

(assert (= (and b!816801 ((_ is ValueCellFull!6780) mapDefault!23176)) b!816804))

(assert (= start!70306 b!816801))

(declare-fun m!758431 () Bool)

(assert (=> start!70306 m!758431))

(declare-fun m!758433 () Bool)

(assert (=> start!70306 m!758433))

(declare-fun m!758435 () Bool)

(assert (=> start!70306 m!758435))

(declare-fun m!758437 () Bool)

(assert (=> mapNonEmpty!23176 m!758437))

(declare-fun m!758439 () Bool)

(assert (=> b!816803 m!758439))

(declare-fun m!758441 () Bool)

(assert (=> b!816803 m!758441))

(assert (=> b!816803 m!758441))

(declare-fun m!758443 () Bool)

(assert (=> b!816803 m!758443))

(declare-fun m!758445 () Bool)

(assert (=> b!816806 m!758445))

(declare-fun m!758447 () Bool)

(assert (=> b!816806 m!758447))

(declare-fun m!758449 () Bool)

(assert (=> b!816806 m!758449))

(declare-fun m!758451 () Bool)

(assert (=> b!816805 m!758451))

(declare-fun m!758453 () Bool)

(assert (=> b!816799 m!758453))

(check-sat tp_is_empty!14391 (not mapNonEmpty!23176) (not b_next!12681) (not b!816806) (not b!816799) (not start!70306) (not b!816805) b_and!21481 (not b!816803))
(check-sat b_and!21481 (not b_next!12681))
