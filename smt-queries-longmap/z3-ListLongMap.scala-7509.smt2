; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95224 () Bool)

(assert start!95224)

(declare-fun b_free!22231 () Bool)

(declare-fun b_next!22231 () Bool)

(assert (=> start!95224 (= b_free!22231 (not b_next!22231))))

(declare-fun tp!78190 () Bool)

(declare-fun b_and!35183 () Bool)

(assert (=> start!95224 (= tp!78190 b_and!35183)))

(declare-fun b!1076237 () Bool)

(declare-fun res!717337 () Bool)

(declare-fun e!615180 () Bool)

(assert (=> b!1076237 (=> (not res!717337) (not e!615180))))

(declare-datatypes ((array!68990 0))(
  ( (array!68991 (arr!33178 (Array (_ BitVec 32) (_ BitVec 64))) (size!33716 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68990)

(declare-datatypes ((List!23239 0))(
  ( (Nil!23236) (Cons!23235 (h!24444 (_ BitVec 64)) (t!32589 List!23239)) )
))
(declare-fun arrayNoDuplicates!0 (array!68990 (_ BitVec 32) List!23239) Bool)

(assert (=> b!1076237 (= res!717337 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23236))))

(declare-fun b!1076238 () Bool)

(declare-fun e!615179 () Bool)

(declare-fun tp_is_empty!26041 () Bool)

(assert (=> b!1076238 (= e!615179 tp_is_empty!26041)))

(declare-fun mapNonEmpty!40807 () Bool)

(declare-fun mapRes!40807 () Bool)

(declare-fun tp!78191 () Bool)

(declare-fun e!615177 () Bool)

(assert (=> mapNonEmpty!40807 (= mapRes!40807 (and tp!78191 e!615177))))

(declare-datatypes ((V!39857 0))(
  ( (V!39858 (val!13071 Int)) )
))
(declare-datatypes ((ValueCell!12317 0))(
  ( (ValueCellFull!12317 (v!15698 V!39857)) (EmptyCell!12317) )
))
(declare-datatypes ((array!68992 0))(
  ( (array!68993 (arr!33179 (Array (_ BitVec 32) ValueCell!12317)) (size!33717 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68992)

(declare-fun mapRest!40807 () (Array (_ BitVec 32) ValueCell!12317))

(declare-fun mapValue!40807 () ValueCell!12317)

(declare-fun mapKey!40807 () (_ BitVec 32))

(assert (=> mapNonEmpty!40807 (= (arr!33179 _values!955) (store mapRest!40807 mapKey!40807 mapValue!40807))))

(declare-fun b!1076239 () Bool)

(declare-fun e!615176 () Bool)

(assert (=> b!1076239 (= e!615176 (and e!615179 mapRes!40807))))

(declare-fun condMapEmpty!40807 () Bool)

(declare-fun mapDefault!40807 () ValueCell!12317)

(assert (=> b!1076239 (= condMapEmpty!40807 (= (arr!33179 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12317)) mapDefault!40807)))))

(declare-fun res!717341 () Bool)

(assert (=> start!95224 (=> (not res!717341) (not e!615180))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95224 (= res!717341 (validMask!0 mask!1515))))

(assert (=> start!95224 e!615180))

(assert (=> start!95224 true))

(assert (=> start!95224 tp_is_empty!26041))

(declare-fun array_inv!25662 (array!68992) Bool)

(assert (=> start!95224 (and (array_inv!25662 _values!955) e!615176)))

(assert (=> start!95224 tp!78190))

(declare-fun array_inv!25663 (array!68990) Bool)

(assert (=> start!95224 (array_inv!25663 _keys!1163)))

(declare-fun b!1076240 () Bool)

(declare-fun e!615174 () Bool)

(assert (=> b!1076240 (= e!615180 (not e!615174))))

(declare-fun res!717338 () Bool)

(assert (=> b!1076240 (=> res!717338 e!615174)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076240 (= res!717338 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16722 0))(
  ( (tuple2!16723 (_1!8372 (_ BitVec 64)) (_2!8372 V!39857)) )
))
(declare-datatypes ((List!23240 0))(
  ( (Nil!23237) (Cons!23236 (h!24445 tuple2!16722) (t!32590 List!23240)) )
))
(declare-datatypes ((ListLongMap!14691 0))(
  ( (ListLongMap!14692 (toList!7361 List!23240)) )
))
(declare-fun lt!477886 () ListLongMap!14691)

(declare-fun lt!477892 () ListLongMap!14691)

(assert (=> b!1076240 (= lt!477886 lt!477892)))

(declare-fun zeroValueBefore!47 () V!39857)

(declare-fun minValue!907 () V!39857)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39857)

(declare-datatypes ((Unit!35275 0))(
  ( (Unit!35276) )
))
(declare-fun lt!477891 () Unit!35275)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!909 (array!68990 array!68992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 V!39857 V!39857 (_ BitVec 32) Int) Unit!35275)

(assert (=> b!1076240 (= lt!477891 (lemmaNoChangeToArrayThenSameMapNoExtras!909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3937 (array!68990 array!68992 (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 (_ BitVec 32) Int) ListLongMap!14691)

(assert (=> b!1076240 (= lt!477892 (getCurrentListMapNoExtraKeys!3937 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076240 (= lt!477886 (getCurrentListMapNoExtraKeys!3937 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076241 () Bool)

(assert (=> b!1076241 (= e!615177 tp_is_empty!26041)))

(declare-fun b!1076242 () Bool)

(assert (=> b!1076242 (= e!615174 true)))

(declare-fun lt!477887 () ListLongMap!14691)

(declare-fun lt!477889 () tuple2!16722)

(declare-fun -!697 (ListLongMap!14691 (_ BitVec 64)) ListLongMap!14691)

(declare-fun +!3260 (ListLongMap!14691 tuple2!16722) ListLongMap!14691)

(assert (=> b!1076242 (= (-!697 (+!3260 lt!477887 lt!477889) #b0000000000000000000000000000000000000000000000000000000000000000) lt!477887)))

(declare-fun lt!477894 () Unit!35275)

(declare-fun addThenRemoveForNewKeyIsSame!75 (ListLongMap!14691 (_ BitVec 64) V!39857) Unit!35275)

(assert (=> b!1076242 (= lt!477894 (addThenRemoveForNewKeyIsSame!75 lt!477887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!477893 () tuple2!16722)

(assert (=> b!1076242 (= lt!477887 (+!3260 lt!477886 lt!477893))))

(declare-fun e!615178 () Bool)

(assert (=> b!1076242 e!615178))

(declare-fun res!717339 () Bool)

(assert (=> b!1076242 (=> (not res!717339) (not e!615178))))

(declare-fun lt!477888 () ListLongMap!14691)

(assert (=> b!1076242 (= res!717339 (= lt!477888 (+!3260 (+!3260 lt!477886 lt!477889) lt!477893)))))

(assert (=> b!1076242 (= lt!477893 (tuple2!16723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076242 (= lt!477889 (tuple2!16723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!477890 () ListLongMap!14691)

(declare-fun getCurrentListMap!4129 (array!68990 array!68992 (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 (_ BitVec 32) Int) ListLongMap!14691)

(assert (=> b!1076242 (= lt!477890 (getCurrentListMap!4129 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076242 (= lt!477888 (getCurrentListMap!4129 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40807 () Bool)

(assert (=> mapIsEmpty!40807 mapRes!40807))

(declare-fun b!1076243 () Bool)

(assert (=> b!1076243 (= e!615178 (= lt!477890 (+!3260 lt!477892 lt!477893)))))

(declare-fun b!1076244 () Bool)

(declare-fun res!717342 () Bool)

(assert (=> b!1076244 (=> (not res!717342) (not e!615180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68990 (_ BitVec 32)) Bool)

(assert (=> b!1076244 (= res!717342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076245 () Bool)

(declare-fun res!717340 () Bool)

(assert (=> b!1076245 (=> (not res!717340) (not e!615180))))

(assert (=> b!1076245 (= res!717340 (and (= (size!33717 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33716 _keys!1163) (size!33717 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95224 res!717341) b!1076245))

(assert (= (and b!1076245 res!717340) b!1076244))

(assert (= (and b!1076244 res!717342) b!1076237))

(assert (= (and b!1076237 res!717337) b!1076240))

(assert (= (and b!1076240 (not res!717338)) b!1076242))

(assert (= (and b!1076242 res!717339) b!1076243))

(assert (= (and b!1076239 condMapEmpty!40807) mapIsEmpty!40807))

(assert (= (and b!1076239 (not condMapEmpty!40807)) mapNonEmpty!40807))

(get-info :version)

(assert (= (and mapNonEmpty!40807 ((_ is ValueCellFull!12317) mapValue!40807)) b!1076241))

(assert (= (and b!1076239 ((_ is ValueCellFull!12317) mapDefault!40807)) b!1076238))

(assert (= start!95224 b!1076239))

(declare-fun m!994649 () Bool)

(assert (=> b!1076243 m!994649))

(declare-fun m!994651 () Bool)

(assert (=> b!1076240 m!994651))

(declare-fun m!994653 () Bool)

(assert (=> b!1076240 m!994653))

(declare-fun m!994655 () Bool)

(assert (=> b!1076240 m!994655))

(declare-fun m!994657 () Bool)

(assert (=> b!1076237 m!994657))

(declare-fun m!994659 () Bool)

(assert (=> b!1076242 m!994659))

(declare-fun m!994661 () Bool)

(assert (=> b!1076242 m!994661))

(assert (=> b!1076242 m!994659))

(declare-fun m!994663 () Bool)

(assert (=> b!1076242 m!994663))

(declare-fun m!994665 () Bool)

(assert (=> b!1076242 m!994665))

(declare-fun m!994667 () Bool)

(assert (=> b!1076242 m!994667))

(assert (=> b!1076242 m!994663))

(declare-fun m!994669 () Bool)

(assert (=> b!1076242 m!994669))

(declare-fun m!994671 () Bool)

(assert (=> b!1076242 m!994671))

(declare-fun m!994673 () Bool)

(assert (=> b!1076242 m!994673))

(declare-fun m!994675 () Bool)

(assert (=> start!95224 m!994675))

(declare-fun m!994677 () Bool)

(assert (=> start!95224 m!994677))

(declare-fun m!994679 () Bool)

(assert (=> start!95224 m!994679))

(declare-fun m!994681 () Bool)

(assert (=> b!1076244 m!994681))

(declare-fun m!994683 () Bool)

(assert (=> mapNonEmpty!40807 m!994683))

(check-sat (not b!1076237) tp_is_empty!26041 (not b!1076240) (not b!1076244) (not b_next!22231) (not mapNonEmpty!40807) (not start!95224) (not b!1076243) (not b!1076242) b_and!35183)
(check-sat b_and!35183 (not b_next!22231))
