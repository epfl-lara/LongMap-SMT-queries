; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71058 () Bool)

(assert start!71058)

(declare-fun b_free!13245 () Bool)

(declare-fun b_next!13245 () Bool)

(assert (=> start!71058 (= b_free!13245 (not b_next!13245))))

(declare-fun tp!46491 () Bool)

(declare-fun b_and!22159 () Bool)

(assert (=> start!71058 (= tp!46491 b_and!22159)))

(declare-fun mapIsEmpty!24055 () Bool)

(declare-fun mapRes!24055 () Bool)

(assert (=> mapIsEmpty!24055 mapRes!24055))

(declare-fun b!825138 () Bool)

(declare-fun e!459199 () Bool)

(declare-fun e!459194 () Bool)

(assert (=> b!825138 (= e!459199 (and e!459194 mapRes!24055))))

(declare-fun condMapEmpty!24055 () Bool)

(declare-datatypes ((V!24941 0))(
  ( (V!24942 (val!7525 Int)) )
))
(declare-datatypes ((ValueCell!7062 0))(
  ( (ValueCellFull!7062 (v!9958 V!24941)) (EmptyCell!7062) )
))
(declare-datatypes ((array!46098 0))(
  ( (array!46099 (arr!22095 (Array (_ BitVec 32) ValueCell!7062)) (size!22516 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46098)

(declare-fun mapDefault!24055 () ValueCell!7062)

(assert (=> b!825138 (= condMapEmpty!24055 (= (arr!22095 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7062)) mapDefault!24055)))))

(declare-fun b!825139 () Bool)

(declare-fun zeroValueAfter!34 () V!24941)

(declare-fun e!459197 () Bool)

(declare-datatypes ((tuple2!9960 0))(
  ( (tuple2!9961 (_1!4991 (_ BitVec 64)) (_2!4991 V!24941)) )
))
(declare-datatypes ((List!15766 0))(
  ( (Nil!15763) (Cons!15762 (h!16891 tuple2!9960) (t!22111 List!15766)) )
))
(declare-datatypes ((ListLongMap!8783 0))(
  ( (ListLongMap!8784 (toList!4407 List!15766)) )
))
(declare-fun lt!372261 () ListLongMap!8783)

(declare-fun lt!372262 () tuple2!9960)

(declare-fun lt!372264 () ListLongMap!8783)

(declare-fun +!1916 (ListLongMap!8783 tuple2!9960) ListLongMap!8783)

(assert (=> b!825139 (= e!459197 (= lt!372264 (+!1916 (+!1916 lt!372261 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372262)))))

(declare-fun e!459201 () Bool)

(declare-fun b!825140 () Bool)

(declare-fun lt!372263 () tuple2!9960)

(assert (=> b!825140 (= e!459201 (= lt!372264 (+!1916 (+!1916 lt!372261 lt!372262) lt!372263)))))

(declare-fun b!825141 () Bool)

(declare-fun e!459198 () Bool)

(declare-fun e!459195 () Bool)

(assert (=> b!825141 (= e!459198 (not e!459195))))

(declare-fun res!562491 () Bool)

(assert (=> b!825141 (=> res!562491 e!459195)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825141 (= res!562491 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372259 () ListLongMap!8783)

(assert (=> b!825141 (= lt!372259 lt!372261)))

(declare-fun zeroValueBefore!34 () V!24941)

(declare-datatypes ((array!46100 0))(
  ( (array!46101 (arr!22096 (Array (_ BitVec 32) (_ BitVec 64))) (size!22517 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46100)

(declare-fun minValue!754 () V!24941)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28279 0))(
  ( (Unit!28280) )
))
(declare-fun lt!372253 () Unit!28279)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!530 (array!46100 array!46098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24941 V!24941 V!24941 V!24941 (_ BitVec 32) Int) Unit!28279)

(assert (=> b!825141 (= lt!372253 (lemmaNoChangeToArrayThenSameMapNoExtras!530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2420 (array!46100 array!46098 (_ BitVec 32) (_ BitVec 32) V!24941 V!24941 (_ BitVec 32) Int) ListLongMap!8783)

(assert (=> b!825141 (= lt!372261 (getCurrentListMapNoExtraKeys!2420 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825141 (= lt!372259 (getCurrentListMapNoExtraKeys!2420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825142 () Bool)

(declare-fun res!562488 () Bool)

(assert (=> b!825142 (=> (not res!562488) (not e!459198))))

(declare-datatypes ((List!15767 0))(
  ( (Nil!15764) (Cons!15763 (h!16892 (_ BitVec 64)) (t!22112 List!15767)) )
))
(declare-fun arrayNoDuplicates!0 (array!46100 (_ BitVec 32) List!15767) Bool)

(assert (=> b!825142 (= res!562488 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15764))))

(declare-fun b!825143 () Bool)

(declare-fun res!562489 () Bool)

(assert (=> b!825143 (=> (not res!562489) (not e!459198))))

(assert (=> b!825143 (= res!562489 (and (= (size!22516 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22517 _keys!976) (size!22516 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24055 () Bool)

(declare-fun tp!46492 () Bool)

(declare-fun e!459196 () Bool)

(assert (=> mapNonEmpty!24055 (= mapRes!24055 (and tp!46492 e!459196))))

(declare-fun mapValue!24055 () ValueCell!7062)

(declare-fun mapRest!24055 () (Array (_ BitVec 32) ValueCell!7062))

(declare-fun mapKey!24055 () (_ BitVec 32))

(assert (=> mapNonEmpty!24055 (= (arr!22095 _values!788) (store mapRest!24055 mapKey!24055 mapValue!24055))))

(declare-fun b!825144 () Bool)

(declare-fun tp_is_empty!14955 () Bool)

(assert (=> b!825144 (= e!459194 tp_is_empty!14955)))

(declare-fun res!562490 () Bool)

(assert (=> start!71058 (=> (not res!562490) (not e!459198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71058 (= res!562490 (validMask!0 mask!1312))))

(assert (=> start!71058 e!459198))

(assert (=> start!71058 tp_is_empty!14955))

(declare-fun array_inv!17621 (array!46100) Bool)

(assert (=> start!71058 (array_inv!17621 _keys!976)))

(assert (=> start!71058 true))

(declare-fun array_inv!17622 (array!46098) Bool)

(assert (=> start!71058 (and (array_inv!17622 _values!788) e!459199)))

(assert (=> start!71058 tp!46491))

(declare-fun b!825145 () Bool)

(assert (=> b!825145 (= e!459196 tp_is_empty!14955)))

(declare-fun b!825146 () Bool)

(assert (=> b!825146 (= e!459195 true)))

(declare-fun lt!372258 () ListLongMap!8783)

(assert (=> b!825146 (= lt!372258 (+!1916 (+!1916 lt!372259 lt!372263) lt!372262))))

(declare-fun lt!372257 () ListLongMap!8783)

(declare-fun lt!372254 () ListLongMap!8783)

(assert (=> b!825146 (and (= lt!372257 lt!372254) (= lt!372264 lt!372254) (= lt!372264 lt!372257))))

(declare-fun lt!372260 () ListLongMap!8783)

(assert (=> b!825146 (= lt!372254 (+!1916 lt!372260 lt!372263))))

(declare-fun lt!372256 () ListLongMap!8783)

(assert (=> b!825146 (= lt!372257 (+!1916 lt!372256 lt!372263))))

(declare-fun lt!372251 () Unit!28279)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!204 (ListLongMap!8783 (_ BitVec 64) V!24941 V!24941) Unit!28279)

(assert (=> b!825146 (= lt!372251 (addSameAsAddTwiceSameKeyDiffValues!204 lt!372256 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825146 e!459201))

(declare-fun res!562492 () Bool)

(assert (=> b!825146 (=> (not res!562492) (not e!459201))))

(declare-fun lt!372252 () ListLongMap!8783)

(assert (=> b!825146 (= res!562492 (= lt!372252 lt!372260))))

(declare-fun lt!372255 () tuple2!9960)

(assert (=> b!825146 (= lt!372260 (+!1916 lt!372256 lt!372255))))

(assert (=> b!825146 (= lt!372256 (+!1916 lt!372259 lt!372262))))

(assert (=> b!825146 (= lt!372263 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825146 e!459197))

(declare-fun res!562486 () Bool)

(assert (=> b!825146 (=> (not res!562486) (not e!459197))))

(assert (=> b!825146 (= res!562486 (= lt!372252 (+!1916 (+!1916 lt!372259 lt!372255) lt!372262)))))

(assert (=> b!825146 (= lt!372262 (tuple2!9961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825146 (= lt!372255 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2544 (array!46100 array!46098 (_ BitVec 32) (_ BitVec 32) V!24941 V!24941 (_ BitVec 32) Int) ListLongMap!8783)

(assert (=> b!825146 (= lt!372264 (getCurrentListMap!2544 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825146 (= lt!372252 (getCurrentListMap!2544 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825147 () Bool)

(declare-fun res!562487 () Bool)

(assert (=> b!825147 (=> (not res!562487) (not e!459198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46100 (_ BitVec 32)) Bool)

(assert (=> b!825147 (= res!562487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71058 res!562490) b!825143))

(assert (= (and b!825143 res!562489) b!825147))

(assert (= (and b!825147 res!562487) b!825142))

(assert (= (and b!825142 res!562488) b!825141))

(assert (= (and b!825141 (not res!562491)) b!825146))

(assert (= (and b!825146 res!562486) b!825139))

(assert (= (and b!825146 res!562492) b!825140))

(assert (= (and b!825138 condMapEmpty!24055) mapIsEmpty!24055))

(assert (= (and b!825138 (not condMapEmpty!24055)) mapNonEmpty!24055))

(get-info :version)

(assert (= (and mapNonEmpty!24055 ((_ is ValueCellFull!7062) mapValue!24055)) b!825145))

(assert (= (and b!825138 ((_ is ValueCellFull!7062) mapDefault!24055)) b!825144))

(assert (= start!71058 b!825138))

(declare-fun m!767117 () Bool)

(assert (=> b!825146 m!767117))

(declare-fun m!767119 () Bool)

(assert (=> b!825146 m!767119))

(declare-fun m!767121 () Bool)

(assert (=> b!825146 m!767121))

(declare-fun m!767123 () Bool)

(assert (=> b!825146 m!767123))

(declare-fun m!767125 () Bool)

(assert (=> b!825146 m!767125))

(assert (=> b!825146 m!767123))

(declare-fun m!767127 () Bool)

(assert (=> b!825146 m!767127))

(declare-fun m!767129 () Bool)

(assert (=> b!825146 m!767129))

(declare-fun m!767131 () Bool)

(assert (=> b!825146 m!767131))

(assert (=> b!825146 m!767117))

(declare-fun m!767133 () Bool)

(assert (=> b!825146 m!767133))

(declare-fun m!767135 () Bool)

(assert (=> b!825146 m!767135))

(declare-fun m!767137 () Bool)

(assert (=> b!825146 m!767137))

(declare-fun m!767139 () Bool)

(assert (=> b!825140 m!767139))

(assert (=> b!825140 m!767139))

(declare-fun m!767141 () Bool)

(assert (=> b!825140 m!767141))

(declare-fun m!767143 () Bool)

(assert (=> b!825142 m!767143))

(declare-fun m!767145 () Bool)

(assert (=> mapNonEmpty!24055 m!767145))

(declare-fun m!767147 () Bool)

(assert (=> b!825139 m!767147))

(assert (=> b!825139 m!767147))

(declare-fun m!767149 () Bool)

(assert (=> b!825139 m!767149))

(declare-fun m!767151 () Bool)

(assert (=> b!825141 m!767151))

(declare-fun m!767153 () Bool)

(assert (=> b!825141 m!767153))

(declare-fun m!767155 () Bool)

(assert (=> b!825141 m!767155))

(declare-fun m!767157 () Bool)

(assert (=> b!825147 m!767157))

(declare-fun m!767159 () Bool)

(assert (=> start!71058 m!767159))

(declare-fun m!767161 () Bool)

(assert (=> start!71058 m!767161))

(declare-fun m!767163 () Bool)

(assert (=> start!71058 m!767163))

(check-sat (not mapNonEmpty!24055) (not b!825140) (not b_next!13245) tp_is_empty!14955 (not b!825142) (not b!825146) (not start!71058) b_and!22159 (not b!825141) (not b!825139) (not b!825147))
(check-sat b_and!22159 (not b_next!13245))
