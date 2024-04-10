; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34438 () Bool)

(assert start!34438)

(declare-fun b_free!7361 () Bool)

(declare-fun b_next!7361 () Bool)

(assert (=> start!34438 (= b_free!7361 (not b_next!7361))))

(declare-fun tp!25629 () Bool)

(declare-fun b_and!14569 () Bool)

(assert (=> start!34438 (= tp!25629 b_and!14569)))

(declare-fun mapIsEmpty!12408 () Bool)

(declare-fun mapRes!12408 () Bool)

(assert (=> mapIsEmpty!12408 mapRes!12408))

(declare-fun b!343921 () Bool)

(declare-fun e!210860 () Bool)

(declare-fun tp_is_empty!7313 () Bool)

(assert (=> b!343921 (= e!210860 tp_is_empty!7313)))

(declare-fun b!343922 () Bool)

(declare-fun e!210861 () Bool)

(assert (=> b!343922 (= e!210861 tp_is_empty!7313)))

(declare-fun b!343923 () Bool)

(declare-fun res!190143 () Bool)

(declare-fun e!210862 () Bool)

(assert (=> b!343923 (=> (not res!190143) (not e!210862))))

(declare-datatypes ((array!18217 0))(
  ( (array!18218 (arr!8625 (Array (_ BitVec 32) (_ BitVec 64))) (size!8977 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18217)

(declare-datatypes ((List!4979 0))(
  ( (Nil!4976) (Cons!4975 (h!5831 (_ BitVec 64)) (t!10095 List!4979)) )
))
(declare-fun arrayNoDuplicates!0 (array!18217 (_ BitVec 32) List!4979) Bool)

(assert (=> b!343923 (= res!190143 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4976))))

(declare-fun b!343924 () Bool)

(assert (=> b!343924 (= e!210862 false)))

(declare-datatypes ((SeekEntryResult!3329 0))(
  ( (MissingZero!3329 (index!15495 (_ BitVec 32))) (Found!3329 (index!15496 (_ BitVec 32))) (Intermediate!3329 (undefined!4141 Bool) (index!15497 (_ BitVec 32)) (x!34235 (_ BitVec 32))) (Undefined!3329) (MissingVacant!3329 (index!15498 (_ BitVec 32))) )
))
(declare-fun lt!162616 () SeekEntryResult!3329)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18217 (_ BitVec 32)) SeekEntryResult!3329)

(assert (=> b!343924 (= lt!162616 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!190145 () Bool)

(assert (=> start!34438 (=> (not res!190145) (not e!210862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34438 (= res!190145 (validMask!0 mask!2385))))

(assert (=> start!34438 e!210862))

(assert (=> start!34438 true))

(assert (=> start!34438 tp_is_empty!7313))

(assert (=> start!34438 tp!25629))

(declare-datatypes ((V!10727 0))(
  ( (V!10728 (val!3701 Int)) )
))
(declare-datatypes ((ValueCell!3313 0))(
  ( (ValueCellFull!3313 (v!5877 V!10727)) (EmptyCell!3313) )
))
(declare-datatypes ((array!18219 0))(
  ( (array!18220 (arr!8626 (Array (_ BitVec 32) ValueCell!3313)) (size!8978 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18219)

(declare-fun e!210863 () Bool)

(declare-fun array_inv!6392 (array!18219) Bool)

(assert (=> start!34438 (and (array_inv!6392 _values!1525) e!210863)))

(declare-fun array_inv!6393 (array!18217) Bool)

(assert (=> start!34438 (array_inv!6393 _keys!1895)))

(declare-fun b!343925 () Bool)

(declare-fun res!190141 () Bool)

(assert (=> b!343925 (=> (not res!190141) (not e!210862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18217 (_ BitVec 32)) Bool)

(assert (=> b!343925 (= res!190141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343926 () Bool)

(declare-fun res!190144 () Bool)

(assert (=> b!343926 (=> (not res!190144) (not e!210862))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343926 (= res!190144 (and (= (size!8978 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8977 _keys!1895) (size!8978 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12408 () Bool)

(declare-fun tp!25628 () Bool)

(assert (=> mapNonEmpty!12408 (= mapRes!12408 (and tp!25628 e!210860))))

(declare-fun mapValue!12408 () ValueCell!3313)

(declare-fun mapRest!12408 () (Array (_ BitVec 32) ValueCell!3313))

(declare-fun mapKey!12408 () (_ BitVec 32))

(assert (=> mapNonEmpty!12408 (= (arr!8626 _values!1525) (store mapRest!12408 mapKey!12408 mapValue!12408))))

(declare-fun b!343927 () Bool)

(declare-fun res!190142 () Bool)

(assert (=> b!343927 (=> (not res!190142) (not e!210862))))

(declare-fun zeroValue!1467 () V!10727)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10727)

(declare-datatypes ((tuple2!5358 0))(
  ( (tuple2!5359 (_1!2690 (_ BitVec 64)) (_2!2690 V!10727)) )
))
(declare-datatypes ((List!4980 0))(
  ( (Nil!4977) (Cons!4976 (h!5832 tuple2!5358) (t!10096 List!4980)) )
))
(declare-datatypes ((ListLongMap!4271 0))(
  ( (ListLongMap!4272 (toList!2151 List!4980)) )
))
(declare-fun contains!2209 (ListLongMap!4271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1672 (array!18217 array!18219 (_ BitVec 32) (_ BitVec 32) V!10727 V!10727 (_ BitVec 32) Int) ListLongMap!4271)

(assert (=> b!343927 (= res!190142 (not (contains!2209 (getCurrentListMap!1672 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!343928 () Bool)

(assert (=> b!343928 (= e!210863 (and e!210861 mapRes!12408))))

(declare-fun condMapEmpty!12408 () Bool)

(declare-fun mapDefault!12408 () ValueCell!3313)

