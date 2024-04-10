; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33724 () Bool)

(assert start!33724)

(declare-fun b_free!6959 () Bool)

(declare-fun b_next!6959 () Bool)

(assert (=> start!33724 (= b_free!6959 (not b_next!6959))))

(declare-fun tp!24380 () Bool)

(declare-fun b_and!14139 () Bool)

(assert (=> start!33724 (= tp!24380 b_and!14139)))

(declare-fun b!335328 () Bool)

(declare-fun e!205837 () Bool)

(declare-fun tp_is_empty!6911 () Bool)

(assert (=> b!335328 (= e!205837 tp_is_empty!6911)))

(declare-fun b!335329 () Bool)

(declare-fun res!185024 () Bool)

(declare-fun e!205833 () Bool)

(assert (=> b!335329 (=> (not res!185024) (not e!205833))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10191 0))(
  ( (V!10192 (val!3500 Int)) )
))
(declare-datatypes ((ValueCell!3112 0))(
  ( (ValueCellFull!3112 (v!5662 V!10191)) (EmptyCell!3112) )
))
(declare-datatypes ((array!17415 0))(
  ( (array!17416 (arr!8238 (Array (_ BitVec 32) ValueCell!3112)) (size!8590 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17415)

(declare-datatypes ((array!17417 0))(
  ( (array!17418 (arr!8239 (Array (_ BitVec 32) (_ BitVec 64))) (size!8591 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17417)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335329 (= res!185024 (and (= (size!8590 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8591 _keys!1895) (size!8590 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11763 () Bool)

(declare-fun mapRes!11763 () Bool)

(assert (=> mapIsEmpty!11763 mapRes!11763))

(declare-fun b!335331 () Bool)

(declare-fun res!185020 () Bool)

(assert (=> b!335331 (=> (not res!185020) (not e!205833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17417 (_ BitVec 32)) Bool)

(assert (=> b!335331 (= res!185020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335332 () Bool)

(declare-fun res!185027 () Bool)

(assert (=> b!335332 (=> (not res!185027) (not e!205833))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335332 (= res!185027 (validKeyInArray!0 k!1348))))

(declare-fun b!335333 () Bool)

(declare-fun res!185023 () Bool)

(declare-fun e!205834 () Bool)

(assert (=> b!335333 (=> (not res!185023) (not e!205834))))

(declare-datatypes ((SeekEntryResult!3185 0))(
  ( (MissingZero!3185 (index!14919 (_ BitVec 32))) (Found!3185 (index!14920 (_ BitVec 32))) (Intermediate!3185 (undefined!3997 Bool) (index!14921 (_ BitVec 32)) (x!33415 (_ BitVec 32))) (Undefined!3185) (MissingVacant!3185 (index!14922 (_ BitVec 32))) )
))
(declare-fun lt!159792 () SeekEntryResult!3185)

(declare-fun arrayContainsKey!0 (array!17417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335333 (= res!185023 (arrayContainsKey!0 _keys!1895 k!1348 (index!14920 lt!159792)))))

(declare-fun mapNonEmpty!11763 () Bool)

(declare-fun tp!24381 () Bool)

(declare-fun e!205838 () Bool)

(assert (=> mapNonEmpty!11763 (= mapRes!11763 (and tp!24381 e!205838))))

(declare-fun mapKey!11763 () (_ BitVec 32))

(declare-fun mapValue!11763 () ValueCell!3112)

(declare-fun mapRest!11763 () (Array (_ BitVec 32) ValueCell!3112))

(assert (=> mapNonEmpty!11763 (= (arr!8238 _values!1525) (store mapRest!11763 mapKey!11763 mapValue!11763))))

(declare-fun b!335334 () Bool)

(declare-fun e!205839 () Bool)

(assert (=> b!335334 (= e!205833 e!205839)))

(declare-fun res!185022 () Bool)

(assert (=> b!335334 (=> (not res!185022) (not e!205839))))

(declare-datatypes ((tuple2!5082 0))(
  ( (tuple2!5083 (_1!2552 (_ BitVec 64)) (_2!2552 V!10191)) )
))
(declare-datatypes ((List!4703 0))(
  ( (Nil!4700) (Cons!4699 (h!5555 tuple2!5082) (t!9791 List!4703)) )
))
(declare-datatypes ((ListLongMap!3995 0))(
  ( (ListLongMap!3996 (toList!2013 List!4703)) )
))
(declare-fun lt!159793 () ListLongMap!3995)

(declare-fun contains!2057 (ListLongMap!3995 (_ BitVec 64)) Bool)

(assert (=> b!335334 (= res!185022 (not (contains!2057 lt!159793 k!1348)))))

(declare-fun zeroValue!1467 () V!10191)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10191)

(declare-fun getCurrentListMap!1537 (array!17417 array!17415 (_ BitVec 32) (_ BitVec 32) V!10191 V!10191 (_ BitVec 32) Int) ListLongMap!3995)

(assert (=> b!335334 (= lt!159793 (getCurrentListMap!1537 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335335 () Bool)

(declare-fun e!205835 () Bool)

(assert (=> b!335335 (= e!205835 (and e!205837 mapRes!11763))))

(declare-fun condMapEmpty!11763 () Bool)

(declare-fun mapDefault!11763 () ValueCell!3112)

