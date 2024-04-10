; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16762 () Bool)

(assert start!16762)

(declare-fun b!168627 () Bool)

(declare-fun b_free!4067 () Bool)

(declare-fun b_next!4067 () Bool)

(assert (=> b!168627 (= b_free!4067 (not b_next!4067))))

(declare-fun tp!14801 () Bool)

(declare-fun b_and!10481 () Bool)

(assert (=> b!168627 (= tp!14801 b_and!10481)))

(declare-fun mapNonEmpty!6522 () Bool)

(declare-fun mapRes!6522 () Bool)

(declare-fun tp!14802 () Bool)

(declare-fun e!110875 () Bool)

(assert (=> mapNonEmpty!6522 (= mapRes!6522 (and tp!14802 e!110875))))

(declare-datatypes ((V!4805 0))(
  ( (V!4806 (val!1979 Int)) )
))
(declare-datatypes ((ValueCell!1591 0))(
  ( (ValueCellFull!1591 (v!3844 V!4805)) (EmptyCell!1591) )
))
(declare-fun mapRest!6522 () (Array (_ BitVec 32) ValueCell!1591))

(declare-fun mapKey!6522 () (_ BitVec 32))

(declare-datatypes ((array!6835 0))(
  ( (array!6836 (arr!3253 (Array (_ BitVec 32) (_ BitVec 64))) (size!3541 (_ BitVec 32))) )
))
(declare-datatypes ((array!6837 0))(
  ( (array!6838 (arr!3254 (Array (_ BitVec 32) ValueCell!1591)) (size!3542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2090 0))(
  ( (LongMapFixedSize!2091 (defaultEntry!3487 Int) (mask!8254 (_ BitVec 32)) (extraKeys!3228 (_ BitVec 32)) (zeroValue!3330 V!4805) (minValue!3330 V!4805) (_size!1094 (_ BitVec 32)) (_keys!5312 array!6835) (_values!3470 array!6837) (_vacant!1094 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2090)

(declare-fun mapValue!6522 () ValueCell!1591)

(assert (=> mapNonEmpty!6522 (= (arr!3254 (_values!3470 thiss!1248)) (store mapRest!6522 mapKey!6522 mapValue!6522))))

(declare-fun b!168618 () Bool)

(declare-datatypes ((Unit!5197 0))(
  ( (Unit!5198) )
))
(declare-fun e!110870 () Unit!5197)

(declare-fun lt!84323 () Unit!5197)

(assert (=> b!168618 (= e!110870 lt!84323)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!125 (array!6835 array!6837 (_ BitVec 32) (_ BitVec 32) V!4805 V!4805 (_ BitVec 64) Int) Unit!5197)

(assert (=> b!168618 (= lt!84323 (lemmaInListMapThenSeekEntryOrOpenFindsIt!125 (_keys!5312 thiss!1248) (_values!3470 thiss!1248) (mask!8254 thiss!1248) (extraKeys!3228 thiss!1248) (zeroValue!3330 thiss!1248) (minValue!3330 thiss!1248) key!828 (defaultEntry!3487 thiss!1248)))))

(declare-fun res!80274 () Bool)

(declare-datatypes ((SeekEntryResult!505 0))(
  ( (MissingZero!505 (index!4188 (_ BitVec 32))) (Found!505 (index!4189 (_ BitVec 32))) (Intermediate!505 (undefined!1317 Bool) (index!4190 (_ BitVec 32)) (x!18629 (_ BitVec 32))) (Undefined!505) (MissingVacant!505 (index!4191 (_ BitVec 32))) )
))
(declare-fun lt!84326 () SeekEntryResult!505)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168618 (= res!80274 (inRange!0 (index!4189 lt!84326) (mask!8254 thiss!1248)))))

(declare-fun e!110871 () Bool)

(assert (=> b!168618 (=> (not res!80274) (not e!110871))))

(assert (=> b!168618 e!110871))

(declare-fun res!80275 () Bool)

(declare-fun e!110873 () Bool)

(assert (=> start!16762 (=> (not res!80275) (not e!110873))))

(declare-fun valid!905 (LongMapFixedSize!2090) Bool)

(assert (=> start!16762 (= res!80275 (valid!905 thiss!1248))))

(assert (=> start!16762 e!110873))

(declare-fun e!110878 () Bool)

(assert (=> start!16762 e!110878))

(assert (=> start!16762 true))

(declare-fun tp_is_empty!3869 () Bool)

(assert (=> start!16762 tp_is_empty!3869))

(declare-fun b!168619 () Bool)

(declare-fun e!110872 () Bool)

(assert (=> b!168619 (= e!110872 true)))

(declare-fun lt!84325 () Bool)

(declare-datatypes ((List!2167 0))(
  ( (Nil!2164) (Cons!2163 (h!2780 (_ BitVec 64)) (t!6969 List!2167)) )
))
(declare-fun arrayNoDuplicates!0 (array!6835 (_ BitVec 32) List!2167) Bool)

(assert (=> b!168619 (= lt!84325 (arrayNoDuplicates!0 (_keys!5312 thiss!1248) #b00000000000000000000000000000000 Nil!2164))))

(declare-fun b!168620 () Bool)

(declare-fun res!80280 () Bool)

(assert (=> b!168620 (=> res!80280 e!110872)))

(assert (=> b!168620 (= res!80280 (or (not (= (size!3542 (_values!3470 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8254 thiss!1248)))) (not (= (size!3541 (_keys!5312 thiss!1248)) (size!3542 (_values!3470 thiss!1248)))) (bvslt (mask!8254 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3228 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3228 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168621 () Bool)

(declare-fun e!110876 () Bool)

(assert (=> b!168621 (= e!110876 tp_is_empty!3869)))

(declare-fun b!168622 () Bool)

(assert (=> b!168622 (= e!110871 (= (select (arr!3253 (_keys!5312 thiss!1248)) (index!4189 lt!84326)) key!828))))

(declare-fun b!168623 () Bool)

(declare-fun res!80276 () Bool)

(assert (=> b!168623 (=> res!80276 e!110872)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6835 (_ BitVec 32)) Bool)

(assert (=> b!168623 (= res!80276 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5312 thiss!1248) (mask!8254 thiss!1248))))))

(declare-fun b!168624 () Bool)

(declare-fun e!110879 () Bool)

(assert (=> b!168624 (= e!110873 e!110879)))

(declare-fun res!80279 () Bool)

(assert (=> b!168624 (=> (not res!80279) (not e!110879))))

(assert (=> b!168624 (= res!80279 (and (not (is-Undefined!505 lt!84326)) (not (is-MissingVacant!505 lt!84326)) (not (is-MissingZero!505 lt!84326)) (is-Found!505 lt!84326)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6835 (_ BitVec 32)) SeekEntryResult!505)

(assert (=> b!168624 (= lt!84326 (seekEntryOrOpen!0 key!828 (_keys!5312 thiss!1248) (mask!8254 thiss!1248)))))

(declare-fun b!168625 () Bool)

(declare-fun e!110877 () Bool)

(assert (=> b!168625 (= e!110877 (and e!110876 mapRes!6522))))

(declare-fun condMapEmpty!6522 () Bool)

(declare-fun mapDefault!6522 () ValueCell!1591)

