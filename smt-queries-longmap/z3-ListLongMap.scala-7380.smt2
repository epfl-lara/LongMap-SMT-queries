; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94022 () Bool)

(assert start!94022)

(declare-fun b_free!21459 () Bool)

(declare-fun b_next!21459 () Bool)

(assert (=> start!94022 (= b_free!21459 (not b_next!21459))))

(declare-fun tp!75805 () Bool)

(declare-fun b_and!34191 () Bool)

(assert (=> start!94022 (= tp!75805 b_and!34191)))

(declare-fun b!1063430 () Bool)

(declare-fun e!605938 () Bool)

(assert (=> b!1063430 (= e!605938 true)))

(declare-datatypes ((V!38827 0))(
  ( (V!38828 (val!12685 Int)) )
))
(declare-datatypes ((tuple2!16058 0))(
  ( (tuple2!16059 (_1!8040 (_ BitVec 64)) (_2!8040 V!38827)) )
))
(declare-datatypes ((List!22636 0))(
  ( (Nil!22633) (Cons!22632 (h!23841 tuple2!16058) (t!31949 List!22636)) )
))
(declare-datatypes ((ListLongMap!14027 0))(
  ( (ListLongMap!14028 (toList!7029 List!22636)) )
))
(declare-fun lt!468689 () ListLongMap!14027)

(declare-fun -!589 (ListLongMap!14027 (_ BitVec 64)) ListLongMap!14027)

(assert (=> b!1063430 (= (-!589 lt!468689 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468689)))

(declare-datatypes ((Unit!34856 0))(
  ( (Unit!34857) )
))
(declare-fun lt!468686 () Unit!34856)

(declare-fun removeNotPresentStillSame!36 (ListLongMap!14027 (_ BitVec 64)) Unit!34856)

(assert (=> b!1063430 (= lt!468686 (removeNotPresentStillSame!36 lt!468689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063431 () Bool)

(declare-fun res!710046 () Bool)

(declare-fun e!605941 () Bool)

(assert (=> b!1063431 (=> (not res!710046) (not e!605941))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11931 0))(
  ( (ValueCellFull!11931 (v!15296 V!38827)) (EmptyCell!11931) )
))
(declare-datatypes ((array!67535 0))(
  ( (array!67536 (arr!32473 (Array (_ BitVec 32) ValueCell!11931)) (size!33009 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67535)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67537 0))(
  ( (array!67538 (arr!32474 (Array (_ BitVec 32) (_ BitVec 64))) (size!33010 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67537)

(assert (=> b!1063431 (= res!710046 (and (= (size!33009 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33010 _keys!1163) (size!33009 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063432 () Bool)

(declare-fun e!605942 () Bool)

(assert (=> b!1063432 (= e!605942 e!605938)))

(declare-fun res!710048 () Bool)

(assert (=> b!1063432 (=> res!710048 e!605938)))

(declare-fun contains!6258 (ListLongMap!14027 (_ BitVec 64)) Bool)

(assert (=> b!1063432 (= res!710048 (contains!6258 lt!468689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38827)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38827)

(declare-fun getCurrentListMap!4010 (array!67537 array!67535 (_ BitVec 32) (_ BitVec 32) V!38827 V!38827 (_ BitVec 32) Int) ListLongMap!14027)

(assert (=> b!1063432 (= lt!468689 (getCurrentListMap!4010 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063433 () Bool)

(declare-fun res!710047 () Bool)

(assert (=> b!1063433 (=> (not res!710047) (not e!605941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67537 (_ BitVec 32)) Bool)

(assert (=> b!1063433 (= res!710047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063434 () Bool)

(declare-fun e!605936 () Bool)

(declare-fun e!605937 () Bool)

(declare-fun mapRes!39580 () Bool)

(assert (=> b!1063434 (= e!605936 (and e!605937 mapRes!39580))))

(declare-fun condMapEmpty!39580 () Bool)

(declare-fun mapDefault!39580 () ValueCell!11931)

(assert (=> b!1063434 (= condMapEmpty!39580 (= (arr!32473 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11931)) mapDefault!39580)))))

(declare-fun b!1063435 () Bool)

(declare-fun res!710049 () Bool)

(assert (=> b!1063435 (=> (not res!710049) (not e!605941))))

(declare-datatypes ((List!22637 0))(
  ( (Nil!22634) (Cons!22633 (h!23842 (_ BitVec 64)) (t!31950 List!22637)) )
))
(declare-fun arrayNoDuplicates!0 (array!67537 (_ BitVec 32) List!22637) Bool)

(assert (=> b!1063435 (= res!710049 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22634))))

(declare-fun mapNonEmpty!39580 () Bool)

(declare-fun tp!75806 () Bool)

(declare-fun e!605940 () Bool)

(assert (=> mapNonEmpty!39580 (= mapRes!39580 (and tp!75806 e!605940))))

(declare-fun mapRest!39580 () (Array (_ BitVec 32) ValueCell!11931))

(declare-fun mapKey!39580 () (_ BitVec 32))

(declare-fun mapValue!39580 () ValueCell!11931)

(assert (=> mapNonEmpty!39580 (= (arr!32473 _values!955) (store mapRest!39580 mapKey!39580 mapValue!39580))))

(declare-fun b!1063436 () Bool)

(assert (=> b!1063436 (= e!605941 (not e!605942))))

(declare-fun res!710044 () Bool)

(assert (=> b!1063436 (=> res!710044 e!605942)))

(assert (=> b!1063436 (= res!710044 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468687 () ListLongMap!14027)

(declare-fun lt!468690 () ListLongMap!14027)

(assert (=> b!1063436 (= lt!468687 lt!468690)))

(declare-fun lt!468688 () Unit!34856)

(declare-fun zeroValueAfter!47 () V!38827)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!658 (array!67537 array!67535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38827 V!38827 V!38827 V!38827 (_ BitVec 32) Int) Unit!34856)

(assert (=> b!1063436 (= lt!468688 (lemmaNoChangeToArrayThenSameMapNoExtras!658 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3621 (array!67537 array!67535 (_ BitVec 32) (_ BitVec 32) V!38827 V!38827 (_ BitVec 32) Int) ListLongMap!14027)

(assert (=> b!1063436 (= lt!468690 (getCurrentListMapNoExtraKeys!3621 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063436 (= lt!468687 (getCurrentListMapNoExtraKeys!3621 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710045 () Bool)

(assert (=> start!94022 (=> (not res!710045) (not e!605941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94022 (= res!710045 (validMask!0 mask!1515))))

(assert (=> start!94022 e!605941))

(assert (=> start!94022 true))

(declare-fun tp_is_empty!25269 () Bool)

(assert (=> start!94022 tp_is_empty!25269))

(declare-fun array_inv!25152 (array!67535) Bool)

(assert (=> start!94022 (and (array_inv!25152 _values!955) e!605936)))

(assert (=> start!94022 tp!75805))

(declare-fun array_inv!25153 (array!67537) Bool)

(assert (=> start!94022 (array_inv!25153 _keys!1163)))

(declare-fun b!1063437 () Bool)

(assert (=> b!1063437 (= e!605940 tp_is_empty!25269)))

(declare-fun b!1063438 () Bool)

(assert (=> b!1063438 (= e!605937 tp_is_empty!25269)))

(declare-fun mapIsEmpty!39580 () Bool)

(assert (=> mapIsEmpty!39580 mapRes!39580))

(assert (= (and start!94022 res!710045) b!1063431))

(assert (= (and b!1063431 res!710046) b!1063433))

(assert (= (and b!1063433 res!710047) b!1063435))

(assert (= (and b!1063435 res!710049) b!1063436))

(assert (= (and b!1063436 (not res!710044)) b!1063432))

(assert (= (and b!1063432 (not res!710048)) b!1063430))

(assert (= (and b!1063434 condMapEmpty!39580) mapIsEmpty!39580))

(assert (= (and b!1063434 (not condMapEmpty!39580)) mapNonEmpty!39580))

(get-info :version)

(assert (= (and mapNonEmpty!39580 ((_ is ValueCellFull!11931) mapValue!39580)) b!1063437))

(assert (= (and b!1063434 ((_ is ValueCellFull!11931) mapDefault!39580)) b!1063438))

(assert (= start!94022 b!1063434))

(declare-fun m!982121 () Bool)

(assert (=> b!1063433 m!982121))

(declare-fun m!982123 () Bool)

(assert (=> b!1063435 m!982123))

(declare-fun m!982125 () Bool)

(assert (=> b!1063430 m!982125))

(declare-fun m!982127 () Bool)

(assert (=> b!1063430 m!982127))

(declare-fun m!982129 () Bool)

(assert (=> start!94022 m!982129))

(declare-fun m!982131 () Bool)

(assert (=> start!94022 m!982131))

(declare-fun m!982133 () Bool)

(assert (=> start!94022 m!982133))

(declare-fun m!982135 () Bool)

(assert (=> mapNonEmpty!39580 m!982135))

(declare-fun m!982137 () Bool)

(assert (=> b!1063432 m!982137))

(declare-fun m!982139 () Bool)

(assert (=> b!1063432 m!982139))

(declare-fun m!982141 () Bool)

(assert (=> b!1063436 m!982141))

(declare-fun m!982143 () Bool)

(assert (=> b!1063436 m!982143))

(declare-fun m!982145 () Bool)

(assert (=> b!1063436 m!982145))

(check-sat tp_is_empty!25269 (not b!1063432) (not b!1063436) (not mapNonEmpty!39580) (not b!1063430) b_and!34191 (not b!1063433) (not b!1063435) (not start!94022) (not b_next!21459))
(check-sat b_and!34191 (not b_next!21459))
