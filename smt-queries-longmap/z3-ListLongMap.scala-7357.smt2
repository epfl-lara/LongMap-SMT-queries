; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93848 () Bool)

(assert start!93848)

(declare-fun b_free!21321 () Bool)

(declare-fun b_next!21321 () Bool)

(assert (=> start!93848 (= b_free!21321 (not b_next!21321))))

(declare-fun tp!75386 () Bool)

(declare-fun b_and!34035 () Bool)

(assert (=> start!93848 (= tp!75386 b_and!34035)))

(declare-fun b!1061432 () Bool)

(declare-fun res!708818 () Bool)

(declare-fun e!604442 () Bool)

(assert (=> b!1061432 (=> (not res!708818) (not e!604442))))

(declare-datatypes ((array!67265 0))(
  ( (array!67266 (arr!32340 (Array (_ BitVec 32) (_ BitVec 64))) (size!32876 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67265)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67265 (_ BitVec 32)) Bool)

(assert (=> b!1061432 (= res!708818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39367 () Bool)

(declare-fun mapRes!39367 () Bool)

(declare-fun tp!75385 () Bool)

(declare-fun e!604443 () Bool)

(assert (=> mapNonEmpty!39367 (= mapRes!39367 (and tp!75385 e!604443))))

(declare-datatypes ((V!38643 0))(
  ( (V!38644 (val!12616 Int)) )
))
(declare-datatypes ((ValueCell!11862 0))(
  ( (ValueCellFull!11862 (v!15226 V!38643)) (EmptyCell!11862) )
))
(declare-fun mapValue!39367 () ValueCell!11862)

(declare-fun mapKey!39367 () (_ BitVec 32))

(declare-fun mapRest!39367 () (Array (_ BitVec 32) ValueCell!11862))

(declare-datatypes ((array!67267 0))(
  ( (array!67268 (arr!32341 (Array (_ BitVec 32) ValueCell!11862)) (size!32877 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67267)

(assert (=> mapNonEmpty!39367 (= (arr!32341 _values!955) (store mapRest!39367 mapKey!39367 mapValue!39367))))

(declare-fun res!708819 () Bool)

(assert (=> start!93848 (=> (not res!708819) (not e!604442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93848 (= res!708819 (validMask!0 mask!1515))))

(assert (=> start!93848 e!604442))

(assert (=> start!93848 true))

(declare-fun tp_is_empty!25131 () Bool)

(assert (=> start!93848 tp_is_empty!25131))

(declare-fun e!604440 () Bool)

(declare-fun array_inv!25060 (array!67267) Bool)

(assert (=> start!93848 (and (array_inv!25060 _values!955) e!604440)))

(assert (=> start!93848 tp!75386))

(declare-fun array_inv!25061 (array!67265) Bool)

(assert (=> start!93848 (array_inv!25061 _keys!1163)))

(declare-fun mapIsEmpty!39367 () Bool)

(assert (=> mapIsEmpty!39367 mapRes!39367))

(declare-fun b!1061433 () Bool)

(declare-fun res!708817 () Bool)

(assert (=> b!1061433 (=> (not res!708817) (not e!604442))))

(declare-datatypes ((List!22533 0))(
  ( (Nil!22530) (Cons!22529 (h!23738 (_ BitVec 64)) (t!31842 List!22533)) )
))
(declare-fun arrayNoDuplicates!0 (array!67265 (_ BitVec 32) List!22533) Bool)

(assert (=> b!1061433 (= res!708817 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22530))))

(declare-fun b!1061434 () Bool)

(assert (=> b!1061434 (= e!604442 (not true))))

(declare-datatypes ((tuple2!15948 0))(
  ( (tuple2!15949 (_1!7985 (_ BitVec 64)) (_2!7985 V!38643)) )
))
(declare-datatypes ((List!22534 0))(
  ( (Nil!22531) (Cons!22530 (h!23739 tuple2!15948) (t!31843 List!22534)) )
))
(declare-datatypes ((ListLongMap!13917 0))(
  ( (ListLongMap!13918 (toList!6974 List!22534)) )
))
(declare-fun lt!467596 () ListLongMap!13917)

(declare-fun lt!467595 () ListLongMap!13917)

(assert (=> b!1061434 (= lt!467596 lt!467595)))

(declare-fun zeroValueBefore!47 () V!38643)

(declare-datatypes ((Unit!34750 0))(
  ( (Unit!34751) )
))
(declare-fun lt!467594 () Unit!34750)

(declare-fun minValue!907 () V!38643)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38643)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!613 (array!67265 array!67267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38643 V!38643 V!38643 V!38643 (_ BitVec 32) Int) Unit!34750)

(assert (=> b!1061434 (= lt!467594 (lemmaNoChangeToArrayThenSameMapNoExtras!613 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3576 (array!67265 array!67267 (_ BitVec 32) (_ BitVec 32) V!38643 V!38643 (_ BitVec 32) Int) ListLongMap!13917)

(assert (=> b!1061434 (= lt!467595 (getCurrentListMapNoExtraKeys!3576 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061434 (= lt!467596 (getCurrentListMapNoExtraKeys!3576 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061435 () Bool)

(declare-fun res!708820 () Bool)

(assert (=> b!1061435 (=> (not res!708820) (not e!604442))))

(assert (=> b!1061435 (= res!708820 (and (= (size!32877 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32876 _keys!1163) (size!32877 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061436 () Bool)

(declare-fun e!604441 () Bool)

(assert (=> b!1061436 (= e!604440 (and e!604441 mapRes!39367))))

(declare-fun condMapEmpty!39367 () Bool)

(declare-fun mapDefault!39367 () ValueCell!11862)

(assert (=> b!1061436 (= condMapEmpty!39367 (= (arr!32341 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11862)) mapDefault!39367)))))

(declare-fun b!1061437 () Bool)

(assert (=> b!1061437 (= e!604443 tp_is_empty!25131)))

(declare-fun b!1061438 () Bool)

(assert (=> b!1061438 (= e!604441 tp_is_empty!25131)))

(assert (= (and start!93848 res!708819) b!1061435))

(assert (= (and b!1061435 res!708820) b!1061432))

(assert (= (and b!1061432 res!708818) b!1061433))

(assert (= (and b!1061433 res!708817) b!1061434))

(assert (= (and b!1061436 condMapEmpty!39367) mapIsEmpty!39367))

(assert (= (and b!1061436 (not condMapEmpty!39367)) mapNonEmpty!39367))

(get-info :version)

(assert (= (and mapNonEmpty!39367 ((_ is ValueCellFull!11862) mapValue!39367)) b!1061437))

(assert (= (and b!1061436 ((_ is ValueCellFull!11862) mapDefault!39367)) b!1061438))

(assert (= start!93848 b!1061436))

(declare-fun m!980283 () Bool)

(assert (=> b!1061432 m!980283))

(declare-fun m!980285 () Bool)

(assert (=> start!93848 m!980285))

(declare-fun m!980287 () Bool)

(assert (=> start!93848 m!980287))

(declare-fun m!980289 () Bool)

(assert (=> start!93848 m!980289))

(declare-fun m!980291 () Bool)

(assert (=> mapNonEmpty!39367 m!980291))

(declare-fun m!980293 () Bool)

(assert (=> b!1061434 m!980293))

(declare-fun m!980295 () Bool)

(assert (=> b!1061434 m!980295))

(declare-fun m!980297 () Bool)

(assert (=> b!1061434 m!980297))

(declare-fun m!980299 () Bool)

(assert (=> b!1061433 m!980299))

(check-sat tp_is_empty!25131 (not mapNonEmpty!39367) (not b!1061433) b_and!34035 (not b!1061434) (not b!1061432) (not start!93848) (not b_next!21321))
(check-sat b_and!34035 (not b_next!21321))
