; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42084 () Bool)

(assert start!42084)

(declare-fun b_free!11637 () Bool)

(declare-fun b_next!11637 () Bool)

(assert (=> start!42084 (= b_free!11637 (not b_next!11637))))

(declare-fun tp!40930 () Bool)

(declare-fun b_and!20047 () Bool)

(assert (=> start!42084 (= tp!40930 b_and!20047)))

(declare-fun b!469877 () Bool)

(declare-fun res!280798 () Bool)

(declare-fun e!275211 () Bool)

(assert (=> b!469877 (=> (not res!280798) (not e!275211))))

(declare-datatypes ((array!29901 0))(
  ( (array!29902 (arr!14375 (Array (_ BitVec 32) (_ BitVec 64))) (size!14727 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29901)

(declare-datatypes ((List!8738 0))(
  ( (Nil!8735) (Cons!8734 (h!9590 (_ BitVec 64)) (t!14698 List!8738)) )
))
(declare-fun arrayNoDuplicates!0 (array!29901 (_ BitVec 32) List!8738) Bool)

(assert (=> b!469877 (= res!280798 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8735))))

(declare-fun b!469878 () Bool)

(declare-fun e!275209 () Bool)

(declare-fun e!275207 () Bool)

(declare-fun mapRes!21295 () Bool)

(assert (=> b!469878 (= e!275209 (and e!275207 mapRes!21295))))

(declare-fun condMapEmpty!21295 () Bool)

(declare-datatypes ((V!18525 0))(
  ( (V!18526 (val!6577 Int)) )
))
(declare-datatypes ((ValueCell!6189 0))(
  ( (ValueCellFull!6189 (v!8867 V!18525)) (EmptyCell!6189) )
))
(declare-datatypes ((array!29903 0))(
  ( (array!29904 (arr!14376 (Array (_ BitVec 32) ValueCell!6189)) (size!14728 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29903)

(declare-fun mapDefault!21295 () ValueCell!6189)

(assert (=> b!469878 (= condMapEmpty!21295 (= (arr!14376 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6189)) mapDefault!21295)))))

(declare-fun b!469879 () Bool)

(declare-fun e!275208 () Bool)

(assert (=> b!469879 (= e!275208 true)))

(declare-datatypes ((tuple2!8660 0))(
  ( (tuple2!8661 (_1!4341 (_ BitVec 64)) (_2!4341 V!18525)) )
))
(declare-datatypes ((List!8739 0))(
  ( (Nil!8736) (Cons!8735 (h!9591 tuple2!8660) (t!14699 List!8739)) )
))
(declare-datatypes ((ListLongMap!7573 0))(
  ( (ListLongMap!7574 (toList!3802 List!8739)) )
))
(declare-fun lt!213094 () ListLongMap!7573)

(declare-fun lt!213097 () tuple2!8660)

(declare-fun minValueBefore!38 () V!18525)

(declare-fun +!1710 (ListLongMap!7573 tuple2!8660) ListLongMap!7573)

(assert (=> b!469879 (= (+!1710 lt!213094 lt!213097) (+!1710 (+!1710 lt!213094 (tuple2!8661 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213097))))

(declare-fun minValueAfter!38 () V!18525)

(assert (=> b!469879 (= lt!213097 (tuple2!8661 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13761 0))(
  ( (Unit!13762) )
))
(declare-fun lt!213092 () Unit!13761)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!123 (ListLongMap!7573 (_ BitVec 64) V!18525 V!18525) Unit!13761)

(assert (=> b!469879 (= lt!213092 (addSameAsAddTwiceSameKeyDiffValues!123 lt!213094 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18525)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lt!213098 () ListLongMap!7573)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2224 (array!29901 array!29903 (_ BitVec 32) (_ BitVec 32) V!18525 V!18525 (_ BitVec 32) Int) ListLongMap!7573)

(assert (=> b!469879 (= lt!213098 (getCurrentListMap!2224 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213093 () ListLongMap!7573)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469879 (= lt!213093 (getCurrentListMap!2224 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469880 () Bool)

(declare-fun res!280801 () Bool)

(assert (=> b!469880 (=> (not res!280801) (not e!275211))))

(assert (=> b!469880 (= res!280801 (and (= (size!14728 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14727 _keys!1025) (size!14728 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469881 () Bool)

(declare-fun res!280799 () Bool)

(assert (=> b!469881 (=> (not res!280799) (not e!275211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29901 (_ BitVec 32)) Bool)

(assert (=> b!469881 (= res!280799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469882 () Bool)

(declare-fun e!275210 () Bool)

(declare-fun tp_is_empty!13065 () Bool)

(assert (=> b!469882 (= e!275210 tp_is_empty!13065)))

(declare-fun res!280797 () Bool)

(assert (=> start!42084 (=> (not res!280797) (not e!275211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42084 (= res!280797 (validMask!0 mask!1365))))

(assert (=> start!42084 e!275211))

(assert (=> start!42084 tp_is_empty!13065))

(assert (=> start!42084 tp!40930))

(assert (=> start!42084 true))

(declare-fun array_inv!10372 (array!29901) Bool)

(assert (=> start!42084 (array_inv!10372 _keys!1025)))

(declare-fun array_inv!10373 (array!29903) Bool)

(assert (=> start!42084 (and (array_inv!10373 _values!833) e!275209)))

(declare-fun b!469883 () Bool)

(assert (=> b!469883 (= e!275211 (not e!275208))))

(declare-fun res!280800 () Bool)

(assert (=> b!469883 (=> res!280800 e!275208)))

(assert (=> b!469883 (= res!280800 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!213095 () ListLongMap!7573)

(assert (=> b!469883 (= lt!213094 lt!213095)))

(declare-fun lt!213096 () Unit!13761)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!147 (array!29901 array!29903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18525 V!18525 V!18525 V!18525 (_ BitVec 32) Int) Unit!13761)

(assert (=> b!469883 (= lt!213096 (lemmaNoChangeToArrayThenSameMapNoExtras!147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1967 (array!29901 array!29903 (_ BitVec 32) (_ BitVec 32) V!18525 V!18525 (_ BitVec 32) Int) ListLongMap!7573)

(assert (=> b!469883 (= lt!213095 (getCurrentListMapNoExtraKeys!1967 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469883 (= lt!213094 (getCurrentListMapNoExtraKeys!1967 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21295 () Bool)

(assert (=> mapIsEmpty!21295 mapRes!21295))

(declare-fun mapNonEmpty!21295 () Bool)

(declare-fun tp!40929 () Bool)

(assert (=> mapNonEmpty!21295 (= mapRes!21295 (and tp!40929 e!275210))))

(declare-fun mapKey!21295 () (_ BitVec 32))

(declare-fun mapRest!21295 () (Array (_ BitVec 32) ValueCell!6189))

(declare-fun mapValue!21295 () ValueCell!6189)

(assert (=> mapNonEmpty!21295 (= (arr!14376 _values!833) (store mapRest!21295 mapKey!21295 mapValue!21295))))

(declare-fun b!469884 () Bool)

(assert (=> b!469884 (= e!275207 tp_is_empty!13065)))

(assert (= (and start!42084 res!280797) b!469880))

(assert (= (and b!469880 res!280801) b!469881))

(assert (= (and b!469881 res!280799) b!469877))

(assert (= (and b!469877 res!280798) b!469883))

(assert (= (and b!469883 (not res!280800)) b!469879))

(assert (= (and b!469878 condMapEmpty!21295) mapIsEmpty!21295))

(assert (= (and b!469878 (not condMapEmpty!21295)) mapNonEmpty!21295))

(get-info :version)

(assert (= (and mapNonEmpty!21295 ((_ is ValueCellFull!6189) mapValue!21295)) b!469882))

(assert (= (and b!469878 ((_ is ValueCellFull!6189) mapDefault!21295)) b!469884))

(assert (= start!42084 b!469878))

(declare-fun m!452151 () Bool)

(assert (=> b!469883 m!452151))

(declare-fun m!452153 () Bool)

(assert (=> b!469883 m!452153))

(declare-fun m!452155 () Bool)

(assert (=> b!469883 m!452155))

(declare-fun m!452157 () Bool)

(assert (=> b!469879 m!452157))

(declare-fun m!452159 () Bool)

(assert (=> b!469879 m!452159))

(assert (=> b!469879 m!452157))

(declare-fun m!452161 () Bool)

(assert (=> b!469879 m!452161))

(declare-fun m!452163 () Bool)

(assert (=> b!469879 m!452163))

(declare-fun m!452165 () Bool)

(assert (=> b!469879 m!452165))

(declare-fun m!452167 () Bool)

(assert (=> b!469879 m!452167))

(declare-fun m!452169 () Bool)

(assert (=> start!42084 m!452169))

(declare-fun m!452171 () Bool)

(assert (=> start!42084 m!452171))

(declare-fun m!452173 () Bool)

(assert (=> start!42084 m!452173))

(declare-fun m!452175 () Bool)

(assert (=> b!469881 m!452175))

(declare-fun m!452177 () Bool)

(assert (=> b!469877 m!452177))

(declare-fun m!452179 () Bool)

(assert (=> mapNonEmpty!21295 m!452179))

(check-sat b_and!20047 tp_is_empty!13065 (not b!469883) (not b!469879) (not b_next!11637) (not start!42084) (not b!469877) (not b!469881) (not mapNonEmpty!21295))
(check-sat b_and!20047 (not b_next!11637))
