; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70674 () Bool)

(assert start!70674)

(declare-fun b_free!12967 () Bool)

(declare-fun b_next!12967 () Bool)

(assert (=> start!70674 (= b_free!12967 (not b_next!12967))))

(declare-fun tp!45643 () Bool)

(declare-fun b_and!21803 () Bool)

(assert (=> start!70674 (= tp!45643 b_and!21803)))

(declare-fun b!820875 () Bool)

(declare-fun e!456138 () Bool)

(declare-fun e!456136 () Bool)

(declare-fun mapRes!23623 () Bool)

(assert (=> b!820875 (= e!456138 (and e!456136 mapRes!23623))))

(declare-fun condMapEmpty!23623 () Bool)

(declare-datatypes ((V!24571 0))(
  ( (V!24572 (val!7386 Int)) )
))
(declare-datatypes ((ValueCell!6923 0))(
  ( (ValueCellFull!6923 (v!9811 V!24571)) (EmptyCell!6923) )
))
(declare-datatypes ((array!45523 0))(
  ( (array!45524 (arr!21813 (Array (_ BitVec 32) ValueCell!6923)) (size!22234 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45523)

(declare-fun mapDefault!23623 () ValueCell!6923)

(assert (=> b!820875 (= condMapEmpty!23623 (= (arr!21813 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6923)) mapDefault!23623)))))

(declare-fun b!820876 () Bool)

(declare-fun res!560053 () Bool)

(declare-fun e!456135 () Bool)

(assert (=> b!820876 (=> (not res!560053) (not e!456135))))

(declare-datatypes ((array!45525 0))(
  ( (array!45526 (arr!21814 (Array (_ BitVec 32) (_ BitVec 64))) (size!22235 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45525)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45525 (_ BitVec 32)) Bool)

(assert (=> b!820876 (= res!560053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820877 () Bool)

(declare-fun e!456137 () Bool)

(assert (=> b!820877 (= e!456135 (not e!456137))))

(declare-fun res!560052 () Bool)

(assert (=> b!820877 (=> res!560052 e!456137)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820877 (= res!560052 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9752 0))(
  ( (tuple2!9753 (_1!4887 (_ BitVec 64)) (_2!4887 V!24571)) )
))
(declare-datatypes ((List!15563 0))(
  ( (Nil!15560) (Cons!15559 (h!16688 tuple2!9752) (t!21889 List!15563)) )
))
(declare-datatypes ((ListLongMap!8565 0))(
  ( (ListLongMap!8566 (toList!4298 List!15563)) )
))
(declare-fun lt!368822 () ListLongMap!8565)

(declare-fun lt!368821 () ListLongMap!8565)

(assert (=> b!820877 (= lt!368822 lt!368821)))

(declare-datatypes ((Unit!28025 0))(
  ( (Unit!28026) )
))
(declare-fun lt!368819 () Unit!28025)

(declare-fun zeroValueBefore!34 () V!24571)

(declare-fun zeroValueAfter!34 () V!24571)

(declare-fun minValue!754 () V!24571)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!443 (array!45525 array!45523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24571 V!24571 V!24571 V!24571 (_ BitVec 32) Int) Unit!28025)

(assert (=> b!820877 (= lt!368819 (lemmaNoChangeToArrayThenSameMapNoExtras!443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2350 (array!45525 array!45523 (_ BitVec 32) (_ BitVec 32) V!24571 V!24571 (_ BitVec 32) Int) ListLongMap!8565)

(assert (=> b!820877 (= lt!368821 (getCurrentListMapNoExtraKeys!2350 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820877 (= lt!368822 (getCurrentListMapNoExtraKeys!2350 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820878 () Bool)

(declare-fun tp_is_empty!14677 () Bool)

(assert (=> b!820878 (= e!456136 tp_is_empty!14677)))

(declare-fun mapIsEmpty!23623 () Bool)

(assert (=> mapIsEmpty!23623 mapRes!23623))

(declare-fun b!820879 () Bool)

(declare-fun res!560055 () Bool)

(assert (=> b!820879 (=> (not res!560055) (not e!456135))))

(declare-datatypes ((List!15564 0))(
  ( (Nil!15561) (Cons!15560 (h!16689 (_ BitVec 64)) (t!21890 List!15564)) )
))
(declare-fun arrayNoDuplicates!0 (array!45525 (_ BitVec 32) List!15564) Bool)

(assert (=> b!820879 (= res!560055 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15561))))

(declare-fun res!560054 () Bool)

(assert (=> start!70674 (=> (not res!560054) (not e!456135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70674 (= res!560054 (validMask!0 mask!1312))))

(assert (=> start!70674 e!456135))

(assert (=> start!70674 tp_is_empty!14677))

(declare-fun array_inv!17501 (array!45525) Bool)

(assert (=> start!70674 (array_inv!17501 _keys!976)))

(assert (=> start!70674 true))

(declare-fun array_inv!17502 (array!45523) Bool)

(assert (=> start!70674 (and (array_inv!17502 _values!788) e!456138)))

(assert (=> start!70674 tp!45643))

(declare-fun b!820880 () Bool)

(declare-fun res!560056 () Bool)

(assert (=> b!820880 (=> (not res!560056) (not e!456135))))

(assert (=> b!820880 (= res!560056 (and (= (size!22234 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22235 _keys!976) (size!22234 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23623 () Bool)

(declare-fun tp!45642 () Bool)

(declare-fun e!456140 () Bool)

(assert (=> mapNonEmpty!23623 (= mapRes!23623 (and tp!45642 e!456140))))

(declare-fun mapRest!23623 () (Array (_ BitVec 32) ValueCell!6923))

(declare-fun mapKey!23623 () (_ BitVec 32))

(declare-fun mapValue!23623 () ValueCell!6923)

(assert (=> mapNonEmpty!23623 (= (arr!21813 _values!788) (store mapRest!23623 mapKey!23623 mapValue!23623))))

(declare-fun b!820881 () Bool)

(assert (=> b!820881 (= e!456140 tp_is_empty!14677)))

(declare-fun b!820882 () Bool)

(assert (=> b!820882 (= e!456137 true)))

(declare-fun lt!368820 () ListLongMap!8565)

(declare-fun getCurrentListMap!2426 (array!45525 array!45523 (_ BitVec 32) (_ BitVec 32) V!24571 V!24571 (_ BitVec 32) Int) ListLongMap!8565)

(assert (=> b!820882 (= lt!368820 (getCurrentListMap!2426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70674 res!560054) b!820880))

(assert (= (and b!820880 res!560056) b!820876))

(assert (= (and b!820876 res!560053) b!820879))

(assert (= (and b!820879 res!560055) b!820877))

(assert (= (and b!820877 (not res!560052)) b!820882))

(assert (= (and b!820875 condMapEmpty!23623) mapIsEmpty!23623))

(assert (= (and b!820875 (not condMapEmpty!23623)) mapNonEmpty!23623))

(get-info :version)

(assert (= (and mapNonEmpty!23623 ((_ is ValueCellFull!6923) mapValue!23623)) b!820881))

(assert (= (and b!820875 ((_ is ValueCellFull!6923) mapDefault!23623)) b!820878))

(assert (= start!70674 b!820875))

(declare-fun m!762217 () Bool)

(assert (=> b!820882 m!762217))

(declare-fun m!762219 () Bool)

(assert (=> mapNonEmpty!23623 m!762219))

(declare-fun m!762221 () Bool)

(assert (=> b!820876 m!762221))

(declare-fun m!762223 () Bool)

(assert (=> b!820879 m!762223))

(declare-fun m!762225 () Bool)

(assert (=> start!70674 m!762225))

(declare-fun m!762227 () Bool)

(assert (=> start!70674 m!762227))

(declare-fun m!762229 () Bool)

(assert (=> start!70674 m!762229))

(declare-fun m!762231 () Bool)

(assert (=> b!820877 m!762231))

(declare-fun m!762233 () Bool)

(assert (=> b!820877 m!762233))

(declare-fun m!762235 () Bool)

(assert (=> b!820877 m!762235))

(check-sat (not b!820879) (not b!820877) (not b_next!12967) (not mapNonEmpty!23623) b_and!21803 (not start!70674) (not b!820882) tp_is_empty!14677 (not b!820876))
(check-sat b_and!21803 (not b_next!12967))
