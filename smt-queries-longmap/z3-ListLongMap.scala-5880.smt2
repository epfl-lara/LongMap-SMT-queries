; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75812 () Bool)

(assert start!75812)

(declare-fun b!891843 () Bool)

(declare-fun b_free!15783 () Bool)

(declare-fun b_next!15783 () Bool)

(assert (=> b!891843 (= b_free!15783 (not b_next!15783))))

(declare-fun tp!55317 () Bool)

(declare-fun b_and!26023 () Bool)

(assert (=> b!891843 (= tp!55317 b_and!26023)))

(declare-fun b!891835 () Bool)

(declare-fun e!497732 () Bool)

(declare-fun e!497729 () Bool)

(assert (=> b!891835 (= e!497732 e!497729)))

(declare-fun res!604233 () Bool)

(assert (=> b!891835 (=> res!604233 e!497729)))

(declare-datatypes ((array!52202 0))(
  ( (array!52203 (arr!25107 (Array (_ BitVec 32) (_ BitVec 64))) (size!25551 (_ BitVec 32))) )
))
(declare-datatypes ((V!29113 0))(
  ( (V!29114 (val!9106 Int)) )
))
(declare-datatypes ((ValueCell!8574 0))(
  ( (ValueCellFull!8574 (v!11584 V!29113)) (EmptyCell!8574) )
))
(declare-datatypes ((array!52204 0))(
  ( (array!52205 (arr!25108 (Array (_ BitVec 32) ValueCell!8574)) (size!25552 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4164 0))(
  ( (LongMapFixedSize!4165 (defaultEntry!5279 Int) (mask!25780 (_ BitVec 32)) (extraKeys!4973 (_ BitVec 32)) (zeroValue!5077 V!29113) (minValue!5077 V!29113) (_size!2137 (_ BitVec 32)) (_keys!9962 array!52202) (_values!5264 array!52204) (_vacant!2137 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4164)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891835 (= res!604233 (not (validMask!0 (mask!25780 thiss!1181))))))

(declare-datatypes ((tuple2!11970 0))(
  ( (tuple2!11971 (_1!5996 (_ BitVec 64)) (_2!5996 V!29113)) )
))
(declare-datatypes ((List!17762 0))(
  ( (Nil!17759) (Cons!17758 (h!18889 tuple2!11970) (t!25061 List!17762)) )
))
(declare-datatypes ((ListLongMap!10667 0))(
  ( (ListLongMap!10668 (toList!5349 List!17762)) )
))
(declare-fun lt!402887 () ListLongMap!10667)

(declare-datatypes ((SeekEntryResult!8834 0))(
  ( (MissingZero!8834 (index!37707 (_ BitVec 32))) (Found!8834 (index!37708 (_ BitVec 32))) (Intermediate!8834 (undefined!9646 Bool) (index!37709 (_ BitVec 32)) (x!75786 (_ BitVec 32))) (Undefined!8834) (MissingVacant!8834 (index!37710 (_ BitVec 32))) )
))
(declare-fun lt!402888 () SeekEntryResult!8834)

(declare-fun contains!4351 (ListLongMap!10667 (_ BitVec 64)) Bool)

(assert (=> b!891835 (contains!4351 lt!402887 (select (arr!25107 (_keys!9962 thiss!1181)) (index!37708 lt!402888)))))

(declare-fun getCurrentListMap!2632 (array!52202 array!52204 (_ BitVec 32) (_ BitVec 32) V!29113 V!29113 (_ BitVec 32) Int) ListLongMap!10667)

(assert (=> b!891835 (= lt!402887 (getCurrentListMap!2632 (_keys!9962 thiss!1181) (_values!5264 thiss!1181) (mask!25780 thiss!1181) (extraKeys!4973 thiss!1181) (zeroValue!5077 thiss!1181) (minValue!5077 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5279 thiss!1181)))))

(declare-datatypes ((Unit!30364 0))(
  ( (Unit!30365) )
))
(declare-fun lt!402890 () Unit!30364)

(declare-fun lemmaValidKeyInArrayIsInListMap!221 (array!52202 array!52204 (_ BitVec 32) (_ BitVec 32) V!29113 V!29113 (_ BitVec 32) Int) Unit!30364)

(assert (=> b!891835 (= lt!402890 (lemmaValidKeyInArrayIsInListMap!221 (_keys!9962 thiss!1181) (_values!5264 thiss!1181) (mask!25780 thiss!1181) (extraKeys!4973 thiss!1181) (zeroValue!5077 thiss!1181) (minValue!5077 thiss!1181) (index!37708 lt!402888) (defaultEntry!5279 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891835 (arrayContainsKey!0 (_keys!9962 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402889 () Unit!30364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52202 (_ BitVec 64) (_ BitVec 32)) Unit!30364)

(assert (=> b!891835 (= lt!402889 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9962 thiss!1181) key!785 (index!37708 lt!402888)))))

(declare-fun b!891836 () Bool)

(declare-fun e!497731 () Bool)

(declare-fun tp_is_empty!18111 () Bool)

(assert (=> b!891836 (= e!497731 tp_is_empty!18111)))

(declare-fun mapNonEmpty!28721 () Bool)

(declare-fun mapRes!28721 () Bool)

(declare-fun tp!55318 () Bool)

(declare-fun e!497736 () Bool)

(assert (=> mapNonEmpty!28721 (= mapRes!28721 (and tp!55318 e!497736))))

(declare-fun mapKey!28721 () (_ BitVec 32))

(declare-fun mapValue!28721 () ValueCell!8574)

(declare-fun mapRest!28721 () (Array (_ BitVec 32) ValueCell!8574))

(assert (=> mapNonEmpty!28721 (= (arr!25108 (_values!5264 thiss!1181)) (store mapRest!28721 mapKey!28721 mapValue!28721))))

(declare-fun res!604232 () Bool)

(declare-fun e!497728 () Bool)

(assert (=> start!75812 (=> (not res!604232) (not e!497728))))

(declare-fun valid!1613 (LongMapFixedSize!4164) Bool)

(assert (=> start!75812 (= res!604232 (valid!1613 thiss!1181))))

(assert (=> start!75812 e!497728))

(declare-fun e!497734 () Bool)

(assert (=> start!75812 e!497734))

(assert (=> start!75812 true))

(declare-fun b!891837 () Bool)

(declare-fun e!497735 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891837 (= e!497735 (inRange!0 (index!37708 lt!402888) (mask!25780 thiss!1181)))))

(declare-fun b!891838 () Bool)

(assert (=> b!891838 (= e!497728 (not e!497732))))

(declare-fun res!604229 () Bool)

(assert (=> b!891838 (=> res!604229 e!497732)))

(get-info :version)

(assert (=> b!891838 (= res!604229 (not ((_ is Found!8834) lt!402888)))))

(assert (=> b!891838 e!497735))

(declare-fun res!604231 () Bool)

(assert (=> b!891838 (=> res!604231 e!497735)))

(assert (=> b!891838 (= res!604231 (not ((_ is Found!8834) lt!402888)))))

(declare-fun lt!402892 () Unit!30364)

(declare-fun lemmaSeekEntryGivesInRangeIndex!36 (array!52202 array!52204 (_ BitVec 32) (_ BitVec 32) V!29113 V!29113 (_ BitVec 64)) Unit!30364)

(assert (=> b!891838 (= lt!402892 (lemmaSeekEntryGivesInRangeIndex!36 (_keys!9962 thiss!1181) (_values!5264 thiss!1181) (mask!25780 thiss!1181) (extraKeys!4973 thiss!1181) (zeroValue!5077 thiss!1181) (minValue!5077 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52202 (_ BitVec 32)) SeekEntryResult!8834)

(assert (=> b!891838 (= lt!402888 (seekEntry!0 key!785 (_keys!9962 thiss!1181) (mask!25780 thiss!1181)))))

(declare-fun b!891839 () Bool)

(declare-fun res!604234 () Bool)

(assert (=> b!891839 (=> (not res!604234) (not e!497728))))

(assert (=> b!891839 (= res!604234 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891840 () Bool)

(declare-fun res!604230 () Bool)

(assert (=> b!891840 (=> res!604230 e!497729)))

(assert (=> b!891840 (= res!604230 (or (not (= (size!25552 (_values!5264 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25780 thiss!1181)))) (not (= (size!25551 (_keys!9962 thiss!1181)) (size!25552 (_values!5264 thiss!1181)))) (bvslt (mask!25780 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4973 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4973 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891841 () Bool)

(declare-fun res!604228 () Bool)

(assert (=> b!891841 (=> res!604228 e!497729)))

(declare-datatypes ((List!17763 0))(
  ( (Nil!17760) (Cons!17759 (h!18890 (_ BitVec 64)) (t!25062 List!17763)) )
))
(declare-fun arrayNoDuplicates!0 (array!52202 (_ BitVec 32) List!17763) Bool)

(assert (=> b!891841 (= res!604228 (not (arrayNoDuplicates!0 (_keys!9962 thiss!1181) #b00000000000000000000000000000000 Nil!17760)))))

(declare-fun b!891842 () Bool)

(declare-fun e!497730 () Bool)

(assert (=> b!891842 (= e!497730 (and e!497731 mapRes!28721))))

(declare-fun condMapEmpty!28721 () Bool)

(declare-fun mapDefault!28721 () ValueCell!8574)

(assert (=> b!891842 (= condMapEmpty!28721 (= (arr!25108 (_values!5264 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8574)) mapDefault!28721)))))

(declare-fun array_inv!19726 (array!52202) Bool)

(declare-fun array_inv!19727 (array!52204) Bool)

(assert (=> b!891843 (= e!497734 (and tp!55317 tp_is_empty!18111 (array_inv!19726 (_keys!9962 thiss!1181)) (array_inv!19727 (_values!5264 thiss!1181)) e!497730))))

(declare-fun b!891844 () Bool)

(assert (=> b!891844 (= e!497736 tp_is_empty!18111)))

(declare-fun mapIsEmpty!28721 () Bool)

(assert (=> mapIsEmpty!28721 mapRes!28721))

(declare-fun b!891845 () Bool)

(assert (=> b!891845 (= e!497729 true)))

(declare-fun lt!402891 () Bool)

(assert (=> b!891845 (= lt!402891 (contains!4351 lt!402887 key!785))))

(declare-fun b!891846 () Bool)

(declare-fun res!604235 () Bool)

(assert (=> b!891846 (=> res!604235 e!497729)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52202 (_ BitVec 32)) Bool)

(assert (=> b!891846 (= res!604235 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9962 thiss!1181) (mask!25780 thiss!1181))))))

(assert (= (and start!75812 res!604232) b!891839))

(assert (= (and b!891839 res!604234) b!891838))

(assert (= (and b!891838 (not res!604231)) b!891837))

(assert (= (and b!891838 (not res!604229)) b!891835))

(assert (= (and b!891835 (not res!604233)) b!891840))

(assert (= (and b!891840 (not res!604230)) b!891846))

(assert (= (and b!891846 (not res!604235)) b!891841))

(assert (= (and b!891841 (not res!604228)) b!891845))

(assert (= (and b!891842 condMapEmpty!28721) mapIsEmpty!28721))

(assert (= (and b!891842 (not condMapEmpty!28721)) mapNonEmpty!28721))

(assert (= (and mapNonEmpty!28721 ((_ is ValueCellFull!8574) mapValue!28721)) b!891844))

(assert (= (and b!891842 ((_ is ValueCellFull!8574) mapDefault!28721)) b!891836))

(assert (= b!891843 b!891842))

(assert (= start!75812 b!891843))

(declare-fun m!830125 () Bool)

(assert (=> b!891835 m!830125))

(declare-fun m!830127 () Bool)

(assert (=> b!891835 m!830127))

(declare-fun m!830129 () Bool)

(assert (=> b!891835 m!830129))

(declare-fun m!830131 () Bool)

(assert (=> b!891835 m!830131))

(declare-fun m!830133 () Bool)

(assert (=> b!891835 m!830133))

(assert (=> b!891835 m!830127))

(declare-fun m!830135 () Bool)

(assert (=> b!891835 m!830135))

(declare-fun m!830137 () Bool)

(assert (=> b!891835 m!830137))

(declare-fun m!830139 () Bool)

(assert (=> b!891845 m!830139))

(declare-fun m!830141 () Bool)

(assert (=> b!891843 m!830141))

(declare-fun m!830143 () Bool)

(assert (=> b!891843 m!830143))

(declare-fun m!830145 () Bool)

(assert (=> b!891846 m!830145))

(declare-fun m!830147 () Bool)

(assert (=> b!891837 m!830147))

(declare-fun m!830149 () Bool)

(assert (=> b!891841 m!830149))

(declare-fun m!830151 () Bool)

(assert (=> mapNonEmpty!28721 m!830151))

(declare-fun m!830153 () Bool)

(assert (=> start!75812 m!830153))

(declare-fun m!830155 () Bool)

(assert (=> b!891838 m!830155))

(declare-fun m!830157 () Bool)

(assert (=> b!891838 m!830157))

(check-sat (not b!891837) (not b_next!15783) (not start!75812) tp_is_empty!18111 (not b!891843) (not b!891835) b_and!26023 (not b!891846) (not b!891841) (not b!891845) (not b!891838) (not mapNonEmpty!28721))
(check-sat b_and!26023 (not b_next!15783))
