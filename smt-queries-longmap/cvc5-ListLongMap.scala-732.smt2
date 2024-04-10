; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17006 () Bool)

(assert start!17006)

(declare-fun b!170861 () Bool)

(declare-fun b_free!4231 () Bool)

(declare-fun b_next!4231 () Bool)

(assert (=> b!170861 (= b_free!4231 (not b_next!4231))))

(declare-fun tp!15322 () Bool)

(declare-fun b_and!10645 () Bool)

(assert (=> b!170861 (= tp!15322 b_and!10645)))

(declare-fun res!81230 () Bool)

(declare-fun e!112788 () Bool)

(assert (=> start!17006 (=> (not res!81230) (not e!112788))))

(declare-datatypes ((V!4985 0))(
  ( (V!4986 (val!2046 Int)) )
))
(declare-datatypes ((ValueCell!1658 0))(
  ( (ValueCellFull!1658 (v!3911 V!4985)) (EmptyCell!1658) )
))
(declare-datatypes ((array!7119 0))(
  ( (array!7120 (arr!3387 (Array (_ BitVec 32) (_ BitVec 64))) (size!3680 (_ BitVec 32))) )
))
(declare-datatypes ((array!7121 0))(
  ( (array!7122 (arr!3388 (Array (_ BitVec 32) ValueCell!1658)) (size!3681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2224 0))(
  ( (LongMapFixedSize!2225 (defaultEntry!3554 Int) (mask!8382 (_ BitVec 32)) (extraKeys!3295 (_ BitVec 32)) (zeroValue!3397 V!4985) (minValue!3397 V!4985) (_size!1161 (_ BitVec 32)) (_keys!5386 array!7119) (_values!3537 array!7121) (_vacant!1161 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2224)

(declare-fun valid!946 (LongMapFixedSize!2224) Bool)

(assert (=> start!17006 (= res!81230 (valid!946 thiss!1248))))

(assert (=> start!17006 e!112788))

(declare-fun e!112791 () Bool)

(assert (=> start!17006 e!112791))

(assert (=> start!17006 true))

(declare-fun tp_is_empty!4003 () Bool)

(assert (=> start!17006 tp_is_empty!4003))

(declare-fun b!170860 () Bool)

(declare-fun e!112787 () Bool)

(assert (=> b!170860 (= e!112787 tp_is_empty!4003)))

(declare-fun e!112789 () Bool)

(declare-fun array_inv!2167 (array!7119) Bool)

(declare-fun array_inv!2168 (array!7121) Bool)

(assert (=> b!170861 (= e!112791 (and tp!15322 tp_is_empty!4003 (array_inv!2167 (_keys!5386 thiss!1248)) (array_inv!2168 (_values!3537 thiss!1248)) e!112789))))

(declare-fun b!170862 () Bool)

(declare-fun res!81231 () Bool)

(assert (=> b!170862 (=> (not res!81231) (not e!112788))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170862 (= res!81231 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!112792 () Bool)

(declare-datatypes ((tuple2!3232 0))(
  ( (tuple2!3233 (_1!1627 (_ BitVec 64)) (_2!1627 V!4985)) )
))
(declare-datatypes ((List!2192 0))(
  ( (Nil!2189) (Cons!2188 (h!2805 tuple2!3232) (t!6994 List!2192)) )
))
(declare-datatypes ((ListLongMap!2159 0))(
  ( (ListLongMap!2160 (toList!1095 List!2192)) )
))
(declare-fun lt!85036 () ListLongMap!2159)

(declare-fun b!170863 () Bool)

(declare-fun v!309 () V!4985)

(declare-fun +!243 (ListLongMap!2159 tuple2!3232) ListLongMap!2159)

(declare-fun map!1852 (LongMapFixedSize!2224) ListLongMap!2159)

(assert (=> b!170863 (= e!112792 (= lt!85036 (+!243 (map!1852 thiss!1248) (tuple2!3233 key!828 v!309))))))

(declare-fun b!170864 () Bool)

(declare-fun e!112794 () Bool)

(assert (=> b!170864 (= e!112794 e!112792)))

(declare-fun res!81229 () Bool)

(assert (=> b!170864 (=> (not res!81229) (not e!112792))))

(declare-fun contains!1143 (ListLongMap!2159 (_ BitVec 64)) Bool)

(assert (=> b!170864 (= res!81229 (contains!1143 lt!85036 key!828))))

(declare-fun lt!85034 () LongMapFixedSize!2224)

(assert (=> b!170864 (= lt!85036 (map!1852 lt!85034))))

(declare-fun b!170865 () Bool)

(assert (=> b!170865 (= e!112788 (not e!112794))))

(declare-fun res!81228 () Bool)

(assert (=> b!170865 (=> (not res!81228) (not e!112794))))

(assert (=> b!170865 (= res!81228 (valid!946 lt!85034))))

(assert (=> b!170865 (= lt!85034 (LongMapFixedSize!2225 (defaultEntry!3554 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (_size!1161 thiss!1248) (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (_vacant!1161 thiss!1248)))))

(declare-fun getCurrentListMap!749 (array!7119 array!7121 (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 (_ BitVec 32) Int) ListLongMap!2159)

(assert (=> b!170865 (= (+!243 (getCurrentListMap!749 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!749 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-datatypes ((Unit!5250 0))(
  ( (Unit!5251) )
))
(declare-fun lt!85035 () Unit!5250)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!83 (array!7119 array!7121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 V!4985 Int) Unit!5250)

(assert (=> b!170865 (= lt!85035 (lemmaChangeZeroKeyThenAddPairToListMap!83 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)))))

(declare-fun mapNonEmpty!6797 () Bool)

(declare-fun mapRes!6797 () Bool)

(declare-fun tp!15323 () Bool)

(declare-fun e!112790 () Bool)

(assert (=> mapNonEmpty!6797 (= mapRes!6797 (and tp!15323 e!112790))))

(declare-fun mapValue!6797 () ValueCell!1658)

(declare-fun mapKey!6797 () (_ BitVec 32))

(declare-fun mapRest!6797 () (Array (_ BitVec 32) ValueCell!1658))

(assert (=> mapNonEmpty!6797 (= (arr!3388 (_values!3537 thiss!1248)) (store mapRest!6797 mapKey!6797 mapValue!6797))))

(declare-fun b!170866 () Bool)

(assert (=> b!170866 (= e!112789 (and e!112787 mapRes!6797))))

(declare-fun condMapEmpty!6797 () Bool)

(declare-fun mapDefault!6797 () ValueCell!1658)

