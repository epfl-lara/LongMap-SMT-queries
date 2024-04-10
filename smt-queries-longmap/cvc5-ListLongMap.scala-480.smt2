; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10130 () Bool)

(assert start!10130)

(declare-fun b!76936 () Bool)

(declare-fun b_free!2149 () Bool)

(declare-fun b_next!2149 () Bool)

(assert (=> b!76936 (= b_free!2149 (not b_next!2149))))

(declare-fun tp!8643 () Bool)

(declare-fun b_and!4699 () Bool)

(assert (=> b!76936 (= tp!8643 b_and!4699)))

(declare-fun b!76947 () Bool)

(declare-fun b_free!2151 () Bool)

(declare-fun b_next!2151 () Bool)

(assert (=> b!76947 (= b_free!2151 (not b_next!2151))))

(declare-fun tp!8644 () Bool)

(declare-fun b_and!4701 () Bool)

(assert (=> b!76947 (= tp!8644 b_and!4701)))

(declare-fun b!76929 () Bool)

(declare-fun res!40462 () Bool)

(declare-fun e!50220 () Bool)

(assert (=> b!76929 (=> res!40462 e!50220)))

(declare-datatypes ((V!2969 0))(
  ( (V!2970 (val!1290 Int)) )
))
(declare-datatypes ((array!3933 0))(
  ( (array!3934 (arr!1875 (Array (_ BitVec 32) (_ BitVec 64))) (size!2116 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!902 0))(
  ( (ValueCellFull!902 (v!2569 V!2969)) (EmptyCell!902) )
))
(declare-datatypes ((array!3935 0))(
  ( (array!3936 (arr!1876 (Array (_ BitVec 32) ValueCell!902)) (size!2117 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!712 0))(
  ( (LongMapFixedSize!713 (defaultEntry!2259 Int) (mask!6248 (_ BitVec 32)) (extraKeys!2110 (_ BitVec 32)) (zeroValue!2157 V!2969) (minValue!2157 V!2969) (_size!405 (_ BitVec 32)) (_keys!3919 array!3933) (_values!2242 array!3935) (_vacant!405 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!514 0))(
  ( (Cell!515 (v!2570 LongMapFixedSize!712)) )
))
(declare-datatypes ((LongMap!514 0))(
  ( (LongMap!515 (underlying!268 Cell!514)) )
))
(declare-fun thiss!992 () LongMap!514)

(assert (=> b!76929 (= res!40462 (or (not (= (size!2117 (_values!2242 (v!2570 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6248 (v!2570 (underlying!268 thiss!992)))))) (not (= (size!2116 (_keys!3919 (v!2570 (underlying!268 thiss!992)))) (size!2117 (_values!2242 (v!2570 (underlying!268 thiss!992)))))) (bvslt (mask!6248 (v!2570 (underlying!268 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2110 (v!2570 (underlying!268 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2110 (v!2570 (underlying!268 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!76930 () Bool)

(declare-fun res!40458 () Bool)

(declare-fun e!50229 () Bool)

(assert (=> b!76930 (=> (not res!40458) (not e!50229))))

(declare-fun newMap!16 () LongMapFixedSize!712)

(declare-fun valid!300 (LongMapFixedSize!712) Bool)

(assert (=> b!76930 (= res!40458 (valid!300 newMap!16))))

(declare-fun b!76931 () Bool)

(declare-fun res!40453 () Bool)

(assert (=> b!76931 (=> res!40453 e!50220)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3933 (_ BitVec 32)) Bool)

(assert (=> b!76931 (= res!40453 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3919 (v!2570 (underlying!268 thiss!992))) (mask!6248 (v!2570 (underlying!268 thiss!992))))))))

(declare-fun res!40460 () Bool)

(assert (=> start!10130 (=> (not res!40460) (not e!50229))))

(declare-fun valid!301 (LongMap!514) Bool)

(assert (=> start!10130 (= res!40460 (valid!301 thiss!992))))

(assert (=> start!10130 e!50229))

(declare-fun e!50235 () Bool)

(assert (=> start!10130 e!50235))

(assert (=> start!10130 true))

(declare-fun e!50233 () Bool)

(assert (=> start!10130 e!50233))

(declare-fun b!76932 () Bool)

(declare-fun res!40459 () Bool)

(assert (=> b!76932 (=> res!40459 e!50220)))

(declare-datatypes ((List!1492 0))(
  ( (Nil!1489) (Cons!1488 (h!2076 (_ BitVec 64)) (t!5098 List!1492)) )
))
(declare-fun arrayNoDuplicates!0 (array!3933 (_ BitVec 32) List!1492) Bool)

(assert (=> b!76932 (= res!40459 (not (arrayNoDuplicates!0 (_keys!3919 (v!2570 (underlying!268 thiss!992))) #b00000000000000000000000000000000 Nil!1489)))))

(declare-fun b!76933 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!76933 (= e!50220 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!76934 () Bool)

(declare-fun e!50230 () Bool)

(assert (=> b!76934 (= e!50235 e!50230)))

(declare-fun b!76935 () Bool)

(declare-fun e!50227 () Bool)

(declare-fun e!50231 () Bool)

(declare-fun mapRes!3240 () Bool)

(assert (=> b!76935 (= e!50227 (and e!50231 mapRes!3240))))

(declare-fun condMapEmpty!3239 () Bool)

(declare-fun mapDefault!3239 () ValueCell!902)

