; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81478 () Bool)

(assert start!81478)

(declare-fun b!952203 () Bool)

(declare-fun b_free!18283 () Bool)

(declare-fun b_next!18283 () Bool)

(assert (=> b!952203 (= b_free!18283 (not b_next!18283))))

(declare-fun tp!63468 () Bool)

(declare-fun b_and!29761 () Bool)

(assert (=> b!952203 (= tp!63468 b_and!29761)))

(declare-fun res!637959 () Bool)

(declare-fun e!536243 () Bool)

(assert (=> start!81478 (=> (not res!637959) (not e!536243))))

(declare-datatypes ((V!32687 0))(
  ( (V!32688 (val!10446 Int)) )
))
(declare-datatypes ((ValueCell!9914 0))(
  ( (ValueCellFull!9914 (v!12996 V!32687)) (EmptyCell!9914) )
))
(declare-datatypes ((array!57614 0))(
  ( (array!57615 (arr!27700 (Array (_ BitVec 32) ValueCell!9914)) (size!28179 (_ BitVec 32))) )
))
(declare-datatypes ((array!57616 0))(
  ( (array!57617 (arr!27701 (Array (_ BitVec 32) (_ BitVec 64))) (size!28180 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4978 0))(
  ( (LongMapFixedSize!4979 (defaultEntry!5818 Int) (mask!27660 (_ BitVec 32)) (extraKeys!5550 (_ BitVec 32)) (zeroValue!5654 V!32687) (minValue!5654 V!32687) (_size!2544 (_ BitVec 32)) (_keys!10770 array!57616) (_values!5841 array!57614) (_vacant!2544 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4978)

(declare-fun valid!1894 (LongMapFixedSize!4978) Bool)

(assert (=> start!81478 (= res!637959 (valid!1894 thiss!1141))))

(assert (=> start!81478 e!536243))

(declare-fun e!536241 () Bool)

(assert (=> start!81478 e!536241))

(assert (=> start!81478 true))

(declare-fun mapNonEmpty!33121 () Bool)

(declare-fun mapRes!33121 () Bool)

(declare-fun tp!63467 () Bool)

(declare-fun e!536247 () Bool)

(assert (=> mapNonEmpty!33121 (= mapRes!33121 (and tp!63467 e!536247))))

(declare-fun mapValue!33121 () ValueCell!9914)

(declare-fun mapRest!33121 () (Array (_ BitVec 32) ValueCell!9914))

(declare-fun mapKey!33121 () (_ BitVec 32))

(assert (=> mapNonEmpty!33121 (= (arr!27700 (_values!5841 thiss!1141)) (store mapRest!33121 mapKey!33121 mapValue!33121))))

(declare-fun b!952202 () Bool)

(declare-fun e!536244 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57616 (_ BitVec 32)) Bool)

(assert (=> b!952202 (= e!536244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10770 thiss!1141) (mask!27660 thiss!1141)))))

(declare-fun e!536246 () Bool)

(declare-fun tp_is_empty!20791 () Bool)

(declare-fun array_inv!21500 (array!57616) Bool)

(declare-fun array_inv!21501 (array!57614) Bool)

(assert (=> b!952203 (= e!536241 (and tp!63468 tp_is_empty!20791 (array_inv!21500 (_keys!10770 thiss!1141)) (array_inv!21501 (_values!5841 thiss!1141)) e!536246))))

(declare-fun b!952204 () Bool)

(declare-fun res!637957 () Bool)

(assert (=> b!952204 (=> res!637957 e!536244)))

(assert (=> b!952204 (= res!637957 (not (= (size!28180 (_keys!10770 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27660 thiss!1141)))))))

(declare-fun b!952205 () Bool)

(declare-fun res!637956 () Bool)

(assert (=> b!952205 (=> (not res!637956) (not e!536243))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13580 0))(
  ( (tuple2!13581 (_1!6801 (_ BitVec 64)) (_2!6801 V!32687)) )
))
(declare-datatypes ((List!19362 0))(
  ( (Nil!19359) (Cons!19358 (h!20520 tuple2!13580) (t!27715 List!19362)) )
))
(declare-datatypes ((ListLongMap!12277 0))(
  ( (ListLongMap!12278 (toList!6154 List!19362)) )
))
(declare-fun contains!5249 (ListLongMap!12277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3387 (array!57616 array!57614 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 32) Int) ListLongMap!12277)

(assert (=> b!952205 (= res!637956 (contains!5249 (getCurrentListMap!3387 (_keys!10770 thiss!1141) (_values!5841 thiss!1141) (mask!27660 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) key!756))))

(declare-fun b!952206 () Bool)

(declare-fun res!637958 () Bool)

(assert (=> b!952206 (=> (not res!637958) (not e!536243))))

(declare-datatypes ((SeekEntryResult!9158 0))(
  ( (MissingZero!9158 (index!39003 (_ BitVec 32))) (Found!9158 (index!39004 (_ BitVec 32))) (Intermediate!9158 (undefined!9970 Bool) (index!39005 (_ BitVec 32)) (x!81918 (_ BitVec 32))) (Undefined!9158) (MissingVacant!9158 (index!39006 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57616 (_ BitVec 32)) SeekEntryResult!9158)

(assert (=> b!952206 (= res!637958 (not (is-Found!9158 (seekEntry!0 key!756 (_keys!10770 thiss!1141) (mask!27660 thiss!1141)))))))

(declare-fun b!952207 () Bool)

(assert (=> b!952207 (= e!536247 tp_is_empty!20791)))

(declare-fun b!952208 () Bool)

(declare-fun res!637955 () Bool)

(assert (=> b!952208 (=> (not res!637955) (not e!536243))))

(assert (=> b!952208 (= res!637955 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952209 () Bool)

(assert (=> b!952209 (= e!536243 (not e!536244))))

(declare-fun res!637954 () Bool)

(assert (=> b!952209 (=> res!637954 e!536244)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952209 (= res!637954 (not (validMask!0 (mask!27660 thiss!1141))))))

(declare-fun lt!429027 () (_ BitVec 32))

(assert (=> b!952209 (arrayForallSeekEntryOrOpenFound!0 lt!429027 (_keys!10770 thiss!1141) (mask!27660 thiss!1141))))

(declare-datatypes ((Unit!32039 0))(
  ( (Unit!32040) )
))
(declare-fun lt!429025 () Unit!32039)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32039)

(assert (=> b!952209 (= lt!429025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10770 thiss!1141) (mask!27660 thiss!1141) #b00000000000000000000000000000000 lt!429027))))

(declare-fun arrayScanForKey!0 (array!57616 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952209 (= lt!429027 (arrayScanForKey!0 (_keys!10770 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952209 (arrayContainsKey!0 (_keys!10770 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429026 () Unit!32039)

(declare-fun lemmaKeyInListMapIsInArray!333 (array!57616 array!57614 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 64) Int) Unit!32039)

(assert (=> b!952209 (= lt!429026 (lemmaKeyInListMapIsInArray!333 (_keys!10770 thiss!1141) (_values!5841 thiss!1141) (mask!27660 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)))))

(declare-fun b!952210 () Bool)

(declare-fun e!536245 () Bool)

(assert (=> b!952210 (= e!536245 tp_is_empty!20791)))

(declare-fun b!952211 () Bool)

(assert (=> b!952211 (= e!536246 (and e!536245 mapRes!33121))))

(declare-fun condMapEmpty!33121 () Bool)

(declare-fun mapDefault!33121 () ValueCell!9914)

