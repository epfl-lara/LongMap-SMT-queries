; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93938 () Bool)

(assert start!93938)

(declare-fun b_free!21187 () Bool)

(declare-fun b_next!21187 () Bool)

(assert (=> start!93938 (= b_free!21187 (not b_next!21187))))

(declare-fun tp!74980 () Bool)

(declare-fun b_and!33907 () Bool)

(assert (=> start!93938 (= tp!74980 b_and!33907)))

(declare-fun mapNonEmpty!39163 () Bool)

(declare-fun mapRes!39163 () Bool)

(declare-fun tp!74981 () Bool)

(declare-fun e!604242 () Bool)

(assert (=> mapNonEmpty!39163 (= mapRes!39163 (and tp!74981 e!604242))))

(declare-fun mapKey!39163 () (_ BitVec 32))

(declare-datatypes ((V!38465 0))(
  ( (V!38466 (val!12549 Int)) )
))
(declare-datatypes ((ValueCell!11795 0))(
  ( (ValueCellFull!11795 (v!15155 V!38465)) (EmptyCell!11795) )
))
(declare-fun mapValue!39163 () ValueCell!11795)

(declare-datatypes ((array!67065 0))(
  ( (array!67066 (arr!32235 (Array (_ BitVec 32) ValueCell!11795)) (size!32772 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67065)

(declare-fun mapRest!39163 () (Array (_ BitVec 32) ValueCell!11795))

(assert (=> mapNonEmpty!39163 (= (arr!32235 _values!955) (store mapRest!39163 mapKey!39163 mapValue!39163))))

(declare-fun b!1061279 () Bool)

(declare-fun e!604245 () Bool)

(declare-fun e!604243 () Bool)

(assert (=> b!1061279 (= e!604245 (and e!604243 mapRes!39163))))

(declare-fun condMapEmpty!39163 () Bool)

(declare-fun mapDefault!39163 () ValueCell!11795)

(assert (=> b!1061279 (= condMapEmpty!39163 (= (arr!32235 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11795)) mapDefault!39163)))))

(declare-fun b!1061280 () Bool)

(declare-fun res!708510 () Bool)

(declare-fun e!604241 () Bool)

(assert (=> b!1061280 (=> (not res!708510) (not e!604241))))

(declare-datatypes ((array!67067 0))(
  ( (array!67068 (arr!32236 (Array (_ BitVec 32) (_ BitVec 64))) (size!32773 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67067)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67067 (_ BitVec 32)) Bool)

(assert (=> b!1061280 (= res!708510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061281 () Bool)

(declare-fun res!708508 () Bool)

(assert (=> b!1061281 (=> (not res!708508) (not e!604241))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061281 (= res!708508 (and (= (size!32772 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32773 _keys!1163) (size!32772 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39163 () Bool)

(assert (=> mapIsEmpty!39163 mapRes!39163))

(declare-fun res!708509 () Bool)

(assert (=> start!93938 (=> (not res!708509) (not e!604241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93938 (= res!708509 (validMask!0 mask!1515))))

(assert (=> start!93938 e!604241))

(assert (=> start!93938 true))

(declare-fun tp_is_empty!24997 () Bool)

(assert (=> start!93938 tp_is_empty!24997))

(declare-fun array_inv!24994 (array!67065) Bool)

(assert (=> start!93938 (and (array_inv!24994 _values!955) e!604245)))

(assert (=> start!93938 tp!74980))

(declare-fun array_inv!24995 (array!67067) Bool)

(assert (=> start!93938 (array_inv!24995 _keys!1163)))

(declare-fun b!1061282 () Bool)

(assert (=> b!1061282 (= e!604243 tp_is_empty!24997)))

(declare-fun b!1061283 () Bool)

(assert (=> b!1061283 (= e!604242 tp_is_empty!24997)))

(declare-fun b!1061284 () Bool)

(assert (=> b!1061284 (= e!604241 false)))

(declare-fun zeroValueBefore!47 () V!38465)

(declare-datatypes ((tuple2!15854 0))(
  ( (tuple2!15855 (_1!7938 (_ BitVec 64)) (_2!7938 V!38465)) )
))
(declare-datatypes ((List!22437 0))(
  ( (Nil!22434) (Cons!22433 (h!23651 tuple2!15854) (t!31736 List!22437)) )
))
(declare-datatypes ((ListLongMap!13831 0))(
  ( (ListLongMap!13832 (toList!6931 List!22437)) )
))
(declare-fun lt!467715 () ListLongMap!13831)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38465)

(declare-fun getCurrentListMapNoExtraKeys!3579 (array!67067 array!67065 (_ BitVec 32) (_ BitVec 32) V!38465 V!38465 (_ BitVec 32) Int) ListLongMap!13831)

(assert (=> b!1061284 (= lt!467715 (getCurrentListMapNoExtraKeys!3579 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061285 () Bool)

(declare-fun res!708511 () Bool)

(assert (=> b!1061285 (=> (not res!708511) (not e!604241))))

(declare-datatypes ((List!22438 0))(
  ( (Nil!22435) (Cons!22434 (h!23652 (_ BitVec 64)) (t!31737 List!22438)) )
))
(declare-fun arrayNoDuplicates!0 (array!67067 (_ BitVec 32) List!22438) Bool)

(assert (=> b!1061285 (= res!708511 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22435))))

(assert (= (and start!93938 res!708509) b!1061281))

(assert (= (and b!1061281 res!708508) b!1061280))

(assert (= (and b!1061280 res!708510) b!1061285))

(assert (= (and b!1061285 res!708511) b!1061284))

(assert (= (and b!1061279 condMapEmpty!39163) mapIsEmpty!39163))

(assert (= (and b!1061279 (not condMapEmpty!39163)) mapNonEmpty!39163))

(get-info :version)

(assert (= (and mapNonEmpty!39163 ((_ is ValueCellFull!11795) mapValue!39163)) b!1061283))

(assert (= (and b!1061279 ((_ is ValueCellFull!11795) mapDefault!39163)) b!1061282))

(assert (= start!93938 b!1061279))

(declare-fun m!980867 () Bool)

(assert (=> start!93938 m!980867))

(declare-fun m!980869 () Bool)

(assert (=> start!93938 m!980869))

(declare-fun m!980871 () Bool)

(assert (=> start!93938 m!980871))

(declare-fun m!980873 () Bool)

(assert (=> mapNonEmpty!39163 m!980873))

(declare-fun m!980875 () Bool)

(assert (=> b!1061285 m!980875))

(declare-fun m!980877 () Bool)

(assert (=> b!1061284 m!980877))

(declare-fun m!980879 () Bool)

(assert (=> b!1061280 m!980879))

(check-sat (not mapNonEmpty!39163) b_and!33907 (not start!93938) tp_is_empty!24997 (not b!1061284) (not b!1061285) (not b!1061280) (not b_next!21187))
(check-sat b_and!33907 (not b_next!21187))
