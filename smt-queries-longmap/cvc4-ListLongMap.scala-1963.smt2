; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34528 () Bool)

(assert start!34528)

(declare-fun b_free!7451 () Bool)

(declare-fun b_next!7451 () Bool)

(assert (=> start!34528 (= b_free!7451 (not b_next!7451))))

(declare-fun tp!25898 () Bool)

(declare-fun b_and!14659 () Bool)

(assert (=> start!34528 (= tp!25898 b_and!14659)))

(declare-fun b!345136 () Bool)

(declare-fun e!211536 () Bool)

(assert (=> b!345136 (= e!211536 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18389 0))(
  ( (array!18390 (arr!8711 (Array (_ BitVec 32) (_ BitVec 64))) (size!9063 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18389)

(declare-datatypes ((SeekEntryResult!3357 0))(
  ( (MissingZero!3357 (index!15607 (_ BitVec 32))) (Found!3357 (index!15608 (_ BitVec 32))) (Intermediate!3357 (undefined!4169 Bool) (index!15609 (_ BitVec 32)) (x!34383 (_ BitVec 32))) (Undefined!3357) (MissingVacant!3357 (index!15610 (_ BitVec 32))) )
))
(declare-fun lt!162751 () SeekEntryResult!3357)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18389 (_ BitVec 32)) SeekEntryResult!3357)

(assert (=> b!345136 (= lt!162751 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!345137 () Bool)

(declare-fun res!190953 () Bool)

(assert (=> b!345137 (=> (not res!190953) (not e!211536))))

(declare-datatypes ((V!10847 0))(
  ( (V!10848 (val!3746 Int)) )
))
(declare-datatypes ((ValueCell!3358 0))(
  ( (ValueCellFull!3358 (v!5922 V!10847)) (EmptyCell!3358) )
))
(declare-datatypes ((array!18391 0))(
  ( (array!18392 (arr!8712 (Array (_ BitVec 32) ValueCell!3358)) (size!9064 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18391)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345137 (= res!190953 (and (= (size!9064 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9063 _keys!1895) (size!9064 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345138 () Bool)

(declare-fun e!211538 () Bool)

(declare-fun e!211537 () Bool)

(declare-fun mapRes!12543 () Bool)

(assert (=> b!345138 (= e!211538 (and e!211537 mapRes!12543))))

(declare-fun condMapEmpty!12543 () Bool)

(declare-fun mapDefault!12543 () ValueCell!3358)

