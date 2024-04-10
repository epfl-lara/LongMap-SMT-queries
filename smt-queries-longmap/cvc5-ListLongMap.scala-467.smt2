; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8870 () Bool)

(assert start!8870)

(declare-fun b!62211 () Bool)

(declare-fun b_free!1993 () Bool)

(declare-fun b_next!1993 () Bool)

(assert (=> b!62211 (= b_free!1993 (not b_next!1993))))

(declare-fun tp!8108 () Bool)

(declare-fun b_and!3803 () Bool)

(assert (=> b!62211 (= tp!8108 b_and!3803)))

(declare-fun b!62204 () Bool)

(declare-fun b_free!1995 () Bool)

(declare-fun b_next!1995 () Bool)

(assert (=> b!62204 (= b_free!1995 (not b_next!1995))))

(declare-fun tp!8107 () Bool)

(declare-fun b_and!3805 () Bool)

(assert (=> b!62204 (= tp!8107 b_and!3805)))

(declare-fun b!62199 () Bool)

(declare-fun e!40834 () Bool)

(declare-fun tp_is_empty!2413 () Bool)

(assert (=> b!62199 (= e!40834 tp_is_empty!2413)))

(declare-fun b!62200 () Bool)

(declare-fun e!40846 () Bool)

(declare-datatypes ((V!2865 0))(
  ( (V!2866 (val!1251 Int)) )
))
(declare-datatypes ((array!3757 0))(
  ( (array!3758 (arr!1797 (Array (_ BitVec 32) (_ BitVec 64))) (size!2029 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!863 0))(
  ( (ValueCellFull!863 (v!2416 V!2865)) (EmptyCell!863) )
))
(declare-datatypes ((array!3759 0))(
  ( (array!3760 (arr!1798 (Array (_ BitVec 32) ValueCell!863)) (size!2030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!634 0))(
  ( (LongMapFixedSize!635 (defaultEntry!2087 Int) (mask!5993 (_ BitVec 32)) (extraKeys!1966 (_ BitVec 32)) (zeroValue!1999 V!2865) (minValue!1999 V!2865) (_size!366 (_ BitVec 32)) (_keys!3719 array!3757) (_values!2070 array!3759) (_vacant!366 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!442 0))(
  ( (Cell!443 (v!2417 LongMapFixedSize!634)) )
))
(declare-datatypes ((LongMap!442 0))(
  ( (LongMap!443 (underlying!232 Cell!442)) )
))
(declare-fun thiss!992 () LongMap!442)

(assert (=> b!62200 (= e!40846 (and (= (size!2030 (_values!2070 (v!2417 (underlying!232 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5993 (v!2417 (underlying!232 thiss!992))))) (= (size!2029 (_keys!3719 (v!2417 (underlying!232 thiss!992)))) (size!2030 (_values!2070 (v!2417 (underlying!232 thiss!992))))) (bvsge (mask!5993 (v!2417 (underlying!232 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1966 (v!2417 (underlying!232 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1966 (v!2417 (underlying!232 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!62201 () Bool)

(declare-fun e!40841 () Bool)

(assert (=> b!62201 (= e!40841 e!40846)))

(declare-fun res!34185 () Bool)

(assert (=> b!62201 (=> (not res!34185) (not e!40846))))

(declare-datatypes ((tuple2!2034 0))(
  ( (tuple2!2035 (_1!1028 Bool) (_2!1028 LongMapFixedSize!634)) )
))
(declare-fun lt!25938 () tuple2!2034)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!62201 (= res!34185 (and (_1!1028 lt!25938) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1690 0))(
  ( (Unit!1691) )
))
(declare-fun lt!25935 () Unit!1690)

(declare-fun e!40836 () Unit!1690)

(assert (=> b!62201 (= lt!25935 e!40836)))

(declare-datatypes ((tuple2!2036 0))(
  ( (tuple2!2037 (_1!1029 (_ BitVec 64)) (_2!1029 V!2865)) )
))
(declare-datatypes ((List!1438 0))(
  ( (Nil!1435) (Cons!1434 (h!2017 tuple2!2036) (t!4828 List!1438)) )
))
(declare-datatypes ((ListLongMap!1371 0))(
  ( (ListLongMap!1372 (toList!701 List!1438)) )
))
(declare-fun lt!25939 () ListLongMap!1371)

(declare-fun c!8272 () Bool)

(declare-fun contains!689 (ListLongMap!1371 (_ BitVec 64)) Bool)

(assert (=> b!62201 (= c!8272 (contains!689 lt!25939 (select (arr!1797 (_keys!3719 (v!2417 (underlying!232 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!634)

(declare-fun update!76 (LongMapFixedSize!634 (_ BitVec 64) V!2865) tuple2!2034)

(declare-fun get!1081 (ValueCell!863 V!2865) V!2865)

(declare-fun dynLambda!307 (Int (_ BitVec 64)) V!2865)

(assert (=> b!62201 (= lt!25938 (update!76 newMap!16 (select (arr!1797 (_keys!3719 (v!2417 (underlying!232 thiss!992)))) from!355) (get!1081 (select (arr!1798 (_values!2070 (v!2417 (underlying!232 thiss!992)))) from!355) (dynLambda!307 (defaultEntry!2087 (v!2417 (underlying!232 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!62202 () Bool)

(declare-fun e!40833 () Bool)

(declare-fun e!40847 () Bool)

(assert (=> b!62202 (= e!40833 e!40847)))

(declare-fun b!62203 () Bool)

(declare-fun Unit!1692 () Unit!1690)

(assert (=> b!62203 (= e!40836 Unit!1692)))

(declare-fun mapIsEmpty!2937 () Bool)

(declare-fun mapRes!2937 () Bool)

(assert (=> mapIsEmpty!2937 mapRes!2937))

(declare-fun b!62205 () Bool)

(declare-fun e!40848 () Bool)

(declare-fun e!40838 () Bool)

(declare-fun mapRes!2938 () Bool)

(assert (=> b!62205 (= e!40848 (and e!40838 mapRes!2938))))

(declare-fun condMapEmpty!2937 () Bool)

(declare-fun mapDefault!2938 () ValueCell!863)

