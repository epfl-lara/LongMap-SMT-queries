; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77296 () Bool)

(assert start!77296)

(declare-fun b!901676 () Bool)

(declare-fun b_free!16081 () Bool)

(declare-fun b_next!16081 () Bool)

(assert (=> b!901676 (= b_free!16081 (not b_next!16081))))

(declare-fun tp!56346 () Bool)

(declare-fun b_and!26419 () Bool)

(assert (=> b!901676 (= tp!56346 b_and!26419)))

(declare-fun res!608715 () Bool)

(declare-fun e!504824 () Bool)

(assert (=> start!77296 (=> (not res!608715) (not e!504824))))

(declare-datatypes ((array!52876 0))(
  ( (array!52877 (arr!25405 (Array (_ BitVec 32) (_ BitVec 64))) (size!25864 (_ BitVec 32))) )
))
(declare-datatypes ((V!29511 0))(
  ( (V!29512 (val!9255 Int)) )
))
(declare-datatypes ((ValueCell!8723 0))(
  ( (ValueCellFull!8723 (v!11756 V!29511)) (EmptyCell!8723) )
))
(declare-datatypes ((array!52878 0))(
  ( (array!52879 (arr!25406 (Array (_ BitVec 32) ValueCell!8723)) (size!25865 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4462 0))(
  ( (LongMapFixedSize!4463 (defaultEntry!5474 Int) (mask!26289 (_ BitVec 32)) (extraKeys!5204 (_ BitVec 32)) (zeroValue!5308 V!29511) (minValue!5308 V!29511) (_size!2286 (_ BitVec 32)) (_keys!10289 array!52876) (_values!5495 array!52878) (_vacant!2286 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4462)

(declare-fun valid!1713 (LongMapFixedSize!4462) Bool)

(assert (=> start!77296 (= res!608715 (valid!1713 thiss!1181))))

(assert (=> start!77296 e!504824))

(declare-fun e!504830 () Bool)

(assert (=> start!77296 e!504830))

(assert (=> start!77296 true))

(declare-fun mapNonEmpty!29302 () Bool)

(declare-fun mapRes!29302 () Bool)

(declare-fun tp!56345 () Bool)

(declare-fun e!504828 () Bool)

(assert (=> mapNonEmpty!29302 (= mapRes!29302 (and tp!56345 e!504828))))

(declare-fun mapKey!29302 () (_ BitVec 32))

(declare-fun mapRest!29302 () (Array (_ BitVec 32) ValueCell!8723))

(declare-fun mapValue!29302 () ValueCell!8723)

(assert (=> mapNonEmpty!29302 (= (arr!25406 (_values!5495 thiss!1181)) (store mapRest!29302 mapKey!29302 mapValue!29302))))

(declare-fun bm!40167 () Bool)

(declare-fun call!40171 () V!29511)

(declare-fun call!40170 () V!29511)

(assert (=> bm!40167 (= call!40171 call!40170)))

(declare-fun mapIsEmpty!29302 () Bool)

(assert (=> mapIsEmpty!29302 mapRes!29302))

(declare-fun b!901661 () Bool)

(declare-fun res!608714 () Bool)

(declare-fun e!504827 () Bool)

(assert (=> b!901661 (=> (not res!608714) (not e!504827))))

(assert (=> b!901661 (= res!608714 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!504832 () Bool)

(assert (=> b!901661 (= e!504832 e!504827)))

(declare-fun b!901662 () Bool)

(declare-fun res!608718 () Bool)

(assert (=> b!901662 (=> (not res!608718) (not e!504824))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901662 (= res!608718 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901663 () Bool)

(declare-fun e!504831 () Bool)

(declare-fun e!504829 () Bool)

(assert (=> b!901663 (= e!504831 (and e!504829 mapRes!29302))))

(declare-fun condMapEmpty!29302 () Bool)

(declare-fun mapDefault!29302 () ValueCell!8723)

