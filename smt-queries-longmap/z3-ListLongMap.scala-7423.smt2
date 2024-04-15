; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94368 () Bool)

(assert start!94368)

(declare-fun b_free!21715 () Bool)

(declare-fun b_next!21715 () Bool)

(assert (=> start!94368 (= b_free!21715 (not b_next!21715))))

(declare-fun tp!76588 () Bool)

(declare-fun b_and!34473 () Bool)

(assert (=> start!94368 (= tp!76588 b_and!34473)))

(declare-fun b!1067010 () Bool)

(declare-fun e!608538 () Bool)

(declare-fun tp_is_empty!25525 () Bool)

(assert (=> b!1067010 (= e!608538 tp_is_empty!25525)))

(declare-fun mapIsEmpty!39979 () Bool)

(declare-fun mapRes!39979 () Bool)

(assert (=> mapIsEmpty!39979 mapRes!39979))

(declare-fun b!1067012 () Bool)

(declare-fun res!712112 () Bool)

(declare-fun e!608540 () Bool)

(assert (=> b!1067012 (=> (not res!712112) (not e!608540))))

(declare-datatypes ((array!67978 0))(
  ( (array!67979 (arr!32690 (Array (_ BitVec 32) (_ BitVec 64))) (size!33228 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67978)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67978 (_ BitVec 32)) Bool)

(assert (=> b!1067012 (= res!712112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067013 () Bool)

(declare-fun res!712115 () Bool)

(assert (=> b!1067013 (=> (not res!712115) (not e!608540))))

(declare-datatypes ((V!39169 0))(
  ( (V!39170 (val!12813 Int)) )
))
(declare-datatypes ((ValueCell!12059 0))(
  ( (ValueCellFull!12059 (v!15426 V!39169)) (EmptyCell!12059) )
))
(declare-datatypes ((array!67980 0))(
  ( (array!67981 (arr!32691 (Array (_ BitVec 32) ValueCell!12059)) (size!33229 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67980)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067013 (= res!712115 (and (= (size!33229 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33228 _keys!1163) (size!33229 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067014 () Bool)

(assert (=> b!1067014 (= e!608540 (not true))))

(declare-datatypes ((tuple2!16310 0))(
  ( (tuple2!16311 (_1!8166 (_ BitVec 64)) (_2!8166 V!39169)) )
))
(declare-datatypes ((List!22853 0))(
  ( (Nil!22850) (Cons!22849 (h!24058 tuple2!16310) (t!32167 List!22853)) )
))
(declare-datatypes ((ListLongMap!14279 0))(
  ( (ListLongMap!14280 (toList!7155 List!22853)) )
))
(declare-fun lt!471129 () ListLongMap!14279)

(declare-fun lt!471128 () ListLongMap!14279)

(assert (=> b!1067014 (= lt!471129 lt!471128)))

(declare-fun zeroValueBefore!47 () V!39169)

(declare-datatypes ((Unit!34900 0))(
  ( (Unit!34901) )
))
(declare-fun lt!471130 () Unit!34900)

(declare-fun minValue!907 () V!39169)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39169)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!745 (array!67978 array!67980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39169 V!39169 V!39169 V!39169 (_ BitVec 32) Int) Unit!34900)

(assert (=> b!1067014 (= lt!471130 (lemmaNoChangeToArrayThenSameMapNoExtras!745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3751 (array!67978 array!67980 (_ BitVec 32) (_ BitVec 32) V!39169 V!39169 (_ BitVec 32) Int) ListLongMap!14279)

(assert (=> b!1067014 (= lt!471128 (getCurrentListMapNoExtraKeys!3751 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067014 (= lt!471129 (getCurrentListMapNoExtraKeys!3751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39979 () Bool)

(declare-fun tp!76589 () Bool)

(declare-fun e!608539 () Bool)

(assert (=> mapNonEmpty!39979 (= mapRes!39979 (and tp!76589 e!608539))))

(declare-fun mapKey!39979 () (_ BitVec 32))

(declare-fun mapValue!39979 () ValueCell!12059)

(declare-fun mapRest!39979 () (Array (_ BitVec 32) ValueCell!12059))

(assert (=> mapNonEmpty!39979 (= (arr!32691 _values!955) (store mapRest!39979 mapKey!39979 mapValue!39979))))

(declare-fun res!712114 () Bool)

(assert (=> start!94368 (=> (not res!712114) (not e!608540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94368 (= res!712114 (validMask!0 mask!1515))))

(assert (=> start!94368 e!608540))

(assert (=> start!94368 true))

(assert (=> start!94368 tp_is_empty!25525))

(declare-fun e!608537 () Bool)

(declare-fun array_inv!25308 (array!67980) Bool)

(assert (=> start!94368 (and (array_inv!25308 _values!955) e!608537)))

(assert (=> start!94368 tp!76588))

(declare-fun array_inv!25309 (array!67978) Bool)

(assert (=> start!94368 (array_inv!25309 _keys!1163)))

(declare-fun b!1067011 () Bool)

(assert (=> b!1067011 (= e!608539 tp_is_empty!25525)))

(declare-fun b!1067015 () Bool)

(assert (=> b!1067015 (= e!608537 (and e!608538 mapRes!39979))))

(declare-fun condMapEmpty!39979 () Bool)

(declare-fun mapDefault!39979 () ValueCell!12059)

(assert (=> b!1067015 (= condMapEmpty!39979 (= (arr!32691 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12059)) mapDefault!39979)))))

(declare-fun b!1067016 () Bool)

(declare-fun res!712113 () Bool)

(assert (=> b!1067016 (=> (not res!712113) (not e!608540))))

(declare-datatypes ((List!22854 0))(
  ( (Nil!22851) (Cons!22850 (h!24059 (_ BitVec 64)) (t!32168 List!22854)) )
))
(declare-fun arrayNoDuplicates!0 (array!67978 (_ BitVec 32) List!22854) Bool)

(assert (=> b!1067016 (= res!712113 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22851))))

(assert (= (and start!94368 res!712114) b!1067013))

(assert (= (and b!1067013 res!712115) b!1067012))

(assert (= (and b!1067012 res!712112) b!1067016))

(assert (= (and b!1067016 res!712113) b!1067014))

(assert (= (and b!1067015 condMapEmpty!39979) mapIsEmpty!39979))

(assert (= (and b!1067015 (not condMapEmpty!39979)) mapNonEmpty!39979))

(get-info :version)

(assert (= (and mapNonEmpty!39979 ((_ is ValueCellFull!12059) mapValue!39979)) b!1067011))

(assert (= (and b!1067015 ((_ is ValueCellFull!12059) mapDefault!39979)) b!1067010))

(assert (= start!94368 b!1067015))

(declare-fun m!985237 () Bool)

(assert (=> start!94368 m!985237))

(declare-fun m!985239 () Bool)

(assert (=> start!94368 m!985239))

(declare-fun m!985241 () Bool)

(assert (=> start!94368 m!985241))

(declare-fun m!985243 () Bool)

(assert (=> b!1067014 m!985243))

(declare-fun m!985245 () Bool)

(assert (=> b!1067014 m!985245))

(declare-fun m!985247 () Bool)

(assert (=> b!1067014 m!985247))

(declare-fun m!985249 () Bool)

(assert (=> b!1067016 m!985249))

(declare-fun m!985251 () Bool)

(assert (=> b!1067012 m!985251))

(declare-fun m!985253 () Bool)

(assert (=> mapNonEmpty!39979 m!985253))

(check-sat (not start!94368) (not b!1067016) tp_is_empty!25525 (not b!1067014) b_and!34473 (not b!1067012) (not b_next!21715) (not mapNonEmpty!39979))
(check-sat b_and!34473 (not b_next!21715))
