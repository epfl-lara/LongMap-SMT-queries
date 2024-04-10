; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14572 () Bool)

(assert start!14572)

(declare-fun b!137592 () Bool)

(declare-fun b_free!2961 () Bool)

(declare-fun b_next!2961 () Bool)

(assert (=> b!137592 (= b_free!2961 (not b_next!2961))))

(declare-fun tp!11344 () Bool)

(declare-fun b_and!8531 () Bool)

(assert (=> b!137592 (= tp!11344 b_and!8531)))

(declare-fun b!137595 () Bool)

(declare-fun b_free!2963 () Bool)

(declare-fun b_next!2963 () Bool)

(assert (=> b!137595 (= b_free!2963 (not b_next!2963))))

(declare-fun tp!11346 () Bool)

(declare-fun b_and!8533 () Bool)

(assert (=> b!137595 (= tp!11346 b_and!8533)))

(declare-fun b!137585 () Bool)

(declare-fun e!89608 () Bool)

(declare-fun tp_is_empty!2897 () Bool)

(assert (=> b!137585 (= e!89608 tp_is_empty!2897)))

(declare-fun b!137586 () Bool)

(declare-fun e!89611 () Bool)

(declare-fun e!89603 () Bool)

(assert (=> b!137586 (= e!89611 e!89603)))

(declare-fun mapNonEmpty!4721 () Bool)

(declare-fun mapRes!4721 () Bool)

(declare-fun tp!11345 () Bool)

(declare-fun e!89597 () Bool)

(assert (=> mapNonEmpty!4721 (= mapRes!4721 (and tp!11345 e!89597))))

(declare-datatypes ((V!3509 0))(
  ( (V!3510 (val!1493 Int)) )
))
(declare-datatypes ((array!4825 0))(
  ( (array!4826 (arr!2281 (Array (_ BitVec 32) (_ BitVec 64))) (size!2552 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1105 0))(
  ( (ValueCellFull!1105 (v!3238 V!3509)) (EmptyCell!1105) )
))
(declare-datatypes ((array!4827 0))(
  ( (array!4828 (arr!2282 (Array (_ BitVec 32) ValueCell!1105)) (size!2553 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1118 0))(
  ( (LongMapFixedSize!1119 (defaultEntry!2911 Int) (mask!7235 (_ BitVec 32)) (extraKeys!2668 (_ BitVec 32)) (zeroValue!2762 V!3509) (minValue!2762 V!3509) (_size!608 (_ BitVec 32)) (_keys!4668 array!4825) (_values!2894 array!4827) (_vacant!608 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!906 0))(
  ( (Cell!907 (v!3239 LongMapFixedSize!1118)) )
))
(declare-datatypes ((LongMap!906 0))(
  ( (LongMap!907 (underlying!464 Cell!906)) )
))
(declare-fun thiss!992 () LongMap!906)

(declare-fun mapValue!4722 () ValueCell!1105)

(declare-fun mapRest!4721 () (Array (_ BitVec 32) ValueCell!1105))

(declare-fun mapKey!4722 () (_ BitVec 32))

(assert (=> mapNonEmpty!4721 (= (arr!2282 (_values!2894 (v!3239 (underlying!464 thiss!992)))) (store mapRest!4721 mapKey!4722 mapValue!4722))))

(declare-fun b!137587 () Bool)

(declare-fun e!89610 () Bool)

(declare-fun e!89598 () Bool)

(assert (=> b!137587 (= e!89610 e!89598)))

(declare-fun res!65955 () Bool)

(assert (=> b!137587 (=> (not res!65955) (not e!89598))))

(declare-datatypes ((tuple2!2658 0))(
  ( (tuple2!2659 (_1!1340 (_ BitVec 64)) (_2!1340 V!3509)) )
))
(declare-datatypes ((List!1728 0))(
  ( (Nil!1725) (Cons!1724 (h!2331 tuple2!2658) (t!6240 List!1728)) )
))
(declare-datatypes ((ListLongMap!1723 0))(
  ( (ListLongMap!1724 (toList!877 List!1728)) )
))
(declare-fun lt!71968 () ListLongMap!1723)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!71966 () ListLongMap!1723)

(assert (=> b!137587 (= res!65955 (and (= lt!71968 lt!71966) (not (= (select (arr!2281 (_keys!4668 (v!3239 (underlying!464 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2281 (_keys!4668 (v!3239 (underlying!464 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1118)

(declare-fun map!1422 (LongMapFixedSize!1118) ListLongMap!1723)

(assert (=> b!137587 (= lt!71966 (map!1422 newMap!16))))

(declare-fun getCurrentListMap!553 (array!4825 array!4827 (_ BitVec 32) (_ BitVec 32) V!3509 V!3509 (_ BitVec 32) Int) ListLongMap!1723)

(assert (=> b!137587 (= lt!71968 (getCurrentListMap!553 (_keys!4668 (v!3239 (underlying!464 thiss!992))) (_values!2894 (v!3239 (underlying!464 thiss!992))) (mask!7235 (v!3239 (underlying!464 thiss!992))) (extraKeys!2668 (v!3239 (underlying!464 thiss!992))) (zeroValue!2762 (v!3239 (underlying!464 thiss!992))) (minValue!2762 (v!3239 (underlying!464 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2911 (v!3239 (underlying!464 thiss!992)))))))

(declare-fun b!137588 () Bool)

(declare-fun res!65956 () Bool)

(assert (=> b!137588 (=> (not res!65956) (not e!89610))))

(declare-fun valid!539 (LongMapFixedSize!1118) Bool)

(assert (=> b!137588 (= res!65956 (valid!539 newMap!16))))

(declare-fun b!137589 () Bool)

(declare-fun e!89607 () Bool)

(declare-fun e!89605 () Bool)

(assert (=> b!137589 (= e!89607 (and e!89605 mapRes!4721))))

(declare-fun condMapEmpty!4722 () Bool)

(declare-fun mapDefault!4721 () ValueCell!1105)

