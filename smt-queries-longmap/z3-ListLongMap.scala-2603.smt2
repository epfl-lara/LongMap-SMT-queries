; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39422 () Bool)

(assert start!39422)

(declare-fun b_free!9703 () Bool)

(declare-fun b_next!9703 () Bool)

(assert (=> start!39422 (= b_free!9703 (not b_next!9703))))

(declare-fun tp!34638 () Bool)

(declare-fun b_and!17295 () Bool)

(assert (=> start!39422 (= tp!34638 b_and!17295)))

(declare-fun b!419977 () Bool)

(declare-fun res!244956 () Bool)

(declare-fun e!250213 () Bool)

(assert (=> b!419977 (=> (not res!244956) (not e!250213))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419977 (= res!244956 (validKeyInArray!0 k0!794))))

(declare-fun b!419978 () Bool)

(declare-fun res!244951 () Bool)

(assert (=> b!419978 (=> (not res!244951) (not e!250213))))

(declare-datatypes ((array!25566 0))(
  ( (array!25567 (arr!12232 (Array (_ BitVec 32) (_ BitVec 64))) (size!12584 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25566)

(declare-fun arrayContainsKey!0 (array!25566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419978 (= res!244951 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419979 () Bool)

(declare-fun res!244949 () Bool)

(assert (=> b!419979 (=> (not res!244949) (not e!250213))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25566 (_ BitVec 32)) Bool)

(assert (=> b!419979 (= res!244949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419980 () Bool)

(declare-fun res!244946 () Bool)

(assert (=> b!419980 (=> (not res!244946) (not e!250213))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419980 (= res!244946 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12584 _keys!709))))))

(declare-fun b!419981 () Bool)

(declare-fun res!244944 () Bool)

(assert (=> b!419981 (=> (not res!244944) (not e!250213))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15579 0))(
  ( (V!15580 (val!5472 Int)) )
))
(declare-datatypes ((ValueCell!5084 0))(
  ( (ValueCellFull!5084 (v!7720 V!15579)) (EmptyCell!5084) )
))
(declare-datatypes ((array!25568 0))(
  ( (array!25569 (arr!12233 (Array (_ BitVec 32) ValueCell!5084)) (size!12585 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25568)

(assert (=> b!419981 (= res!244944 (and (= (size!12585 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12584 _keys!709) (size!12585 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419982 () Bool)

(declare-fun res!244950 () Bool)

(assert (=> b!419982 (=> (not res!244950) (not e!250213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419982 (= res!244950 (validMask!0 mask!1025))))

(declare-fun b!419983 () Bool)

(declare-fun res!244945 () Bool)

(declare-fun e!250214 () Bool)

(assert (=> b!419983 (=> (not res!244945) (not e!250214))))

(declare-fun lt!192696 () array!25566)

(declare-datatypes ((List!7055 0))(
  ( (Nil!7052) (Cons!7051 (h!7907 (_ BitVec 64)) (t!12415 List!7055)) )
))
(declare-fun arrayNoDuplicates!0 (array!25566 (_ BitVec 32) List!7055) Bool)

(assert (=> b!419983 (= res!244945 (arrayNoDuplicates!0 lt!192696 #b00000000000000000000000000000000 Nil!7052))))

(declare-fun b!419984 () Bool)

(declare-fun e!250216 () Bool)

(declare-fun e!250208 () Bool)

(assert (=> b!419984 (= e!250216 (not e!250208))))

(declare-fun res!244943 () Bool)

(assert (=> b!419984 (=> res!244943 e!250208)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!419984 (= res!244943 (validKeyInArray!0 (select (arr!12232 _keys!709) from!863)))))

(declare-fun e!250211 () Bool)

(assert (=> b!419984 e!250211))

(declare-fun c!55245 () Bool)

(assert (=> b!419984 (= c!55245 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15579)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15579)

(declare-fun v!412 () V!15579)

(declare-datatypes ((Unit!12393 0))(
  ( (Unit!12394) )
))
(declare-fun lt!192693 () Unit!12393)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!451 (array!25566 array!25568 (_ BitVec 32) (_ BitVec 32) V!15579 V!15579 (_ BitVec 32) (_ BitVec 64) V!15579 (_ BitVec 32) Int) Unit!12393)

(assert (=> b!419984 (= lt!192693 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419985 () Bool)

(assert (=> b!419985 (= e!250213 e!250214)))

(declare-fun res!244953 () Bool)

(assert (=> b!419985 (=> (not res!244953) (not e!250214))))

(assert (=> b!419985 (= res!244953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192696 mask!1025))))

(assert (=> b!419985 (= lt!192696 (array!25567 (store (arr!12232 _keys!709) i!563 k0!794) (size!12584 _keys!709)))))

(declare-fun b!419986 () Bool)

(declare-fun res!244952 () Bool)

(assert (=> b!419986 (=> (not res!244952) (not e!250214))))

(assert (=> b!419986 (= res!244952 (bvsle from!863 i!563))))

(declare-fun b!419987 () Bool)

(declare-fun res!244947 () Bool)

(assert (=> b!419987 (=> (not res!244947) (not e!250213))))

(assert (=> b!419987 (= res!244947 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7052))))

(declare-fun b!419988 () Bool)

(declare-fun e!250210 () Bool)

(declare-fun tp_is_empty!10855 () Bool)

(assert (=> b!419988 (= e!250210 tp_is_empty!10855)))

(declare-fun b!419989 () Bool)

(declare-fun res!244954 () Bool)

(assert (=> b!419989 (=> (not res!244954) (not e!250213))))

(assert (=> b!419989 (= res!244954 (or (= (select (arr!12232 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12232 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419990 () Bool)

(assert (=> b!419990 (= e!250208 true)))

(declare-datatypes ((tuple2!7046 0))(
  ( (tuple2!7047 (_1!3534 (_ BitVec 64)) (_2!3534 V!15579)) )
))
(declare-datatypes ((List!7056 0))(
  ( (Nil!7053) (Cons!7052 (h!7908 tuple2!7046) (t!12416 List!7056)) )
))
(declare-datatypes ((ListLongMap!5961 0))(
  ( (ListLongMap!5962 (toList!2996 List!7056)) )
))
(declare-fun lt!192697 () ListLongMap!5961)

(declare-fun lt!192692 () tuple2!7046)

(declare-fun lt!192699 () V!15579)

(declare-fun +!1260 (ListLongMap!5961 tuple2!7046) ListLongMap!5961)

(assert (=> b!419990 (= (+!1260 lt!192697 lt!192692) (+!1260 (+!1260 lt!192697 (tuple2!7047 k0!794 lt!192699)) lt!192692))))

(declare-fun lt!192695 () V!15579)

(assert (=> b!419990 (= lt!192692 (tuple2!7047 k0!794 lt!192695))))

(declare-fun lt!192698 () Unit!12393)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!50 (ListLongMap!5961 (_ BitVec 64) V!15579 V!15579) Unit!12393)

(assert (=> b!419990 (= lt!192698 (addSameAsAddTwiceSameKeyDiffValues!50 lt!192697 k0!794 lt!192699 lt!192695))))

(declare-fun lt!192702 () V!15579)

(declare-fun get!6072 (ValueCell!5084 V!15579) V!15579)

(assert (=> b!419990 (= lt!192699 (get!6072 (select (arr!12233 _values!549) from!863) lt!192702))))

(declare-fun lt!192701 () ListLongMap!5961)

(assert (=> b!419990 (= lt!192701 (+!1260 lt!192697 (tuple2!7047 (select (arr!12232 lt!192696) from!863) lt!192695)))))

(assert (=> b!419990 (= lt!192695 (get!6072 (select (store (arr!12233 _values!549) i!563 (ValueCellFull!5084 v!412)) from!863) lt!192702))))

(declare-fun dynLambda!717 (Int (_ BitVec 64)) V!15579)

(assert (=> b!419990 (= lt!192702 (dynLambda!717 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!192694 () array!25568)

(declare-fun getCurrentListMapNoExtraKeys!1242 (array!25566 array!25568 (_ BitVec 32) (_ BitVec 32) V!15579 V!15579 (_ BitVec 32) Int) ListLongMap!5961)

(assert (=> b!419990 (= lt!192697 (getCurrentListMapNoExtraKeys!1242 lt!192696 lt!192694 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29275 () ListLongMap!5961)

(declare-fun bm!29271 () Bool)

(assert (=> bm!29271 (= call!29275 (getCurrentListMapNoExtraKeys!1242 (ite c!55245 _keys!709 lt!192696) (ite c!55245 _values!549 lt!192694) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17904 () Bool)

(declare-fun mapRes!17904 () Bool)

(declare-fun tp!34637 () Bool)

(assert (=> mapNonEmpty!17904 (= mapRes!17904 (and tp!34637 e!250210))))

(declare-fun mapValue!17904 () ValueCell!5084)

(declare-fun mapKey!17904 () (_ BitVec 32))

(declare-fun mapRest!17904 () (Array (_ BitVec 32) ValueCell!5084))

(assert (=> mapNonEmpty!17904 (= (arr!12233 _values!549) (store mapRest!17904 mapKey!17904 mapValue!17904))))

(declare-fun mapIsEmpty!17904 () Bool)

(assert (=> mapIsEmpty!17904 mapRes!17904))

(declare-fun res!244948 () Bool)

(assert (=> start!39422 (=> (not res!244948) (not e!250213))))

(assert (=> start!39422 (= res!244948 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12584 _keys!709))))))

(assert (=> start!39422 e!250213))

(assert (=> start!39422 tp_is_empty!10855))

(assert (=> start!39422 tp!34638))

(assert (=> start!39422 true))

(declare-fun e!250212 () Bool)

(declare-fun array_inv!8990 (array!25568) Bool)

(assert (=> start!39422 (and (array_inv!8990 _values!549) e!250212)))

(declare-fun array_inv!8991 (array!25566) Bool)

(assert (=> start!39422 (array_inv!8991 _keys!709)))

(declare-fun b!419991 () Bool)

(assert (=> b!419991 (= e!250214 e!250216)))

(declare-fun res!244955 () Bool)

(assert (=> b!419991 (=> (not res!244955) (not e!250216))))

(assert (=> b!419991 (= res!244955 (= from!863 i!563))))

(assert (=> b!419991 (= lt!192701 (getCurrentListMapNoExtraKeys!1242 lt!192696 lt!192694 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419991 (= lt!192694 (array!25569 (store (arr!12233 _values!549) i!563 (ValueCellFull!5084 v!412)) (size!12585 _values!549)))))

(declare-fun lt!192700 () ListLongMap!5961)

(assert (=> b!419991 (= lt!192700 (getCurrentListMapNoExtraKeys!1242 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29272 () Bool)

(declare-fun call!29274 () ListLongMap!5961)

(assert (=> bm!29272 (= call!29274 (getCurrentListMapNoExtraKeys!1242 (ite c!55245 lt!192696 _keys!709) (ite c!55245 lt!192694 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419992 () Bool)

(assert (=> b!419992 (= e!250211 (= call!29275 call!29274))))

(declare-fun b!419993 () Bool)

(declare-fun e!250209 () Bool)

(assert (=> b!419993 (= e!250212 (and e!250209 mapRes!17904))))

(declare-fun condMapEmpty!17904 () Bool)

(declare-fun mapDefault!17904 () ValueCell!5084)

(assert (=> b!419993 (= condMapEmpty!17904 (= (arr!12233 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5084)) mapDefault!17904)))))

(declare-fun b!419994 () Bool)

(assert (=> b!419994 (= e!250211 (= call!29274 (+!1260 call!29275 (tuple2!7047 k0!794 v!412))))))

(declare-fun b!419995 () Bool)

(assert (=> b!419995 (= e!250209 tp_is_empty!10855)))

(assert (= (and start!39422 res!244948) b!419982))

(assert (= (and b!419982 res!244950) b!419981))

(assert (= (and b!419981 res!244944) b!419979))

(assert (= (and b!419979 res!244949) b!419987))

(assert (= (and b!419987 res!244947) b!419980))

(assert (= (and b!419980 res!244946) b!419977))

(assert (= (and b!419977 res!244956) b!419989))

(assert (= (and b!419989 res!244954) b!419978))

(assert (= (and b!419978 res!244951) b!419985))

(assert (= (and b!419985 res!244953) b!419983))

(assert (= (and b!419983 res!244945) b!419986))

(assert (= (and b!419986 res!244952) b!419991))

(assert (= (and b!419991 res!244955) b!419984))

(assert (= (and b!419984 c!55245) b!419994))

(assert (= (and b!419984 (not c!55245)) b!419992))

(assert (= (or b!419994 b!419992) bm!29272))

(assert (= (or b!419994 b!419992) bm!29271))

(assert (= (and b!419984 (not res!244943)) b!419990))

(assert (= (and b!419993 condMapEmpty!17904) mapIsEmpty!17904))

(assert (= (and b!419993 (not condMapEmpty!17904)) mapNonEmpty!17904))

(get-info :version)

(assert (= (and mapNonEmpty!17904 ((_ is ValueCellFull!5084) mapValue!17904)) b!419988))

(assert (= (and b!419993 ((_ is ValueCellFull!5084) mapDefault!17904)) b!419995))

(assert (= start!39422 b!419993))

(declare-fun b_lambda!9029 () Bool)

(assert (=> (not b_lambda!9029) (not b!419990)))

(declare-fun t!12414 () Bool)

(declare-fun tb!3317 () Bool)

(assert (=> (and start!39422 (= defaultEntry!557 defaultEntry!557) t!12414) tb!3317))

(declare-fun result!6169 () Bool)

(assert (=> tb!3317 (= result!6169 tp_is_empty!10855)))

(assert (=> b!419990 t!12414))

(declare-fun b_and!17297 () Bool)

(assert (= b_and!17295 (and (=> t!12414 result!6169) b_and!17297)))

(declare-fun m!409819 () Bool)

(assert (=> b!419985 m!409819))

(declare-fun m!409821 () Bool)

(assert (=> b!419985 m!409821))

(declare-fun m!409823 () Bool)

(assert (=> b!419990 m!409823))

(declare-fun m!409825 () Bool)

(assert (=> b!419990 m!409825))

(declare-fun m!409827 () Bool)

(assert (=> b!419990 m!409827))

(declare-fun m!409829 () Bool)

(assert (=> b!419990 m!409829))

(declare-fun m!409831 () Bool)

(assert (=> b!419990 m!409831))

(declare-fun m!409833 () Bool)

(assert (=> b!419990 m!409833))

(declare-fun m!409835 () Bool)

(assert (=> b!419990 m!409835))

(assert (=> b!419990 m!409823))

(declare-fun m!409837 () Bool)

(assert (=> b!419990 m!409837))

(assert (=> b!419990 m!409833))

(declare-fun m!409839 () Bool)

(assert (=> b!419990 m!409839))

(declare-fun m!409841 () Bool)

(assert (=> b!419990 m!409841))

(declare-fun m!409843 () Bool)

(assert (=> b!419990 m!409843))

(declare-fun m!409845 () Bool)

(assert (=> b!419990 m!409845))

(assert (=> b!419990 m!409841))

(declare-fun m!409847 () Bool)

(assert (=> b!419990 m!409847))

(declare-fun m!409849 () Bool)

(assert (=> b!419978 m!409849))

(declare-fun m!409851 () Bool)

(assert (=> b!419984 m!409851))

(assert (=> b!419984 m!409851))

(declare-fun m!409853 () Bool)

(assert (=> b!419984 m!409853))

(declare-fun m!409855 () Bool)

(assert (=> b!419984 m!409855))

(declare-fun m!409857 () Bool)

(assert (=> b!419979 m!409857))

(declare-fun m!409859 () Bool)

(assert (=> b!419983 m!409859))

(declare-fun m!409861 () Bool)

(assert (=> b!419989 m!409861))

(declare-fun m!409863 () Bool)

(assert (=> bm!29271 m!409863))

(declare-fun m!409865 () Bool)

(assert (=> start!39422 m!409865))

(declare-fun m!409867 () Bool)

(assert (=> start!39422 m!409867))

(declare-fun m!409869 () Bool)

(assert (=> b!419991 m!409869))

(assert (=> b!419991 m!409845))

(declare-fun m!409871 () Bool)

(assert (=> b!419991 m!409871))

(declare-fun m!409873 () Bool)

(assert (=> b!419977 m!409873))

(declare-fun m!409875 () Bool)

(assert (=> mapNonEmpty!17904 m!409875))

(declare-fun m!409877 () Bool)

(assert (=> b!419994 m!409877))

(declare-fun m!409879 () Bool)

(assert (=> b!419987 m!409879))

(declare-fun m!409881 () Bool)

(assert (=> bm!29272 m!409881))

(declare-fun m!409883 () Bool)

(assert (=> b!419982 m!409883))

(check-sat (not start!39422) (not mapNonEmpty!17904) (not b!419984) (not b!419979) (not b!419994) b_and!17297 (not b!419991) (not b!419978) (not b_lambda!9029) (not b!419977) (not b_next!9703) (not b!419987) (not b!419985) (not bm!29272) tp_is_empty!10855 (not b!419983) (not bm!29271) (not b!419982) (not b!419990))
(check-sat b_and!17297 (not b_next!9703))
