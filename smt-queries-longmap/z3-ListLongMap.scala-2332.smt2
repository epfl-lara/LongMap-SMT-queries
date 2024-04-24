; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37440 () Bool)

(assert start!37440)

(declare-fun b_free!8581 () Bool)

(declare-fun b_next!8581 () Bool)

(assert (=> start!37440 (= b_free!8581 (not b_next!8581))))

(declare-fun tp!30458 () Bool)

(declare-fun b_and!15837 () Bool)

(assert (=> start!37440 (= tp!30458 b_and!15837)))

(declare-fun b!381429 () Bool)

(declare-fun res!216766 () Bool)

(declare-fun e!231893 () Bool)

(assert (=> b!381429 (=> (not res!216766) (not e!231893))))

(declare-datatypes ((array!22358 0))(
  ( (array!22359 (arr!10647 (Array (_ BitVec 32) (_ BitVec 64))) (size!10999 (_ BitVec 32))) )
))
(declare-fun lt!178825 () array!22358)

(declare-datatypes ((List!5970 0))(
  ( (Nil!5967) (Cons!5966 (h!6822 (_ BitVec 64)) (t!11112 List!5970)) )
))
(declare-fun arrayNoDuplicates!0 (array!22358 (_ BitVec 32) List!5970) Bool)

(assert (=> b!381429 (= res!216766 (arrayNoDuplicates!0 lt!178825 #b00000000000000000000000000000000 Nil!5967))))

(declare-fun b!381430 () Bool)

(declare-fun e!231890 () Bool)

(declare-fun e!231888 () Bool)

(declare-fun mapRes!15408 () Bool)

(assert (=> b!381430 (= e!231890 (and e!231888 mapRes!15408))))

(declare-fun condMapEmpty!15408 () Bool)

(declare-datatypes ((V!13411 0))(
  ( (V!13412 (val!4659 Int)) )
))
(declare-datatypes ((ValueCell!4271 0))(
  ( (ValueCellFull!4271 (v!6857 V!13411)) (EmptyCell!4271) )
))
(declare-datatypes ((array!22360 0))(
  ( (array!22361 (arr!10648 (Array (_ BitVec 32) ValueCell!4271)) (size!11000 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22360)

(declare-fun mapDefault!15408 () ValueCell!4271)

(assert (=> b!381430 (= condMapEmpty!15408 (= (arr!10648 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4271)) mapDefault!15408)))))

(declare-fun b!381431 () Bool)

(declare-fun tp_is_empty!9229 () Bool)

(assert (=> b!381431 (= e!231888 tp_is_empty!9229)))

(declare-fun b!381432 () Bool)

(declare-fun res!216775 () Bool)

(declare-fun e!231889 () Bool)

(assert (=> b!381432 (=> (not res!216775) (not e!231889))))

(declare-fun _keys!658 () array!22358)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381432 (= res!216775 (or (= (select (arr!10647 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10647 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15408 () Bool)

(declare-fun tp!30459 () Bool)

(declare-fun e!231892 () Bool)

(assert (=> mapNonEmpty!15408 (= mapRes!15408 (and tp!30459 e!231892))))

(declare-fun mapValue!15408 () ValueCell!4271)

(declare-fun mapRest!15408 () (Array (_ BitVec 32) ValueCell!4271))

(declare-fun mapKey!15408 () (_ BitVec 32))

(assert (=> mapNonEmpty!15408 (= (arr!10648 _values!506) (store mapRest!15408 mapKey!15408 mapValue!15408))))

(declare-fun b!381433 () Bool)

(declare-fun res!216767 () Bool)

(assert (=> b!381433 (=> (not res!216767) (not e!231889))))

(assert (=> b!381433 (= res!216767 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5967))))

(declare-fun b!381434 () Bool)

(declare-fun res!216768 () Bool)

(assert (=> b!381434 (=> (not res!216768) (not e!231889))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22358 (_ BitVec 32)) Bool)

(assert (=> b!381434 (= res!216768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381436 () Bool)

(declare-fun res!216774 () Bool)

(assert (=> b!381436 (=> (not res!216774) (not e!231889))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381436 (= res!216774 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381437 () Bool)

(declare-fun res!216776 () Bool)

(assert (=> b!381437 (=> (not res!216776) (not e!231889))))

(assert (=> b!381437 (= res!216776 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10999 _keys!658))))))

(declare-fun b!381438 () Bool)

(declare-fun e!231891 () Bool)

(assert (=> b!381438 (= e!231893 (not e!231891))))

(declare-fun res!216770 () Bool)

(assert (=> b!381438 (=> res!216770 e!231891)))

(declare-fun lt!178830 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381438 (= res!216770 (or (and (not lt!178830) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178830) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178830)))))

(assert (=> b!381438 (= lt!178830 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13411)

(declare-datatypes ((tuple2!6136 0))(
  ( (tuple2!6137 (_1!3079 (_ BitVec 64)) (_2!3079 V!13411)) )
))
(declare-datatypes ((List!5971 0))(
  ( (Nil!5968) (Cons!5967 (h!6823 tuple2!6136) (t!11113 List!5971)) )
))
(declare-datatypes ((ListLongMap!5051 0))(
  ( (ListLongMap!5052 (toList!2541 List!5971)) )
))
(declare-fun lt!178823 () ListLongMap!5051)

(declare-fun minValue!472 () V!13411)

(declare-fun getCurrentListMap!1978 (array!22358 array!22360 (_ BitVec 32) (_ BitVec 32) V!13411 V!13411 (_ BitVec 32) Int) ListLongMap!5051)

(assert (=> b!381438 (= lt!178823 (getCurrentListMap!1978 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178829 () ListLongMap!5051)

(declare-fun lt!178824 () array!22360)

(assert (=> b!381438 (= lt!178829 (getCurrentListMap!1978 lt!178825 lt!178824 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178828 () ListLongMap!5051)

(declare-fun lt!178826 () ListLongMap!5051)

(assert (=> b!381438 (and (= lt!178828 lt!178826) (= lt!178826 lt!178828))))

(declare-fun v!373 () V!13411)

(declare-fun lt!178831 () ListLongMap!5051)

(declare-fun +!936 (ListLongMap!5051 tuple2!6136) ListLongMap!5051)

(assert (=> b!381438 (= lt!178826 (+!936 lt!178831 (tuple2!6137 k0!778 v!373)))))

(declare-datatypes ((Unit!11751 0))(
  ( (Unit!11752) )
))
(declare-fun lt!178827 () Unit!11751)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!165 (array!22358 array!22360 (_ BitVec 32) (_ BitVec 32) V!13411 V!13411 (_ BitVec 32) (_ BitVec 64) V!13411 (_ BitVec 32) Int) Unit!11751)

(assert (=> b!381438 (= lt!178827 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!165 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!825 (array!22358 array!22360 (_ BitVec 32) (_ BitVec 32) V!13411 V!13411 (_ BitVec 32) Int) ListLongMap!5051)

(assert (=> b!381438 (= lt!178828 (getCurrentListMapNoExtraKeys!825 lt!178825 lt!178824 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381438 (= lt!178824 (array!22361 (store (arr!10648 _values!506) i!548 (ValueCellFull!4271 v!373)) (size!11000 _values!506)))))

(assert (=> b!381438 (= lt!178831 (getCurrentListMapNoExtraKeys!825 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381439 () Bool)

(assert (=> b!381439 (= e!231891 true)))

(assert (=> b!381439 (= lt!178829 lt!178828)))

(declare-fun b!381440 () Bool)

(declare-fun res!216769 () Bool)

(assert (=> b!381440 (=> (not res!216769) (not e!231889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381440 (= res!216769 (validKeyInArray!0 k0!778))))

(declare-fun b!381441 () Bool)

(assert (=> b!381441 (= e!231889 e!231893)))

(declare-fun res!216773 () Bool)

(assert (=> b!381441 (=> (not res!216773) (not e!231893))))

(assert (=> b!381441 (= res!216773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178825 mask!970))))

(assert (=> b!381441 (= lt!178825 (array!22359 (store (arr!10647 _keys!658) i!548 k0!778) (size!10999 _keys!658)))))

(declare-fun res!216771 () Bool)

(assert (=> start!37440 (=> (not res!216771) (not e!231889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37440 (= res!216771 (validMask!0 mask!970))))

(assert (=> start!37440 e!231889))

(declare-fun array_inv!7884 (array!22360) Bool)

(assert (=> start!37440 (and (array_inv!7884 _values!506) e!231890)))

(assert (=> start!37440 tp!30458))

(assert (=> start!37440 true))

(assert (=> start!37440 tp_is_empty!9229))

(declare-fun array_inv!7885 (array!22358) Bool)

(assert (=> start!37440 (array_inv!7885 _keys!658)))

(declare-fun b!381435 () Bool)

(declare-fun res!216772 () Bool)

(assert (=> b!381435 (=> (not res!216772) (not e!231889))))

(assert (=> b!381435 (= res!216772 (and (= (size!11000 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10999 _keys!658) (size!11000 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381442 () Bool)

(assert (=> b!381442 (= e!231892 tp_is_empty!9229)))

(declare-fun mapIsEmpty!15408 () Bool)

(assert (=> mapIsEmpty!15408 mapRes!15408))

(assert (= (and start!37440 res!216771) b!381435))

(assert (= (and b!381435 res!216772) b!381434))

(assert (= (and b!381434 res!216768) b!381433))

(assert (= (and b!381433 res!216767) b!381437))

(assert (= (and b!381437 res!216776) b!381440))

(assert (= (and b!381440 res!216769) b!381432))

(assert (= (and b!381432 res!216775) b!381436))

(assert (= (and b!381436 res!216774) b!381441))

(assert (= (and b!381441 res!216773) b!381429))

(assert (= (and b!381429 res!216766) b!381438))

(assert (= (and b!381438 (not res!216770)) b!381439))

(assert (= (and b!381430 condMapEmpty!15408) mapIsEmpty!15408))

(assert (= (and b!381430 (not condMapEmpty!15408)) mapNonEmpty!15408))

(get-info :version)

(assert (= (and mapNonEmpty!15408 ((_ is ValueCellFull!4271) mapValue!15408)) b!381442))

(assert (= (and b!381430 ((_ is ValueCellFull!4271) mapDefault!15408)) b!381431))

(assert (= start!37440 b!381430))

(declare-fun m!378623 () Bool)

(assert (=> b!381429 m!378623))

(declare-fun m!378625 () Bool)

(assert (=> mapNonEmpty!15408 m!378625))

(declare-fun m!378627 () Bool)

(assert (=> start!37440 m!378627))

(declare-fun m!378629 () Bool)

(assert (=> start!37440 m!378629))

(declare-fun m!378631 () Bool)

(assert (=> start!37440 m!378631))

(declare-fun m!378633 () Bool)

(assert (=> b!381438 m!378633))

(declare-fun m!378635 () Bool)

(assert (=> b!381438 m!378635))

(declare-fun m!378637 () Bool)

(assert (=> b!381438 m!378637))

(declare-fun m!378639 () Bool)

(assert (=> b!381438 m!378639))

(declare-fun m!378641 () Bool)

(assert (=> b!381438 m!378641))

(declare-fun m!378643 () Bool)

(assert (=> b!381438 m!378643))

(declare-fun m!378645 () Bool)

(assert (=> b!381438 m!378645))

(declare-fun m!378647 () Bool)

(assert (=> b!381441 m!378647))

(declare-fun m!378649 () Bool)

(assert (=> b!381441 m!378649))

(declare-fun m!378651 () Bool)

(assert (=> b!381436 m!378651))

(declare-fun m!378653 () Bool)

(assert (=> b!381434 m!378653))

(declare-fun m!378655 () Bool)

(assert (=> b!381433 m!378655))

(declare-fun m!378657 () Bool)

(assert (=> b!381440 m!378657))

(declare-fun m!378659 () Bool)

(assert (=> b!381432 m!378659))

(check-sat tp_is_empty!9229 b_and!15837 (not b!381440) (not b!381441) (not b!381438) (not b!381436) (not mapNonEmpty!15408) (not b_next!8581) (not b!381429) (not b!381434) (not start!37440) (not b!381433))
(check-sat b_and!15837 (not b_next!8581))
