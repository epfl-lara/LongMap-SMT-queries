; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34450 () Bool)

(assert start!34450)

(declare-fun b_free!7373 () Bool)

(declare-fun b_next!7373 () Bool)

(assert (=> start!34450 (= b_free!7373 (not b_next!7373))))

(declare-fun tp!25664 () Bool)

(declare-fun b_and!14581 () Bool)

(assert (=> start!34450 (= tp!25664 b_and!14581)))

(declare-fun b!344083 () Bool)

(declare-fun e!210950 () Bool)

(assert (=> b!344083 (= e!210950 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3334 0))(
  ( (MissingZero!3334 (index!15515 (_ BitVec 32))) (Found!3334 (index!15516 (_ BitVec 32))) (Intermediate!3334 (undefined!4146 Bool) (index!15517 (_ BitVec 32)) (x!34256 (_ BitVec 32))) (Undefined!3334) (MissingVacant!3334 (index!15518 (_ BitVec 32))) )
))
(declare-fun lt!162634 () SeekEntryResult!3334)

(declare-datatypes ((array!18241 0))(
  ( (array!18242 (arr!8637 (Array (_ BitVec 32) (_ BitVec 64))) (size!8989 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18241)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18241 (_ BitVec 32)) SeekEntryResult!3334)

(assert (=> b!344083 (= lt!162634 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12426 () Bool)

(declare-fun mapRes!12426 () Bool)

(assert (=> mapIsEmpty!12426 mapRes!12426))

(declare-fun mapNonEmpty!12426 () Bool)

(declare-fun tp!25665 () Bool)

(declare-fun e!210952 () Bool)

(assert (=> mapNonEmpty!12426 (= mapRes!12426 (and tp!25665 e!210952))))

(declare-datatypes ((V!10743 0))(
  ( (V!10744 (val!3707 Int)) )
))
(declare-datatypes ((ValueCell!3319 0))(
  ( (ValueCellFull!3319 (v!5883 V!10743)) (EmptyCell!3319) )
))
(declare-fun mapValue!12426 () ValueCell!3319)

(declare-fun mapRest!12426 () (Array (_ BitVec 32) ValueCell!3319))

(declare-fun mapKey!12426 () (_ BitVec 32))

(declare-datatypes ((array!18243 0))(
  ( (array!18244 (arr!8638 (Array (_ BitVec 32) ValueCell!3319)) (size!8990 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18243)

(assert (=> mapNonEmpty!12426 (= (arr!8638 _values!1525) (store mapRest!12426 mapKey!12426 mapValue!12426))))

(declare-fun b!344084 () Bool)

(declare-fun res!190250 () Bool)

(assert (=> b!344084 (=> (not res!190250) (not e!210950))))

(declare-datatypes ((List!4988 0))(
  ( (Nil!4985) (Cons!4984 (h!5840 (_ BitVec 64)) (t!10104 List!4988)) )
))
(declare-fun arrayNoDuplicates!0 (array!18241 (_ BitVec 32) List!4988) Bool)

(assert (=> b!344084 (= res!190250 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4985))))

(declare-fun b!344085 () Bool)

(declare-fun res!190248 () Bool)

(assert (=> b!344085 (=> (not res!190248) (not e!210950))))

(declare-fun zeroValue!1467 () V!10743)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10743)

(declare-datatypes ((tuple2!5366 0))(
  ( (tuple2!5367 (_1!2694 (_ BitVec 64)) (_2!2694 V!10743)) )
))
(declare-datatypes ((List!4989 0))(
  ( (Nil!4986) (Cons!4985 (h!5841 tuple2!5366) (t!10105 List!4989)) )
))
(declare-datatypes ((ListLongMap!4279 0))(
  ( (ListLongMap!4280 (toList!2155 List!4989)) )
))
(declare-fun contains!2213 (ListLongMap!4279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1676 (array!18241 array!18243 (_ BitVec 32) (_ BitVec 32) V!10743 V!10743 (_ BitVec 32) Int) ListLongMap!4279)

(assert (=> b!344085 (= res!190248 (not (contains!2213 (getCurrentListMap!1676 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344086 () Bool)

(declare-fun tp_is_empty!7325 () Bool)

(assert (=> b!344086 (= e!210952 tp_is_empty!7325)))

(declare-fun b!344087 () Bool)

(declare-fun res!190249 () Bool)

(assert (=> b!344087 (=> (not res!190249) (not e!210950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18241 (_ BitVec 32)) Bool)

(assert (=> b!344087 (= res!190249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344089 () Bool)

(declare-fun e!210954 () Bool)

(declare-fun e!210951 () Bool)

(assert (=> b!344089 (= e!210954 (and e!210951 mapRes!12426))))

(declare-fun condMapEmpty!12426 () Bool)

(declare-fun mapDefault!12426 () ValueCell!3319)

