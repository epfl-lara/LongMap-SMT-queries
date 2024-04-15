; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75828 () Bool)

(assert start!75828)

(declare-fun b!892219 () Bool)

(declare-fun b_free!15817 () Bool)

(declare-fun b_next!15817 () Bool)

(assert (=> b!892219 (= b_free!15817 (not b_next!15817))))

(declare-fun tp!55421 () Bool)

(declare-fun b_and!26031 () Bool)

(assert (=> b!892219 (= tp!55421 b_and!26031)))

(declare-fun b!892212 () Bool)

(declare-fun e!498049 () Bool)

(declare-datatypes ((V!29159 0))(
  ( (V!29160 (val!9123 Int)) )
))
(declare-fun call!39490 () V!29159)

(declare-datatypes ((array!52253 0))(
  ( (array!52254 (arr!25133 (Array (_ BitVec 32) (_ BitVec 64))) (size!25579 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8591 0))(
  ( (ValueCellFull!8591 (v!11595 V!29159)) (EmptyCell!8591) )
))
(declare-datatypes ((array!52255 0))(
  ( (array!52256 (arr!25134 (Array (_ BitVec 32) ValueCell!8591)) (size!25580 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4198 0))(
  ( (LongMapFixedSize!4199 (defaultEntry!5296 Int) (mask!25802 (_ BitVec 32)) (extraKeys!4990 (_ BitVec 32)) (zeroValue!5094 V!29159) (minValue!5094 V!29159) (_size!2154 (_ BitVec 32)) (_keys!9974 array!52253) (_values!5281 array!52255) (_vacant!2154 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4198)

(assert (=> b!892212 (= e!498049 (= call!39490 (minValue!5094 thiss!1181)))))

(declare-fun b!892213 () Bool)

(declare-fun e!498047 () Bool)

(declare-fun tp_is_empty!18145 () Bool)

(assert (=> b!892213 (= e!498047 tp_is_empty!18145)))

(declare-fun b!892214 () Bool)

(declare-fun res!604522 () Bool)

(assert (=> b!892214 (=> (not res!604522) (not e!498049))))

(assert (=> b!892214 (= res!604522 (not (= (bvand (extraKeys!4990 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!498056 () Bool)

(assert (=> b!892214 (= e!498056 e!498049)))

(declare-fun mapNonEmpty!28772 () Bool)

(declare-fun mapRes!28772 () Bool)

(declare-fun tp!55420 () Bool)

(assert (=> mapNonEmpty!28772 (= mapRes!28772 (and tp!55420 e!498047))))

(declare-fun mapKey!28772 () (_ BitVec 32))

(declare-fun mapValue!28772 () ValueCell!8591)

(declare-fun mapRest!28772 () (Array (_ BitVec 32) ValueCell!8591))

(assert (=> mapNonEmpty!28772 (= (arr!25134 (_values!5281 thiss!1181)) (store mapRest!28772 mapKey!28772 mapValue!28772))))

(declare-fun mapIsEmpty!28772 () Bool)

(assert (=> mapIsEmpty!28772 mapRes!28772))

(declare-fun bm!39486 () Bool)

(declare-fun call!39489 () V!29159)

(declare-datatypes ((tuple2!12012 0))(
  ( (tuple2!12013 (_1!6017 (_ BitVec 64)) (_2!6017 V!29159)) )
))
(declare-datatypes ((List!17792 0))(
  ( (Nil!17789) (Cons!17788 (h!18919 tuple2!12012) (t!25084 List!17792)) )
))
(declare-datatypes ((ListLongMap!10699 0))(
  ( (ListLongMap!10700 (toList!5365 List!17792)) )
))
(declare-fun lt!402960 () ListLongMap!10699)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun apply!398 (ListLongMap!10699 (_ BitVec 64)) V!29159)

(assert (=> bm!39486 (= call!39489 (apply!398 lt!402960 key!785))))

(declare-fun res!604525 () Bool)

(declare-fun e!498046 () Bool)

(assert (=> start!75828 (=> (not res!604525) (not e!498046))))

(declare-fun valid!1630 (LongMapFixedSize!4198) Bool)

(assert (=> start!75828 (= res!604525 (valid!1630 thiss!1181))))

(assert (=> start!75828 e!498046))

(declare-fun e!498045 () Bool)

(assert (=> start!75828 e!498045))

(assert (=> start!75828 true))

(declare-fun b!892215 () Bool)

(declare-fun e!498054 () Bool)

(assert (=> b!892215 (= e!498054 (= call!39489 (zeroValue!5094 thiss!1181)))))

(declare-fun b!892216 () Bool)

(declare-fun e!498050 () Bool)

(assert (=> b!892216 (= e!498050 tp_is_empty!18145)))

(declare-fun b!892217 () Bool)

(declare-fun e!498055 () Bool)

(assert (=> b!892217 (= e!498055 (and e!498050 mapRes!28772))))

(declare-fun condMapEmpty!28772 () Bool)

(declare-fun mapDefault!28772 () ValueCell!8591)

(assert (=> b!892217 (= condMapEmpty!28772 (= (arr!25134 (_values!5281 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8591)) mapDefault!28772)))))

(declare-fun b!892218 () Bool)

(declare-fun e!498051 () Bool)

(assert (=> b!892218 (= e!498051 e!498054)))

(declare-fun res!604527 () Bool)

(assert (=> b!892218 (= res!604527 (not (= (bvand (extraKeys!4990 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892218 (=> (not res!604527) (not e!498054))))

(declare-fun array_inv!19804 (array!52253) Bool)

(declare-fun array_inv!19805 (array!52255) Bool)

(assert (=> b!892219 (= e!498045 (and tp!55421 tp_is_empty!18145 (array_inv!19804 (_keys!9974 thiss!1181)) (array_inv!19805 (_values!5281 thiss!1181)) e!498055))))

(declare-fun b!892220 () Bool)

(declare-fun e!498053 () Bool)

(assert (=> b!892220 (= e!498046 (not e!498053))))

(declare-fun res!604526 () Bool)

(assert (=> b!892220 (=> res!604526 e!498053)))

(declare-datatypes ((SeekEntryResult!8853 0))(
  ( (MissingZero!8853 (index!37783 (_ BitVec 32))) (Found!8853 (index!37784 (_ BitVec 32))) (Intermediate!8853 (undefined!9665 Bool) (index!37785 (_ BitVec 32)) (x!75850 (_ BitVec 32))) (Undefined!8853) (MissingVacant!8853 (index!37786 (_ BitVec 32))) )
))
(declare-fun lt!402962 () SeekEntryResult!8853)

(get-info :version)

(assert (=> b!892220 (= res!604526 (not ((_ is Found!8853) lt!402962)))))

(declare-fun e!498052 () Bool)

(assert (=> b!892220 e!498052))

(declare-fun res!604523 () Bool)

(assert (=> b!892220 (=> res!604523 e!498052)))

(assert (=> b!892220 (= res!604523 (not ((_ is Found!8853) lt!402962)))))

(declare-datatypes ((Unit!30338 0))(
  ( (Unit!30339) )
))
(declare-fun lt!402958 () Unit!30338)

(declare-fun lemmaSeekEntryGivesInRangeIndex!54 (array!52253 array!52255 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 64)) Unit!30338)

(assert (=> b!892220 (= lt!402958 (lemmaSeekEntryGivesInRangeIndex!54 (_keys!9974 thiss!1181) (_values!5281 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52253 (_ BitVec 32)) SeekEntryResult!8853)

(assert (=> b!892220 (= lt!402962 (seekEntry!0 key!785 (_keys!9974 thiss!1181) (mask!25802 thiss!1181)))))

(declare-fun b!892221 () Bool)

(declare-fun get!13234 (ValueCell!8591 V!29159) V!29159)

(declare-fun dynLambda!1289 (Int (_ BitVec 64)) V!29159)

(assert (=> b!892221 (= e!498056 (= call!39490 (get!13234 (select (arr!25134 (_values!5281 thiss!1181)) (index!37784 lt!402962)) (dynLambda!1289 (defaultEntry!5296 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!39487 () Bool)

(assert (=> bm!39487 (= call!39490 call!39489)))

(declare-fun b!892222 () Bool)

(declare-fun res!604524 () Bool)

(assert (=> b!892222 (=> (not res!604524) (not e!498046))))

(assert (=> b!892222 (= res!604524 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892223 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892223 (= e!498052 (inRange!0 (index!37784 lt!402962) (mask!25802 thiss!1181)))))

(declare-fun b!892224 () Bool)

(assert (=> b!892224 (= e!498051 e!498056)))

(declare-fun c!93886 () Bool)

(assert (=> b!892224 (= c!93886 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892225 () Bool)

(assert (=> b!892225 (= e!498053 true)))

(assert (=> b!892225 e!498051))

(declare-fun c!93885 () Bool)

(assert (=> b!892225 (= c!93885 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!402961 () Unit!30338)

(declare-fun lemmaKeyInListMapThenSameValueInArray!3 (array!52253 array!52255 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 64) (_ BitVec 32) Int) Unit!30338)

(assert (=> b!892225 (= lt!402961 (lemmaKeyInListMapThenSameValueInArray!3 (_keys!9974 thiss!1181) (_values!5281 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) key!785 (index!37784 lt!402962) (defaultEntry!5296 thiss!1181)))))

(declare-fun contains!4335 (ListLongMap!10699 (_ BitVec 64)) Bool)

(assert (=> b!892225 (contains!4335 lt!402960 (select (arr!25133 (_keys!9974 thiss!1181)) (index!37784 lt!402962)))))

(declare-fun getCurrentListMap!2591 (array!52253 array!52255 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 32) Int) ListLongMap!10699)

(assert (=> b!892225 (= lt!402960 (getCurrentListMap!2591 (_keys!9974 thiss!1181) (_values!5281 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5296 thiss!1181)))))

(declare-fun lt!402959 () Unit!30338)

(declare-fun lemmaValidKeyInArrayIsInListMap!227 (array!52253 array!52255 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 32) Int) Unit!30338)

(assert (=> b!892225 (= lt!402959 (lemmaValidKeyInArrayIsInListMap!227 (_keys!9974 thiss!1181) (_values!5281 thiss!1181) (mask!25802 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) (index!37784 lt!402962) (defaultEntry!5296 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892225 (arrayContainsKey!0 (_keys!9974 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402957 () Unit!30338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52253 (_ BitVec 64) (_ BitVec 32)) Unit!30338)

(assert (=> b!892225 (= lt!402957 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9974 thiss!1181) key!785 (index!37784 lt!402962)))))

(assert (= (and start!75828 res!604525) b!892222))

(assert (= (and b!892222 res!604524) b!892220))

(assert (= (and b!892220 (not res!604523)) b!892223))

(assert (= (and b!892220 (not res!604526)) b!892225))

(assert (= (and b!892225 c!93885) b!892218))

(assert (= (and b!892225 (not c!93885)) b!892224))

(assert (= (and b!892218 res!604527) b!892215))

(assert (= (and b!892224 c!93886) b!892214))

(assert (= (and b!892224 (not c!93886)) b!892221))

(assert (= (and b!892214 res!604522) b!892212))

(assert (= (or b!892212 b!892221) bm!39487))

(assert (= (or b!892215 bm!39487) bm!39486))

(assert (= (and b!892217 condMapEmpty!28772) mapIsEmpty!28772))

(assert (= (and b!892217 (not condMapEmpty!28772)) mapNonEmpty!28772))

(assert (= (and mapNonEmpty!28772 ((_ is ValueCellFull!8591) mapValue!28772)) b!892213))

(assert (= (and b!892217 ((_ is ValueCellFull!8591) mapDefault!28772)) b!892216))

(assert (= b!892219 b!892217))

(assert (= start!75828 b!892219))

(declare-fun b_lambda!12865 () Bool)

(assert (=> (not b_lambda!12865) (not b!892221)))

(declare-fun t!25083 () Bool)

(declare-fun tb!5143 () Bool)

(assert (=> (and b!892219 (= (defaultEntry!5296 thiss!1181) (defaultEntry!5296 thiss!1181)) t!25083) tb!5143))

(declare-fun result!10005 () Bool)

(assert (=> tb!5143 (= result!10005 tp_is_empty!18145)))

(assert (=> b!892221 t!25083))

(declare-fun b_and!26033 () Bool)

(assert (= b_and!26031 (and (=> t!25083 result!10005) b_and!26033)))

(declare-fun m!829945 () Bool)

(assert (=> b!892225 m!829945))

(declare-fun m!829947 () Bool)

(assert (=> b!892225 m!829947))

(declare-fun m!829949 () Bool)

(assert (=> b!892225 m!829949))

(declare-fun m!829951 () Bool)

(assert (=> b!892225 m!829951))

(declare-fun m!829953 () Bool)

(assert (=> b!892225 m!829953))

(declare-fun m!829955 () Bool)

(assert (=> b!892225 m!829955))

(declare-fun m!829957 () Bool)

(assert (=> b!892225 m!829957))

(assert (=> b!892225 m!829949))

(declare-fun m!829959 () Bool)

(assert (=> bm!39486 m!829959))

(declare-fun m!829961 () Bool)

(assert (=> b!892220 m!829961))

(declare-fun m!829963 () Bool)

(assert (=> b!892220 m!829963))

(declare-fun m!829965 () Bool)

(assert (=> b!892221 m!829965))

(declare-fun m!829967 () Bool)

(assert (=> b!892221 m!829967))

(assert (=> b!892221 m!829965))

(assert (=> b!892221 m!829967))

(declare-fun m!829969 () Bool)

(assert (=> b!892221 m!829969))

(declare-fun m!829971 () Bool)

(assert (=> start!75828 m!829971))

(declare-fun m!829973 () Bool)

(assert (=> b!892223 m!829973))

(declare-fun m!829975 () Bool)

(assert (=> mapNonEmpty!28772 m!829975))

(declare-fun m!829977 () Bool)

(assert (=> b!892219 m!829977))

(declare-fun m!829979 () Bool)

(assert (=> b!892219 m!829979))

(check-sat tp_is_empty!18145 (not b!892223) b_and!26033 (not b!892225) (not mapNonEmpty!28772) (not b_lambda!12865) (not start!75828) (not b!892221) (not b!892219) (not b_next!15817) (not b!892220) (not bm!39486))
(check-sat b_and!26033 (not b_next!15817))
