; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16630 () Bool)

(assert start!16630)

(declare-fun b!166069 () Bool)

(declare-fun b_free!3935 () Bool)

(declare-fun b_next!3935 () Bool)

(assert (=> b!166069 (= b_free!3935 (not b_next!3935))))

(declare-fun tp!14405 () Bool)

(declare-fun b_and!10349 () Bool)

(assert (=> b!166069 (= tp!14405 b_and!10349)))

(declare-fun b!166065 () Bool)

(declare-fun res!78891 () Bool)

(declare-fun e!108924 () Bool)

(assert (=> b!166065 (=> (not res!78891) (not e!108924))))

(declare-datatypes ((V!4629 0))(
  ( (V!4630 (val!1913 Int)) )
))
(declare-datatypes ((ValueCell!1525 0))(
  ( (ValueCellFull!1525 (v!3778 V!4629)) (EmptyCell!1525) )
))
(declare-datatypes ((array!6571 0))(
  ( (array!6572 (arr!3121 (Array (_ BitVec 32) (_ BitVec 64))) (size!3409 (_ BitVec 32))) )
))
(declare-datatypes ((array!6573 0))(
  ( (array!6574 (arr!3122 (Array (_ BitVec 32) ValueCell!1525)) (size!3410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1958 0))(
  ( (LongMapFixedSize!1959 (defaultEntry!3421 Int) (mask!8144 (_ BitVec 32)) (extraKeys!3162 (_ BitVec 32)) (zeroValue!3264 V!4629) (minValue!3264 V!4629) (_size!1028 (_ BitVec 32)) (_keys!5246 array!6571) (_values!3404 array!6573) (_vacant!1028 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1958)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166065 (= res!78891 (validMask!0 (mask!8144 thiss!1248)))))

(declare-fun b!166066 () Bool)

(declare-fun e!108922 () Bool)

(assert (=> b!166066 (= e!108922 e!108924)))

(declare-fun res!78889 () Bool)

(assert (=> b!166066 (=> (not res!78889) (not e!108924))))

(declare-datatypes ((SeekEntryResult!448 0))(
  ( (MissingZero!448 (index!3960 (_ BitVec 32))) (Found!448 (index!3961 (_ BitVec 32))) (Intermediate!448 (undefined!1260 Bool) (index!3962 (_ BitVec 32)) (x!18396 (_ BitVec 32))) (Undefined!448) (MissingVacant!448 (index!3963 (_ BitVec 32))) )
))
(declare-fun lt!83185 () SeekEntryResult!448)

(assert (=> b!166066 (= res!78889 (and (not (is-Undefined!448 lt!83185)) (not (is-MissingVacant!448 lt!83185)) (not (is-MissingZero!448 lt!83185)) (is-Found!448 lt!83185)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6571 (_ BitVec 32)) SeekEntryResult!448)

(assert (=> b!166066 (= lt!83185 (seekEntryOrOpen!0 key!828 (_keys!5246 thiss!1248) (mask!8144 thiss!1248)))))

(declare-fun mapNonEmpty!6324 () Bool)

(declare-fun mapRes!6324 () Bool)

(declare-fun tp!14406 () Bool)

(declare-fun e!108920 () Bool)

(assert (=> mapNonEmpty!6324 (= mapRes!6324 (and tp!14406 e!108920))))

(declare-fun mapKey!6324 () (_ BitVec 32))

(declare-fun mapRest!6324 () (Array (_ BitVec 32) ValueCell!1525))

(declare-fun mapValue!6324 () ValueCell!1525)

(assert (=> mapNonEmpty!6324 (= (arr!3122 (_values!3404 thiss!1248)) (store mapRest!6324 mapKey!6324 mapValue!6324))))

(declare-fun b!166067 () Bool)

(declare-fun tp_is_empty!3737 () Bool)

(assert (=> b!166067 (= e!108920 tp_is_empty!3737)))

(declare-fun b!166068 () Bool)

(declare-fun res!78890 () Bool)

(assert (=> b!166068 (=> (not res!78890) (not e!108924))))

(assert (=> b!166068 (= res!78890 (and (= (size!3410 (_values!3404 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8144 thiss!1248))) (= (size!3409 (_keys!5246 thiss!1248)) (size!3410 (_values!3404 thiss!1248))) (bvsge (mask!8144 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3162 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3162 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!108926 () Bool)

(declare-fun e!108921 () Bool)

(declare-fun array_inv!2003 (array!6571) Bool)

(declare-fun array_inv!2004 (array!6573) Bool)

(assert (=> b!166069 (= e!108926 (and tp!14405 tp_is_empty!3737 (array_inv!2003 (_keys!5246 thiss!1248)) (array_inv!2004 (_values!3404 thiss!1248)) e!108921))))

(declare-fun mapIsEmpty!6324 () Bool)

(assert (=> mapIsEmpty!6324 mapRes!6324))

(declare-fun b!166070 () Bool)

(assert (=> b!166070 (= e!108924 false)))

(declare-fun lt!83184 () Bool)

(declare-datatypes ((List!2078 0))(
  ( (Nil!2075) (Cons!2074 (h!2691 (_ BitVec 64)) (t!6880 List!2078)) )
))
(declare-fun arrayNoDuplicates!0 (array!6571 (_ BitVec 32) List!2078) Bool)

(assert (=> b!166070 (= lt!83184 (arrayNoDuplicates!0 (_keys!5246 thiss!1248) #b00000000000000000000000000000000 Nil!2075))))

(declare-fun b!166071 () Bool)

(declare-fun e!108925 () Bool)

(assert (=> b!166071 (= e!108925 tp_is_empty!3737)))

(declare-fun b!166072 () Bool)

(declare-fun res!78893 () Bool)

(assert (=> b!166072 (=> (not res!78893) (not e!108922))))

(assert (=> b!166072 (= res!78893 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166064 () Bool)

(declare-fun res!78894 () Bool)

(assert (=> b!166064 (=> (not res!78894) (not e!108924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6571 (_ BitVec 32)) Bool)

(assert (=> b!166064 (= res!78894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5246 thiss!1248) (mask!8144 thiss!1248)))))

(declare-fun res!78888 () Bool)

(assert (=> start!16630 (=> (not res!78888) (not e!108922))))

(declare-fun valid!863 (LongMapFixedSize!1958) Bool)

(assert (=> start!16630 (= res!78888 (valid!863 thiss!1248))))

(assert (=> start!16630 e!108922))

(assert (=> start!16630 e!108926))

(assert (=> start!16630 true))

(declare-fun b!166073 () Bool)

(assert (=> b!166073 (= e!108921 (and e!108925 mapRes!6324))))

(declare-fun condMapEmpty!6324 () Bool)

(declare-fun mapDefault!6324 () ValueCell!1525)

