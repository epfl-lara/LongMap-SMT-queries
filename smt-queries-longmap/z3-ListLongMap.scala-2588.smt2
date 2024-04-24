; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39332 () Bool)

(assert start!39332)

(declare-fun b_free!9613 () Bool)

(declare-fun b_next!9613 () Bool)

(assert (=> start!39332 (= b_free!9613 (not b_next!9613))))

(declare-fun tp!34368 () Bool)

(declare-fun b_and!17115 () Bool)

(assert (=> start!39332 (= tp!34368 b_and!17115)))

(declare-fun b!417322 () Bool)

(declare-fun res!243054 () Bool)

(declare-fun e!248994 () Bool)

(assert (=> b!417322 (=> (not res!243054) (not e!248994))))

(declare-datatypes ((array!25388 0))(
  ( (array!25389 (arr!12143 (Array (_ BitVec 32) (_ BitVec 64))) (size!12495 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25388)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25388 (_ BitVec 32)) Bool)

(assert (=> b!417322 (= res!243054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun e!248997 () Bool)

(declare-fun b!417323 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((V!15459 0))(
  ( (V!15460 (val!5427 Int)) )
))
(declare-datatypes ((tuple2!6960 0))(
  ( (tuple2!6961 (_1!3491 (_ BitVec 64)) (_2!3491 V!15459)) )
))
(declare-datatypes ((List!6976 0))(
  ( (Nil!6973) (Cons!6972 (h!7828 tuple2!6960) (t!12246 List!6976)) )
))
(declare-datatypes ((ListLongMap!5875 0))(
  ( (ListLongMap!5876 (toList!2953 List!6976)) )
))
(declare-fun call!29004 () ListLongMap!5875)

(declare-fun call!29005 () ListLongMap!5875)

(declare-fun v!412 () V!15459)

(declare-fun +!1223 (ListLongMap!5875 tuple2!6960) ListLongMap!5875)

(assert (=> b!417323 (= e!248997 (= call!29004 (+!1223 call!29005 (tuple2!6961 k0!794 v!412))))))

(declare-fun b!417324 () Bool)

(declare-fun e!249001 () Bool)

(declare-fun e!248995 () Bool)

(assert (=> b!417324 (= e!249001 (not e!248995))))

(declare-fun res!243062 () Bool)

(assert (=> b!417324 (=> res!243062 e!248995)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417324 (= res!243062 (validKeyInArray!0 (select (arr!12143 _keys!709) from!863)))))

(assert (=> b!417324 e!248997))

(declare-fun c!55110 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417324 (= c!55110 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15459)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5039 0))(
  ( (ValueCellFull!5039 (v!7675 V!15459)) (EmptyCell!5039) )
))
(declare-datatypes ((array!25390 0))(
  ( (array!25391 (arr!12144 (Array (_ BitVec 32) ValueCell!5039)) (size!12496 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25390)

(declare-fun zeroValue!515 () V!15459)

(declare-datatypes ((Unit!12319 0))(
  ( (Unit!12320) )
))
(declare-fun lt!191209 () Unit!12319)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!425 (array!25388 array!25390 (_ BitVec 32) (_ BitVec 32) V!15459 V!15459 (_ BitVec 32) (_ BitVec 64) V!15459 (_ BitVec 32) Int) Unit!12319)

(assert (=> b!417324 (= lt!191209 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!425 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17769 () Bool)

(declare-fun mapRes!17769 () Bool)

(assert (=> mapIsEmpty!17769 mapRes!17769))

(declare-fun b!417325 () Bool)

(assert (=> b!417325 (= e!248997 (= call!29005 call!29004))))

(declare-fun b!417326 () Bool)

(declare-fun e!248999 () Bool)

(declare-fun tp_is_empty!10765 () Bool)

(assert (=> b!417326 (= e!248999 tp_is_empty!10765)))

(declare-fun res!243057 () Bool)

(assert (=> start!39332 (=> (not res!243057) (not e!248994))))

(assert (=> start!39332 (= res!243057 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12495 _keys!709))))))

(assert (=> start!39332 e!248994))

(assert (=> start!39332 tp_is_empty!10765))

(assert (=> start!39332 tp!34368))

(assert (=> start!39332 true))

(declare-fun e!249000 () Bool)

(declare-fun array_inv!8932 (array!25390) Bool)

(assert (=> start!39332 (and (array_inv!8932 _values!549) e!249000)))

(declare-fun array_inv!8933 (array!25388) Bool)

(assert (=> start!39332 (array_inv!8933 _keys!709)))

(declare-fun b!417327 () Bool)

(declare-fun res!243065 () Bool)

(assert (=> b!417327 (=> (not res!243065) (not e!248994))))

(declare-datatypes ((List!6977 0))(
  ( (Nil!6974) (Cons!6973 (h!7829 (_ BitVec 64)) (t!12247 List!6977)) )
))
(declare-fun arrayNoDuplicates!0 (array!25388 (_ BitVec 32) List!6977) Bool)

(assert (=> b!417327 (= res!243065 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6974))))

(declare-fun b!417328 () Bool)

(declare-fun res!243064 () Bool)

(assert (=> b!417328 (=> (not res!243064) (not e!248994))))

(declare-fun arrayContainsKey!0 (array!25388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417328 (= res!243064 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417329 () Bool)

(declare-fun res!243066 () Bool)

(assert (=> b!417329 (=> (not res!243066) (not e!248994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417329 (= res!243066 (validMask!0 mask!1025))))

(declare-fun lt!191208 () array!25390)

(declare-fun lt!191215 () array!25388)

(declare-fun bm!29001 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1199 (array!25388 array!25390 (_ BitVec 32) (_ BitVec 32) V!15459 V!15459 (_ BitVec 32) Int) ListLongMap!5875)

(assert (=> bm!29001 (= call!29005 (getCurrentListMapNoExtraKeys!1199 (ite c!55110 _keys!709 lt!191215) (ite c!55110 _values!549 lt!191208) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417330 () Bool)

(declare-fun res!243059 () Bool)

(assert (=> b!417330 (=> (not res!243059) (not e!248994))))

(assert (=> b!417330 (= res!243059 (or (= (select (arr!12143 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12143 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417331 () Bool)

(assert (=> b!417331 (= e!248995 true)))

(declare-fun lt!191210 () ListLongMap!5875)

(declare-fun lt!191212 () V!15459)

(declare-fun lt!191213 () tuple2!6960)

(assert (=> b!417331 (= (+!1223 lt!191210 lt!191213) (+!1223 (+!1223 lt!191210 (tuple2!6961 k0!794 lt!191212)) lt!191213))))

(declare-fun lt!191211 () V!15459)

(assert (=> b!417331 (= lt!191213 (tuple2!6961 k0!794 lt!191211))))

(declare-fun lt!191207 () Unit!12319)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!15 (ListLongMap!5875 (_ BitVec 64) V!15459 V!15459) Unit!12319)

(assert (=> b!417331 (= lt!191207 (addSameAsAddTwiceSameKeyDiffValues!15 lt!191210 k0!794 lt!191212 lt!191211))))

(declare-fun lt!191214 () V!15459)

(declare-fun get!6007 (ValueCell!5039 V!15459) V!15459)

(assert (=> b!417331 (= lt!191212 (get!6007 (select (arr!12144 _values!549) from!863) lt!191214))))

(declare-fun lt!191216 () ListLongMap!5875)

(assert (=> b!417331 (= lt!191216 (+!1223 lt!191210 (tuple2!6961 (select (arr!12143 lt!191215) from!863) lt!191211)))))

(assert (=> b!417331 (= lt!191211 (get!6007 (select (store (arr!12144 _values!549) i!563 (ValueCellFull!5039 v!412)) from!863) lt!191214))))

(declare-fun dynLambda!682 (Int (_ BitVec 64)) V!15459)

(assert (=> b!417331 (= lt!191214 (dynLambda!682 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417331 (= lt!191210 (getCurrentListMapNoExtraKeys!1199 lt!191215 lt!191208 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417332 () Bool)

(declare-fun res!243053 () Bool)

(declare-fun e!248998 () Bool)

(assert (=> b!417332 (=> (not res!243053) (not e!248998))))

(assert (=> b!417332 (= res!243053 (bvsle from!863 i!563))))

(declare-fun b!417333 () Bool)

(assert (=> b!417333 (= e!249000 (and e!248999 mapRes!17769))))

(declare-fun condMapEmpty!17769 () Bool)

(declare-fun mapDefault!17769 () ValueCell!5039)

(assert (=> b!417333 (= condMapEmpty!17769 (= (arr!12144 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5039)) mapDefault!17769)))))

(declare-fun b!417334 () Bool)

(declare-fun res!243063 () Bool)

(assert (=> b!417334 (=> (not res!243063) (not e!248994))))

(assert (=> b!417334 (= res!243063 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12495 _keys!709))))))

(declare-fun bm!29002 () Bool)

(assert (=> bm!29002 (= call!29004 (getCurrentListMapNoExtraKeys!1199 (ite c!55110 lt!191215 _keys!709) (ite c!55110 lt!191208 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417335 () Bool)

(declare-fun e!248993 () Bool)

(assert (=> b!417335 (= e!248993 tp_is_empty!10765)))

(declare-fun b!417336 () Bool)

(assert (=> b!417336 (= e!248998 e!249001)))

(declare-fun res!243056 () Bool)

(assert (=> b!417336 (=> (not res!243056) (not e!249001))))

(assert (=> b!417336 (= res!243056 (= from!863 i!563))))

(assert (=> b!417336 (= lt!191216 (getCurrentListMapNoExtraKeys!1199 lt!191215 lt!191208 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417336 (= lt!191208 (array!25391 (store (arr!12144 _values!549) i!563 (ValueCellFull!5039 v!412)) (size!12496 _values!549)))))

(declare-fun lt!191217 () ListLongMap!5875)

(assert (=> b!417336 (= lt!191217 (getCurrentListMapNoExtraKeys!1199 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417337 () Bool)

(declare-fun res!243060 () Bool)

(assert (=> b!417337 (=> (not res!243060) (not e!248994))))

(assert (=> b!417337 (= res!243060 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17769 () Bool)

(declare-fun tp!34367 () Bool)

(assert (=> mapNonEmpty!17769 (= mapRes!17769 (and tp!34367 e!248993))))

(declare-fun mapValue!17769 () ValueCell!5039)

(declare-fun mapRest!17769 () (Array (_ BitVec 32) ValueCell!5039))

(declare-fun mapKey!17769 () (_ BitVec 32))

(assert (=> mapNonEmpty!17769 (= (arr!12144 _values!549) (store mapRest!17769 mapKey!17769 mapValue!17769))))

(declare-fun b!417338 () Bool)

(assert (=> b!417338 (= e!248994 e!248998)))

(declare-fun res!243061 () Bool)

(assert (=> b!417338 (=> (not res!243061) (not e!248998))))

(assert (=> b!417338 (= res!243061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191215 mask!1025))))

(assert (=> b!417338 (= lt!191215 (array!25389 (store (arr!12143 _keys!709) i!563 k0!794) (size!12495 _keys!709)))))

(declare-fun b!417339 () Bool)

(declare-fun res!243058 () Bool)

(assert (=> b!417339 (=> (not res!243058) (not e!248998))))

(assert (=> b!417339 (= res!243058 (arrayNoDuplicates!0 lt!191215 #b00000000000000000000000000000000 Nil!6974))))

(declare-fun b!417340 () Bool)

(declare-fun res!243055 () Bool)

(assert (=> b!417340 (=> (not res!243055) (not e!248994))))

(assert (=> b!417340 (= res!243055 (and (= (size!12496 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12495 _keys!709) (size!12496 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39332 res!243057) b!417329))

(assert (= (and b!417329 res!243066) b!417340))

(assert (= (and b!417340 res!243055) b!417322))

(assert (= (and b!417322 res!243054) b!417327))

(assert (= (and b!417327 res!243065) b!417334))

(assert (= (and b!417334 res!243063) b!417337))

(assert (= (and b!417337 res!243060) b!417330))

(assert (= (and b!417330 res!243059) b!417328))

(assert (= (and b!417328 res!243064) b!417338))

(assert (= (and b!417338 res!243061) b!417339))

(assert (= (and b!417339 res!243058) b!417332))

(assert (= (and b!417332 res!243053) b!417336))

(assert (= (and b!417336 res!243056) b!417324))

(assert (= (and b!417324 c!55110) b!417323))

(assert (= (and b!417324 (not c!55110)) b!417325))

(assert (= (or b!417323 b!417325) bm!29002))

(assert (= (or b!417323 b!417325) bm!29001))

(assert (= (and b!417324 (not res!243062)) b!417331))

(assert (= (and b!417333 condMapEmpty!17769) mapIsEmpty!17769))

(assert (= (and b!417333 (not condMapEmpty!17769)) mapNonEmpty!17769))

(get-info :version)

(assert (= (and mapNonEmpty!17769 ((_ is ValueCellFull!5039) mapValue!17769)) b!417335))

(assert (= (and b!417333 ((_ is ValueCellFull!5039) mapDefault!17769)) b!417326))

(assert (= start!39332 b!417333))

(declare-fun b_lambda!8939 () Bool)

(assert (=> (not b_lambda!8939) (not b!417331)))

(declare-fun t!12245 () Bool)

(declare-fun tb!3227 () Bool)

(assert (=> (and start!39332 (= defaultEntry!557 defaultEntry!557) t!12245) tb!3227))

(declare-fun result!5989 () Bool)

(assert (=> tb!3227 (= result!5989 tp_is_empty!10765)))

(assert (=> b!417331 t!12245))

(declare-fun b_and!17117 () Bool)

(assert (= b_and!17115 (and (=> t!12245 result!5989) b_and!17117)))

(declare-fun m!406859 () Bool)

(assert (=> b!417329 m!406859))

(declare-fun m!406861 () Bool)

(assert (=> start!39332 m!406861))

(declare-fun m!406863 () Bool)

(assert (=> start!39332 m!406863))

(declare-fun m!406865 () Bool)

(assert (=> b!417336 m!406865))

(declare-fun m!406867 () Bool)

(assert (=> b!417336 m!406867))

(declare-fun m!406869 () Bool)

(assert (=> b!417336 m!406869))

(declare-fun m!406871 () Bool)

(assert (=> b!417339 m!406871))

(declare-fun m!406873 () Bool)

(assert (=> bm!29002 m!406873))

(declare-fun m!406875 () Bool)

(assert (=> b!417337 m!406875))

(declare-fun m!406877 () Bool)

(assert (=> b!417323 m!406877))

(declare-fun m!406879 () Bool)

(assert (=> b!417330 m!406879))

(declare-fun m!406881 () Bool)

(assert (=> b!417322 m!406881))

(declare-fun m!406883 () Bool)

(assert (=> bm!29001 m!406883))

(declare-fun m!406885 () Bool)

(assert (=> mapNonEmpty!17769 m!406885))

(declare-fun m!406887 () Bool)

(assert (=> b!417327 m!406887))

(declare-fun m!406889 () Bool)

(assert (=> b!417324 m!406889))

(assert (=> b!417324 m!406889))

(declare-fun m!406891 () Bool)

(assert (=> b!417324 m!406891))

(declare-fun m!406893 () Bool)

(assert (=> b!417324 m!406893))

(declare-fun m!406895 () Bool)

(assert (=> b!417338 m!406895))

(declare-fun m!406897 () Bool)

(assert (=> b!417338 m!406897))

(declare-fun m!406899 () Bool)

(assert (=> b!417328 m!406899))

(declare-fun m!406901 () Bool)

(assert (=> b!417331 m!406901))

(declare-fun m!406903 () Bool)

(assert (=> b!417331 m!406903))

(declare-fun m!406905 () Bool)

(assert (=> b!417331 m!406905))

(declare-fun m!406907 () Bool)

(assert (=> b!417331 m!406907))

(declare-fun m!406909 () Bool)

(assert (=> b!417331 m!406909))

(declare-fun m!406911 () Bool)

(assert (=> b!417331 m!406911))

(declare-fun m!406913 () Bool)

(assert (=> b!417331 m!406913))

(assert (=> b!417331 m!406867))

(declare-fun m!406915 () Bool)

(assert (=> b!417331 m!406915))

(assert (=> b!417331 m!406901))

(declare-fun m!406917 () Bool)

(assert (=> b!417331 m!406917))

(assert (=> b!417331 m!406905))

(declare-fun m!406919 () Bool)

(assert (=> b!417331 m!406919))

(declare-fun m!406921 () Bool)

(assert (=> b!417331 m!406921))

(assert (=> b!417331 m!406909))

(declare-fun m!406923 () Bool)

(assert (=> b!417331 m!406923))

(check-sat (not b!417323) (not bm!29002) (not mapNonEmpty!17769) (not b!417322) (not b!417331) (not b!417324) (not b!417336) (not b!417327) (not bm!29001) (not b_lambda!8939) (not b_next!9613) (not b!417339) (not b!417338) b_and!17117 tp_is_empty!10765 (not b!417329) (not b!417337) (not start!39332) (not b!417328))
(check-sat b_and!17117 (not b_next!9613))
