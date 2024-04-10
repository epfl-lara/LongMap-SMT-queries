; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36868 () Bool)

(assert start!36868)

(declare-fun b_free!7995 () Bool)

(declare-fun b_next!7995 () Bool)

(assert (=> start!36868 (= b_free!7995 (not b_next!7995))))

(declare-fun tp!28701 () Bool)

(declare-fun b_and!15237 () Bool)

(assert (=> start!36868 (= tp!28701 b_and!15237)))

(declare-fun b!368942 () Bool)

(declare-fun e!225566 () Bool)

(declare-fun tp_is_empty!8643 () Bool)

(assert (=> b!368942 (= e!225566 tp_is_empty!8643)))

(declare-fun mapIsEmpty!14529 () Bool)

(declare-fun mapRes!14529 () Bool)

(assert (=> mapIsEmpty!14529 mapRes!14529))

(declare-fun b!368943 () Bool)

(declare-fun res!206873 () Bool)

(declare-fun e!225568 () Bool)

(assert (=> b!368943 (=> (not res!206873) (not e!225568))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21239 0))(
  ( (array!21240 (arr!10088 (Array (_ BitVec 32) (_ BitVec 64))) (size!10440 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21239)

(assert (=> b!368943 (= res!206873 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10440 _keys!658))))))

(declare-fun b!368944 () Bool)

(declare-fun res!206878 () Bool)

(assert (=> b!368944 (=> (not res!206878) (not e!225568))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12629 0))(
  ( (V!12630 (val!4366 Int)) )
))
(declare-datatypes ((ValueCell!3978 0))(
  ( (ValueCellFull!3978 (v!6563 V!12629)) (EmptyCell!3978) )
))
(declare-datatypes ((array!21241 0))(
  ( (array!21242 (arr!10089 (Array (_ BitVec 32) ValueCell!3978)) (size!10441 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21241)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!368944 (= res!206878 (and (= (size!10441 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10440 _keys!658) (size!10441 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14529 () Bool)

(declare-fun tp!28700 () Bool)

(assert (=> mapNonEmpty!14529 (= mapRes!14529 (and tp!28700 e!225566))))

(declare-fun mapValue!14529 () ValueCell!3978)

(declare-fun mapRest!14529 () (Array (_ BitVec 32) ValueCell!3978))

(declare-fun mapKey!14529 () (_ BitVec 32))

(assert (=> mapNonEmpty!14529 (= (arr!10089 _values!506) (store mapRest!14529 mapKey!14529 mapValue!14529))))

(declare-fun b!368945 () Bool)

(declare-fun e!225564 () Bool)

(assert (=> b!368945 (= e!225568 e!225564)))

(declare-fun res!206871 () Bool)

(assert (=> b!368945 (=> (not res!206871) (not e!225564))))

(declare-fun lt!169623 () array!21239)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21239 (_ BitVec 32)) Bool)

(assert (=> b!368945 (= res!206871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169623 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!368945 (= lt!169623 (array!21240 (store (arr!10088 _keys!658) i!548 k0!778) (size!10440 _keys!658)))))

(declare-fun b!368947 () Bool)

(declare-fun res!206879 () Bool)

(assert (=> b!368947 (=> (not res!206879) (not e!225568))))

(declare-datatypes ((List!5621 0))(
  ( (Nil!5618) (Cons!5617 (h!6473 (_ BitVec 64)) (t!10771 List!5621)) )
))
(declare-fun arrayNoDuplicates!0 (array!21239 (_ BitVec 32) List!5621) Bool)

(assert (=> b!368947 (= res!206879 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5618))))

(declare-fun b!368948 () Bool)

(declare-fun res!206877 () Bool)

(assert (=> b!368948 (=> (not res!206877) (not e!225568))))

(declare-fun arrayContainsKey!0 (array!21239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368948 (= res!206877 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368949 () Bool)

(declare-fun e!225567 () Bool)

(assert (=> b!368949 (= e!225567 tp_is_empty!8643)))

(declare-fun b!368950 () Bool)

(declare-fun res!206875 () Bool)

(assert (=> b!368950 (=> (not res!206875) (not e!225568))))

(assert (=> b!368950 (= res!206875 (or (= (select (arr!10088 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10088 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368951 () Bool)

(declare-fun res!206870 () Bool)

(assert (=> b!368951 (=> (not res!206870) (not e!225568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368951 (= res!206870 (validKeyInArray!0 k0!778))))

(declare-fun b!368952 () Bool)

(declare-fun e!225569 () Bool)

(assert (=> b!368952 (= e!225569 (and e!225567 mapRes!14529))))

(declare-fun condMapEmpty!14529 () Bool)

(declare-fun mapDefault!14529 () ValueCell!3978)

(assert (=> b!368952 (= condMapEmpty!14529 (= (arr!10089 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3978)) mapDefault!14529)))))

(declare-fun b!368953 () Bool)

(declare-fun res!206872 () Bool)

(assert (=> b!368953 (=> (not res!206872) (not e!225568))))

(assert (=> b!368953 (= res!206872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368954 () Bool)

(assert (=> b!368954 (= e!225564 false)))

(declare-datatypes ((tuple2!5788 0))(
  ( (tuple2!5789 (_1!2905 (_ BitVec 64)) (_2!2905 V!12629)) )
))
(declare-datatypes ((List!5622 0))(
  ( (Nil!5619) (Cons!5618 (h!6474 tuple2!5788) (t!10772 List!5622)) )
))
(declare-datatypes ((ListLongMap!4701 0))(
  ( (ListLongMap!4702 (toList!2366 List!5622)) )
))
(declare-fun lt!169622 () ListLongMap!4701)

(declare-fun zeroValue!472 () V!12629)

(declare-fun v!373 () V!12629)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12629)

(declare-fun getCurrentListMapNoExtraKeys!643 (array!21239 array!21241 (_ BitVec 32) (_ BitVec 32) V!12629 V!12629 (_ BitVec 32) Int) ListLongMap!4701)

(assert (=> b!368954 (= lt!169622 (getCurrentListMapNoExtraKeys!643 lt!169623 (array!21242 (store (arr!10089 _values!506) i!548 (ValueCellFull!3978 v!373)) (size!10441 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169621 () ListLongMap!4701)

(assert (=> b!368954 (= lt!169621 (getCurrentListMapNoExtraKeys!643 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!206876 () Bool)

(assert (=> start!36868 (=> (not res!206876) (not e!225568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36868 (= res!206876 (validMask!0 mask!970))))

(assert (=> start!36868 e!225568))

(declare-fun array_inv!7454 (array!21241) Bool)

(assert (=> start!36868 (and (array_inv!7454 _values!506) e!225569)))

(assert (=> start!36868 tp!28701))

(assert (=> start!36868 true))

(assert (=> start!36868 tp_is_empty!8643))

(declare-fun array_inv!7455 (array!21239) Bool)

(assert (=> start!36868 (array_inv!7455 _keys!658)))

(declare-fun b!368946 () Bool)

(declare-fun res!206874 () Bool)

(assert (=> b!368946 (=> (not res!206874) (not e!225564))))

(assert (=> b!368946 (= res!206874 (arrayNoDuplicates!0 lt!169623 #b00000000000000000000000000000000 Nil!5618))))

(assert (= (and start!36868 res!206876) b!368944))

(assert (= (and b!368944 res!206878) b!368953))

(assert (= (and b!368953 res!206872) b!368947))

(assert (= (and b!368947 res!206879) b!368943))

(assert (= (and b!368943 res!206873) b!368951))

(assert (= (and b!368951 res!206870) b!368950))

(assert (= (and b!368950 res!206875) b!368948))

(assert (= (and b!368948 res!206877) b!368945))

(assert (= (and b!368945 res!206871) b!368946))

(assert (= (and b!368946 res!206874) b!368954))

(assert (= (and b!368952 condMapEmpty!14529) mapIsEmpty!14529))

(assert (= (and b!368952 (not condMapEmpty!14529)) mapNonEmpty!14529))

(get-info :version)

(assert (= (and mapNonEmpty!14529 ((_ is ValueCellFull!3978) mapValue!14529)) b!368942))

(assert (= (and b!368952 ((_ is ValueCellFull!3978) mapDefault!14529)) b!368949))

(assert (= start!36868 b!368952))

(declare-fun m!365433 () Bool)

(assert (=> b!368950 m!365433))

(declare-fun m!365435 () Bool)

(assert (=> start!36868 m!365435))

(declare-fun m!365437 () Bool)

(assert (=> start!36868 m!365437))

(declare-fun m!365439 () Bool)

(assert (=> start!36868 m!365439))

(declare-fun m!365441 () Bool)

(assert (=> b!368947 m!365441))

(declare-fun m!365443 () Bool)

(assert (=> b!368946 m!365443))

(declare-fun m!365445 () Bool)

(assert (=> b!368953 m!365445))

(declare-fun m!365447 () Bool)

(assert (=> b!368948 m!365447))

(declare-fun m!365449 () Bool)

(assert (=> b!368945 m!365449))

(declare-fun m!365451 () Bool)

(assert (=> b!368945 m!365451))

(declare-fun m!365453 () Bool)

(assert (=> mapNonEmpty!14529 m!365453))

(declare-fun m!365455 () Bool)

(assert (=> b!368954 m!365455))

(declare-fun m!365457 () Bool)

(assert (=> b!368954 m!365457))

(declare-fun m!365459 () Bool)

(assert (=> b!368954 m!365459))

(declare-fun m!365461 () Bool)

(assert (=> b!368951 m!365461))

(check-sat (not b!368948) (not b_next!7995) (not b!368954) tp_is_empty!8643 (not b!368946) b_and!15237 (not b!368947) (not start!36868) (not mapNonEmpty!14529) (not b!368945) (not b!368953) (not b!368951))
(check-sat b_and!15237 (not b_next!7995))
