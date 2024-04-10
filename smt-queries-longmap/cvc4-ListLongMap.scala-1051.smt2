; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21992 () Bool)

(assert start!21992)

(declare-fun b!225897 () Bool)

(declare-fun b_free!6059 () Bool)

(declare-fun b_next!6059 () Bool)

(assert (=> b!225897 (= b_free!6059 (not b_next!6059))))

(declare-fun tp!21319 () Bool)

(declare-fun b_and!12957 () Bool)

(assert (=> b!225897 (= tp!21319 b_and!12957)))

(declare-fun b!225877 () Bool)

(declare-fun res!111180 () Bool)

(declare-fun e!146591 () Bool)

(assert (=> b!225877 (=> res!111180 e!146591)))

(declare-fun lt!113739 () Bool)

(assert (=> b!225877 (= res!111180 lt!113739)))

(declare-datatypes ((SeekEntryResult!875 0))(
  ( (MissingZero!875 (index!5670 (_ BitVec 32))) (Found!875 (index!5671 (_ BitVec 32))) (Intermediate!875 (undefined!1687 Bool) (index!5672 (_ BitVec 32)) (x!23199 (_ BitVec 32))) (Undefined!875) (MissingVacant!875 (index!5673 (_ BitVec 32))) )
))
(declare-fun lt!113744 () SeekEntryResult!875)

(declare-datatypes ((V!7541 0))(
  ( (V!7542 (val!3005 Int)) )
))
(declare-datatypes ((ValueCell!2617 0))(
  ( (ValueCellFull!2617 (v!5025 V!7541)) (EmptyCell!2617) )
))
(declare-datatypes ((array!11085 0))(
  ( (array!11086 (arr!5262 (Array (_ BitVec 32) ValueCell!2617)) (size!5595 (_ BitVec 32))) )
))
(declare-datatypes ((array!11087 0))(
  ( (array!11088 (arr!5263 (Array (_ BitVec 32) (_ BitVec 64))) (size!5596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3134 0))(
  ( (LongMapFixedSize!3135 (defaultEntry!4226 Int) (mask!10072 (_ BitVec 32)) (extraKeys!3963 (_ BitVec 32)) (zeroValue!4067 V!7541) (minValue!4067 V!7541) (_size!1616 (_ BitVec 32)) (_keys!6280 array!11087) (_values!4209 array!11085) (_vacant!1616 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3134)

(declare-fun call!21012 () Bool)

(declare-fun c!37452 () Bool)

(declare-fun bm!21008 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21008 (= call!21012 (inRange!0 (ite c!37452 (index!5670 lt!113744) (index!5673 lt!113744)) (mask!10072 thiss!1504)))))

(declare-fun b!225878 () Bool)

(declare-datatypes ((Unit!6818 0))(
  ( (Unit!6819) )
))
(declare-fun e!146583 () Unit!6818)

(declare-fun Unit!6820 () Unit!6818)

(assert (=> b!225878 (= e!146583 Unit!6820)))

(declare-fun b!225879 () Bool)

(declare-fun e!146582 () Bool)

(declare-fun e!146594 () Bool)

(assert (=> b!225879 (= e!146582 e!146594)))

(declare-fun res!111185 () Bool)

(assert (=> b!225879 (=> (not res!111185) (not e!146594))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225879 (= res!111185 (or (= lt!113744 (MissingZero!875 index!297)) (= lt!113744 (MissingVacant!875 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11087 (_ BitVec 32)) SeekEntryResult!875)

(assert (=> b!225879 (= lt!113744 (seekEntryOrOpen!0 key!932 (_keys!6280 thiss!1504) (mask!10072 thiss!1504)))))

(declare-fun b!225880 () Bool)

(declare-fun e!146592 () Bool)

(declare-fun call!21011 () Bool)

(assert (=> b!225880 (= e!146592 (not call!21011))))

(declare-fun b!225881 () Bool)

(declare-fun e!146588 () Bool)

(declare-fun e!146580 () Bool)

(declare-fun mapRes!10051 () Bool)

(assert (=> b!225881 (= e!146588 (and e!146580 mapRes!10051))))

(declare-fun condMapEmpty!10051 () Bool)

(declare-fun mapDefault!10051 () ValueCell!2617)

