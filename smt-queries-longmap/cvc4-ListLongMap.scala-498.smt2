; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11274 () Bool)

(assert start!11274)

(declare-fun b!93133 () Bool)

(declare-fun b_free!2373 () Bool)

(declare-fun b_next!2373 () Bool)

(assert (=> b!93133 (= b_free!2373 (not b_next!2373))))

(declare-fun tp!9378 () Bool)

(declare-fun b_and!5675 () Bool)

(assert (=> b!93133 (= tp!9378 b_and!5675)))

(declare-fun b!93120 () Bool)

(declare-fun b_free!2375 () Bool)

(declare-fun b_next!2375 () Bool)

(assert (=> b!93120 (= b_free!2375 (not b_next!2375))))

(declare-fun tp!9380 () Bool)

(declare-fun b_and!5677 () Bool)

(assert (=> b!93120 (= tp!9380 b_and!5677)))

(declare-fun mapIsEmpty!3637 () Bool)

(declare-fun mapRes!3637 () Bool)

(assert (=> mapIsEmpty!3637 mapRes!3637))

(declare-fun b!93116 () Bool)

(declare-fun e!60798 () Bool)

(declare-fun tp_is_empty!2603 () Bool)

(assert (=> b!93116 (= e!60798 tp_is_empty!2603)))

(declare-fun b!93117 () Bool)

(declare-datatypes ((Unit!2777 0))(
  ( (Unit!2778) )
))
(declare-fun e!60793 () Unit!2777)

(declare-fun Unit!2779 () Unit!2777)

(assert (=> b!93117 (= e!60793 Unit!2779)))

(declare-fun b!93118 () Bool)

(declare-fun e!60806 () Bool)

(declare-fun e!60804 () Bool)

(assert (=> b!93118 (= e!60806 e!60804)))

(declare-fun b!93119 () Bool)

(declare-fun e!60802 () Bool)

(declare-fun e!60799 () Bool)

(assert (=> b!93119 (= e!60802 e!60799)))

(declare-fun res!47304 () Bool)

(assert (=> b!93119 (=> res!47304 e!60799)))

(declare-datatypes ((V!3117 0))(
  ( (V!3118 (val!1346 Int)) )
))
(declare-datatypes ((array!4177 0))(
  ( (array!4178 (arr!1987 (Array (_ BitVec 32) (_ BitVec 64))) (size!2235 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!958 0))(
  ( (ValueCellFull!958 (v!2747 V!3117)) (EmptyCell!958) )
))
(declare-datatypes ((array!4179 0))(
  ( (array!4180 (arr!1988 (Array (_ BitVec 32) ValueCell!958)) (size!2236 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!824 0))(
  ( (LongMapFixedSize!825 (defaultEntry!2426 Int) (mask!6496 (_ BitVec 32)) (extraKeys!2255 (_ BitVec 32)) (zeroValue!2313 V!3117) (minValue!2313 V!3117) (_size!461 (_ BitVec 32)) (_keys!4108 array!4177) (_values!2409 array!4179) (_vacant!461 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2298 0))(
  ( (tuple2!2299 (_1!1160 Bool) (_2!1160 LongMapFixedSize!824)) )
))
(declare-fun lt!45947 () tuple2!2298)

(assert (=> b!93119 (= res!47304 (not (_1!1160 lt!45947)))))

(declare-datatypes ((Cell!624 0))(
  ( (Cell!625 (v!2748 LongMapFixedSize!824)) )
))
(declare-datatypes ((LongMap!624 0))(
  ( (LongMap!625 (underlying!323 Cell!624)) )
))
(declare-fun thiss!992 () LongMap!624)

(declare-fun lt!45948 () tuple2!2298)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun repackFrom!13 (LongMap!624 LongMapFixedSize!824 (_ BitVec 32)) tuple2!2298)

(assert (=> b!93119 (= lt!45947 (repackFrom!13 thiss!992 (_2!1160 lt!45948) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun e!60808 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!824)

(declare-fun e!60797 () Bool)

(declare-fun array_inv!1233 (array!4177) Bool)

(declare-fun array_inv!1234 (array!4179) Bool)

(assert (=> b!93120 (= e!60808 (and tp!9380 tp_is_empty!2603 (array_inv!1233 (_keys!4108 newMap!16)) (array_inv!1234 (_values!2409 newMap!16)) e!60797))))

(declare-fun res!47298 () Bool)

(declare-fun e!60792 () Bool)

(assert (=> start!11274 (=> (not res!47298) (not e!60792))))

(declare-fun valid!367 (LongMap!624) Bool)

(assert (=> start!11274 (= res!47298 (valid!367 thiss!992))))

(assert (=> start!11274 e!60792))

(declare-fun e!60791 () Bool)

(assert (=> start!11274 e!60791))

(assert (=> start!11274 true))

(assert (=> start!11274 e!60808))

(declare-fun b!93121 () Bool)

(declare-fun e!60795 () Bool)

(declare-fun mapRes!3638 () Bool)

(assert (=> b!93121 (= e!60797 (and e!60795 mapRes!3638))))

(declare-fun condMapEmpty!3638 () Bool)

(declare-fun mapDefault!3638 () ValueCell!958)

