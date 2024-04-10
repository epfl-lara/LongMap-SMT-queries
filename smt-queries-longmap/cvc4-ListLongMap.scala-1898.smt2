; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33882 () Bool)

(assert start!33882)

(declare-fun b_free!7061 () Bool)

(declare-fun b_next!7061 () Bool)

(assert (=> start!33882 (= b_free!7061 (not b_next!7061))))

(declare-fun tp!24696 () Bool)

(declare-fun b_and!14247 () Bool)

(assert (=> start!33882 (= tp!24696 b_and!14247)))

(declare-fun mapIsEmpty!11925 () Bool)

(declare-fun mapRes!11925 () Bool)

(assert (=> mapIsEmpty!11925 mapRes!11925))

(declare-fun b!337326 () Bool)

(declare-fun res!186319 () Bool)

(declare-fun e!207003 () Bool)

(assert (=> b!337326 (=> (not res!186319) (not e!207003))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10327 0))(
  ( (V!10328 (val!3551 Int)) )
))
(declare-datatypes ((ValueCell!3163 0))(
  ( (ValueCellFull!3163 (v!5716 V!10327)) (EmptyCell!3163) )
))
(declare-datatypes ((array!17621 0))(
  ( (array!17622 (arr!8338 (Array (_ BitVec 32) ValueCell!3163)) (size!8690 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17621)

(declare-datatypes ((array!17623 0))(
  ( (array!17624 (arr!8339 (Array (_ BitVec 32) (_ BitVec 64))) (size!8691 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17623)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337326 (= res!186319 (and (= (size!8690 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8691 _keys!1895) (size!8690 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337327 () Bool)

(declare-fun e!207002 () Bool)

(assert (=> b!337327 (= e!207003 e!207002)))

(declare-fun res!186313 () Bool)

(assert (=> b!337327 (=> (not res!186313) (not e!207002))))

(declare-datatypes ((SeekEntryResult!3223 0))(
  ( (MissingZero!3223 (index!15071 (_ BitVec 32))) (Found!3223 (index!15072 (_ BitVec 32))) (Intermediate!3223 (undefined!4035 Bool) (index!15073 (_ BitVec 32)) (x!33619 (_ BitVec 32))) (Undefined!3223) (MissingVacant!3223 (index!15074 (_ BitVec 32))) )
))
(declare-fun lt!160413 () SeekEntryResult!3223)

(assert (=> b!337327 (= res!186313 (and (not (is-Found!3223 lt!160413)) (is-MissingZero!3223 lt!160413)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17623 (_ BitVec 32)) SeekEntryResult!3223)

(assert (=> b!337327 (= lt!160413 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337328 () Bool)

(declare-fun e!207006 () Bool)

(declare-fun e!207004 () Bool)

(assert (=> b!337328 (= e!207006 (and e!207004 mapRes!11925))))

(declare-fun condMapEmpty!11925 () Bool)

(declare-fun mapDefault!11925 () ValueCell!3163)

