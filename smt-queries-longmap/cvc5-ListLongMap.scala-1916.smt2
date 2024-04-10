; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34086 () Bool)

(assert start!34086)

(declare-fun b_free!7165 () Bool)

(declare-fun b_next!7165 () Bool)

(assert (=> start!34086 (= b_free!7165 (not b_next!7165))))

(declare-fun tp!25019 () Bool)

(declare-fun b_and!14359 () Bool)

(assert (=> start!34086 (= tp!25019 b_and!14359)))

(declare-fun b!339729 () Bool)

(declare-fun res!187662 () Bool)

(declare-fun e!208423 () Bool)

(assert (=> b!339729 (=> (not res!187662) (not e!208423))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10467 0))(
  ( (V!10468 (val!3603 Int)) )
))
(declare-datatypes ((ValueCell!3215 0))(
  ( (ValueCellFull!3215 (v!5772 V!10467)) (EmptyCell!3215) )
))
(declare-datatypes ((array!17833 0))(
  ( (array!17834 (arr!8440 (Array (_ BitVec 32) ValueCell!3215)) (size!8792 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17833)

(declare-datatypes ((array!17835 0))(
  ( (array!17836 (arr!8441 (Array (_ BitVec 32) (_ BitVec 64))) (size!8793 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17835)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339729 (= res!187662 (and (= (size!8792 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8793 _keys!1895) (size!8792 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339731 () Bool)

(declare-fun res!187664 () Bool)

(assert (=> b!339731 (=> (not res!187664) (not e!208423))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10467)

(declare-fun minValue!1467 () V!10467)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5232 0))(
  ( (tuple2!5233 (_1!2627 (_ BitVec 64)) (_2!2627 V!10467)) )
))
(declare-datatypes ((List!4851 0))(
  ( (Nil!4848) (Cons!4847 (h!5703 tuple2!5232) (t!9953 List!4851)) )
))
(declare-datatypes ((ListLongMap!4145 0))(
  ( (ListLongMap!4146 (toList!2088 List!4851)) )
))
(declare-fun contains!2139 (ListLongMap!4145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1609 (array!17835 array!17833 (_ BitVec 32) (_ BitVec 32) V!10467 V!10467 (_ BitVec 32) Int) ListLongMap!4145)

(assert (=> b!339731 (= res!187664 (not (contains!2139 (getCurrentListMap!1609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12093 () Bool)

(declare-fun mapRes!12093 () Bool)

(assert (=> mapIsEmpty!12093 mapRes!12093))

(declare-fun b!339732 () Bool)

(declare-fun e!208425 () Bool)

(declare-fun tp_is_empty!7117 () Bool)

(assert (=> b!339732 (= e!208425 tp_is_empty!7117)))

(declare-fun b!339733 () Bool)

(declare-datatypes ((SeekEntryResult!3260 0))(
  ( (MissingZero!3260 (index!15219 (_ BitVec 32))) (Found!3260 (index!15220 (_ BitVec 32))) (Intermediate!3260 (undefined!4072 Bool) (index!15221 (_ BitVec 32)) (x!33840 (_ BitVec 32))) (Undefined!3260) (MissingVacant!3260 (index!15222 (_ BitVec 32))) )
))
(declare-fun lt!161266 () SeekEntryResult!3260)

(assert (=> b!339733 (= e!208423 (and (not (is-Found!3260 lt!161266)) (not (is-MissingZero!3260 lt!161266)) (is-MissingVacant!3260 lt!161266) (bvsge #b00000000000000000000000000000000 (size!8793 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17835 (_ BitVec 32)) SeekEntryResult!3260)

(assert (=> b!339733 (= lt!161266 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339734 () Bool)

(declare-fun res!187665 () Bool)

(assert (=> b!339734 (=> (not res!187665) (not e!208423))))

(declare-datatypes ((List!4852 0))(
  ( (Nil!4849) (Cons!4848 (h!5704 (_ BitVec 64)) (t!9954 List!4852)) )
))
(declare-fun arrayNoDuplicates!0 (array!17835 (_ BitVec 32) List!4852) Bool)

(assert (=> b!339734 (= res!187665 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4849))))

(declare-fun mapNonEmpty!12093 () Bool)

(declare-fun tp!25020 () Bool)

(declare-fun e!208424 () Bool)

(assert (=> mapNonEmpty!12093 (= mapRes!12093 (and tp!25020 e!208424))))

(declare-fun mapValue!12093 () ValueCell!3215)

(declare-fun mapKey!12093 () (_ BitVec 32))

(declare-fun mapRest!12093 () (Array (_ BitVec 32) ValueCell!3215))

(assert (=> mapNonEmpty!12093 (= (arr!8440 _values!1525) (store mapRest!12093 mapKey!12093 mapValue!12093))))

(declare-fun b!339735 () Bool)

(declare-fun res!187667 () Bool)

(assert (=> b!339735 (=> (not res!187667) (not e!208423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17835 (_ BitVec 32)) Bool)

(assert (=> b!339735 (= res!187667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339730 () Bool)

(declare-fun res!187663 () Bool)

(assert (=> b!339730 (=> (not res!187663) (not e!208423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339730 (= res!187663 (validKeyInArray!0 k!1348))))

(declare-fun res!187666 () Bool)

(assert (=> start!34086 (=> (not res!187666) (not e!208423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34086 (= res!187666 (validMask!0 mask!2385))))

(assert (=> start!34086 e!208423))

(assert (=> start!34086 true))

(assert (=> start!34086 tp_is_empty!7117))

(assert (=> start!34086 tp!25019))

(declare-fun e!208422 () Bool)

(declare-fun array_inv!6256 (array!17833) Bool)

(assert (=> start!34086 (and (array_inv!6256 _values!1525) e!208422)))

(declare-fun array_inv!6257 (array!17835) Bool)

(assert (=> start!34086 (array_inv!6257 _keys!1895)))

(declare-fun b!339736 () Bool)

(assert (=> b!339736 (= e!208424 tp_is_empty!7117)))

(declare-fun b!339737 () Bool)

(assert (=> b!339737 (= e!208422 (and e!208425 mapRes!12093))))

(declare-fun condMapEmpty!12093 () Bool)

(declare-fun mapDefault!12093 () ValueCell!3215)

