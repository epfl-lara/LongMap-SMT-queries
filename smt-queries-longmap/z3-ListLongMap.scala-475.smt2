; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9586 () Bool)

(assert start!9586)

(declare-fun b!70572 () Bool)

(declare-fun b_free!2093 () Bool)

(declare-fun b_next!2093 () Bool)

(assert (=> b!70572 (= b_free!2093 (not b_next!2093))))

(declare-fun tp!8449 () Bool)

(declare-fun b_and!4335 () Bool)

(assert (=> b!70572 (= tp!8449 b_and!4335)))

(declare-fun b!70578 () Bool)

(declare-fun b_free!2095 () Bool)

(declare-fun b_next!2095 () Bool)

(assert (=> b!70578 (= b_free!2095 (not b_next!2095))))

(declare-fun tp!8450 () Bool)

(declare-fun b_and!4337 () Bool)

(assert (=> b!70578 (= tp!8450 b_and!4337)))

(declare-fun mapNonEmpty!3127 () Bool)

(declare-fun mapRes!3127 () Bool)

(declare-fun tp!8448 () Bool)

(declare-fun e!46205 () Bool)

(assert (=> mapNonEmpty!3127 (= mapRes!3127 (and tp!8448 e!46205))))

(declare-datatypes ((V!2931 0))(
  ( (V!2932 (val!1276 Int)) )
))
(declare-datatypes ((array!3869 0))(
  ( (array!3870 (arr!1847 (Array (_ BitVec 32) (_ BitVec 64))) (size!2084 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!888 0))(
  ( (ValueCellFull!888 (v!2508 V!2931)) (EmptyCell!888) )
))
(declare-datatypes ((array!3871 0))(
  ( (array!3872 (arr!1848 (Array (_ BitVec 32) ValueCell!888)) (size!2085 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!684 0))(
  ( (LongMapFixedSize!685 (defaultEntry!2189 Int) (mask!6144 (_ BitVec 32)) (extraKeys!2052 (_ BitVec 32)) (zeroValue!2093 V!2931) (minValue!2093 V!2931) (_size!391 (_ BitVec 32)) (_keys!3837 array!3869) (_values!2172 array!3871) (_vacant!391 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!488 0))(
  ( (Cell!489 (v!2509 LongMapFixedSize!684)) )
))
(declare-datatypes ((LongMap!488 0))(
  ( (LongMap!489 (underlying!255 Cell!488)) )
))
(declare-fun thiss!992 () LongMap!488)

(declare-fun mapValue!3128 () ValueCell!888)

(declare-fun mapRest!3127 () (Array (_ BitVec 32) ValueCell!888))

(declare-fun mapKey!3128 () (_ BitVec 32))

(assert (=> mapNonEmpty!3127 (= (arr!1848 (_values!2172 (v!2509 (underlying!255 thiss!992)))) (store mapRest!3127 mapKey!3128 mapValue!3128))))

(declare-fun e!46192 () Bool)

(declare-fun e!46190 () Bool)

(declare-fun tp_is_empty!2463 () Bool)

(declare-fun array_inv!1137 (array!3869) Bool)

(declare-fun array_inv!1138 (array!3871) Bool)

(assert (=> b!70572 (= e!46190 (and tp!8449 tp_is_empty!2463 (array_inv!1137 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) (array_inv!1138 (_values!2172 (v!2509 (underlying!255 thiss!992)))) e!46192))))

(declare-fun b!70573 () Bool)

(declare-fun e!46202 () Bool)

(assert (=> b!70573 (= e!46202 e!46190)))

(declare-fun mapIsEmpty!3127 () Bool)

(assert (=> mapIsEmpty!3127 mapRes!3127))

(declare-fun b!70574 () Bool)

(declare-fun e!46195 () Bool)

(declare-fun e!46206 () Bool)

(assert (=> b!70574 (= e!46195 e!46206)))

(declare-fun res!37740 () Bool)

(assert (=> b!70574 (=> (not res!37740) (not e!46206))))

(declare-datatypes ((tuple2!2106 0))(
  ( (tuple2!2107 (_1!1064 Bool) (_2!1064 LongMapFixedSize!684)) )
))
(declare-fun lt!31162 () tuple2!2106)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!70574 (= res!37740 (and (_1!1064 lt!31162) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1996 0))(
  ( (Unit!1997) )
))
(declare-fun lt!31159 () Unit!1996)

(declare-fun e!46194 () Unit!1996)

(assert (=> b!70574 (= lt!31159 e!46194)))

(declare-datatypes ((tuple2!2108 0))(
  ( (tuple2!2109 (_1!1065 (_ BitVec 64)) (_2!1065 V!2931)) )
))
(declare-datatypes ((List!1472 0))(
  ( (Nil!1469) (Cons!1468 (h!2054 tuple2!2108) (t!4996 List!1472)) )
))
(declare-datatypes ((ListLongMap!1411 0))(
  ( (ListLongMap!1412 (toList!721 List!1472)) )
))
(declare-fun lt!31164 () ListLongMap!1411)

(declare-fun c!10229 () Bool)

(declare-fun contains!717 (ListLongMap!1411 (_ BitVec 64)) Bool)

(assert (=> b!70574 (= c!10229 (contains!717 lt!31164 (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355)))))

(declare-fun lt!31161 () V!2931)

(declare-fun newMap!16 () LongMapFixedSize!684)

(declare-fun update!92 (LongMapFixedSize!684 (_ BitVec 64) V!2931) tuple2!2106)

(assert (=> b!70574 (= lt!31162 (update!92 newMap!16 (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) lt!31161))))

(declare-fun b!70575 () Bool)

(declare-fun e!46199 () Bool)

(assert (=> b!70575 (= e!46199 e!46195)))

(declare-fun res!37736 () Bool)

(assert (=> b!70575 (=> (not res!37736) (not e!46195))))

(assert (=> b!70575 (= res!37736 (and (not (= (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1130 (ValueCell!888 V!2931) V!2931)

(declare-fun dynLambda!323 (Int (_ BitVec 64)) V!2931)

(assert (=> b!70575 (= lt!31161 (get!1130 (select (arr!1848 (_values!2172 (v!2509 (underlying!255 thiss!992)))) from!355) (dynLambda!323 (defaultEntry!2189 (v!2509 (underlying!255 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!70576 () Bool)

(declare-fun e!46193 () Bool)

(assert (=> b!70576 (= e!46206 (not e!46193))))

(declare-fun res!37739 () Bool)

(assert (=> b!70576 (=> res!37739 e!46193)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!70576 (= res!37739 (not (validMask!0 (mask!6144 (v!2509 (underlying!255 thiss!992))))))))

(declare-fun lt!31160 () ListLongMap!1411)

(declare-fun lt!31157 () tuple2!2108)

(declare-fun lt!31155 () tuple2!2108)

(declare-fun +!92 (ListLongMap!1411 tuple2!2108) ListLongMap!1411)

(assert (=> b!70576 (= (+!92 (+!92 lt!31160 lt!31157) lt!31155) (+!92 (+!92 lt!31160 lt!31155) lt!31157))))

(assert (=> b!70576 (= lt!31155 (tuple2!2109 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2093 (v!2509 (underlying!255 thiss!992)))))))

(assert (=> b!70576 (= lt!31157 (tuple2!2109 (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) lt!31161))))

(declare-fun lt!31163 () Unit!1996)

(declare-fun addCommutativeForDiffKeys!11 (ListLongMap!1411 (_ BitVec 64) V!2931 (_ BitVec 64) V!2931) Unit!1996)

(assert (=> b!70576 (= lt!31163 (addCommutativeForDiffKeys!11 lt!31160 (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) lt!31161 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2093 (v!2509 (underlying!255 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!57 (array!3869 array!3871 (_ BitVec 32) (_ BitVec 32) V!2931 V!2931 (_ BitVec 32) Int) ListLongMap!1411)

(assert (=> b!70576 (= lt!31160 (getCurrentListMapNoExtraKeys!57 (_keys!3837 (v!2509 (underlying!255 thiss!992))) (_values!2172 (v!2509 (underlying!255 thiss!992))) (mask!6144 (v!2509 (underlying!255 thiss!992))) (extraKeys!2052 (v!2509 (underlying!255 thiss!992))) (zeroValue!2093 (v!2509 (underlying!255 thiss!992))) (minValue!2093 (v!2509 (underlying!255 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2189 (v!2509 (underlying!255 thiss!992)))))))

(declare-fun e!46201 () Bool)

(declare-fun e!46191 () Bool)

(assert (=> b!70578 (= e!46191 (and tp!8450 tp_is_empty!2463 (array_inv!1137 (_keys!3837 newMap!16)) (array_inv!1138 (_values!2172 newMap!16)) e!46201))))

(declare-fun b!70579 () Bool)

(declare-fun e!46203 () Bool)

(assert (=> b!70579 (= e!46192 (and e!46203 mapRes!3127))))

(declare-fun condMapEmpty!3127 () Bool)

(declare-fun mapDefault!3127 () ValueCell!888)

(assert (=> b!70579 (= condMapEmpty!3127 (= (arr!1848 (_values!2172 (v!2509 (underlying!255 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!888)) mapDefault!3127)))))

(declare-fun b!70580 () Bool)

(declare-fun res!37734 () Bool)

(declare-fun e!46204 () Bool)

(assert (=> b!70580 (=> (not res!37734) (not e!46204))))

(assert (=> b!70580 (= res!37734 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6144 newMap!16)) (_size!391 (v!2509 (underlying!255 thiss!992)))))))

(declare-fun b!70581 () Bool)

(assert (=> b!70581 (= e!46205 tp_is_empty!2463)))

(declare-fun b!70582 () Bool)

(declare-fun Unit!1998 () Unit!1996)

(assert (=> b!70582 (= e!46194 Unit!1998)))

(declare-fun b!70583 () Bool)

(assert (=> b!70583 (= e!46204 e!46199)))

(declare-fun res!37733 () Bool)

(assert (=> b!70583 (=> (not res!37733) (not e!46199))))

(declare-fun lt!31156 () ListLongMap!1411)

(assert (=> b!70583 (= res!37733 (= lt!31156 lt!31164))))

(declare-fun map!1144 (LongMapFixedSize!684) ListLongMap!1411)

(assert (=> b!70583 (= lt!31164 (map!1144 newMap!16))))

(declare-fun getCurrentListMap!419 (array!3869 array!3871 (_ BitVec 32) (_ BitVec 32) V!2931 V!2931 (_ BitVec 32) Int) ListLongMap!1411)

(assert (=> b!70583 (= lt!31156 (getCurrentListMap!419 (_keys!3837 (v!2509 (underlying!255 thiss!992))) (_values!2172 (v!2509 (underlying!255 thiss!992))) (mask!6144 (v!2509 (underlying!255 thiss!992))) (extraKeys!2052 (v!2509 (underlying!255 thiss!992))) (zeroValue!2093 (v!2509 (underlying!255 thiss!992))) (minValue!2093 (v!2509 (underlying!255 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2189 (v!2509 (underlying!255 thiss!992)))))))

(declare-fun b!70584 () Bool)

(assert (=> b!70584 (= e!46193 (or (not (= (size!2085 (_values!2172 (v!2509 (underlying!255 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6144 (v!2509 (underlying!255 thiss!992)))))) (not (= (size!2084 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) (size!2085 (_values!2172 (v!2509 (underlying!255 thiss!992)))))) (bvsge (mask!6144 (v!2509 (underlying!255 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!70585 () Bool)

(assert (=> b!70585 (= e!46203 tp_is_empty!2463)))

(declare-fun mapIsEmpty!3128 () Bool)

(declare-fun mapRes!3128 () Bool)

(assert (=> mapIsEmpty!3128 mapRes!3128))

(declare-fun b!70586 () Bool)

(declare-fun e!46197 () Bool)

(assert (=> b!70586 (= e!46197 tp_is_empty!2463)))

(declare-fun b!70587 () Bool)

(declare-fun Unit!1999 () Unit!1996)

(assert (=> b!70587 (= e!46194 Unit!1999)))

(declare-fun lt!31158 () Unit!1996)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!47 (array!3869 array!3871 (_ BitVec 32) (_ BitVec 32) V!2931 V!2931 (_ BitVec 64) (_ BitVec 32) Int) Unit!1996)

(assert (=> b!70587 (= lt!31158 (lemmaListMapContainsThenArrayContainsFrom!47 (_keys!3837 (v!2509 (underlying!255 thiss!992))) (_values!2172 (v!2509 (underlying!255 thiss!992))) (mask!6144 (v!2509 (underlying!255 thiss!992))) (extraKeys!2052 (v!2509 (underlying!255 thiss!992))) (zeroValue!2093 (v!2509 (underlying!255 thiss!992))) (minValue!2093 (v!2509 (underlying!255 thiss!992))) (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2189 (v!2509 (underlying!255 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!70587 (arrayContainsKey!0 (_keys!3837 (v!2509 (underlying!255 thiss!992))) (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!31166 () Unit!1996)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3869 (_ BitVec 32) (_ BitVec 32)) Unit!1996)

(assert (=> b!70587 (= lt!31166 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3837 (v!2509 (underlying!255 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1473 0))(
  ( (Nil!1470) (Cons!1469 (h!2055 (_ BitVec 64)) (t!4997 List!1473)) )
))
(declare-fun arrayNoDuplicates!0 (array!3869 (_ BitVec 32) List!1473) Bool)

(assert (=> b!70587 (arrayNoDuplicates!0 (_keys!3837 (v!2509 (underlying!255 thiss!992))) from!355 Nil!1470)))

(declare-fun lt!31165 () Unit!1996)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3869 (_ BitVec 32) (_ BitVec 64) List!1473) Unit!1996)

(assert (=> b!70587 (= lt!31165 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3837 (v!2509 (underlying!255 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) (Cons!1469 (select (arr!1847 (_keys!3837 (v!2509 (underlying!255 thiss!992)))) from!355) Nil!1470)))))

(assert (=> b!70587 false))

(declare-fun b!70588 () Bool)

(declare-fun e!46198 () Bool)

(assert (=> b!70588 (= e!46201 (and e!46198 mapRes!3128))))

(declare-fun condMapEmpty!3128 () Bool)

(declare-fun mapDefault!3128 () ValueCell!888)

(assert (=> b!70588 (= condMapEmpty!3128 (= (arr!1848 (_values!2172 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!888)) mapDefault!3128)))))

(declare-fun mapNonEmpty!3128 () Bool)

(declare-fun tp!8447 () Bool)

(assert (=> mapNonEmpty!3128 (= mapRes!3128 (and tp!8447 e!46197))))

(declare-fun mapValue!3127 () ValueCell!888)

(declare-fun mapRest!3128 () (Array (_ BitVec 32) ValueCell!888))

(declare-fun mapKey!3127 () (_ BitVec 32))

(assert (=> mapNonEmpty!3128 (= (arr!1848 (_values!2172 newMap!16)) (store mapRest!3128 mapKey!3127 mapValue!3127))))

(declare-fun b!70589 () Bool)

(declare-fun res!37738 () Bool)

(assert (=> b!70589 (=> (not res!37738) (not e!46204))))

(assert (=> b!70589 (= res!37738 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2084 (_keys!3837 (v!2509 (underlying!255 thiss!992)))))))))

(declare-fun res!37735 () Bool)

(assert (=> start!9586 (=> (not res!37735) (not e!46204))))

(declare-fun valid!284 (LongMap!488) Bool)

(assert (=> start!9586 (= res!37735 (valid!284 thiss!992))))

(assert (=> start!9586 e!46204))

(declare-fun e!46200 () Bool)

(assert (=> start!9586 e!46200))

(assert (=> start!9586 true))

(assert (=> start!9586 e!46191))

(declare-fun b!70577 () Bool)

(assert (=> b!70577 (= e!46200 e!46202)))

(declare-fun b!70590 () Bool)

(declare-fun res!37737 () Bool)

(assert (=> b!70590 (=> (not res!37737) (not e!46204))))

(declare-fun valid!285 (LongMapFixedSize!684) Bool)

(assert (=> b!70590 (= res!37737 (valid!285 newMap!16))))

(declare-fun b!70591 () Bool)

(assert (=> b!70591 (= e!46198 tp_is_empty!2463)))

(assert (= (and start!9586 res!37735) b!70589))

(assert (= (and b!70589 res!37738) b!70590))

(assert (= (and b!70590 res!37737) b!70580))

(assert (= (and b!70580 res!37734) b!70583))

(assert (= (and b!70583 res!37733) b!70575))

(assert (= (and b!70575 res!37736) b!70574))

(assert (= (and b!70574 c!10229) b!70587))

(assert (= (and b!70574 (not c!10229)) b!70582))

(assert (= (and b!70574 res!37740) b!70576))

(assert (= (and b!70576 (not res!37739)) b!70584))

(assert (= (and b!70579 condMapEmpty!3127) mapIsEmpty!3127))

(assert (= (and b!70579 (not condMapEmpty!3127)) mapNonEmpty!3127))

(get-info :version)

(assert (= (and mapNonEmpty!3127 ((_ is ValueCellFull!888) mapValue!3128)) b!70581))

(assert (= (and b!70579 ((_ is ValueCellFull!888) mapDefault!3127)) b!70585))

(assert (= b!70572 b!70579))

(assert (= b!70573 b!70572))

(assert (= b!70577 b!70573))

(assert (= start!9586 b!70577))

(assert (= (and b!70588 condMapEmpty!3128) mapIsEmpty!3128))

(assert (= (and b!70588 (not condMapEmpty!3128)) mapNonEmpty!3128))

(assert (= (and mapNonEmpty!3128 ((_ is ValueCellFull!888) mapValue!3127)) b!70586))

(assert (= (and b!70588 ((_ is ValueCellFull!888) mapDefault!3128)) b!70591))

(assert (= b!70578 b!70588))

(assert (= start!9586 b!70578))

(declare-fun b_lambda!3171 () Bool)

(assert (=> (not b_lambda!3171) (not b!70575)))

(declare-fun t!4993 () Bool)

(declare-fun tb!1497 () Bool)

(assert (=> (and b!70572 (= (defaultEntry!2189 (v!2509 (underlying!255 thiss!992))) (defaultEntry!2189 (v!2509 (underlying!255 thiss!992)))) t!4993) tb!1497))

(declare-fun result!2633 () Bool)

(assert (=> tb!1497 (= result!2633 tp_is_empty!2463)))

(assert (=> b!70575 t!4993))

(declare-fun b_and!4339 () Bool)

(assert (= b_and!4335 (and (=> t!4993 result!2633) b_and!4339)))

(declare-fun t!4995 () Bool)

(declare-fun tb!1499 () Bool)

(assert (=> (and b!70578 (= (defaultEntry!2189 newMap!16) (defaultEntry!2189 (v!2509 (underlying!255 thiss!992)))) t!4995) tb!1499))

(declare-fun result!2637 () Bool)

(assert (= result!2637 result!2633))

(assert (=> b!70575 t!4995))

(declare-fun b_and!4341 () Bool)

(assert (= b_and!4337 (and (=> t!4995 result!2637) b_and!4341)))

(declare-fun m!67723 () Bool)

(assert (=> mapNonEmpty!3128 m!67723))

(declare-fun m!67725 () Bool)

(assert (=> b!70587 m!67725))

(declare-fun m!67727 () Bool)

(assert (=> b!70587 m!67727))

(declare-fun m!67729 () Bool)

(assert (=> b!70587 m!67729))

(declare-fun m!67731 () Bool)

(assert (=> b!70587 m!67731))

(assert (=> b!70587 m!67729))

(assert (=> b!70587 m!67729))

(declare-fun m!67733 () Bool)

(assert (=> b!70587 m!67733))

(assert (=> b!70587 m!67729))

(declare-fun m!67735 () Bool)

(assert (=> b!70587 m!67735))

(declare-fun m!67737 () Bool)

(assert (=> start!9586 m!67737))

(assert (=> b!70574 m!67729))

(assert (=> b!70574 m!67729))

(declare-fun m!67739 () Bool)

(assert (=> b!70574 m!67739))

(assert (=> b!70574 m!67729))

(declare-fun m!67741 () Bool)

(assert (=> b!70574 m!67741))

(declare-fun m!67743 () Bool)

(assert (=> mapNonEmpty!3127 m!67743))

(declare-fun m!67745 () Bool)

(assert (=> b!70590 m!67745))

(assert (=> b!70575 m!67729))

(declare-fun m!67747 () Bool)

(assert (=> b!70575 m!67747))

(declare-fun m!67749 () Bool)

(assert (=> b!70575 m!67749))

(assert (=> b!70575 m!67747))

(assert (=> b!70575 m!67749))

(declare-fun m!67751 () Bool)

(assert (=> b!70575 m!67751))

(declare-fun m!67753 () Bool)

(assert (=> b!70578 m!67753))

(declare-fun m!67755 () Bool)

(assert (=> b!70578 m!67755))

(declare-fun m!67757 () Bool)

(assert (=> b!70572 m!67757))

(declare-fun m!67759 () Bool)

(assert (=> b!70572 m!67759))

(declare-fun m!67761 () Bool)

(assert (=> b!70576 m!67761))

(assert (=> b!70576 m!67761))

(declare-fun m!67763 () Bool)

(assert (=> b!70576 m!67763))

(declare-fun m!67765 () Bool)

(assert (=> b!70576 m!67765))

(assert (=> b!70576 m!67729))

(declare-fun m!67767 () Bool)

(assert (=> b!70576 m!67767))

(assert (=> b!70576 m!67729))

(declare-fun m!67769 () Bool)

(assert (=> b!70576 m!67769))

(assert (=> b!70576 m!67767))

(declare-fun m!67771 () Bool)

(assert (=> b!70576 m!67771))

(declare-fun m!67773 () Bool)

(assert (=> b!70576 m!67773))

(declare-fun m!67775 () Bool)

(assert (=> b!70583 m!67775))

(declare-fun m!67777 () Bool)

(assert (=> b!70583 m!67777))

(check-sat b_and!4339 (not mapNonEmpty!3127) b_and!4341 (not b!70583) (not start!9586) (not b_next!2095) tp_is_empty!2463 (not mapNonEmpty!3128) (not b!70576) (not b!70587) (not b!70578) (not b!70572) (not b_lambda!3171) (not b!70574) (not b!70575) (not b_next!2093) (not b!70590))
(check-sat b_and!4339 b_and!4341 (not b_next!2093) (not b_next!2095))
