; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77300 () Bool)

(assert start!77300)

(declare-fun b!901770 () Bool)

(declare-fun b_free!16085 () Bool)

(declare-fun b_next!16085 () Bool)

(assert (=> b!901770 (= b_free!16085 (not b_next!16085))))

(declare-fun tp!56357 () Bool)

(declare-fun b_and!26435 () Bool)

(assert (=> b!901770 (= tp!56357 b_and!26435)))

(declare-fun b!901761 () Bool)

(declare-fun e!504901 () Bool)

(declare-datatypes ((V!29515 0))(
  ( (V!29516 (val!9257 Int)) )
))
(declare-fun call!40183 () V!29515)

(declare-datatypes ((array!52884 0))(
  ( (array!52885 (arr!25409 (Array (_ BitVec 32) (_ BitVec 64))) (size!25868 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8725 0))(
  ( (ValueCellFull!8725 (v!11759 V!29515)) (EmptyCell!8725) )
))
(declare-datatypes ((array!52886 0))(
  ( (array!52887 (arr!25410 (Array (_ BitVec 32) ValueCell!8725)) (size!25869 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4466 0))(
  ( (LongMapFixedSize!4467 (defaultEntry!5476 Int) (mask!26291 (_ BitVec 32)) (extraKeys!5206 (_ BitVec 32)) (zeroValue!5310 V!29515) (minValue!5310 V!29515) (_size!2288 (_ BitVec 32)) (_keys!10291 array!52884) (_values!5497 array!52886) (_vacant!2288 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4466)

(assert (=> b!901761 (= e!504901 (= call!40183 (zeroValue!5310 thiss!1181)))))

(declare-fun b!901762 () Bool)

(declare-fun e!504900 () Bool)

(declare-fun tp_is_empty!18413 () Bool)

(assert (=> b!901762 (= e!504900 tp_is_empty!18413)))

(declare-fun b!901763 () Bool)

(declare-fun e!504908 () Bool)

(declare-fun e!504904 () Bool)

(assert (=> b!901763 (= e!504908 e!504904)))

(declare-fun c!95540 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901763 (= c!95540 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!40182 () V!29515)

(declare-fun b!901764 () Bool)

(declare-datatypes ((SeekEntryResult!8954 0))(
  ( (MissingZero!8954 (index!38187 (_ BitVec 32))) (Found!8954 (index!38188 (_ BitVec 32))) (Intermediate!8954 (undefined!9766 Bool) (index!38189 (_ BitVec 32)) (x!76833 (_ BitVec 32))) (Undefined!8954) (MissingVacant!8954 (index!38190 (_ BitVec 32))) )
))
(declare-fun lt!407602 () SeekEntryResult!8954)

(declare-fun get!13372 (ValueCell!8725 V!29515) V!29515)

(declare-fun dynLambda!1316 (Int (_ BitVec 64)) V!29515)

(assert (=> b!901764 (= e!504904 (= call!40182 (get!13372 (select (arr!25410 (_values!5497 thiss!1181)) (index!38188 lt!407602)) (dynLambda!1316 (defaultEntry!5476 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!608753 () Bool)

(declare-fun e!504910 () Bool)

(assert (=> start!77300 (=> (not res!608753) (not e!504910))))

(declare-fun valid!1715 (LongMapFixedSize!4466) Bool)

(assert (=> start!77300 (= res!608753 (valid!1715 thiss!1181))))

(assert (=> start!77300 e!504910))

(declare-fun e!504907 () Bool)

(assert (=> start!77300 e!504907))

(assert (=> start!77300 true))

(declare-fun b!901765 () Bool)

(declare-fun res!608750 () Bool)

(declare-fun e!504905 () Bool)

(assert (=> b!901765 (=> (not res!608750) (not e!504905))))

(assert (=> b!901765 (= res!608750 (not (= (bvand (extraKeys!5206 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!901765 (= e!504904 e!504905)))

(declare-fun b!901766 () Bool)

(declare-fun e!504909 () Bool)

(assert (=> b!901766 (= e!504910 (not e!504909))))

(declare-fun res!608751 () Bool)

(assert (=> b!901766 (=> res!608751 e!504909)))

(assert (=> b!901766 (= res!608751 (not (is-Found!8954 lt!407602)))))

(declare-fun e!504906 () Bool)

(assert (=> b!901766 e!504906))

(declare-fun res!608752 () Bool)

(assert (=> b!901766 (=> res!608752 e!504906)))

(assert (=> b!901766 (= res!608752 (not (is-Found!8954 lt!407602)))))

(declare-datatypes ((Unit!30624 0))(
  ( (Unit!30625) )
))
(declare-fun lt!407600 () Unit!30624)

(declare-fun lemmaSeekEntryGivesInRangeIndex!113 (array!52884 array!52886 (_ BitVec 32) (_ BitVec 32) V!29515 V!29515 (_ BitVec 64)) Unit!30624)

(assert (=> b!901766 (= lt!407600 (lemmaSeekEntryGivesInRangeIndex!113 (_keys!10291 thiss!1181) (_values!5497 thiss!1181) (mask!26291 thiss!1181) (extraKeys!5206 thiss!1181) (zeroValue!5310 thiss!1181) (minValue!5310 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52884 (_ BitVec 32)) SeekEntryResult!8954)

(assert (=> b!901766 (= lt!407602 (seekEntry!0 key!785 (_keys!10291 thiss!1181) (mask!26291 thiss!1181)))))

(declare-fun mapIsEmpty!29308 () Bool)

(declare-fun mapRes!29308 () Bool)

(assert (=> mapIsEmpty!29308 mapRes!29308))

(declare-fun b!901767 () Bool)

(declare-fun res!608754 () Bool)

(assert (=> b!901767 (=> (not res!608754) (not e!504910))))

(assert (=> b!901767 (= res!608754 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901768 () Bool)

(declare-fun e!504902 () Bool)

(assert (=> b!901768 (= e!504909 e!504902)))

(declare-fun c!95539 () Bool)

(declare-fun contains!4444 (LongMapFixedSize!4466 (_ BitVec 64)) Bool)

(assert (=> b!901768 (= c!95539 (contains!4444 thiss!1181 key!785))))

(declare-fun lt!407606 () V!29515)

(assert (=> b!901768 (= lt!407606 (get!13372 (select (arr!25410 (_values!5497 thiss!1181)) (index!38188 lt!407602)) (dynLambda!1316 (defaultEntry!5476 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!901768 e!504908))

(declare-fun c!95538 () Bool)

(assert (=> b!901768 (= c!95538 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407604 () Unit!30624)

(declare-fun lemmaKeyInListMapThenSameValueInArray!14 (array!52884 array!52886 (_ BitVec 32) (_ BitVec 32) V!29515 V!29515 (_ BitVec 64) (_ BitVec 32) Int) Unit!30624)

(assert (=> b!901768 (= lt!407604 (lemmaKeyInListMapThenSameValueInArray!14 (_keys!10291 thiss!1181) (_values!5497 thiss!1181) (mask!26291 thiss!1181) (extraKeys!5206 thiss!1181) (zeroValue!5310 thiss!1181) (minValue!5310 thiss!1181) key!785 (index!38188 lt!407602) (defaultEntry!5476 thiss!1181)))))

(declare-datatypes ((tuple2!12078 0))(
  ( (tuple2!12079 (_1!6050 (_ BitVec 64)) (_2!6050 V!29515)) )
))
(declare-datatypes ((List!17878 0))(
  ( (Nil!17875) (Cons!17874 (h!19020 tuple2!12078) (t!25255 List!17878)) )
))
(declare-datatypes ((ListLongMap!10775 0))(
  ( (ListLongMap!10776 (toList!5403 List!17878)) )
))
(declare-fun lt!407605 () ListLongMap!10775)

(declare-fun contains!4445 (ListLongMap!10775 (_ BitVec 64)) Bool)

(assert (=> b!901768 (contains!4445 lt!407605 (select (arr!25409 (_keys!10291 thiss!1181)) (index!38188 lt!407602)))))

(declare-fun getCurrentListMap!2673 (array!52884 array!52886 (_ BitVec 32) (_ BitVec 32) V!29515 V!29515 (_ BitVec 32) Int) ListLongMap!10775)

(assert (=> b!901768 (= lt!407605 (getCurrentListMap!2673 (_keys!10291 thiss!1181) (_values!5497 thiss!1181) (mask!26291 thiss!1181) (extraKeys!5206 thiss!1181) (zeroValue!5310 thiss!1181) (minValue!5310 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5476 thiss!1181)))))

(declare-fun lt!407601 () Unit!30624)

(declare-fun lemmaValidKeyInArrayIsInListMap!262 (array!52884 array!52886 (_ BitVec 32) (_ BitVec 32) V!29515 V!29515 (_ BitVec 32) Int) Unit!30624)

(assert (=> b!901768 (= lt!407601 (lemmaValidKeyInArrayIsInListMap!262 (_keys!10291 thiss!1181) (_values!5497 thiss!1181) (mask!26291 thiss!1181) (extraKeys!5206 thiss!1181) (zeroValue!5310 thiss!1181) (minValue!5310 thiss!1181) (index!38188 lt!407602) (defaultEntry!5476 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901768 (arrayContainsKey!0 (_keys!10291 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407603 () Unit!30624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52884 (_ BitVec 64) (_ BitVec 32)) Unit!30624)

(assert (=> b!901768 (= lt!407603 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10291 thiss!1181) key!785 (index!38188 lt!407602)))))

(declare-fun bm!40179 () Bool)

(assert (=> bm!40179 (= call!40182 call!40183)))

(declare-fun b!901769 () Bool)

(assert (=> b!901769 (= e!504908 e!504901)))

(declare-fun res!608749 () Bool)

(assert (=> b!901769 (= res!608749 (not (= (bvand (extraKeys!5206 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901769 (=> (not res!608749) (not e!504901))))

(declare-fun e!504898 () Bool)

(declare-fun array_inv!19926 (array!52884) Bool)

(declare-fun array_inv!19927 (array!52886) Bool)

(assert (=> b!901770 (= e!504907 (and tp!56357 tp_is_empty!18413 (array_inv!19926 (_keys!10291 thiss!1181)) (array_inv!19927 (_values!5497 thiss!1181)) e!504898))))

(declare-fun b!901771 () Bool)

(assert (=> b!901771 (= e!504898 (and e!504900 mapRes!29308))))

(declare-fun condMapEmpty!29308 () Bool)

(declare-fun mapDefault!29308 () ValueCell!8725)

