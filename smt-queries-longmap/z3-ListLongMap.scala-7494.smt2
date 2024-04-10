; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94938 () Bool)

(assert start!94938)

(declare-fun b_free!22143 () Bool)

(declare-fun b_next!22143 () Bool)

(assert (=> start!94938 (= b_free!22143 (not b_next!22143))))

(declare-fun tp!77893 () Bool)

(declare-fun b_and!34997 () Bool)

(assert (=> start!94938 (= tp!77893 b_and!34997)))

(declare-fun mapIsEmpty!40642 () Bool)

(declare-fun mapRes!40642 () Bool)

(assert (=> mapIsEmpty!40642 mapRes!40642))

(declare-fun b!1073447 () Bool)

(declare-fun e!613266 () Bool)

(declare-fun tp_is_empty!25953 () Bool)

(assert (=> b!1073447 (= e!613266 tp_is_empty!25953)))

(declare-fun b!1073448 () Bool)

(declare-fun e!613267 () Bool)

(assert (=> b!1073448 (= e!613267 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39739 0))(
  ( (V!39740 (val!13027 Int)) )
))
(declare-datatypes ((tuple2!16586 0))(
  ( (tuple2!16587 (_1!8304 (_ BitVec 64)) (_2!8304 V!39739)) )
))
(declare-datatypes ((List!23125 0))(
  ( (Nil!23122) (Cons!23121 (h!24330 tuple2!16586) (t!32462 List!23125)) )
))
(declare-datatypes ((ListLongMap!14555 0))(
  ( (ListLongMap!14556 (toList!7293 List!23125)) )
))
(declare-fun lt!476049 () ListLongMap!14555)

(declare-datatypes ((ValueCell!12273 0))(
  ( (ValueCellFull!12273 (v!15645 V!39739)) (EmptyCell!12273) )
))
(declare-datatypes ((array!68867 0))(
  ( (array!68868 (arr!33127 (Array (_ BitVec 32) ValueCell!12273)) (size!33663 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68867)

(declare-fun minValue!907 () V!39739)

(declare-datatypes ((array!68869 0))(
  ( (array!68870 (arr!33128 (Array (_ BitVec 32) (_ BitVec 64))) (size!33664 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68869)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39739)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3857 (array!68869 array!68867 (_ BitVec 32) (_ BitVec 32) V!39739 V!39739 (_ BitVec 32) Int) ListLongMap!14555)

(assert (=> b!1073448 (= lt!476049 (getCurrentListMapNoExtraKeys!3857 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39739)

(declare-fun lt!476050 () ListLongMap!14555)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073448 (= lt!476050 (getCurrentListMapNoExtraKeys!3857 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40642 () Bool)

(declare-fun tp!77894 () Bool)

(assert (=> mapNonEmpty!40642 (= mapRes!40642 (and tp!77894 e!613266))))

(declare-fun mapKey!40642 () (_ BitVec 32))

(declare-fun mapValue!40642 () ValueCell!12273)

(declare-fun mapRest!40642 () (Array (_ BitVec 32) ValueCell!12273))

(assert (=> mapNonEmpty!40642 (= (arr!33127 _values!955) (store mapRest!40642 mapKey!40642 mapValue!40642))))

(declare-fun b!1073449 () Bool)

(declare-fun res!715946 () Bool)

(assert (=> b!1073449 (=> (not res!715946) (not e!613267))))

(assert (=> b!1073449 (= res!715946 (and (= (size!33663 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33664 _keys!1163) (size!33663 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073450 () Bool)

(declare-fun e!613265 () Bool)

(declare-fun e!613264 () Bool)

(assert (=> b!1073450 (= e!613265 (and e!613264 mapRes!40642))))

(declare-fun condMapEmpty!40642 () Bool)

(declare-fun mapDefault!40642 () ValueCell!12273)

(assert (=> b!1073450 (= condMapEmpty!40642 (= (arr!33127 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12273)) mapDefault!40642)))))

(declare-fun b!1073451 () Bool)

(declare-fun res!715947 () Bool)

(assert (=> b!1073451 (=> (not res!715947) (not e!613267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68869 (_ BitVec 32)) Bool)

(assert (=> b!1073451 (= res!715947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073452 () Bool)

(declare-fun res!715948 () Bool)

(assert (=> b!1073452 (=> (not res!715948) (not e!613267))))

(declare-datatypes ((List!23126 0))(
  ( (Nil!23123) (Cons!23122 (h!24331 (_ BitVec 64)) (t!32463 List!23126)) )
))
(declare-fun arrayNoDuplicates!0 (array!68869 (_ BitVec 32) List!23126) Bool)

(assert (=> b!1073452 (= res!715948 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23123))))

(declare-fun b!1073453 () Bool)

(assert (=> b!1073453 (= e!613264 tp_is_empty!25953)))

(declare-fun res!715945 () Bool)

(assert (=> start!94938 (=> (not res!715945) (not e!613267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94938 (= res!715945 (validMask!0 mask!1515))))

(assert (=> start!94938 e!613267))

(assert (=> start!94938 true))

(assert (=> start!94938 tp_is_empty!25953))

(declare-fun array_inv!25604 (array!68867) Bool)

(assert (=> start!94938 (and (array_inv!25604 _values!955) e!613265)))

(assert (=> start!94938 tp!77893))

(declare-fun array_inv!25605 (array!68869) Bool)

(assert (=> start!94938 (array_inv!25605 _keys!1163)))

(assert (= (and start!94938 res!715945) b!1073449))

(assert (= (and b!1073449 res!715946) b!1073451))

(assert (= (and b!1073451 res!715947) b!1073452))

(assert (= (and b!1073452 res!715948) b!1073448))

(assert (= (and b!1073450 condMapEmpty!40642) mapIsEmpty!40642))

(assert (= (and b!1073450 (not condMapEmpty!40642)) mapNonEmpty!40642))

(get-info :version)

(assert (= (and mapNonEmpty!40642 ((_ is ValueCellFull!12273) mapValue!40642)) b!1073447))

(assert (= (and b!1073450 ((_ is ValueCellFull!12273) mapDefault!40642)) b!1073453))

(assert (= start!94938 b!1073450))

(declare-fun m!992431 () Bool)

(assert (=> start!94938 m!992431))

(declare-fun m!992433 () Bool)

(assert (=> start!94938 m!992433))

(declare-fun m!992435 () Bool)

(assert (=> start!94938 m!992435))

(declare-fun m!992437 () Bool)

(assert (=> mapNonEmpty!40642 m!992437))

(declare-fun m!992439 () Bool)

(assert (=> b!1073451 m!992439))

(declare-fun m!992441 () Bool)

(assert (=> b!1073448 m!992441))

(declare-fun m!992443 () Bool)

(assert (=> b!1073448 m!992443))

(declare-fun m!992445 () Bool)

(assert (=> b!1073452 m!992445))

(check-sat (not b!1073448) (not start!94938) (not b!1073452) (not b_next!22143) tp_is_empty!25953 b_and!34997 (not b!1073451) (not mapNonEmpty!40642))
(check-sat b_and!34997 (not b_next!22143))
