; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1116 () Bool)

(assert start!1116)

(declare-fun b_free!387 () Bool)

(declare-fun b_next!387 () Bool)

(assert (=> start!1116 (= b_free!387 (not b_next!387))))

(declare-fun tp!1405 () Bool)

(declare-fun b_and!543 () Bool)

(assert (=> start!1116 (= tp!1405 b_and!543)))

(declare-fun b!9864 () Bool)

(declare-fun res!8724 () Bool)

(declare-fun e!5658 () Bool)

(assert (=> b!9864 (=> (not res!8724) (not e!5658))))

(declare-datatypes ((array!863 0))(
  ( (array!864 (arr!415 (Array (_ BitVec 32) (_ BitVec 64))) (size!477 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!863)

(declare-datatypes ((List!290 0))(
  ( (Nil!287) (Cons!286 (h!852 (_ BitVec 64)) (t!2435 List!290)) )
))
(declare-fun arrayNoDuplicates!0 (array!863 (_ BitVec 32) List!290) Bool)

(assert (=> b!9864 (= res!8724 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!287))))

(declare-fun b!9865 () Bool)

(declare-fun res!8726 () Bool)

(assert (=> b!9865 (=> (not res!8726) (not e!5658))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!797 0))(
  ( (V!798 (val!238 Int)) )
))
(declare-datatypes ((ValueCell!216 0))(
  ( (ValueCellFull!216 (v!1334 V!797)) (EmptyCell!216) )
))
(declare-datatypes ((array!865 0))(
  ( (array!866 (arr!416 (Array (_ BitVec 32) ValueCell!216)) (size!478 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!865)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9865 (= res!8726 (and (= (size!478 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!477 _keys!1806) (size!478 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!683 () Bool)

(declare-fun mapRes!683 () Bool)

(assert (=> mapIsEmpty!683 mapRes!683))

(declare-fun b!9866 () Bool)

(declare-fun res!8719 () Bool)

(assert (=> b!9866 (=> (not res!8719) (not e!5658))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!797)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!797)

(declare-datatypes ((tuple2!278 0))(
  ( (tuple2!279 (_1!139 (_ BitVec 64)) (_2!139 V!797)) )
))
(declare-datatypes ((List!291 0))(
  ( (Nil!288) (Cons!287 (h!853 tuple2!278) (t!2436 List!291)) )
))
(declare-datatypes ((ListLongMap!283 0))(
  ( (ListLongMap!284 (toList!157 List!291)) )
))
(declare-fun contains!136 (ListLongMap!283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!116 (array!863 array!865 (_ BitVec 32) (_ BitVec 32) V!797 V!797 (_ BitVec 32) Int) ListLongMap!283)

(assert (=> b!9866 (= res!8719 (contains!136 (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9867 () Bool)

(declare-fun res!8718 () Bool)

(assert (=> b!9867 (=> (not res!8718) (not e!5658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9867 (= res!8718 (validKeyInArray!0 k0!1278))))

(declare-fun b!9868 () Bool)

(declare-datatypes ((SeekEntryResult!38 0))(
  ( (MissingZero!38 (index!2271 (_ BitVec 32))) (Found!38 (index!2272 (_ BitVec 32))) (Intermediate!38 (undefined!850 Bool) (index!2273 (_ BitVec 32)) (x!2818 (_ BitVec 32))) (Undefined!38) (MissingVacant!38 (index!2274 (_ BitVec 32))) )
))
(declare-fun lt!2330 () SeekEntryResult!38)

(declare-fun e!5660 () Bool)

(assert (=> b!9868 (= e!5660 (= (select (arr!415 _keys!1806) (index!2272 lt!2330)) k0!1278))))

(declare-fun res!8722 () Bool)

(assert (=> start!1116 (=> (not res!8722) (not e!5658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1116 (= res!8722 (validMask!0 mask!2250))))

(assert (=> start!1116 e!5658))

(assert (=> start!1116 tp!1405))

(assert (=> start!1116 true))

(declare-fun e!5659 () Bool)

(declare-fun array_inv!299 (array!865) Bool)

(assert (=> start!1116 (and (array_inv!299 _values!1492) e!5659)))

(declare-fun tp_is_empty!465 () Bool)

(assert (=> start!1116 tp_is_empty!465))

(declare-fun array_inv!300 (array!863) Bool)

(assert (=> start!1116 (array_inv!300 _keys!1806)))

(declare-fun b!9869 () Bool)

(declare-fun e!5653 () Bool)

(declare-fun arrayContainsKey!0 (array!863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9869 (= e!5653 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9870 () Bool)

(declare-fun e!5652 () Bool)

(assert (=> b!9870 (= e!5652 tp_is_empty!465)))

(declare-fun b!9871 () Bool)

(declare-fun e!5656 () Bool)

(assert (=> b!9871 (= e!5656 e!5660)))

(declare-fun res!8723 () Bool)

(assert (=> b!9871 (=> (not res!8723) (not e!5660))))

(get-info :version)

(assert (=> b!9871 (= res!8723 ((_ is Found!38) lt!2330))))

(declare-fun lt!2334 () (_ BitVec 32))

(assert (=> b!9871 (and ((_ is Found!38) lt!2330) (= (index!2272 lt!2330) lt!2334))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!863 (_ BitVec 32)) SeekEntryResult!38)

(assert (=> b!9871 (= lt!2330 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!201 0))(
  ( (Unit!202) )
))
(declare-fun lt!2331 () Unit!201)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!863 (_ BitVec 32)) Unit!201)

(assert (=> b!9871 (= lt!2331 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2334 _keys!1806 mask!2250))))

(declare-fun b!9872 () Bool)

(declare-fun res!8717 () Bool)

(assert (=> b!9872 (=> (not res!8717) (not e!5658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!863 (_ BitVec 32)) Bool)

(assert (=> b!9872 (= res!8717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9873 () Bool)

(declare-fun res!8721 () Bool)

(assert (=> b!9873 (=> (not res!8721) (not e!5660))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9873 (= res!8721 (inRange!0 (index!2272 lt!2330) mask!2250))))

(declare-fun mapNonEmpty!683 () Bool)

(declare-fun tp!1406 () Bool)

(declare-fun e!5657 () Bool)

(assert (=> mapNonEmpty!683 (= mapRes!683 (and tp!1406 e!5657))))

(declare-fun mapKey!683 () (_ BitVec 32))

(declare-fun mapRest!683 () (Array (_ BitVec 32) ValueCell!216))

(declare-fun mapValue!683 () ValueCell!216)

(assert (=> mapNonEmpty!683 (= (arr!416 _values!1492) (store mapRest!683 mapKey!683 mapValue!683))))

(declare-fun b!9874 () Bool)

(assert (=> b!9874 (= e!5653 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9875 () Bool)

(assert (=> b!9875 (= e!5659 (and e!5652 mapRes!683))))

(declare-fun condMapEmpty!683 () Bool)

(declare-fun mapDefault!683 () ValueCell!216)

(assert (=> b!9875 (= condMapEmpty!683 (= (arr!416 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!216)) mapDefault!683)))))

(declare-fun b!9876 () Bool)

(declare-fun e!5654 () Bool)

(assert (=> b!9876 (= e!5658 (not e!5654))))

(declare-fun res!8716 () Bool)

(assert (=> b!9876 (=> res!8716 e!5654)))

(assert (=> b!9876 (= res!8716 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9876 e!5653))

(declare-fun c!823 () Bool)

(assert (=> b!9876 (= c!823 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2332 () Unit!201)

(declare-fun lemmaKeyInListMapIsInArray!75 (array!863 array!865 (_ BitVec 32) (_ BitVec 32) V!797 V!797 (_ BitVec 64) Int) Unit!201)

(assert (=> b!9876 (= lt!2332 (lemmaKeyInListMapIsInArray!75 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9877 () Bool)

(assert (=> b!9877 (= e!5657 tp_is_empty!465)))

(declare-fun b!9878 () Bool)

(assert (=> b!9878 (= e!5654 e!5656)))

(declare-fun res!8720 () Bool)

(assert (=> b!9878 (=> res!8720 e!5656)))

(assert (=> b!9878 (= res!8720 (not (= (size!477 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!9878 (arrayForallSeekEntryOrOpenFound!0 lt!2334 _keys!1806 mask!2250)))

(declare-fun lt!2333 () Unit!201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!201)

(assert (=> b!9878 (= lt!2333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2334))))

(declare-fun arrayScanForKey!0 (array!863 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9878 (= lt!2334 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9879 () Bool)

(declare-fun res!8725 () Bool)

(assert (=> b!9879 (=> res!8725 e!5656)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!863 (_ BitVec 32)) SeekEntryResult!38)

(assert (=> b!9879 (= res!8725 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!38 lt!2334))))))

(assert (= (and start!1116 res!8722) b!9865))

(assert (= (and b!9865 res!8726) b!9872))

(assert (= (and b!9872 res!8717) b!9864))

(assert (= (and b!9864 res!8724) b!9866))

(assert (= (and b!9866 res!8719) b!9867))

(assert (= (and b!9867 res!8718) b!9876))

(assert (= (and b!9876 c!823) b!9869))

(assert (= (and b!9876 (not c!823)) b!9874))

(assert (= (and b!9876 (not res!8716)) b!9878))

(assert (= (and b!9878 (not res!8720)) b!9879))

(assert (= (and b!9879 (not res!8725)) b!9871))

(assert (= (and b!9871 res!8723) b!9873))

(assert (= (and b!9873 res!8721) b!9868))

(assert (= (and b!9875 condMapEmpty!683) mapIsEmpty!683))

(assert (= (and b!9875 (not condMapEmpty!683)) mapNonEmpty!683))

(assert (= (and mapNonEmpty!683 ((_ is ValueCellFull!216) mapValue!683)) b!9877))

(assert (= (and b!9875 ((_ is ValueCellFull!216) mapDefault!683)) b!9870))

(assert (= start!1116 b!9875))

(declare-fun m!6249 () Bool)

(assert (=> b!9879 m!6249))

(declare-fun m!6251 () Bool)

(assert (=> b!9871 m!6251))

(declare-fun m!6253 () Bool)

(assert (=> b!9871 m!6253))

(declare-fun m!6255 () Bool)

(assert (=> b!9878 m!6255))

(declare-fun m!6257 () Bool)

(assert (=> b!9878 m!6257))

(declare-fun m!6259 () Bool)

(assert (=> b!9878 m!6259))

(declare-fun m!6261 () Bool)

(assert (=> mapNonEmpty!683 m!6261))

(declare-fun m!6263 () Bool)

(assert (=> b!9868 m!6263))

(declare-fun m!6265 () Bool)

(assert (=> b!9873 m!6265))

(declare-fun m!6267 () Bool)

(assert (=> b!9866 m!6267))

(assert (=> b!9866 m!6267))

(declare-fun m!6269 () Bool)

(assert (=> b!9866 m!6269))

(declare-fun m!6271 () Bool)

(assert (=> b!9872 m!6271))

(declare-fun m!6273 () Bool)

(assert (=> start!1116 m!6273))

(declare-fun m!6275 () Bool)

(assert (=> start!1116 m!6275))

(declare-fun m!6277 () Bool)

(assert (=> start!1116 m!6277))

(declare-fun m!6279 () Bool)

(assert (=> b!9867 m!6279))

(declare-fun m!6281 () Bool)

(assert (=> b!9876 m!6281))

(declare-fun m!6283 () Bool)

(assert (=> b!9876 m!6283))

(assert (=> b!9869 m!6281))

(declare-fun m!6285 () Bool)

(assert (=> b!9864 m!6285))

(check-sat (not b!9873) (not b!9864) b_and!543 (not b!9871) (not mapNonEmpty!683) (not start!1116) (not b!9879) (not b_next!387) (not b!9867) (not b!9869) tp_is_empty!465 (not b!9878) (not b!9866) (not b!9872) (not b!9876))
(check-sat b_and!543 (not b_next!387))
(get-model)

(declare-fun d!961 () Bool)

(assert (=> d!961 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9867 d!961))

(declare-fun d!963 () Bool)

(declare-fun res!8764 () Bool)

(declare-fun e!5692 () Bool)

(assert (=> d!963 (=> res!8764 e!5692)))

(assert (=> d!963 (= res!8764 (= (select (arr!415 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!963 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!5692)))

(declare-fun b!9932 () Bool)

(declare-fun e!5693 () Bool)

(assert (=> b!9932 (= e!5692 e!5693)))

(declare-fun res!8765 () Bool)

(assert (=> b!9932 (=> (not res!8765) (not e!5693))))

(assert (=> b!9932 (= res!8765 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!477 _keys!1806)))))

(declare-fun b!9933 () Bool)

(assert (=> b!9933 (= e!5693 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!963 (not res!8764)) b!9932))

(assert (= (and b!9932 res!8765) b!9933))

(declare-fun m!6325 () Bool)

(assert (=> d!963 m!6325))

(declare-fun m!6327 () Bool)

(assert (=> b!9933 m!6327))

(assert (=> b!9876 d!963))

(declare-fun d!965 () Bool)

(declare-fun e!5696 () Bool)

(assert (=> d!965 e!5696))

(declare-fun c!829 () Bool)

(assert (=> d!965 (= c!829 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2352 () Unit!201)

(declare-fun choose!143 (array!863 array!865 (_ BitVec 32) (_ BitVec 32) V!797 V!797 (_ BitVec 64) Int) Unit!201)

(assert (=> d!965 (= lt!2352 (choose!143 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!965 (validMask!0 mask!2250)))

(assert (=> d!965 (= (lemmaKeyInListMapIsInArray!75 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!2352)))

(declare-fun b!9938 () Bool)

(assert (=> b!9938 (= e!5696 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9939 () Bool)

(assert (=> b!9939 (= e!5696 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!965 c!829) b!9938))

(assert (= (and d!965 (not c!829)) b!9939))

(declare-fun m!6329 () Bool)

(assert (=> d!965 m!6329))

(assert (=> d!965 m!6273))

(assert (=> b!9938 m!6281))

(assert (=> b!9876 d!965))

(declare-fun b!9948 () Bool)

(declare-fun e!5703 () Bool)

(declare-fun e!5704 () Bool)

(assert (=> b!9948 (= e!5703 e!5704)))

(declare-fun c!832 () Bool)

(assert (=> b!9948 (= c!832 (validKeyInArray!0 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9949 () Bool)

(declare-fun call!295 () Bool)

(assert (=> b!9949 (= e!5704 call!295)))

(declare-fun b!9950 () Bool)

(declare-fun e!5705 () Bool)

(assert (=> b!9950 (= e!5705 call!295)))

(declare-fun bm!292 () Bool)

(assert (=> bm!292 (= call!295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9951 () Bool)

(assert (=> b!9951 (= e!5704 e!5705)))

(declare-fun lt!2359 () (_ BitVec 64))

(assert (=> b!9951 (= lt!2359 (select (arr!415 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2360 () Unit!201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!863 (_ BitVec 64) (_ BitVec 32)) Unit!201)

(assert (=> b!9951 (= lt!2360 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2359 #b00000000000000000000000000000000))))

(assert (=> b!9951 (arrayContainsKey!0 _keys!1806 lt!2359 #b00000000000000000000000000000000)))

(declare-fun lt!2361 () Unit!201)

(assert (=> b!9951 (= lt!2361 lt!2360)))

(declare-fun res!8770 () Bool)

(assert (=> b!9951 (= res!8770 (= (seekEntryOrOpen!0 (select (arr!415 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!38 #b00000000000000000000000000000000)))))

(assert (=> b!9951 (=> (not res!8770) (not e!5705))))

(declare-fun d!967 () Bool)

(declare-fun res!8771 () Bool)

(assert (=> d!967 (=> res!8771 e!5703)))

(assert (=> d!967 (= res!8771 (bvsge #b00000000000000000000000000000000 (size!477 _keys!1806)))))

(assert (=> d!967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!5703)))

(assert (= (and d!967 (not res!8771)) b!9948))

(assert (= (and b!9948 c!832) b!9951))

(assert (= (and b!9948 (not c!832)) b!9949))

(assert (= (and b!9951 res!8770) b!9950))

(assert (= (or b!9950 b!9949) bm!292))

(assert (=> b!9948 m!6325))

(assert (=> b!9948 m!6325))

(declare-fun m!6331 () Bool)

(assert (=> b!9948 m!6331))

(declare-fun m!6333 () Bool)

(assert (=> bm!292 m!6333))

(assert (=> b!9951 m!6325))

(declare-fun m!6335 () Bool)

(assert (=> b!9951 m!6335))

(declare-fun m!6337 () Bool)

(assert (=> b!9951 m!6337))

(assert (=> b!9951 m!6325))

(declare-fun m!6339 () Bool)

(assert (=> b!9951 m!6339))

(assert (=> b!9872 d!967))

(declare-fun b!9962 () Bool)

(declare-fun e!5717 () Bool)

(declare-fun e!5716 () Bool)

(assert (=> b!9962 (= e!5717 e!5716)))

(declare-fun res!8778 () Bool)

(assert (=> b!9962 (=> (not res!8778) (not e!5716))))

(declare-fun e!5714 () Bool)

(assert (=> b!9962 (= res!8778 (not e!5714))))

(declare-fun res!8780 () Bool)

(assert (=> b!9962 (=> (not res!8780) (not e!5714))))

(assert (=> b!9962 (= res!8780 (validKeyInArray!0 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9963 () Bool)

(declare-fun contains!137 (List!290 (_ BitVec 64)) Bool)

(assert (=> b!9963 (= e!5714 (contains!137 Nil!287 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9964 () Bool)

(declare-fun e!5715 () Bool)

(declare-fun call!298 () Bool)

(assert (=> b!9964 (= e!5715 call!298)))

(declare-fun b!9965 () Bool)

(assert (=> b!9965 (= e!5715 call!298)))

(declare-fun d!969 () Bool)

(declare-fun res!8779 () Bool)

(assert (=> d!969 (=> res!8779 e!5717)))

(assert (=> d!969 (= res!8779 (bvsge #b00000000000000000000000000000000 (size!477 _keys!1806)))))

(assert (=> d!969 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!287) e!5717)))

(declare-fun b!9966 () Bool)

(assert (=> b!9966 (= e!5716 e!5715)))

(declare-fun c!835 () Bool)

(assert (=> b!9966 (= c!835 (validKeyInArray!0 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!295 () Bool)

(assert (=> bm!295 (= call!298 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!835 (Cons!286 (select (arr!415 _keys!1806) #b00000000000000000000000000000000) Nil!287) Nil!287)))))

(assert (= (and d!969 (not res!8779)) b!9962))

(assert (= (and b!9962 res!8780) b!9963))

(assert (= (and b!9962 res!8778) b!9966))

(assert (= (and b!9966 c!835) b!9965))

(assert (= (and b!9966 (not c!835)) b!9964))

(assert (= (or b!9965 b!9964) bm!295))

(assert (=> b!9962 m!6325))

(assert (=> b!9962 m!6325))

(assert (=> b!9962 m!6331))

(assert (=> b!9963 m!6325))

(assert (=> b!9963 m!6325))

(declare-fun m!6341 () Bool)

(assert (=> b!9963 m!6341))

(assert (=> b!9966 m!6325))

(assert (=> b!9966 m!6325))

(assert (=> b!9966 m!6331))

(assert (=> bm!295 m!6325))

(declare-fun m!6343 () Bool)

(assert (=> bm!295 m!6343))

(assert (=> b!9864 d!969))

(declare-fun b!9967 () Bool)

(declare-fun e!5718 () Bool)

(declare-fun e!5719 () Bool)

(assert (=> b!9967 (= e!5718 e!5719)))

(declare-fun c!836 () Bool)

(assert (=> b!9967 (= c!836 (validKeyInArray!0 (select (arr!415 _keys!1806) lt!2334)))))

(declare-fun b!9968 () Bool)

(declare-fun call!299 () Bool)

(assert (=> b!9968 (= e!5719 call!299)))

(declare-fun b!9969 () Bool)

(declare-fun e!5720 () Bool)

(assert (=> b!9969 (= e!5720 call!299)))

(declare-fun bm!296 () Bool)

(assert (=> bm!296 (= call!299 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!2334 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9970 () Bool)

(assert (=> b!9970 (= e!5719 e!5720)))

(declare-fun lt!2362 () (_ BitVec 64))

(assert (=> b!9970 (= lt!2362 (select (arr!415 _keys!1806) lt!2334))))

(declare-fun lt!2363 () Unit!201)

(assert (=> b!9970 (= lt!2363 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2362 lt!2334))))

(assert (=> b!9970 (arrayContainsKey!0 _keys!1806 lt!2362 #b00000000000000000000000000000000)))

(declare-fun lt!2364 () Unit!201)

(assert (=> b!9970 (= lt!2364 lt!2363)))

(declare-fun res!8781 () Bool)

(assert (=> b!9970 (= res!8781 (= (seekEntryOrOpen!0 (select (arr!415 _keys!1806) lt!2334) _keys!1806 mask!2250) (Found!38 lt!2334)))))

(assert (=> b!9970 (=> (not res!8781) (not e!5720))))

(declare-fun d!971 () Bool)

(declare-fun res!8782 () Bool)

(assert (=> d!971 (=> res!8782 e!5718)))

(assert (=> d!971 (= res!8782 (bvsge lt!2334 (size!477 _keys!1806)))))

(assert (=> d!971 (= (arrayForallSeekEntryOrOpenFound!0 lt!2334 _keys!1806 mask!2250) e!5718)))

(assert (= (and d!971 (not res!8782)) b!9967))

(assert (= (and b!9967 c!836) b!9970))

(assert (= (and b!9967 (not c!836)) b!9968))

(assert (= (and b!9970 res!8781) b!9969))

(assert (= (or b!9969 b!9968) bm!296))

(declare-fun m!6345 () Bool)

(assert (=> b!9967 m!6345))

(assert (=> b!9967 m!6345))

(declare-fun m!6347 () Bool)

(assert (=> b!9967 m!6347))

(declare-fun m!6349 () Bool)

(assert (=> bm!296 m!6349))

(assert (=> b!9970 m!6345))

(declare-fun m!6351 () Bool)

(assert (=> b!9970 m!6351))

(declare-fun m!6353 () Bool)

(assert (=> b!9970 m!6353))

(assert (=> b!9970 m!6345))

(declare-fun m!6355 () Bool)

(assert (=> b!9970 m!6355))

(assert (=> b!9878 d!971))

(declare-fun d!973 () Bool)

(assert (=> d!973 (arrayForallSeekEntryOrOpenFound!0 lt!2334 _keys!1806 mask!2250)))

(declare-fun lt!2367 () Unit!201)

(declare-fun choose!38 (array!863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!201)

(assert (=> d!973 (= lt!2367 (choose!38 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2334))))

(assert (=> d!973 (validMask!0 mask!2250)))

(assert (=> d!973 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2334) lt!2367)))

(declare-fun bs!337 () Bool)

(assert (= bs!337 d!973))

(assert (=> bs!337 m!6255))

(declare-fun m!6357 () Bool)

(assert (=> bs!337 m!6357))

(assert (=> bs!337 m!6273))

(assert (=> b!9878 d!973))

(declare-fun d!975 () Bool)

(declare-fun lt!2370 () (_ BitVec 32))

(assert (=> d!975 (and (or (bvslt lt!2370 #b00000000000000000000000000000000) (bvsge lt!2370 (size!477 _keys!1806)) (and (bvsge lt!2370 #b00000000000000000000000000000000) (bvslt lt!2370 (size!477 _keys!1806)))) (bvsge lt!2370 #b00000000000000000000000000000000) (bvslt lt!2370 (size!477 _keys!1806)) (= (select (arr!415 _keys!1806) lt!2370) k0!1278))))

(declare-fun e!5723 () (_ BitVec 32))

(assert (=> d!975 (= lt!2370 e!5723)))

(declare-fun c!839 () Bool)

(assert (=> d!975 (= c!839 (= (select (arr!415 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!477 _keys!1806)) (bvslt (size!477 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!975 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!2370)))

(declare-fun b!9975 () Bool)

(assert (=> b!9975 (= e!5723 #b00000000000000000000000000000000)))

(declare-fun b!9976 () Bool)

(assert (=> b!9976 (= e!5723 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!975 c!839) b!9975))

(assert (= (and d!975 (not c!839)) b!9976))

(declare-fun m!6359 () Bool)

(assert (=> d!975 m!6359))

(assert (=> d!975 m!6325))

(declare-fun m!6361 () Bool)

(assert (=> b!9976 m!6361))

(assert (=> b!9878 d!975))

(declare-fun d!977 () Bool)

(assert (=> d!977 (= (inRange!0 (index!2272 lt!2330) mask!2250) (and (bvsge (index!2272 lt!2330) #b00000000000000000000000000000000) (bvslt (index!2272 lt!2330) (bvadd mask!2250 #b00000000000000000000000000000001))))))

(assert (=> b!9873 d!977))

(assert (=> b!9869 d!963))

(declare-fun b!9989 () Bool)

(declare-fun e!5732 () SeekEntryResult!38)

(assert (=> b!9989 (= e!5732 Undefined!38)))

(declare-fun b!9990 () Bool)

(declare-fun e!5730 () SeekEntryResult!38)

(declare-fun lt!2379 () SeekEntryResult!38)

(assert (=> b!9990 (= e!5730 (MissingZero!38 (index!2273 lt!2379)))))

(declare-fun b!9991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!863 (_ BitVec 32)) SeekEntryResult!38)

(assert (=> b!9991 (= e!5730 (seekKeyOrZeroReturnVacant!0 (x!2818 lt!2379) (index!2273 lt!2379) (index!2273 lt!2379) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9992 () Bool)

(declare-fun c!846 () Bool)

(declare-fun lt!2378 () (_ BitVec 64))

(assert (=> b!9992 (= c!846 (= lt!2378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5731 () SeekEntryResult!38)

(assert (=> b!9992 (= e!5731 e!5730)))

(declare-fun d!979 () Bool)

(declare-fun lt!2377 () SeekEntryResult!38)

(assert (=> d!979 (and (or ((_ is Undefined!38) lt!2377) (not ((_ is Found!38) lt!2377)) (and (bvsge (index!2272 lt!2377) #b00000000000000000000000000000000) (bvslt (index!2272 lt!2377) (size!477 _keys!1806)))) (or ((_ is Undefined!38) lt!2377) ((_ is Found!38) lt!2377) (not ((_ is MissingZero!38) lt!2377)) (and (bvsge (index!2271 lt!2377) #b00000000000000000000000000000000) (bvslt (index!2271 lt!2377) (size!477 _keys!1806)))) (or ((_ is Undefined!38) lt!2377) ((_ is Found!38) lt!2377) ((_ is MissingZero!38) lt!2377) (not ((_ is MissingVacant!38) lt!2377)) (and (bvsge (index!2274 lt!2377) #b00000000000000000000000000000000) (bvslt (index!2274 lt!2377) (size!477 _keys!1806)))) (or ((_ is Undefined!38) lt!2377) (ite ((_ is Found!38) lt!2377) (= (select (arr!415 _keys!1806) (index!2272 lt!2377)) k0!1278) (ite ((_ is MissingZero!38) lt!2377) (= (select (arr!415 _keys!1806) (index!2271 lt!2377)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!38) lt!2377) (= (select (arr!415 _keys!1806) (index!2274 lt!2377)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!979 (= lt!2377 e!5732)))

(declare-fun c!848 () Bool)

(assert (=> d!979 (= c!848 (and ((_ is Intermediate!38) lt!2379) (undefined!850 lt!2379)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!863 (_ BitVec 32)) SeekEntryResult!38)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!979 (= lt!2379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!979 (validMask!0 mask!2250)))

(assert (=> d!979 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) lt!2377)))

(declare-fun b!9993 () Bool)

(assert (=> b!9993 (= e!5731 (Found!38 (index!2273 lt!2379)))))

(declare-fun b!9994 () Bool)

(assert (=> b!9994 (= e!5732 e!5731)))

(assert (=> b!9994 (= lt!2378 (select (arr!415 _keys!1806) (index!2273 lt!2379)))))

(declare-fun c!847 () Bool)

(assert (=> b!9994 (= c!847 (= lt!2378 k0!1278))))

(assert (= (and d!979 c!848) b!9989))

(assert (= (and d!979 (not c!848)) b!9994))

(assert (= (and b!9994 c!847) b!9993))

(assert (= (and b!9994 (not c!847)) b!9992))

(assert (= (and b!9992 c!846) b!9990))

(assert (= (and b!9992 (not c!846)) b!9991))

(declare-fun m!6363 () Bool)

(assert (=> b!9991 m!6363))

(declare-fun m!6365 () Bool)

(assert (=> d!979 m!6365))

(declare-fun m!6367 () Bool)

(assert (=> d!979 m!6367))

(declare-fun m!6369 () Bool)

(assert (=> d!979 m!6369))

(declare-fun m!6371 () Bool)

(assert (=> d!979 m!6371))

(declare-fun m!6373 () Bool)

(assert (=> d!979 m!6373))

(assert (=> d!979 m!6371))

(assert (=> d!979 m!6273))

(declare-fun m!6375 () Bool)

(assert (=> b!9994 m!6375))

(assert (=> b!9879 d!979))

(declare-fun b!10007 () Bool)

(declare-fun e!5741 () SeekEntryResult!38)

(declare-fun lt!2388 () SeekEntryResult!38)

(assert (=> b!10007 (= e!5741 (ite ((_ is MissingVacant!38) lt!2388) (MissingZero!38 (index!2274 lt!2388)) lt!2388))))

(declare-fun lt!2389 () SeekEntryResult!38)

(assert (=> b!10007 (= lt!2388 (seekKeyOrZeroReturnVacant!0 (x!2818 lt!2389) (index!2273 lt!2389) (index!2273 lt!2389) k0!1278 _keys!1806 mask!2250))))

(declare-fun d!981 () Bool)

(declare-fun lt!2390 () SeekEntryResult!38)

(assert (=> d!981 (and (or ((_ is MissingVacant!38) lt!2390) (not ((_ is Found!38) lt!2390)) (and (bvsge (index!2272 lt!2390) #b00000000000000000000000000000000) (bvslt (index!2272 lt!2390) (size!477 _keys!1806)))) (not ((_ is MissingVacant!38) lt!2390)) (or (not ((_ is Found!38) lt!2390)) (= (select (arr!415 _keys!1806) (index!2272 lt!2390)) k0!1278)))))

(declare-fun e!5740 () SeekEntryResult!38)

(assert (=> d!981 (= lt!2390 e!5740)))

(declare-fun c!857 () Bool)

(assert (=> d!981 (= c!857 (and ((_ is Intermediate!38) lt!2389) (undefined!850 lt!2389)))))

(assert (=> d!981 (= lt!2389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!981 (validMask!0 mask!2250)))

(assert (=> d!981 (= (seekEntry!0 k0!1278 _keys!1806 mask!2250) lt!2390)))

(declare-fun b!10008 () Bool)

(assert (=> b!10008 (= e!5741 (MissingZero!38 (index!2273 lt!2389)))))

(declare-fun b!10009 () Bool)

(declare-fun c!855 () Bool)

(declare-fun lt!2391 () (_ BitVec 64))

(assert (=> b!10009 (= c!855 (= lt!2391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5739 () SeekEntryResult!38)

(assert (=> b!10009 (= e!5739 e!5741)))

(declare-fun b!10010 () Bool)

(assert (=> b!10010 (= e!5740 Undefined!38)))

(declare-fun b!10011 () Bool)

(assert (=> b!10011 (= e!5739 (Found!38 (index!2273 lt!2389)))))

(declare-fun b!10012 () Bool)

(assert (=> b!10012 (= e!5740 e!5739)))

(assert (=> b!10012 (= lt!2391 (select (arr!415 _keys!1806) (index!2273 lt!2389)))))

(declare-fun c!856 () Bool)

(assert (=> b!10012 (= c!856 (= lt!2391 k0!1278))))

(assert (= (and d!981 c!857) b!10010))

(assert (= (and d!981 (not c!857)) b!10012))

(assert (= (and b!10012 c!856) b!10011))

(assert (= (and b!10012 (not c!856)) b!10009))

(assert (= (and b!10009 c!855) b!10008))

(assert (= (and b!10009 (not c!855)) b!10007))

(declare-fun m!6377 () Bool)

(assert (=> b!10007 m!6377))

(declare-fun m!6379 () Bool)

(assert (=> d!981 m!6379))

(assert (=> d!981 m!6371))

(assert (=> d!981 m!6371))

(assert (=> d!981 m!6373))

(assert (=> d!981 m!6273))

(declare-fun m!6381 () Bool)

(assert (=> b!10012 m!6381))

(assert (=> b!9871 d!981))

(declare-fun d!983 () Bool)

(declare-fun lt!2397 () SeekEntryResult!38)

(assert (=> d!983 (and ((_ is Found!38) lt!2397) (= (index!2272 lt!2397) lt!2334))))

(assert (=> d!983 (= lt!2397 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!2396 () Unit!201)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!863 (_ BitVec 32)) Unit!201)

(assert (=> d!983 (= lt!2396 (choose!0 k0!1278 lt!2334 _keys!1806 mask!2250))))

(assert (=> d!983 (validMask!0 mask!2250)))

(assert (=> d!983 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2334 _keys!1806 mask!2250) lt!2396)))

(declare-fun bs!338 () Bool)

(assert (= bs!338 d!983))

(assert (=> bs!338 m!6251))

(declare-fun m!6383 () Bool)

(assert (=> bs!338 m!6383))

(assert (=> bs!338 m!6273))

(assert (=> b!9871 d!983))

(declare-fun d!985 () Bool)

(declare-fun e!5746 () Bool)

(assert (=> d!985 e!5746))

(declare-fun res!8785 () Bool)

(assert (=> d!985 (=> res!8785 e!5746)))

(declare-fun lt!2408 () Bool)

(assert (=> d!985 (= res!8785 (not lt!2408))))

(declare-fun lt!2406 () Bool)

(assert (=> d!985 (= lt!2408 lt!2406)))

(declare-fun lt!2409 () Unit!201)

(declare-fun e!5747 () Unit!201)

(assert (=> d!985 (= lt!2409 e!5747)))

(declare-fun c!860 () Bool)

(assert (=> d!985 (= c!860 lt!2406)))

(declare-fun containsKey!10 (List!291 (_ BitVec 64)) Bool)

(assert (=> d!985 (= lt!2406 (containsKey!10 (toList!157 (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!985 (= (contains!136 (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!2408)))

(declare-fun b!10019 () Bool)

(declare-fun lt!2407 () Unit!201)

(assert (=> b!10019 (= e!5747 lt!2407)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!10 (List!291 (_ BitVec 64)) Unit!201)

(assert (=> b!10019 (= lt!2407 (lemmaContainsKeyImpliesGetValueByKeyDefined!10 (toList!157 (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!22 0))(
  ( (Some!21 (v!1336 V!797)) (None!20) )
))
(declare-fun isDefined!11 (Option!22) Bool)

(declare-fun getValueByKey!16 (List!291 (_ BitVec 64)) Option!22)

(assert (=> b!10019 (isDefined!11 (getValueByKey!16 (toList!157 (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!10020 () Bool)

(declare-fun Unit!205 () Unit!201)

(assert (=> b!10020 (= e!5747 Unit!205)))

(declare-fun b!10021 () Bool)

(assert (=> b!10021 (= e!5746 (isDefined!11 (getValueByKey!16 (toList!157 (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!985 c!860) b!10019))

(assert (= (and d!985 (not c!860)) b!10020))

(assert (= (and d!985 (not res!8785)) b!10021))

(declare-fun m!6385 () Bool)

(assert (=> d!985 m!6385))

(declare-fun m!6387 () Bool)

(assert (=> b!10019 m!6387))

(declare-fun m!6389 () Bool)

(assert (=> b!10019 m!6389))

(assert (=> b!10019 m!6389))

(declare-fun m!6391 () Bool)

(assert (=> b!10019 m!6391))

(assert (=> b!10021 m!6389))

(assert (=> b!10021 m!6389))

(assert (=> b!10021 m!6391))

(assert (=> b!9866 d!985))

(declare-fun b!10064 () Bool)

(declare-fun e!5782 () ListLongMap!283)

(declare-fun call!314 () ListLongMap!283)

(declare-fun +!13 (ListLongMap!283 tuple2!278) ListLongMap!283)

(assert (=> b!10064 (= e!5782 (+!13 call!314 (tuple2!279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!10065 () Bool)

(declare-fun e!5774 () Bool)

(declare-fun call!317 () Bool)

(assert (=> b!10065 (= e!5774 (not call!317))))

(declare-fun b!10066 () Bool)

(declare-fun e!5779 () ListLongMap!283)

(declare-fun call!320 () ListLongMap!283)

(assert (=> b!10066 (= e!5779 call!320)))

(declare-fun b!10067 () Bool)

(declare-fun res!8804 () Bool)

(declare-fun e!5783 () Bool)

(assert (=> b!10067 (=> (not res!8804) (not e!5783))))

(assert (=> b!10067 (= res!8804 e!5774)))

(declare-fun c!876 () Bool)

(assert (=> b!10067 (= c!876 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!10068 () Bool)

(declare-fun e!5776 () Bool)

(assert (=> b!10068 (= e!5776 (validKeyInArray!0 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!10069 () Bool)

(declare-fun e!5784 () Unit!201)

(declare-fun Unit!206 () Unit!201)

(assert (=> b!10069 (= e!5784 Unit!206)))

(declare-fun b!10070 () Bool)

(declare-fun lt!2467 () Unit!201)

(assert (=> b!10070 (= e!5784 lt!2467)))

(declare-fun lt!2474 () ListLongMap!283)

(declare-fun getCurrentListMapNoExtraKeys!10 (array!863 array!865 (_ BitVec 32) (_ BitVec 32) V!797 V!797 (_ BitVec 32) Int) ListLongMap!283)

(assert (=> b!10070 (= lt!2474 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2458 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2458 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2459 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2459 (select (arr!415 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2472 () Unit!201)

(declare-fun addStillContains!11 (ListLongMap!283 (_ BitVec 64) V!797 (_ BitVec 64)) Unit!201)

(assert (=> b!10070 (= lt!2472 (addStillContains!11 lt!2474 lt!2458 zeroValue!1434 lt!2459))))

(assert (=> b!10070 (contains!136 (+!13 lt!2474 (tuple2!279 lt!2458 zeroValue!1434)) lt!2459)))

(declare-fun lt!2462 () Unit!201)

(assert (=> b!10070 (= lt!2462 lt!2472)))

(declare-fun lt!2471 () ListLongMap!283)

(assert (=> b!10070 (= lt!2471 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2466 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2466 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2455 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2455 (select (arr!415 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2475 () Unit!201)

(declare-fun addApplyDifferent!11 (ListLongMap!283 (_ BitVec 64) V!797 (_ BitVec 64)) Unit!201)

(assert (=> b!10070 (= lt!2475 (addApplyDifferent!11 lt!2471 lt!2466 minValue!1434 lt!2455))))

(declare-fun apply!26 (ListLongMap!283 (_ BitVec 64)) V!797)

(assert (=> b!10070 (= (apply!26 (+!13 lt!2471 (tuple2!279 lt!2466 minValue!1434)) lt!2455) (apply!26 lt!2471 lt!2455))))

(declare-fun lt!2465 () Unit!201)

(assert (=> b!10070 (= lt!2465 lt!2475)))

(declare-fun lt!2461 () ListLongMap!283)

(assert (=> b!10070 (= lt!2461 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2457 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2468 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2468 (select (arr!415 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2473 () Unit!201)

(assert (=> b!10070 (= lt!2473 (addApplyDifferent!11 lt!2461 lt!2457 zeroValue!1434 lt!2468))))

(assert (=> b!10070 (= (apply!26 (+!13 lt!2461 (tuple2!279 lt!2457 zeroValue!1434)) lt!2468) (apply!26 lt!2461 lt!2468))))

(declare-fun lt!2456 () Unit!201)

(assert (=> b!10070 (= lt!2456 lt!2473)))

(declare-fun lt!2469 () ListLongMap!283)

(assert (=> b!10070 (= lt!2469 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2463 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2463 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2464 () (_ BitVec 64))

(assert (=> b!10070 (= lt!2464 (select (arr!415 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!10070 (= lt!2467 (addApplyDifferent!11 lt!2469 lt!2463 minValue!1434 lt!2464))))

(assert (=> b!10070 (= (apply!26 (+!13 lt!2469 (tuple2!279 lt!2463 minValue!1434)) lt!2464) (apply!26 lt!2469 lt!2464))))

(declare-fun b!10071 () Bool)

(declare-fun e!5785 () Bool)

(declare-fun e!5777 () Bool)

(assert (=> b!10071 (= e!5785 e!5777)))

(declare-fun res!8807 () Bool)

(assert (=> b!10071 (=> (not res!8807) (not e!5777))))

(declare-fun lt!2454 () ListLongMap!283)

(assert (=> b!10071 (= res!8807 (contains!136 lt!2454 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!10071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!477 _keys!1806)))))

(declare-fun b!10072 () Bool)

(declare-fun res!8811 () Bool)

(assert (=> b!10072 (=> (not res!8811) (not e!5783))))

(assert (=> b!10072 (= res!8811 e!5785)))

(declare-fun res!8812 () Bool)

(assert (=> b!10072 (=> res!8812 e!5785)))

(declare-fun e!5786 () Bool)

(assert (=> b!10072 (= res!8812 (not e!5786))))

(declare-fun res!8809 () Bool)

(assert (=> b!10072 (=> (not res!8809) (not e!5786))))

(assert (=> b!10072 (= res!8809 (bvslt #b00000000000000000000000000000000 (size!477 _keys!1806)))))

(declare-fun b!10073 () Bool)

(declare-fun e!5780 () Bool)

(assert (=> b!10073 (= e!5774 e!5780)))

(declare-fun res!8805 () Bool)

(assert (=> b!10073 (= res!8805 call!317)))

(assert (=> b!10073 (=> (not res!8805) (not e!5780))))

(declare-fun b!10074 () Bool)

(declare-fun e!5778 () Bool)

(declare-fun call!315 () Bool)

(assert (=> b!10074 (= e!5778 (not call!315))))

(declare-fun b!10075 () Bool)

(declare-fun c!878 () Bool)

(assert (=> b!10075 (= c!878 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!5781 () ListLongMap!283)

(assert (=> b!10075 (= e!5781 e!5779)))

(declare-fun b!10076 () Bool)

(declare-fun call!318 () ListLongMap!283)

(assert (=> b!10076 (= e!5779 call!318)))

(declare-fun b!10077 () Bool)

(assert (=> b!10077 (= e!5781 call!318)))

(declare-fun b!10078 () Bool)

(assert (=> b!10078 (= e!5782 e!5781)))

(declare-fun c!875 () Bool)

(assert (=> b!10078 (= c!875 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!311 () Bool)

(assert (=> bm!311 (= call!318 call!314)))

(declare-fun b!10079 () Bool)

(assert (=> b!10079 (= e!5786 (validKeyInArray!0 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!312 () Bool)

(assert (=> bm!312 (= call!315 (contains!136 lt!2454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!10080 () Bool)

(declare-fun e!5775 () Bool)

(assert (=> b!10080 (= e!5778 e!5775)))

(declare-fun res!8806 () Bool)

(assert (=> b!10080 (= res!8806 call!315)))

(assert (=> b!10080 (=> (not res!8806) (not e!5775))))

(declare-fun bm!313 () Bool)

(assert (=> bm!313 (= call!317 (contains!136 lt!2454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!314 () Bool)

(declare-fun call!319 () ListLongMap!283)

(declare-fun call!316 () ListLongMap!283)

(assert (=> bm!314 (= call!319 call!316)))

(declare-fun b!10081 () Bool)

(assert (=> b!10081 (= e!5783 e!5778)))

(declare-fun c!877 () Bool)

(assert (=> b!10081 (= c!877 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!315 () Bool)

(assert (=> bm!315 (= call!320 call!319)))

(declare-fun bm!316 () Bool)

(declare-fun c!873 () Bool)

(assert (=> bm!316 (= call!314 (+!13 (ite c!873 call!316 (ite c!875 call!319 call!320)) (ite (or c!873 c!875) (tuple2!279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!10082 () Bool)

(declare-fun get!182 (ValueCell!216 V!797) V!797)

(declare-fun dynLambda!48 (Int (_ BitVec 64)) V!797)

(assert (=> b!10082 (= e!5777 (= (apply!26 lt!2454 (select (arr!415 _keys!1806) #b00000000000000000000000000000000)) (get!182 (select (arr!416 _values!1492) #b00000000000000000000000000000000) (dynLambda!48 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!10082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!478 _values!1492)))))

(assert (=> b!10082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!477 _keys!1806)))))

(declare-fun b!10083 () Bool)

(assert (=> b!10083 (= e!5780 (= (apply!26 lt!2454 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!317 () Bool)

(assert (=> bm!317 (= call!316 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!10084 () Bool)

(assert (=> b!10084 (= e!5775 (= (apply!26 lt!2454 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun d!987 () Bool)

(assert (=> d!987 e!5783))

(declare-fun res!8810 () Bool)

(assert (=> d!987 (=> (not res!8810) (not e!5783))))

(assert (=> d!987 (= res!8810 (or (bvsge #b00000000000000000000000000000000 (size!477 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!477 _keys!1806)))))))

(declare-fun lt!2460 () ListLongMap!283)

(assert (=> d!987 (= lt!2454 lt!2460)))

(declare-fun lt!2470 () Unit!201)

(assert (=> d!987 (= lt!2470 e!5784)))

(declare-fun c!874 () Bool)

(assert (=> d!987 (= c!874 e!5776)))

(declare-fun res!8808 () Bool)

(assert (=> d!987 (=> (not res!8808) (not e!5776))))

(assert (=> d!987 (= res!8808 (bvslt #b00000000000000000000000000000000 (size!477 _keys!1806)))))

(assert (=> d!987 (= lt!2460 e!5782)))

(assert (=> d!987 (= c!873 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!987 (validMask!0 mask!2250)))

(assert (=> d!987 (= (getCurrentListMap!116 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!2454)))

(assert (= (and d!987 c!873) b!10064))

(assert (= (and d!987 (not c!873)) b!10078))

(assert (= (and b!10078 c!875) b!10077))

(assert (= (and b!10078 (not c!875)) b!10075))

(assert (= (and b!10075 c!878) b!10076))

(assert (= (and b!10075 (not c!878)) b!10066))

(assert (= (or b!10076 b!10066) bm!315))

(assert (= (or b!10077 bm!315) bm!314))

(assert (= (or b!10077 b!10076) bm!311))

(assert (= (or b!10064 bm!314) bm!317))

(assert (= (or b!10064 bm!311) bm!316))

(assert (= (and d!987 res!8808) b!10068))

(assert (= (and d!987 c!874) b!10070))

(assert (= (and d!987 (not c!874)) b!10069))

(assert (= (and d!987 res!8810) b!10072))

(assert (= (and b!10072 res!8809) b!10079))

(assert (= (and b!10072 (not res!8812)) b!10071))

(assert (= (and b!10071 res!8807) b!10082))

(assert (= (and b!10072 res!8811) b!10067))

(assert (= (and b!10067 c!876) b!10073))

(assert (= (and b!10067 (not c!876)) b!10065))

(assert (= (and b!10073 res!8805) b!10083))

(assert (= (or b!10073 b!10065) bm!313))

(assert (= (and b!10067 res!8804) b!10081))

(assert (= (and b!10081 c!877) b!10080))

(assert (= (and b!10081 (not c!877)) b!10074))

(assert (= (and b!10080 res!8806) b!10084))

(assert (= (or b!10080 b!10074) bm!312))

(declare-fun b_lambda!355 () Bool)

(assert (=> (not b_lambda!355) (not b!10082)))

(declare-fun t!2438 () Bool)

(declare-fun tb!145 () Bool)

(assert (=> (and start!1116 (= defaultEntry!1495 defaultEntry!1495) t!2438) tb!145))

(declare-fun result!237 () Bool)

(assert (=> tb!145 (= result!237 tp_is_empty!465)))

(assert (=> b!10082 t!2438))

(declare-fun b_and!547 () Bool)

(assert (= b_and!543 (and (=> t!2438 result!237) b_and!547)))

(assert (=> b!10082 m!6325))

(declare-fun m!6393 () Bool)

(assert (=> b!10082 m!6393))

(declare-fun m!6395 () Bool)

(assert (=> b!10082 m!6395))

(assert (=> b!10082 m!6325))

(assert (=> b!10082 m!6395))

(declare-fun m!6397 () Bool)

(assert (=> b!10082 m!6397))

(declare-fun m!6399 () Bool)

(assert (=> b!10082 m!6399))

(assert (=> b!10082 m!6397))

(declare-fun m!6401 () Bool)

(assert (=> b!10083 m!6401))

(declare-fun m!6403 () Bool)

(assert (=> b!10064 m!6403))

(assert (=> b!10079 m!6325))

(assert (=> b!10079 m!6325))

(assert (=> b!10079 m!6331))

(declare-fun m!6405 () Bool)

(assert (=> bm!312 m!6405))

(assert (=> b!10071 m!6325))

(assert (=> b!10071 m!6325))

(declare-fun m!6407 () Bool)

(assert (=> b!10071 m!6407))

(assert (=> b!10068 m!6325))

(assert (=> b!10068 m!6325))

(assert (=> b!10068 m!6331))

(assert (=> d!987 m!6273))

(declare-fun m!6409 () Bool)

(assert (=> b!10070 m!6409))

(declare-fun m!6411 () Bool)

(assert (=> b!10070 m!6411))

(declare-fun m!6413 () Bool)

(assert (=> b!10070 m!6413))

(declare-fun m!6415 () Bool)

(assert (=> b!10070 m!6415))

(declare-fun m!6417 () Bool)

(assert (=> b!10070 m!6417))

(declare-fun m!6419 () Bool)

(assert (=> b!10070 m!6419))

(assert (=> b!10070 m!6413))

(assert (=> b!10070 m!6325))

(declare-fun m!6421 () Bool)

(assert (=> b!10070 m!6421))

(declare-fun m!6423 () Bool)

(assert (=> b!10070 m!6423))

(declare-fun m!6425 () Bool)

(assert (=> b!10070 m!6425))

(declare-fun m!6427 () Bool)

(assert (=> b!10070 m!6427))

(declare-fun m!6429 () Bool)

(assert (=> b!10070 m!6429))

(declare-fun m!6431 () Bool)

(assert (=> b!10070 m!6431))

(declare-fun m!6433 () Bool)

(assert (=> b!10070 m!6433))

(assert (=> b!10070 m!6433))

(declare-fun m!6435 () Bool)

(assert (=> b!10070 m!6435))

(declare-fun m!6437 () Bool)

(assert (=> b!10070 m!6437))

(assert (=> b!10070 m!6423))

(declare-fun m!6439 () Bool)

(assert (=> b!10070 m!6439))

(assert (=> b!10070 m!6429))

(assert (=> bm!317 m!6411))

(declare-fun m!6441 () Bool)

(assert (=> b!10084 m!6441))

(declare-fun m!6443 () Bool)

(assert (=> bm!316 m!6443))

(declare-fun m!6445 () Bool)

(assert (=> bm!313 m!6445))

(assert (=> b!9866 d!987))

(declare-fun d!989 () Bool)

(assert (=> d!989 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!1116 d!989))

(declare-fun d!991 () Bool)

(assert (=> d!991 (= (array_inv!299 _values!1492) (bvsge (size!478 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!1116 d!991))

(declare-fun d!993 () Bool)

(assert (=> d!993 (= (array_inv!300 _keys!1806) (bvsge (size!477 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!1116 d!993))

(declare-fun mapNonEmpty!689 () Bool)

(declare-fun mapRes!689 () Bool)

(declare-fun tp!1415 () Bool)

(declare-fun e!5792 () Bool)

(assert (=> mapNonEmpty!689 (= mapRes!689 (and tp!1415 e!5792))))

(declare-fun mapValue!689 () ValueCell!216)

(declare-fun mapKey!689 () (_ BitVec 32))

(declare-fun mapRest!689 () (Array (_ BitVec 32) ValueCell!216))

(assert (=> mapNonEmpty!689 (= mapRest!683 (store mapRest!689 mapKey!689 mapValue!689))))

(declare-fun condMapEmpty!689 () Bool)

(declare-fun mapDefault!689 () ValueCell!216)

(assert (=> mapNonEmpty!683 (= condMapEmpty!689 (= mapRest!683 ((as const (Array (_ BitVec 32) ValueCell!216)) mapDefault!689)))))

(declare-fun e!5791 () Bool)

(assert (=> mapNonEmpty!683 (= tp!1406 (and e!5791 mapRes!689))))

(declare-fun b!10094 () Bool)

(assert (=> b!10094 (= e!5791 tp_is_empty!465)))

(declare-fun mapIsEmpty!689 () Bool)

(assert (=> mapIsEmpty!689 mapRes!689))

(declare-fun b!10093 () Bool)

(assert (=> b!10093 (= e!5792 tp_is_empty!465)))

(assert (= (and mapNonEmpty!683 condMapEmpty!689) mapIsEmpty!689))

(assert (= (and mapNonEmpty!683 (not condMapEmpty!689)) mapNonEmpty!689))

(assert (= (and mapNonEmpty!689 ((_ is ValueCellFull!216) mapValue!689)) b!10093))

(assert (= (and mapNonEmpty!683 ((_ is ValueCellFull!216) mapDefault!689)) b!10094))

(declare-fun m!6447 () Bool)

(assert (=> mapNonEmpty!689 m!6447))

(declare-fun b_lambda!357 () Bool)

(assert (= b_lambda!355 (or (and start!1116 b_free!387) b_lambda!357)))

(check-sat (not bm!313) (not b!10083) (not bm!296) (not b!9970) (not b!10070) (not b!10084) (not b!9938) (not b!10071) (not b!9951) (not b!10007) (not mapNonEmpty!689) (not d!973) (not bm!292) (not b!9933) b_and!547 (not b!10021) (not b_next!387) (not bm!312) (not b!10064) (not bm!316) (not d!987) (not b!9963) (not b!9948) (not b!9966) (not d!985) (not d!979) tp_is_empty!465 (not b!9967) (not b!10068) (not b_lambda!357) (not b!10019) (not d!983) (not bm!317) (not d!981) (not bm!295) (not b!9976) (not b!10082) (not b!9962) (not d!965) (not b!9991) (not b!10079))
(check-sat b_and!547 (not b_next!387))
