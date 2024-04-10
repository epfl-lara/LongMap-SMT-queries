; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9206 () Bool)

(assert start!9206)

(declare-fun b!65462 () Bool)

(declare-fun b_free!2029 () Bool)

(declare-fun b_next!2029 () Bool)

(assert (=> b!65462 (= b_free!2029 (not b_next!2029))))

(declare-fun tp!8237 () Bool)

(declare-fun b_and!4011 () Bool)

(assert (=> b!65462 (= tp!8237 b_and!4011)))

(declare-fun b!65448 () Bool)

(declare-fun b_free!2031 () Bool)

(declare-fun b_next!2031 () Bool)

(assert (=> b!65448 (= b_free!2031 (not b_next!2031))))

(declare-fun tp!8238 () Bool)

(declare-fun b_and!4013 () Bool)

(assert (=> b!65448 (= tp!8238 b_and!4013)))

(declare-fun b!65444 () Bool)

(declare-fun e!42870 () Bool)

(declare-fun e!42862 () Bool)

(assert (=> b!65444 (= e!42870 e!42862)))

(declare-fun res!35602 () Bool)

(assert (=> b!65444 (=> (not res!35602) (not e!42862))))

(declare-datatypes ((V!2889 0))(
  ( (V!2890 (val!1260 Int)) )
))
(declare-datatypes ((array!3799 0))(
  ( (array!3800 (arr!1815 (Array (_ BitVec 32) (_ BitVec 64))) (size!2050 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!872 0))(
  ( (ValueCellFull!872 (v!2456 V!2889)) (EmptyCell!872) )
))
(declare-datatypes ((array!3801 0))(
  ( (array!3802 (arr!1816 (Array (_ BitVec 32) ValueCell!872)) (size!2051 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!652 0))(
  ( (LongMapFixedSize!653 (defaultEntry!2134 Int) (mask!6062 (_ BitVec 32)) (extraKeys!2005 (_ BitVec 32)) (zeroValue!2042 V!2889) (minValue!2042 V!2889) (_size!375 (_ BitVec 32)) (_keys!3774 array!3799) (_values!2117 array!3801) (_vacant!375 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2064 0))(
  ( (tuple2!2065 (_1!1043 Bool) (_2!1043 LongMapFixedSize!652)) )
))
(declare-fun lt!28114 () tuple2!2064)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65444 (= res!35602 (and (_1!1043 lt!28114) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1808 0))(
  ( (Unit!1809) )
))
(declare-fun lt!28111 () Unit!1808)

(declare-fun e!42866 () Unit!1808)

(assert (=> b!65444 (= lt!28111 e!42866)))

(declare-datatypes ((Cell!460 0))(
  ( (Cell!461 (v!2457 LongMapFixedSize!652)) )
))
(declare-datatypes ((LongMap!460 0))(
  ( (LongMap!461 (underlying!241 Cell!460)) )
))
(declare-fun thiss!992 () LongMap!460)

(declare-fun c!9017 () Bool)

(declare-datatypes ((tuple2!2066 0))(
  ( (tuple2!2067 (_1!1044 (_ BitVec 64)) (_2!1044 V!2889)) )
))
(declare-datatypes ((List!1452 0))(
  ( (Nil!1449) (Cons!1448 (h!2032 tuple2!2066) (t!4894 List!1452)) )
))
(declare-datatypes ((ListLongMap!1387 0))(
  ( (ListLongMap!1388 (toList!709 List!1452)) )
))
(declare-fun lt!28115 () ListLongMap!1387)

(declare-fun contains!702 (ListLongMap!1387 (_ BitVec 64)) Bool)

(assert (=> b!65444 (= c!9017 (contains!702 lt!28115 (select (arr!1815 (_keys!3774 (v!2457 (underlying!241 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!652)

(declare-fun update!83 (LongMapFixedSize!652 (_ BitVec 64) V!2889) tuple2!2064)

(declare-fun get!1103 (ValueCell!872 V!2889) V!2889)

(declare-fun dynLambda!314 (Int (_ BitVec 64)) V!2889)

(assert (=> b!65444 (= lt!28114 (update!83 newMap!16 (select (arr!1815 (_keys!3774 (v!2457 (underlying!241 thiss!992)))) from!355) (get!1103 (select (arr!1816 (_values!2117 (v!2457 (underlying!241 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2134 (v!2457 (underlying!241 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65445 () Bool)

(declare-fun e!42869 () Bool)

(declare-fun e!42868 () Bool)

(declare-fun mapRes!3011 () Bool)

(assert (=> b!65445 (= e!42869 (and e!42868 mapRes!3011))))

(declare-fun condMapEmpty!3012 () Bool)

(declare-fun mapDefault!3012 () ValueCell!872)

