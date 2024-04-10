; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33672 () Bool)

(assert start!33672)

(declare-fun b_free!6907 () Bool)

(declare-fun b_next!6907 () Bool)

(assert (=> start!33672 (= b_free!6907 (not b_next!6907))))

(declare-fun tp!24225 () Bool)

(declare-fun b_and!14087 () Bool)

(assert (=> start!33672 (= tp!24225 b_and!14087)))

(declare-fun b!334470 () Bool)

(declare-fun e!205312 () Bool)

(declare-fun tp_is_empty!6859 () Bool)

(assert (=> b!334470 (= e!205312 tp_is_empty!6859)))

(declare-fun b!334471 () Bool)

(declare-fun res!184399 () Bool)

(declare-fun e!205317 () Bool)

(assert (=> b!334471 (=> (not res!184399) (not e!205317))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334471 (= res!184399 (validKeyInArray!0 k!1348))))

(declare-fun b!334472 () Bool)

(declare-fun e!205314 () Bool)

(assert (=> b!334472 (= e!205317 e!205314)))

(declare-fun res!184403 () Bool)

(assert (=> b!334472 (=> (not res!184403) (not e!205314))))

(declare-datatypes ((SeekEntryResult!3163 0))(
  ( (MissingZero!3163 (index!14831 (_ BitVec 32))) (Found!3163 (index!14832 (_ BitVec 32))) (Intermediate!3163 (undefined!3975 Bool) (index!14833 (_ BitVec 32)) (x!33329 (_ BitVec 32))) (Undefined!3163) (MissingVacant!3163 (index!14834 (_ BitVec 32))) )
))
(declare-fun lt!159528 () SeekEntryResult!3163)

(declare-datatypes ((array!17311 0))(
  ( (array!17312 (arr!8186 (Array (_ BitVec 32) (_ BitVec 64))) (size!8538 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17311)

(assert (=> b!334472 (= res!184403 (and (is-Found!3163 lt!159528) (= (select (arr!8186 _keys!1895) (index!14832 lt!159528)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17311 (_ BitVec 32)) SeekEntryResult!3163)

(assert (=> b!334472 (= lt!159528 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334473 () Bool)

(assert (=> b!334473 (= e!205314 (not true))))

(declare-fun arrayContainsKey!0 (array!17311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334473 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10401 0))(
  ( (Unit!10402) )
))
(declare-fun lt!159529 () Unit!10401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17311 (_ BitVec 64) (_ BitVec 32)) Unit!10401)

(assert (=> b!334473 (= lt!159529 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14832 lt!159528)))))

(declare-fun mapNonEmpty!11685 () Bool)

(declare-fun mapRes!11685 () Bool)

(declare-fun tp!24224 () Bool)

(declare-fun e!205313 () Bool)

(assert (=> mapNonEmpty!11685 (= mapRes!11685 (and tp!24224 e!205313))))

(declare-datatypes ((V!10123 0))(
  ( (V!10124 (val!3474 Int)) )
))
(declare-datatypes ((ValueCell!3086 0))(
  ( (ValueCellFull!3086 (v!5636 V!10123)) (EmptyCell!3086) )
))
(declare-datatypes ((array!17313 0))(
  ( (array!17314 (arr!8187 (Array (_ BitVec 32) ValueCell!3086)) (size!8539 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17313)

(declare-fun mapValue!11685 () ValueCell!3086)

(declare-fun mapRest!11685 () (Array (_ BitVec 32) ValueCell!3086))

(declare-fun mapKey!11685 () (_ BitVec 32))

(assert (=> mapNonEmpty!11685 (= (arr!8187 _values!1525) (store mapRest!11685 mapKey!11685 mapValue!11685))))

(declare-fun b!334474 () Bool)

(declare-fun res!184396 () Bool)

(assert (=> b!334474 (=> (not res!184396) (not e!205317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17311 (_ BitVec 32)) Bool)

(assert (=> b!334474 (= res!184396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11685 () Bool)

(assert (=> mapIsEmpty!11685 mapRes!11685))

(declare-fun b!334475 () Bool)

(declare-fun res!184400 () Bool)

(assert (=> b!334475 (=> (not res!184400) (not e!205317))))

(declare-datatypes ((List!4666 0))(
  ( (Nil!4663) (Cons!4662 (h!5518 (_ BitVec 64)) (t!9754 List!4666)) )
))
(declare-fun arrayNoDuplicates!0 (array!17311 (_ BitVec 32) List!4666) Bool)

(assert (=> b!334475 (= res!184400 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4663))))

(declare-fun b!334476 () Bool)

(declare-fun res!184402 () Bool)

(assert (=> b!334476 (=> (not res!184402) (not e!205317))))

(declare-fun zeroValue!1467 () V!10123)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10123)

(declare-datatypes ((tuple2!5042 0))(
  ( (tuple2!5043 (_1!2532 (_ BitVec 64)) (_2!2532 V!10123)) )
))
(declare-datatypes ((List!4667 0))(
  ( (Nil!4664) (Cons!4663 (h!5519 tuple2!5042) (t!9755 List!4667)) )
))
(declare-datatypes ((ListLongMap!3955 0))(
  ( (ListLongMap!3956 (toList!1993 List!4667)) )
))
(declare-fun contains!2037 (ListLongMap!3955 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1521 (array!17311 array!17313 (_ BitVec 32) (_ BitVec 32) V!10123 V!10123 (_ BitVec 32) Int) ListLongMap!3955)

(assert (=> b!334476 (= res!184402 (not (contains!2037 (getCurrentListMap!1521 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!184401 () Bool)

(assert (=> start!33672 (=> (not res!184401) (not e!205317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33672 (= res!184401 (validMask!0 mask!2385))))

(assert (=> start!33672 e!205317))

(assert (=> start!33672 true))

(assert (=> start!33672 tp_is_empty!6859))

(assert (=> start!33672 tp!24225))

(declare-fun e!205316 () Bool)

(declare-fun array_inv!6086 (array!17313) Bool)

(assert (=> start!33672 (and (array_inv!6086 _values!1525) e!205316)))

(declare-fun array_inv!6087 (array!17311) Bool)

(assert (=> start!33672 (array_inv!6087 _keys!1895)))

(declare-fun b!334477 () Bool)

(assert (=> b!334477 (= e!205316 (and e!205312 mapRes!11685))))

(declare-fun condMapEmpty!11685 () Bool)

(declare-fun mapDefault!11685 () ValueCell!3086)

