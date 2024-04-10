; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34350 () Bool)

(assert start!34350)

(declare-fun b_free!7325 () Bool)

(declare-fun b_next!7325 () Bool)

(assert (=> start!34350 (= b_free!7325 (not b_next!7325))))

(declare-fun tp!25515 () Bool)

(declare-fun b_and!14529 () Bool)

(assert (=> start!34350 (= tp!25515 b_and!14529)))

(declare-fun res!189691 () Bool)

(declare-fun e!210386 () Bool)

(assert (=> start!34350 (=> (not res!189691) (not e!210386))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34350 (= res!189691 (validMask!0 mask!2385))))

(assert (=> start!34350 e!210386))

(assert (=> start!34350 true))

(declare-fun tp_is_empty!7277 () Bool)

(assert (=> start!34350 tp_is_empty!7277))

(assert (=> start!34350 tp!25515))

(declare-datatypes ((V!10679 0))(
  ( (V!10680 (val!3683 Int)) )
))
(declare-datatypes ((ValueCell!3295 0))(
  ( (ValueCellFull!3295 (v!5857 V!10679)) (EmptyCell!3295) )
))
(declare-datatypes ((array!18143 0))(
  ( (array!18144 (arr!8590 (Array (_ BitVec 32) ValueCell!3295)) (size!8942 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18143)

(declare-fun e!210381 () Bool)

(declare-fun array_inv!6362 (array!18143) Bool)

(assert (=> start!34350 (and (array_inv!6362 _values!1525) e!210381)))

(declare-datatypes ((array!18145 0))(
  ( (array!18146 (arr!8591 (Array (_ BitVec 32) (_ BitVec 64))) (size!8943 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18145)

(declare-fun array_inv!6363 (array!18145) Bool)

(assert (=> start!34350 (array_inv!6363 _keys!1895)))

(declare-fun b!343107 () Bool)

(declare-fun res!189690 () Bool)

(declare-fun e!210387 () Bool)

(assert (=> b!343107 (=> (not res!189690) (not e!210387))))

(declare-datatypes ((SeekEntryResult!3314 0))(
  ( (MissingZero!3314 (index!15435 (_ BitVec 32))) (Found!3314 (index!15436 (_ BitVec 32))) (Intermediate!3314 (undefined!4126 Bool) (index!15437 (_ BitVec 32)) (x!34152 (_ BitVec 32))) (Undefined!3314) (MissingVacant!3314 (index!15438 (_ BitVec 32))) )
))
(declare-fun lt!162330 () SeekEntryResult!3314)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343107 (= res!189690 (inRange!0 (index!15438 lt!162330) mask!2385))))

(declare-fun b!343108 () Bool)

(declare-datatypes ((Unit!10711 0))(
  ( (Unit!10712) )
))
(declare-fun e!210384 () Unit!10711)

(declare-fun Unit!10713 () Unit!10711)

(assert (=> b!343108 (= e!210384 Unit!10713)))

(declare-fun b!343109 () Bool)

(assert (=> b!343109 (= e!210387 (and (= (select (arr!8591 _keys!1895) (index!15438 lt!162330)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8943 _keys!1895))))))

(declare-fun b!343110 () Bool)

(declare-fun e!210382 () Bool)

(assert (=> b!343110 (= e!210382 tp_is_empty!7277)))

(declare-fun b!343111 () Bool)

(declare-fun res!189689 () Bool)

(assert (=> b!343111 (=> (not res!189689) (not e!210386))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10679)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10679)

(declare-datatypes ((tuple2!5336 0))(
  ( (tuple2!5337 (_1!2679 (_ BitVec 64)) (_2!2679 V!10679)) )
))
(declare-datatypes ((List!4955 0))(
  ( (Nil!4952) (Cons!4951 (h!5807 tuple2!5336) (t!10067 List!4955)) )
))
(declare-datatypes ((ListLongMap!4249 0))(
  ( (ListLongMap!4250 (toList!2140 List!4955)) )
))
(declare-fun contains!2196 (ListLongMap!4249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1661 (array!18145 array!18143 (_ BitVec 32) (_ BitVec 32) V!10679 V!10679 (_ BitVec 32) Int) ListLongMap!4249)

(assert (=> b!343111 (= res!189689 (not (contains!2196 (getCurrentListMap!1661 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!343112 () Bool)

(declare-fun res!189685 () Bool)

(assert (=> b!343112 (=> (not res!189685) (not e!210386))))

(declare-datatypes ((List!4956 0))(
  ( (Nil!4953) (Cons!4952 (h!5808 (_ BitVec 64)) (t!10068 List!4956)) )
))
(declare-fun arrayNoDuplicates!0 (array!18145 (_ BitVec 32) List!4956) Bool)

(assert (=> b!343112 (= res!189685 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4953))))

(declare-fun mapIsEmpty!12348 () Bool)

(declare-fun mapRes!12348 () Bool)

(assert (=> mapIsEmpty!12348 mapRes!12348))

(declare-fun b!343113 () Bool)

(declare-fun res!189684 () Bool)

(assert (=> b!343113 (=> (not res!189684) (not e!210386))))

(assert (=> b!343113 (= res!189684 (and (= (size!8942 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8943 _keys!1895) (size!8942 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343114 () Bool)

(declare-fun res!189687 () Bool)

(assert (=> b!343114 (=> (not res!189687) (not e!210386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18145 (_ BitVec 32)) Bool)

(assert (=> b!343114 (= res!189687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12348 () Bool)

(declare-fun tp!25514 () Bool)

(declare-fun e!210383 () Bool)

(assert (=> mapNonEmpty!12348 (= mapRes!12348 (and tp!25514 e!210383))))

(declare-fun mapKey!12348 () (_ BitVec 32))

(declare-fun mapRest!12348 () (Array (_ BitVec 32) ValueCell!3295))

(declare-fun mapValue!12348 () ValueCell!3295)

(assert (=> mapNonEmpty!12348 (= (arr!8590 _values!1525) (store mapRest!12348 mapKey!12348 mapValue!12348))))

(declare-fun b!343115 () Bool)

(declare-fun e!210385 () Bool)

(assert (=> b!343115 (= e!210385 e!210387)))

(declare-fun res!189692 () Bool)

(assert (=> b!343115 (=> (not res!189692) (not e!210387))))

(declare-fun lt!162328 () Bool)

(assert (=> b!343115 (= res!189692 (not lt!162328))))

(declare-fun lt!162331 () Unit!10711)

(assert (=> b!343115 (= lt!162331 e!210384)))

(declare-fun c!52869 () Bool)

(assert (=> b!343115 (= c!52869 lt!162328)))

(declare-fun arrayContainsKey!0 (array!18145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343115 (= lt!162328 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!343116 () Bool)

(assert (=> b!343116 (= e!210386 e!210385)))

(declare-fun res!189686 () Bool)

(assert (=> b!343116 (=> (not res!189686) (not e!210385))))

(assert (=> b!343116 (= res!189686 (and (not (is-Found!3314 lt!162330)) (not (is-MissingZero!3314 lt!162330)) (is-MissingVacant!3314 lt!162330)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18145 (_ BitVec 32)) SeekEntryResult!3314)

(assert (=> b!343116 (= lt!162330 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343117 () Bool)

(assert (=> b!343117 (= e!210381 (and e!210382 mapRes!12348))))

(declare-fun condMapEmpty!12348 () Bool)

(declare-fun mapDefault!12348 () ValueCell!3295)

