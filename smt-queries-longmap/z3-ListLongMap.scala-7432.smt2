; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94678 () Bool)

(assert start!94678)

(declare-fun b_free!21769 () Bool)

(declare-fun b_next!21769 () Bool)

(assert (=> start!94678 (= b_free!21769 (not b_next!21769))))

(declare-fun tp!76753 () Bool)

(declare-fun b_and!34571 () Bool)

(assert (=> start!94678 (= tp!76753 b_and!34571)))

(declare-fun b!1069209 () Bool)

(declare-fun e!610018 () Bool)

(declare-fun e!610014 () Bool)

(assert (=> b!1069209 (= e!610018 (not e!610014))))

(declare-fun res!713126 () Bool)

(assert (=> b!1069209 (=> res!713126 e!610014)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069209 (= res!713126 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39241 0))(
  ( (V!39242 (val!12840 Int)) )
))
(declare-datatypes ((tuple2!16276 0))(
  ( (tuple2!16277 (_1!8149 (_ BitVec 64)) (_2!8149 V!39241)) )
))
(declare-datatypes ((List!22845 0))(
  ( (Nil!22842) (Cons!22841 (h!24059 tuple2!16276) (t!32162 List!22845)) )
))
(declare-datatypes ((ListLongMap!14253 0))(
  ( (ListLongMap!14254 (toList!7142 List!22845)) )
))
(declare-fun lt!472193 () ListLongMap!14253)

(declare-fun lt!472197 () ListLongMap!14253)

(assert (=> b!1069209 (= lt!472193 lt!472197)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39241)

(declare-datatypes ((Unit!35078 0))(
  ( (Unit!35079) )
))
(declare-fun lt!472194 () Unit!35078)

(declare-datatypes ((ValueCell!12086 0))(
  ( (ValueCellFull!12086 (v!15450 V!39241)) (EmptyCell!12086) )
))
(declare-datatypes ((array!68185 0))(
  ( (array!68186 (arr!32786 (Array (_ BitVec 32) ValueCell!12086)) (size!33323 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68185)

(declare-fun minValue!907 () V!39241)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39241)

(declare-datatypes ((array!68187 0))(
  ( (array!68188 (arr!32787 (Array (_ BitVec 32) (_ BitVec 64))) (size!33324 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68187)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!761 (array!68187 array!68185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 V!39241 V!39241 (_ BitVec 32) Int) Unit!35078)

(assert (=> b!1069209 (= lt!472194 (lemmaNoChangeToArrayThenSameMapNoExtras!761 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3758 (array!68187 array!68185 (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 (_ BitVec 32) Int) ListLongMap!14253)

(assert (=> b!1069209 (= lt!472197 (getCurrentListMapNoExtraKeys!3758 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069209 (= lt!472193 (getCurrentListMapNoExtraKeys!3758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40063 () Bool)

(declare-fun mapRes!40063 () Bool)

(assert (=> mapIsEmpty!40063 mapRes!40063))

(declare-fun b!1069210 () Bool)

(declare-fun e!610012 () Bool)

(declare-fun tp_is_empty!25579 () Bool)

(assert (=> b!1069210 (= e!610012 tp_is_empty!25579)))

(declare-fun b!1069211 () Bool)

(declare-fun res!713125 () Bool)

(assert (=> b!1069211 (=> (not res!713125) (not e!610018))))

(assert (=> b!1069211 (= res!713125 (and (= (size!33323 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33324 _keys!1163) (size!33323 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069212 () Bool)

(declare-fun res!713129 () Bool)

(assert (=> b!1069212 (=> (not res!713129) (not e!610018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68187 (_ BitVec 32)) Bool)

(assert (=> b!1069212 (= res!713129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069213 () Bool)

(declare-fun e!610017 () Bool)

(assert (=> b!1069213 (= e!610014 e!610017)))

(declare-fun res!713128 () Bool)

(assert (=> b!1069213 (=> res!713128 e!610017)))

(declare-fun lt!472196 () ListLongMap!14253)

(declare-fun contains!6305 (ListLongMap!14253 (_ BitVec 64)) Bool)

(assert (=> b!1069213 (= res!713128 (contains!6305 lt!472196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4068 (array!68187 array!68185 (_ BitVec 32) (_ BitVec 32) V!39241 V!39241 (_ BitVec 32) Int) ListLongMap!14253)

(assert (=> b!1069213 (= lt!472196 (getCurrentListMap!4068 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069214 () Bool)

(declare-fun e!610016 () Bool)

(declare-fun e!610015 () Bool)

(assert (=> b!1069214 (= e!610016 (and e!610015 mapRes!40063))))

(declare-fun condMapEmpty!40063 () Bool)

(declare-fun mapDefault!40063 () ValueCell!12086)

(assert (=> b!1069214 (= condMapEmpty!40063 (= (arr!32786 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12086)) mapDefault!40063)))))

(declare-fun b!1069215 () Bool)

(declare-fun res!713127 () Bool)

(assert (=> b!1069215 (=> (not res!713127) (not e!610018))))

(declare-datatypes ((List!22846 0))(
  ( (Nil!22843) (Cons!22842 (h!24060 (_ BitVec 64)) (t!32163 List!22846)) )
))
(declare-fun arrayNoDuplicates!0 (array!68187 (_ BitVec 32) List!22846) Bool)

(assert (=> b!1069215 (= res!713127 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22843))))

(declare-fun b!1069216 () Bool)

(assert (=> b!1069216 (= e!610015 tp_is_empty!25579)))

(declare-fun res!713130 () Bool)

(assert (=> start!94678 (=> (not res!713130) (not e!610018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94678 (= res!713130 (validMask!0 mask!1515))))

(assert (=> start!94678 e!610018))

(assert (=> start!94678 true))

(assert (=> start!94678 tp_is_empty!25579))

(declare-fun array_inv!25402 (array!68185) Bool)

(assert (=> start!94678 (and (array_inv!25402 _values!955) e!610016)))

(assert (=> start!94678 tp!76753))

(declare-fun array_inv!25403 (array!68187) Bool)

(assert (=> start!94678 (array_inv!25403 _keys!1163)))

(declare-fun mapNonEmpty!40063 () Bool)

(declare-fun tp!76754 () Bool)

(assert (=> mapNonEmpty!40063 (= mapRes!40063 (and tp!76754 e!610012))))

(declare-fun mapKey!40063 () (_ BitVec 32))

(declare-fun mapValue!40063 () ValueCell!12086)

(declare-fun mapRest!40063 () (Array (_ BitVec 32) ValueCell!12086))

(assert (=> mapNonEmpty!40063 (= (arr!32786 _values!955) (store mapRest!40063 mapKey!40063 mapValue!40063))))

(declare-fun b!1069217 () Bool)

(assert (=> b!1069217 (= e!610017 true)))

(declare-fun -!630 (ListLongMap!14253 (_ BitVec 64)) ListLongMap!14253)

(assert (=> b!1069217 (= (-!630 lt!472196 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472196)))

(declare-fun lt!472195 () Unit!35078)

(declare-fun removeNotPresentStillSame!47 (ListLongMap!14253 (_ BitVec 64)) Unit!35078)

(assert (=> b!1069217 (= lt!472195 (removeNotPresentStillSame!47 lt!472196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94678 res!713130) b!1069211))

(assert (= (and b!1069211 res!713125) b!1069212))

(assert (= (and b!1069212 res!713129) b!1069215))

(assert (= (and b!1069215 res!713127) b!1069209))

(assert (= (and b!1069209 (not res!713126)) b!1069213))

(assert (= (and b!1069213 (not res!713128)) b!1069217))

(assert (= (and b!1069214 condMapEmpty!40063) mapIsEmpty!40063))

(assert (= (and b!1069214 (not condMapEmpty!40063)) mapNonEmpty!40063))

(get-info :version)

(assert (= (and mapNonEmpty!40063 ((_ is ValueCellFull!12086) mapValue!40063)) b!1069210))

(assert (= (and b!1069214 ((_ is ValueCellFull!12086) mapDefault!40063)) b!1069216))

(assert (= start!94678 b!1069214))

(declare-fun m!988171 () Bool)

(assert (=> b!1069213 m!988171))

(declare-fun m!988173 () Bool)

(assert (=> b!1069213 m!988173))

(declare-fun m!988175 () Bool)

(assert (=> b!1069217 m!988175))

(declare-fun m!988177 () Bool)

(assert (=> b!1069217 m!988177))

(declare-fun m!988179 () Bool)

(assert (=> mapNonEmpty!40063 m!988179))

(declare-fun m!988181 () Bool)

(assert (=> b!1069215 m!988181))

(declare-fun m!988183 () Bool)

(assert (=> b!1069209 m!988183))

(declare-fun m!988185 () Bool)

(assert (=> b!1069209 m!988185))

(declare-fun m!988187 () Bool)

(assert (=> b!1069209 m!988187))

(declare-fun m!988189 () Bool)

(assert (=> start!94678 m!988189))

(declare-fun m!988191 () Bool)

(assert (=> start!94678 m!988191))

(declare-fun m!988193 () Bool)

(assert (=> start!94678 m!988193))

(declare-fun m!988195 () Bool)

(assert (=> b!1069212 m!988195))

(check-sat (not start!94678) (not b!1069215) (not b!1069213) tp_is_empty!25579 (not b_next!21769) b_and!34571 (not b!1069209) (not b!1069217) (not b!1069212) (not mapNonEmpty!40063))
(check-sat b_and!34571 (not b_next!21769))
