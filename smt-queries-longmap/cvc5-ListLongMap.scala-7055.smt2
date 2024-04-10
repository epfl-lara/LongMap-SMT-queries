; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89384 () Bool)

(assert start!89384)

(declare-fun b!1024703 () Bool)

(declare-fun b_free!20383 () Bool)

(declare-fun b_next!20383 () Bool)

(assert (=> b!1024703 (= b_free!20383 (not b_next!20383))))

(declare-fun tp!72194 () Bool)

(declare-fun b_and!32629 () Bool)

(assert (=> b!1024703 (= tp!72194 b_and!32629)))

(declare-fun b!1024693 () Bool)

(declare-fun e!577650 () Bool)

(declare-fun e!577654 () Bool)

(assert (=> b!1024693 (= e!577650 e!577654)))

(declare-fun res!686059 () Bool)

(assert (=> b!1024693 (=> (not res!686059) (not e!577654))))

(declare-datatypes ((SeekEntryResult!9601 0))(
  ( (MissingZero!9601 (index!40775 (_ BitVec 32))) (Found!9601 (index!40776 (_ BitVec 32))) (Intermediate!9601 (undefined!10413 Bool) (index!40777 (_ BitVec 32)) (x!91111 (_ BitVec 32))) (Undefined!9601) (MissingVacant!9601 (index!40778 (_ BitVec 32))) )
))
(declare-fun lt!450685 () SeekEntryResult!9601)

(assert (=> b!1024693 (= res!686059 (is-Found!9601 lt!450685))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37011 0))(
  ( (V!37012 (val!12102 Int)) )
))
(declare-datatypes ((ValueCell!11348 0))(
  ( (ValueCellFull!11348 (v!14671 V!37011)) (EmptyCell!11348) )
))
(declare-datatypes ((array!64256 0))(
  ( (array!64257 (arr!30937 (Array (_ BitVec 32) (_ BitVec 64))) (size!31450 (_ BitVec 32))) )
))
(declare-datatypes ((array!64258 0))(
  ( (array!64259 (arr!30938 (Array (_ BitVec 32) ValueCell!11348)) (size!31451 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5290 0))(
  ( (LongMapFixedSize!5291 (defaultEntry!5997 Int) (mask!29653 (_ BitVec 32)) (extraKeys!5729 (_ BitVec 32)) (zeroValue!5833 V!37011) (minValue!5833 V!37011) (_size!2700 (_ BitVec 32)) (_keys!11144 array!64256) (_values!6020 array!64258) (_vacant!2700 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5290)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64256 (_ BitVec 32)) SeekEntryResult!9601)

(assert (=> b!1024693 (= lt!450685 (seekEntry!0 key!909 (_keys!11144 thiss!1427) (mask!29653 thiss!1427)))))

(declare-fun b!1024694 () Bool)

(declare-fun res!686062 () Bool)

(declare-fun e!577652 () Bool)

(assert (=> b!1024694 (=> res!686062 e!577652)))

(declare-datatypes ((List!21735 0))(
  ( (Nil!21732) (Cons!21731 (h!22929 (_ BitVec 64)) (t!30797 List!21735)) )
))
(declare-fun contains!5951 (List!21735 (_ BitVec 64)) Bool)

(assert (=> b!1024694 (= res!686062 (contains!5951 Nil!21732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024695 () Bool)

(declare-fun res!686061 () Bool)

(assert (=> b!1024695 (=> res!686061 e!577652)))

(assert (=> b!1024695 (= res!686061 (contains!5951 Nil!21732 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024696 () Bool)

(declare-fun res!686060 () Bool)

(assert (=> b!1024696 (=> res!686060 e!577652)))

(declare-fun noDuplicate!1467 (List!21735) Bool)

(assert (=> b!1024696 (= res!686060 (not (noDuplicate!1467 Nil!21732)))))

(declare-fun b!1024697 () Bool)

(assert (=> b!1024697 (= e!577652 true)))

(declare-fun lt!450686 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64256 (_ BitVec 32) List!21735) Bool)

(assert (=> b!1024697 (= lt!450686 (arrayNoDuplicates!0 (_keys!11144 thiss!1427) #b00000000000000000000000000000000 Nil!21732))))

(declare-fun b!1024698 () Bool)

(declare-fun e!577649 () Bool)

(declare-fun tp_is_empty!24103 () Bool)

(assert (=> b!1024698 (= e!577649 tp_is_empty!24103)))

(declare-fun b!1024699 () Bool)

(declare-fun e!577647 () Bool)

(declare-fun e!577653 () Bool)

(declare-fun mapRes!37583 () Bool)

(assert (=> b!1024699 (= e!577647 (and e!577653 mapRes!37583))))

(declare-fun condMapEmpty!37583 () Bool)

(declare-fun mapDefault!37583 () ValueCell!11348)

