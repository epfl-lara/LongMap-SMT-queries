; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94950 () Bool)

(assert start!94950)

(declare-fun b_free!21967 () Bool)

(declare-fun b_next!21967 () Bool)

(assert (=> start!94950 (= b_free!21967 (not b_next!21967))))

(declare-fun tp!77359 () Bool)

(declare-fun b_and!34807 () Bool)

(assert (=> start!94950 (= tp!77359 b_and!34807)))

(declare-fun res!714879 () Bool)

(declare-fun e!612199 () Bool)

(assert (=> start!94950 (=> (not res!714879) (not e!612199))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94950 (= res!714879 (validMask!0 mask!1515))))

(assert (=> start!94950 e!612199))

(assert (=> start!94950 true))

(declare-fun tp_is_empty!25777 () Bool)

(assert (=> start!94950 tp_is_empty!25777))

(declare-datatypes ((V!39505 0))(
  ( (V!39506 (val!12939 Int)) )
))
(declare-datatypes ((ValueCell!12185 0))(
  ( (ValueCellFull!12185 (v!15551 V!39505)) (EmptyCell!12185) )
))
(declare-datatypes ((array!68569 0))(
  ( (array!68570 (arr!32974 (Array (_ BitVec 32) ValueCell!12185)) (size!33511 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68569)

(declare-fun e!612198 () Bool)

(declare-fun array_inv!25532 (array!68569) Bool)

(assert (=> start!94950 (and (array_inv!25532 _values!955) e!612198)))

(assert (=> start!94950 tp!77359))

(declare-datatypes ((array!68571 0))(
  ( (array!68572 (arr!32975 (Array (_ BitVec 32) (_ BitVec 64))) (size!33512 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68571)

(declare-fun array_inv!25533 (array!68571) Bool)

(assert (=> start!94950 (array_inv!25533 _keys!1163)))

(declare-fun b!1072186 () Bool)

(declare-fun res!714878 () Bool)

(assert (=> b!1072186 (=> (not res!714878) (not e!612199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68571 (_ BitVec 32)) Bool)

(assert (=> b!1072186 (= res!714878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072187 () Bool)

(declare-fun e!612203 () Bool)

(declare-fun mapRes!40372 () Bool)

(assert (=> b!1072187 (= e!612198 (and e!612203 mapRes!40372))))

(declare-fun condMapEmpty!40372 () Bool)

(declare-fun mapDefault!40372 () ValueCell!12185)

(assert (=> b!1072187 (= condMapEmpty!40372 (= (arr!32974 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12185)) mapDefault!40372)))))

(declare-fun b!1072188 () Bool)

(assert (=> b!1072188 (= e!612203 tp_is_empty!25777)))

(declare-fun mapNonEmpty!40372 () Bool)

(declare-fun tp!77360 () Bool)

(declare-fun e!612202 () Bool)

(assert (=> mapNonEmpty!40372 (= mapRes!40372 (and tp!77360 e!612202))))

(declare-fun mapRest!40372 () (Array (_ BitVec 32) ValueCell!12185))

(declare-fun mapKey!40372 () (_ BitVec 32))

(declare-fun mapValue!40372 () ValueCell!12185)

(assert (=> mapNonEmpty!40372 (= (arr!32974 _values!955) (store mapRest!40372 mapKey!40372 mapValue!40372))))

(declare-fun b!1072189 () Bool)

(declare-fun res!714875 () Bool)

(assert (=> b!1072189 (=> (not res!714875) (not e!612199))))

(declare-datatypes ((List!22995 0))(
  ( (Nil!22992) (Cons!22991 (h!24209 (_ BitVec 64)) (t!32320 List!22995)) )
))
(declare-fun arrayNoDuplicates!0 (array!68571 (_ BitVec 32) List!22995) Bool)

(assert (=> b!1072189 (= res!714875 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22992))))

(declare-fun b!1072190 () Bool)

(declare-fun e!612200 () Bool)

(assert (=> b!1072190 (= e!612200 true)))

(declare-fun lt!473834 () Bool)

(declare-datatypes ((tuple2!16430 0))(
  ( (tuple2!16431 (_1!8226 (_ BitVec 64)) (_2!8226 V!39505)) )
))
(declare-datatypes ((List!22996 0))(
  ( (Nil!22993) (Cons!22992 (h!24210 tuple2!16430) (t!32321 List!22996)) )
))
(declare-datatypes ((ListLongMap!14407 0))(
  ( (ListLongMap!14408 (toList!7219 List!22996)) )
))
(declare-fun lt!473833 () ListLongMap!14407)

(declare-fun lt!473839 () tuple2!16430)

(declare-fun contains!6343 (ListLongMap!14407 (_ BitVec 64)) Bool)

(declare-fun +!3183 (ListLongMap!14407 tuple2!16430) ListLongMap!14407)

(assert (=> b!1072190 (= lt!473834 (contains!6343 (+!3183 lt!473833 lt!473839) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!612197 () Bool)

(assert (=> b!1072190 e!612197))

(declare-fun res!714880 () Bool)

(assert (=> b!1072190 (=> (not res!714880) (not e!612197))))

(declare-fun zeroValueBefore!47 () V!39505)

(declare-fun lt!473835 () ListLongMap!14407)

(assert (=> b!1072190 (= res!714880 (= lt!473835 (+!3183 (+!3183 lt!473833 (tuple2!16431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!473839)))))

(declare-fun minValue!907 () V!39505)

(assert (=> b!1072190 (= lt!473839 (tuple2!16431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473838 () ListLongMap!14407)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39505)

(declare-fun getCurrentListMap!4118 (array!68571 array!68569 (_ BitVec 32) (_ BitVec 32) V!39505 V!39505 (_ BitVec 32) Int) ListLongMap!14407)

(assert (=> b!1072190 (= lt!473838 (getCurrentListMap!4118 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072190 (= lt!473835 (getCurrentListMap!4118 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072191 () Bool)

(declare-fun res!714876 () Bool)

(assert (=> b!1072191 (=> (not res!714876) (not e!612199))))

(assert (=> b!1072191 (= res!714876 (and (= (size!33511 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33512 _keys!1163) (size!33511 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473837 () ListLongMap!14407)

(declare-fun b!1072192 () Bool)

(assert (=> b!1072192 (= e!612197 (= lt!473838 (+!3183 lt!473837 lt!473839)))))

(declare-fun b!1072193 () Bool)

(assert (=> b!1072193 (= e!612199 (not e!612200))))

(declare-fun res!714877 () Bool)

(assert (=> b!1072193 (=> res!714877 e!612200)))

(assert (=> b!1072193 (= res!714877 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072193 (= lt!473833 lt!473837)))

(declare-datatypes ((Unit!35225 0))(
  ( (Unit!35226) )
))
(declare-fun lt!473836 () Unit!35225)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!830 (array!68571 array!68569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39505 V!39505 V!39505 V!39505 (_ BitVec 32) Int) Unit!35225)

(assert (=> b!1072193 (= lt!473836 (lemmaNoChangeToArrayThenSameMapNoExtras!830 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3827 (array!68571 array!68569 (_ BitVec 32) (_ BitVec 32) V!39505 V!39505 (_ BitVec 32) Int) ListLongMap!14407)

(assert (=> b!1072193 (= lt!473837 (getCurrentListMapNoExtraKeys!3827 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072193 (= lt!473833 (getCurrentListMapNoExtraKeys!3827 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40372 () Bool)

(assert (=> mapIsEmpty!40372 mapRes!40372))

(declare-fun b!1072194 () Bool)

(assert (=> b!1072194 (= e!612202 tp_is_empty!25777)))

(assert (= (and start!94950 res!714879) b!1072191))

(assert (= (and b!1072191 res!714876) b!1072186))

(assert (= (and b!1072186 res!714878) b!1072189))

(assert (= (and b!1072189 res!714875) b!1072193))

(assert (= (and b!1072193 (not res!714877)) b!1072190))

(assert (= (and b!1072190 res!714880) b!1072192))

(assert (= (and b!1072187 condMapEmpty!40372) mapIsEmpty!40372))

(assert (= (and b!1072187 (not condMapEmpty!40372)) mapNonEmpty!40372))

(get-info :version)

(assert (= (and mapNonEmpty!40372 ((_ is ValueCellFull!12185) mapValue!40372)) b!1072194))

(assert (= (and b!1072187 ((_ is ValueCellFull!12185) mapDefault!40372)) b!1072188))

(assert (= start!94950 b!1072187))

(declare-fun m!990797 () Bool)

(assert (=> b!1072190 m!990797))

(assert (=> b!1072190 m!990797))

(declare-fun m!990799 () Bool)

(assert (=> b!1072190 m!990799))

(declare-fun m!990801 () Bool)

(assert (=> b!1072190 m!990801))

(declare-fun m!990803 () Bool)

(assert (=> b!1072190 m!990803))

(declare-fun m!990805 () Bool)

(assert (=> b!1072190 m!990805))

(assert (=> b!1072190 m!990803))

(declare-fun m!990807 () Bool)

(assert (=> b!1072190 m!990807))

(declare-fun m!990809 () Bool)

(assert (=> start!94950 m!990809))

(declare-fun m!990811 () Bool)

(assert (=> start!94950 m!990811))

(declare-fun m!990813 () Bool)

(assert (=> start!94950 m!990813))

(declare-fun m!990815 () Bool)

(assert (=> b!1072189 m!990815))

(declare-fun m!990817 () Bool)

(assert (=> b!1072193 m!990817))

(declare-fun m!990819 () Bool)

(assert (=> b!1072193 m!990819))

(declare-fun m!990821 () Bool)

(assert (=> b!1072193 m!990821))

(declare-fun m!990823 () Bool)

(assert (=> b!1072186 m!990823))

(declare-fun m!990825 () Bool)

(assert (=> mapNonEmpty!40372 m!990825))

(declare-fun m!990827 () Bool)

(assert (=> b!1072192 m!990827))

(check-sat (not b!1072189) (not b!1072192) (not b_next!21967) (not start!94950) (not b!1072193) (not b!1072186) b_and!34807 (not mapNonEmpty!40372) tp_is_empty!25777 (not b!1072190))
(check-sat b_and!34807 (not b_next!21967))
