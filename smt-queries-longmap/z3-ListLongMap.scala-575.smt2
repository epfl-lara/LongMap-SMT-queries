; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15594 () Bool)

(assert start!15594)

(declare-fun b!155250 () Bool)

(declare-fun b_free!3261 () Bool)

(declare-fun b_next!3261 () Bool)

(assert (=> b!155250 (= b_free!3261 (not b_next!3261))))

(declare-fun tp!12308 () Bool)

(declare-fun b_and!9675 () Bool)

(assert (=> b!155250 (= tp!12308 b_and!9675)))

(declare-fun b!155247 () Bool)

(declare-fun res!73308 () Bool)

(declare-fun e!101422 () Bool)

(assert (=> b!155247 (=> (not res!73308) (not e!101422))))

(declare-datatypes ((V!3731 0))(
  ( (V!3732 (val!1576 Int)) )
))
(declare-datatypes ((ValueCell!1188 0))(
  ( (ValueCellFull!1188 (v!3441 V!3731)) (EmptyCell!1188) )
))
(declare-datatypes ((array!5179 0))(
  ( (array!5180 (arr!2447 (Array (_ BitVec 32) (_ BitVec 64))) (size!2725 (_ BitVec 32))) )
))
(declare-datatypes ((array!5181 0))(
  ( (array!5182 (arr!2448 (Array (_ BitVec 32) ValueCell!1188)) (size!2726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1284 0))(
  ( (LongMapFixedSize!1285 (defaultEntry!3084 Int) (mask!7503 (_ BitVec 32)) (extraKeys!2825 (_ BitVec 32)) (zeroValue!2927 V!3731) (minValue!2927 V!3731) (_size!691 (_ BitVec 32)) (_keys!4859 array!5179) (_values!3067 array!5181) (_vacant!691 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1284)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155247 (= res!73308 (validMask!0 (mask!7503 thiss!1248)))))

(declare-fun b!155248 () Bool)

(declare-fun e!101427 () Bool)

(declare-fun e!101426 () Bool)

(declare-fun mapRes!5237 () Bool)

(assert (=> b!155248 (= e!101427 (and e!101426 mapRes!5237))))

(declare-fun condMapEmpty!5237 () Bool)

(declare-fun mapDefault!5237 () ValueCell!1188)

(assert (=> b!155248 (= condMapEmpty!5237 (= (arr!2448 (_values!3067 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1188)) mapDefault!5237)))))

(declare-fun b!155249 () Bool)

(assert (=> b!155249 (= e!101422 false)))

(declare-fun lt!81343 () Bool)

(declare-datatypes ((List!1819 0))(
  ( (Nil!1816) (Cons!1815 (h!2424 (_ BitVec 64)) (t!6621 List!1819)) )
))
(declare-fun arrayNoDuplicates!0 (array!5179 (_ BitVec 32) List!1819) Bool)

(assert (=> b!155249 (= lt!81343 (arrayNoDuplicates!0 (_keys!4859 thiss!1248) #b00000000000000000000000000000000 Nil!1816))))

(declare-fun mapNonEmpty!5237 () Bool)

(declare-fun tp!12307 () Bool)

(declare-fun e!101424 () Bool)

(assert (=> mapNonEmpty!5237 (= mapRes!5237 (and tp!12307 e!101424))))

(declare-fun mapKey!5237 () (_ BitVec 32))

(declare-fun mapRest!5237 () (Array (_ BitVec 32) ValueCell!1188))

(declare-fun mapValue!5237 () ValueCell!1188)

(assert (=> mapNonEmpty!5237 (= (arr!2448 (_values!3067 thiss!1248)) (store mapRest!5237 mapKey!5237 mapValue!5237))))

(declare-fun e!101423 () Bool)

(declare-fun tp_is_empty!3063 () Bool)

(declare-fun array_inv!1547 (array!5179) Bool)

(declare-fun array_inv!1548 (array!5181) Bool)

(assert (=> b!155250 (= e!101423 (and tp!12308 tp_is_empty!3063 (array_inv!1547 (_keys!4859 thiss!1248)) (array_inv!1548 (_values!3067 thiss!1248)) e!101427))))

(declare-fun mapIsEmpty!5237 () Bool)

(assert (=> mapIsEmpty!5237 mapRes!5237))

(declare-fun b!155251 () Bool)

(declare-fun res!73307 () Bool)

(assert (=> b!155251 (=> (not res!73307) (not e!101422))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155251 (= res!73307 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155252 () Bool)

(assert (=> b!155252 (= e!101424 tp_is_empty!3063)))

(declare-fun res!73309 () Bool)

(assert (=> start!15594 (=> (not res!73309) (not e!101422))))

(declare-fun valid!631 (LongMapFixedSize!1284) Bool)

(assert (=> start!15594 (= res!73309 (valid!631 thiss!1248))))

(assert (=> start!15594 e!101422))

(assert (=> start!15594 e!101423))

(assert (=> start!15594 true))

(declare-fun b!155253 () Bool)

(declare-fun res!73306 () Bool)

(assert (=> b!155253 (=> (not res!73306) (not e!101422))))

(assert (=> b!155253 (= res!73306 (and (= (size!2726 (_values!3067 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7503 thiss!1248))) (= (size!2725 (_keys!4859 thiss!1248)) (size!2726 (_values!3067 thiss!1248))) (bvsge (mask!7503 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2825 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2825 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2825 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2825 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2825 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2825 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2825 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155254 () Bool)

(assert (=> b!155254 (= e!101426 tp_is_empty!3063)))

(declare-fun b!155255 () Bool)

(declare-fun res!73305 () Bool)

(assert (=> b!155255 (=> (not res!73305) (not e!101422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5179 (_ BitVec 32)) Bool)

(assert (=> b!155255 (= res!73305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4859 thiss!1248) (mask!7503 thiss!1248)))))

(assert (= (and start!15594 res!73309) b!155251))

(assert (= (and b!155251 res!73307) b!155247))

(assert (= (and b!155247 res!73308) b!155253))

(assert (= (and b!155253 res!73306) b!155255))

(assert (= (and b!155255 res!73305) b!155249))

(assert (= (and b!155248 condMapEmpty!5237) mapIsEmpty!5237))

(assert (= (and b!155248 (not condMapEmpty!5237)) mapNonEmpty!5237))

(get-info :version)

(assert (= (and mapNonEmpty!5237 ((_ is ValueCellFull!1188) mapValue!5237)) b!155252))

(assert (= (and b!155248 ((_ is ValueCellFull!1188) mapDefault!5237)) b!155254))

(assert (= b!155250 b!155248))

(assert (= start!15594 b!155250))

(declare-fun m!189239 () Bool)

(assert (=> mapNonEmpty!5237 m!189239))

(declare-fun m!189241 () Bool)

(assert (=> start!15594 m!189241))

(declare-fun m!189243 () Bool)

(assert (=> b!155249 m!189243))

(declare-fun m!189245 () Bool)

(assert (=> b!155247 m!189245))

(declare-fun m!189247 () Bool)

(assert (=> b!155255 m!189247))

(declare-fun m!189249 () Bool)

(assert (=> b!155250 m!189249))

(declare-fun m!189251 () Bool)

(assert (=> b!155250 m!189251))

(check-sat b_and!9675 (not b!155249) (not start!15594) tp_is_empty!3063 (not b!155247) (not b!155255) (not b!155250) (not b_next!3261) (not mapNonEmpty!5237))
(check-sat b_and!9675 (not b_next!3261))
