; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70232 () Bool)

(assert start!70232)

(declare-fun b_free!12487 () Bool)

(declare-fun b_next!12487 () Bool)

(assert (=> start!70232 (= b_free!12487 (not b_next!12487))))

(declare-fun tp!44176 () Bool)

(declare-fun b_and!21269 () Bool)

(assert (=> start!70232 (= tp!44176 b_and!21269)))

(declare-fun b!815162 () Bool)

(declare-fun res!556526 () Bool)

(declare-fun e!451914 () Bool)

(assert (=> b!815162 (=> (not res!556526) (not e!451914))))

(declare-datatypes ((array!44599 0))(
  ( (array!44600 (arr!21355 (Array (_ BitVec 32) (_ BitVec 64))) (size!21775 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44599)

(declare-datatypes ((List!15100 0))(
  ( (Nil!15097) (Cons!15096 (h!16231 (_ BitVec 64)) (t!21409 List!15100)) )
))
(declare-fun arrayNoDuplicates!0 (array!44599 (_ BitVec 32) List!15100) Bool)

(assert (=> b!815162 (= res!556526 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15097))))

(declare-fun b!815163 () Bool)

(declare-fun res!556528 () Bool)

(assert (=> b!815163 (=> (not res!556528) (not e!451914))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44599 (_ BitVec 32)) Bool)

(assert (=> b!815163 (= res!556528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815164 () Bool)

(declare-fun res!556525 () Bool)

(assert (=> b!815164 (=> (not res!556525) (not e!451914))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23931 0))(
  ( (V!23932 (val!7146 Int)) )
))
(declare-datatypes ((ValueCell!6683 0))(
  ( (ValueCellFull!6683 (v!9573 V!23931)) (EmptyCell!6683) )
))
(declare-datatypes ((array!44601 0))(
  ( (array!44602 (arr!21356 (Array (_ BitVec 32) ValueCell!6683)) (size!21776 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44601)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815164 (= res!556525 (and (= (size!21776 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21775 _keys!976) (size!21776 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815166 () Bool)

(declare-fun e!451912 () Bool)

(declare-fun e!451913 () Bool)

(declare-fun mapRes!22876 () Bool)

(assert (=> b!815166 (= e!451912 (and e!451913 mapRes!22876))))

(declare-fun condMapEmpty!22876 () Bool)

(declare-fun mapDefault!22876 () ValueCell!6683)

(assert (=> b!815166 (= condMapEmpty!22876 (= (arr!21356 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6683)) mapDefault!22876)))))

(declare-fun b!815167 () Bool)

(declare-fun e!451915 () Bool)

(declare-fun tp_is_empty!14197 () Bool)

(assert (=> b!815167 (= e!451915 tp_is_empty!14197)))

(declare-fun b!815168 () Bool)

(assert (=> b!815168 (= e!451914 (not true))))

(declare-datatypes ((tuple2!9282 0))(
  ( (tuple2!9283 (_1!4652 (_ BitVec 64)) (_2!4652 V!23931)) )
))
(declare-datatypes ((List!15101 0))(
  ( (Nil!15098) (Cons!15097 (h!16232 tuple2!9282) (t!21410 List!15101)) )
))
(declare-datatypes ((ListLongMap!8107 0))(
  ( (ListLongMap!8108 (toList!4069 List!15101)) )
))
(declare-fun lt!364898 () ListLongMap!8107)

(declare-fun lt!364899 () ListLongMap!8107)

(assert (=> b!815168 (= lt!364898 lt!364899)))

(declare-fun zeroValueBefore!34 () V!23931)

(declare-fun zeroValueAfter!34 () V!23931)

(declare-fun minValue!754 () V!23931)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27705 0))(
  ( (Unit!27706) )
))
(declare-fun lt!364897 () Unit!27705)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!264 (array!44599 array!44601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23931 V!23931 V!23931 V!23931 (_ BitVec 32) Int) Unit!27705)

(assert (=> b!815168 (= lt!364897 (lemmaNoChangeToArrayThenSameMapNoExtras!264 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2176 (array!44599 array!44601 (_ BitVec 32) (_ BitVec 32) V!23931 V!23931 (_ BitVec 32) Int) ListLongMap!8107)

(assert (=> b!815168 (= lt!364899 (getCurrentListMapNoExtraKeys!2176 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815168 (= lt!364898 (getCurrentListMapNoExtraKeys!2176 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22876 () Bool)

(declare-fun tp!44175 () Bool)

(assert (=> mapNonEmpty!22876 (= mapRes!22876 (and tp!44175 e!451915))))

(declare-fun mapKey!22876 () (_ BitVec 32))

(declare-fun mapRest!22876 () (Array (_ BitVec 32) ValueCell!6683))

(declare-fun mapValue!22876 () ValueCell!6683)

(assert (=> mapNonEmpty!22876 (= (arr!21356 _values!788) (store mapRest!22876 mapKey!22876 mapValue!22876))))

(declare-fun mapIsEmpty!22876 () Bool)

(assert (=> mapIsEmpty!22876 mapRes!22876))

(declare-fun b!815165 () Bool)

(assert (=> b!815165 (= e!451913 tp_is_empty!14197)))

(declare-fun res!556527 () Bool)

(assert (=> start!70232 (=> (not res!556527) (not e!451914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70232 (= res!556527 (validMask!0 mask!1312))))

(assert (=> start!70232 e!451914))

(assert (=> start!70232 tp_is_empty!14197))

(declare-fun array_inv!17145 (array!44599) Bool)

(assert (=> start!70232 (array_inv!17145 _keys!976)))

(assert (=> start!70232 true))

(declare-fun array_inv!17146 (array!44601) Bool)

(assert (=> start!70232 (and (array_inv!17146 _values!788) e!451912)))

(assert (=> start!70232 tp!44176))

(assert (= (and start!70232 res!556527) b!815164))

(assert (= (and b!815164 res!556525) b!815163))

(assert (= (and b!815163 res!556528) b!815162))

(assert (= (and b!815162 res!556526) b!815168))

(assert (= (and b!815166 condMapEmpty!22876) mapIsEmpty!22876))

(assert (= (and b!815166 (not condMapEmpty!22876)) mapNonEmpty!22876))

(get-info :version)

(assert (= (and mapNonEmpty!22876 ((_ is ValueCellFull!6683) mapValue!22876)) b!815167))

(assert (= (and b!815166 ((_ is ValueCellFull!6683) mapDefault!22876)) b!815165))

(assert (= start!70232 b!815166))

(declare-fun m!757389 () Bool)

(assert (=> mapNonEmpty!22876 m!757389))

(declare-fun m!757391 () Bool)

(assert (=> b!815163 m!757391))

(declare-fun m!757393 () Bool)

(assert (=> b!815162 m!757393))

(declare-fun m!757395 () Bool)

(assert (=> start!70232 m!757395))

(declare-fun m!757397 () Bool)

(assert (=> start!70232 m!757397))

(declare-fun m!757399 () Bool)

(assert (=> start!70232 m!757399))

(declare-fun m!757401 () Bool)

(assert (=> b!815168 m!757401))

(declare-fun m!757403 () Bool)

(assert (=> b!815168 m!757403))

(declare-fun m!757405 () Bool)

(assert (=> b!815168 m!757405))

(check-sat (not b!815163) tp_is_empty!14197 (not b!815168) (not b!815162) (not mapNonEmpty!22876) (not b_next!12487) (not start!70232) b_and!21269)
(check-sat b_and!21269 (not b_next!12487))
