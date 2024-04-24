; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37698 () Bool)

(assert start!37698)

(declare-fun b_free!8815 () Bool)

(declare-fun b_next!8815 () Bool)

(assert (=> start!37698 (= b_free!8815 (not b_next!8815))))

(declare-fun tp!31197 () Bool)

(declare-fun b_and!16071 () Bool)

(assert (=> start!37698 (= tp!31197 b_and!16071)))

(declare-fun b!386548 () Bool)

(declare-fun res!220731 () Bool)

(declare-fun e!234472 () Bool)

(assert (=> b!386548 (=> (not res!220731) (not e!234472))))

(declare-datatypes ((array!22860 0))(
  ( (array!22861 (arr!10898 (Array (_ BitVec 32) (_ BitVec 64))) (size!11250 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22860)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386548 (= res!220731 (or (= (select (arr!10898 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10898 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15795 () Bool)

(declare-fun mapRes!15795 () Bool)

(declare-fun tp!31196 () Bool)

(declare-fun e!234471 () Bool)

(assert (=> mapNonEmpty!15795 (= mapRes!15795 (and tp!31196 e!234471))))

(declare-datatypes ((V!13755 0))(
  ( (V!13756 (val!4788 Int)) )
))
(declare-datatypes ((ValueCell!4400 0))(
  ( (ValueCellFull!4400 (v!6986 V!13755)) (EmptyCell!4400) )
))
(declare-fun mapRest!15795 () (Array (_ BitVec 32) ValueCell!4400))

(declare-datatypes ((array!22862 0))(
  ( (array!22863 (arr!10899 (Array (_ BitVec 32) ValueCell!4400)) (size!11251 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22862)

(declare-fun mapValue!15795 () ValueCell!4400)

(declare-fun mapKey!15795 () (_ BitVec 32))

(assert (=> mapNonEmpty!15795 (= (arr!10899 _values!506) (store mapRest!15795 mapKey!15795 mapValue!15795))))

(declare-fun b!386549 () Bool)

(declare-fun res!220727 () Bool)

(assert (=> b!386549 (=> (not res!220727) (not e!234472))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386549 (= res!220727 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386550 () Bool)

(declare-fun tp_is_empty!9487 () Bool)

(assert (=> b!386550 (= e!234471 tp_is_empty!9487)))

(declare-fun b!386551 () Bool)

(declare-fun res!220726 () Bool)

(assert (=> b!386551 (=> (not res!220726) (not e!234472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386551 (= res!220726 (validKeyInArray!0 k0!778))))

(declare-fun b!386553 () Bool)

(declare-fun res!220730 () Bool)

(assert (=> b!386553 (=> (not res!220730) (not e!234472))))

(declare-datatypes ((List!6150 0))(
  ( (Nil!6147) (Cons!6146 (h!7002 (_ BitVec 64)) (t!11292 List!6150)) )
))
(declare-fun arrayNoDuplicates!0 (array!22860 (_ BitVec 32) List!6150) Bool)

(assert (=> b!386553 (= res!220730 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6147))))

(declare-fun b!386554 () Bool)

(declare-fun e!234473 () Bool)

(assert (=> b!386554 (= e!234473 false)))

(declare-datatypes ((tuple2!6300 0))(
  ( (tuple2!6301 (_1!3161 (_ BitVec 64)) (_2!3161 V!13755)) )
))
(declare-datatypes ((List!6151 0))(
  ( (Nil!6148) (Cons!6147 (h!7003 tuple2!6300) (t!11293 List!6151)) )
))
(declare-datatypes ((ListLongMap!5215 0))(
  ( (ListLongMap!5216 (toList!2623 List!6151)) )
))
(declare-fun lt!181862 () ListLongMap!5215)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!181863 () array!22860)

(declare-fun zeroValue!472 () V!13755)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13755)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13755)

(declare-fun getCurrentListMapNoExtraKeys!898 (array!22860 array!22862 (_ BitVec 32) (_ BitVec 32) V!13755 V!13755 (_ BitVec 32) Int) ListLongMap!5215)

(assert (=> b!386554 (= lt!181862 (getCurrentListMapNoExtraKeys!898 lt!181863 (array!22863 (store (arr!10899 _values!506) i!548 (ValueCellFull!4400 v!373)) (size!11251 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181864 () ListLongMap!5215)

(assert (=> b!386554 (= lt!181864 (getCurrentListMapNoExtraKeys!898 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386555 () Bool)

(declare-fun e!234470 () Bool)

(declare-fun e!234474 () Bool)

(assert (=> b!386555 (= e!234470 (and e!234474 mapRes!15795))))

(declare-fun condMapEmpty!15795 () Bool)

(declare-fun mapDefault!15795 () ValueCell!4400)

(assert (=> b!386555 (= condMapEmpty!15795 (= (arr!10899 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4400)) mapDefault!15795)))))

(declare-fun b!386556 () Bool)

(declare-fun res!220733 () Bool)

(assert (=> b!386556 (=> (not res!220733) (not e!234473))))

(assert (=> b!386556 (= res!220733 (arrayNoDuplicates!0 lt!181863 #b00000000000000000000000000000000 Nil!6147))))

(declare-fun b!386557 () Bool)

(declare-fun res!220729 () Bool)

(assert (=> b!386557 (=> (not res!220729) (not e!234472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22860 (_ BitVec 32)) Bool)

(assert (=> b!386557 (= res!220729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386558 () Bool)

(declare-fun res!220728 () Bool)

(assert (=> b!386558 (=> (not res!220728) (not e!234472))))

(assert (=> b!386558 (= res!220728 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11250 _keys!658))))))

(declare-fun mapIsEmpty!15795 () Bool)

(assert (=> mapIsEmpty!15795 mapRes!15795))

(declare-fun b!386559 () Bool)

(declare-fun res!220725 () Bool)

(assert (=> b!386559 (=> (not res!220725) (not e!234472))))

(assert (=> b!386559 (= res!220725 (and (= (size!11251 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11250 _keys!658) (size!11251 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386560 () Bool)

(assert (=> b!386560 (= e!234474 tp_is_empty!9487)))

(declare-fun res!220724 () Bool)

(assert (=> start!37698 (=> (not res!220724) (not e!234472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37698 (= res!220724 (validMask!0 mask!970))))

(assert (=> start!37698 e!234472))

(declare-fun array_inv!8054 (array!22862) Bool)

(assert (=> start!37698 (and (array_inv!8054 _values!506) e!234470)))

(assert (=> start!37698 tp!31197))

(assert (=> start!37698 true))

(assert (=> start!37698 tp_is_empty!9487))

(declare-fun array_inv!8055 (array!22860) Bool)

(assert (=> start!37698 (array_inv!8055 _keys!658)))

(declare-fun b!386552 () Bool)

(assert (=> b!386552 (= e!234472 e!234473)))

(declare-fun res!220732 () Bool)

(assert (=> b!386552 (=> (not res!220732) (not e!234473))))

(assert (=> b!386552 (= res!220732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181863 mask!970))))

(assert (=> b!386552 (= lt!181863 (array!22861 (store (arr!10898 _keys!658) i!548 k0!778) (size!11250 _keys!658)))))

(assert (= (and start!37698 res!220724) b!386559))

(assert (= (and b!386559 res!220725) b!386557))

(assert (= (and b!386557 res!220729) b!386553))

(assert (= (and b!386553 res!220730) b!386558))

(assert (= (and b!386558 res!220728) b!386551))

(assert (= (and b!386551 res!220726) b!386548))

(assert (= (and b!386548 res!220731) b!386549))

(assert (= (and b!386549 res!220727) b!386552))

(assert (= (and b!386552 res!220732) b!386556))

(assert (= (and b!386556 res!220733) b!386554))

(assert (= (and b!386555 condMapEmpty!15795) mapIsEmpty!15795))

(assert (= (and b!386555 (not condMapEmpty!15795)) mapNonEmpty!15795))

(get-info :version)

(assert (= (and mapNonEmpty!15795 ((_ is ValueCellFull!4400) mapValue!15795)) b!386550))

(assert (= (and b!386555 ((_ is ValueCellFull!4400) mapDefault!15795)) b!386560))

(assert (= start!37698 b!386555))

(declare-fun m!383135 () Bool)

(assert (=> b!386548 m!383135))

(declare-fun m!383137 () Bool)

(assert (=> b!386553 m!383137))

(declare-fun m!383139 () Bool)

(assert (=> b!386552 m!383139))

(declare-fun m!383141 () Bool)

(assert (=> b!386552 m!383141))

(declare-fun m!383143 () Bool)

(assert (=> start!37698 m!383143))

(declare-fun m!383145 () Bool)

(assert (=> start!37698 m!383145))

(declare-fun m!383147 () Bool)

(assert (=> start!37698 m!383147))

(declare-fun m!383149 () Bool)

(assert (=> b!386554 m!383149))

(declare-fun m!383151 () Bool)

(assert (=> b!386554 m!383151))

(declare-fun m!383153 () Bool)

(assert (=> b!386554 m!383153))

(declare-fun m!383155 () Bool)

(assert (=> mapNonEmpty!15795 m!383155))

(declare-fun m!383157 () Bool)

(assert (=> b!386557 m!383157))

(declare-fun m!383159 () Bool)

(assert (=> b!386551 m!383159))

(declare-fun m!383161 () Bool)

(assert (=> b!386549 m!383161))

(declare-fun m!383163 () Bool)

(assert (=> b!386556 m!383163))

(check-sat tp_is_empty!9487 (not mapNonEmpty!15795) (not b!386556) (not b!386557) (not b!386552) (not b!386554) (not b!386553) (not b!386551) (not b!386549) (not start!37698) (not b_next!8815) b_and!16071)
(check-sat b_and!16071 (not b_next!8815))
