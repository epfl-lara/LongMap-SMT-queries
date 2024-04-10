; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33652 () Bool)

(assert start!33652)

(declare-fun b_free!6887 () Bool)

(declare-fun b_next!6887 () Bool)

(assert (=> start!33652 (= b_free!6887 (not b_next!6887))))

(declare-fun tp!24165 () Bool)

(declare-fun b_and!14067 () Bool)

(assert (=> start!33652 (= tp!24165 b_and!14067)))

(declare-fun b!334140 () Bool)

(declare-fun res!184163 () Bool)

(declare-fun e!205136 () Bool)

(assert (=> b!334140 (=> (not res!184163) (not e!205136))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10095 0))(
  ( (V!10096 (val!3464 Int)) )
))
(declare-fun zeroValue!1467 () V!10095)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3076 0))(
  ( (ValueCellFull!3076 (v!5626 V!10095)) (EmptyCell!3076) )
))
(declare-datatypes ((array!17271 0))(
  ( (array!17272 (arr!8166 (Array (_ BitVec 32) ValueCell!3076)) (size!8518 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17271)

(declare-datatypes ((array!17273 0))(
  ( (array!17274 (arr!8167 (Array (_ BitVec 32) (_ BitVec 64))) (size!8519 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17273)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10095)

(declare-datatypes ((tuple2!5032 0))(
  ( (tuple2!5033 (_1!2527 (_ BitVec 64)) (_2!2527 V!10095)) )
))
(declare-datatypes ((List!4652 0))(
  ( (Nil!4649) (Cons!4648 (h!5504 tuple2!5032) (t!9740 List!4652)) )
))
(declare-datatypes ((ListLongMap!3945 0))(
  ( (ListLongMap!3946 (toList!1988 List!4652)) )
))
(declare-fun contains!2032 (ListLongMap!3945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1516 (array!17273 array!17271 (_ BitVec 32) (_ BitVec 32) V!10095 V!10095 (_ BitVec 32) Int) ListLongMap!3945)

(assert (=> b!334140 (= res!184163 (not (contains!2032 (getCurrentListMap!1516 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!11655 () Bool)

(declare-fun mapRes!11655 () Bool)

(assert (=> mapIsEmpty!11655 mapRes!11655))

(declare-fun b!334141 () Bool)

(declare-fun e!205137 () Bool)

(declare-fun tp_is_empty!6839 () Bool)

(assert (=> b!334141 (= e!205137 tp_is_empty!6839)))

(declare-fun b!334142 () Bool)

(declare-fun e!205135 () Bool)

(assert (=> b!334142 (= e!205135 tp_is_empty!6839)))

(declare-fun mapNonEmpty!11655 () Bool)

(declare-fun tp!24164 () Bool)

(assert (=> mapNonEmpty!11655 (= mapRes!11655 (and tp!24164 e!205135))))

(declare-fun mapValue!11655 () ValueCell!3076)

(declare-fun mapKey!11655 () (_ BitVec 32))

(declare-fun mapRest!11655 () (Array (_ BitVec 32) ValueCell!3076))

(assert (=> mapNonEmpty!11655 (= (arr!8166 _values!1525) (store mapRest!11655 mapKey!11655 mapValue!11655))))

(declare-fun b!334143 () Bool)

(declare-fun e!205132 () Bool)

(assert (=> b!334143 (= e!205132 (not true))))

(declare-fun arrayContainsKey!0 (array!17273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334143 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10389 0))(
  ( (Unit!10390) )
))
(declare-fun lt!159468 () Unit!10389)

(declare-datatypes ((SeekEntryResult!3155 0))(
  ( (MissingZero!3155 (index!14799 (_ BitVec 32))) (Found!3155 (index!14800 (_ BitVec 32))) (Intermediate!3155 (undefined!3967 Bool) (index!14801 (_ BitVec 32)) (x!33289 (_ BitVec 32))) (Undefined!3155) (MissingVacant!3155 (index!14802 (_ BitVec 32))) )
))
(declare-fun lt!159469 () SeekEntryResult!3155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17273 (_ BitVec 64) (_ BitVec 32)) Unit!10389)

(assert (=> b!334143 (= lt!159468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14800 lt!159469)))))

(declare-fun res!184157 () Bool)

(assert (=> start!33652 (=> (not res!184157) (not e!205136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33652 (= res!184157 (validMask!0 mask!2385))))

(assert (=> start!33652 e!205136))

(assert (=> start!33652 true))

(assert (=> start!33652 tp_is_empty!6839))

(assert (=> start!33652 tp!24165))

(declare-fun e!205134 () Bool)

(declare-fun array_inv!6072 (array!17271) Bool)

(assert (=> start!33652 (and (array_inv!6072 _values!1525) e!205134)))

(declare-fun array_inv!6073 (array!17273) Bool)

(assert (=> start!33652 (array_inv!6073 _keys!1895)))

(declare-fun b!334144 () Bool)

(declare-fun res!184160 () Bool)

(assert (=> b!334144 (=> (not res!184160) (not e!205136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334144 (= res!184160 (validKeyInArray!0 k!1348))))

(declare-fun b!334145 () Bool)

(declare-fun res!184156 () Bool)

(assert (=> b!334145 (=> (not res!184156) (not e!205136))))

(declare-datatypes ((List!4653 0))(
  ( (Nil!4650) (Cons!4649 (h!5505 (_ BitVec 64)) (t!9741 List!4653)) )
))
(declare-fun arrayNoDuplicates!0 (array!17273 (_ BitVec 32) List!4653) Bool)

(assert (=> b!334145 (= res!184156 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4650))))

(declare-fun b!334146 () Bool)

(assert (=> b!334146 (= e!205134 (and e!205137 mapRes!11655))))

(declare-fun condMapEmpty!11655 () Bool)

(declare-fun mapDefault!11655 () ValueCell!3076)

