; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34378 () Bool)

(assert start!34378)

(declare-fun b_free!7327 () Bool)

(declare-fun b_next!7327 () Bool)

(assert (=> start!34378 (= b_free!7327 (not b_next!7327))))

(declare-fun tp!25524 () Bool)

(declare-fun b_and!14533 () Bool)

(assert (=> start!34378 (= tp!25524 b_and!14533)))

(declare-fun b!343288 () Bool)

(declare-fun res!189764 () Bool)

(declare-fun e!210499 () Bool)

(assert (=> b!343288 (=> (not res!189764) (not e!210499))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343288 (= res!189764 (validKeyInArray!0 k!1348))))

(declare-fun b!343289 () Bool)

(declare-fun e!210495 () Bool)

(assert (=> b!343289 (= e!210499 e!210495)))

(declare-fun res!189770 () Bool)

(assert (=> b!343289 (=> (not res!189770) (not e!210495))))

(declare-datatypes ((SeekEntryResult!3315 0))(
  ( (MissingZero!3315 (index!15439 (_ BitVec 32))) (Found!3315 (index!15440 (_ BitVec 32))) (Intermediate!3315 (undefined!4127 Bool) (index!15441 (_ BitVec 32)) (x!34171 (_ BitVec 32))) (Undefined!3315) (MissingVacant!3315 (index!15442 (_ BitVec 32))) )
))
(declare-fun lt!162442 () SeekEntryResult!3315)

(assert (=> b!343289 (= res!189770 (and (not (is-Found!3315 lt!162442)) (not (is-MissingZero!3315 lt!162442)) (is-MissingVacant!3315 lt!162442)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18149 0))(
  ( (array!18150 (arr!8592 (Array (_ BitVec 32) (_ BitVec 64))) (size!8944 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18149)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18149 (_ BitVec 32)) SeekEntryResult!3315)

(assert (=> b!343289 (= lt!162442 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343290 () Bool)

(declare-fun res!189767 () Bool)

(assert (=> b!343290 (=> (not res!189767) (not e!210499))))

(declare-datatypes ((List!4957 0))(
  ( (Nil!4954) (Cons!4953 (h!5809 (_ BitVec 64)) (t!10071 List!4957)) )
))
(declare-fun arrayNoDuplicates!0 (array!18149 (_ BitVec 32) List!4957) Bool)

(assert (=> b!343290 (= res!189767 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4954))))

(declare-fun b!343291 () Bool)

(declare-fun e!210497 () Bool)

(declare-fun tp_is_empty!7279 () Bool)

(assert (=> b!343291 (= e!210497 tp_is_empty!7279)))

(declare-fun mapIsEmpty!12354 () Bool)

(declare-fun mapRes!12354 () Bool)

(assert (=> mapIsEmpty!12354 mapRes!12354))

(declare-fun b!343292 () Bool)

(declare-fun res!189768 () Bool)

(assert (=> b!343292 (=> (not res!189768) (not e!210499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18149 (_ BitVec 32)) Bool)

(assert (=> b!343292 (= res!189768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343294 () Bool)

(declare-fun res!189762 () Bool)

(declare-fun e!210496 () Bool)

(assert (=> b!343294 (=> (not res!189762) (not e!210496))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343294 (= res!189762 (inRange!0 (index!15442 lt!162442) mask!2385))))

(declare-fun b!343295 () Bool)

(declare-fun res!189766 () Bool)

(assert (=> b!343295 (=> (not res!189766) (not e!210499))))

(declare-datatypes ((V!10683 0))(
  ( (V!10684 (val!3684 Int)) )
))
(declare-datatypes ((ValueCell!3296 0))(
  ( (ValueCellFull!3296 (v!5859 V!10683)) (EmptyCell!3296) )
))
(declare-datatypes ((array!18151 0))(
  ( (array!18152 (arr!8593 (Array (_ BitVec 32) ValueCell!3296)) (size!8945 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18151)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343295 (= res!189766 (and (= (size!8945 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8944 _keys!1895) (size!8945 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343296 () Bool)

(assert (=> b!343296 (= e!210495 e!210496)))

(declare-fun res!189763 () Bool)

(assert (=> b!343296 (=> (not res!189763) (not e!210496))))

(declare-fun lt!162445 () Bool)

(assert (=> b!343296 (= res!189763 (not lt!162445))))

(declare-datatypes ((Unit!10716 0))(
  ( (Unit!10717) )
))
(declare-fun lt!162443 () Unit!10716)

(declare-fun e!210494 () Unit!10716)

(assert (=> b!343296 (= lt!162443 e!210494)))

(declare-fun c!52911 () Bool)

(assert (=> b!343296 (= c!52911 lt!162445)))

(declare-fun arrayContainsKey!0 (array!18149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343296 (= lt!162445 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!343297 () Bool)

(declare-fun Unit!10718 () Unit!10716)

(assert (=> b!343297 (= e!210494 Unit!10718)))

(declare-fun mapNonEmpty!12354 () Bool)

(declare-fun tp!25523 () Bool)

(declare-fun e!210498 () Bool)

(assert (=> mapNonEmpty!12354 (= mapRes!12354 (and tp!25523 e!210498))))

(declare-fun mapKey!12354 () (_ BitVec 32))

(declare-fun mapRest!12354 () (Array (_ BitVec 32) ValueCell!3296))

(declare-fun mapValue!12354 () ValueCell!3296)

(assert (=> mapNonEmpty!12354 (= (arr!8593 _values!1525) (store mapRest!12354 mapKey!12354 mapValue!12354))))

(declare-fun b!343298 () Bool)

(declare-fun Unit!10719 () Unit!10716)

(assert (=> b!343298 (= e!210494 Unit!10719)))

(declare-fun zeroValue!1467 () V!10683)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!162444 () Unit!10716)

(declare-fun minValue!1467 () V!10683)

(declare-fun lemmaArrayContainsKeyThenInListMap!312 (array!18149 array!18151 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 64) (_ BitVec 32) Int) Unit!10716)

(declare-fun arrayScanForKey!0 (array!18149 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343298 (= lt!162444 (lemmaArrayContainsKeyThenInListMap!312 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343298 false))

(declare-fun b!343299 () Bool)

(declare-fun e!210500 () Bool)

(assert (=> b!343299 (= e!210500 (and e!210497 mapRes!12354))))

(declare-fun condMapEmpty!12354 () Bool)

(declare-fun mapDefault!12354 () ValueCell!3296)

