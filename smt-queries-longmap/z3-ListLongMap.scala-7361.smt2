; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94106 () Bool)

(assert start!94106)

(declare-fun b_free!21343 () Bool)

(declare-fun b_next!21343 () Bool)

(assert (=> start!94106 (= b_free!21343 (not b_next!21343))))

(declare-fun tp!75452 () Bool)

(declare-fun b_and!34067 () Bool)

(assert (=> start!94106 (= tp!75452 b_and!34067)))

(declare-fun mapIsEmpty!39400 () Bool)

(declare-fun mapRes!39400 () Bool)

(assert (=> mapIsEmpty!39400 mapRes!39400))

(declare-fun b!1062990 () Bool)

(declare-fun e!605460 () Bool)

(declare-fun tp_is_empty!25153 () Bool)

(assert (=> b!1062990 (= e!605460 tp_is_empty!25153)))

(declare-fun b!1062991 () Bool)

(declare-fun e!605463 () Bool)

(assert (=> b!1062991 (= e!605463 (not true))))

(declare-datatypes ((V!38673 0))(
  ( (V!38674 (val!12627 Int)) )
))
(declare-datatypes ((tuple2!15948 0))(
  ( (tuple2!15949 (_1!7985 (_ BitVec 64)) (_2!7985 V!38673)) )
))
(declare-datatypes ((List!22535 0))(
  ( (Nil!22532) (Cons!22531 (h!23749 tuple2!15948) (t!31836 List!22535)) )
))
(declare-datatypes ((ListLongMap!13925 0))(
  ( (ListLongMap!13926 (toList!6978 List!22535)) )
))
(declare-fun lt!468210 () ListLongMap!13925)

(declare-fun lt!468208 () ListLongMap!13925)

(assert (=> b!1062991 (= lt!468210 lt!468208)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38673)

(declare-datatypes ((Unit!34761 0))(
  ( (Unit!34762) )
))
(declare-fun lt!468209 () Unit!34761)

(declare-datatypes ((ValueCell!11873 0))(
  ( (ValueCellFull!11873 (v!15233 V!38673)) (EmptyCell!11873) )
))
(declare-datatypes ((array!67357 0))(
  ( (array!67358 (arr!32380 (Array (_ BitVec 32) ValueCell!11873)) (size!32917 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67357)

(declare-fun minValue!907 () V!38673)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38673)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67359 0))(
  ( (array!67360 (arr!32381 (Array (_ BitVec 32) (_ BitVec 64))) (size!32918 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67359)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!629 (array!67359 array!67357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38673 V!38673 V!38673 V!38673 (_ BitVec 32) Int) Unit!34761)

(assert (=> b!1062991 (= lt!468209 (lemmaNoChangeToArrayThenSameMapNoExtras!629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3626 (array!67359 array!67357 (_ BitVec 32) (_ BitVec 32) V!38673 V!38673 (_ BitVec 32) Int) ListLongMap!13925)

(assert (=> b!1062991 (= lt!468208 (getCurrentListMapNoExtraKeys!3626 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062991 (= lt!468210 (getCurrentListMapNoExtraKeys!3626 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062992 () Bool)

(declare-fun res!709472 () Bool)

(assert (=> b!1062992 (=> (not res!709472) (not e!605463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67359 (_ BitVec 32)) Bool)

(assert (=> b!1062992 (= res!709472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062993 () Bool)

(declare-fun e!605462 () Bool)

(declare-fun e!605461 () Bool)

(assert (=> b!1062993 (= e!605462 (and e!605461 mapRes!39400))))

(declare-fun condMapEmpty!39400 () Bool)

(declare-fun mapDefault!39400 () ValueCell!11873)

(assert (=> b!1062993 (= condMapEmpty!39400 (= (arr!32380 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11873)) mapDefault!39400)))))

(declare-fun b!1062994 () Bool)

(assert (=> b!1062994 (= e!605461 tp_is_empty!25153)))

(declare-fun mapNonEmpty!39400 () Bool)

(declare-fun tp!75451 () Bool)

(assert (=> mapNonEmpty!39400 (= mapRes!39400 (and tp!75451 e!605460))))

(declare-fun mapRest!39400 () (Array (_ BitVec 32) ValueCell!11873))

(declare-fun mapKey!39400 () (_ BitVec 32))

(declare-fun mapValue!39400 () ValueCell!11873)

(assert (=> mapNonEmpty!39400 (= (arr!32380 _values!955) (store mapRest!39400 mapKey!39400 mapValue!39400))))

(declare-fun b!1062995 () Bool)

(declare-fun res!709473 () Bool)

(assert (=> b!1062995 (=> (not res!709473) (not e!605463))))

(assert (=> b!1062995 (= res!709473 (and (= (size!32917 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32918 _keys!1163) (size!32917 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709471 () Bool)

(assert (=> start!94106 (=> (not res!709471) (not e!605463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94106 (= res!709471 (validMask!0 mask!1515))))

(assert (=> start!94106 e!605463))

(assert (=> start!94106 true))

(assert (=> start!94106 tp_is_empty!25153))

(declare-fun array_inv!25106 (array!67357) Bool)

(assert (=> start!94106 (and (array_inv!25106 _values!955) e!605462)))

(assert (=> start!94106 tp!75452))

(declare-fun array_inv!25107 (array!67359) Bool)

(assert (=> start!94106 (array_inv!25107 _keys!1163)))

(declare-fun b!1062996 () Bool)

(declare-fun res!709474 () Bool)

(assert (=> b!1062996 (=> (not res!709474) (not e!605463))))

(declare-datatypes ((List!22536 0))(
  ( (Nil!22533) (Cons!22532 (h!23750 (_ BitVec 64)) (t!31837 List!22536)) )
))
(declare-fun arrayNoDuplicates!0 (array!67359 (_ BitVec 32) List!22536) Bool)

(assert (=> b!1062996 (= res!709474 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22533))))

(assert (= (and start!94106 res!709471) b!1062995))

(assert (= (and b!1062995 res!709473) b!1062992))

(assert (= (and b!1062992 res!709472) b!1062996))

(assert (= (and b!1062996 res!709474) b!1062991))

(assert (= (and b!1062993 condMapEmpty!39400) mapIsEmpty!39400))

(assert (= (and b!1062993 (not condMapEmpty!39400)) mapNonEmpty!39400))

(get-info :version)

(assert (= (and mapNonEmpty!39400 ((_ is ValueCellFull!11873) mapValue!39400)) b!1062990))

(assert (= (and b!1062993 ((_ is ValueCellFull!11873) mapDefault!39400)) b!1062994))

(assert (= start!94106 b!1062993))

(declare-fun m!982153 () Bool)

(assert (=> mapNonEmpty!39400 m!982153))

(declare-fun m!982155 () Bool)

(assert (=> b!1062996 m!982155))

(declare-fun m!982157 () Bool)

(assert (=> b!1062992 m!982157))

(declare-fun m!982159 () Bool)

(assert (=> start!94106 m!982159))

(declare-fun m!982161 () Bool)

(assert (=> start!94106 m!982161))

(declare-fun m!982163 () Bool)

(assert (=> start!94106 m!982163))

(declare-fun m!982165 () Bool)

(assert (=> b!1062991 m!982165))

(declare-fun m!982167 () Bool)

(assert (=> b!1062991 m!982167))

(declare-fun m!982169 () Bool)

(assert (=> b!1062991 m!982169))

(check-sat (not mapNonEmpty!39400) b_and!34067 (not b_next!21343) (not b!1062992) (not b!1062991) (not b!1062996) (not start!94106) tp_is_empty!25153)
(check-sat b_and!34067 (not b_next!21343))
