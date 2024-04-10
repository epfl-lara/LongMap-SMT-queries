; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16804 () Bool)

(assert start!16804)

(declare-fun b!169314 () Bool)

(declare-fun b_free!4119 () Bool)

(declare-fun b_next!4119 () Bool)

(assert (=> b!169314 (= b_free!4119 (not b_next!4119))))

(declare-fun tp!14961 () Bool)

(declare-fun b_and!10533 () Bool)

(assert (=> b!169314 (= tp!14961 b_and!10533)))

(declare-fun b!169310 () Bool)

(declare-fun b_free!4121 () Bool)

(declare-fun b_next!4121 () Bool)

(assert (=> b!169310 (= b_free!4121 (not b_next!4121))))

(declare-fun tp!14964 () Bool)

(declare-fun b_and!10535 () Bool)

(assert (=> b!169310 (= tp!14964 b_and!10535)))

(declare-fun b!169302 () Bool)

(declare-fun res!80550 () Bool)

(declare-fun e!111527 () Bool)

(assert (=> b!169302 (=> (not res!80550) (not e!111527))))

(declare-datatypes ((V!4861 0))(
  ( (V!4862 (val!2000 Int)) )
))
(declare-datatypes ((ValueCell!1612 0))(
  ( (ValueCellFull!1612 (v!3865 V!4861)) (EmptyCell!1612) )
))
(declare-datatypes ((array!6919 0))(
  ( (array!6920 (arr!3295 (Array (_ BitVec 32) (_ BitVec 64))) (size!3583 (_ BitVec 32))) )
))
(declare-datatypes ((array!6921 0))(
  ( (array!6922 (arr!3296 (Array (_ BitVec 32) ValueCell!1612)) (size!3584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2132 0))(
  ( (LongMapFixedSize!2133 (defaultEntry!3508 Int) (mask!8289 (_ BitVec 32)) (extraKeys!3249 (_ BitVec 32)) (zeroValue!3351 V!4861) (minValue!3351 V!4861) (_size!1115 (_ BitVec 32)) (_keys!5333 array!6919) (_values!3491 array!6921) (_vacant!1115 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3208 0))(
  ( (tuple2!3209 (_1!1615 Bool) (_2!1615 LongMapFixedSize!2132)) )
))
(declare-fun lt!84884 () tuple2!3208)

(assert (=> b!169302 (= res!80550 (_1!1615 lt!84884))))

(declare-fun b!169303 () Bool)

(declare-fun e!111515 () Bool)

(declare-fun e!111520 () Bool)

(assert (=> b!169303 (= e!111515 e!111520)))

(declare-fun res!80547 () Bool)

(assert (=> b!169303 (=> (not res!80547) (not e!111520))))

(declare-datatypes ((SeekEntryResult!522 0))(
  ( (MissingZero!522 (index!4256 (_ BitVec 32))) (Found!522 (index!4257 (_ BitVec 32))) (Intermediate!522 (undefined!1334 Bool) (index!4258 (_ BitVec 32)) (x!18702 (_ BitVec 32))) (Undefined!522) (MissingVacant!522 (index!4259 (_ BitVec 32))) )
))
(declare-fun lt!84886 () SeekEntryResult!522)

(assert (=> b!169303 (= res!80547 (and (not (is-Undefined!522 lt!84886)) (not (is-MissingVacant!522 lt!84886)) (not (is-MissingZero!522 lt!84886)) (not (is-Found!522 lt!84886))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun thiss!1248 () LongMapFixedSize!2132)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6919 (_ BitVec 32)) SeekEntryResult!522)

(assert (=> b!169303 (= lt!84886 (seekEntryOrOpen!0 key!828 (_keys!5333 thiss!1248) (mask!8289 thiss!1248)))))

(declare-fun b!169304 () Bool)

(declare-fun e!111522 () Bool)

(declare-fun e!111519 () Bool)

(declare-fun mapRes!6603 () Bool)

(assert (=> b!169304 (= e!111522 (and e!111519 mapRes!6603))))

(declare-fun condMapEmpty!6602 () Bool)

(declare-fun err!59 () tuple2!3208)

(declare-fun mapDefault!6603 () ValueCell!1612)

