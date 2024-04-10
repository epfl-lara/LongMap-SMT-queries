; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94734 () Bool)

(assert start!94734)

(declare-fun b_free!21987 () Bool)

(declare-fun b_next!21987 () Bool)

(assert (=> start!94734 (= b_free!21987 (not b_next!21987))))

(declare-fun tp!77419 () Bool)

(declare-fun b_and!34817 () Bool)

(assert (=> start!94734 (= tp!77419 b_and!34817)))

(declare-fun b!1071129 () Bool)

(declare-fun e!611557 () Bool)

(declare-fun e!611556 () Bool)

(declare-fun mapRes!40402 () Bool)

(assert (=> b!1071129 (= e!611557 (and e!611556 mapRes!40402))))

(declare-fun condMapEmpty!40402 () Bool)

(declare-datatypes ((V!39531 0))(
  ( (V!39532 (val!12949 Int)) )
))
(declare-datatypes ((ValueCell!12195 0))(
  ( (ValueCellFull!12195 (v!15565 V!39531)) (EmptyCell!12195) )
))
(declare-datatypes ((array!68571 0))(
  ( (array!68572 (arr!32981 (Array (_ BitVec 32) ValueCell!12195)) (size!33517 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68571)

(declare-fun mapDefault!40402 () ValueCell!12195)

(assert (=> b!1071129 (= condMapEmpty!40402 (= (arr!32981 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12195)) mapDefault!40402)))))

(declare-fun b!1071130 () Bool)

(declare-fun tp_is_empty!25797 () Bool)

(assert (=> b!1071130 (= e!611556 tp_is_empty!25797)))

(declare-fun b!1071131 () Bool)

(declare-fun e!611553 () Bool)

(assert (=> b!1071131 (= e!611553 true)))

(declare-datatypes ((tuple2!16478 0))(
  ( (tuple2!16479 (_1!8250 (_ BitVec 64)) (_2!8250 V!39531)) )
))
(declare-datatypes ((List!23019 0))(
  ( (Nil!23016) (Cons!23015 (h!24224 tuple2!16478) (t!32352 List!23019)) )
))
(declare-datatypes ((ListLongMap!14447 0))(
  ( (ListLongMap!14448 (toList!7239 List!23019)) )
))
(declare-fun lt!473637 () ListLongMap!14447)

(declare-fun lt!473632 () ListLongMap!14447)

(declare-fun -!674 (ListLongMap!14447 (_ BitVec 64)) ListLongMap!14447)

(assert (=> b!1071131 (= lt!473637 (-!674 lt!473632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473642 () ListLongMap!14447)

(declare-fun lt!473634 () ListLongMap!14447)

(assert (=> b!1071131 (= lt!473642 lt!473634)))

(declare-fun zeroValueBefore!47 () V!39531)

(declare-datatypes ((Unit!35274 0))(
  ( (Unit!35275) )
))
(declare-fun lt!473630 () Unit!35274)

(declare-fun minValue!907 () V!39531)

(declare-fun lt!473638 () ListLongMap!14447)

(declare-fun addCommutativeForDiffKeys!719 (ListLongMap!14447 (_ BitVec 64) V!39531 (_ BitVec 64) V!39531) Unit!35274)

(assert (=> b!1071131 (= lt!473630 (addCommutativeForDiffKeys!719 lt!473638 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473633 () ListLongMap!14447)

(assert (=> b!1071131 (= (-!674 lt!473634 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473633)))

(declare-fun lt!473640 () tuple2!16478)

(declare-fun +!3174 (ListLongMap!14447 tuple2!16478) ListLongMap!14447)

(assert (=> b!1071131 (= lt!473634 (+!3174 lt!473633 lt!473640))))

(declare-fun lt!473641 () Unit!35274)

(declare-fun addThenRemoveForNewKeyIsSame!44 (ListLongMap!14447 (_ BitVec 64) V!39531) Unit!35274)

(assert (=> b!1071131 (= lt!473641 (addThenRemoveForNewKeyIsSame!44 lt!473633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473636 () tuple2!16478)

(assert (=> b!1071131 (= lt!473633 (+!3174 lt!473638 lt!473636))))

(declare-fun e!611552 () Bool)

(assert (=> b!1071131 e!611552))

(declare-fun res!714536 () Bool)

(assert (=> b!1071131 (=> (not res!714536) (not e!611552))))

(assert (=> b!1071131 (= res!714536 (= lt!473632 lt!473642))))

(assert (=> b!1071131 (= lt!473642 (+!3174 (+!3174 lt!473638 lt!473640) lt!473636))))

(assert (=> b!1071131 (= lt!473636 (tuple2!16479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071131 (= lt!473640 (tuple2!16479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!473639 () ListLongMap!14447)

(declare-datatypes ((array!68573 0))(
  ( (array!68574 (arr!32982 (Array (_ BitVec 32) (_ BitVec 64))) (size!33518 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68573)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39531)

(declare-fun getCurrentListMap!4140 (array!68573 array!68571 (_ BitVec 32) (_ BitVec 32) V!39531 V!39531 (_ BitVec 32) Int) ListLongMap!14447)

(assert (=> b!1071131 (= lt!473639 (getCurrentListMap!4140 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071131 (= lt!473632 (getCurrentListMap!4140 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40402 () Bool)

(assert (=> mapIsEmpty!40402 mapRes!40402))

(declare-fun b!1071132 () Bool)

(declare-fun res!714534 () Bool)

(declare-fun e!611555 () Bool)

(assert (=> b!1071132 (=> (not res!714534) (not e!611555))))

(assert (=> b!1071132 (= res!714534 (and (= (size!33517 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33518 _keys!1163) (size!33517 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071134 () Bool)

(declare-fun res!714533 () Bool)

(assert (=> b!1071134 (=> (not res!714533) (not e!611555))))

(declare-datatypes ((List!23020 0))(
  ( (Nil!23017) (Cons!23016 (h!24225 (_ BitVec 64)) (t!32353 List!23020)) )
))
(declare-fun arrayNoDuplicates!0 (array!68573 (_ BitVec 32) List!23020) Bool)

(assert (=> b!1071134 (= res!714533 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23017))))

(declare-fun b!1071135 () Bool)

(declare-fun e!611554 () Bool)

(assert (=> b!1071135 (= e!611554 tp_is_empty!25797)))

(declare-fun mapNonEmpty!40402 () Bool)

(declare-fun tp!77420 () Bool)

(assert (=> mapNonEmpty!40402 (= mapRes!40402 (and tp!77420 e!611554))))

(declare-fun mapValue!40402 () ValueCell!12195)

(declare-fun mapKey!40402 () (_ BitVec 32))

(declare-fun mapRest!40402 () (Array (_ BitVec 32) ValueCell!12195))

(assert (=> mapNonEmpty!40402 (= (arr!32981 _values!955) (store mapRest!40402 mapKey!40402 mapValue!40402))))

(declare-fun b!1071136 () Bool)

(declare-fun lt!473631 () ListLongMap!14447)

(assert (=> b!1071136 (= e!611552 (= lt!473639 (+!3174 lt!473631 lt!473636)))))

(declare-fun b!1071137 () Bool)

(assert (=> b!1071137 (= e!611555 (not e!611553))))

(declare-fun res!714535 () Bool)

(assert (=> b!1071137 (=> res!714535 e!611553)))

(assert (=> b!1071137 (= res!714535 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071137 (= lt!473638 lt!473631)))

(declare-fun lt!473635 () Unit!35274)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!848 (array!68573 array!68571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39531 V!39531 V!39531 V!39531 (_ BitVec 32) Int) Unit!35274)

(assert (=> b!1071137 (= lt!473635 (lemmaNoChangeToArrayThenSameMapNoExtras!848 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3811 (array!68573 array!68571 (_ BitVec 32) (_ BitVec 32) V!39531 V!39531 (_ BitVec 32) Int) ListLongMap!14447)

(assert (=> b!1071137 (= lt!473631 (getCurrentListMapNoExtraKeys!3811 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071137 (= lt!473638 (getCurrentListMapNoExtraKeys!3811 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071133 () Bool)

(declare-fun res!714538 () Bool)

(assert (=> b!1071133 (=> (not res!714538) (not e!611555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68573 (_ BitVec 32)) Bool)

(assert (=> b!1071133 (= res!714538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!714537 () Bool)

(assert (=> start!94734 (=> (not res!714537) (not e!611555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94734 (= res!714537 (validMask!0 mask!1515))))

(assert (=> start!94734 e!611555))

(assert (=> start!94734 true))

(assert (=> start!94734 tp_is_empty!25797))

(declare-fun array_inv!25508 (array!68571) Bool)

(assert (=> start!94734 (and (array_inv!25508 _values!955) e!611557)))

(assert (=> start!94734 tp!77419))

(declare-fun array_inv!25509 (array!68573) Bool)

(assert (=> start!94734 (array_inv!25509 _keys!1163)))

(assert (= (and start!94734 res!714537) b!1071132))

(assert (= (and b!1071132 res!714534) b!1071133))

(assert (= (and b!1071133 res!714538) b!1071134))

(assert (= (and b!1071134 res!714533) b!1071137))

(assert (= (and b!1071137 (not res!714535)) b!1071131))

(assert (= (and b!1071131 res!714536) b!1071136))

(assert (= (and b!1071129 condMapEmpty!40402) mapIsEmpty!40402))

(assert (= (and b!1071129 (not condMapEmpty!40402)) mapNonEmpty!40402))

(get-info :version)

(assert (= (and mapNonEmpty!40402 ((_ is ValueCellFull!12195) mapValue!40402)) b!1071135))

(assert (= (and b!1071129 ((_ is ValueCellFull!12195) mapDefault!40402)) b!1071130))

(assert (= start!94734 b!1071129))

(declare-fun m!989489 () Bool)

(assert (=> mapNonEmpty!40402 m!989489))

(declare-fun m!989491 () Bool)

(assert (=> b!1071133 m!989491))

(declare-fun m!989493 () Bool)

(assert (=> b!1071134 m!989493))

(declare-fun m!989495 () Bool)

(assert (=> b!1071136 m!989495))

(declare-fun m!989497 () Bool)

(assert (=> b!1071137 m!989497))

(declare-fun m!989499 () Bool)

(assert (=> b!1071137 m!989499))

(declare-fun m!989501 () Bool)

(assert (=> b!1071137 m!989501))

(declare-fun m!989503 () Bool)

(assert (=> start!94734 m!989503))

(declare-fun m!989505 () Bool)

(assert (=> start!94734 m!989505))

(declare-fun m!989507 () Bool)

(assert (=> start!94734 m!989507))

(declare-fun m!989509 () Bool)

(assert (=> b!1071131 m!989509))

(declare-fun m!989511 () Bool)

(assert (=> b!1071131 m!989511))

(declare-fun m!989513 () Bool)

(assert (=> b!1071131 m!989513))

(declare-fun m!989515 () Bool)

(assert (=> b!1071131 m!989515))

(declare-fun m!989517 () Bool)

(assert (=> b!1071131 m!989517))

(declare-fun m!989519 () Bool)

(assert (=> b!1071131 m!989519))

(assert (=> b!1071131 m!989511))

(declare-fun m!989521 () Bool)

(assert (=> b!1071131 m!989521))

(declare-fun m!989523 () Bool)

(assert (=> b!1071131 m!989523))

(declare-fun m!989525 () Bool)

(assert (=> b!1071131 m!989525))

(declare-fun m!989527 () Bool)

(assert (=> b!1071131 m!989527))

(check-sat (not start!94734) (not b!1071136) tp_is_empty!25797 (not b!1071131) (not mapNonEmpty!40402) (not b!1071134) (not b_next!21987) (not b!1071133) b_and!34817 (not b!1071137))
(check-sat b_and!34817 (not b_next!21987))
