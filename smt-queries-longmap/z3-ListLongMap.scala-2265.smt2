; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37038 () Bool)

(assert start!37038)

(declare-fun b_free!8179 () Bool)

(declare-fun b_next!8179 () Bool)

(assert (=> start!37038 (= b_free!8179 (not b_next!8179))))

(declare-fun tp!29253 () Bool)

(declare-fun b_and!15435 () Bool)

(assert (=> start!37038 (= tp!29253 b_and!15435)))

(declare-fun b!372481 () Bool)

(declare-fun e!227188 () Bool)

(assert (=> b!372481 (= e!227188 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!21576 0))(
  ( (array!21577 (arr!10256 (Array (_ BitVec 32) (_ BitVec 64))) (size!10608 (_ BitVec 32))) )
))
(declare-fun lt!170824 () array!21576)

(declare-datatypes ((V!12875 0))(
  ( (V!12876 (val!4458 Int)) )
))
(declare-fun zeroValue!472 () V!12875)

(declare-datatypes ((ValueCell!4070 0))(
  ( (ValueCellFull!4070 (v!6656 V!12875)) (EmptyCell!4070) )
))
(declare-datatypes ((array!21578 0))(
  ( (array!21579 (arr!10257 (Array (_ BitVec 32) ValueCell!4070)) (size!10609 (_ BitVec 32))) )
))
(declare-fun lt!170820 () array!21578)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((tuple2!5814 0))(
  ( (tuple2!5815 (_1!2918 (_ BitVec 64)) (_2!2918 V!12875)) )
))
(declare-datatypes ((List!5657 0))(
  ( (Nil!5654) (Cons!5653 (h!6509 tuple2!5814) (t!10799 List!5657)) )
))
(declare-datatypes ((ListLongMap!4729 0))(
  ( (ListLongMap!4730 (toList!2380 List!5657)) )
))
(declare-fun lt!170819 () ListLongMap!4729)

(declare-fun minValue!472 () V!12875)

(declare-fun getCurrentListMap!1842 (array!21576 array!21578 (_ BitVec 32) (_ BitVec 32) V!12875 V!12875 (_ BitVec 32) Int) ListLongMap!4729)

(assert (=> b!372481 (= lt!170819 (getCurrentListMap!1842 lt!170824 lt!170820 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170822 () ListLongMap!4729)

(declare-fun lt!170821 () ListLongMap!4729)

(assert (=> b!372481 (and (= lt!170822 lt!170821) (= lt!170821 lt!170822))))

(declare-fun v!373 () V!12875)

(declare-fun lt!170823 () ListLongMap!4729)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!776 (ListLongMap!4729 tuple2!5814) ListLongMap!4729)

(assert (=> b!372481 (= lt!170821 (+!776 lt!170823 (tuple2!5815 k0!778 v!373)))))

(declare-fun _values!506 () array!21578)

(declare-fun _keys!658 () array!21576)

(declare-datatypes ((Unit!11443 0))(
  ( (Unit!11444) )
))
(declare-fun lt!170818 () Unit!11443)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!29 (array!21576 array!21578 (_ BitVec 32) (_ BitVec 32) V!12875 V!12875 (_ BitVec 32) (_ BitVec 64) V!12875 (_ BitVec 32) Int) Unit!11443)

(assert (=> b!372481 (= lt!170818 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!29 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!689 (array!21576 array!21578 (_ BitVec 32) (_ BitVec 32) V!12875 V!12875 (_ BitVec 32) Int) ListLongMap!4729)

(assert (=> b!372481 (= lt!170822 (getCurrentListMapNoExtraKeys!689 lt!170824 lt!170820 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372481 (= lt!170820 (array!21579 (store (arr!10257 _values!506) i!548 (ValueCellFull!4070 v!373)) (size!10609 _values!506)))))

(assert (=> b!372481 (= lt!170823 (getCurrentListMapNoExtraKeys!689 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372482 () Bool)

(declare-fun res!209634 () Bool)

(declare-fun e!227193 () Bool)

(assert (=> b!372482 (=> (not res!209634) (not e!227193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21576 (_ BitVec 32)) Bool)

(assert (=> b!372482 (= res!209634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!209627 () Bool)

(assert (=> start!37038 (=> (not res!209627) (not e!227193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37038 (= res!209627 (validMask!0 mask!970))))

(assert (=> start!37038 e!227193))

(declare-fun e!227189 () Bool)

(declare-fun array_inv!7606 (array!21578) Bool)

(assert (=> start!37038 (and (array_inv!7606 _values!506) e!227189)))

(assert (=> start!37038 tp!29253))

(assert (=> start!37038 true))

(declare-fun tp_is_empty!8827 () Bool)

(assert (=> start!37038 tp_is_empty!8827))

(declare-fun array_inv!7607 (array!21576) Bool)

(assert (=> start!37038 (array_inv!7607 _keys!658)))

(declare-fun b!372483 () Bool)

(declare-fun e!227191 () Bool)

(declare-fun mapRes!14805 () Bool)

(assert (=> b!372483 (= e!227189 (and e!227191 mapRes!14805))))

(declare-fun condMapEmpty!14805 () Bool)

(declare-fun mapDefault!14805 () ValueCell!4070)

(assert (=> b!372483 (= condMapEmpty!14805 (= (arr!10257 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4070)) mapDefault!14805)))))

(declare-fun b!372484 () Bool)

(declare-fun e!227190 () Bool)

(assert (=> b!372484 (= e!227190 tp_is_empty!8827)))

(declare-fun mapIsEmpty!14805 () Bool)

(assert (=> mapIsEmpty!14805 mapRes!14805))

(declare-fun b!372485 () Bool)

(declare-fun res!209630 () Bool)

(assert (=> b!372485 (=> (not res!209630) (not e!227188))))

(declare-datatypes ((List!5658 0))(
  ( (Nil!5655) (Cons!5654 (h!6510 (_ BitVec 64)) (t!10800 List!5658)) )
))
(declare-fun arrayNoDuplicates!0 (array!21576 (_ BitVec 32) List!5658) Bool)

(assert (=> b!372485 (= res!209630 (arrayNoDuplicates!0 lt!170824 #b00000000000000000000000000000000 Nil!5655))))

(declare-fun mapNonEmpty!14805 () Bool)

(declare-fun tp!29252 () Bool)

(assert (=> mapNonEmpty!14805 (= mapRes!14805 (and tp!29252 e!227190))))

(declare-fun mapKey!14805 () (_ BitVec 32))

(declare-fun mapRest!14805 () (Array (_ BitVec 32) ValueCell!4070))

(declare-fun mapValue!14805 () ValueCell!4070)

(assert (=> mapNonEmpty!14805 (= (arr!10257 _values!506) (store mapRest!14805 mapKey!14805 mapValue!14805))))

(declare-fun b!372486 () Bool)

(declare-fun res!209628 () Bool)

(assert (=> b!372486 (=> (not res!209628) (not e!227193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372486 (= res!209628 (validKeyInArray!0 k0!778))))

(declare-fun b!372487 () Bool)

(declare-fun res!209632 () Bool)

(assert (=> b!372487 (=> (not res!209632) (not e!227193))))

(assert (=> b!372487 (= res!209632 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5655))))

(declare-fun b!372488 () Bool)

(declare-fun res!209631 () Bool)

(assert (=> b!372488 (=> (not res!209631) (not e!227193))))

(assert (=> b!372488 (= res!209631 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10608 _keys!658))))))

(declare-fun b!372489 () Bool)

(assert (=> b!372489 (= e!227191 tp_is_empty!8827)))

(declare-fun b!372490 () Bool)

(assert (=> b!372490 (= e!227193 e!227188)))

(declare-fun res!209633 () Bool)

(assert (=> b!372490 (=> (not res!209633) (not e!227188))))

(assert (=> b!372490 (= res!209633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170824 mask!970))))

(assert (=> b!372490 (= lt!170824 (array!21577 (store (arr!10256 _keys!658) i!548 k0!778) (size!10608 _keys!658)))))

(declare-fun b!372491 () Bool)

(declare-fun res!209629 () Bool)

(assert (=> b!372491 (=> (not res!209629) (not e!227193))))

(declare-fun arrayContainsKey!0 (array!21576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372491 (= res!209629 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372492 () Bool)

(declare-fun res!209635 () Bool)

(assert (=> b!372492 (=> (not res!209635) (not e!227193))))

(assert (=> b!372492 (= res!209635 (and (= (size!10609 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10608 _keys!658) (size!10609 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372493 () Bool)

(declare-fun res!209636 () Bool)

(assert (=> b!372493 (=> (not res!209636) (not e!227193))))

(assert (=> b!372493 (= res!209636 (or (= (select (arr!10256 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10256 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37038 res!209627) b!372492))

(assert (= (and b!372492 res!209635) b!372482))

(assert (= (and b!372482 res!209634) b!372487))

(assert (= (and b!372487 res!209632) b!372488))

(assert (= (and b!372488 res!209631) b!372486))

(assert (= (and b!372486 res!209628) b!372493))

(assert (= (and b!372493 res!209636) b!372491))

(assert (= (and b!372491 res!209629) b!372490))

(assert (= (and b!372490 res!209633) b!372485))

(assert (= (and b!372485 res!209630) b!372481))

(assert (= (and b!372483 condMapEmpty!14805) mapIsEmpty!14805))

(assert (= (and b!372483 (not condMapEmpty!14805)) mapNonEmpty!14805))

(get-info :version)

(assert (= (and mapNonEmpty!14805 ((_ is ValueCellFull!4070) mapValue!14805)) b!372484))

(assert (= (and b!372483 ((_ is ValueCellFull!4070) mapDefault!14805)) b!372489))

(assert (= start!37038 b!372483))

(declare-fun m!368621 () Bool)

(assert (=> b!372481 m!368621))

(declare-fun m!368623 () Bool)

(assert (=> b!372481 m!368623))

(declare-fun m!368625 () Bool)

(assert (=> b!372481 m!368625))

(declare-fun m!368627 () Bool)

(assert (=> b!372481 m!368627))

(declare-fun m!368629 () Bool)

(assert (=> b!372481 m!368629))

(declare-fun m!368631 () Bool)

(assert (=> b!372481 m!368631))

(declare-fun m!368633 () Bool)

(assert (=> b!372487 m!368633))

(declare-fun m!368635 () Bool)

(assert (=> b!372482 m!368635))

(declare-fun m!368637 () Bool)

(assert (=> b!372493 m!368637))

(declare-fun m!368639 () Bool)

(assert (=> start!37038 m!368639))

(declare-fun m!368641 () Bool)

(assert (=> start!37038 m!368641))

(declare-fun m!368643 () Bool)

(assert (=> start!37038 m!368643))

(declare-fun m!368645 () Bool)

(assert (=> b!372490 m!368645))

(declare-fun m!368647 () Bool)

(assert (=> b!372490 m!368647))

(declare-fun m!368649 () Bool)

(assert (=> b!372491 m!368649))

(declare-fun m!368651 () Bool)

(assert (=> mapNonEmpty!14805 m!368651))

(declare-fun m!368653 () Bool)

(assert (=> b!372486 m!368653))

(declare-fun m!368655 () Bool)

(assert (=> b!372485 m!368655))

(check-sat (not b!372487) (not b!372482) (not b!372490) (not b!372491) b_and!15435 tp_is_empty!8827 (not b_next!8179) (not b!372481) (not start!37038) (not b!372486) (not b!372485) (not mapNonEmpty!14805))
(check-sat b_and!15435 (not b_next!8179))
