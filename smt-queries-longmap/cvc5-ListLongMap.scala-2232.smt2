; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36854 () Bool)

(assert start!36854)

(declare-fun b_free!7981 () Bool)

(declare-fun b_next!7981 () Bool)

(assert (=> start!36854 (= b_free!7981 (not b_next!7981))))

(declare-fun tp!28658 () Bool)

(declare-fun b_and!15223 () Bool)

(assert (=> start!36854 (= tp!28658 b_and!15223)))

(declare-fun b!368670 () Bool)

(declare-fun res!206662 () Bool)

(declare-fun e!225441 () Bool)

(assert (=> b!368670 (=> (not res!206662) (not e!225441))))

(declare-datatypes ((array!21213 0))(
  ( (array!21214 (arr!10075 (Array (_ BitVec 32) (_ BitVec 64))) (size!10427 (_ BitVec 32))) )
))
(declare-fun lt!169566 () array!21213)

(declare-datatypes ((List!5611 0))(
  ( (Nil!5608) (Cons!5607 (h!6463 (_ BitVec 64)) (t!10761 List!5611)) )
))
(declare-fun arrayNoDuplicates!0 (array!21213 (_ BitVec 32) List!5611) Bool)

(assert (=> b!368670 (= res!206662 (arrayNoDuplicates!0 lt!169566 #b00000000000000000000000000000000 Nil!5608))))

(declare-fun b!368671 () Bool)

(declare-fun res!206661 () Bool)

(declare-fun e!225440 () Bool)

(assert (=> b!368671 (=> (not res!206661) (not e!225440))))

(declare-fun _keys!658 () array!21213)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21213 (_ BitVec 32)) Bool)

(assert (=> b!368671 (= res!206661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368672 () Bool)

(declare-fun res!206664 () Bool)

(assert (=> b!368672 (=> (not res!206664) (not e!225440))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368672 (= res!206664 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14508 () Bool)

(declare-fun mapRes!14508 () Bool)

(declare-fun tp!28659 () Bool)

(declare-fun e!225439 () Bool)

(assert (=> mapNonEmpty!14508 (= mapRes!14508 (and tp!28659 e!225439))))

(declare-datatypes ((V!12611 0))(
  ( (V!12612 (val!4359 Int)) )
))
(declare-datatypes ((ValueCell!3971 0))(
  ( (ValueCellFull!3971 (v!6556 V!12611)) (EmptyCell!3971) )
))
(declare-datatypes ((array!21215 0))(
  ( (array!21216 (arr!10076 (Array (_ BitVec 32) ValueCell!3971)) (size!10428 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21215)

(declare-fun mapValue!14508 () ValueCell!3971)

(declare-fun mapKey!14508 () (_ BitVec 32))

(declare-fun mapRest!14508 () (Array (_ BitVec 32) ValueCell!3971))

(assert (=> mapNonEmpty!14508 (= (arr!10076 _values!506) (store mapRest!14508 mapKey!14508 mapValue!14508))))

(declare-fun b!368673 () Bool)

(declare-fun res!206665 () Bool)

(assert (=> b!368673 (=> (not res!206665) (not e!225440))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368673 (= res!206665 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10427 _keys!658))))))

(declare-fun b!368674 () Bool)

(assert (=> b!368674 (= e!225441 (bvsgt #b00000000000000000000000000000000 (size!10427 _keys!658)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((tuple2!5778 0))(
  ( (tuple2!5779 (_1!2900 (_ BitVec 64)) (_2!2900 V!12611)) )
))
(declare-datatypes ((List!5612 0))(
  ( (Nil!5609) (Cons!5608 (h!6464 tuple2!5778) (t!10762 List!5612)) )
))
(declare-datatypes ((ListLongMap!4691 0))(
  ( (ListLongMap!4692 (toList!2361 List!5612)) )
))
(declare-fun lt!169565 () ListLongMap!4691)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12611)

(declare-fun minValue!472 () V!12611)

(declare-fun getCurrentListMapNoExtraKeys!638 (array!21213 array!21215 (_ BitVec 32) (_ BitVec 32) V!12611 V!12611 (_ BitVec 32) Int) ListLongMap!4691)

(assert (=> b!368674 (= lt!169565 (getCurrentListMapNoExtraKeys!638 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368675 () Bool)

(declare-fun res!206660 () Bool)

(assert (=> b!368675 (=> (not res!206660) (not e!225440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368675 (= res!206660 (validKeyInArray!0 k!778))))

(declare-fun b!368676 () Bool)

(declare-fun res!206666 () Bool)

(assert (=> b!368676 (=> (not res!206666) (not e!225440))))

(assert (=> b!368676 (= res!206666 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5608))))

(declare-fun b!368677 () Bool)

(declare-fun e!225443 () Bool)

(declare-fun tp_is_empty!8629 () Bool)

(assert (=> b!368677 (= e!225443 tp_is_empty!8629)))

(declare-fun mapIsEmpty!14508 () Bool)

(assert (=> mapIsEmpty!14508 mapRes!14508))

(declare-fun b!368678 () Bool)

(declare-fun res!206663 () Bool)

(assert (=> b!368678 (=> (not res!206663) (not e!225440))))

(assert (=> b!368678 (= res!206663 (and (= (size!10428 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10427 _keys!658) (size!10428 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368679 () Bool)

(assert (=> b!368679 (= e!225439 tp_is_empty!8629)))

(declare-fun res!206668 () Bool)

(assert (=> start!36854 (=> (not res!206668) (not e!225440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36854 (= res!206668 (validMask!0 mask!970))))

(assert (=> start!36854 e!225440))

(assert (=> start!36854 true))

(declare-fun e!225442 () Bool)

(declare-fun array_inv!7448 (array!21215) Bool)

(assert (=> start!36854 (and (array_inv!7448 _values!506) e!225442)))

(assert (=> start!36854 tp!28658))

(assert (=> start!36854 tp_is_empty!8629))

(declare-fun array_inv!7449 (array!21213) Bool)

(assert (=> start!36854 (array_inv!7449 _keys!658)))

(declare-fun b!368669 () Bool)

(declare-fun res!206667 () Bool)

(assert (=> b!368669 (=> (not res!206667) (not e!225440))))

(assert (=> b!368669 (= res!206667 (or (= (select (arr!10075 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10075 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368680 () Bool)

(assert (=> b!368680 (= e!225440 e!225441)))

(declare-fun res!206669 () Bool)

(assert (=> b!368680 (=> (not res!206669) (not e!225441))))

(assert (=> b!368680 (= res!206669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169566 mask!970))))

(assert (=> b!368680 (= lt!169566 (array!21214 (store (arr!10075 _keys!658) i!548 k!778) (size!10427 _keys!658)))))

(declare-fun b!368681 () Bool)

(assert (=> b!368681 (= e!225442 (and e!225443 mapRes!14508))))

(declare-fun condMapEmpty!14508 () Bool)

(declare-fun mapDefault!14508 () ValueCell!3971)

