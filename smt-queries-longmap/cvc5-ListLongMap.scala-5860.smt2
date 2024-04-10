; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75690 () Bool)

(assert start!75690)

(declare-fun b!889932 () Bool)

(declare-fun b_free!15661 () Bool)

(declare-fun b_next!15661 () Bool)

(assert (=> b!889932 (= b_free!15661 (not b_next!15661))))

(declare-fun tp!54952 () Bool)

(declare-fun b_and!25901 () Bool)

(assert (=> b!889932 (= tp!54952 b_and!25901)))

(declare-fun b!889930 () Bool)

(declare-fun e!496171 () Bool)

(declare-fun e!496167 () Bool)

(assert (=> b!889930 (= e!496171 e!496167)))

(declare-fun res!603059 () Bool)

(assert (=> b!889930 (=> (not res!603059) (not e!496167))))

(declare-datatypes ((array!51958 0))(
  ( (array!51959 (arr!24985 (Array (_ BitVec 32) (_ BitVec 64))) (size!25429 (_ BitVec 32))) )
))
(declare-datatypes ((V!28951 0))(
  ( (V!28952 (val!9045 Int)) )
))
(declare-datatypes ((ValueCell!8513 0))(
  ( (ValueCellFull!8513 (v!11523 V!28951)) (EmptyCell!8513) )
))
(declare-datatypes ((array!51960 0))(
  ( (array!51961 (arr!24986 (Array (_ BitVec 32) ValueCell!8513)) (size!25430 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4042 0))(
  ( (LongMapFixedSize!4043 (defaultEntry!5218 Int) (mask!25679 (_ BitVec 32)) (extraKeys!4912 (_ BitVec 32)) (zeroValue!5016 V!28951) (minValue!5016 V!28951) (_size!2076 (_ BitVec 32)) (_keys!9901 array!51958) (_values!5203 array!51960) (_vacant!2076 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4042)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889930 (= res!603059 (validMask!0 (mask!25679 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8786 0))(
  ( (MissingZero!8786 (index!37515 (_ BitVec 32))) (Found!8786 (index!37516 (_ BitVec 32))) (Intermediate!8786 (undefined!9598 Bool) (index!37517 (_ BitVec 32)) (x!75578 (_ BitVec 32))) (Undefined!8786) (MissingVacant!8786 (index!37518 (_ BitVec 32))) )
))
(declare-fun lt!402142 () SeekEntryResult!8786)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51958 (_ BitVec 32)) SeekEntryResult!8786)

(assert (=> b!889930 (= lt!402142 (seekEntry!0 key!785 (_keys!9901 thiss!1181) (mask!25679 thiss!1181)))))

(declare-fun e!496169 () Bool)

(declare-fun tp_is_empty!17989 () Bool)

(declare-fun e!496168 () Bool)

(declare-fun array_inv!19648 (array!51958) Bool)

(declare-fun array_inv!19649 (array!51960) Bool)

(assert (=> b!889932 (= e!496168 (and tp!54952 tp_is_empty!17989 (array_inv!19648 (_keys!9901 thiss!1181)) (array_inv!19649 (_values!5203 thiss!1181)) e!496169))))

(declare-fun b!889933 () Bool)

(declare-fun e!496170 () Bool)

(declare-fun mapRes!28538 () Bool)

(assert (=> b!889933 (= e!496169 (and e!496170 mapRes!28538))))

(declare-fun condMapEmpty!28538 () Bool)

(declare-fun mapDefault!28538 () ValueCell!8513)

