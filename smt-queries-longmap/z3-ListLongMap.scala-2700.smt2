; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40004 () Bool)

(assert start!40004)

(declare-fun b_free!10285 () Bool)

(declare-fun b_next!10285 () Bool)

(assert (=> start!40004 (= b_free!10285 (not b_next!10285))))

(declare-fun tp!36384 () Bool)

(declare-fun b_and!18243 () Bool)

(assert (=> start!40004 (= tp!36384 b_and!18243)))

(declare-fun b!435987 () Bool)

(declare-fun res!256990 () Bool)

(declare-fun e!257501 () Bool)

(assert (=> b!435987 (=> (not res!256990) (not e!257501))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435987 (= res!256990 (validKeyInArray!0 k0!794))))

(declare-fun b!435988 () Bool)

(declare-datatypes ((Unit!12949 0))(
  ( (Unit!12950) )
))
(declare-fun e!257509 () Unit!12949)

(declare-fun Unit!12951 () Unit!12949)

(assert (=> b!435988 (= e!257509 Unit!12951)))

(declare-fun b!435989 () Bool)

(declare-fun e!257505 () Bool)

(assert (=> b!435989 (= e!257505 true)))

(declare-datatypes ((V!16355 0))(
  ( (V!16356 (val!5763 Int)) )
))
(declare-datatypes ((tuple2!7534 0))(
  ( (tuple2!7535 (_1!3778 (_ BitVec 64)) (_2!3778 V!16355)) )
))
(declare-fun lt!200945 () tuple2!7534)

(declare-datatypes ((List!7524 0))(
  ( (Nil!7521) (Cons!7520 (h!8376 tuple2!7534) (t!13250 List!7524)) )
))
(declare-datatypes ((ListLongMap!6449 0))(
  ( (ListLongMap!6450 (toList!3240 List!7524)) )
))
(declare-fun lt!200946 () ListLongMap!6449)

(declare-fun lt!200937 () tuple2!7534)

(declare-fun lt!200936 () ListLongMap!6449)

(declare-fun +!1444 (ListLongMap!6449 tuple2!7534) ListLongMap!6449)

(assert (=> b!435989 (= lt!200936 (+!1444 (+!1444 lt!200946 lt!200945) lt!200937))))

(declare-datatypes ((array!26700 0))(
  ( (array!26701 (arr!12799 (Array (_ BitVec 32) (_ BitVec 64))) (size!13151 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26700)

(declare-fun lt!200943 () Unit!12949)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!200948 () V!16355)

(declare-fun v!412 () V!16355)

(declare-fun addCommutativeForDiffKeys!411 (ListLongMap!6449 (_ BitVec 64) V!16355 (_ BitVec 64) V!16355) Unit!12949)

(assert (=> b!435989 (= lt!200943 (addCommutativeForDiffKeys!411 lt!200946 k0!794 v!412 (select (arr!12799 _keys!709) from!863) lt!200948))))

(declare-fun b!435990 () Bool)

(declare-fun res!256992 () Bool)

(assert (=> b!435990 (=> (not res!256992) (not e!257501))))

(declare-fun arrayContainsKey!0 (array!26700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435990 (= res!256992 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435991 () Bool)

(declare-fun res!256978 () Bool)

(declare-fun e!257506 () Bool)

(assert (=> b!435991 (=> (not res!256978) (not e!257506))))

(declare-fun lt!200938 () array!26700)

(declare-datatypes ((List!7525 0))(
  ( (Nil!7522) (Cons!7521 (h!8377 (_ BitVec 64)) (t!13251 List!7525)) )
))
(declare-fun arrayNoDuplicates!0 (array!26700 (_ BitVec 32) List!7525) Bool)

(assert (=> b!435991 (= res!256978 (arrayNoDuplicates!0 lt!200938 #b00000000000000000000000000000000 Nil!7522))))

(declare-fun b!435992 () Bool)

(declare-fun e!257507 () Bool)

(assert (=> b!435992 (= e!257507 e!257505)))

(declare-fun res!256984 () Bool)

(assert (=> b!435992 (=> res!256984 e!257505)))

(assert (=> b!435992 (= res!256984 (= k0!794 (select (arr!12799 _keys!709) from!863)))))

(assert (=> b!435992 (not (= (select (arr!12799 _keys!709) from!863) k0!794))))

(declare-fun lt!200941 () Unit!12949)

(assert (=> b!435992 (= lt!200941 e!257509)))

(declare-fun c!55740 () Bool)

(assert (=> b!435992 (= c!55740 (= (select (arr!12799 _keys!709) from!863) k0!794))))

(declare-fun lt!200949 () ListLongMap!6449)

(assert (=> b!435992 (= lt!200949 lt!200936)))

(declare-fun lt!200935 () ListLongMap!6449)

(assert (=> b!435992 (= lt!200936 (+!1444 lt!200935 lt!200945))))

(assert (=> b!435992 (= lt!200945 (tuple2!7535 (select (arr!12799 _keys!709) from!863) lt!200948))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5375 0))(
  ( (ValueCellFull!5375 (v!8011 V!16355)) (EmptyCell!5375) )
))
(declare-datatypes ((array!26702 0))(
  ( (array!26703 (arr!12800 (Array (_ BitVec 32) ValueCell!5375)) (size!13152 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26702)

(declare-fun get!6392 (ValueCell!5375 V!16355) V!16355)

(declare-fun dynLambda!843 (Int (_ BitVec 64)) V!16355)

(assert (=> b!435992 (= lt!200948 (get!6392 (select (arr!12800 _values!549) from!863) (dynLambda!843 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435993 () Bool)

(declare-fun res!256988 () Bool)

(assert (=> b!435993 (=> (not res!256988) (not e!257501))))

(assert (=> b!435993 (= res!256988 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7522))))

(declare-fun b!435994 () Bool)

(declare-fun e!257508 () Bool)

(declare-fun tp_is_empty!11437 () Bool)

(assert (=> b!435994 (= e!257508 tp_is_empty!11437)))

(declare-fun b!435995 () Bool)

(declare-fun res!256981 () Bool)

(assert (=> b!435995 (=> (not res!256981) (not e!257506))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435995 (= res!256981 (bvsle from!863 i!563))))

(declare-fun b!435996 () Bool)

(declare-fun res!256986 () Bool)

(assert (=> b!435996 (=> (not res!256986) (not e!257501))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435996 (= res!256986 (validMask!0 mask!1025))))

(declare-fun b!435997 () Bool)

(declare-fun res!256987 () Bool)

(assert (=> b!435997 (=> (not res!256987) (not e!257501))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!435997 (= res!256987 (and (= (size!13152 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13151 _keys!709) (size!13152 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435998 () Bool)

(declare-fun e!257500 () Bool)

(assert (=> b!435998 (= e!257500 tp_is_empty!11437)))

(declare-fun b!435999 () Bool)

(declare-fun res!256982 () Bool)

(assert (=> b!435999 (=> (not res!256982) (not e!257501))))

(assert (=> b!435999 (= res!256982 (or (= (select (arr!12799 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12799 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!256979 () Bool)

(assert (=> start!40004 (=> (not res!256979) (not e!257501))))

(assert (=> start!40004 (= res!256979 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13151 _keys!709))))))

(assert (=> start!40004 e!257501))

(assert (=> start!40004 tp_is_empty!11437))

(assert (=> start!40004 tp!36384))

(assert (=> start!40004 true))

(declare-fun e!257504 () Bool)

(declare-fun array_inv!9364 (array!26702) Bool)

(assert (=> start!40004 (and (array_inv!9364 _values!549) e!257504)))

(declare-fun array_inv!9365 (array!26700) Bool)

(assert (=> start!40004 (array_inv!9365 _keys!709)))

(declare-fun b!436000 () Bool)

(declare-fun Unit!12952 () Unit!12949)

(assert (=> b!436000 (= e!257509 Unit!12952)))

(declare-fun lt!200939 () Unit!12949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12949)

(assert (=> b!436000 (= lt!200939 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436000 false))

(declare-fun mapIsEmpty!18777 () Bool)

(declare-fun mapRes!18777 () Bool)

(assert (=> mapIsEmpty!18777 mapRes!18777))

(declare-fun b!436001 () Bool)

(declare-fun res!256980 () Bool)

(assert (=> b!436001 (=> (not res!256980) (not e!257501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26700 (_ BitVec 32)) Bool)

(assert (=> b!436001 (= res!256980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18777 () Bool)

(declare-fun tp!36383 () Bool)

(assert (=> mapNonEmpty!18777 (= mapRes!18777 (and tp!36383 e!257500))))

(declare-fun mapRest!18777 () (Array (_ BitVec 32) ValueCell!5375))

(declare-fun mapValue!18777 () ValueCell!5375)

(declare-fun mapKey!18777 () (_ BitVec 32))

(assert (=> mapNonEmpty!18777 (= (arr!12800 _values!549) (store mapRest!18777 mapKey!18777 mapValue!18777))))

(declare-fun b!436002 () Bool)

(declare-fun res!256983 () Bool)

(assert (=> b!436002 (=> (not res!256983) (not e!257501))))

(assert (=> b!436002 (= res!256983 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13151 _keys!709))))))

(declare-fun b!436003 () Bool)

(declare-fun e!257503 () Bool)

(assert (=> b!436003 (= e!257506 e!257503)))

(declare-fun res!256989 () Bool)

(assert (=> b!436003 (=> (not res!256989) (not e!257503))))

(assert (=> b!436003 (= res!256989 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200947 () array!26702)

(declare-fun zeroValue!515 () V!16355)

(declare-fun minValue!515 () V!16355)

(declare-fun getCurrentListMapNoExtraKeys!1474 (array!26700 array!26702 (_ BitVec 32) (_ BitVec 32) V!16355 V!16355 (_ BitVec 32) Int) ListLongMap!6449)

(assert (=> b!436003 (= lt!200949 (getCurrentListMapNoExtraKeys!1474 lt!200938 lt!200947 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436003 (= lt!200947 (array!26703 (store (arr!12800 _values!549) i!563 (ValueCellFull!5375 v!412)) (size!13152 _values!549)))))

(declare-fun lt!200942 () ListLongMap!6449)

(assert (=> b!436003 (= lt!200942 (getCurrentListMapNoExtraKeys!1474 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436004 () Bool)

(assert (=> b!436004 (= e!257504 (and e!257508 mapRes!18777))))

(declare-fun condMapEmpty!18777 () Bool)

(declare-fun mapDefault!18777 () ValueCell!5375)

(assert (=> b!436004 (= condMapEmpty!18777 (= (arr!12800 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5375)) mapDefault!18777)))))

(declare-fun b!436005 () Bool)

(assert (=> b!436005 (= e!257501 e!257506)))

(declare-fun res!256991 () Bool)

(assert (=> b!436005 (=> (not res!256991) (not e!257506))))

(assert (=> b!436005 (= res!256991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200938 mask!1025))))

(assert (=> b!436005 (= lt!200938 (array!26701 (store (arr!12799 _keys!709) i!563 k0!794) (size!13151 _keys!709)))))

(declare-fun b!436006 () Bool)

(assert (=> b!436006 (= e!257503 (not e!257507))))

(declare-fun res!256985 () Bool)

(assert (=> b!436006 (=> res!256985 e!257507)))

(assert (=> b!436006 (= res!256985 (not (validKeyInArray!0 (select (arr!12799 _keys!709) from!863))))))

(declare-fun lt!200944 () ListLongMap!6449)

(assert (=> b!436006 (= lt!200944 lt!200935)))

(assert (=> b!436006 (= lt!200935 (+!1444 lt!200946 lt!200937))))

(assert (=> b!436006 (= lt!200944 (getCurrentListMapNoExtraKeys!1474 lt!200938 lt!200947 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436006 (= lt!200937 (tuple2!7535 k0!794 v!412))))

(assert (=> b!436006 (= lt!200946 (getCurrentListMapNoExtraKeys!1474 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200940 () Unit!12949)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!606 (array!26700 array!26702 (_ BitVec 32) (_ BitVec 32) V!16355 V!16355 (_ BitVec 32) (_ BitVec 64) V!16355 (_ BitVec 32) Int) Unit!12949)

(assert (=> b!436006 (= lt!200940 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!606 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40004 res!256979) b!435996))

(assert (= (and b!435996 res!256986) b!435997))

(assert (= (and b!435997 res!256987) b!436001))

(assert (= (and b!436001 res!256980) b!435993))

(assert (= (and b!435993 res!256988) b!436002))

(assert (= (and b!436002 res!256983) b!435987))

(assert (= (and b!435987 res!256990) b!435999))

(assert (= (and b!435999 res!256982) b!435990))

(assert (= (and b!435990 res!256992) b!436005))

(assert (= (and b!436005 res!256991) b!435991))

(assert (= (and b!435991 res!256978) b!435995))

(assert (= (and b!435995 res!256981) b!436003))

(assert (= (and b!436003 res!256989) b!436006))

(assert (= (and b!436006 (not res!256985)) b!435992))

(assert (= (and b!435992 c!55740) b!436000))

(assert (= (and b!435992 (not c!55740)) b!435988))

(assert (= (and b!435992 (not res!256984)) b!435989))

(assert (= (and b!436004 condMapEmpty!18777) mapIsEmpty!18777))

(assert (= (and b!436004 (not condMapEmpty!18777)) mapNonEmpty!18777))

(get-info :version)

(assert (= (and mapNonEmpty!18777 ((_ is ValueCellFull!5375) mapValue!18777)) b!435998))

(assert (= (and b!436004 ((_ is ValueCellFull!5375) mapDefault!18777)) b!435994))

(assert (= start!40004 b!436004))

(declare-fun b_lambda!9395 () Bool)

(assert (=> (not b_lambda!9395) (not b!435992)))

(declare-fun t!13249 () Bool)

(declare-fun tb!3683 () Bool)

(assert (=> (and start!40004 (= defaultEntry!557 defaultEntry!557) t!13249) tb!3683))

(declare-fun result!6901 () Bool)

(assert (=> tb!3683 (= result!6901 tp_is_empty!11437)))

(assert (=> b!435992 t!13249))

(declare-fun b_and!18245 () Bool)

(assert (= b_and!18243 (and (=> t!13249 result!6901) b_and!18245)))

(declare-fun m!424103 () Bool)

(assert (=> b!436000 m!424103))

(declare-fun m!424105 () Bool)

(assert (=> start!40004 m!424105))

(declare-fun m!424107 () Bool)

(assert (=> start!40004 m!424107))

(declare-fun m!424109 () Bool)

(assert (=> b!435992 m!424109))

(declare-fun m!424111 () Bool)

(assert (=> b!435992 m!424111))

(declare-fun m!424113 () Bool)

(assert (=> b!435992 m!424113))

(declare-fun m!424115 () Bool)

(assert (=> b!435992 m!424115))

(assert (=> b!435992 m!424113))

(assert (=> b!435992 m!424111))

(declare-fun m!424117 () Bool)

(assert (=> b!435992 m!424117))

(assert (=> b!436006 m!424109))

(declare-fun m!424119 () Bool)

(assert (=> b!436006 m!424119))

(declare-fun m!424121 () Bool)

(assert (=> b!436006 m!424121))

(declare-fun m!424123 () Bool)

(assert (=> b!436006 m!424123))

(assert (=> b!436006 m!424109))

(declare-fun m!424125 () Bool)

(assert (=> b!436006 m!424125))

(declare-fun m!424127 () Bool)

(assert (=> b!436006 m!424127))

(declare-fun m!424129 () Bool)

(assert (=> b!436003 m!424129))

(declare-fun m!424131 () Bool)

(assert (=> b!436003 m!424131))

(declare-fun m!424133 () Bool)

(assert (=> b!436003 m!424133))

(declare-fun m!424135 () Bool)

(assert (=> b!435990 m!424135))

(declare-fun m!424137 () Bool)

(assert (=> b!435993 m!424137))

(declare-fun m!424139 () Bool)

(assert (=> mapNonEmpty!18777 m!424139))

(declare-fun m!424141 () Bool)

(assert (=> b!435987 m!424141))

(declare-fun m!424143 () Bool)

(assert (=> b!436005 m!424143))

(declare-fun m!424145 () Bool)

(assert (=> b!436005 m!424145))

(declare-fun m!424147 () Bool)

(assert (=> b!435991 m!424147))

(declare-fun m!424149 () Bool)

(assert (=> b!436001 m!424149))

(declare-fun m!424151 () Bool)

(assert (=> b!435989 m!424151))

(assert (=> b!435989 m!424151))

(declare-fun m!424153 () Bool)

(assert (=> b!435989 m!424153))

(assert (=> b!435989 m!424109))

(assert (=> b!435989 m!424109))

(declare-fun m!424155 () Bool)

(assert (=> b!435989 m!424155))

(declare-fun m!424157 () Bool)

(assert (=> b!435996 m!424157))

(declare-fun m!424159 () Bool)

(assert (=> b!435999 m!424159))

(check-sat (not b!435993) (not b!435990) (not b!436003) (not b!435996) (not start!40004) (not b!436005) (not b_lambda!9395) b_and!18245 (not b!435991) (not b!435987) (not b!436000) (not mapNonEmpty!18777) (not b!435989) tp_is_empty!11437 (not b_next!10285) (not b!436006) (not b!435992) (not b!436001))
(check-sat b_and!18245 (not b_next!10285))
