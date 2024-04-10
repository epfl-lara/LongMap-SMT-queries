; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34218 () Bool)

(assert start!34218)

(declare-fun b_free!7241 () Bool)

(declare-fun b_next!7241 () Bool)

(assert (=> start!34218 (= b_free!7241 (not b_next!7241))))

(declare-fun tp!25257 () Bool)

(declare-fun b_and!14441 () Bool)

(assert (=> start!34218 (= tp!25257 b_and!14441)))

(declare-fun b!341320 () Bool)

(declare-fun res!188669 () Bool)

(declare-fun e!209329 () Bool)

(assert (=> b!341320 (=> (not res!188669) (not e!209329))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10567 0))(
  ( (V!10568 (val!3641 Int)) )
))
(declare-datatypes ((ValueCell!3253 0))(
  ( (ValueCellFull!3253 (v!5813 V!10567)) (EmptyCell!3253) )
))
(declare-datatypes ((array!17981 0))(
  ( (array!17982 (arr!8511 (Array (_ BitVec 32) ValueCell!3253)) (size!8863 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17981)

(declare-datatypes ((array!17983 0))(
  ( (array!17984 (arr!8512 (Array (_ BitVec 32) (_ BitVec 64))) (size!8864 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17983)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341320 (= res!188669 (and (= (size!8863 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8864 _keys!1895) (size!8863 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341321 () Bool)

(declare-fun e!209334 () Bool)

(assert (=> b!341321 (= e!209329 e!209334)))

(declare-fun res!188671 () Bool)

(assert (=> b!341321 (=> (not res!188671) (not e!209334))))

(declare-datatypes ((SeekEntryResult!3287 0))(
  ( (MissingZero!3287 (index!15327 (_ BitVec 32))) (Found!3287 (index!15328 (_ BitVec 32))) (Intermediate!3287 (undefined!4099 Bool) (index!15329 (_ BitVec 32)) (x!33993 (_ BitVec 32))) (Undefined!3287) (MissingVacant!3287 (index!15330 (_ BitVec 32))) )
))
(declare-fun lt!161748 () SeekEntryResult!3287)

(assert (=> b!341321 (= res!188671 (and (not (is-Found!3287 lt!161748)) (not (is-MissingZero!3287 lt!161748)) (is-MissingVacant!3287 lt!161748)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17983 (_ BitVec 32)) SeekEntryResult!3287)

(assert (=> b!341321 (= lt!161748 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!188672 () Bool)

(assert (=> start!34218 (=> (not res!188672) (not e!209329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34218 (= res!188672 (validMask!0 mask!2385))))

(assert (=> start!34218 e!209329))

(assert (=> start!34218 true))

(declare-fun tp_is_empty!7193 () Bool)

(assert (=> start!34218 tp_is_empty!7193))

(assert (=> start!34218 tp!25257))

(declare-fun e!209331 () Bool)

(declare-fun array_inv!6304 (array!17981) Bool)

(assert (=> start!34218 (and (array_inv!6304 _values!1525) e!209331)))

(declare-fun array_inv!6305 (array!17983) Bool)

(assert (=> start!34218 (array_inv!6305 _keys!1895)))

(declare-fun b!341322 () Bool)

(declare-fun e!209333 () Bool)

(declare-fun mapRes!12216 () Bool)

(assert (=> b!341322 (= e!209331 (and e!209333 mapRes!12216))))

(declare-fun condMapEmpty!12216 () Bool)

(declare-fun mapDefault!12216 () ValueCell!3253)

