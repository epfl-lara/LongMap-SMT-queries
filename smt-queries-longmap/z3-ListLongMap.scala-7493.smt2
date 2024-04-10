; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94932 () Bool)

(assert start!94932)

(declare-fun b_free!22137 () Bool)

(declare-fun b_next!22137 () Bool)

(assert (=> start!94932 (= b_free!22137 (not b_next!22137))))

(declare-fun tp!77875 () Bool)

(declare-fun b_and!34991 () Bool)

(assert (=> start!94932 (= tp!77875 b_and!34991)))

(declare-fun b!1073384 () Bool)

(declare-fun res!715911 () Bool)

(declare-fun e!613223 () Bool)

(assert (=> b!1073384 (=> (not res!715911) (not e!613223))))

(declare-datatypes ((array!68855 0))(
  ( (array!68856 (arr!33121 (Array (_ BitVec 32) (_ BitVec 64))) (size!33657 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68855)

(declare-datatypes ((List!23120 0))(
  ( (Nil!23117) (Cons!23116 (h!24325 (_ BitVec 64)) (t!32457 List!23120)) )
))
(declare-fun arrayNoDuplicates!0 (array!68855 (_ BitVec 32) List!23120) Bool)

(assert (=> b!1073384 (= res!715911 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23117))))

(declare-fun b!1073385 () Bool)

(declare-fun res!715909 () Bool)

(assert (=> b!1073385 (=> (not res!715909) (not e!613223))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68855 (_ BitVec 32)) Bool)

(assert (=> b!1073385 (= res!715909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073386 () Bool)

(declare-fun e!613220 () Bool)

(declare-fun e!613221 () Bool)

(declare-fun mapRes!40633 () Bool)

(assert (=> b!1073386 (= e!613220 (and e!613221 mapRes!40633))))

(declare-fun condMapEmpty!40633 () Bool)

(declare-datatypes ((V!39731 0))(
  ( (V!39732 (val!13024 Int)) )
))
(declare-datatypes ((ValueCell!12270 0))(
  ( (ValueCellFull!12270 (v!15642 V!39731)) (EmptyCell!12270) )
))
(declare-datatypes ((array!68857 0))(
  ( (array!68858 (arr!33122 (Array (_ BitVec 32) ValueCell!12270)) (size!33658 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68857)

(declare-fun mapDefault!40633 () ValueCell!12270)

(assert (=> b!1073386 (= condMapEmpty!40633 (= (arr!33122 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12270)) mapDefault!40633)))))

(declare-fun mapNonEmpty!40633 () Bool)

(declare-fun tp!77876 () Bool)

(declare-fun e!613222 () Bool)

(assert (=> mapNonEmpty!40633 (= mapRes!40633 (and tp!77876 e!613222))))

(declare-fun mapKey!40633 () (_ BitVec 32))

(declare-fun mapRest!40633 () (Array (_ BitVec 32) ValueCell!12270))

(declare-fun mapValue!40633 () ValueCell!12270)

(assert (=> mapNonEmpty!40633 (= (arr!33122 _values!955) (store mapRest!40633 mapKey!40633 mapValue!40633))))

(declare-fun mapIsEmpty!40633 () Bool)

(assert (=> mapIsEmpty!40633 mapRes!40633))

(declare-fun b!1073387 () Bool)

(declare-fun res!715912 () Bool)

(assert (=> b!1073387 (=> (not res!715912) (not e!613223))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073387 (= res!715912 (and (= (size!33658 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33657 _keys!1163) (size!33658 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715910 () Bool)

(assert (=> start!94932 (=> (not res!715910) (not e!613223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94932 (= res!715910 (validMask!0 mask!1515))))

(assert (=> start!94932 e!613223))

(assert (=> start!94932 true))

(declare-fun tp_is_empty!25947 () Bool)

(assert (=> start!94932 tp_is_empty!25947))

(declare-fun array_inv!25598 (array!68857) Bool)

(assert (=> start!94932 (and (array_inv!25598 _values!955) e!613220)))

(assert (=> start!94932 tp!77875))

(declare-fun array_inv!25599 (array!68855) Bool)

(assert (=> start!94932 (array_inv!25599 _keys!1163)))

(declare-fun b!1073388 () Bool)

(assert (=> b!1073388 (= e!613223 false)))

(declare-datatypes ((tuple2!16582 0))(
  ( (tuple2!16583 (_1!8302 (_ BitVec 64)) (_2!8302 V!39731)) )
))
(declare-datatypes ((List!23121 0))(
  ( (Nil!23118) (Cons!23117 (h!24326 tuple2!16582) (t!32458 List!23121)) )
))
(declare-datatypes ((ListLongMap!14551 0))(
  ( (ListLongMap!14552 (toList!7291 List!23121)) )
))
(declare-fun lt!476031 () ListLongMap!14551)

(declare-fun minValue!907 () V!39731)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39731)

(declare-fun getCurrentListMapNoExtraKeys!3855 (array!68855 array!68857 (_ BitVec 32) (_ BitVec 32) V!39731 V!39731 (_ BitVec 32) Int) ListLongMap!14551)

(assert (=> b!1073388 (= lt!476031 (getCurrentListMapNoExtraKeys!3855 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39731)

(declare-fun lt!476032 () ListLongMap!14551)

(assert (=> b!1073388 (= lt!476032 (getCurrentListMapNoExtraKeys!3855 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073389 () Bool)

(assert (=> b!1073389 (= e!613222 tp_is_empty!25947)))

(declare-fun b!1073390 () Bool)

(assert (=> b!1073390 (= e!613221 tp_is_empty!25947)))

(assert (= (and start!94932 res!715910) b!1073387))

(assert (= (and b!1073387 res!715912) b!1073385))

(assert (= (and b!1073385 res!715909) b!1073384))

(assert (= (and b!1073384 res!715911) b!1073388))

(assert (= (and b!1073386 condMapEmpty!40633) mapIsEmpty!40633))

(assert (= (and b!1073386 (not condMapEmpty!40633)) mapNonEmpty!40633))

(get-info :version)

(assert (= (and mapNonEmpty!40633 ((_ is ValueCellFull!12270) mapValue!40633)) b!1073389))

(assert (= (and b!1073386 ((_ is ValueCellFull!12270) mapDefault!40633)) b!1073390))

(assert (= start!94932 b!1073386))

(declare-fun m!992383 () Bool)

(assert (=> mapNonEmpty!40633 m!992383))

(declare-fun m!992385 () Bool)

(assert (=> start!94932 m!992385))

(declare-fun m!992387 () Bool)

(assert (=> start!94932 m!992387))

(declare-fun m!992389 () Bool)

(assert (=> start!94932 m!992389))

(declare-fun m!992391 () Bool)

(assert (=> b!1073388 m!992391))

(declare-fun m!992393 () Bool)

(assert (=> b!1073388 m!992393))

(declare-fun m!992395 () Bool)

(assert (=> b!1073385 m!992395))

(declare-fun m!992397 () Bool)

(assert (=> b!1073384 m!992397))

(check-sat (not b!1073385) (not b!1073388) (not start!94932) (not b_next!22137) (not b!1073384) b_and!34991 tp_is_empty!25947 (not mapNonEmpty!40633))
(check-sat b_and!34991 (not b_next!22137))
