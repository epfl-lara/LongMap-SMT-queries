; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21874 () Bool)

(assert start!21874)

(declare-fun b!221066 () Bool)

(declare-fun b_free!5941 () Bool)

(declare-fun b_next!5941 () Bool)

(assert (=> b!221066 (= b_free!5941 (not b_next!5941))))

(declare-fun tp!20965 () Bool)

(declare-fun b_and!12839 () Bool)

(assert (=> b!221066 (= tp!20965 b_and!12839)))

(declare-fun res!108424 () Bool)

(declare-fun e!143695 () Bool)

(assert (=> start!21874 (=> (not res!108424) (not e!143695))))

(declare-datatypes ((V!7385 0))(
  ( (V!7386 (val!2946 Int)) )
))
(declare-datatypes ((ValueCell!2558 0))(
  ( (ValueCellFull!2558 (v!4966 V!7385)) (EmptyCell!2558) )
))
(declare-datatypes ((array!10849 0))(
  ( (array!10850 (arr!5144 (Array (_ BitVec 32) ValueCell!2558)) (size!5477 (_ BitVec 32))) )
))
(declare-datatypes ((array!10851 0))(
  ( (array!10852 (arr!5145 (Array (_ BitVec 32) (_ BitVec 64))) (size!5478 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3016 0))(
  ( (LongMapFixedSize!3017 (defaultEntry!4167 Int) (mask!9975 (_ BitVec 32)) (extraKeys!3904 (_ BitVec 32)) (zeroValue!4008 V!7385) (minValue!4008 V!7385) (_size!1557 (_ BitVec 32)) (_keys!6221 array!10851) (_values!4150 array!10849) (_vacant!1557 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3016)

(declare-fun valid!1217 (LongMapFixedSize!3016) Bool)

(assert (=> start!21874 (= res!108424 (valid!1217 thiss!1504))))

(assert (=> start!21874 e!143695))

(declare-fun e!143693 () Bool)

(assert (=> start!21874 e!143693))

(assert (=> start!21874 true))

(declare-fun b!221050 () Bool)

(declare-datatypes ((Unit!6599 0))(
  ( (Unit!6600) )
))
(declare-fun e!143689 () Unit!6599)

(declare-fun Unit!6601 () Unit!6599)

(assert (=> b!221050 (= e!143689 Unit!6601)))

(declare-fun lt!112322 () Unit!6599)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!210 (array!10851 array!10849 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 64) Int) Unit!6599)

(assert (=> b!221050 (= lt!112322 (lemmaInListMapThenSeekEntryOrOpenFindsIt!210 (_keys!6221 thiss!1504) (_values!4150 thiss!1504) (mask!9975 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) key!932 (defaultEntry!4167 thiss!1504)))))

(assert (=> b!221050 false))

(declare-fun b!221051 () Bool)

(declare-fun res!108425 () Bool)

(declare-fun e!143697 () Bool)

(assert (=> b!221051 (=> (not res!108425) (not e!143697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221051 (= res!108425 (validMask!0 (mask!9975 thiss!1504)))))

(declare-fun b!221052 () Bool)

(declare-fun e!143692 () Bool)

(declare-fun e!143687 () Bool)

(declare-fun mapRes!9874 () Bool)

(assert (=> b!221052 (= e!143692 (and e!143687 mapRes!9874))))

(declare-fun condMapEmpty!9874 () Bool)

(declare-fun mapDefault!9874 () ValueCell!2558)

