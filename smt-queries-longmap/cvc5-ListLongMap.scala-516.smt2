; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12950 () Bool)

(assert start!12950)

(declare-fun b!112751 () Bool)

(declare-fun b_free!2581 () Bool)

(declare-fun b_next!2581 () Bool)

(assert (=> b!112751 (= b_free!2581 (not b_next!2581))))

(declare-fun tp!10095 () Bool)

(declare-fun b_and!6923 () Bool)

(assert (=> b!112751 (= tp!10095 b_and!6923)))

(declare-fun b!112749 () Bool)

(declare-fun b_free!2583 () Bool)

(declare-fun b_next!2583 () Bool)

(assert (=> b!112749 (= b_free!2583 (not b_next!2583))))

(declare-fun tp!10097 () Bool)

(declare-fun b_and!6925 () Bool)

(assert (=> b!112749 (= tp!10097 b_and!6925)))

(declare-fun b!112735 () Bool)

(declare-fun res!55602 () Bool)

(declare-fun e!73283 () Bool)

(assert (=> b!112735 (=> res!55602 e!73283)))

(declare-datatypes ((V!3257 0))(
  ( (V!3258 (val!1398 Int)) )
))
(declare-datatypes ((array!4413 0))(
  ( (array!4414 (arr!2091 (Array (_ BitVec 32) (_ BitVec 64))) (size!2350 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1010 0))(
  ( (ValueCellFull!1010 (v!2956 V!3257)) (EmptyCell!1010) )
))
(declare-datatypes ((array!4415 0))(
  ( (array!4416 (arr!2092 (Array (_ BitVec 32) ValueCell!1010)) (size!2351 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!928 0))(
  ( (LongMapFixedSize!929 (defaultEntry!2660 Int) (mask!6844 (_ BitVec 32)) (extraKeys!2451 (_ BitVec 32)) (zeroValue!2528 V!3257) (minValue!2528 V!3257) (_size!513 (_ BitVec 32)) (_keys!4380 array!4413) (_values!2643 array!4415) (_vacant!513 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!728 0))(
  ( (Cell!729 (v!2957 LongMapFixedSize!928)) )
))
(declare-datatypes ((LongMap!728 0))(
  ( (LongMap!729 (underlying!375 Cell!728)) )
))
(declare-fun thiss!992 () LongMap!728)

(assert (=> b!112735 (= res!55602 (or (not (= (size!2351 (_values!2643 (v!2957 (underlying!375 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6844 (v!2957 (underlying!375 thiss!992)))))) (not (= (size!2350 (_keys!4380 (v!2957 (underlying!375 thiss!992)))) (size!2351 (_values!2643 (v!2957 (underlying!375 thiss!992)))))) (bvslt (mask!6844 (v!2957 (underlying!375 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2451 (v!2957 (underlying!375 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2451 (v!2957 (underlying!375 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!112736 () Bool)

(declare-datatypes ((Unit!3518 0))(
  ( (Unit!3519) )
))
(declare-fun e!73275 () Unit!3518)

(declare-fun Unit!3520 () Unit!3518)

(assert (=> b!112736 (= e!73275 Unit!3520)))

(declare-fun b!112737 () Bool)

(declare-fun e!73269 () Bool)

(declare-fun e!73271 () Bool)

(assert (=> b!112737 (= e!73269 e!73271)))

(declare-fun mapIsEmpty!4043 () Bool)

(declare-fun mapRes!4044 () Bool)

(assert (=> mapIsEmpty!4043 mapRes!4044))

(declare-fun b!112738 () Bool)

(declare-fun e!73277 () Bool)

(declare-fun tp_is_empty!2707 () Bool)

(assert (=> b!112738 (= e!73277 tp_is_empty!2707)))

(declare-fun b!112739 () Bool)

(declare-fun e!73281 () Bool)

(declare-fun e!73273 () Bool)

(assert (=> b!112739 (= e!73281 e!73273)))

(declare-fun res!55600 () Bool)

(assert (=> b!112739 (=> (not res!55600) (not e!73273))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!112739 (= res!55600 (and (not (= (select (arr!2091 (_keys!4380 (v!2957 (underlying!375 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2091 (_keys!4380 (v!2957 (underlying!375 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!58390 () V!3257)

(declare-fun get!1360 (ValueCell!1010 V!3257) V!3257)

(declare-fun dynLambda!393 (Int (_ BitVec 64)) V!3257)

(assert (=> b!112739 (= lt!58390 (get!1360 (select (arr!2092 (_values!2643 (v!2957 (underlying!375 thiss!992)))) from!355) (dynLambda!393 (defaultEntry!2660 (v!2957 (underlying!375 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!55598 () Bool)

(declare-fun e!73284 () Bool)

(assert (=> start!12950 (=> (not res!55598) (not e!73284))))

(declare-fun valid!435 (LongMap!728) Bool)

(assert (=> start!12950 (= res!55598 (valid!435 thiss!992))))

(assert (=> start!12950 e!73284))

(declare-fun e!73274 () Bool)

(assert (=> start!12950 e!73274))

(assert (=> start!12950 true))

(declare-fun e!73280 () Bool)

(assert (=> start!12950 e!73280))

(declare-fun b!112740 () Bool)

(declare-datatypes ((List!1638 0))(
  ( (Nil!1635) (Cons!1634 (h!2234 (_ BitVec 64)) (t!5808 List!1638)) )
))
(declare-fun arrayNoDuplicates!0 (array!4413 (_ BitVec 32) List!1638) Bool)

(assert (=> b!112740 (= e!73283 (arrayNoDuplicates!0 (_keys!4380 (v!2957 (underlying!375 thiss!992))) #b00000000000000000000000000000000 Nil!1635))))

(declare-fun b!112741 () Bool)

(declare-fun e!73285 () Bool)

(declare-fun e!73278 () Bool)

(declare-fun mapRes!4043 () Bool)

(assert (=> b!112741 (= e!73285 (and e!73278 mapRes!4043))))

(declare-fun condMapEmpty!4044 () Bool)

(declare-fun mapDefault!4044 () ValueCell!1010)

