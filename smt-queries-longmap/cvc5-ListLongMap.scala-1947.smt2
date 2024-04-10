; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34428 () Bool)

(assert start!34428)

(declare-fun b_free!7351 () Bool)

(declare-fun b_next!7351 () Bool)

(assert (=> start!34428 (= b_free!7351 (not b_next!7351))))

(declare-fun tp!25598 () Bool)

(declare-fun b_and!14559 () Bool)

(assert (=> start!34428 (= tp!25598 b_and!14559)))

(declare-fun b!343786 () Bool)

(declare-fun res!190053 () Bool)

(declare-fun e!210785 () Bool)

(assert (=> b!343786 (=> (not res!190053) (not e!210785))))

(declare-datatypes ((array!18199 0))(
  ( (array!18200 (arr!8616 (Array (_ BitVec 32) (_ BitVec 64))) (size!8968 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18199)

(declare-datatypes ((List!4972 0))(
  ( (Nil!4969) (Cons!4968 (h!5824 (_ BitVec 64)) (t!10088 List!4972)) )
))
(declare-fun arrayNoDuplicates!0 (array!18199 (_ BitVec 32) List!4972) Bool)

(assert (=> b!343786 (= res!190053 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4969))))

(declare-fun b!343787 () Bool)

(declare-fun res!190052 () Bool)

(assert (=> b!343787 (=> (not res!190052) (not e!210785))))

(declare-datatypes ((V!10715 0))(
  ( (V!10716 (val!3696 Int)) )
))
(declare-datatypes ((ValueCell!3308 0))(
  ( (ValueCellFull!3308 (v!5872 V!10715)) (EmptyCell!3308) )
))
(declare-datatypes ((array!18201 0))(
  ( (array!18202 (arr!8617 (Array (_ BitVec 32) ValueCell!3308)) (size!8969 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18201)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!343787 (= res!190052 (and (= (size!8969 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8968 _keys!1895) (size!8969 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12393 () Bool)

(declare-fun mapRes!12393 () Bool)

(declare-fun tp!25599 () Bool)

(declare-fun e!210786 () Bool)

(assert (=> mapNonEmpty!12393 (= mapRes!12393 (and tp!25599 e!210786))))

(declare-fun mapKey!12393 () (_ BitVec 32))

(declare-fun mapValue!12393 () ValueCell!3308)

(declare-fun mapRest!12393 () (Array (_ BitVec 32) ValueCell!3308))

(assert (=> mapNonEmpty!12393 (= (arr!8617 _values!1525) (store mapRest!12393 mapKey!12393 mapValue!12393))))

(declare-fun b!343788 () Bool)

(declare-fun res!190050 () Bool)

(assert (=> b!343788 (=> (not res!190050) (not e!210785))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343788 (= res!190050 (validKeyInArray!0 k!1348))))

(declare-fun b!343789 () Bool)

(assert (=> b!343789 (= e!210785 false)))

(declare-datatypes ((SeekEntryResult!3326 0))(
  ( (MissingZero!3326 (index!15483 (_ BitVec 32))) (Found!3326 (index!15484 (_ BitVec 32))) (Intermediate!3326 (undefined!4138 Bool) (index!15485 (_ BitVec 32)) (x!34224 (_ BitVec 32))) (Undefined!3326) (MissingVacant!3326 (index!15486 (_ BitVec 32))) )
))
(declare-fun lt!162601 () SeekEntryResult!3326)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18199 (_ BitVec 32)) SeekEntryResult!3326)

(assert (=> b!343789 (= lt!162601 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343790 () Bool)

(declare-fun e!210788 () Bool)

(declare-fun tp_is_empty!7303 () Bool)

(assert (=> b!343790 (= e!210788 tp_is_empty!7303)))

(declare-fun res!190055 () Bool)

(assert (=> start!34428 (=> (not res!190055) (not e!210785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34428 (= res!190055 (validMask!0 mask!2385))))

(assert (=> start!34428 e!210785))

(assert (=> start!34428 true))

(assert (=> start!34428 tp_is_empty!7303))

(assert (=> start!34428 tp!25598))

(declare-fun e!210787 () Bool)

(declare-fun array_inv!6384 (array!18201) Bool)

(assert (=> start!34428 (and (array_inv!6384 _values!1525) e!210787)))

(declare-fun array_inv!6385 (array!18199) Bool)

(assert (=> start!34428 (array_inv!6385 _keys!1895)))

(declare-fun b!343791 () Bool)

(assert (=> b!343791 (= e!210787 (and e!210788 mapRes!12393))))

(declare-fun condMapEmpty!12393 () Bool)

(declare-fun mapDefault!12393 () ValueCell!3308)

