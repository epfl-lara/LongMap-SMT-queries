; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3632 () Bool)

(assert start!3632)

(declare-fun b!25040 () Bool)

(declare-fun b_free!763 () Bool)

(declare-fun b_next!763 () Bool)

(assert (=> b!25040 (= b_free!763 (not b_next!763))))

(declare-fun tp!3540 () Bool)

(declare-fun b_and!1557 () Bool)

(assert (=> b!25040 (= tp!3540 b_and!1557)))

(declare-fun b!25035 () Bool)

(declare-datatypes ((V!1195 0))(
  ( (V!1196 (val!540 Int)) )
))
(declare-datatypes ((array!1293 0))(
  ( (array!1294 (arr!611 (Array (_ BitVec 32) (_ BitVec 64))) (size!712 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!314 0))(
  ( (ValueCellFull!314 (v!1617 V!1195)) (EmptyCell!314) )
))
(declare-datatypes ((array!1295 0))(
  ( (array!1296 (arr!612 (Array (_ BitVec 32) ValueCell!314)) (size!713 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!214 0))(
  ( (LongMapFixedSize!215 (defaultEntry!1764 Int) (mask!4763 (_ BitVec 32)) (extraKeys!1657 (_ BitVec 32)) (zeroValue!1684 V!1195) (minValue!1684 V!1195) (_size!154 (_ BitVec 32)) (_keys!3190 array!1293) (_values!1749 array!1295) (_vacant!154 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!214 0))(
  ( (Cell!215 (v!1618 LongMapFixedSize!214)) )
))
(declare-datatypes ((tuple2!964 0))(
  ( (tuple2!965 (_1!491 Bool) (_2!491 Cell!214)) )
))
(declare-fun e!16189 () tuple2!964)

(declare-datatypes ((tuple2!966 0))(
  ( (tuple2!967 (_1!492 Bool) (_2!492 LongMapFixedSize!214)) )
))
(declare-fun lt!9686 () tuple2!966)

(assert (=> b!25035 (= e!16189 (tuple2!965 (_1!492 lt!9686) (Cell!215 (_2!492 lt!9686))))))

(declare-fun call!2227 () tuple2!966)

(assert (=> b!25035 (= lt!9686 call!2227)))

(declare-fun b!25036 () Bool)

(declare-fun res!15179 () Bool)

(declare-fun e!16193 () Bool)

(assert (=> b!25036 (=> (not res!15179) (not e!16193))))

(declare-datatypes ((LongMap!214 0))(
  ( (LongMap!215 (underlying!118 Cell!214)) )
))
(declare-fun thiss!938 () LongMap!214)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!25036 (= res!15179 (validMask!0 (mask!4763 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun b!25037 () Bool)

(declare-fun e!16196 () Bool)

(declare-fun tp_is_empty!1027 () Bool)

(assert (=> b!25037 (= e!16196 tp_is_empty!1027)))

(declare-fun b!25038 () Bool)

(declare-fun e!16190 () Bool)

(declare-fun e!16188 () Bool)

(assert (=> b!25038 (= e!16190 e!16188)))

(declare-fun mapNonEmpty!1036 () Bool)

(declare-fun mapRes!1036 () Bool)

(declare-fun tp!3541 () Bool)

(assert (=> mapNonEmpty!1036 (= mapRes!1036 (and tp!3541 e!16196))))

(declare-fun mapKey!1036 () (_ BitVec 32))

(declare-fun mapValue!1036 () ValueCell!314)

(declare-fun mapRest!1036 () (Array (_ BitVec 32) ValueCell!314))

(assert (=> mapNonEmpty!1036 (= (arr!612 (_values!1749 (v!1618 (underlying!118 thiss!938)))) (store mapRest!1036 mapKey!1036 mapValue!1036))))

(declare-fun e!16191 () Bool)

(declare-fun array_inv!411 (array!1293) Bool)

(declare-fun array_inv!412 (array!1295) Bool)

(assert (=> b!25040 (= e!16188 (and tp!3540 tp_is_empty!1027 (array_inv!411 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) (array_inv!412 (_values!1749 (v!1618 (underlying!118 thiss!938)))) e!16191))))

(declare-fun b!25041 () Bool)

(assert (=> b!25041 (= e!16193 (and (= (size!712 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4763 (v!1618 (underlying!118 thiss!938))))) (bvslt (bvsub (size!712 (_keys!3190 (v!1618 (underlying!118 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!25042 () Bool)

(declare-fun e!16197 () Bool)

(assert (=> b!25042 (= e!16197 e!16193)))

(declare-fun res!15178 () Bool)

(assert (=> b!25042 (=> (not res!15178) (not e!16193))))

(declare-fun e!16195 () tuple2!964)

(assert (=> b!25042 (= res!15178 (_1!491 e!16195))))

(declare-fun c!3436 () Bool)

(declare-fun lt!9688 () Bool)

(assert (=> b!25042 (= c!3436 (and (not lt!9688) (not (= (bvand (extraKeys!1657 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!25042 (= lt!9688 (= (bvand (extraKeys!1657 (v!1618 (underlying!118 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!9687 () LongMapFixedSize!214)

(declare-fun getNewLongMapFixedSize!34 ((_ BitVec 32) Int) LongMapFixedSize!214)

(declare-fun computeNewMask!30 (LongMap!214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25042 (= lt!9687 (getNewLongMapFixedSize!34 (computeNewMask!30 thiss!938 (mask!4763 (v!1618 (underlying!118 thiss!938))) (_vacant!154 (v!1618 (underlying!118 thiss!938))) (_size!154 (v!1618 (underlying!118 thiss!938)))) (defaultEntry!1764 (v!1618 (underlying!118 thiss!938)))))))

(declare-fun bm!2224 () Bool)

(declare-fun call!2228 () tuple2!966)

(assert (=> bm!2224 (= call!2227 call!2228)))

(declare-fun b!25043 () Bool)

(declare-fun e!16192 () Bool)

(assert (=> b!25043 (= e!16191 (and e!16192 mapRes!1036))))

(declare-fun condMapEmpty!1036 () Bool)

(declare-fun mapDefault!1036 () ValueCell!314)

