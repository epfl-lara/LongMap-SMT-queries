; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16636 () Bool)

(assert start!16636)

(declare-fun b!166148 () Bool)

(declare-fun b_free!3937 () Bool)

(declare-fun b_next!3937 () Bool)

(assert (=> b!166148 (= b_free!3937 (not b_next!3937))))

(declare-fun tp!14412 () Bool)

(declare-fun b_and!10365 () Bool)

(assert (=> b!166148 (= tp!14412 b_and!10365)))

(declare-fun b!166144 () Bool)

(declare-fun res!78930 () Bool)

(declare-fun e!108971 () Bool)

(assert (=> b!166144 (=> (not res!78930) (not e!108971))))

(declare-datatypes ((V!4633 0))(
  ( (V!4634 (val!1914 Int)) )
))
(declare-datatypes ((ValueCell!1526 0))(
  ( (ValueCellFull!1526 (v!3780 V!4633)) (EmptyCell!1526) )
))
(declare-datatypes ((array!6561 0))(
  ( (array!6562 (arr!3116 (Array (_ BitVec 32) (_ BitVec 64))) (size!3404 (_ BitVec 32))) )
))
(declare-datatypes ((array!6563 0))(
  ( (array!6564 (arr!3117 (Array (_ BitVec 32) ValueCell!1526)) (size!3405 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1960 0))(
  ( (LongMapFixedSize!1961 (defaultEntry!3422 Int) (mask!8147 (_ BitVec 32)) (extraKeys!3163 (_ BitVec 32)) (zeroValue!3265 V!4633) (minValue!3265 V!4633) (_size!1029 (_ BitVec 32)) (_keys!5247 array!6561) (_values!3405 array!6563) (_vacant!1029 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1960)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6561 (_ BitVec 32)) Bool)

(assert (=> b!166144 (= res!78930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5247 thiss!1248) (mask!8147 thiss!1248)))))

(declare-fun mapNonEmpty!6327 () Bool)

(declare-fun mapRes!6327 () Bool)

(declare-fun tp!14411 () Bool)

(declare-fun e!108969 () Bool)

(assert (=> mapNonEmpty!6327 (= mapRes!6327 (and tp!14411 e!108969))))

(declare-fun mapValue!6327 () ValueCell!1526)

(declare-fun mapRest!6327 () (Array (_ BitVec 32) ValueCell!1526))

(declare-fun mapKey!6327 () (_ BitVec 32))

(assert (=> mapNonEmpty!6327 (= (arr!3117 (_values!3405 thiss!1248)) (store mapRest!6327 mapKey!6327 mapValue!6327))))

(declare-fun b!166145 () Bool)

(assert (=> b!166145 (= e!108971 false)))

(declare-fun lt!83250 () Bool)

(declare-datatypes ((List!2066 0))(
  ( (Nil!2063) (Cons!2062 (h!2679 (_ BitVec 64)) (t!6860 List!2066)) )
))
(declare-fun arrayNoDuplicates!0 (array!6561 (_ BitVec 32) List!2066) Bool)

(assert (=> b!166145 (= lt!83250 (arrayNoDuplicates!0 (_keys!5247 thiss!1248) #b00000000000000000000000000000000 Nil!2063))))

(declare-fun b!166146 () Bool)

(declare-fun tp_is_empty!3739 () Bool)

(assert (=> b!166146 (= e!108969 tp_is_empty!3739)))

(declare-fun res!78936 () Bool)

(declare-fun e!108966 () Bool)

(assert (=> start!16636 (=> (not res!78936) (not e!108966))))

(declare-fun valid!876 (LongMapFixedSize!1960) Bool)

(assert (=> start!16636 (= res!78936 (valid!876 thiss!1248))))

(assert (=> start!16636 e!108966))

(declare-fun e!108965 () Bool)

(assert (=> start!16636 e!108965))

(assert (=> start!16636 true))

(declare-fun b!166147 () Bool)

(assert (=> b!166147 (= e!108966 e!108971)))

(declare-fun res!78934 () Bool)

(assert (=> b!166147 (=> (not res!78934) (not e!108971))))

(declare-datatypes ((SeekEntryResult!444 0))(
  ( (MissingZero!444 (index!3944 (_ BitVec 32))) (Found!444 (index!3945 (_ BitVec 32))) (Intermediate!444 (undefined!1256 Bool) (index!3946 (_ BitVec 32)) (x!18400 (_ BitVec 32))) (Undefined!444) (MissingVacant!444 (index!3947 (_ BitVec 32))) )
))
(declare-fun lt!83249 () SeekEntryResult!444)

(get-info :version)

(assert (=> b!166147 (= res!78934 (and (not ((_ is Undefined!444) lt!83249)) (not ((_ is MissingVacant!444) lt!83249)) (not ((_ is MissingZero!444) lt!83249)) ((_ is Found!444) lt!83249)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6561 (_ BitVec 32)) SeekEntryResult!444)

(assert (=> b!166147 (= lt!83249 (seekEntryOrOpen!0 key!828 (_keys!5247 thiss!1248) (mask!8147 thiss!1248)))))

(declare-fun e!108967 () Bool)

(declare-fun array_inv!1995 (array!6561) Bool)

(declare-fun array_inv!1996 (array!6563) Bool)

(assert (=> b!166148 (= e!108965 (and tp!14412 tp_is_empty!3739 (array_inv!1995 (_keys!5247 thiss!1248)) (array_inv!1996 (_values!3405 thiss!1248)) e!108967))))

(declare-fun b!166149 () Bool)

(declare-fun e!108970 () Bool)

(assert (=> b!166149 (= e!108967 (and e!108970 mapRes!6327))))

(declare-fun condMapEmpty!6327 () Bool)

(declare-fun mapDefault!6327 () ValueCell!1526)

(assert (=> b!166149 (= condMapEmpty!6327 (= (arr!3117 (_values!3405 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1526)) mapDefault!6327)))))

(declare-fun b!166150 () Bool)

(assert (=> b!166150 (= e!108970 tp_is_empty!3739)))

(declare-fun b!166151 () Bool)

(declare-fun res!78935 () Bool)

(assert (=> b!166151 (=> (not res!78935) (not e!108966))))

(assert (=> b!166151 (= res!78935 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6327 () Bool)

(assert (=> mapIsEmpty!6327 mapRes!6327))

(declare-fun b!166152 () Bool)

(declare-fun res!78932 () Bool)

(assert (=> b!166152 (=> (not res!78932) (not e!108971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166152 (= res!78932 (validMask!0 (mask!8147 thiss!1248)))))

(declare-fun b!166153 () Bool)

(declare-fun res!78933 () Bool)

(assert (=> b!166153 (=> (not res!78933) (not e!108971))))

(declare-datatypes ((tuple2!3048 0))(
  ( (tuple2!3049 (_1!1535 (_ BitVec 64)) (_2!1535 V!4633)) )
))
(declare-datatypes ((List!2067 0))(
  ( (Nil!2064) (Cons!2063 (h!2680 tuple2!3048) (t!6861 List!2067)) )
))
(declare-datatypes ((ListLongMap!2009 0))(
  ( (ListLongMap!2010 (toList!1020 List!2067)) )
))
(declare-fun contains!1072 (ListLongMap!2009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!682 (array!6561 array!6563 (_ BitVec 32) (_ BitVec 32) V!4633 V!4633 (_ BitVec 32) Int) ListLongMap!2009)

(assert (=> b!166153 (= res!78933 (not (contains!1072 (getCurrentListMap!682 (_keys!5247 thiss!1248) (_values!3405 thiss!1248) (mask!8147 thiss!1248) (extraKeys!3163 thiss!1248) (zeroValue!3265 thiss!1248) (minValue!3265 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3422 thiss!1248)) key!828)))))

(declare-fun b!166154 () Bool)

(declare-fun res!78931 () Bool)

(assert (=> b!166154 (=> (not res!78931) (not e!108971))))

(assert (=> b!166154 (= res!78931 (and (= (size!3405 (_values!3405 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8147 thiss!1248))) (= (size!3404 (_keys!5247 thiss!1248)) (size!3405 (_values!3405 thiss!1248))) (bvsge (mask!8147 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3163 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3163 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16636 res!78936) b!166151))

(assert (= (and b!166151 res!78935) b!166147))

(assert (= (and b!166147 res!78934) b!166153))

(assert (= (and b!166153 res!78933) b!166152))

(assert (= (and b!166152 res!78932) b!166154))

(assert (= (and b!166154 res!78931) b!166144))

(assert (= (and b!166144 res!78930) b!166145))

(assert (= (and b!166149 condMapEmpty!6327) mapIsEmpty!6327))

(assert (= (and b!166149 (not condMapEmpty!6327)) mapNonEmpty!6327))

(assert (= (and mapNonEmpty!6327 ((_ is ValueCellFull!1526) mapValue!6327)) b!166146))

(assert (= (and b!166149 ((_ is ValueCellFull!1526) mapDefault!6327)) b!166150))

(assert (= b!166148 b!166149))

(assert (= start!16636 b!166148))

(declare-fun m!195833 () Bool)

(assert (=> b!166152 m!195833))

(declare-fun m!195835 () Bool)

(assert (=> b!166148 m!195835))

(declare-fun m!195837 () Bool)

(assert (=> b!166148 m!195837))

(declare-fun m!195839 () Bool)

(assert (=> start!16636 m!195839))

(declare-fun m!195841 () Bool)

(assert (=> b!166145 m!195841))

(declare-fun m!195843 () Bool)

(assert (=> b!166147 m!195843))

(declare-fun m!195845 () Bool)

(assert (=> b!166144 m!195845))

(declare-fun m!195847 () Bool)

(assert (=> mapNonEmpty!6327 m!195847))

(declare-fun m!195849 () Bool)

(assert (=> b!166153 m!195849))

(assert (=> b!166153 m!195849))

(declare-fun m!195851 () Bool)

(assert (=> b!166153 m!195851))

(check-sat (not b!166152) (not b!166144) (not b!166145) b_and!10365 tp_is_empty!3739 (not b_next!3937) (not start!16636) (not b!166153) (not mapNonEmpty!6327) (not b!166147) (not b!166148))
(check-sat b_and!10365 (not b_next!3937))
