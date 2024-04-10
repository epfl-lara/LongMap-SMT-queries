; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33658 () Bool)

(assert start!33658)

(declare-fun b_free!6893 () Bool)

(declare-fun b_next!6893 () Bool)

(assert (=> start!33658 (= b_free!6893 (not b_next!6893))))

(declare-fun tp!24183 () Bool)

(declare-fun b_and!14073 () Bool)

(assert (=> start!33658 (= tp!24183 b_and!14073)))

(declare-fun b!334239 () Bool)

(declare-fun e!205189 () Bool)

(assert (=> b!334239 (= e!205189 (not true))))

(declare-datatypes ((array!17283 0))(
  ( (array!17284 (arr!8172 (Array (_ BitVec 32) (_ BitVec 64))) (size!8524 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17283)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334239 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3158 0))(
  ( (MissingZero!3158 (index!14811 (_ BitVec 32))) (Found!3158 (index!14812 (_ BitVec 32))) (Intermediate!3158 (undefined!3970 Bool) (index!14813 (_ BitVec 32)) (x!33300 (_ BitVec 32))) (Undefined!3158) (MissingVacant!3158 (index!14814 (_ BitVec 32))) )
))
(declare-fun lt!159487 () SeekEntryResult!3158)

(declare-datatypes ((Unit!10395 0))(
  ( (Unit!10396) )
))
(declare-fun lt!159486 () Unit!10395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17283 (_ BitVec 64) (_ BitVec 32)) Unit!10395)

(assert (=> b!334239 (= lt!159486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14812 lt!159487)))))

(declare-fun b!334240 () Bool)

(declare-fun res!184229 () Bool)

(declare-fun e!205191 () Bool)

(assert (=> b!334240 (=> (not res!184229) (not e!205191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334240 (= res!184229 (validKeyInArray!0 k!1348))))

(declare-fun b!334241 () Bool)

(declare-fun res!184230 () Bool)

(assert (=> b!334241 (=> (not res!184230) (not e!205191))))

(declare-datatypes ((List!4658 0))(
  ( (Nil!4655) (Cons!4654 (h!5510 (_ BitVec 64)) (t!9746 List!4658)) )
))
(declare-fun arrayNoDuplicates!0 (array!17283 (_ BitVec 32) List!4658) Bool)

(assert (=> b!334241 (= res!184230 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4655))))

(declare-fun b!334242 () Bool)

(declare-fun e!205186 () Bool)

(declare-fun tp_is_empty!6845 () Bool)

(assert (=> b!334242 (= e!205186 tp_is_empty!6845)))

(declare-fun b!334244 () Bool)

(declare-fun e!205190 () Bool)

(declare-fun mapRes!11664 () Bool)

(assert (=> b!334244 (= e!205190 (and e!205186 mapRes!11664))))

(declare-fun condMapEmpty!11664 () Bool)

(declare-datatypes ((V!10103 0))(
  ( (V!10104 (val!3467 Int)) )
))
(declare-datatypes ((ValueCell!3079 0))(
  ( (ValueCellFull!3079 (v!5629 V!10103)) (EmptyCell!3079) )
))
(declare-datatypes ((array!17285 0))(
  ( (array!17286 (arr!8173 (Array (_ BitVec 32) ValueCell!3079)) (size!8525 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17285)

(declare-fun mapDefault!11664 () ValueCell!3079)

