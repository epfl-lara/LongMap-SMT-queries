; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75948 () Bool)

(assert start!75948)

(declare-fun b!892165 () Bool)

(declare-fun b_free!15751 () Bool)

(declare-fun b_next!15751 () Bool)

(assert (=> b!892165 (= b_free!15751 (not b_next!15751))))

(declare-fun tp!55223 () Bool)

(declare-fun b_and!26001 () Bool)

(assert (=> b!892165 (= tp!55223 b_and!26001)))

(declare-fun b!892162 () Bool)

(declare-fun e!497878 () Bool)

(assert (=> b!892162 (= e!497878 true)))

(declare-fun lt!402962 () Bool)

(declare-datatypes ((V!29071 0))(
  ( (V!29072 (val!9090 Int)) )
))
(declare-datatypes ((tuple2!11866 0))(
  ( (tuple2!11867 (_1!5944 (_ BitVec 64)) (_2!5944 V!29071)) )
))
(declare-datatypes ((List!17692 0))(
  ( (Nil!17689) (Cons!17688 (h!18825 tuple2!11866) (t!24983 List!17692)) )
))
(declare-datatypes ((ListLongMap!10565 0))(
  ( (ListLongMap!10566 (toList!5298 List!17692)) )
))
(declare-fun lt!402961 () ListLongMap!10565)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4311 (ListLongMap!10565 (_ BitVec 64)) Bool)

(assert (=> b!892162 (= lt!402962 (contains!4311 lt!402961 key!785))))

(declare-fun b!892163 () Bool)

(declare-fun e!497881 () Bool)

(declare-datatypes ((SeekEntryResult!8778 0))(
  ( (MissingZero!8778 (index!37483 (_ BitVec 32))) (Found!8778 (index!37484 (_ BitVec 32))) (Intermediate!8778 (undefined!9590 Bool) (index!37485 (_ BitVec 32)) (x!75704 (_ BitVec 32))) (Undefined!8778) (MissingVacant!8778 (index!37486 (_ BitVec 32))) )
))
(declare-fun lt!402960 () SeekEntryResult!8778)

(declare-datatypes ((array!52177 0))(
  ( (array!52178 (arr!25090 (Array (_ BitVec 32) (_ BitVec 64))) (size!25535 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8558 0))(
  ( (ValueCellFull!8558 (v!11565 V!29071)) (EmptyCell!8558) )
))
(declare-datatypes ((array!52179 0))(
  ( (array!52180 (arr!25091 (Array (_ BitVec 32) ValueCell!8558)) (size!25536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4132 0))(
  ( (LongMapFixedSize!4133 (defaultEntry!5263 Int) (mask!25797 (_ BitVec 32)) (extraKeys!4957 (_ BitVec 32)) (zeroValue!5061 V!29071) (minValue!5061 V!29071) (_size!2121 (_ BitVec 32)) (_keys!9974 array!52177) (_values!5248 array!52179) (_vacant!2121 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4132)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892163 (= e!497881 (inRange!0 (index!37484 lt!402960) (mask!25797 thiss!1181)))))

(declare-fun b!892164 () Bool)

(declare-fun e!497882 () Bool)

(declare-fun e!497880 () Bool)

(assert (=> b!892164 (= e!497882 (not e!497880))))

(declare-fun res!604195 () Bool)

(assert (=> b!892164 (=> res!604195 e!497880)))

(get-info :version)

(assert (=> b!892164 (= res!604195 (not ((_ is Found!8778) lt!402960)))))

(assert (=> b!892164 e!497881))

(declare-fun res!604191 () Bool)

(assert (=> b!892164 (=> res!604191 e!497881)))

(assert (=> b!892164 (= res!604191 (not ((_ is Found!8778) lt!402960)))))

(declare-datatypes ((Unit!30326 0))(
  ( (Unit!30327) )
))
(declare-fun lt!402965 () Unit!30326)

(declare-fun lemmaSeekEntryGivesInRangeIndex!32 (array!52177 array!52179 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 64)) Unit!30326)

(assert (=> b!892164 (= lt!402965 (lemmaSeekEntryGivesInRangeIndex!32 (_keys!9974 thiss!1181) (_values!5248 thiss!1181) (mask!25797 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52177 (_ BitVec 32)) SeekEntryResult!8778)

(assert (=> b!892164 (= lt!402960 (seekEntry!0 key!785 (_keys!9974 thiss!1181) (mask!25797 thiss!1181)))))

(declare-fun e!497883 () Bool)

(declare-fun tp_is_empty!18079 () Bool)

(declare-fun e!497886 () Bool)

(declare-fun array_inv!19768 (array!52177) Bool)

(declare-fun array_inv!19769 (array!52179) Bool)

(assert (=> b!892165 (= e!497883 (and tp!55223 tp_is_empty!18079 (array_inv!19768 (_keys!9974 thiss!1181)) (array_inv!19769 (_values!5248 thiss!1181)) e!497886))))

(declare-fun b!892166 () Bool)

(assert (=> b!892166 (= e!497880 e!497878)))

(declare-fun res!604188 () Bool)

(assert (=> b!892166 (=> res!604188 e!497878)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892166 (= res!604188 (not (validMask!0 (mask!25797 thiss!1181))))))

(assert (=> b!892166 (contains!4311 lt!402961 (select (arr!25090 (_keys!9974 thiss!1181)) (index!37484 lt!402960)))))

(declare-fun getCurrentListMap!2576 (array!52177 array!52179 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 32) Int) ListLongMap!10565)

(assert (=> b!892166 (= lt!402961 (getCurrentListMap!2576 (_keys!9974 thiss!1181) (_values!5248 thiss!1181) (mask!25797 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5263 thiss!1181)))))

(declare-fun lt!402964 () Unit!30326)

(declare-fun lemmaValidKeyInArrayIsInListMap!206 (array!52177 array!52179 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 32) Int) Unit!30326)

(assert (=> b!892166 (= lt!402964 (lemmaValidKeyInArrayIsInListMap!206 (_keys!9974 thiss!1181) (_values!5248 thiss!1181) (mask!25797 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) (index!37484 lt!402960) (defaultEntry!5263 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892166 (arrayContainsKey!0 (_keys!9974 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402963 () Unit!30326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52177 (_ BitVec 64) (_ BitVec 32)) Unit!30326)

(assert (=> b!892166 (= lt!402963 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9974 thiss!1181) key!785 (index!37484 lt!402960)))))

(declare-fun b!892167 () Bool)

(declare-fun e!497879 () Bool)

(assert (=> b!892167 (= e!497879 tp_is_empty!18079)))

(declare-fun b!892168 () Bool)

(declare-fun e!497884 () Bool)

(declare-fun mapRes!28673 () Bool)

(assert (=> b!892168 (= e!497886 (and e!497884 mapRes!28673))))

(declare-fun condMapEmpty!28673 () Bool)

(declare-fun mapDefault!28673 () ValueCell!8558)

(assert (=> b!892168 (= condMapEmpty!28673 (= (arr!25091 (_values!5248 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8558)) mapDefault!28673)))))

(declare-fun b!892169 () Bool)

(assert (=> b!892169 (= e!497884 tp_is_empty!18079)))

(declare-fun b!892170 () Bool)

(declare-fun res!604192 () Bool)

(assert (=> b!892170 (=> (not res!604192) (not e!497882))))

(assert (=> b!892170 (= res!604192 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28673 () Bool)

(declare-fun tp!55222 () Bool)

(assert (=> mapNonEmpty!28673 (= mapRes!28673 (and tp!55222 e!497879))))

(declare-fun mapValue!28673 () ValueCell!8558)

(declare-fun mapKey!28673 () (_ BitVec 32))

(declare-fun mapRest!28673 () (Array (_ BitVec 32) ValueCell!8558))

(assert (=> mapNonEmpty!28673 (= (arr!25091 (_values!5248 thiss!1181)) (store mapRest!28673 mapKey!28673 mapValue!28673))))

(declare-fun res!604193 () Bool)

(assert (=> start!75948 (=> (not res!604193) (not e!497882))))

(declare-fun valid!1614 (LongMapFixedSize!4132) Bool)

(assert (=> start!75948 (= res!604193 (valid!1614 thiss!1181))))

(assert (=> start!75948 e!497882))

(assert (=> start!75948 e!497883))

(assert (=> start!75948 true))

(declare-fun b!892171 () Bool)

(declare-fun res!604190 () Bool)

(assert (=> b!892171 (=> res!604190 e!497878)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52177 (_ BitVec 32)) Bool)

(assert (=> b!892171 (= res!604190 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9974 thiss!1181) (mask!25797 thiss!1181))))))

(declare-fun b!892172 () Bool)

(declare-fun res!604189 () Bool)

(assert (=> b!892172 (=> res!604189 e!497878)))

(declare-datatypes ((List!17693 0))(
  ( (Nil!17690) (Cons!17689 (h!18826 (_ BitVec 64)) (t!24984 List!17693)) )
))
(declare-fun arrayNoDuplicates!0 (array!52177 (_ BitVec 32) List!17693) Bool)

(assert (=> b!892172 (= res!604189 (not (arrayNoDuplicates!0 (_keys!9974 thiss!1181) #b00000000000000000000000000000000 Nil!17690)))))

(declare-fun b!892173 () Bool)

(declare-fun res!604194 () Bool)

(assert (=> b!892173 (=> res!604194 e!497878)))

(assert (=> b!892173 (= res!604194 (or (not (= (size!25536 (_values!5248 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25797 thiss!1181)))) (not (= (size!25535 (_keys!9974 thiss!1181)) (size!25536 (_values!5248 thiss!1181)))) (bvslt (mask!25797 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4957 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4957 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28673 () Bool)

(assert (=> mapIsEmpty!28673 mapRes!28673))

(assert (= (and start!75948 res!604193) b!892170))

(assert (= (and b!892170 res!604192) b!892164))

(assert (= (and b!892164 (not res!604191)) b!892163))

(assert (= (and b!892164 (not res!604195)) b!892166))

(assert (= (and b!892166 (not res!604188)) b!892173))

(assert (= (and b!892173 (not res!604194)) b!892171))

(assert (= (and b!892171 (not res!604190)) b!892172))

(assert (= (and b!892172 (not res!604189)) b!892162))

(assert (= (and b!892168 condMapEmpty!28673) mapIsEmpty!28673))

(assert (= (and b!892168 (not condMapEmpty!28673)) mapNonEmpty!28673))

(assert (= (and mapNonEmpty!28673 ((_ is ValueCellFull!8558) mapValue!28673)) b!892167))

(assert (= (and b!892168 ((_ is ValueCellFull!8558) mapDefault!28673)) b!892169))

(assert (= b!892165 b!892168))

(assert (= start!75948 b!892165))

(declare-fun m!830875 () Bool)

(assert (=> b!892171 m!830875))

(declare-fun m!830877 () Bool)

(assert (=> b!892172 m!830877))

(declare-fun m!830879 () Bool)

(assert (=> mapNonEmpty!28673 m!830879))

(declare-fun m!830881 () Bool)

(assert (=> b!892166 m!830881))

(declare-fun m!830883 () Bool)

(assert (=> b!892166 m!830883))

(declare-fun m!830885 () Bool)

(assert (=> b!892166 m!830885))

(declare-fun m!830887 () Bool)

(assert (=> b!892166 m!830887))

(declare-fun m!830889 () Bool)

(assert (=> b!892166 m!830889))

(assert (=> b!892166 m!830881))

(declare-fun m!830891 () Bool)

(assert (=> b!892166 m!830891))

(declare-fun m!830893 () Bool)

(assert (=> b!892166 m!830893))

(declare-fun m!830895 () Bool)

(assert (=> b!892162 m!830895))

(declare-fun m!830897 () Bool)

(assert (=> b!892163 m!830897))

(declare-fun m!830899 () Bool)

(assert (=> start!75948 m!830899))

(declare-fun m!830901 () Bool)

(assert (=> b!892165 m!830901))

(declare-fun m!830903 () Bool)

(assert (=> b!892165 m!830903))

(declare-fun m!830905 () Bool)

(assert (=> b!892164 m!830905))

(declare-fun m!830907 () Bool)

(assert (=> b!892164 m!830907))

(check-sat (not b!892171) (not start!75948) (not b!892166) (not b!892163) (not b_next!15751) tp_is_empty!18079 (not b!892172) (not b!892164) (not b!892162) (not b!892165) b_and!26001 (not mapNonEmpty!28673))
(check-sat b_and!26001 (not b_next!15751))
