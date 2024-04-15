; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94930 () Bool)

(assert start!94930)

(declare-fun b_free!22141 () Bool)

(declare-fun b_next!22141 () Bool)

(assert (=> start!94930 (= b_free!22141 (not b_next!22141))))

(declare-fun tp!77888 () Bool)

(declare-fun b_and!34969 () Bool)

(assert (=> start!94930 (= tp!77888 b_and!34969)))

(declare-fun mapIsEmpty!40639 () Bool)

(declare-fun mapRes!40639 () Bool)

(assert (=> mapIsEmpty!40639 mapRes!40639))

(declare-fun b!1073274 () Bool)

(declare-fun res!715865 () Bool)

(declare-fun e!613157 () Bool)

(assert (=> b!1073274 (=> (not res!715865) (not e!613157))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39737 0))(
  ( (V!39738 (val!13026 Int)) )
))
(declare-datatypes ((ValueCell!12272 0))(
  ( (ValueCellFull!12272 (v!15643 V!39737)) (EmptyCell!12272) )
))
(declare-datatypes ((array!68800 0))(
  ( (array!68801 (arr!33094 (Array (_ BitVec 32) ValueCell!12272)) (size!33632 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68800)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68802 0))(
  ( (array!68803 (arr!33095 (Array (_ BitVec 32) (_ BitVec 64))) (size!33633 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68802)

(assert (=> b!1073274 (= res!715865 (and (= (size!33632 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33633 _keys!1163) (size!33632 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073275 () Bool)

(declare-fun e!613159 () Bool)

(declare-fun tp_is_empty!25951 () Bool)

(assert (=> b!1073275 (= e!613159 tp_is_empty!25951)))

(declare-fun b!1073276 () Bool)

(declare-fun res!715866 () Bool)

(assert (=> b!1073276 (=> (not res!715866) (not e!613157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68802 (_ BitVec 32)) Bool)

(assert (=> b!1073276 (= res!715866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715864 () Bool)

(assert (=> start!94930 (=> (not res!715864) (not e!613157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94930 (= res!715864 (validMask!0 mask!1515))))

(assert (=> start!94930 e!613157))

(assert (=> start!94930 true))

(assert (=> start!94930 tp_is_empty!25951))

(declare-fun e!613160 () Bool)

(declare-fun array_inv!25606 (array!68800) Bool)

(assert (=> start!94930 (and (array_inv!25606 _values!955) e!613160)))

(assert (=> start!94930 tp!77888))

(declare-fun array_inv!25607 (array!68802) Bool)

(assert (=> start!94930 (array_inv!25607 _keys!1163)))

(declare-fun b!1073273 () Bool)

(assert (=> b!1073273 (= e!613157 false)))

(declare-fun minValue!907 () V!39737)

(declare-datatypes ((tuple2!16652 0))(
  ( (tuple2!16653 (_1!8337 (_ BitVec 64)) (_2!8337 V!39737)) )
))
(declare-datatypes ((List!23177 0))(
  ( (Nil!23174) (Cons!23173 (h!24382 tuple2!16652) (t!32505 List!23177)) )
))
(declare-datatypes ((ListLongMap!14621 0))(
  ( (ListLongMap!14622 (toList!7326 List!23177)) )
))
(declare-fun lt!475843 () ListLongMap!14621)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39737)

(declare-fun getCurrentListMapNoExtraKeys!3906 (array!68802 array!68800 (_ BitVec 32) (_ BitVec 32) V!39737 V!39737 (_ BitVec 32) Int) ListLongMap!14621)

(assert (=> b!1073273 (= lt!475843 (getCurrentListMapNoExtraKeys!3906 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39737)

(declare-fun lt!475844 () ListLongMap!14621)

(assert (=> b!1073273 (= lt!475844 (getCurrentListMapNoExtraKeys!3906 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073277 () Bool)

(declare-fun e!613158 () Bool)

(assert (=> b!1073277 (= e!613158 tp_is_empty!25951)))

(declare-fun mapNonEmpty!40639 () Bool)

(declare-fun tp!77887 () Bool)

(assert (=> mapNonEmpty!40639 (= mapRes!40639 (and tp!77887 e!613159))))

(declare-fun mapRest!40639 () (Array (_ BitVec 32) ValueCell!12272))

(declare-fun mapValue!40639 () ValueCell!12272)

(declare-fun mapKey!40639 () (_ BitVec 32))

(assert (=> mapNonEmpty!40639 (= (arr!33094 _values!955) (store mapRest!40639 mapKey!40639 mapValue!40639))))

(declare-fun b!1073278 () Bool)

(assert (=> b!1073278 (= e!613160 (and e!613158 mapRes!40639))))

(declare-fun condMapEmpty!40639 () Bool)

(declare-fun mapDefault!40639 () ValueCell!12272)

(assert (=> b!1073278 (= condMapEmpty!40639 (= (arr!33094 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12272)) mapDefault!40639)))))

(declare-fun b!1073279 () Bool)

(declare-fun res!715867 () Bool)

(assert (=> b!1073279 (=> (not res!715867) (not e!613157))))

(declare-datatypes ((List!23178 0))(
  ( (Nil!23175) (Cons!23174 (h!24383 (_ BitVec 64)) (t!32506 List!23178)) )
))
(declare-fun arrayNoDuplicates!0 (array!68802 (_ BitVec 32) List!23178) Bool)

(assert (=> b!1073279 (= res!715867 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23175))))

(assert (= (and start!94930 res!715864) b!1073274))

(assert (= (and b!1073274 res!715865) b!1073276))

(assert (= (and b!1073276 res!715866) b!1073279))

(assert (= (and b!1073279 res!715867) b!1073273))

(assert (= (and b!1073278 condMapEmpty!40639) mapIsEmpty!40639))

(assert (= (and b!1073278 (not condMapEmpty!40639)) mapNonEmpty!40639))

(get-info :version)

(assert (= (and mapNonEmpty!40639 ((_ is ValueCellFull!12272) mapValue!40639)) b!1073275))

(assert (= (and b!1073278 ((_ is ValueCellFull!12272) mapDefault!40639)) b!1073277))

(assert (= start!94930 b!1073278))

(declare-fun m!991789 () Bool)

(assert (=> mapNonEmpty!40639 m!991789))

(declare-fun m!991791 () Bool)

(assert (=> b!1073276 m!991791))

(declare-fun m!991793 () Bool)

(assert (=> b!1073273 m!991793))

(declare-fun m!991795 () Bool)

(assert (=> b!1073273 m!991795))

(declare-fun m!991797 () Bool)

(assert (=> b!1073279 m!991797))

(declare-fun m!991799 () Bool)

(assert (=> start!94930 m!991799))

(declare-fun m!991801 () Bool)

(assert (=> start!94930 m!991801))

(declare-fun m!991803 () Bool)

(assert (=> start!94930 m!991803))

(check-sat (not start!94930) tp_is_empty!25951 (not b!1073273) (not b_next!22141) (not b!1073279) (not mapNonEmpty!40639) (not b!1073276) b_and!34969)
(check-sat b_and!34969 (not b_next!22141))
