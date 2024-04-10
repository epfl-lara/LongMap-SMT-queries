; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77188 () Bool)

(assert start!77188)

(declare-fun b!900722 () Bool)

(declare-fun b_free!16057 () Bool)

(declare-fun b_next!16057 () Bool)

(assert (=> b!900722 (= b_free!16057 (not b_next!16057))))

(declare-fun tp!56265 () Bool)

(declare-fun b_and!26381 () Bool)

(assert (=> b!900722 (= tp!56265 b_and!26381)))

(declare-fun e!504180 () Bool)

(declare-datatypes ((array!52822 0))(
  ( (array!52823 (arr!25381 (Array (_ BitVec 32) (_ BitVec 64))) (size!25840 (_ BitVec 32))) )
))
(declare-datatypes ((V!29479 0))(
  ( (V!29480 (val!9243 Int)) )
))
(declare-datatypes ((ValueCell!8711 0))(
  ( (ValueCellFull!8711 (v!11741 V!29479)) (EmptyCell!8711) )
))
(declare-datatypes ((array!52824 0))(
  ( (array!52825 (arr!25382 (Array (_ BitVec 32) ValueCell!8711)) (size!25841 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4438 0))(
  ( (LongMapFixedSize!4439 (defaultEntry!5455 Int) (mask!26249 (_ BitVec 32)) (extraKeys!5182 (_ BitVec 32)) (zeroValue!5286 V!29479) (minValue!5286 V!29479) (_size!2274 (_ BitVec 32)) (_keys!10262 array!52822) (_values!5473 array!52824) (_vacant!2274 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4438)

(declare-fun tp_is_empty!18385 () Bool)

(declare-fun e!504177 () Bool)

(declare-fun array_inv!19908 (array!52822) Bool)

(declare-fun array_inv!19909 (array!52824) Bool)

(assert (=> b!900722 (= e!504177 (and tp!56265 tp_is_empty!18385 (array_inv!19908 (_keys!10262 thiss!1181)) (array_inv!19909 (_values!5473 thiss!1181)) e!504180))))

(declare-fun b!900723 () Bool)

(declare-fun res!608227 () Bool)

(declare-fun e!504172 () Bool)

(assert (=> b!900723 (=> res!608227 e!504172)))

(assert (=> b!900723 (= res!608227 (or (not (= (size!25841 (_values!5473 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26249 thiss!1181)))) (not (= (size!25840 (_keys!10262 thiss!1181)) (size!25841 (_values!5473 thiss!1181)))) (bvslt (mask!26249 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5182 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5182 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29257 () Bool)

(declare-fun mapRes!29257 () Bool)

(assert (=> mapIsEmpty!29257 mapRes!29257))

(declare-fun b!900724 () Bool)

(declare-datatypes ((tuple2!12054 0))(
  ( (tuple2!12055 (_1!6038 (_ BitVec 64)) (_2!6038 V!29479)) )
))
(declare-datatypes ((List!17858 0))(
  ( (Nil!17855) (Cons!17854 (h!19000 tuple2!12054) (t!25213 List!17858)) )
))
(declare-datatypes ((ListLongMap!10751 0))(
  ( (ListLongMap!10752 (toList!5391 List!17858)) )
))
(declare-fun lt!407034 () ListLongMap!10751)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4429 (ListLongMap!10751 (_ BitVec 64)) Bool)

(assert (=> b!900724 (= e!504172 (contains!4429 lt!407034 key!785))))

(declare-fun b!900725 () Bool)

(declare-fun e!504179 () Bool)

(declare-fun e!504176 () Bool)

(assert (=> b!900725 (= e!504179 (not e!504176))))

(declare-fun res!608230 () Bool)

(assert (=> b!900725 (=> res!608230 e!504176)))

(declare-datatypes ((SeekEntryResult!8942 0))(
  ( (MissingZero!8942 (index!38139 (_ BitVec 32))) (Found!8942 (index!38140 (_ BitVec 32))) (Intermediate!8942 (undefined!9754 Bool) (index!38141 (_ BitVec 32)) (x!76747 (_ BitVec 32))) (Undefined!8942) (MissingVacant!8942 (index!38142 (_ BitVec 32))) )
))
(declare-fun lt!407032 () SeekEntryResult!8942)

(assert (=> b!900725 (= res!608230 (not (is-Found!8942 lt!407032)))))

(declare-fun e!504173 () Bool)

(assert (=> b!900725 e!504173))

(declare-fun res!608229 () Bool)

(assert (=> b!900725 (=> res!608229 e!504173)))

(assert (=> b!900725 (= res!608229 (not (is-Found!8942 lt!407032)))))

(declare-datatypes ((Unit!30594 0))(
  ( (Unit!30595) )
))
(declare-fun lt!407033 () Unit!30594)

(declare-fun lemmaSeekEntryGivesInRangeIndex!103 (array!52822 array!52824 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 64)) Unit!30594)

(assert (=> b!900725 (= lt!407033 (lemmaSeekEntryGivesInRangeIndex!103 (_keys!10262 thiss!1181) (_values!5473 thiss!1181) (mask!26249 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52822 (_ BitVec 32)) SeekEntryResult!8942)

(assert (=> b!900725 (= lt!407032 (seekEntry!0 key!785 (_keys!10262 thiss!1181) (mask!26249 thiss!1181)))))

(declare-fun res!608228 () Bool)

(assert (=> start!77188 (=> (not res!608228) (not e!504179))))

(declare-fun valid!1702 (LongMapFixedSize!4438) Bool)

(assert (=> start!77188 (= res!608228 (valid!1702 thiss!1181))))

(assert (=> start!77188 e!504179))

(assert (=> start!77188 e!504177))

(assert (=> start!77188 true))

(declare-fun b!900726 () Bool)

(declare-fun res!608231 () Bool)

(assert (=> b!900726 (=> res!608231 e!504172)))

(declare-datatypes ((List!17859 0))(
  ( (Nil!17856) (Cons!17855 (h!19001 (_ BitVec 64)) (t!25214 List!17859)) )
))
(declare-fun arrayNoDuplicates!0 (array!52822 (_ BitVec 32) List!17859) Bool)

(assert (=> b!900726 (= res!608231 (not (arrayNoDuplicates!0 (_keys!10262 thiss!1181) #b00000000000000000000000000000000 Nil!17856)))))

(declare-fun b!900727 () Bool)

(declare-fun e!504174 () Bool)

(assert (=> b!900727 (= e!504180 (and e!504174 mapRes!29257))))

(declare-fun condMapEmpty!29257 () Bool)

(declare-fun mapDefault!29257 () ValueCell!8711)

