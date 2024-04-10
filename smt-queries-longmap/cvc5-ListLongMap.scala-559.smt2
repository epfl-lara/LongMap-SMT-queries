; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15196 () Bool)

(assert start!15196)

(declare-fun b!146016 () Bool)

(declare-fun b_free!3097 () Bool)

(declare-fun b_next!3097 () Bool)

(assert (=> b!146016 (= b_free!3097 (not b_next!3097))))

(declare-fun tp!11795 () Bool)

(declare-fun b_and!9111 () Bool)

(assert (=> b!146016 (= tp!11795 b_and!9111)))

(declare-fun b!146007 () Bool)

(declare-fun b_free!3099 () Bool)

(declare-fun b_next!3099 () Bool)

(assert (=> b!146007 (= b_free!3099 (not b_next!3099))))

(declare-fun tp!11796 () Bool)

(declare-fun b_and!9113 () Bool)

(assert (=> b!146007 (= tp!11796 b_and!9113)))

(declare-fun b!146003 () Bool)

(declare-fun res!69512 () Bool)

(declare-fun e!95186 () Bool)

(assert (=> b!146003 (=> (not res!69512) (not e!95186))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3601 0))(
  ( (V!3602 (val!1527 Int)) )
))
(declare-datatypes ((array!4975 0))(
  ( (array!4976 (arr!2349 (Array (_ BitVec 32) (_ BitVec 64))) (size!2625 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1139 0))(
  ( (ValueCellFull!1139 (v!3344 V!3601)) (EmptyCell!1139) )
))
(declare-datatypes ((array!4977 0))(
  ( (array!4978 (arr!2350 (Array (_ BitVec 32) ValueCell!1139)) (size!2626 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1186 0))(
  ( (LongMapFixedSize!1187 (defaultEntry!3009 Int) (mask!7383 (_ BitVec 32)) (extraKeys!2754 (_ BitVec 32)) (zeroValue!2854 V!3601) (minValue!2854 V!3601) (_size!642 (_ BitVec 32)) (_keys!4778 array!4975) (_values!2992 array!4977) (_vacant!642 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!970 0))(
  ( (Cell!971 (v!3345 LongMapFixedSize!1186)) )
))
(declare-datatypes ((LongMap!970 0))(
  ( (LongMap!971 (underlying!496 Cell!970)) )
))
(declare-fun thiss!992 () LongMap!970)

(assert (=> b!146003 (= res!69512 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2625 (_keys!4778 (v!3345 (underlying!496 thiss!992)))))))))

(declare-fun mapNonEmpty!4967 () Bool)

(declare-fun mapRes!4967 () Bool)

(declare-fun tp!11793 () Bool)

(declare-fun e!95190 () Bool)

(assert (=> mapNonEmpty!4967 (= mapRes!4967 (and tp!11793 e!95190))))

(declare-fun mapRest!4967 () (Array (_ BitVec 32) ValueCell!1139))

(declare-fun mapValue!4968 () ValueCell!1139)

(declare-fun mapKey!4968 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!1186)

(assert (=> mapNonEmpty!4967 (= (arr!2350 (_values!2992 newMap!16)) (store mapRest!4967 mapKey!4968 mapValue!4968))))

(declare-fun b!146004 () Bool)

(declare-fun e!95195 () Bool)

(declare-fun tp_is_empty!2965 () Bool)

(assert (=> b!146004 (= e!95195 tp_is_empty!2965)))

(declare-fun b!146005 () Bool)

(assert (=> b!146005 (= e!95190 tp_is_empty!2965)))

(declare-fun mapIsEmpty!4967 () Bool)

(assert (=> mapIsEmpty!4967 mapRes!4967))

(declare-fun b!146006 () Bool)

(declare-fun e!95187 () Bool)

(assert (=> b!146006 (= e!95187 false)))

(declare-datatypes ((tuple2!2752 0))(
  ( (tuple2!2753 (_1!1387 (_ BitVec 64)) (_2!1387 V!3601)) )
))
(declare-datatypes ((List!1773 0))(
  ( (Nil!1770) (Cons!1769 (h!2377 tuple2!2752) (t!6454 List!1773)) )
))
(declare-datatypes ((ListLongMap!1773 0))(
  ( (ListLongMap!1774 (toList!902 List!1773)) )
))
(declare-fun lt!76775 () ListLongMap!1773)

(declare-fun getCurrentListMapNoExtraKeys!150 (array!4975 array!4977 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 32) Int) ListLongMap!1773)

(assert (=> b!146006 (= lt!76775 (getCurrentListMapNoExtraKeys!150 (_keys!4778 (v!3345 (underlying!496 thiss!992))) (_values!2992 (v!3345 (underlying!496 thiss!992))) (mask!7383 (v!3345 (underlying!496 thiss!992))) (extraKeys!2754 (v!3345 (underlying!496 thiss!992))) (zeroValue!2854 (v!3345 (underlying!496 thiss!992))) (minValue!2854 (v!3345 (underlying!496 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3345 (underlying!496 thiss!992)))))))

(declare-fun e!95184 () Bool)

(declare-fun e!95188 () Bool)

(declare-fun array_inv!1479 (array!4975) Bool)

(declare-fun array_inv!1480 (array!4977) Bool)

(assert (=> b!146007 (= e!95184 (and tp!11796 tp_is_empty!2965 (array_inv!1479 (_keys!4778 newMap!16)) (array_inv!1480 (_values!2992 newMap!16)) e!95188))))

(declare-fun b!146008 () Bool)

(declare-fun e!95192 () Bool)

(assert (=> b!146008 (= e!95186 e!95192)))

(declare-fun res!69513 () Bool)

(assert (=> b!146008 (=> (not res!69513) (not e!95192))))

(declare-fun lt!76770 () ListLongMap!1773)

(declare-fun lt!76771 () ListLongMap!1773)

(assert (=> b!146008 (= res!69513 (and (= lt!76770 lt!76771) (not (= (select (arr!2349 (_keys!4778 (v!3345 (underlying!496 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2349 (_keys!4778 (v!3345 (underlying!496 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1464 (LongMapFixedSize!1186) ListLongMap!1773)

(assert (=> b!146008 (= lt!76771 (map!1464 newMap!16))))

(declare-fun getCurrentListMap!571 (array!4975 array!4977 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 32) Int) ListLongMap!1773)

(assert (=> b!146008 (= lt!76770 (getCurrentListMap!571 (_keys!4778 (v!3345 (underlying!496 thiss!992))) (_values!2992 (v!3345 (underlying!496 thiss!992))) (mask!7383 (v!3345 (underlying!496 thiss!992))) (extraKeys!2754 (v!3345 (underlying!496 thiss!992))) (zeroValue!2854 (v!3345 (underlying!496 thiss!992))) (minValue!2854 (v!3345 (underlying!496 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3345 (underlying!496 thiss!992)))))))

(declare-fun b!146009 () Bool)

(declare-fun e!95189 () Bool)

(declare-fun e!95191 () Bool)

(assert (=> b!146009 (= e!95189 e!95191)))

(declare-fun b!146010 () Bool)

(declare-datatypes ((Unit!4612 0))(
  ( (Unit!4613) )
))
(declare-fun e!95196 () Unit!4612)

(declare-fun Unit!4614 () Unit!4612)

(assert (=> b!146010 (= e!95196 Unit!4614)))

(declare-fun lt!76773 () Unit!4612)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!151 (array!4975 array!4977 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 64) (_ BitVec 32) Int) Unit!4612)

(assert (=> b!146010 (= lt!76773 (lemmaListMapContainsThenArrayContainsFrom!151 (_keys!4778 (v!3345 (underlying!496 thiss!992))) (_values!2992 (v!3345 (underlying!496 thiss!992))) (mask!7383 (v!3345 (underlying!496 thiss!992))) (extraKeys!2754 (v!3345 (underlying!496 thiss!992))) (zeroValue!2854 (v!3345 (underlying!496 thiss!992))) (minValue!2854 (v!3345 (underlying!496 thiss!992))) (select (arr!2349 (_keys!4778 (v!3345 (underlying!496 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3345 (underlying!496 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146010 (arrayContainsKey!0 (_keys!4778 (v!3345 (underlying!496 thiss!992))) (select (arr!2349 (_keys!4778 (v!3345 (underlying!496 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76768 () Unit!4612)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4975 (_ BitVec 32) (_ BitVec 32)) Unit!4612)

(assert (=> b!146010 (= lt!76768 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4778 (v!3345 (underlying!496 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1774 0))(
  ( (Nil!1771) (Cons!1770 (h!2378 (_ BitVec 64)) (t!6455 List!1774)) )
))
(declare-fun arrayNoDuplicates!0 (array!4975 (_ BitVec 32) List!1774) Bool)

(assert (=> b!146010 (arrayNoDuplicates!0 (_keys!4778 (v!3345 (underlying!496 thiss!992))) from!355 Nil!1771)))

(declare-fun lt!76769 () Unit!4612)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4975 (_ BitVec 32) (_ BitVec 64) List!1774) Unit!4612)

(assert (=> b!146010 (= lt!76769 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4778 (v!3345 (underlying!496 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2349 (_keys!4778 (v!3345 (underlying!496 thiss!992)))) from!355) (Cons!1770 (select (arr!2349 (_keys!4778 (v!3345 (underlying!496 thiss!992)))) from!355) Nil!1771)))))

(assert (=> b!146010 false))

(declare-fun b!146011 () Bool)

(declare-fun res!69514 () Bool)

(assert (=> b!146011 (=> (not res!69514) (not e!95186))))

(declare-fun valid!576 (LongMapFixedSize!1186) Bool)

(assert (=> b!146011 (= res!69514 (valid!576 newMap!16))))

(declare-fun res!69511 () Bool)

(assert (=> start!15196 (=> (not res!69511) (not e!95186))))

(declare-fun valid!577 (LongMap!970) Bool)

(assert (=> start!15196 (= res!69511 (valid!577 thiss!992))))

(assert (=> start!15196 e!95186))

(assert (=> start!15196 e!95189))

(assert (=> start!15196 true))

(assert (=> start!15196 e!95184))

(declare-fun b!146012 () Bool)

(declare-fun e!95194 () Bool)

(assert (=> b!146012 (= e!95194 tp_is_empty!2965)))

(declare-fun b!146013 () Bool)

(assert (=> b!146013 (= e!95188 (and e!95194 mapRes!4967))))

(declare-fun condMapEmpty!4967 () Bool)

(declare-fun mapDefault!4967 () ValueCell!1139)

