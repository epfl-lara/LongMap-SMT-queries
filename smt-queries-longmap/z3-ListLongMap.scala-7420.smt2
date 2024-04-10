; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94358 () Bool)

(assert start!94358)

(declare-fun b_free!21699 () Bool)

(declare-fun b_next!21699 () Bool)

(assert (=> start!94358 (= b_free!21699 (not b_next!21699))))

(declare-fun tp!76541 () Bool)

(declare-fun b_and!34483 () Bool)

(assert (=> start!94358 (= tp!76541 b_and!34483)))

(declare-fun b!1066995 () Bool)

(declare-fun res!712086 () Bool)

(declare-fun e!608513 () Bool)

(assert (=> b!1066995 (=> (not res!712086) (not e!608513))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39147 0))(
  ( (V!39148 (val!12805 Int)) )
))
(declare-datatypes ((ValueCell!12051 0))(
  ( (ValueCellFull!12051 (v!15419 V!39147)) (EmptyCell!12051) )
))
(declare-datatypes ((array!68003 0))(
  ( (array!68004 (arr!32702 (Array (_ BitVec 32) ValueCell!12051)) (size!33238 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68003)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68005 0))(
  ( (array!68006 (arr!32703 (Array (_ BitVec 32) (_ BitVec 64))) (size!33239 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68005)

(assert (=> b!1066995 (= res!712086 (and (= (size!33238 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33239 _keys!1163) (size!33238 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066996 () Bool)

(assert (=> b!1066996 (= e!608513 (not true))))

(declare-datatypes ((tuple2!16246 0))(
  ( (tuple2!16247 (_1!8134 (_ BitVec 64)) (_2!8134 V!39147)) )
))
(declare-datatypes ((List!22806 0))(
  ( (Nil!22803) (Cons!22802 (h!24011 tuple2!16246) (t!32129 List!22806)) )
))
(declare-datatypes ((ListLongMap!14215 0))(
  ( (ListLongMap!14216 (toList!7123 List!22806)) )
))
(declare-fun lt!471256 () ListLongMap!14215)

(declare-fun lt!471258 () ListLongMap!14215)

(assert (=> b!1066996 (= lt!471256 lt!471258)))

(declare-fun zeroValueBefore!47 () V!39147)

(declare-datatypes ((Unit!35043 0))(
  ( (Unit!35044) )
))
(declare-fun lt!471257 () Unit!35043)

(declare-fun minValue!907 () V!39147)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39147)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!744 (array!68005 array!68003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39147 V!39147 V!39147 V!39147 (_ BitVec 32) Int) Unit!35043)

(assert (=> b!1066996 (= lt!471257 (lemmaNoChangeToArrayThenSameMapNoExtras!744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3707 (array!68005 array!68003 (_ BitVec 32) (_ BitVec 32) V!39147 V!39147 (_ BitVec 32) Int) ListLongMap!14215)

(assert (=> b!1066996 (= lt!471258 (getCurrentListMapNoExtraKeys!3707 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066996 (= lt!471256 (getCurrentListMapNoExtraKeys!3707 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066997 () Bool)

(declare-fun res!712088 () Bool)

(assert (=> b!1066997 (=> (not res!712088) (not e!608513))))

(declare-datatypes ((List!22807 0))(
  ( (Nil!22804) (Cons!22803 (h!24012 (_ BitVec 64)) (t!32130 List!22807)) )
))
(declare-fun arrayNoDuplicates!0 (array!68005 (_ BitVec 32) List!22807) Bool)

(assert (=> b!1066997 (= res!712088 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22804))))

(declare-fun b!1066998 () Bool)

(declare-fun e!608512 () Bool)

(declare-fun tp_is_empty!25509 () Bool)

(assert (=> b!1066998 (= e!608512 tp_is_empty!25509)))

(declare-fun mapIsEmpty!39955 () Bool)

(declare-fun mapRes!39955 () Bool)

(assert (=> mapIsEmpty!39955 mapRes!39955))

(declare-fun mapNonEmpty!39955 () Bool)

(declare-fun tp!76540 () Bool)

(assert (=> mapNonEmpty!39955 (= mapRes!39955 (and tp!76540 e!608512))))

(declare-fun mapRest!39955 () (Array (_ BitVec 32) ValueCell!12051))

(declare-fun mapKey!39955 () (_ BitVec 32))

(declare-fun mapValue!39955 () ValueCell!12051)

(assert (=> mapNonEmpty!39955 (= (arr!32702 _values!955) (store mapRest!39955 mapKey!39955 mapValue!39955))))

(declare-fun b!1066999 () Bool)

(declare-fun res!712085 () Bool)

(assert (=> b!1066999 (=> (not res!712085) (not e!608513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68005 (_ BitVec 32)) Bool)

(assert (=> b!1066999 (= res!712085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067000 () Bool)

(declare-fun e!608511 () Bool)

(declare-fun e!608514 () Bool)

(assert (=> b!1067000 (= e!608511 (and e!608514 mapRes!39955))))

(declare-fun condMapEmpty!39955 () Bool)

(declare-fun mapDefault!39955 () ValueCell!12051)

(assert (=> b!1067000 (= condMapEmpty!39955 (= (arr!32702 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12051)) mapDefault!39955)))))

(declare-fun res!712087 () Bool)

(assert (=> start!94358 (=> (not res!712087) (not e!608513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94358 (= res!712087 (validMask!0 mask!1515))))

(assert (=> start!94358 e!608513))

(assert (=> start!94358 true))

(assert (=> start!94358 tp_is_empty!25509))

(declare-fun array_inv!25318 (array!68003) Bool)

(assert (=> start!94358 (and (array_inv!25318 _values!955) e!608511)))

(assert (=> start!94358 tp!76541))

(declare-fun array_inv!25319 (array!68005) Bool)

(assert (=> start!94358 (array_inv!25319 _keys!1163)))

(declare-fun b!1067001 () Bool)

(assert (=> b!1067001 (= e!608514 tp_is_empty!25509)))

(assert (= (and start!94358 res!712087) b!1066995))

(assert (= (and b!1066995 res!712086) b!1066999))

(assert (= (and b!1066999 res!712085) b!1066997))

(assert (= (and b!1066997 res!712088) b!1066996))

(assert (= (and b!1067000 condMapEmpty!39955) mapIsEmpty!39955))

(assert (= (and b!1067000 (not condMapEmpty!39955)) mapNonEmpty!39955))

(get-info :version)

(assert (= (and mapNonEmpty!39955 ((_ is ValueCellFull!12051) mapValue!39955)) b!1066998))

(assert (= (and b!1067000 ((_ is ValueCellFull!12051) mapDefault!39955)) b!1067001))

(assert (= start!94358 b!1067000))

(declare-fun m!985719 () Bool)

(assert (=> b!1066996 m!985719))

(declare-fun m!985721 () Bool)

(assert (=> b!1066996 m!985721))

(declare-fun m!985723 () Bool)

(assert (=> b!1066996 m!985723))

(declare-fun m!985725 () Bool)

(assert (=> b!1066999 m!985725))

(declare-fun m!985727 () Bool)

(assert (=> start!94358 m!985727))

(declare-fun m!985729 () Bool)

(assert (=> start!94358 m!985729))

(declare-fun m!985731 () Bool)

(assert (=> start!94358 m!985731))

(declare-fun m!985733 () Bool)

(assert (=> mapNonEmpty!39955 m!985733))

(declare-fun m!985735 () Bool)

(assert (=> b!1066997 m!985735))

(check-sat (not b_next!21699) tp_is_empty!25509 (not b!1066996) (not start!94358) (not b!1066997) (not b!1066999) (not mapNonEmpty!39955) b_and!34483)
(check-sat b_and!34483 (not b_next!21699))
