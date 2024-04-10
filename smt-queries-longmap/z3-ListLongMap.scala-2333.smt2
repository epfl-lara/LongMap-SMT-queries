; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37462 () Bool)

(assert start!37462)

(declare-fun b_free!8589 () Bool)

(declare-fun b_next!8589 () Bool)

(assert (=> start!37462 (= b_free!8589 (not b_next!8589))))

(declare-fun tp!30483 () Bool)

(declare-fun b_and!15831 () Bool)

(assert (=> start!37462 (= tp!30483 b_and!15831)))

(declare-fun res!216905 () Bool)

(declare-fun e!232005 () Bool)

(assert (=> start!37462 (=> (not res!216905) (not e!232005))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37462 (= res!216905 (validMask!0 mask!970))))

(assert (=> start!37462 e!232005))

(declare-datatypes ((V!13421 0))(
  ( (V!13422 (val!4663 Int)) )
))
(declare-datatypes ((ValueCell!4275 0))(
  ( (ValueCellFull!4275 (v!6860 V!13421)) (EmptyCell!4275) )
))
(declare-datatypes ((array!22387 0))(
  ( (array!22388 (arr!10662 (Array (_ BitVec 32) ValueCell!4275)) (size!11014 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22387)

(declare-fun e!232007 () Bool)

(declare-fun array_inv!7848 (array!22387) Bool)

(assert (=> start!37462 (and (array_inv!7848 _values!506) e!232007)))

(assert (=> start!37462 tp!30483))

(assert (=> start!37462 true))

(declare-fun tp_is_empty!9237 () Bool)

(assert (=> start!37462 tp_is_empty!9237))

(declare-datatypes ((array!22389 0))(
  ( (array!22390 (arr!10663 (Array (_ BitVec 32) (_ BitVec 64))) (size!11015 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22389)

(declare-fun array_inv!7849 (array!22389) Bool)

(assert (=> start!37462 (array_inv!7849 _keys!658)))

(declare-fun b!381646 () Bool)

(declare-fun res!216910 () Bool)

(assert (=> b!381646 (=> (not res!216910) (not e!232005))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381646 (= res!216910 (validKeyInArray!0 k0!778))))

(declare-fun b!381647 () Bool)

(declare-fun res!216906 () Bool)

(assert (=> b!381647 (=> (not res!216906) (not e!232005))))

(declare-datatypes ((List!6095 0))(
  ( (Nil!6092) (Cons!6091 (h!6947 (_ BitVec 64)) (t!11245 List!6095)) )
))
(declare-fun arrayNoDuplicates!0 (array!22389 (_ BitVec 32) List!6095) Bool)

(assert (=> b!381647 (= res!216906 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6092))))

(declare-fun b!381648 () Bool)

(declare-fun res!216907 () Bool)

(declare-fun e!232008 () Bool)

(assert (=> b!381648 (=> (not res!216907) (not e!232008))))

(declare-fun lt!178914 () array!22389)

(assert (=> b!381648 (= res!216907 (arrayNoDuplicates!0 lt!178914 #b00000000000000000000000000000000 Nil!6092))))

(declare-fun mapNonEmpty!15420 () Bool)

(declare-fun mapRes!15420 () Bool)

(declare-fun tp!30482 () Bool)

(declare-fun e!232004 () Bool)

(assert (=> mapNonEmpty!15420 (= mapRes!15420 (and tp!30482 e!232004))))

(declare-fun mapRest!15420 () (Array (_ BitVec 32) ValueCell!4275))

(declare-fun mapKey!15420 () (_ BitVec 32))

(declare-fun mapValue!15420 () ValueCell!4275)

(assert (=> mapNonEmpty!15420 (= (arr!10662 _values!506) (store mapRest!15420 mapKey!15420 mapValue!15420))))

(declare-fun b!381649 () Bool)

(assert (=> b!381649 (= e!232004 tp_is_empty!9237)))

(declare-fun b!381650 () Bool)

(declare-fun res!216909 () Bool)

(assert (=> b!381650 (=> (not res!216909) (not e!232005))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381650 (= res!216909 (and (= (size!11014 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11015 _keys!658) (size!11014 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15420 () Bool)

(assert (=> mapIsEmpty!15420 mapRes!15420))

(declare-fun b!381651 () Bool)

(declare-fun e!232006 () Bool)

(assert (=> b!381651 (= e!232008 (not e!232006))))

(declare-fun res!216903 () Bool)

(assert (=> b!381651 (=> res!216903 e!232006)))

(declare-fun lt!178913 () Bool)

(assert (=> b!381651 (= res!216903 (or (and (not lt!178913) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178913) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178913)))))

(assert (=> b!381651 (= lt!178913 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13421)

(declare-datatypes ((tuple2!6264 0))(
  ( (tuple2!6265 (_1!3143 (_ BitVec 64)) (_2!3143 V!13421)) )
))
(declare-datatypes ((List!6096 0))(
  ( (Nil!6093) (Cons!6092 (h!6948 tuple2!6264) (t!11246 List!6096)) )
))
(declare-datatypes ((ListLongMap!5177 0))(
  ( (ListLongMap!5178 (toList!2604 List!6096)) )
))
(declare-fun lt!178918 () ListLongMap!5177)

(declare-fun minValue!472 () V!13421)

(declare-fun getCurrentListMap!2015 (array!22389 array!22387 (_ BitVec 32) (_ BitVec 32) V!13421 V!13421 (_ BitVec 32) Int) ListLongMap!5177)

(assert (=> b!381651 (= lt!178918 (getCurrentListMap!2015 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178917 () array!22387)

(declare-fun lt!178919 () ListLongMap!5177)

(assert (=> b!381651 (= lt!178919 (getCurrentListMap!2015 lt!178914 lt!178917 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178916 () ListLongMap!5177)

(declare-fun lt!178915 () ListLongMap!5177)

(assert (=> b!381651 (and (= lt!178916 lt!178915) (= lt!178915 lt!178916))))

(declare-fun lt!178920 () ListLongMap!5177)

(declare-fun v!373 () V!13421)

(declare-fun +!945 (ListLongMap!5177 tuple2!6264) ListLongMap!5177)

(assert (=> b!381651 (= lt!178915 (+!945 lt!178920 (tuple2!6265 k0!778 v!373)))))

(declare-datatypes ((Unit!11784 0))(
  ( (Unit!11785) )
))
(declare-fun lt!178912 () Unit!11784)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!173 (array!22389 array!22387 (_ BitVec 32) (_ BitVec 32) V!13421 V!13421 (_ BitVec 32) (_ BitVec 64) V!13421 (_ BitVec 32) Int) Unit!11784)

(assert (=> b!381651 (= lt!178912 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!173 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!849 (array!22389 array!22387 (_ BitVec 32) (_ BitVec 32) V!13421 V!13421 (_ BitVec 32) Int) ListLongMap!5177)

(assert (=> b!381651 (= lt!178916 (getCurrentListMapNoExtraKeys!849 lt!178914 lt!178917 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381651 (= lt!178917 (array!22388 (store (arr!10662 _values!506) i!548 (ValueCellFull!4275 v!373)) (size!11014 _values!506)))))

(assert (=> b!381651 (= lt!178920 (getCurrentListMapNoExtraKeys!849 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381652 () Bool)

(assert (=> b!381652 (= e!232005 e!232008)))

(declare-fun res!216901 () Bool)

(assert (=> b!381652 (=> (not res!216901) (not e!232008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22389 (_ BitVec 32)) Bool)

(assert (=> b!381652 (= res!216901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178914 mask!970))))

(assert (=> b!381652 (= lt!178914 (array!22390 (store (arr!10663 _keys!658) i!548 k0!778) (size!11015 _keys!658)))))

(declare-fun b!381653 () Bool)

(declare-fun res!216902 () Bool)

(assert (=> b!381653 (=> (not res!216902) (not e!232005))))

(assert (=> b!381653 (= res!216902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381654 () Bool)

(declare-fun e!232010 () Bool)

(assert (=> b!381654 (= e!232010 tp_is_empty!9237)))

(declare-fun b!381655 () Bool)

(assert (=> b!381655 (= e!232006 true)))

(assert (=> b!381655 (= lt!178919 lt!178916)))

(declare-fun b!381656 () Bool)

(assert (=> b!381656 (= e!232007 (and e!232010 mapRes!15420))))

(declare-fun condMapEmpty!15420 () Bool)

(declare-fun mapDefault!15420 () ValueCell!4275)

(assert (=> b!381656 (= condMapEmpty!15420 (= (arr!10662 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4275)) mapDefault!15420)))))

(declare-fun b!381657 () Bool)

(declare-fun res!216908 () Bool)

(assert (=> b!381657 (=> (not res!216908) (not e!232005))))

(assert (=> b!381657 (= res!216908 (or (= (select (arr!10663 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10663 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381658 () Bool)

(declare-fun res!216904 () Bool)

(assert (=> b!381658 (=> (not res!216904) (not e!232005))))

(declare-fun arrayContainsKey!0 (array!22389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381658 (= res!216904 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381659 () Bool)

(declare-fun res!216911 () Bool)

(assert (=> b!381659 (=> (not res!216911) (not e!232005))))

(assert (=> b!381659 (= res!216911 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11015 _keys!658))))))

(assert (= (and start!37462 res!216905) b!381650))

(assert (= (and b!381650 res!216909) b!381653))

(assert (= (and b!381653 res!216902) b!381647))

(assert (= (and b!381647 res!216906) b!381659))

(assert (= (and b!381659 res!216911) b!381646))

(assert (= (and b!381646 res!216910) b!381657))

(assert (= (and b!381657 res!216908) b!381658))

(assert (= (and b!381658 res!216904) b!381652))

(assert (= (and b!381652 res!216901) b!381648))

(assert (= (and b!381648 res!216907) b!381651))

(assert (= (and b!381651 (not res!216903)) b!381655))

(assert (= (and b!381656 condMapEmpty!15420) mapIsEmpty!15420))

(assert (= (and b!381656 (not condMapEmpty!15420)) mapNonEmpty!15420))

(get-info :version)

(assert (= (and mapNonEmpty!15420 ((_ is ValueCellFull!4275) mapValue!15420)) b!381649))

(assert (= (and b!381656 ((_ is ValueCellFull!4275) mapDefault!15420)) b!381654))

(assert (= start!37462 b!381656))

(declare-fun m!378545 () Bool)

(assert (=> b!381651 m!378545))

(declare-fun m!378547 () Bool)

(assert (=> b!381651 m!378547))

(declare-fun m!378549 () Bool)

(assert (=> b!381651 m!378549))

(declare-fun m!378551 () Bool)

(assert (=> b!381651 m!378551))

(declare-fun m!378553 () Bool)

(assert (=> b!381651 m!378553))

(declare-fun m!378555 () Bool)

(assert (=> b!381651 m!378555))

(declare-fun m!378557 () Bool)

(assert (=> b!381651 m!378557))

(declare-fun m!378559 () Bool)

(assert (=> b!381658 m!378559))

(declare-fun m!378561 () Bool)

(assert (=> b!381657 m!378561))

(declare-fun m!378563 () Bool)

(assert (=> b!381648 m!378563))

(declare-fun m!378565 () Bool)

(assert (=> start!37462 m!378565))

(declare-fun m!378567 () Bool)

(assert (=> start!37462 m!378567))

(declare-fun m!378569 () Bool)

(assert (=> start!37462 m!378569))

(declare-fun m!378571 () Bool)

(assert (=> b!381652 m!378571))

(declare-fun m!378573 () Bool)

(assert (=> b!381652 m!378573))

(declare-fun m!378575 () Bool)

(assert (=> b!381647 m!378575))

(declare-fun m!378577 () Bool)

(assert (=> b!381646 m!378577))

(declare-fun m!378579 () Bool)

(assert (=> mapNonEmpty!15420 m!378579))

(declare-fun m!378581 () Bool)

(assert (=> b!381653 m!378581))

(check-sat (not b!381658) (not b!381653) (not mapNonEmpty!15420) (not b!381651) (not start!37462) (not b!381648) tp_is_empty!9237 (not b!381647) (not b_next!8589) (not b!381652) b_and!15831 (not b!381646))
(check-sat b_and!15831 (not b_next!8589))
