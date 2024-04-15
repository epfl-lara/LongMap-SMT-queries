; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93780 () Bool)

(assert start!93780)

(declare-fun b_free!21259 () Bool)

(declare-fun b_next!21259 () Bool)

(assert (=> start!93780 (= b_free!21259 (not b_next!21259))))

(declare-fun tp!75199 () Bool)

(declare-fun b_and!33947 () Bool)

(assert (=> start!93780 (= tp!75199 b_and!33947)))

(declare-fun b!1060628 () Bool)

(declare-fun e!603882 () Bool)

(declare-fun e!603885 () Bool)

(declare-fun mapRes!39274 () Bool)

(assert (=> b!1060628 (= e!603882 (and e!603885 mapRes!39274))))

(declare-fun condMapEmpty!39274 () Bool)

(declare-datatypes ((V!38561 0))(
  ( (V!38562 (val!12585 Int)) )
))
(declare-datatypes ((ValueCell!11831 0))(
  ( (ValueCellFull!11831 (v!15194 V!38561)) (EmptyCell!11831) )
))
(declare-datatypes ((array!67092 0))(
  ( (array!67093 (arr!32254 (Array (_ BitVec 32) ValueCell!11831)) (size!32792 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67092)

(declare-fun mapDefault!39274 () ValueCell!11831)

(assert (=> b!1060628 (= condMapEmpty!39274 (= (arr!32254 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11831)) mapDefault!39274)))))

(declare-fun mapIsEmpty!39274 () Bool)

(assert (=> mapIsEmpty!39274 mapRes!39274))

(declare-fun b!1060629 () Bool)

(declare-fun res!708377 () Bool)

(declare-fun e!603881 () Bool)

(assert (=> b!1060629 (=> (not res!708377) (not e!603881))))

(declare-datatypes ((array!67094 0))(
  ( (array!67095 (arr!32255 (Array (_ BitVec 32) (_ BitVec 64))) (size!32793 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67094)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67094 (_ BitVec 32)) Bool)

(assert (=> b!1060629 (= res!708377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060630 () Bool)

(declare-fun e!603884 () Bool)

(declare-fun tp_is_empty!25069 () Bool)

(assert (=> b!1060630 (= e!603884 tp_is_empty!25069)))

(declare-fun b!1060632 () Bool)

(declare-fun res!708376 () Bool)

(assert (=> b!1060632 (=> (not res!708376) (not e!603881))))

(declare-datatypes ((List!22524 0))(
  ( (Nil!22521) (Cons!22520 (h!23729 (_ BitVec 64)) (t!31824 List!22524)) )
))
(declare-fun arrayNoDuplicates!0 (array!67094 (_ BitVec 32) List!22524) Bool)

(assert (=> b!1060632 (= res!708376 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22521))))

(declare-fun b!1060633 () Bool)

(assert (=> b!1060633 (= e!603885 tp_is_empty!25069)))

(declare-fun res!708378 () Bool)

(assert (=> start!93780 (=> (not res!708378) (not e!603881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93780 (= res!708378 (validMask!0 mask!1515))))

(assert (=> start!93780 e!603881))

(assert (=> start!93780 true))

(assert (=> start!93780 tp_is_empty!25069))

(declare-fun array_inv!24998 (array!67092) Bool)

(assert (=> start!93780 (and (array_inv!24998 _values!955) e!603882)))

(assert (=> start!93780 tp!75199))

(declare-fun array_inv!24999 (array!67094) Bool)

(assert (=> start!93780 (array_inv!24999 _keys!1163)))

(declare-fun b!1060631 () Bool)

(assert (=> b!1060631 (= e!603881 false)))

(declare-fun minValue!907 () V!38561)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((tuple2!15968 0))(
  ( (tuple2!15969 (_1!7995 (_ BitVec 64)) (_2!7995 V!38561)) )
))
(declare-datatypes ((List!22525 0))(
  ( (Nil!22522) (Cons!22521 (h!23730 tuple2!15968) (t!31825 List!22525)) )
))
(declare-datatypes ((ListLongMap!13937 0))(
  ( (ListLongMap!13938 (toList!6984 List!22525)) )
))
(declare-fun lt!467177 () ListLongMap!13937)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38561)

(declare-fun getCurrentListMapNoExtraKeys!3601 (array!67094 array!67092 (_ BitVec 32) (_ BitVec 32) V!38561 V!38561 (_ BitVec 32) Int) ListLongMap!13937)

(assert (=> b!1060631 (= lt!467177 (getCurrentListMapNoExtraKeys!3601 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38561)

(declare-fun lt!467176 () ListLongMap!13937)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060631 (= lt!467176 (getCurrentListMapNoExtraKeys!3601 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060634 () Bool)

(declare-fun res!708379 () Bool)

(assert (=> b!1060634 (=> (not res!708379) (not e!603881))))

(assert (=> b!1060634 (= res!708379 (and (= (size!32792 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32793 _keys!1163) (size!32792 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39274 () Bool)

(declare-fun tp!75200 () Bool)

(assert (=> mapNonEmpty!39274 (= mapRes!39274 (and tp!75200 e!603884))))

(declare-fun mapKey!39274 () (_ BitVec 32))

(declare-fun mapValue!39274 () ValueCell!11831)

(declare-fun mapRest!39274 () (Array (_ BitVec 32) ValueCell!11831))

(assert (=> mapNonEmpty!39274 (= (arr!32254 _values!955) (store mapRest!39274 mapKey!39274 mapValue!39274))))

(assert (= (and start!93780 res!708378) b!1060634))

(assert (= (and b!1060634 res!708379) b!1060629))

(assert (= (and b!1060629 res!708377) b!1060632))

(assert (= (and b!1060632 res!708376) b!1060631))

(assert (= (and b!1060628 condMapEmpty!39274) mapIsEmpty!39274))

(assert (= (and b!1060628 (not condMapEmpty!39274)) mapNonEmpty!39274))

(get-info :version)

(assert (= (and mapNonEmpty!39274 ((_ is ValueCellFull!11831) mapValue!39274)) b!1060630))

(assert (= (and b!1060628 ((_ is ValueCellFull!11831) mapDefault!39274)) b!1060633))

(assert (= start!93780 b!1060628))

(declare-fun m!979141 () Bool)

(assert (=> b!1060632 m!979141))

(declare-fun m!979143 () Bool)

(assert (=> b!1060629 m!979143))

(declare-fun m!979145 () Bool)

(assert (=> mapNonEmpty!39274 m!979145))

(declare-fun m!979147 () Bool)

(assert (=> start!93780 m!979147))

(declare-fun m!979149 () Bool)

(assert (=> start!93780 m!979149))

(declare-fun m!979151 () Bool)

(assert (=> start!93780 m!979151))

(declare-fun m!979153 () Bool)

(assert (=> b!1060631 m!979153))

(declare-fun m!979155 () Bool)

(assert (=> b!1060631 m!979155))

(check-sat (not b!1060629) tp_is_empty!25069 (not mapNonEmpty!39274) (not b!1060632) (not b!1060631) b_and!33947 (not b_next!21259) (not start!93780))
(check-sat b_and!33947 (not b_next!21259))
