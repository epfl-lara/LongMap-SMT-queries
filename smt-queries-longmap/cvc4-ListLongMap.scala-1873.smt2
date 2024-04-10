; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33676 () Bool)

(assert start!33676)

(declare-fun b_free!6911 () Bool)

(declare-fun b_next!6911 () Bool)

(assert (=> start!33676 (= b_free!6911 (not b_next!6911))))

(declare-fun tp!24237 () Bool)

(declare-fun b_and!14091 () Bool)

(assert (=> start!33676 (= tp!24237 b_and!14091)))

(declare-fun b!334536 () Bool)

(declare-fun e!205348 () Bool)

(declare-fun e!205352 () Bool)

(assert (=> b!334536 (= e!205348 e!205352)))

(declare-fun res!184445 () Bool)

(assert (=> b!334536 (=> (not res!184445) (not e!205352))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3165 0))(
  ( (MissingZero!3165 (index!14839 (_ BitVec 32))) (Found!3165 (index!14840 (_ BitVec 32))) (Intermediate!3165 (undefined!3977 Bool) (index!14841 (_ BitVec 32)) (x!33331 (_ BitVec 32))) (Undefined!3165) (MissingVacant!3165 (index!14842 (_ BitVec 32))) )
))
(declare-fun lt!159541 () SeekEntryResult!3165)

(declare-datatypes ((array!17319 0))(
  ( (array!17320 (arr!8190 (Array (_ BitVec 32) (_ BitVec 64))) (size!8542 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17319)

(assert (=> b!334536 (= res!184445 (and (is-Found!3165 lt!159541) (= (select (arr!8190 _keys!1895) (index!14840 lt!159541)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17319 (_ BitVec 32)) SeekEntryResult!3165)

(assert (=> b!334536 (= lt!159541 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334538 () Bool)

(declare-fun res!184446 () Bool)

(assert (=> b!334538 (=> (not res!184446) (not e!205348))))

(declare-datatypes ((V!10127 0))(
  ( (V!10128 (val!3476 Int)) )
))
(declare-fun zeroValue!1467 () V!10127)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3088 0))(
  ( (ValueCellFull!3088 (v!5638 V!10127)) (EmptyCell!3088) )
))
(declare-datatypes ((array!17321 0))(
  ( (array!17322 (arr!8191 (Array (_ BitVec 32) ValueCell!3088)) (size!8543 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17321)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10127)

(declare-datatypes ((tuple2!5046 0))(
  ( (tuple2!5047 (_1!2534 (_ BitVec 64)) (_2!2534 V!10127)) )
))
(declare-datatypes ((List!4670 0))(
  ( (Nil!4667) (Cons!4666 (h!5522 tuple2!5046) (t!9758 List!4670)) )
))
(declare-datatypes ((ListLongMap!3959 0))(
  ( (ListLongMap!3960 (toList!1995 List!4670)) )
))
(declare-fun contains!2039 (ListLongMap!3959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1523 (array!17319 array!17321 (_ BitVec 32) (_ BitVec 32) V!10127 V!10127 (_ BitVec 32) Int) ListLongMap!3959)

(assert (=> b!334538 (= res!184446 (not (contains!2039 (getCurrentListMap!1523 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!334539 () Bool)

(assert (=> b!334539 (= e!205352 (not true))))

(declare-fun arrayContainsKey!0 (array!17319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334539 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10405 0))(
  ( (Unit!10406) )
))
(declare-fun lt!159540 () Unit!10405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17319 (_ BitVec 64) (_ BitVec 32)) Unit!10405)

(assert (=> b!334539 (= lt!159540 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14840 lt!159541)))))

(declare-fun b!334540 () Bool)

(declare-fun res!184448 () Bool)

(assert (=> b!334540 (=> (not res!184448) (not e!205348))))

(declare-datatypes ((List!4671 0))(
  ( (Nil!4668) (Cons!4667 (h!5523 (_ BitVec 64)) (t!9759 List!4671)) )
))
(declare-fun arrayNoDuplicates!0 (array!17319 (_ BitVec 32) List!4671) Bool)

(assert (=> b!334540 (= res!184448 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4668))))

(declare-fun b!334541 () Bool)

(declare-fun res!184450 () Bool)

(assert (=> b!334541 (=> (not res!184450) (not e!205348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334541 (= res!184450 (validKeyInArray!0 k!1348))))

(declare-fun b!334542 () Bool)

(declare-fun e!205353 () Bool)

(declare-fun e!205351 () Bool)

(declare-fun mapRes!11691 () Bool)

(assert (=> b!334542 (= e!205353 (and e!205351 mapRes!11691))))

(declare-fun condMapEmpty!11691 () Bool)

(declare-fun mapDefault!11691 () ValueCell!3088)

