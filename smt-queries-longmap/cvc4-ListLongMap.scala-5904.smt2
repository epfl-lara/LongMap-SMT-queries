; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76358 () Bool)

(assert start!76358)

(declare-fun b!895927 () Bool)

(declare-fun b_free!15929 () Bool)

(declare-fun b_next!15929 () Bool)

(assert (=> b!895927 (= b_free!15929 (not b_next!15929))))

(declare-fun tp!55805 () Bool)

(declare-fun b_and!26221 () Bool)

(assert (=> b!895927 (= tp!55805 b_and!26221)))

(declare-fun b!895921 () Bool)

(declare-fun e!500666 () Bool)

(declare-fun tp_is_empty!18257 () Bool)

(assert (=> b!895921 (= e!500666 tp_is_empty!18257)))

(declare-fun b!895922 () Bool)

(declare-fun e!500662 () Bool)

(assert (=> b!895922 (= e!500662 tp_is_empty!18257)))

(declare-fun res!605934 () Bool)

(declare-fun e!500663 () Bool)

(assert (=> start!76358 (=> (not res!605934) (not e!500663))))

(declare-datatypes ((array!52522 0))(
  ( (array!52523 (arr!25253 (Array (_ BitVec 32) (_ BitVec 64))) (size!25703 (_ BitVec 32))) )
))
(declare-datatypes ((V!29307 0))(
  ( (V!29308 (val!9179 Int)) )
))
(declare-datatypes ((ValueCell!8647 0))(
  ( (ValueCellFull!8647 (v!11669 V!29307)) (EmptyCell!8647) )
))
(declare-datatypes ((array!52524 0))(
  ( (array!52525 (arr!25254 (Array (_ BitVec 32) ValueCell!8647)) (size!25704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4310 0))(
  ( (LongMapFixedSize!4311 (defaultEntry!5367 Int) (mask!25981 (_ BitVec 32)) (extraKeys!5063 (_ BitVec 32)) (zeroValue!5167 V!29307) (minValue!5167 V!29307) (_size!2210 (_ BitVec 32)) (_keys!10088 array!52522) (_values!5354 array!52524) (_vacant!2210 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4310)

(declare-fun valid!1662 (LongMapFixedSize!4310) Bool)

(assert (=> start!76358 (= res!605934 (valid!1662 thiss!1181))))

(assert (=> start!76358 e!500663))

(declare-fun e!500661 () Bool)

(assert (=> start!76358 e!500661))

(assert (=> start!76358 true))

(declare-fun b!895923 () Bool)

(declare-fun e!500660 () Bool)

(declare-datatypes ((SeekEntryResult!8888 0))(
  ( (MissingZero!8888 (index!37923 (_ BitVec 32))) (Found!8888 (index!37924 (_ BitVec 32))) (Intermediate!8888 (undefined!9700 Bool) (index!37925 (_ BitVec 32)) (x!76248 (_ BitVec 32))) (Undefined!8888) (MissingVacant!8888 (index!37926 (_ BitVec 32))) )
))
(declare-fun lt!404637 () SeekEntryResult!8888)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!895923 (= e!500660 (inRange!0 (index!37924 lt!404637) (mask!25981 thiss!1181)))))

(declare-fun b!895924 () Bool)

(declare-fun e!500664 () Bool)

(declare-fun mapRes!28990 () Bool)

(assert (=> b!895924 (= e!500664 (and e!500666 mapRes!28990))))

(declare-fun condMapEmpty!28990 () Bool)

(declare-fun mapDefault!28990 () ValueCell!8647)

