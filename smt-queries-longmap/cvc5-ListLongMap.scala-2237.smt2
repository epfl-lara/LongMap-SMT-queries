; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36884 () Bool)

(assert start!36884)

(declare-fun b_free!8011 () Bool)

(declare-fun b_next!8011 () Bool)

(assert (=> start!36884 (= b_free!8011 (not b_next!8011))))

(declare-fun tp!28748 () Bool)

(declare-fun b_and!15253 () Bool)

(assert (=> start!36884 (= tp!28748 b_and!15253)))

(declare-fun b!369254 () Bool)

(declare-fun res!207114 () Bool)

(declare-fun e!225709 () Bool)

(assert (=> b!369254 (=> (not res!207114) (not e!225709))))

(declare-datatypes ((array!21269 0))(
  ( (array!21270 (arr!10103 (Array (_ BitVec 32) (_ BitVec 64))) (size!10455 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21269)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369254 (= res!207114 (or (= (select (arr!10103 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10103 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369255 () Bool)

(declare-fun res!207115 () Bool)

(assert (=> b!369255 (=> (not res!207115) (not e!225709))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369255 (= res!207115 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369256 () Bool)

(declare-fun e!225710 () Bool)

(declare-fun tp_is_empty!8659 () Bool)

(assert (=> b!369256 (= e!225710 tp_is_empty!8659)))

(declare-fun res!207113 () Bool)

(assert (=> start!36884 (=> (not res!207113) (not e!225709))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36884 (= res!207113 (validMask!0 mask!970))))

(assert (=> start!36884 e!225709))

(declare-datatypes ((V!12651 0))(
  ( (V!12652 (val!4374 Int)) )
))
(declare-datatypes ((ValueCell!3986 0))(
  ( (ValueCellFull!3986 (v!6571 V!12651)) (EmptyCell!3986) )
))
(declare-datatypes ((array!21271 0))(
  ( (array!21272 (arr!10104 (Array (_ BitVec 32) ValueCell!3986)) (size!10456 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21271)

(declare-fun e!225711 () Bool)

(declare-fun array_inv!7466 (array!21271) Bool)

(assert (=> start!36884 (and (array_inv!7466 _values!506) e!225711)))

(assert (=> start!36884 tp!28748))

(assert (=> start!36884 true))

(assert (=> start!36884 tp_is_empty!8659))

(declare-fun array_inv!7467 (array!21269) Bool)

(assert (=> start!36884 (array_inv!7467 _keys!658)))

(declare-fun b!369257 () Bool)

(declare-fun res!207118 () Bool)

(assert (=> b!369257 (=> (not res!207118) (not e!225709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21269 (_ BitVec 32)) Bool)

(assert (=> b!369257 (= res!207118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369258 () Bool)

(declare-fun res!207110 () Bool)

(assert (=> b!369258 (=> (not res!207110) (not e!225709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369258 (= res!207110 (validKeyInArray!0 k!778))))

(declare-fun b!369259 () Bool)

(declare-fun e!225712 () Bool)

(assert (=> b!369259 (= e!225709 e!225712)))

(declare-fun res!207117 () Bool)

(assert (=> b!369259 (=> (not res!207117) (not e!225712))))

(declare-fun lt!169693 () array!21269)

(assert (=> b!369259 (= res!207117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169693 mask!970))))

(assert (=> b!369259 (= lt!169693 (array!21270 (store (arr!10103 _keys!658) i!548 k!778) (size!10455 _keys!658)))))

(declare-fun b!369260 () Bool)

(declare-fun res!207119 () Bool)

(assert (=> b!369260 (=> (not res!207119) (not e!225709))))

(assert (=> b!369260 (= res!207119 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10455 _keys!658))))))

(declare-fun b!369261 () Bool)

(declare-fun e!225708 () Bool)

(assert (=> b!369261 (= e!225708 tp_is_empty!8659)))

(declare-fun mapNonEmpty!14553 () Bool)

(declare-fun mapRes!14553 () Bool)

(declare-fun tp!28749 () Bool)

(assert (=> mapNonEmpty!14553 (= mapRes!14553 (and tp!28749 e!225710))))

(declare-fun mapRest!14553 () (Array (_ BitVec 32) ValueCell!3986))

(declare-fun mapValue!14553 () ValueCell!3986)

(declare-fun mapKey!14553 () (_ BitVec 32))

(assert (=> mapNonEmpty!14553 (= (arr!10104 _values!506) (store mapRest!14553 mapKey!14553 mapValue!14553))))

(declare-fun b!369262 () Bool)

(declare-fun res!207112 () Bool)

(assert (=> b!369262 (=> (not res!207112) (not e!225709))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369262 (= res!207112 (and (= (size!10456 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10455 _keys!658) (size!10456 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369263 () Bool)

(assert (=> b!369263 (= e!225712 false)))

(declare-datatypes ((tuple2!5800 0))(
  ( (tuple2!5801 (_1!2911 (_ BitVec 64)) (_2!2911 V!12651)) )
))
(declare-datatypes ((List!5634 0))(
  ( (Nil!5631) (Cons!5630 (h!6486 tuple2!5800) (t!10784 List!5634)) )
))
(declare-datatypes ((ListLongMap!4713 0))(
  ( (ListLongMap!4714 (toList!2372 List!5634)) )
))
(declare-fun lt!169695 () ListLongMap!4713)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12651)

(declare-fun v!373 () V!12651)

(declare-fun minValue!472 () V!12651)

(declare-fun getCurrentListMapNoExtraKeys!649 (array!21269 array!21271 (_ BitVec 32) (_ BitVec 32) V!12651 V!12651 (_ BitVec 32) Int) ListLongMap!4713)

(assert (=> b!369263 (= lt!169695 (getCurrentListMapNoExtraKeys!649 lt!169693 (array!21272 (store (arr!10104 _values!506) i!548 (ValueCellFull!3986 v!373)) (size!10456 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169694 () ListLongMap!4713)

(assert (=> b!369263 (= lt!169694 (getCurrentListMapNoExtraKeys!649 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369264 () Bool)

(declare-fun res!207116 () Bool)

(assert (=> b!369264 (=> (not res!207116) (not e!225712))))

(declare-datatypes ((List!5635 0))(
  ( (Nil!5632) (Cons!5631 (h!6487 (_ BitVec 64)) (t!10785 List!5635)) )
))
(declare-fun arrayNoDuplicates!0 (array!21269 (_ BitVec 32) List!5635) Bool)

(assert (=> b!369264 (= res!207116 (arrayNoDuplicates!0 lt!169693 #b00000000000000000000000000000000 Nil!5632))))

(declare-fun b!369265 () Bool)

(declare-fun res!207111 () Bool)

(assert (=> b!369265 (=> (not res!207111) (not e!225709))))

(assert (=> b!369265 (= res!207111 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5632))))

(declare-fun mapIsEmpty!14553 () Bool)

(assert (=> mapIsEmpty!14553 mapRes!14553))

(declare-fun b!369266 () Bool)

(assert (=> b!369266 (= e!225711 (and e!225708 mapRes!14553))))

(declare-fun condMapEmpty!14553 () Bool)

(declare-fun mapDefault!14553 () ValueCell!3986)

