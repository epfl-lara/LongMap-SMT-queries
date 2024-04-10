; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75678 () Bool)

(assert start!75678)

(declare-fun b!889776 () Bool)

(declare-fun b_free!15649 () Bool)

(declare-fun b_next!15649 () Bool)

(assert (=> b!889776 (= b_free!15649 (not b_next!15649))))

(declare-fun tp!54915 () Bool)

(declare-fun b_and!25889 () Bool)

(assert (=> b!889776 (= tp!54915 b_and!25889)))

(declare-fun res!602967 () Bool)

(declare-fun e!496043 () Bool)

(assert (=> start!75678 (=> (not res!602967) (not e!496043))))

(declare-datatypes ((array!51934 0))(
  ( (array!51935 (arr!24973 (Array (_ BitVec 32) (_ BitVec 64))) (size!25417 (_ BitVec 32))) )
))
(declare-datatypes ((V!28935 0))(
  ( (V!28936 (val!9039 Int)) )
))
(declare-datatypes ((ValueCell!8507 0))(
  ( (ValueCellFull!8507 (v!11517 V!28935)) (EmptyCell!8507) )
))
(declare-datatypes ((array!51936 0))(
  ( (array!51937 (arr!24974 (Array (_ BitVec 32) ValueCell!8507)) (size!25418 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4030 0))(
  ( (LongMapFixedSize!4031 (defaultEntry!5212 Int) (mask!25669 (_ BitVec 32)) (extraKeys!4906 (_ BitVec 32)) (zeroValue!5010 V!28935) (minValue!5010 V!28935) (_size!2070 (_ BitVec 32)) (_keys!9895 array!51934) (_values!5197 array!51936) (_vacant!2070 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4030)

(declare-fun valid!1566 (LongMapFixedSize!4030) Bool)

(assert (=> start!75678 (= res!602967 (valid!1566 thiss!1181))))

(assert (=> start!75678 e!496043))

(declare-fun e!496046 () Bool)

(assert (=> start!75678 e!496046))

(assert (=> start!75678 true))

(declare-fun b!889768 () Bool)

(declare-fun e!496041 () Bool)

(assert (=> b!889768 (= e!496043 e!496041)))

(declare-fun res!602966 () Bool)

(assert (=> b!889768 (=> (not res!602966) (not e!496041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889768 (= res!602966 (validMask!0 (mask!25669 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8782 0))(
  ( (MissingZero!8782 (index!37499 (_ BitVec 32))) (Found!8782 (index!37500 (_ BitVec 32))) (Intermediate!8782 (undefined!9594 Bool) (index!37501 (_ BitVec 32)) (x!75558 (_ BitVec 32))) (Undefined!8782) (MissingVacant!8782 (index!37502 (_ BitVec 32))) )
))
(declare-fun lt!402105 () SeekEntryResult!8782)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51934 (_ BitVec 32)) SeekEntryResult!8782)

(assert (=> b!889768 (= lt!402105 (seekEntry!0 key!785 (_keys!9895 thiss!1181) (mask!25669 thiss!1181)))))

(declare-fun mapIsEmpty!28520 () Bool)

(declare-fun mapRes!28520 () Bool)

(assert (=> mapIsEmpty!28520 mapRes!28520))

(declare-fun b!889769 () Bool)

(assert (=> b!889769 (= e!496041 false)))

(declare-fun lt!402106 () Bool)

(declare-datatypes ((List!17710 0))(
  ( (Nil!17707) (Cons!17706 (h!18837 (_ BitVec 64)) (t!25009 List!17710)) )
))
(declare-fun arrayNoDuplicates!0 (array!51934 (_ BitVec 32) List!17710) Bool)

(assert (=> b!889769 (= lt!402106 (arrayNoDuplicates!0 (_keys!9895 thiss!1181) #b00000000000000000000000000000000 Nil!17707))))

(declare-fun b!889770 () Bool)

(declare-fun e!496045 () Bool)

(declare-fun e!496044 () Bool)

(assert (=> b!889770 (= e!496045 (and e!496044 mapRes!28520))))

(declare-fun condMapEmpty!28520 () Bool)

(declare-fun mapDefault!28520 () ValueCell!8507)

