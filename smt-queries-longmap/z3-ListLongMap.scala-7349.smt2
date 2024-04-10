; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93800 () Bool)

(assert start!93800)

(declare-fun b_free!21273 () Bool)

(declare-fun b_next!21273 () Bool)

(assert (=> start!93800 (= b_free!21273 (not b_next!21273))))

(declare-fun tp!75242 () Bool)

(declare-fun b_and!33987 () Bool)

(assert (=> start!93800 (= tp!75242 b_and!33987)))

(declare-fun b!1060928 () Bool)

(declare-fun e!604082 () Bool)

(declare-fun e!604083 () Bool)

(declare-fun mapRes!39295 () Bool)

(assert (=> b!1060928 (= e!604082 (and e!604083 mapRes!39295))))

(declare-fun condMapEmpty!39295 () Bool)

(declare-datatypes ((V!38579 0))(
  ( (V!38580 (val!12592 Int)) )
))
(declare-datatypes ((ValueCell!11838 0))(
  ( (ValueCellFull!11838 (v!15202 V!38579)) (EmptyCell!11838) )
))
(declare-datatypes ((array!67175 0))(
  ( (array!67176 (arr!32295 (Array (_ BitVec 32) ValueCell!11838)) (size!32831 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67175)

(declare-fun mapDefault!39295 () ValueCell!11838)

(assert (=> b!1060928 (= condMapEmpty!39295 (= (arr!32295 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11838)) mapDefault!39295)))))

(declare-fun b!1060929 () Bool)

(declare-fun e!604079 () Bool)

(assert (=> b!1060929 (= e!604079 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((tuple2!15910 0))(
  ( (tuple2!15911 (_1!7966 (_ BitVec 64)) (_2!7966 V!38579)) )
))
(declare-datatypes ((List!22497 0))(
  ( (Nil!22494) (Cons!22493 (h!23702 tuple2!15910) (t!31806 List!22497)) )
))
(declare-datatypes ((ListLongMap!13879 0))(
  ( (ListLongMap!13880 (toList!6955 List!22497)) )
))
(declare-fun lt!467418 () ListLongMap!13879)

(declare-fun minValue!907 () V!38579)

(declare-datatypes ((array!67177 0))(
  ( (array!67178 (arr!32296 (Array (_ BitVec 32) (_ BitVec 64))) (size!32832 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67177)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38579)

(declare-fun getCurrentListMapNoExtraKeys!3557 (array!67177 array!67175 (_ BitVec 32) (_ BitVec 32) V!38579 V!38579 (_ BitVec 32) Int) ListLongMap!13879)

(assert (=> b!1060929 (= lt!467418 (getCurrentListMapNoExtraKeys!3557 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38579)

(declare-fun lt!467419 () ListLongMap!13879)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060929 (= lt!467419 (getCurrentListMapNoExtraKeys!3557 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060930 () Bool)

(declare-fun res!708531 () Bool)

(assert (=> b!1060930 (=> (not res!708531) (not e!604079))))

(declare-datatypes ((List!22498 0))(
  ( (Nil!22495) (Cons!22494 (h!23703 (_ BitVec 64)) (t!31807 List!22498)) )
))
(declare-fun arrayNoDuplicates!0 (array!67177 (_ BitVec 32) List!22498) Bool)

(assert (=> b!1060930 (= res!708531 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22495))))

(declare-fun b!1060931 () Bool)

(declare-fun res!708530 () Bool)

(assert (=> b!1060931 (=> (not res!708530) (not e!604079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67177 (_ BitVec 32)) Bool)

(assert (=> b!1060931 (= res!708530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39295 () Bool)

(declare-fun tp!75241 () Bool)

(declare-fun e!604080 () Bool)

(assert (=> mapNonEmpty!39295 (= mapRes!39295 (and tp!75241 e!604080))))

(declare-fun mapKey!39295 () (_ BitVec 32))

(declare-fun mapValue!39295 () ValueCell!11838)

(declare-fun mapRest!39295 () (Array (_ BitVec 32) ValueCell!11838))

(assert (=> mapNonEmpty!39295 (= (arr!32295 _values!955) (store mapRest!39295 mapKey!39295 mapValue!39295))))

(declare-fun res!708529 () Bool)

(assert (=> start!93800 (=> (not res!708529) (not e!604079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93800 (= res!708529 (validMask!0 mask!1515))))

(assert (=> start!93800 e!604079))

(assert (=> start!93800 true))

(declare-fun tp_is_empty!25083 () Bool)

(assert (=> start!93800 tp_is_empty!25083))

(declare-fun array_inv!25026 (array!67175) Bool)

(assert (=> start!93800 (and (array_inv!25026 _values!955) e!604082)))

(assert (=> start!93800 tp!75242))

(declare-fun array_inv!25027 (array!67177) Bool)

(assert (=> start!93800 (array_inv!25027 _keys!1163)))

(declare-fun b!1060932 () Bool)

(assert (=> b!1060932 (= e!604083 tp_is_empty!25083)))

(declare-fun b!1060933 () Bool)

(declare-fun res!708532 () Bool)

(assert (=> b!1060933 (=> (not res!708532) (not e!604079))))

(assert (=> b!1060933 (= res!708532 (and (= (size!32831 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32832 _keys!1163) (size!32831 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060934 () Bool)

(assert (=> b!1060934 (= e!604080 tp_is_empty!25083)))

(declare-fun mapIsEmpty!39295 () Bool)

(assert (=> mapIsEmpty!39295 mapRes!39295))

(assert (= (and start!93800 res!708529) b!1060933))

(assert (= (and b!1060933 res!708532) b!1060931))

(assert (= (and b!1060931 res!708530) b!1060930))

(assert (= (and b!1060930 res!708531) b!1060929))

(assert (= (and b!1060928 condMapEmpty!39295) mapIsEmpty!39295))

(assert (= (and b!1060928 (not condMapEmpty!39295)) mapNonEmpty!39295))

(get-info :version)

(assert (= (and mapNonEmpty!39295 ((_ is ValueCellFull!11838) mapValue!39295)) b!1060934))

(assert (= (and b!1060928 ((_ is ValueCellFull!11838) mapDefault!39295)) b!1060932))

(assert (= start!93800 b!1060928))

(declare-fun m!979879 () Bool)

(assert (=> b!1060929 m!979879))

(declare-fun m!979881 () Bool)

(assert (=> b!1060929 m!979881))

(declare-fun m!979883 () Bool)

(assert (=> b!1060931 m!979883))

(declare-fun m!979885 () Bool)

(assert (=> start!93800 m!979885))

(declare-fun m!979887 () Bool)

(assert (=> start!93800 m!979887))

(declare-fun m!979889 () Bool)

(assert (=> start!93800 m!979889))

(declare-fun m!979891 () Bool)

(assert (=> mapNonEmpty!39295 m!979891))

(declare-fun m!979893 () Bool)

(assert (=> b!1060930 m!979893))

(check-sat (not b!1060929) (not b!1060930) (not start!93800) b_and!33987 tp_is_empty!25083 (not b_next!21273) (not b!1060931) (not mapNonEmpty!39295))
(check-sat b_and!33987 (not b_next!21273))
