; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93998 () Bool)

(assert start!93998)

(declare-fun b_free!21235 () Bool)

(declare-fun b_next!21235 () Bool)

(assert (=> start!93998 (= b_free!21235 (not b_next!21235))))

(declare-fun tp!75127 () Bool)

(declare-fun b_and!33959 () Bool)

(assert (=> start!93998 (= tp!75127 b_and!33959)))

(declare-fun b!1061856 () Bool)

(declare-fun e!604653 () Bool)

(declare-fun e!604649 () Bool)

(declare-fun mapRes!39238 () Bool)

(assert (=> b!1061856 (= e!604653 (and e!604649 mapRes!39238))))

(declare-fun condMapEmpty!39238 () Bool)

(declare-datatypes ((V!38529 0))(
  ( (V!38530 (val!12573 Int)) )
))
(declare-datatypes ((ValueCell!11819 0))(
  ( (ValueCellFull!11819 (v!15179 V!38529)) (EmptyCell!11819) )
))
(declare-datatypes ((array!67157 0))(
  ( (array!67158 (arr!32280 (Array (_ BitVec 32) ValueCell!11819)) (size!32817 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67157)

(declare-fun mapDefault!39238 () ValueCell!11819)

(assert (=> b!1061856 (= condMapEmpty!39238 (= (arr!32280 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11819)) mapDefault!39238)))))

(declare-fun mapIsEmpty!39238 () Bool)

(assert (=> mapIsEmpty!39238 mapRes!39238))

(declare-fun res!708824 () Bool)

(declare-fun e!604652 () Bool)

(assert (=> start!93998 (=> (not res!708824) (not e!604652))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93998 (= res!708824 (validMask!0 mask!1515))))

(assert (=> start!93998 e!604652))

(assert (=> start!93998 true))

(declare-fun tp_is_empty!25045 () Bool)

(assert (=> start!93998 tp_is_empty!25045))

(declare-fun array_inv!25030 (array!67157) Bool)

(assert (=> start!93998 (and (array_inv!25030 _values!955) e!604653)))

(assert (=> start!93998 tp!75127))

(declare-datatypes ((array!67159 0))(
  ( (array!67160 (arr!32281 (Array (_ BitVec 32) (_ BitVec 64))) (size!32818 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67159)

(declare-fun array_inv!25031 (array!67159) Bool)

(assert (=> start!93998 (array_inv!25031 _keys!1163)))

(declare-fun b!1061857 () Bool)

(declare-fun res!708823 () Bool)

(assert (=> b!1061857 (=> (not res!708823) (not e!604652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67159 (_ BitVec 32)) Bool)

(assert (=> b!1061857 (= res!708823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061858 () Bool)

(declare-fun res!708825 () Bool)

(assert (=> b!1061858 (=> (not res!708825) (not e!604652))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061858 (= res!708825 (and (= (size!32817 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32818 _keys!1163) (size!32817 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061859 () Bool)

(assert (=> b!1061859 (= e!604652 false)))

(declare-fun minValue!907 () V!38529)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38529)

(declare-datatypes ((tuple2!15882 0))(
  ( (tuple2!15883 (_1!7952 (_ BitVec 64)) (_2!7952 V!38529)) )
))
(declare-datatypes ((List!22467 0))(
  ( (Nil!22464) (Cons!22463 (h!23681 tuple2!15882) (t!31768 List!22467)) )
))
(declare-datatypes ((ListLongMap!13859 0))(
  ( (ListLongMap!13860 (toList!6945 List!22467)) )
))
(declare-fun lt!467820 () ListLongMap!13859)

(declare-fun getCurrentListMapNoExtraKeys!3593 (array!67159 array!67157 (_ BitVec 32) (_ BitVec 32) V!38529 V!38529 (_ BitVec 32) Int) ListLongMap!13859)

(assert (=> b!1061859 (= lt!467820 (getCurrentListMapNoExtraKeys!3593 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38529)

(declare-fun lt!467819 () ListLongMap!13859)

(assert (=> b!1061859 (= lt!467819 (getCurrentListMapNoExtraKeys!3593 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061860 () Bool)

(declare-fun e!604650 () Bool)

(assert (=> b!1061860 (= e!604650 tp_is_empty!25045)))

(declare-fun b!1061861 () Bool)

(assert (=> b!1061861 (= e!604649 tp_is_empty!25045)))

(declare-fun mapNonEmpty!39238 () Bool)

(declare-fun tp!75128 () Bool)

(assert (=> mapNonEmpty!39238 (= mapRes!39238 (and tp!75128 e!604650))))

(declare-fun mapValue!39238 () ValueCell!11819)

(declare-fun mapRest!39238 () (Array (_ BitVec 32) ValueCell!11819))

(declare-fun mapKey!39238 () (_ BitVec 32))

(assert (=> mapNonEmpty!39238 (= (arr!32280 _values!955) (store mapRest!39238 mapKey!39238 mapValue!39238))))

(declare-fun b!1061862 () Bool)

(declare-fun res!708826 () Bool)

(assert (=> b!1061862 (=> (not res!708826) (not e!604652))))

(declare-datatypes ((List!22468 0))(
  ( (Nil!22465) (Cons!22464 (h!23682 (_ BitVec 64)) (t!31769 List!22468)) )
))
(declare-fun arrayNoDuplicates!0 (array!67159 (_ BitVec 32) List!22468) Bool)

(assert (=> b!1061862 (= res!708826 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22465))))

(assert (= (and start!93998 res!708824) b!1061858))

(assert (= (and b!1061858 res!708825) b!1061857))

(assert (= (and b!1061857 res!708823) b!1061862))

(assert (= (and b!1061862 res!708826) b!1061859))

(assert (= (and b!1061856 condMapEmpty!39238) mapIsEmpty!39238))

(assert (= (and b!1061856 (not condMapEmpty!39238)) mapNonEmpty!39238))

(get-info :version)

(assert (= (and mapNonEmpty!39238 ((_ is ValueCellFull!11819) mapValue!39238)) b!1061860))

(assert (= (and b!1061856 ((_ is ValueCellFull!11819) mapDefault!39238)) b!1061861))

(assert (= start!93998 b!1061856))

(declare-fun m!981247 () Bool)

(assert (=> b!1061862 m!981247))

(declare-fun m!981249 () Bool)

(assert (=> b!1061857 m!981249))

(declare-fun m!981251 () Bool)

(assert (=> start!93998 m!981251))

(declare-fun m!981253 () Bool)

(assert (=> start!93998 m!981253))

(declare-fun m!981255 () Bool)

(assert (=> start!93998 m!981255))

(declare-fun m!981257 () Bool)

(assert (=> b!1061859 m!981257))

(declare-fun m!981259 () Bool)

(assert (=> b!1061859 m!981259))

(declare-fun m!981261 () Bool)

(assert (=> mapNonEmpty!39238 m!981261))

(check-sat (not mapNonEmpty!39238) tp_is_empty!25045 (not start!93998) (not b!1061862) b_and!33959 (not b!1061859) (not b_next!21235) (not b!1061857))
(check-sat b_and!33959 (not b_next!21235))
