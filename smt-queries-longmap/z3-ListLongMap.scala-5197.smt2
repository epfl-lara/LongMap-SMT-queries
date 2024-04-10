; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70198 () Bool)

(assert start!70198)

(declare-fun b_free!12591 () Bool)

(declare-fun b_next!12591 () Bool)

(assert (=> start!70198 (= b_free!12591 (not b_next!12591))))

(declare-fun tp!44494 () Bool)

(declare-fun b_and!21379 () Bool)

(assert (=> start!70198 (= tp!44494 b_and!21379)))

(declare-fun mapNonEmpty!23038 () Bool)

(declare-fun mapRes!23038 () Bool)

(declare-fun tp!44493 () Bool)

(declare-fun e!452230 () Bool)

(assert (=> mapNonEmpty!23038 (= mapRes!23038 (and tp!44493 e!452230))))

(declare-datatypes ((V!24069 0))(
  ( (V!24070 (val!7198 Int)) )
))
(declare-datatypes ((ValueCell!6735 0))(
  ( (ValueCellFull!6735 (v!9625 V!24069)) (EmptyCell!6735) )
))
(declare-fun mapValue!23038 () ValueCell!6735)

(declare-fun mapRest!23038 () (Array (_ BitVec 32) ValueCell!6735))

(declare-datatypes ((array!44804 0))(
  ( (array!44805 (arr!21460 (Array (_ BitVec 32) ValueCell!6735)) (size!21881 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44804)

(declare-fun mapKey!23038 () (_ BitVec 32))

(assert (=> mapNonEmpty!23038 (= (arr!21460 _values!788) (store mapRest!23038 mapKey!23038 mapValue!23038))))

(declare-fun b!815535 () Bool)

(declare-fun e!452234 () Bool)

(assert (=> b!815535 (= e!452234 true)))

(declare-datatypes ((array!44806 0))(
  ( (array!44807 (arr!21461 (Array (_ BitVec 32) (_ BitVec 64))) (size!21882 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44806)

(declare-fun zeroValueAfter!34 () V!24069)

(declare-fun minValue!754 () V!24069)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9442 0))(
  ( (tuple2!9443 (_1!4732 (_ BitVec 64)) (_2!4732 V!24069)) )
))
(declare-datatypes ((List!15273 0))(
  ( (Nil!15270) (Cons!15269 (h!16398 tuple2!9442) (t!21594 List!15273)) )
))
(declare-datatypes ((ListLongMap!8265 0))(
  ( (ListLongMap!8266 (toList!4148 List!15273)) )
))
(declare-fun lt!365105 () ListLongMap!8265)

(declare-fun getCurrentListMap!2377 (array!44806 array!44804 (_ BitVec 32) (_ BitVec 32) V!24069 V!24069 (_ BitVec 32) Int) ListLongMap!8265)

(assert (=> b!815535 (= lt!365105 (getCurrentListMap!2377 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24069)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365102 () ListLongMap!8265)

(declare-fun +!1783 (ListLongMap!8265 tuple2!9442) ListLongMap!8265)

(assert (=> b!815535 (= lt!365102 (+!1783 (getCurrentListMap!2377 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815537 () Bool)

(declare-fun tp_is_empty!14301 () Bool)

(assert (=> b!815537 (= e!452230 tp_is_empty!14301)))

(declare-fun b!815538 () Bool)

(declare-fun e!452229 () Bool)

(declare-fun e!452233 () Bool)

(assert (=> b!815538 (= e!452229 (and e!452233 mapRes!23038))))

(declare-fun condMapEmpty!23038 () Bool)

(declare-fun mapDefault!23038 () ValueCell!6735)

(assert (=> b!815538 (= condMapEmpty!23038 (= (arr!21460 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6735)) mapDefault!23038)))))

(declare-fun b!815539 () Bool)

(declare-fun res!556872 () Bool)

(declare-fun e!452232 () Bool)

(assert (=> b!815539 (=> (not res!556872) (not e!452232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44806 (_ BitVec 32)) Bool)

(assert (=> b!815539 (= res!556872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23038 () Bool)

(assert (=> mapIsEmpty!23038 mapRes!23038))

(declare-fun b!815540 () Bool)

(declare-fun res!556870 () Bool)

(assert (=> b!815540 (=> (not res!556870) (not e!452232))))

(declare-datatypes ((List!15274 0))(
  ( (Nil!15271) (Cons!15270 (h!16399 (_ BitVec 64)) (t!21595 List!15274)) )
))
(declare-fun arrayNoDuplicates!0 (array!44806 (_ BitVec 32) List!15274) Bool)

(assert (=> b!815540 (= res!556870 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15271))))

(declare-fun res!556874 () Bool)

(assert (=> start!70198 (=> (not res!556874) (not e!452232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70198 (= res!556874 (validMask!0 mask!1312))))

(assert (=> start!70198 e!452232))

(assert (=> start!70198 tp_is_empty!14301))

(declare-fun array_inv!17171 (array!44806) Bool)

(assert (=> start!70198 (array_inv!17171 _keys!976)))

(assert (=> start!70198 true))

(declare-fun array_inv!17172 (array!44804) Bool)

(assert (=> start!70198 (and (array_inv!17172 _values!788) e!452229)))

(assert (=> start!70198 tp!44494))

(declare-fun b!815536 () Bool)

(declare-fun res!556871 () Bool)

(assert (=> b!815536 (=> (not res!556871) (not e!452232))))

(assert (=> b!815536 (= res!556871 (and (= (size!21881 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21882 _keys!976) (size!21881 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815541 () Bool)

(assert (=> b!815541 (= e!452232 (not e!452234))))

(declare-fun res!556873 () Bool)

(assert (=> b!815541 (=> res!556873 e!452234)))

(assert (=> b!815541 (= res!556873 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365101 () ListLongMap!8265)

(declare-fun lt!365103 () ListLongMap!8265)

(assert (=> b!815541 (= lt!365101 lt!365103)))

(declare-datatypes ((Unit!27792 0))(
  ( (Unit!27793) )
))
(declare-fun lt!365104 () Unit!27792)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!307 (array!44806 array!44804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24069 V!24069 V!24069 V!24069 (_ BitVec 32) Int) Unit!27792)

(assert (=> b!815541 (= lt!365104 (lemmaNoChangeToArrayThenSameMapNoExtras!307 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2197 (array!44806 array!44804 (_ BitVec 32) (_ BitVec 32) V!24069 V!24069 (_ BitVec 32) Int) ListLongMap!8265)

(assert (=> b!815541 (= lt!365103 (getCurrentListMapNoExtraKeys!2197 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815541 (= lt!365101 (getCurrentListMapNoExtraKeys!2197 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815542 () Bool)

(assert (=> b!815542 (= e!452233 tp_is_empty!14301)))

(assert (= (and start!70198 res!556874) b!815536))

(assert (= (and b!815536 res!556871) b!815539))

(assert (= (and b!815539 res!556872) b!815540))

(assert (= (and b!815540 res!556870) b!815541))

(assert (= (and b!815541 (not res!556873)) b!815535))

(assert (= (and b!815538 condMapEmpty!23038) mapIsEmpty!23038))

(assert (= (and b!815538 (not condMapEmpty!23038)) mapNonEmpty!23038))

(get-info :version)

(assert (= (and mapNonEmpty!23038 ((_ is ValueCellFull!6735) mapValue!23038)) b!815537))

(assert (= (and b!815538 ((_ is ValueCellFull!6735) mapDefault!23038)) b!815542))

(assert (= start!70198 b!815538))

(declare-fun m!757181 () Bool)

(assert (=> mapNonEmpty!23038 m!757181))

(declare-fun m!757183 () Bool)

(assert (=> b!815535 m!757183))

(declare-fun m!757185 () Bool)

(assert (=> b!815535 m!757185))

(assert (=> b!815535 m!757185))

(declare-fun m!757187 () Bool)

(assert (=> b!815535 m!757187))

(declare-fun m!757189 () Bool)

(assert (=> b!815541 m!757189))

(declare-fun m!757191 () Bool)

(assert (=> b!815541 m!757191))

(declare-fun m!757193 () Bool)

(assert (=> b!815541 m!757193))

(declare-fun m!757195 () Bool)

(assert (=> b!815540 m!757195))

(declare-fun m!757197 () Bool)

(assert (=> b!815539 m!757197))

(declare-fun m!757199 () Bool)

(assert (=> start!70198 m!757199))

(declare-fun m!757201 () Bool)

(assert (=> start!70198 m!757201))

(declare-fun m!757203 () Bool)

(assert (=> start!70198 m!757203))

(check-sat (not b!815540) tp_is_empty!14301 (not b!815539) (not start!70198) (not b!815541) (not b!815535) b_and!21379 (not b_next!12591) (not mapNonEmpty!23038))
(check-sat b_and!21379 (not b_next!12591))
