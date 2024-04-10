; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9422 () Bool)

(assert start!9422)

(declare-fun b!68403 () Bool)

(declare-fun b_free!2077 () Bool)

(declare-fun b_next!2077 () Bool)

(assert (=> b!68403 (= b_free!2077 (not b_next!2077))))

(declare-fun tp!8391 () Bool)

(declare-fun b_and!4211 () Bool)

(assert (=> b!68403 (= tp!8391 b_and!4211)))

(declare-fun b!68404 () Bool)

(declare-fun b_free!2079 () Bool)

(declare-fun b_next!2079 () Bool)

(assert (=> b!68404 (= b_free!2079 (not b_next!2079))))

(declare-fun tp!8392 () Bool)

(declare-fun b_and!4213 () Bool)

(assert (=> b!68404 (= tp!8392 b_and!4213)))

(declare-datatypes ((V!2921 0))(
  ( (V!2922 (val!1272 Int)) )
))
(declare-datatypes ((array!3851 0))(
  ( (array!3852 (arr!1839 (Array (_ BitVec 32) (_ BitVec 64))) (size!2075 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!884 0))(
  ( (ValueCellFull!884 (v!2491 V!2921)) (EmptyCell!884) )
))
(declare-datatypes ((array!3853 0))(
  ( (array!3854 (arr!1840 (Array (_ BitVec 32) ValueCell!884)) (size!2076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!676 0))(
  ( (LongMapFixedSize!677 (defaultEntry!2167 Int) (mask!6112 (_ BitVec 32)) (extraKeys!2034 (_ BitVec 32)) (zeroValue!2073 V!2921) (minValue!2073 V!2921) (_size!387 (_ BitVec 32)) (_keys!3811 array!3851) (_values!2150 array!3853) (_vacant!387 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!482 0))(
  ( (Cell!483 (v!2492 LongMapFixedSize!676)) )
))
(declare-datatypes ((LongMap!482 0))(
  ( (LongMap!483 (underlying!252 Cell!482)) )
))
(declare-fun thiss!992 () LongMap!482)

(declare-fun e!44813 () Bool)

(declare-fun e!44820 () Bool)

(declare-fun tp_is_empty!2455 () Bool)

(declare-fun array_inv!1133 (array!3851) Bool)

(declare-fun array_inv!1134 (array!3853) Bool)

(assert (=> b!68403 (= e!44820 (and tp!8391 tp_is_empty!2455 (array_inv!1133 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) (array_inv!1134 (_values!2150 (v!2492 (underlying!252 thiss!992)))) e!44813))))

(declare-fun e!44810 () Bool)

(declare-fun e!44812 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!676)

(assert (=> b!68404 (= e!44812 (and tp!8392 tp_is_empty!2455 (array_inv!1133 (_keys!3811 newMap!16)) (array_inv!1134 (_values!2150 newMap!16)) e!44810))))

(declare-fun mapNonEmpty!3095 () Bool)

(declare-fun mapRes!3095 () Bool)

(declare-fun tp!8394 () Bool)

(declare-fun e!44817 () Bool)

(assert (=> mapNonEmpty!3095 (= mapRes!3095 (and tp!8394 e!44817))))

(declare-fun mapRest!3095 () (Array (_ BitVec 32) ValueCell!884))

(declare-fun mapValue!3096 () ValueCell!884)

(declare-fun mapKey!3095 () (_ BitVec 32))

(assert (=> mapNonEmpty!3095 (= (arr!1840 (_values!2150 (v!2492 (underlying!252 thiss!992)))) (store mapRest!3095 mapKey!3095 mapValue!3096))))

(declare-fun mapIsEmpty!3095 () Bool)

(assert (=> mapIsEmpty!3095 mapRes!3095))

(declare-fun b!68405 () Bool)

(declare-datatypes ((Unit!1915 0))(
  ( (Unit!1916) )
))
(declare-fun e!44823 () Unit!1915)

(declare-fun Unit!1917 () Unit!1915)

(assert (=> b!68405 (= e!44823 Unit!1917)))

(declare-fun b!68406 () Bool)

(assert (=> b!68406 (= e!44817 tp_is_empty!2455)))

(declare-fun b!68407 () Bool)

(declare-fun e!44814 () Bool)

(assert (=> b!68407 (= e!44814 (or (not (= (size!2076 (_values!2150 (v!2492 (underlying!252 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6112 (v!2492 (underlying!252 thiss!992)))))) (= (size!2075 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) (size!2076 (_values!2150 (v!2492 (underlying!252 thiss!992)))))))))

(declare-fun b!68408 () Bool)

(declare-fun res!36818 () Bool)

(declare-fun e!44815 () Bool)

(assert (=> b!68408 (=> (not res!36818) (not e!44815))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!68408 (= res!36818 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2075 (_keys!3811 (v!2492 (underlying!252 thiss!992)))))))))

(declare-fun b!68409 () Bool)

(declare-fun e!44816 () Bool)

(declare-fun e!44827 () Bool)

(assert (=> b!68409 (= e!44816 e!44827)))

(declare-fun res!36815 () Bool)

(assert (=> b!68409 (=> (not res!36815) (not e!44827))))

(assert (=> b!68409 (= res!36815 (and (not (= (select (arr!1839 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1839 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!29853 () V!2921)

(declare-fun get!1123 (ValueCell!884 V!2921) V!2921)

(declare-fun dynLambda!321 (Int (_ BitVec 64)) V!2921)

(assert (=> b!68409 (= lt!29853 (get!1123 (select (arr!1840 (_values!2150 (v!2492 (underlying!252 thiss!992)))) from!355) (dynLambda!321 (defaultEntry!2167 (v!2492 (underlying!252 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!68410 () Bool)

(declare-fun Unit!1918 () Unit!1915)

(assert (=> b!68410 (= e!44823 Unit!1918)))

(declare-fun lt!29862 () Unit!1915)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!45 (array!3851 array!3853 (_ BitVec 32) (_ BitVec 32) V!2921 V!2921 (_ BitVec 64) (_ BitVec 32) Int) Unit!1915)

(assert (=> b!68410 (= lt!29862 (lemmaListMapContainsThenArrayContainsFrom!45 (_keys!3811 (v!2492 (underlying!252 thiss!992))) (_values!2150 (v!2492 (underlying!252 thiss!992))) (mask!6112 (v!2492 (underlying!252 thiss!992))) (extraKeys!2034 (v!2492 (underlying!252 thiss!992))) (zeroValue!2073 (v!2492 (underlying!252 thiss!992))) (minValue!2073 (v!2492 (underlying!252 thiss!992))) (select (arr!1839 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2167 (v!2492 (underlying!252 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!68410 (arrayContainsKey!0 (_keys!3811 (v!2492 (underlying!252 thiss!992))) (select (arr!1839 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!29858 () Unit!1915)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3851 (_ BitVec 32) (_ BitVec 32)) Unit!1915)

(assert (=> b!68410 (= lt!29858 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3811 (v!2492 (underlying!252 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1468 0))(
  ( (Nil!1465) (Cons!1464 (h!2049 (_ BitVec 64)) (t!4967 List!1468)) )
))
(declare-fun arrayNoDuplicates!0 (array!3851 (_ BitVec 32) List!1468) Bool)

(assert (=> b!68410 (arrayNoDuplicates!0 (_keys!3811 (v!2492 (underlying!252 thiss!992))) from!355 Nil!1465)))

(declare-fun lt!29854 () Unit!1915)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3851 (_ BitVec 32) (_ BitVec 64) List!1468) Unit!1915)

(assert (=> b!68410 (= lt!29854 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3811 (v!2492 (underlying!252 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1839 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) from!355) (Cons!1464 (select (arr!1839 (_keys!3811 (v!2492 (underlying!252 thiss!992)))) from!355) Nil!1465)))))

(assert (=> b!68410 false))

(declare-fun mapNonEmpty!3096 () Bool)

(declare-fun mapRes!3096 () Bool)

(declare-fun tp!8393 () Bool)

(declare-fun e!44826 () Bool)

(assert (=> mapNonEmpty!3096 (= mapRes!3096 (and tp!8393 e!44826))))

(declare-fun mapValue!3095 () ValueCell!884)

(declare-fun mapKey!3096 () (_ BitVec 32))

(declare-fun mapRest!3096 () (Array (_ BitVec 32) ValueCell!884))

(assert (=> mapNonEmpty!3096 (= (arr!1840 (_values!2150 newMap!16)) (store mapRest!3096 mapKey!3096 mapValue!3095))))

(declare-fun mapIsEmpty!3096 () Bool)

(assert (=> mapIsEmpty!3096 mapRes!3096))

(declare-fun b!68411 () Bool)

(declare-fun res!36816 () Bool)

(assert (=> b!68411 (=> (not res!36816) (not e!44815))))

(assert (=> b!68411 (= res!36816 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6112 newMap!16)) (_size!387 (v!2492 (underlying!252 thiss!992)))))))

(declare-fun b!68412 () Bool)

(declare-fun e!44819 () Bool)

(assert (=> b!68412 (= e!44813 (and e!44819 mapRes!3095))))

(declare-fun condMapEmpty!3096 () Bool)

(declare-fun mapDefault!3096 () ValueCell!884)

