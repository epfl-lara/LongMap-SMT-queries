; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94394 () Bool)

(assert start!94394)

(declare-fun b_free!21735 () Bool)

(declare-fun b_next!21735 () Bool)

(assert (=> start!94394 (= b_free!21735 (not b_next!21735))))

(declare-fun tp!76649 () Bool)

(declare-fun b_and!34519 () Bool)

(assert (=> start!94394 (= tp!76649 b_and!34519)))

(declare-fun res!712301 () Bool)

(declare-fun e!608784 () Bool)

(assert (=> start!94394 (=> (not res!712301) (not e!608784))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94394 (= res!712301 (validMask!0 mask!1515))))

(assert (=> start!94394 e!608784))

(assert (=> start!94394 true))

(declare-fun tp_is_empty!25545 () Bool)

(assert (=> start!94394 tp_is_empty!25545))

(declare-datatypes ((V!39195 0))(
  ( (V!39196 (val!12823 Int)) )
))
(declare-datatypes ((ValueCell!12069 0))(
  ( (ValueCellFull!12069 (v!15437 V!39195)) (EmptyCell!12069) )
))
(declare-datatypes ((array!68071 0))(
  ( (array!68072 (arr!32736 (Array (_ BitVec 32) ValueCell!12069)) (size!33272 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68071)

(declare-fun e!608782 () Bool)

(declare-fun array_inv!25342 (array!68071) Bool)

(assert (=> start!94394 (and (array_inv!25342 _values!955) e!608782)))

(assert (=> start!94394 tp!76649))

(declare-datatypes ((array!68073 0))(
  ( (array!68074 (arr!32737 (Array (_ BitVec 32) (_ BitVec 64))) (size!33273 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68073)

(declare-fun array_inv!25343 (array!68073) Bool)

(assert (=> start!94394 (array_inv!25343 _keys!1163)))

(declare-fun mapIsEmpty!40009 () Bool)

(declare-fun mapRes!40009 () Bool)

(assert (=> mapIsEmpty!40009 mapRes!40009))

(declare-fun b!1067373 () Bool)

(declare-fun e!608781 () Bool)

(assert (=> b!1067373 (= e!608781 tp_is_empty!25545)))

(declare-fun b!1067374 () Bool)

(assert (=> b!1067374 (= e!608784 (not true))))

(declare-datatypes ((tuple2!16270 0))(
  ( (tuple2!16271 (_1!8146 (_ BitVec 64)) (_2!8146 V!39195)) )
))
(declare-datatypes ((List!22829 0))(
  ( (Nil!22826) (Cons!22825 (h!24034 tuple2!16270) (t!32152 List!22829)) )
))
(declare-datatypes ((ListLongMap!14239 0))(
  ( (ListLongMap!14240 (toList!7135 List!22829)) )
))
(declare-fun lt!471420 () ListLongMap!14239)

(declare-fun lt!471419 () ListLongMap!14239)

(assert (=> b!1067374 (= lt!471420 lt!471419)))

(declare-fun zeroValueBefore!47 () V!39195)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39195)

(declare-datatypes ((Unit!35067 0))(
  ( (Unit!35068) )
))
(declare-fun lt!471418 () Unit!35067)

(declare-fun minValue!907 () V!39195)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!756 (array!68073 array!68071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39195 V!39195 V!39195 V!39195 (_ BitVec 32) Int) Unit!35067)

(assert (=> b!1067374 (= lt!471418 (lemmaNoChangeToArrayThenSameMapNoExtras!756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3719 (array!68073 array!68071 (_ BitVec 32) (_ BitVec 32) V!39195 V!39195 (_ BitVec 32) Int) ListLongMap!14239)

(assert (=> b!1067374 (= lt!471419 (getCurrentListMapNoExtraKeys!3719 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067374 (= lt!471420 (getCurrentListMapNoExtraKeys!3719 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067375 () Bool)

(assert (=> b!1067375 (= e!608782 (and e!608781 mapRes!40009))))

(declare-fun condMapEmpty!40009 () Bool)

(declare-fun mapDefault!40009 () ValueCell!12069)

(assert (=> b!1067375 (= condMapEmpty!40009 (= (arr!32736 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12069)) mapDefault!40009)))))

(declare-fun b!1067376 () Bool)

(declare-fun res!712302 () Bool)

(assert (=> b!1067376 (=> (not res!712302) (not e!608784))))

(declare-datatypes ((List!22830 0))(
  ( (Nil!22827) (Cons!22826 (h!24035 (_ BitVec 64)) (t!32153 List!22830)) )
))
(declare-fun arrayNoDuplicates!0 (array!68073 (_ BitVec 32) List!22830) Bool)

(assert (=> b!1067376 (= res!712302 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22827))))

(declare-fun b!1067377 () Bool)

(declare-fun res!712304 () Bool)

(assert (=> b!1067377 (=> (not res!712304) (not e!608784))))

(assert (=> b!1067377 (= res!712304 (and (= (size!33272 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33273 _keys!1163) (size!33272 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067378 () Bool)

(declare-fun e!608780 () Bool)

(assert (=> b!1067378 (= e!608780 tp_is_empty!25545)))

(declare-fun mapNonEmpty!40009 () Bool)

(declare-fun tp!76648 () Bool)

(assert (=> mapNonEmpty!40009 (= mapRes!40009 (and tp!76648 e!608780))))

(declare-fun mapRest!40009 () (Array (_ BitVec 32) ValueCell!12069))

(declare-fun mapKey!40009 () (_ BitVec 32))

(declare-fun mapValue!40009 () ValueCell!12069)

(assert (=> mapNonEmpty!40009 (= (arr!32736 _values!955) (store mapRest!40009 mapKey!40009 mapValue!40009))))

(declare-fun b!1067379 () Bool)

(declare-fun res!712303 () Bool)

(assert (=> b!1067379 (=> (not res!712303) (not e!608784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68073 (_ BitVec 32)) Bool)

(assert (=> b!1067379 (= res!712303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94394 res!712301) b!1067377))

(assert (= (and b!1067377 res!712304) b!1067379))

(assert (= (and b!1067379 res!712303) b!1067376))

(assert (= (and b!1067376 res!712302) b!1067374))

(assert (= (and b!1067375 condMapEmpty!40009) mapIsEmpty!40009))

(assert (= (and b!1067375 (not condMapEmpty!40009)) mapNonEmpty!40009))

(get-info :version)

(assert (= (and mapNonEmpty!40009 ((_ is ValueCellFull!12069) mapValue!40009)) b!1067378))

(assert (= (and b!1067375 ((_ is ValueCellFull!12069) mapDefault!40009)) b!1067373))

(assert (= start!94394 b!1067375))

(declare-fun m!986043 () Bool)

(assert (=> start!94394 m!986043))

(declare-fun m!986045 () Bool)

(assert (=> start!94394 m!986045))

(declare-fun m!986047 () Bool)

(assert (=> start!94394 m!986047))

(declare-fun m!986049 () Bool)

(assert (=> b!1067376 m!986049))

(declare-fun m!986051 () Bool)

(assert (=> mapNonEmpty!40009 m!986051))

(declare-fun m!986053 () Bool)

(assert (=> b!1067379 m!986053))

(declare-fun m!986055 () Bool)

(assert (=> b!1067374 m!986055))

(declare-fun m!986057 () Bool)

(assert (=> b!1067374 m!986057))

(declare-fun m!986059 () Bool)

(assert (=> b!1067374 m!986059))

(check-sat tp_is_empty!25545 (not b!1067376) (not b!1067374) (not start!94394) (not b_next!21735) b_and!34519 (not b!1067379) (not mapNonEmpty!40009))
(check-sat b_and!34519 (not b_next!21735))
