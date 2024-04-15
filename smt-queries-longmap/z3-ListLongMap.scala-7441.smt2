; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94512 () Bool)

(assert start!94512)

(declare-fun b_free!21823 () Bool)

(declare-fun b_next!21823 () Bool)

(assert (=> start!94512 (= b_free!21823 (not b_next!21823))))

(declare-fun tp!76918 () Bool)

(declare-fun b_and!34599 () Bool)

(assert (=> start!94512 (= tp!76918 b_and!34599)))

(declare-fun mapIsEmpty!40147 () Bool)

(declare-fun mapRes!40147 () Bool)

(assert (=> mapIsEmpty!40147 mapRes!40147))

(declare-fun b!1068615 () Bool)

(declare-fun e!609731 () Bool)

(declare-fun tp_is_empty!25633 () Bool)

(assert (=> b!1068615 (= e!609731 tp_is_empty!25633)))

(declare-fun res!713084 () Bool)

(declare-fun e!609735 () Bool)

(assert (=> start!94512 (=> (not res!713084) (not e!609735))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94512 (= res!713084 (validMask!0 mask!1515))))

(assert (=> start!94512 e!609735))

(assert (=> start!94512 true))

(assert (=> start!94512 tp_is_empty!25633))

(declare-datatypes ((V!39313 0))(
  ( (V!39314 (val!12867 Int)) )
))
(declare-datatypes ((ValueCell!12113 0))(
  ( (ValueCellFull!12113 (v!15481 V!39313)) (EmptyCell!12113) )
))
(declare-datatypes ((array!68190 0))(
  ( (array!68191 (arr!32794 (Array (_ BitVec 32) ValueCell!12113)) (size!33332 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68190)

(declare-fun e!609737 () Bool)

(declare-fun array_inv!25382 (array!68190) Bool)

(assert (=> start!94512 (and (array_inv!25382 _values!955) e!609737)))

(assert (=> start!94512 tp!76918))

(declare-datatypes ((array!68192 0))(
  ( (array!68193 (arr!32795 (Array (_ BitVec 32) (_ BitVec 64))) (size!33333 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68192)

(declare-fun array_inv!25383 (array!68192) Bool)

(assert (=> start!94512 (array_inv!25383 _keys!1163)))

(declare-fun b!1068616 () Bool)

(declare-fun res!713083 () Bool)

(assert (=> b!1068616 (=> (not res!713083) (not e!609735))))

(declare-datatypes ((List!22937 0))(
  ( (Nil!22934) (Cons!22933 (h!24142 (_ BitVec 64)) (t!32255 List!22937)) )
))
(declare-fun arrayNoDuplicates!0 (array!68192 (_ BitVec 32) List!22937) Bool)

(assert (=> b!1068616 (= res!713083 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22934))))

(declare-fun b!1068617 () Bool)

(declare-fun e!609734 () Bool)

(declare-fun e!609736 () Bool)

(assert (=> b!1068617 (= e!609734 e!609736)))

(declare-fun res!713081 () Bool)

(assert (=> b!1068617 (=> res!713081 e!609736)))

(declare-datatypes ((tuple2!16398 0))(
  ( (tuple2!16399 (_1!8210 (_ BitVec 64)) (_2!8210 V!39313)) )
))
(declare-datatypes ((List!22938 0))(
  ( (Nil!22935) (Cons!22934 (h!24143 tuple2!16398) (t!32256 List!22938)) )
))
(declare-datatypes ((ListLongMap!14367 0))(
  ( (ListLongMap!14368 (toList!7199 List!22938)) )
))
(declare-fun lt!472011 () ListLongMap!14367)

(declare-fun contains!6272 (ListLongMap!14367 (_ BitVec 64)) Bool)

(assert (=> b!1068617 (= res!713081 (contains!6272 lt!472011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39313)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39313)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4040 (array!68192 array!68190 (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 (_ BitVec 32) Int) ListLongMap!14367)

(assert (=> b!1068617 (= lt!472011 (getCurrentListMap!4040 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068618 () Bool)

(assert (=> b!1068618 (= e!609736 true)))

(declare-fun -!643 (ListLongMap!14367 (_ BitVec 64)) ListLongMap!14367)

(assert (=> b!1068618 (= (-!643 lt!472011 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472011)))

(declare-datatypes ((Unit!34988 0))(
  ( (Unit!34989) )
))
(declare-fun lt!472010 () Unit!34988)

(declare-fun removeNotPresentStillSame!60 (ListLongMap!14367 (_ BitVec 64)) Unit!34988)

(assert (=> b!1068618 (= lt!472010 (removeNotPresentStillSame!60 lt!472011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068619 () Bool)

(declare-fun e!609733 () Bool)

(assert (=> b!1068619 (= e!609733 tp_is_empty!25633)))

(declare-fun b!1068620 () Bool)

(declare-fun res!713086 () Bool)

(assert (=> b!1068620 (=> (not res!713086) (not e!609735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68192 (_ BitVec 32)) Bool)

(assert (=> b!1068620 (= res!713086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40147 () Bool)

(declare-fun tp!76919 () Bool)

(assert (=> mapNonEmpty!40147 (= mapRes!40147 (and tp!76919 e!609731))))

(declare-fun mapValue!40147 () ValueCell!12113)

(declare-fun mapRest!40147 () (Array (_ BitVec 32) ValueCell!12113))

(declare-fun mapKey!40147 () (_ BitVec 32))

(assert (=> mapNonEmpty!40147 (= (arr!32794 _values!955) (store mapRest!40147 mapKey!40147 mapValue!40147))))

(declare-fun b!1068621 () Bool)

(assert (=> b!1068621 (= e!609735 (not e!609734))))

(declare-fun res!713082 () Bool)

(assert (=> b!1068621 (=> res!713082 e!609734)))

(assert (=> b!1068621 (= res!713082 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472009 () ListLongMap!14367)

(declare-fun lt!472008 () ListLongMap!14367)

(assert (=> b!1068621 (= lt!472009 lt!472008)))

(declare-fun lt!472007 () Unit!34988)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39313)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!785 (array!68192 array!68190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 V!39313 V!39313 (_ BitVec 32) Int) Unit!34988)

(assert (=> b!1068621 (= lt!472007 (lemmaNoChangeToArrayThenSameMapNoExtras!785 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3791 (array!68192 array!68190 (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 (_ BitVec 32) Int) ListLongMap!14367)

(assert (=> b!1068621 (= lt!472008 (getCurrentListMapNoExtraKeys!3791 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068621 (= lt!472009 (getCurrentListMapNoExtraKeys!3791 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068622 () Bool)

(assert (=> b!1068622 (= e!609737 (and e!609733 mapRes!40147))))

(declare-fun condMapEmpty!40147 () Bool)

(declare-fun mapDefault!40147 () ValueCell!12113)

(assert (=> b!1068622 (= condMapEmpty!40147 (= (arr!32794 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12113)) mapDefault!40147)))))

(declare-fun b!1068623 () Bool)

(declare-fun res!713085 () Bool)

(assert (=> b!1068623 (=> (not res!713085) (not e!609735))))

(assert (=> b!1068623 (= res!713085 (and (= (size!33332 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33333 _keys!1163) (size!33332 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94512 res!713084) b!1068623))

(assert (= (and b!1068623 res!713085) b!1068620))

(assert (= (and b!1068620 res!713086) b!1068616))

(assert (= (and b!1068616 res!713083) b!1068621))

(assert (= (and b!1068621 (not res!713082)) b!1068617))

(assert (= (and b!1068617 (not res!713081)) b!1068618))

(assert (= (and b!1068622 condMapEmpty!40147) mapIsEmpty!40147))

(assert (= (and b!1068622 (not condMapEmpty!40147)) mapNonEmpty!40147))

(get-info :version)

(assert (= (and mapNonEmpty!40147 ((_ is ValueCellFull!12113) mapValue!40147)) b!1068615))

(assert (= (and b!1068622 ((_ is ValueCellFull!12113) mapDefault!40147)) b!1068619))

(assert (= start!94512 b!1068622))

(declare-fun m!986701 () Bool)

(assert (=> b!1068616 m!986701))

(declare-fun m!986703 () Bool)

(assert (=> mapNonEmpty!40147 m!986703))

(declare-fun m!986705 () Bool)

(assert (=> start!94512 m!986705))

(declare-fun m!986707 () Bool)

(assert (=> start!94512 m!986707))

(declare-fun m!986709 () Bool)

(assert (=> start!94512 m!986709))

(declare-fun m!986711 () Bool)

(assert (=> b!1068620 m!986711))

(declare-fun m!986713 () Bool)

(assert (=> b!1068618 m!986713))

(declare-fun m!986715 () Bool)

(assert (=> b!1068618 m!986715))

(declare-fun m!986717 () Bool)

(assert (=> b!1068617 m!986717))

(declare-fun m!986719 () Bool)

(assert (=> b!1068617 m!986719))

(declare-fun m!986721 () Bool)

(assert (=> b!1068621 m!986721))

(declare-fun m!986723 () Bool)

(assert (=> b!1068621 m!986723))

(declare-fun m!986725 () Bool)

(assert (=> b!1068621 m!986725))

(check-sat (not b!1068616) (not start!94512) tp_is_empty!25633 (not b!1068618) (not b_next!21823) (not b!1068621) (not b!1068617) b_and!34599 (not mapNonEmpty!40147) (not b!1068620))
(check-sat b_and!34599 (not b_next!21823))
