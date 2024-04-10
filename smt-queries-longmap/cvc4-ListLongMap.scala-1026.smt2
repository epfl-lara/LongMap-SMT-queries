; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21842 () Bool)

(assert start!21842)

(declare-fun b!220012 () Bool)

(declare-fun b_free!5909 () Bool)

(declare-fun b_next!5909 () Bool)

(assert (=> b!220012 (= b_free!5909 (not b_next!5909))))

(declare-fun tp!20868 () Bool)

(declare-fun b_and!12807 () Bool)

(assert (=> b!220012 (= tp!20868 b_and!12807)))

(declare-fun b!219995 () Bool)

(declare-fun res!107854 () Bool)

(declare-fun e!143073 () Bool)

(assert (=> b!219995 (=> (not res!107854) (not e!143073))))

(declare-datatypes ((V!7341 0))(
  ( (V!7342 (val!2930 Int)) )
))
(declare-datatypes ((ValueCell!2542 0))(
  ( (ValueCellFull!2542 (v!4950 V!7341)) (EmptyCell!2542) )
))
(declare-datatypes ((array!10785 0))(
  ( (array!10786 (arr!5112 (Array (_ BitVec 32) ValueCell!2542)) (size!5445 (_ BitVec 32))) )
))
(declare-datatypes ((array!10787 0))(
  ( (array!10788 (arr!5113 (Array (_ BitVec 32) (_ BitVec 64))) (size!5446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2984 0))(
  ( (LongMapFixedSize!2985 (defaultEntry!4151 Int) (mask!9947 (_ BitVec 32)) (extraKeys!3888 (_ BitVec 32)) (zeroValue!3992 V!7341) (minValue!3992 V!7341) (_size!1541 (_ BitVec 32)) (_keys!6205 array!10787) (_values!4134 array!10785) (_vacant!1541 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2984)

(declare-datatypes ((SeekEntryResult!805 0))(
  ( (MissingZero!805 (index!5390 (_ BitVec 32))) (Found!805 (index!5391 (_ BitVec 32))) (Intermediate!805 (undefined!1617 Bool) (index!5392 (_ BitVec 32)) (x!22929 (_ BitVec 32))) (Undefined!805) (MissingVacant!805 (index!5393 (_ BitVec 32))) )
))
(declare-fun lt!112078 () SeekEntryResult!805)

(assert (=> b!219995 (= res!107854 (= (select (arr!5113 (_keys!6205 thiss!1504)) (index!5390 lt!112078)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219996 () Bool)

(declare-fun e!143075 () Bool)

(assert (=> b!219996 (= e!143075 false)))

(declare-fun lt!112082 () Bool)

(declare-datatypes ((List!3254 0))(
  ( (Nil!3251) (Cons!3250 (h!3898 (_ BitVec 64)) (t!8213 List!3254)) )
))
(declare-fun arrayNoDuplicates!0 (array!10787 (_ BitVec 32) List!3254) Bool)

(assert (=> b!219996 (= lt!112082 (arrayNoDuplicates!0 (_keys!6205 thiss!1504) #b00000000000000000000000000000000 Nil!3251))))

(declare-fun bm!20558 () Bool)

(declare-fun call!20561 () Bool)

(declare-fun c!36622 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20558 (= call!20561 (inRange!0 (ite c!36622 (index!5390 lt!112078) (index!5393 lt!112078)) (mask!9947 thiss!1504)))))

(declare-fun b!219997 () Bool)

(declare-fun res!107850 () Bool)

(assert (=> b!219997 (= res!107850 (= (select (arr!5113 (_keys!6205 thiss!1504)) (index!5393 lt!112078)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143069 () Bool)

(assert (=> b!219997 (=> (not res!107850) (not e!143069))))

(declare-fun b!219998 () Bool)

(declare-fun res!107846 () Bool)

(assert (=> b!219998 (=> (not res!107846) (not e!143073))))

(assert (=> b!219998 (= res!107846 call!20561)))

(declare-fun e!143063 () Bool)

(assert (=> b!219998 (= e!143063 e!143073)))

(declare-fun b!219999 () Bool)

(declare-fun e!143067 () Bool)

(declare-fun e!143071 () Bool)

(assert (=> b!219999 (= e!143067 e!143071)))

(declare-fun res!107851 () Bool)

(assert (=> b!219999 (=> (not res!107851) (not e!143071))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219999 (= res!107851 (or (= lt!112078 (MissingZero!805 index!297)) (= lt!112078 (MissingVacant!805 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10787 (_ BitVec 32)) SeekEntryResult!805)

(assert (=> b!219999 (= lt!112078 (seekEntryOrOpen!0 key!932 (_keys!6205 thiss!1504) (mask!9947 thiss!1504)))))

(declare-fun b!220000 () Bool)

(declare-fun e!143074 () Bool)

(declare-fun tp_is_empty!5771 () Bool)

(assert (=> b!220000 (= e!143074 tp_is_empty!5771)))

(declare-fun b!220001 () Bool)

(declare-fun res!107848 () Bool)

(assert (=> b!220001 (=> (not res!107848) (not e!143075))))

(declare-fun arrayContainsKey!0 (array!10787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220001 (= res!107848 (arrayContainsKey!0 (_keys!6205 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220002 () Bool)

(declare-fun e!143072 () Bool)

(declare-fun e!143065 () Bool)

(declare-fun mapRes!9826 () Bool)

(assert (=> b!220002 (= e!143072 (and e!143065 mapRes!9826))))

(declare-fun condMapEmpty!9826 () Bool)

(declare-fun mapDefault!9826 () ValueCell!2542)

