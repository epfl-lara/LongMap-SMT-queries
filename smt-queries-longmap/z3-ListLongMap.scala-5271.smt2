; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70942 () Bool)

(assert start!70942)

(declare-fun b_free!13033 () Bool)

(declare-fun b_next!13033 () Bool)

(assert (=> start!70942 (= b_free!13033 (not b_next!13033))))

(declare-fun tp!45843 () Bool)

(declare-fun b_and!21915 () Bool)

(assert (=> start!70942 (= tp!45843 b_and!21915)))

(declare-fun b!822964 () Bool)

(declare-fun e!457563 () Bool)

(declare-fun e!457561 () Bool)

(assert (=> b!822964 (= e!457563 (not e!457561))))

(declare-fun res!561069 () Bool)

(assert (=> b!822964 (=> res!561069 e!457561)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822964 (= res!561069 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24659 0))(
  ( (V!24660 (val!7419 Int)) )
))
(declare-datatypes ((tuple2!9712 0))(
  ( (tuple2!9713 (_1!4867 (_ BitVec 64)) (_2!4867 V!24659)) )
))
(declare-datatypes ((List!15501 0))(
  ( (Nil!15498) (Cons!15497 (h!16632 tuple2!9712) (t!21830 List!15501)) )
))
(declare-datatypes ((ListLongMap!8537 0))(
  ( (ListLongMap!8538 (toList!4284 List!15501)) )
))
(declare-fun lt!370011 () ListLongMap!8537)

(declare-fun lt!370008 () ListLongMap!8537)

(assert (=> b!822964 (= lt!370011 lt!370008)))

(declare-fun zeroValueBefore!34 () V!24659)

(declare-datatypes ((array!45683 0))(
  ( (array!45684 (arr!21887 (Array (_ BitVec 32) (_ BitVec 64))) (size!22307 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45683)

(declare-fun zeroValueAfter!34 () V!24659)

(declare-fun minValue!754 () V!24659)

(declare-datatypes ((ValueCell!6956 0))(
  ( (ValueCellFull!6956 (v!9850 V!24659)) (EmptyCell!6956) )
))
(declare-datatypes ((array!45685 0))(
  ( (array!45686 (arr!21888 (Array (_ BitVec 32) ValueCell!6956)) (size!22308 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45685)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28117 0))(
  ( (Unit!28118) )
))
(declare-fun lt!370010 () Unit!28117)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!460 (array!45683 array!45685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 V!24659 V!24659 (_ BitVec 32) Int) Unit!28117)

(assert (=> b!822964 (= lt!370010 (lemmaNoChangeToArrayThenSameMapNoExtras!460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2372 (array!45683 array!45685 (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 (_ BitVec 32) Int) ListLongMap!8537)

(assert (=> b!822964 (= lt!370008 (getCurrentListMapNoExtraKeys!2372 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822964 (= lt!370011 (getCurrentListMapNoExtraKeys!2372 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822965 () Bool)

(declare-fun e!457562 () Bool)

(declare-fun e!457564 () Bool)

(declare-fun mapRes!23725 () Bool)

(assert (=> b!822965 (= e!457562 (and e!457564 mapRes!23725))))

(declare-fun condMapEmpty!23725 () Bool)

(declare-fun mapDefault!23725 () ValueCell!6956)

(assert (=> b!822965 (= condMapEmpty!23725 (= (arr!21888 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6956)) mapDefault!23725)))))

(declare-fun b!822966 () Bool)

(assert (=> b!822966 (= e!457561 true)))

(declare-fun lt!370009 () ListLongMap!8537)

(declare-fun lt!370002 () ListLongMap!8537)

(declare-fun lt!370005 () tuple2!9712)

(declare-fun +!1874 (ListLongMap!8537 tuple2!9712) ListLongMap!8537)

(assert (=> b!822966 (= lt!370009 (+!1874 lt!370002 lt!370005))))

(declare-fun lt!370006 () Unit!28117)

(declare-fun addCommutativeForDiffKeys!432 (ListLongMap!8537 (_ BitVec 64) V!24659 (_ BitVec 64) V!24659) Unit!28117)

(assert (=> b!822966 (= lt!370006 (addCommutativeForDiffKeys!432 lt!370011 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370007 () ListLongMap!8537)

(assert (=> b!822966 (= lt!370007 lt!370009)))

(declare-fun lt!370004 () tuple2!9712)

(assert (=> b!822966 (= lt!370009 (+!1874 (+!1874 lt!370011 lt!370005) lt!370004))))

(assert (=> b!822966 (= lt!370005 (tuple2!9713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370003 () ListLongMap!8537)

(assert (=> b!822966 (= lt!370003 lt!370002)))

(assert (=> b!822966 (= lt!370002 (+!1874 lt!370011 lt!370004))))

(assert (=> b!822966 (= lt!370004 (tuple2!9713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2438 (array!45683 array!45685 (_ BitVec 32) (_ BitVec 32) V!24659 V!24659 (_ BitVec 32) Int) ListLongMap!8537)

(assert (=> b!822966 (= lt!370007 (getCurrentListMap!2438 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822966 (= lt!370003 (getCurrentListMap!2438 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23725 () Bool)

(declare-fun tp!45844 () Bool)

(declare-fun e!457560 () Bool)

(assert (=> mapNonEmpty!23725 (= mapRes!23725 (and tp!45844 e!457560))))

(declare-fun mapValue!23725 () ValueCell!6956)

(declare-fun mapKey!23725 () (_ BitVec 32))

(declare-fun mapRest!23725 () (Array (_ BitVec 32) ValueCell!6956))

(assert (=> mapNonEmpty!23725 (= (arr!21888 _values!788) (store mapRest!23725 mapKey!23725 mapValue!23725))))

(declare-fun res!561066 () Bool)

(assert (=> start!70942 (=> (not res!561066) (not e!457563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70942 (= res!561066 (validMask!0 mask!1312))))

(assert (=> start!70942 e!457563))

(declare-fun tp_is_empty!14743 () Bool)

(assert (=> start!70942 tp_is_empty!14743))

(declare-fun array_inv!17513 (array!45683) Bool)

(assert (=> start!70942 (array_inv!17513 _keys!976)))

(assert (=> start!70942 true))

(declare-fun array_inv!17514 (array!45685) Bool)

(assert (=> start!70942 (and (array_inv!17514 _values!788) e!457562)))

(assert (=> start!70942 tp!45843))

(declare-fun b!822967 () Bool)

(assert (=> b!822967 (= e!457560 tp_is_empty!14743)))

(declare-fun b!822968 () Bool)

(assert (=> b!822968 (= e!457564 tp_is_empty!14743)))

(declare-fun b!822969 () Bool)

(declare-fun res!561068 () Bool)

(assert (=> b!822969 (=> (not res!561068) (not e!457563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45683 (_ BitVec 32)) Bool)

(assert (=> b!822969 (= res!561068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822970 () Bool)

(declare-fun res!561067 () Bool)

(assert (=> b!822970 (=> (not res!561067) (not e!457563))))

(declare-datatypes ((List!15502 0))(
  ( (Nil!15499) (Cons!15498 (h!16633 (_ BitVec 64)) (t!21831 List!15502)) )
))
(declare-fun arrayNoDuplicates!0 (array!45683 (_ BitVec 32) List!15502) Bool)

(assert (=> b!822970 (= res!561067 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15499))))

(declare-fun b!822971 () Bool)

(declare-fun res!561070 () Bool)

(assert (=> b!822971 (=> (not res!561070) (not e!457563))))

(assert (=> b!822971 (= res!561070 (and (= (size!22308 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22307 _keys!976) (size!22308 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23725 () Bool)

(assert (=> mapIsEmpty!23725 mapRes!23725))

(assert (= (and start!70942 res!561066) b!822971))

(assert (= (and b!822971 res!561070) b!822969))

(assert (= (and b!822969 res!561068) b!822970))

(assert (= (and b!822970 res!561067) b!822964))

(assert (= (and b!822964 (not res!561069)) b!822966))

(assert (= (and b!822965 condMapEmpty!23725) mapIsEmpty!23725))

(assert (= (and b!822965 (not condMapEmpty!23725)) mapNonEmpty!23725))

(get-info :version)

(assert (= (and mapNonEmpty!23725 ((_ is ValueCellFull!6956) mapValue!23725)) b!822967))

(assert (= (and b!822965 ((_ is ValueCellFull!6956) mapDefault!23725)) b!822968))

(assert (= start!70942 b!822965))

(declare-fun m!765083 () Bool)

(assert (=> b!822964 m!765083))

(declare-fun m!765085 () Bool)

(assert (=> b!822964 m!765085))

(declare-fun m!765087 () Bool)

(assert (=> b!822964 m!765087))

(declare-fun m!765089 () Bool)

(assert (=> start!70942 m!765089))

(declare-fun m!765091 () Bool)

(assert (=> start!70942 m!765091))

(declare-fun m!765093 () Bool)

(assert (=> start!70942 m!765093))

(declare-fun m!765095 () Bool)

(assert (=> mapNonEmpty!23725 m!765095))

(declare-fun m!765097 () Bool)

(assert (=> b!822970 m!765097))

(declare-fun m!765099 () Bool)

(assert (=> b!822969 m!765099))

(declare-fun m!765101 () Bool)

(assert (=> b!822966 m!765101))

(declare-fun m!765103 () Bool)

(assert (=> b!822966 m!765103))

(declare-fun m!765105 () Bool)

(assert (=> b!822966 m!765105))

(declare-fun m!765107 () Bool)

(assert (=> b!822966 m!765107))

(declare-fun m!765109 () Bool)

(assert (=> b!822966 m!765109))

(declare-fun m!765111 () Bool)

(assert (=> b!822966 m!765111))

(assert (=> b!822966 m!765101))

(declare-fun m!765113 () Bool)

(assert (=> b!822966 m!765113))

(check-sat (not start!70942) (not b!822966) b_and!21915 (not b!822964) (not mapNonEmpty!23725) tp_is_empty!14743 (not b!822969) (not b!822970) (not b_next!13033))
(check-sat b_and!21915 (not b_next!13033))
