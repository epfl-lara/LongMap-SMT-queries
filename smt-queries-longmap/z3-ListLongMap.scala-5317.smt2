; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71144 () Bool)

(assert start!71144)

(declare-fun b_free!13311 () Bool)

(declare-fun b_next!13311 () Bool)

(assert (=> start!71144 (= b_free!13311 (not b_next!13311))))

(declare-fun tp!46693 () Bool)

(declare-fun b_and!22237 () Bool)

(assert (=> start!71144 (= tp!46693 b_and!22237)))

(declare-fun b!826334 () Bool)

(declare-fun res!563289 () Bool)

(declare-fun e!460123 () Bool)

(assert (=> b!826334 (=> (not res!563289) (not e!460123))))

(declare-datatypes ((array!46224 0))(
  ( (array!46225 (arr!22157 (Array (_ BitVec 32) (_ BitVec 64))) (size!22578 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46224)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25029 0))(
  ( (V!25030 (val!7558 Int)) )
))
(declare-datatypes ((ValueCell!7095 0))(
  ( (ValueCellFull!7095 (v!9992 V!25029)) (EmptyCell!7095) )
))
(declare-datatypes ((array!46226 0))(
  ( (array!46227 (arr!22158 (Array (_ BitVec 32) ValueCell!7095)) (size!22579 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46226)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826334 (= res!563289 (and (= (size!22579 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22578 _keys!976) (size!22579 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826335 () Bool)

(declare-datatypes ((tuple2!10012 0))(
  ( (tuple2!10013 (_1!5017 (_ BitVec 64)) (_2!5017 V!25029)) )
))
(declare-datatypes ((List!15811 0))(
  ( (Nil!15808) (Cons!15807 (h!16936 tuple2!10012) (t!22158 List!15811)) )
))
(declare-datatypes ((ListLongMap!8835 0))(
  ( (ListLongMap!8836 (toList!4433 List!15811)) )
))
(declare-fun lt!373817 () ListLongMap!8835)

(declare-fun lt!373828 () ListLongMap!8835)

(declare-fun zeroValueAfter!34 () V!25029)

(declare-fun e!460118 () Bool)

(declare-fun lt!373819 () tuple2!10012)

(declare-fun +!1940 (ListLongMap!8835 tuple2!10012) ListLongMap!8835)

(assert (=> b!826335 (= e!460118 (= lt!373817 (+!1940 (+!1940 lt!373828 (tuple2!10013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373819)))))

(declare-fun b!826336 () Bool)

(declare-fun e!460120 () Bool)

(declare-fun tp_is_empty!15021 () Bool)

(assert (=> b!826336 (= e!460120 tp_is_empty!15021)))

(declare-fun mapIsEmpty!24157 () Bool)

(declare-fun mapRes!24157 () Bool)

(assert (=> mapIsEmpty!24157 mapRes!24157))

(declare-fun e!460116 () Bool)

(declare-fun b!826337 () Bool)

(declare-fun lt!373821 () tuple2!10012)

(assert (=> b!826337 (= e!460116 (= lt!373817 (+!1940 (+!1940 lt!373828 lt!373819) lt!373821)))))

(declare-fun b!826338 () Bool)

(declare-fun res!563284 () Bool)

(assert (=> b!826338 (=> (not res!563284) (not e!460123))))

(declare-datatypes ((List!15812 0))(
  ( (Nil!15809) (Cons!15808 (h!16937 (_ BitVec 64)) (t!22159 List!15812)) )
))
(declare-fun arrayNoDuplicates!0 (array!46224 (_ BitVec 32) List!15812) Bool)

(assert (=> b!826338 (= res!563284 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15809))))

(declare-fun b!826339 () Bool)

(declare-fun e!460122 () Bool)

(assert (=> b!826339 (= e!460122 tp_is_empty!15021)))

(declare-fun res!563286 () Bool)

(assert (=> start!71144 (=> (not res!563286) (not e!460123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71144 (= res!563286 (validMask!0 mask!1312))))

(assert (=> start!71144 e!460123))

(assert (=> start!71144 tp_is_empty!15021))

(declare-fun array_inv!17661 (array!46224) Bool)

(assert (=> start!71144 (array_inv!17661 _keys!976)))

(assert (=> start!71144 true))

(declare-fun e!460121 () Bool)

(declare-fun array_inv!17662 (array!46226) Bool)

(assert (=> start!71144 (and (array_inv!17662 _values!788) e!460121)))

(assert (=> start!71144 tp!46693))

(declare-fun b!826340 () Bool)

(declare-fun res!563283 () Bool)

(assert (=> b!826340 (=> (not res!563283) (not e!460123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46224 (_ BitVec 32)) Bool)

(assert (=> b!826340 (= res!563283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826341 () Bool)

(declare-fun e!460117 () Bool)

(assert (=> b!826341 (= e!460123 (not e!460117))))

(declare-fun res!563288 () Bool)

(assert (=> b!826341 (=> res!563288 e!460117)))

(assert (=> b!826341 (= res!563288 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373820 () ListLongMap!8835)

(assert (=> b!826341 (= lt!373820 lt!373828)))

(declare-fun zeroValueBefore!34 () V!25029)

(declare-datatypes ((Unit!28329 0))(
  ( (Unit!28330) )
))
(declare-fun lt!373816 () Unit!28329)

(declare-fun minValue!754 () V!25029)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!550 (array!46224 array!46226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25029 V!25029 V!25029 V!25029 (_ BitVec 32) Int) Unit!28329)

(assert (=> b!826341 (= lt!373816 (lemmaNoChangeToArrayThenSameMapNoExtras!550 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2440 (array!46224 array!46226 (_ BitVec 32) (_ BitVec 32) V!25029 V!25029 (_ BitVec 32) Int) ListLongMap!8835)

(assert (=> b!826341 (= lt!373828 (getCurrentListMapNoExtraKeys!2440 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826341 (= lt!373820 (getCurrentListMapNoExtraKeys!2440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24157 () Bool)

(declare-fun tp!46692 () Bool)

(assert (=> mapNonEmpty!24157 (= mapRes!24157 (and tp!46692 e!460120))))

(declare-fun mapValue!24157 () ValueCell!7095)

(declare-fun mapKey!24157 () (_ BitVec 32))

(declare-fun mapRest!24157 () (Array (_ BitVec 32) ValueCell!7095))

(assert (=> mapNonEmpty!24157 (= (arr!22158 _values!788) (store mapRest!24157 mapKey!24157 mapValue!24157))))

(declare-fun b!826342 () Bool)

(assert (=> b!826342 (= e!460117 true)))

(declare-fun lt!373824 () ListLongMap!8835)

(assert (=> b!826342 (= lt!373824 (+!1940 (+!1940 lt!373820 lt!373821) lt!373819))))

(declare-fun lt!373827 () ListLongMap!8835)

(declare-fun lt!373818 () ListLongMap!8835)

(assert (=> b!826342 (and (= lt!373827 lt!373818) (= lt!373817 lt!373818) (= lt!373817 lt!373827))))

(declare-fun lt!373823 () ListLongMap!8835)

(assert (=> b!826342 (= lt!373818 (+!1940 lt!373823 lt!373821))))

(declare-fun lt!373815 () ListLongMap!8835)

(assert (=> b!826342 (= lt!373827 (+!1940 lt!373815 lt!373821))))

(declare-fun lt!373822 () Unit!28329)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!223 (ListLongMap!8835 (_ BitVec 64) V!25029 V!25029) Unit!28329)

(assert (=> b!826342 (= lt!373822 (addSameAsAddTwiceSameKeyDiffValues!223 lt!373815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826342 e!460116))

(declare-fun res!563287 () Bool)

(assert (=> b!826342 (=> (not res!563287) (not e!460116))))

(declare-fun lt!373825 () ListLongMap!8835)

(assert (=> b!826342 (= res!563287 (= lt!373825 lt!373823))))

(declare-fun lt!373826 () tuple2!10012)

(assert (=> b!826342 (= lt!373823 (+!1940 lt!373815 lt!373826))))

(assert (=> b!826342 (= lt!373815 (+!1940 lt!373820 lt!373819))))

(assert (=> b!826342 (= lt!373821 (tuple2!10013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826342 e!460118))

(declare-fun res!563285 () Bool)

(assert (=> b!826342 (=> (not res!563285) (not e!460118))))

(assert (=> b!826342 (= res!563285 (= lt!373825 (+!1940 (+!1940 lt!373820 lt!373826) lt!373819)))))

(assert (=> b!826342 (= lt!373819 (tuple2!10013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826342 (= lt!373826 (tuple2!10013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2563 (array!46224 array!46226 (_ BitVec 32) (_ BitVec 32) V!25029 V!25029 (_ BitVec 32) Int) ListLongMap!8835)

(assert (=> b!826342 (= lt!373817 (getCurrentListMap!2563 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826342 (= lt!373825 (getCurrentListMap!2563 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826343 () Bool)

(assert (=> b!826343 (= e!460121 (and e!460122 mapRes!24157))))

(declare-fun condMapEmpty!24157 () Bool)

(declare-fun mapDefault!24157 () ValueCell!7095)

(assert (=> b!826343 (= condMapEmpty!24157 (= (arr!22158 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7095)) mapDefault!24157)))))

(assert (= (and start!71144 res!563286) b!826334))

(assert (= (and b!826334 res!563289) b!826340))

(assert (= (and b!826340 res!563283) b!826338))

(assert (= (and b!826338 res!563284) b!826341))

(assert (= (and b!826341 (not res!563288)) b!826342))

(assert (= (and b!826342 res!563285) b!826335))

(assert (= (and b!826342 res!563287) b!826337))

(assert (= (and b!826343 condMapEmpty!24157) mapIsEmpty!24157))

(assert (= (and b!826343 (not condMapEmpty!24157)) mapNonEmpty!24157))

(get-info :version)

(assert (= (and mapNonEmpty!24157 ((_ is ValueCellFull!7095) mapValue!24157)) b!826336))

(assert (= (and b!826343 ((_ is ValueCellFull!7095) mapDefault!24157)) b!826339))

(assert (= start!71144 b!826343))

(declare-fun m!769011 () Bool)

(assert (=> b!826337 m!769011))

(assert (=> b!826337 m!769011))

(declare-fun m!769013 () Bool)

(assert (=> b!826337 m!769013))

(declare-fun m!769015 () Bool)

(assert (=> start!71144 m!769015))

(declare-fun m!769017 () Bool)

(assert (=> start!71144 m!769017))

(declare-fun m!769019 () Bool)

(assert (=> start!71144 m!769019))

(declare-fun m!769021 () Bool)

(assert (=> b!826342 m!769021))

(declare-fun m!769023 () Bool)

(assert (=> b!826342 m!769023))

(declare-fun m!769025 () Bool)

(assert (=> b!826342 m!769025))

(declare-fun m!769027 () Bool)

(assert (=> b!826342 m!769027))

(declare-fun m!769029 () Bool)

(assert (=> b!826342 m!769029))

(assert (=> b!826342 m!769025))

(declare-fun m!769031 () Bool)

(assert (=> b!826342 m!769031))

(declare-fun m!769033 () Bool)

(assert (=> b!826342 m!769033))

(declare-fun m!769035 () Bool)

(assert (=> b!826342 m!769035))

(declare-fun m!769037 () Bool)

(assert (=> b!826342 m!769037))

(assert (=> b!826342 m!769021))

(declare-fun m!769039 () Bool)

(assert (=> b!826342 m!769039))

(declare-fun m!769041 () Bool)

(assert (=> b!826342 m!769041))

(declare-fun m!769043 () Bool)

(assert (=> b!826338 m!769043))

(declare-fun m!769045 () Bool)

(assert (=> mapNonEmpty!24157 m!769045))

(declare-fun m!769047 () Bool)

(assert (=> b!826335 m!769047))

(assert (=> b!826335 m!769047))

(declare-fun m!769049 () Bool)

(assert (=> b!826335 m!769049))

(declare-fun m!769051 () Bool)

(assert (=> b!826340 m!769051))

(declare-fun m!769053 () Bool)

(assert (=> b!826341 m!769053))

(declare-fun m!769055 () Bool)

(assert (=> b!826341 m!769055))

(declare-fun m!769057 () Bool)

(assert (=> b!826341 m!769057))

(check-sat (not b!826337) (not start!71144) (not b!826342) (not b!826340) (not b!826341) (not b!826338) (not b_next!13311) tp_is_empty!15021 (not b!826335) b_and!22237 (not mapNonEmpty!24157))
(check-sat b_and!22237 (not b_next!13311))
