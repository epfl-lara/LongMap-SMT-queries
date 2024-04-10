; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34512 () Bool)

(assert start!34512)

(declare-fun b_free!7435 () Bool)

(declare-fun b_next!7435 () Bool)

(assert (=> start!34512 (= b_free!7435 (not b_next!7435))))

(declare-fun tp!25851 () Bool)

(declare-fun b_and!14643 () Bool)

(assert (=> start!34512 (= tp!25851 b_and!14643)))

(declare-fun b!344920 () Bool)

(declare-fun e!211419 () Bool)

(assert (=> b!344920 (= e!211419 false)))

(declare-datatypes ((SeekEntryResult!3351 0))(
  ( (MissingZero!3351 (index!15583 (_ BitVec 32))) (Found!3351 (index!15584 (_ BitVec 32))) (Intermediate!3351 (undefined!4163 Bool) (index!15585 (_ BitVec 32)) (x!34361 (_ BitVec 32))) (Undefined!3351) (MissingVacant!3351 (index!15586 (_ BitVec 32))) )
))
(declare-fun lt!162727 () SeekEntryResult!3351)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18357 0))(
  ( (array!18358 (arr!8695 (Array (_ BitVec 32) (_ BitVec 64))) (size!9047 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18357)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18357 (_ BitVec 32)) SeekEntryResult!3351)

(assert (=> b!344920 (= lt!162727 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344921 () Bool)

(declare-fun res!190808 () Bool)

(assert (=> b!344921 (=> (not res!190808) (not e!211419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18357 (_ BitVec 32)) Bool)

(assert (=> b!344921 (= res!190808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344922 () Bool)

(declare-fun res!190807 () Bool)

(assert (=> b!344922 (=> (not res!190807) (not e!211419))))

(declare-datatypes ((V!10827 0))(
  ( (V!10828 (val!3738 Int)) )
))
(declare-datatypes ((ValueCell!3350 0))(
  ( (ValueCellFull!3350 (v!5914 V!10827)) (EmptyCell!3350) )
))
(declare-datatypes ((array!18359 0))(
  ( (array!18360 (arr!8696 (Array (_ BitVec 32) ValueCell!3350)) (size!9048 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18359)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344922 (= res!190807 (and (= (size!9048 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9047 _keys!1895) (size!9048 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12519 () Bool)

(declare-fun mapRes!12519 () Bool)

(assert (=> mapIsEmpty!12519 mapRes!12519))

(declare-fun res!190810 () Bool)

(assert (=> start!34512 (=> (not res!190810) (not e!211419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34512 (= res!190810 (validMask!0 mask!2385))))

(assert (=> start!34512 e!211419))

(assert (=> start!34512 true))

(declare-fun tp_is_empty!7387 () Bool)

(assert (=> start!34512 tp_is_empty!7387))

(assert (=> start!34512 tp!25851))

(declare-fun e!211418 () Bool)

(declare-fun array_inv!6436 (array!18359) Bool)

(assert (=> start!34512 (and (array_inv!6436 _values!1525) e!211418)))

(declare-fun array_inv!6437 (array!18357) Bool)

(assert (=> start!34512 (array_inv!6437 _keys!1895)))

(declare-fun b!344923 () Bool)

(declare-fun e!211417 () Bool)

(assert (=> b!344923 (= e!211417 tp_is_empty!7387)))

(declare-fun mapNonEmpty!12519 () Bool)

(declare-fun tp!25850 () Bool)

(declare-fun e!211416 () Bool)

(assert (=> mapNonEmpty!12519 (= mapRes!12519 (and tp!25850 e!211416))))

(declare-fun mapValue!12519 () ValueCell!3350)

(declare-fun mapKey!12519 () (_ BitVec 32))

(declare-fun mapRest!12519 () (Array (_ BitVec 32) ValueCell!3350))

(assert (=> mapNonEmpty!12519 (= (arr!8696 _values!1525) (store mapRest!12519 mapKey!12519 mapValue!12519))))

(declare-fun b!344924 () Bool)

(declare-fun res!190806 () Bool)

(assert (=> b!344924 (=> (not res!190806) (not e!211419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344924 (= res!190806 (validKeyInArray!0 k!1348))))

(declare-fun b!344925 () Bool)

(assert (=> b!344925 (= e!211418 (and e!211417 mapRes!12519))))

(declare-fun condMapEmpty!12519 () Bool)

(declare-fun mapDefault!12519 () ValueCell!3350)

