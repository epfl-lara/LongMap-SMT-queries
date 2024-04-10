; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33736 () Bool)

(assert start!33736)

(declare-fun b_free!6971 () Bool)

(declare-fun b_next!6971 () Bool)

(assert (=> start!33736 (= b_free!6971 (not b_next!6971))))

(declare-fun tp!24416 () Bool)

(declare-fun b_and!14151 () Bool)

(assert (=> start!33736 (= tp!24416 b_and!14151)))

(declare-fun b!335526 () Bool)

(declare-fun res!185168 () Bool)

(declare-fun e!205965 () Bool)

(assert (=> b!335526 (=> (not res!185168) (not e!205965))))

(declare-datatypes ((array!17439 0))(
  ( (array!17440 (arr!8250 (Array (_ BitVec 32) (_ BitVec 64))) (size!8602 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17439)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17439 (_ BitVec 32)) Bool)

(assert (=> b!335526 (= res!185168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335527 () Bool)

(declare-fun e!205963 () Bool)

(assert (=> b!335527 (= e!205963 (not true))))

(declare-datatypes ((V!10207 0))(
  ( (V!10208 (val!3506 Int)) )
))
(declare-datatypes ((tuple2!5094 0))(
  ( (tuple2!5095 (_1!2558 (_ BitVec 64)) (_2!2558 V!10207)) )
))
(declare-datatypes ((List!4713 0))(
  ( (Nil!4710) (Cons!4709 (h!5565 tuple2!5094) (t!9801 List!4713)) )
))
(declare-datatypes ((ListLongMap!4007 0))(
  ( (ListLongMap!4008 (toList!2019 List!4713)) )
))
(declare-fun lt!159865 () ListLongMap!4007)

(declare-datatypes ((SeekEntryResult!3190 0))(
  ( (MissingZero!3190 (index!14939 (_ BitVec 32))) (Found!3190 (index!14940 (_ BitVec 32))) (Intermediate!3190 (undefined!4002 Bool) (index!14941 (_ BitVec 32)) (x!33436 (_ BitVec 32))) (Undefined!3190) (MissingVacant!3190 (index!14942 (_ BitVec 32))) )
))
(declare-fun lt!159862 () SeekEntryResult!3190)

(declare-fun contains!2063 (ListLongMap!4007 (_ BitVec 64)) Bool)

(assert (=> b!335527 (contains!2063 lt!159865 (select (arr!8250 _keys!1895) (index!14940 lt!159862)))))

(declare-fun zeroValue!1467 () V!10207)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3118 0))(
  ( (ValueCellFull!3118 (v!5668 V!10207)) (EmptyCell!3118) )
))
(declare-datatypes ((array!17441 0))(
  ( (array!17442 (arr!8251 (Array (_ BitVec 32) ValueCell!3118)) (size!8603 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17441)

(declare-datatypes ((Unit!10445 0))(
  ( (Unit!10446) )
))
(declare-fun lt!159864 () Unit!10445)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10207)

(declare-fun lemmaValidKeyInArrayIsInListMap!169 (array!17439 array!17441 (_ BitVec 32) (_ BitVec 32) V!10207 V!10207 (_ BitVec 32) Int) Unit!10445)

(assert (=> b!335527 (= lt!159864 (lemmaValidKeyInArrayIsInListMap!169 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14940 lt!159862) defaultEntry!1528))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335527 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159863 () Unit!10445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17439 (_ BitVec 64) (_ BitVec 32)) Unit!10445)

(assert (=> b!335527 (= lt!159863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14940 lt!159862)))))

(declare-fun b!335529 () Bool)

(declare-fun res!185171 () Bool)

(assert (=> b!335529 (=> (not res!185171) (not e!205965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335529 (= res!185171 (validKeyInArray!0 k!1348))))

(declare-fun b!335530 () Bool)

(declare-fun res!185167 () Bool)

(assert (=> b!335530 (=> (not res!185167) (not e!205963))))

(assert (=> b!335530 (= res!185167 (arrayContainsKey!0 _keys!1895 k!1348 (index!14940 lt!159862)))))

(declare-fun b!335531 () Bool)

(declare-fun e!205959 () Bool)

(assert (=> b!335531 (= e!205959 e!205963)))

(declare-fun res!185169 () Bool)

(assert (=> b!335531 (=> (not res!185169) (not e!205963))))

(assert (=> b!335531 (= res!185169 (and (is-Found!3190 lt!159862) (= (select (arr!8250 _keys!1895) (index!14940 lt!159862)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17439 (_ BitVec 32)) SeekEntryResult!3190)

(assert (=> b!335531 (= lt!159862 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335532 () Bool)

(declare-fun res!185170 () Bool)

(assert (=> b!335532 (=> (not res!185170) (not e!205965))))

(declare-datatypes ((List!4714 0))(
  ( (Nil!4711) (Cons!4710 (h!5566 (_ BitVec 64)) (t!9802 List!4714)) )
))
(declare-fun arrayNoDuplicates!0 (array!17439 (_ BitVec 32) List!4714) Bool)

(assert (=> b!335532 (= res!185170 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4711))))

(declare-fun mapIsEmpty!11781 () Bool)

(declare-fun mapRes!11781 () Bool)

(assert (=> mapIsEmpty!11781 mapRes!11781))

(declare-fun b!335533 () Bool)

(declare-fun e!205962 () Bool)

(declare-fun tp_is_empty!6923 () Bool)

(assert (=> b!335533 (= e!205962 tp_is_empty!6923)))

(declare-fun b!335534 () Bool)

(declare-fun e!205961 () Bool)

(assert (=> b!335534 (= e!205961 tp_is_empty!6923)))

(declare-fun b!335535 () Bool)

(declare-fun e!205964 () Bool)

(assert (=> b!335535 (= e!205964 (and e!205962 mapRes!11781))))

(declare-fun condMapEmpty!11781 () Bool)

(declare-fun mapDefault!11781 () ValueCell!3118)

