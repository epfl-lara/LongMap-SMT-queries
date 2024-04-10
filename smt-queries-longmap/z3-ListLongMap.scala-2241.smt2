; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36910 () Bool)

(assert start!36910)

(declare-fun b_free!8037 () Bool)

(declare-fun b_next!8037 () Bool)

(assert (=> start!36910 (= b_free!8037 (not b_next!8037))))

(declare-fun tp!28826 () Bool)

(declare-fun b_and!15279 () Bool)

(assert (=> start!36910 (= tp!28826 b_and!15279)))

(declare-fun b!369761 () Bool)

(declare-fun res!207504 () Bool)

(declare-fun e!225943 () Bool)

(assert (=> b!369761 (=> (not res!207504) (not e!225943))))

(declare-datatypes ((array!21315 0))(
  ( (array!21316 (arr!10126 (Array (_ BitVec 32) (_ BitVec 64))) (size!10478 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21315)

(declare-datatypes ((List!5653 0))(
  ( (Nil!5650) (Cons!5649 (h!6505 (_ BitVec 64)) (t!10803 List!5653)) )
))
(declare-fun arrayNoDuplicates!0 (array!21315 (_ BitVec 32) List!5653) Bool)

(assert (=> b!369761 (= res!207504 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5650))))

(declare-fun mapIsEmpty!14592 () Bool)

(declare-fun mapRes!14592 () Bool)

(assert (=> mapIsEmpty!14592 mapRes!14592))

(declare-fun b!369762 () Bool)

(declare-fun e!225947 () Bool)

(assert (=> b!369762 (= e!225943 e!225947)))

(declare-fun res!207500 () Bool)

(assert (=> b!369762 (=> (not res!207500) (not e!225947))))

(declare-fun lt!169812 () array!21315)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21315 (_ BitVec 32)) Bool)

(assert (=> b!369762 (= res!207500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169812 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369762 (= lt!169812 (array!21316 (store (arr!10126 _keys!658) i!548 k0!778) (size!10478 _keys!658)))))

(declare-fun b!369763 () Bool)

(declare-fun res!207502 () Bool)

(assert (=> b!369763 (=> (not res!207502) (not e!225943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369763 (= res!207502 (validKeyInArray!0 k0!778))))

(declare-fun b!369764 () Bool)

(declare-fun res!207505 () Bool)

(assert (=> b!369764 (=> (not res!207505) (not e!225943))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12685 0))(
  ( (V!12686 (val!4387 Int)) )
))
(declare-datatypes ((ValueCell!3999 0))(
  ( (ValueCellFull!3999 (v!6584 V!12685)) (EmptyCell!3999) )
))
(declare-datatypes ((array!21317 0))(
  ( (array!21318 (arr!10127 (Array (_ BitVec 32) ValueCell!3999)) (size!10479 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21317)

(assert (=> b!369764 (= res!207505 (and (= (size!10479 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10478 _keys!658) (size!10479 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369766 () Bool)

(assert (=> b!369766 (= e!225947 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5818 0))(
  ( (tuple2!5819 (_1!2920 (_ BitVec 64)) (_2!2920 V!12685)) )
))
(declare-datatypes ((List!5654 0))(
  ( (Nil!5651) (Cons!5650 (h!6506 tuple2!5818) (t!10804 List!5654)) )
))
(declare-datatypes ((ListLongMap!4731 0))(
  ( (ListLongMap!4732 (toList!2381 List!5654)) )
))
(declare-fun lt!169810 () ListLongMap!4731)

(declare-fun zeroValue!472 () V!12685)

(declare-fun v!373 () V!12685)

(declare-fun minValue!472 () V!12685)

(declare-fun getCurrentListMapNoExtraKeys!658 (array!21315 array!21317 (_ BitVec 32) (_ BitVec 32) V!12685 V!12685 (_ BitVec 32) Int) ListLongMap!4731)

(assert (=> b!369766 (= lt!169810 (getCurrentListMapNoExtraKeys!658 lt!169812 (array!21318 (store (arr!10127 _values!506) i!548 (ValueCellFull!3999 v!373)) (size!10479 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169811 () ListLongMap!4731)

(assert (=> b!369766 (= lt!169811 (getCurrentListMapNoExtraKeys!658 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14592 () Bool)

(declare-fun tp!28827 () Bool)

(declare-fun e!225946 () Bool)

(assert (=> mapNonEmpty!14592 (= mapRes!14592 (and tp!28827 e!225946))))

(declare-fun mapValue!14592 () ValueCell!3999)

(declare-fun mapRest!14592 () (Array (_ BitVec 32) ValueCell!3999))

(declare-fun mapKey!14592 () (_ BitVec 32))

(assert (=> mapNonEmpty!14592 (= (arr!10127 _values!506) (store mapRest!14592 mapKey!14592 mapValue!14592))))

(declare-fun b!369767 () Bool)

(declare-fun tp_is_empty!8685 () Bool)

(assert (=> b!369767 (= e!225946 tp_is_empty!8685)))

(declare-fun b!369768 () Bool)

(declare-fun res!207506 () Bool)

(assert (=> b!369768 (=> (not res!207506) (not e!225943))))

(declare-fun arrayContainsKey!0 (array!21315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369768 (= res!207506 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369769 () Bool)

(declare-fun res!207507 () Bool)

(assert (=> b!369769 (=> (not res!207507) (not e!225943))))

(assert (=> b!369769 (= res!207507 (or (= (select (arr!10126 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10126 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369770 () Bool)

(declare-fun e!225944 () Bool)

(assert (=> b!369770 (= e!225944 tp_is_empty!8685)))

(declare-fun b!369771 () Bool)

(declare-fun res!207508 () Bool)

(assert (=> b!369771 (=> (not res!207508) (not e!225943))))

(assert (=> b!369771 (= res!207508 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10478 _keys!658))))))

(declare-fun b!369772 () Bool)

(declare-fun e!225945 () Bool)

(assert (=> b!369772 (= e!225945 (and e!225944 mapRes!14592))))

(declare-fun condMapEmpty!14592 () Bool)

(declare-fun mapDefault!14592 () ValueCell!3999)

(assert (=> b!369772 (= condMapEmpty!14592 (= (arr!10127 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3999)) mapDefault!14592)))))

(declare-fun b!369773 () Bool)

(declare-fun res!207501 () Bool)

(assert (=> b!369773 (=> (not res!207501) (not e!225947))))

(assert (=> b!369773 (= res!207501 (arrayNoDuplicates!0 lt!169812 #b00000000000000000000000000000000 Nil!5650))))

(declare-fun b!369765 () Bool)

(declare-fun res!207509 () Bool)

(assert (=> b!369765 (=> (not res!207509) (not e!225943))))

(assert (=> b!369765 (= res!207509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!207503 () Bool)

(assert (=> start!36910 (=> (not res!207503) (not e!225943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36910 (= res!207503 (validMask!0 mask!970))))

(assert (=> start!36910 e!225943))

(declare-fun array_inv!7482 (array!21317) Bool)

(assert (=> start!36910 (and (array_inv!7482 _values!506) e!225945)))

(assert (=> start!36910 tp!28826))

(assert (=> start!36910 true))

(assert (=> start!36910 tp_is_empty!8685))

(declare-fun array_inv!7483 (array!21315) Bool)

(assert (=> start!36910 (array_inv!7483 _keys!658)))

(assert (= (and start!36910 res!207503) b!369764))

(assert (= (and b!369764 res!207505) b!369765))

(assert (= (and b!369765 res!207509) b!369761))

(assert (= (and b!369761 res!207504) b!369771))

(assert (= (and b!369771 res!207508) b!369763))

(assert (= (and b!369763 res!207502) b!369769))

(assert (= (and b!369769 res!207507) b!369768))

(assert (= (and b!369768 res!207506) b!369762))

(assert (= (and b!369762 res!207500) b!369773))

(assert (= (and b!369773 res!207501) b!369766))

(assert (= (and b!369772 condMapEmpty!14592) mapIsEmpty!14592))

(assert (= (and b!369772 (not condMapEmpty!14592)) mapNonEmpty!14592))

(get-info :version)

(assert (= (and mapNonEmpty!14592 ((_ is ValueCellFull!3999) mapValue!14592)) b!369767))

(assert (= (and b!369772 ((_ is ValueCellFull!3999) mapDefault!14592)) b!369770))

(assert (= start!36910 b!369772))

(declare-fun m!366063 () Bool)

(assert (=> start!36910 m!366063))

(declare-fun m!366065 () Bool)

(assert (=> start!36910 m!366065))

(declare-fun m!366067 () Bool)

(assert (=> start!36910 m!366067))

(declare-fun m!366069 () Bool)

(assert (=> b!369769 m!366069))

(declare-fun m!366071 () Bool)

(assert (=> b!369763 m!366071))

(declare-fun m!366073 () Bool)

(assert (=> b!369765 m!366073))

(declare-fun m!366075 () Bool)

(assert (=> mapNonEmpty!14592 m!366075))

(declare-fun m!366077 () Bool)

(assert (=> b!369761 m!366077))

(declare-fun m!366079 () Bool)

(assert (=> b!369762 m!366079))

(declare-fun m!366081 () Bool)

(assert (=> b!369762 m!366081))

(declare-fun m!366083 () Bool)

(assert (=> b!369766 m!366083))

(declare-fun m!366085 () Bool)

(assert (=> b!369766 m!366085))

(declare-fun m!366087 () Bool)

(assert (=> b!369766 m!366087))

(declare-fun m!366089 () Bool)

(assert (=> b!369768 m!366089))

(declare-fun m!366091 () Bool)

(assert (=> b!369773 m!366091))

(check-sat (not b!369766) (not b!369773) b_and!15279 (not mapNonEmpty!14592) tp_is_empty!8685 (not start!36910) (not b!369763) (not b!369765) (not b!369762) (not b_next!8037) (not b!369768) (not b!369761))
(check-sat b_and!15279 (not b_next!8037))
