; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94600 () Bool)

(assert start!94600)

(declare-fun b_free!21889 () Bool)

(declare-fun b_next!21889 () Bool)

(assert (=> start!94600 (= b_free!21889 (not b_next!21889))))

(declare-fun tp!77120 () Bool)

(declare-fun b_and!34675 () Bool)

(assert (=> start!94600 (= tp!77120 b_and!34675)))

(declare-fun res!713645 () Bool)

(declare-fun e!610432 () Bool)

(assert (=> start!94600 (=> (not res!713645) (not e!610432))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94600 (= res!713645 (validMask!0 mask!1515))))

(assert (=> start!94600 e!610432))

(assert (=> start!94600 true))

(declare-fun tp_is_empty!25699 () Bool)

(assert (=> start!94600 tp_is_empty!25699))

(declare-datatypes ((V!39401 0))(
  ( (V!39402 (val!12900 Int)) )
))
(declare-datatypes ((ValueCell!12146 0))(
  ( (ValueCellFull!12146 (v!15515 V!39401)) (EmptyCell!12146) )
))
(declare-datatypes ((array!68320 0))(
  ( (array!68321 (arr!32858 (Array (_ BitVec 32) ValueCell!12146)) (size!33396 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68320)

(declare-fun e!610431 () Bool)

(declare-fun array_inv!25428 (array!68320) Bool)

(assert (=> start!94600 (and (array_inv!25428 _values!955) e!610431)))

(assert (=> start!94600 tp!77120))

(declare-datatypes ((array!68322 0))(
  ( (array!68323 (arr!32859 (Array (_ BitVec 32) (_ BitVec 64))) (size!33397 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68322)

(declare-fun array_inv!25429 (array!68322) Bool)

(assert (=> start!94600 (array_inv!25429 _keys!1163)))

(declare-fun mapNonEmpty!40249 () Bool)

(declare-fun mapRes!40249 () Bool)

(declare-fun tp!77119 () Bool)

(declare-fun e!610430 () Bool)

(assert (=> mapNonEmpty!40249 (= mapRes!40249 (and tp!77119 e!610430))))

(declare-fun mapRest!40249 () (Array (_ BitVec 32) ValueCell!12146))

(declare-fun mapValue!40249 () ValueCell!12146)

(declare-fun mapKey!40249 () (_ BitVec 32))

(assert (=> mapNonEmpty!40249 (= (arr!32858 _values!955) (store mapRest!40249 mapKey!40249 mapValue!40249))))

(declare-fun b!1069569 () Bool)

(assert (=> b!1069569 (= e!610432 (not true))))

(declare-datatypes ((tuple2!16458 0))(
  ( (tuple2!16459 (_1!8240 (_ BitVec 64)) (_2!8240 V!39401)) )
))
(declare-datatypes ((List!22986 0))(
  ( (Nil!22983) (Cons!22982 (h!24191 tuple2!16458) (t!32306 List!22986)) )
))
(declare-datatypes ((ListLongMap!14427 0))(
  ( (ListLongMap!14428 (toList!7229 List!22986)) )
))
(declare-fun lt!472534 () ListLongMap!14427)

(declare-fun lt!472533 () ListLongMap!14427)

(assert (=> b!1069569 (= lt!472534 lt!472533)))

(declare-fun zeroValueBefore!47 () V!39401)

(declare-fun minValue!907 () V!39401)

(declare-datatypes ((Unit!35046 0))(
  ( (Unit!35047) )
))
(declare-fun lt!472532 () Unit!35046)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39401)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!812 (array!68322 array!68320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39401 V!39401 V!39401 V!39401 (_ BitVec 32) Int) Unit!35046)

(assert (=> b!1069569 (= lt!472532 (lemmaNoChangeToArrayThenSameMapNoExtras!812 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3818 (array!68322 array!68320 (_ BitVec 32) (_ BitVec 32) V!39401 V!39401 (_ BitVec 32) Int) ListLongMap!14427)

(assert (=> b!1069569 (= lt!472533 (getCurrentListMapNoExtraKeys!3818 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069569 (= lt!472534 (getCurrentListMapNoExtraKeys!3818 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069570 () Bool)

(declare-fun e!610433 () Bool)

(assert (=> b!1069570 (= e!610433 tp_is_empty!25699)))

(declare-fun b!1069571 () Bool)

(declare-fun res!713642 () Bool)

(assert (=> b!1069571 (=> (not res!713642) (not e!610432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68322 (_ BitVec 32)) Bool)

(assert (=> b!1069571 (= res!713642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40249 () Bool)

(assert (=> mapIsEmpty!40249 mapRes!40249))

(declare-fun b!1069572 () Bool)

(declare-fun res!713643 () Bool)

(assert (=> b!1069572 (=> (not res!713643) (not e!610432))))

(assert (=> b!1069572 (= res!713643 (and (= (size!33396 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33397 _keys!1163) (size!33396 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069573 () Bool)

(assert (=> b!1069573 (= e!610431 (and e!610433 mapRes!40249))))

(declare-fun condMapEmpty!40249 () Bool)

(declare-fun mapDefault!40249 () ValueCell!12146)

(assert (=> b!1069573 (= condMapEmpty!40249 (= (arr!32858 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12146)) mapDefault!40249)))))

(declare-fun b!1069574 () Bool)

(assert (=> b!1069574 (= e!610430 tp_is_empty!25699)))

(declare-fun b!1069575 () Bool)

(declare-fun res!713644 () Bool)

(assert (=> b!1069575 (=> (not res!713644) (not e!610432))))

(declare-datatypes ((List!22987 0))(
  ( (Nil!22984) (Cons!22983 (h!24192 (_ BitVec 64)) (t!32307 List!22987)) )
))
(declare-fun arrayNoDuplicates!0 (array!68322 (_ BitVec 32) List!22987) Bool)

(assert (=> b!1069575 (= res!713644 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22984))))

(assert (= (and start!94600 res!713645) b!1069572))

(assert (= (and b!1069572 res!713643) b!1069571))

(assert (= (and b!1069571 res!713642) b!1069575))

(assert (= (and b!1069575 res!713644) b!1069569))

(assert (= (and b!1069573 condMapEmpty!40249) mapIsEmpty!40249))

(assert (= (and b!1069573 (not condMapEmpty!40249)) mapNonEmpty!40249))

(get-info :version)

(assert (= (and mapNonEmpty!40249 ((_ is ValueCellFull!12146) mapValue!40249)) b!1069574))

(assert (= (and b!1069573 ((_ is ValueCellFull!12146) mapDefault!40249)) b!1069570))

(assert (= start!94600 b!1069573))

(declare-fun m!987565 () Bool)

(assert (=> mapNonEmpty!40249 m!987565))

(declare-fun m!987567 () Bool)

(assert (=> b!1069575 m!987567))

(declare-fun m!987569 () Bool)

(assert (=> b!1069569 m!987569))

(declare-fun m!987571 () Bool)

(assert (=> b!1069569 m!987571))

(declare-fun m!987573 () Bool)

(assert (=> b!1069569 m!987573))

(declare-fun m!987575 () Bool)

(assert (=> start!94600 m!987575))

(declare-fun m!987577 () Bool)

(assert (=> start!94600 m!987577))

(declare-fun m!987579 () Bool)

(assert (=> start!94600 m!987579))

(declare-fun m!987581 () Bool)

(assert (=> b!1069571 m!987581))

(check-sat tp_is_empty!25699 (not start!94600) (not b!1069575) (not mapNonEmpty!40249) b_and!34675 (not b!1069571) (not b_next!21889) (not b!1069569))
(check-sat b_and!34675 (not b_next!21889))
