; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94650 () Bool)

(assert start!94650)

(declare-fun b_free!21925 () Bool)

(declare-fun b_next!21925 () Bool)

(assert (=> start!94650 (= b_free!21925 (not b_next!21925))))

(declare-fun tp!77231 () Bool)

(declare-fun b_and!34719 () Bool)

(assert (=> start!94650 (= tp!77231 b_and!34719)))

(declare-fun b!1070052 () Bool)

(declare-fun e!610778 () Bool)

(declare-fun tp_is_empty!25735 () Bool)

(assert (=> b!1070052 (= e!610778 tp_is_empty!25735)))

(declare-fun b!1070053 () Bool)

(declare-fun e!610775 () Bool)

(declare-fun e!610779 () Bool)

(assert (=> b!1070053 (= e!610775 (not e!610779))))

(declare-fun res!713911 () Bool)

(assert (=> b!1070053 (=> res!713911 e!610779)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070053 (= res!713911 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39449 0))(
  ( (V!39450 (val!12918 Int)) )
))
(declare-datatypes ((tuple2!16480 0))(
  ( (tuple2!16481 (_1!8251 (_ BitVec 64)) (_2!8251 V!39449)) )
))
(declare-datatypes ((List!23008 0))(
  ( (Nil!23005) (Cons!23004 (h!24213 tuple2!16480) (t!32330 List!23008)) )
))
(declare-datatypes ((ListLongMap!14449 0))(
  ( (ListLongMap!14450 (toList!7240 List!23008)) )
))
(declare-fun lt!472755 () ListLongMap!14449)

(declare-fun lt!472757 () ListLongMap!14449)

(assert (=> b!1070053 (= lt!472755 lt!472757)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39449)

(declare-datatypes ((Unit!35066 0))(
  ( (Unit!35067) )
))
(declare-fun lt!472756 () Unit!35066)

(declare-datatypes ((ValueCell!12164 0))(
  ( (ValueCellFull!12164 (v!15533 V!39449)) (EmptyCell!12164) )
))
(declare-datatypes ((array!68386 0))(
  ( (array!68387 (arr!32890 (Array (_ BitVec 32) ValueCell!12164)) (size!33428 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68386)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39449)

(declare-fun minValue!907 () V!39449)

(declare-datatypes ((array!68388 0))(
  ( (array!68389 (arr!32891 (Array (_ BitVec 32) (_ BitVec 64))) (size!33429 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68388)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!822 (array!68388 array!68386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39449 V!39449 V!39449 V!39449 (_ BitVec 32) Int) Unit!35066)

(assert (=> b!1070053 (= lt!472756 (lemmaNoChangeToArrayThenSameMapNoExtras!822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3828 (array!68388 array!68386 (_ BitVec 32) (_ BitVec 32) V!39449 V!39449 (_ BitVec 32) Int) ListLongMap!14449)

(assert (=> b!1070053 (= lt!472757 (getCurrentListMapNoExtraKeys!3828 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070053 (= lt!472755 (getCurrentListMapNoExtraKeys!3828 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070054 () Bool)

(declare-fun res!713913 () Bool)

(assert (=> b!1070054 (=> (not res!713913) (not e!610775))))

(declare-datatypes ((List!23009 0))(
  ( (Nil!23006) (Cons!23005 (h!24214 (_ BitVec 64)) (t!32331 List!23009)) )
))
(declare-fun arrayNoDuplicates!0 (array!68388 (_ BitVec 32) List!23009) Bool)

(assert (=> b!1070054 (= res!713913 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23006))))

(declare-fun mapIsEmpty!40306 () Bool)

(declare-fun mapRes!40306 () Bool)

(assert (=> mapIsEmpty!40306 mapRes!40306))

(declare-fun res!713909 () Bool)

(assert (=> start!94650 (=> (not res!713909) (not e!610775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94650 (= res!713909 (validMask!0 mask!1515))))

(assert (=> start!94650 e!610775))

(assert (=> start!94650 true))

(assert (=> start!94650 tp_is_empty!25735))

(declare-fun e!610776 () Bool)

(declare-fun array_inv!25446 (array!68386) Bool)

(assert (=> start!94650 (and (array_inv!25446 _values!955) e!610776)))

(assert (=> start!94650 tp!77231))

(declare-fun array_inv!25447 (array!68388) Bool)

(assert (=> start!94650 (array_inv!25447 _keys!1163)))

(declare-fun b!1070055 () Bool)

(declare-fun res!713912 () Bool)

(assert (=> b!1070055 (=> (not res!713912) (not e!610775))))

(assert (=> b!1070055 (= res!713912 (and (= (size!33428 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33429 _keys!1163) (size!33428 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070056 () Bool)

(declare-fun res!713910 () Bool)

(assert (=> b!1070056 (=> (not res!713910) (not e!610775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68388 (_ BitVec 32)) Bool)

(assert (=> b!1070056 (= res!713910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070057 () Bool)

(declare-fun e!610780 () Bool)

(assert (=> b!1070057 (= e!610776 (and e!610780 mapRes!40306))))

(declare-fun condMapEmpty!40306 () Bool)

(declare-fun mapDefault!40306 () ValueCell!12164)

(assert (=> b!1070057 (= condMapEmpty!40306 (= (arr!32890 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12164)) mapDefault!40306)))))

(declare-fun b!1070058 () Bool)

(assert (=> b!1070058 (= e!610780 tp_is_empty!25735)))

(declare-fun mapNonEmpty!40306 () Bool)

(declare-fun tp!77230 () Bool)

(assert (=> mapNonEmpty!40306 (= mapRes!40306 (and tp!77230 e!610778))))

(declare-fun mapRest!40306 () (Array (_ BitVec 32) ValueCell!12164))

(declare-fun mapValue!40306 () ValueCell!12164)

(declare-fun mapKey!40306 () (_ BitVec 32))

(assert (=> mapNonEmpty!40306 (= (arr!32890 _values!955) (store mapRest!40306 mapKey!40306 mapValue!40306))))

(declare-fun b!1070059 () Bool)

(assert (=> b!1070059 (= e!610779 true)))

(declare-fun lt!472754 () ListLongMap!14449)

(declare-fun getCurrentListMap!4055 (array!68388 array!68386 (_ BitVec 32) (_ BitVec 32) V!39449 V!39449 (_ BitVec 32) Int) ListLongMap!14449)

(assert (=> b!1070059 (= lt!472754 (getCurrentListMap!4055 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94650 res!713909) b!1070055))

(assert (= (and b!1070055 res!713912) b!1070056))

(assert (= (and b!1070056 res!713910) b!1070054))

(assert (= (and b!1070054 res!713913) b!1070053))

(assert (= (and b!1070053 (not res!713911)) b!1070059))

(assert (= (and b!1070057 condMapEmpty!40306) mapIsEmpty!40306))

(assert (= (and b!1070057 (not condMapEmpty!40306)) mapNonEmpty!40306))

(get-info :version)

(assert (= (and mapNonEmpty!40306 ((_ is ValueCellFull!12164) mapValue!40306)) b!1070052))

(assert (= (and b!1070057 ((_ is ValueCellFull!12164) mapDefault!40306)) b!1070058))

(assert (= start!94650 b!1070057))

(declare-fun m!987967 () Bool)

(assert (=> mapNonEmpty!40306 m!987967))

(declare-fun m!987969 () Bool)

(assert (=> b!1070054 m!987969))

(declare-fun m!987971 () Bool)

(assert (=> b!1070053 m!987971))

(declare-fun m!987973 () Bool)

(assert (=> b!1070053 m!987973))

(declare-fun m!987975 () Bool)

(assert (=> b!1070053 m!987975))

(declare-fun m!987977 () Bool)

(assert (=> b!1070059 m!987977))

(declare-fun m!987979 () Bool)

(assert (=> start!94650 m!987979))

(declare-fun m!987981 () Bool)

(assert (=> start!94650 m!987981))

(declare-fun m!987983 () Bool)

(assert (=> start!94650 m!987983))

(declare-fun m!987985 () Bool)

(assert (=> b!1070056 m!987985))

(check-sat (not mapNonEmpty!40306) tp_is_empty!25735 (not b_next!21925) (not b!1070054) (not start!94650) (not b!1070059) b_and!34719 (not b!1070056) (not b!1070053))
(check-sat b_and!34719 (not b_next!21925))
