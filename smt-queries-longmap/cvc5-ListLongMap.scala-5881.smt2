; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75816 () Bool)

(assert start!75816)

(declare-fun b!891918 () Bool)

(declare-fun b_free!15787 () Bool)

(declare-fun b_next!15787 () Bool)

(assert (=> b!891918 (= b_free!15787 (not b_next!15787))))

(declare-fun tp!55329 () Bool)

(declare-fun b_and!26027 () Bool)

(assert (=> b!891918 (= tp!55329 b_and!26027)))

(declare-fun b!891907 () Bool)

(declare-fun e!497788 () Bool)

(declare-fun tp_is_empty!18115 () Bool)

(assert (=> b!891907 (= e!497788 tp_is_empty!18115)))

(declare-fun b!891908 () Bool)

(declare-fun res!604276 () Bool)

(declare-fun e!497785 () Bool)

(assert (=> b!891908 (=> res!604276 e!497785)))

(declare-datatypes ((array!52210 0))(
  ( (array!52211 (arr!25111 (Array (_ BitVec 32) (_ BitVec 64))) (size!25555 (_ BitVec 32))) )
))
(declare-datatypes ((V!29119 0))(
  ( (V!29120 (val!9108 Int)) )
))
(declare-datatypes ((ValueCell!8576 0))(
  ( (ValueCellFull!8576 (v!11586 V!29119)) (EmptyCell!8576) )
))
(declare-datatypes ((array!52212 0))(
  ( (array!52213 (arr!25112 (Array (_ BitVec 32) ValueCell!8576)) (size!25556 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4168 0))(
  ( (LongMapFixedSize!4169 (defaultEntry!5281 Int) (mask!25784 (_ BitVec 32)) (extraKeys!4975 (_ BitVec 32)) (zeroValue!5079 V!29119) (minValue!5079 V!29119) (_size!2139 (_ BitVec 32)) (_keys!9964 array!52210) (_values!5266 array!52212) (_vacant!2139 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4168)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52210 (_ BitVec 32)) Bool)

(assert (=> b!891908 (= res!604276 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9964 thiss!1181) (mask!25784 thiss!1181))))))

(declare-fun b!891909 () Bool)

(declare-fun e!497786 () Bool)

(declare-fun e!497789 () Bool)

(assert (=> b!891909 (= e!497786 (not e!497789))))

(declare-fun res!604279 () Bool)

(assert (=> b!891909 (=> res!604279 e!497789)))

(declare-datatypes ((SeekEntryResult!8836 0))(
  ( (MissingZero!8836 (index!37715 (_ BitVec 32))) (Found!8836 (index!37716 (_ BitVec 32))) (Intermediate!8836 (undefined!9648 Bool) (index!37717 (_ BitVec 32)) (x!75796 (_ BitVec 32))) (Undefined!8836) (MissingVacant!8836 (index!37718 (_ BitVec 32))) )
))
(declare-fun lt!402927 () SeekEntryResult!8836)

(assert (=> b!891909 (= res!604279 (not (is-Found!8836 lt!402927)))))

(declare-fun e!497787 () Bool)

(assert (=> b!891909 e!497787))

(declare-fun res!604280 () Bool)

(assert (=> b!891909 (=> res!604280 e!497787)))

(assert (=> b!891909 (= res!604280 (not (is-Found!8836 lt!402927)))))

(declare-datatypes ((Unit!30368 0))(
  ( (Unit!30369) )
))
(declare-fun lt!402923 () Unit!30368)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!37 (array!52210 array!52212 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 64)) Unit!30368)

(assert (=> b!891909 (= lt!402923 (lemmaSeekEntryGivesInRangeIndex!37 (_keys!9964 thiss!1181) (_values!5266 thiss!1181) (mask!25784 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52210 (_ BitVec 32)) SeekEntryResult!8836)

(assert (=> b!891909 (= lt!402927 (seekEntry!0 key!785 (_keys!9964 thiss!1181) (mask!25784 thiss!1181)))))

(declare-fun b!891910 () Bool)

(assert (=> b!891910 (= e!497785 true)))

(declare-fun lt!402928 () Bool)

(declare-datatypes ((tuple2!11974 0))(
  ( (tuple2!11975 (_1!5998 (_ BitVec 64)) (_2!5998 V!29119)) )
))
(declare-datatypes ((List!17765 0))(
  ( (Nil!17762) (Cons!17761 (h!18892 tuple2!11974) (t!25064 List!17765)) )
))
(declare-datatypes ((ListLongMap!10671 0))(
  ( (ListLongMap!10672 (toList!5351 List!17765)) )
))
(declare-fun lt!402924 () ListLongMap!10671)

(declare-fun contains!4353 (ListLongMap!10671 (_ BitVec 64)) Bool)

(assert (=> b!891910 (= lt!402928 (contains!4353 lt!402924 key!785))))

(declare-fun b!891911 () Bool)

(declare-fun e!497784 () Bool)

(declare-fun mapRes!28727 () Bool)

(assert (=> b!891911 (= e!497784 (and e!497788 mapRes!28727))))

(declare-fun condMapEmpty!28727 () Bool)

(declare-fun mapDefault!28727 () ValueCell!8576)

