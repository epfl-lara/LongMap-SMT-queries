; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34724 () Bool)

(assert start!34724)

(declare-fun b_free!7531 () Bool)

(declare-fun b_next!7531 () Bool)

(assert (=> start!34724 (= b_free!7531 (not b_next!7531))))

(declare-fun tp!26156 () Bool)

(declare-fun b_and!14751 () Bool)

(assert (=> start!34724 (= tp!26156 b_and!14751)))

(declare-fun b!347177 () Bool)

(declare-fun e!212738 () Bool)

(assert (=> b!347177 (= e!212738 (not true))))

(declare-datatypes ((array!18557 0))(
  ( (array!18558 (arr!8789 (Array (_ BitVec 32) (_ BitVec 64))) (size!9141 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18557)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347177 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3390 0))(
  ( (MissingZero!3390 (index!15739 (_ BitVec 32))) (Found!3390 (index!15740 (_ BitVec 32))) (Intermediate!3390 (undefined!4202 Bool) (index!15741 (_ BitVec 32)) (x!34588 (_ BitVec 32))) (Undefined!3390) (MissingVacant!3390 (index!15742 (_ BitVec 32))) )
))
(declare-fun lt!163504 () SeekEntryResult!3390)

(declare-datatypes ((Unit!10777 0))(
  ( (Unit!10778) )
))
(declare-fun lt!163503 () Unit!10777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18557 (_ BitVec 64) (_ BitVec 32)) Unit!10777)

(assert (=> b!347177 (= lt!163503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15740 lt!163504)))))

(declare-fun b!347178 () Bool)

(declare-fun e!212741 () Bool)

(declare-fun tp_is_empty!7483 () Bool)

(assert (=> b!347178 (= e!212741 tp_is_empty!7483)))

(declare-fun b!347179 () Bool)

(declare-fun e!212737 () Bool)

(assert (=> b!347179 (= e!212737 e!212738)))

(declare-fun res!192144 () Bool)

(assert (=> b!347179 (=> (not res!192144) (not e!212738))))

(assert (=> b!347179 (= res!192144 (and (is-Found!3390 lt!163504) (= (select (arr!8789 _keys!1895) (index!15740 lt!163504)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18557 (_ BitVec 32)) SeekEntryResult!3390)

(assert (=> b!347179 (= lt!163504 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347180 () Bool)

(declare-fun e!212742 () Bool)

(declare-fun e!212740 () Bool)

(declare-fun mapRes!12681 () Bool)

(assert (=> b!347180 (= e!212742 (and e!212740 mapRes!12681))))

(declare-fun condMapEmpty!12681 () Bool)

(declare-datatypes ((V!10955 0))(
  ( (V!10956 (val!3786 Int)) )
))
(declare-datatypes ((ValueCell!3398 0))(
  ( (ValueCellFull!3398 (v!5968 V!10955)) (EmptyCell!3398) )
))
(declare-datatypes ((array!18559 0))(
  ( (array!18560 (arr!8790 (Array (_ BitVec 32) ValueCell!3398)) (size!9142 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18559)

(declare-fun mapDefault!12681 () ValueCell!3398)

