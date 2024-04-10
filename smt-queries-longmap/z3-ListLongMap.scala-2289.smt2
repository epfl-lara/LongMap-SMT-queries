; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37198 () Bool)

(assert start!37198)

(declare-fun b_free!8325 () Bool)

(declare-fun b_next!8325 () Bool)

(assert (=> start!37198 (= b_free!8325 (not b_next!8325))))

(declare-fun tp!29690 () Bool)

(declare-fun b_and!15567 () Bool)

(assert (=> start!37198 (= tp!29690 b_and!15567)))

(declare-fun b!375752 () Bool)

(declare-fun res!212202 () Bool)

(declare-fun e!228895 () Bool)

(assert (=> b!375752 (=> (not res!212202) (not e!228895))))

(declare-datatypes ((array!21881 0))(
  ( (array!21882 (arr!10409 (Array (_ BitVec 32) (_ BitVec 64))) (size!10761 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21881)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21881 (_ BitVec 32)) Bool)

(assert (=> b!375752 (= res!212202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375753 () Bool)

(declare-fun res!212203 () Bool)

(assert (=> b!375753 (=> (not res!212203) (not e!228895))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375753 (= res!212203 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375754 () Bool)

(declare-fun res!212200 () Bool)

(assert (=> b!375754 (=> (not res!212200) (not e!228895))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375754 (= res!212200 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10761 _keys!658))))))

(declare-fun b!375755 () Bool)

(declare-fun res!212204 () Bool)

(declare-fun e!228899 () Bool)

(assert (=> b!375755 (=> (not res!212204) (not e!228899))))

(declare-datatypes ((V!13069 0))(
  ( (V!13070 (val!4531 Int)) )
))
(declare-datatypes ((tuple2!6032 0))(
  ( (tuple2!6033 (_1!3027 (_ BitVec 64)) (_2!3027 V!13069)) )
))
(declare-datatypes ((List!5874 0))(
  ( (Nil!5871) (Cons!5870 (h!6726 tuple2!6032) (t!11024 List!5874)) )
))
(declare-datatypes ((ListLongMap!4945 0))(
  ( (ListLongMap!4946 (toList!2488 List!5874)) )
))
(declare-fun lt!174055 () ListLongMap!4945)

(declare-fun lt!174056 () ListLongMap!4945)

(declare-fun lt!174052 () tuple2!6032)

(declare-fun +!834 (ListLongMap!4945 tuple2!6032) ListLongMap!4945)

(assert (=> b!375755 (= res!212204 (= lt!174056 (+!834 lt!174055 lt!174052)))))

(declare-fun b!375756 () Bool)

(declare-fun e!228902 () Bool)

(assert (=> b!375756 (= e!228895 e!228902)))

(declare-fun res!212207 () Bool)

(assert (=> b!375756 (=> (not res!212207) (not e!228902))))

(declare-fun lt!174058 () array!21881)

(assert (=> b!375756 (= res!212207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174058 mask!970))))

(assert (=> b!375756 (= lt!174058 (array!21882 (store (arr!10409 _keys!658) i!548 k0!778) (size!10761 _keys!658)))))

(declare-fun b!375757 () Bool)

(declare-fun e!228901 () Bool)

(assert (=> b!375757 (= e!228901 true)))

(assert (=> b!375757 e!228899))

(declare-fun res!212206 () Bool)

(assert (=> b!375757 (=> (not res!212206) (not e!228899))))

(declare-fun lt!174053 () ListLongMap!4945)

(declare-fun lt!174060 () ListLongMap!4945)

(assert (=> b!375757 (= res!212206 (= lt!174053 (+!834 lt!174060 lt!174052)))))

(declare-fun zeroValue!472 () V!13069)

(assert (=> b!375757 (= lt!174052 (tuple2!6033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375758 () Bool)

(declare-fun e!228900 () Bool)

(declare-fun tp_is_empty!8973 () Bool)

(assert (=> b!375758 (= e!228900 tp_is_empty!8973)))

(declare-fun b!375759 () Bool)

(declare-fun res!212198 () Bool)

(assert (=> b!375759 (=> (not res!212198) (not e!228895))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4143 0))(
  ( (ValueCellFull!4143 (v!6728 V!13069)) (EmptyCell!4143) )
))
(declare-datatypes ((array!21883 0))(
  ( (array!21884 (arr!10410 (Array (_ BitVec 32) ValueCell!4143)) (size!10762 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21883)

(assert (=> b!375759 (= res!212198 (and (= (size!10762 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10761 _keys!658) (size!10762 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375760 () Bool)

(declare-fun e!228897 () Bool)

(declare-fun mapRes!15024 () Bool)

(assert (=> b!375760 (= e!228897 (and e!228900 mapRes!15024))))

(declare-fun condMapEmpty!15024 () Bool)

(declare-fun mapDefault!15024 () ValueCell!4143)

(assert (=> b!375760 (= condMapEmpty!15024 (= (arr!10410 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4143)) mapDefault!15024)))))

(declare-fun b!375761 () Bool)

(declare-fun e!228898 () Bool)

(assert (=> b!375761 (= e!228898 tp_is_empty!8973)))

(declare-fun res!212205 () Bool)

(assert (=> start!37198 (=> (not res!212205) (not e!228895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37198 (= res!212205 (validMask!0 mask!970))))

(assert (=> start!37198 e!228895))

(declare-fun array_inv!7672 (array!21883) Bool)

(assert (=> start!37198 (and (array_inv!7672 _values!506) e!228897)))

(assert (=> start!37198 tp!29690))

(assert (=> start!37198 true))

(assert (=> start!37198 tp_is_empty!8973))

(declare-fun array_inv!7673 (array!21881) Bool)

(assert (=> start!37198 (array_inv!7673 _keys!658)))

(declare-fun b!375762 () Bool)

(declare-fun res!212196 () Bool)

(assert (=> b!375762 (=> (not res!212196) (not e!228895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375762 (= res!212196 (validKeyInArray!0 k0!778))))

(declare-fun b!375763 () Bool)

(declare-fun res!212195 () Bool)

(assert (=> b!375763 (=> (not res!212195) (not e!228895))))

(declare-datatypes ((List!5875 0))(
  ( (Nil!5872) (Cons!5871 (h!6727 (_ BitVec 64)) (t!11025 List!5875)) )
))
(declare-fun arrayNoDuplicates!0 (array!21881 (_ BitVec 32) List!5875) Bool)

(assert (=> b!375763 (= res!212195 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5872))))

(declare-fun mapNonEmpty!15024 () Bool)

(declare-fun tp!29691 () Bool)

(assert (=> mapNonEmpty!15024 (= mapRes!15024 (and tp!29691 e!228898))))

(declare-fun mapKey!15024 () (_ BitVec 32))

(declare-fun mapValue!15024 () ValueCell!4143)

(declare-fun mapRest!15024 () (Array (_ BitVec 32) ValueCell!4143))

(assert (=> mapNonEmpty!15024 (= (arr!10410 _values!506) (store mapRest!15024 mapKey!15024 mapValue!15024))))

(declare-fun b!375764 () Bool)

(declare-fun res!212197 () Bool)

(assert (=> b!375764 (=> (not res!212197) (not e!228902))))

(assert (=> b!375764 (= res!212197 (arrayNoDuplicates!0 lt!174058 #b00000000000000000000000000000000 Nil!5872))))

(declare-fun lt!174057 () ListLongMap!4945)

(declare-fun b!375765 () Bool)

(assert (=> b!375765 (= e!228899 (= lt!174053 (+!834 lt!174057 lt!174052)))))

(declare-fun b!375766 () Bool)

(declare-fun res!212199 () Bool)

(assert (=> b!375766 (=> (not res!212199) (not e!228895))))

(assert (=> b!375766 (= res!212199 (or (= (select (arr!10409 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10409 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375767 () Bool)

(assert (=> b!375767 (= e!228902 (not e!228901))))

(declare-fun res!212201 () Bool)

(assert (=> b!375767 (=> res!212201 e!228901)))

(assert (=> b!375767 (= res!212201 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13069)

(declare-fun getCurrentListMap!1923 (array!21881 array!21883 (_ BitVec 32) (_ BitVec 32) V!13069 V!13069 (_ BitVec 32) Int) ListLongMap!4945)

(assert (=> b!375767 (= lt!174056 (getCurrentListMap!1923 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174059 () array!21883)

(assert (=> b!375767 (= lt!174053 (getCurrentListMap!1923 lt!174058 lt!174059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375767 (and (= lt!174060 lt!174057) (= lt!174057 lt!174060))))

(declare-fun v!373 () V!13069)

(assert (=> b!375767 (= lt!174057 (+!834 lt!174055 (tuple2!6033 k0!778 v!373)))))

(declare-datatypes ((Unit!11574 0))(
  ( (Unit!11575) )
))
(declare-fun lt!174054 () Unit!11574)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!81 (array!21881 array!21883 (_ BitVec 32) (_ BitVec 32) V!13069 V!13069 (_ BitVec 32) (_ BitVec 64) V!13069 (_ BitVec 32) Int) Unit!11574)

(assert (=> b!375767 (= lt!174054 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!81 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!757 (array!21881 array!21883 (_ BitVec 32) (_ BitVec 32) V!13069 V!13069 (_ BitVec 32) Int) ListLongMap!4945)

(assert (=> b!375767 (= lt!174060 (getCurrentListMapNoExtraKeys!757 lt!174058 lt!174059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375767 (= lt!174059 (array!21884 (store (arr!10410 _values!506) i!548 (ValueCellFull!4143 v!373)) (size!10762 _values!506)))))

(assert (=> b!375767 (= lt!174055 (getCurrentListMapNoExtraKeys!757 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15024 () Bool)

(assert (=> mapIsEmpty!15024 mapRes!15024))

(assert (= (and start!37198 res!212205) b!375759))

(assert (= (and b!375759 res!212198) b!375752))

(assert (= (and b!375752 res!212202) b!375763))

(assert (= (and b!375763 res!212195) b!375754))

(assert (= (and b!375754 res!212200) b!375762))

(assert (= (and b!375762 res!212196) b!375766))

(assert (= (and b!375766 res!212199) b!375753))

(assert (= (and b!375753 res!212203) b!375756))

(assert (= (and b!375756 res!212207) b!375764))

(assert (= (and b!375764 res!212197) b!375767))

(assert (= (and b!375767 (not res!212201)) b!375757))

(assert (= (and b!375757 res!212206) b!375755))

(assert (= (and b!375755 res!212204) b!375765))

(assert (= (and b!375760 condMapEmpty!15024) mapIsEmpty!15024))

(assert (= (and b!375760 (not condMapEmpty!15024)) mapNonEmpty!15024))

(get-info :version)

(assert (= (and mapNonEmpty!15024 ((_ is ValueCellFull!4143) mapValue!15024)) b!375761))

(assert (= (and b!375760 ((_ is ValueCellFull!4143) mapDefault!15024)) b!375758))

(assert (= start!37198 b!375760))

(declare-fun m!372419 () Bool)

(assert (=> b!375762 m!372419))

(declare-fun m!372421 () Bool)

(assert (=> b!375766 m!372421))

(declare-fun m!372423 () Bool)

(assert (=> b!375765 m!372423))

(declare-fun m!372425 () Bool)

(assert (=> b!375752 m!372425))

(declare-fun m!372427 () Bool)

(assert (=> b!375757 m!372427))

(declare-fun m!372429 () Bool)

(assert (=> b!375764 m!372429))

(declare-fun m!372431 () Bool)

(assert (=> b!375755 m!372431))

(declare-fun m!372433 () Bool)

(assert (=> b!375756 m!372433))

(declare-fun m!372435 () Bool)

(assert (=> b!375756 m!372435))

(declare-fun m!372437 () Bool)

(assert (=> start!37198 m!372437))

(declare-fun m!372439 () Bool)

(assert (=> start!37198 m!372439))

(declare-fun m!372441 () Bool)

(assert (=> start!37198 m!372441))

(declare-fun m!372443 () Bool)

(assert (=> b!375763 m!372443))

(declare-fun m!372445 () Bool)

(assert (=> b!375767 m!372445))

(declare-fun m!372447 () Bool)

(assert (=> b!375767 m!372447))

(declare-fun m!372449 () Bool)

(assert (=> b!375767 m!372449))

(declare-fun m!372451 () Bool)

(assert (=> b!375767 m!372451))

(declare-fun m!372453 () Bool)

(assert (=> b!375767 m!372453))

(declare-fun m!372455 () Bool)

(assert (=> b!375767 m!372455))

(declare-fun m!372457 () Bool)

(assert (=> b!375767 m!372457))

(declare-fun m!372459 () Bool)

(assert (=> mapNonEmpty!15024 m!372459))

(declare-fun m!372461 () Bool)

(assert (=> b!375753 m!372461))

(check-sat (not b!375762) (not b!375764) (not start!37198) (not b!375765) (not mapNonEmpty!15024) (not b!375763) (not b!375756) (not b!375757) (not b_next!8325) (not b!375755) tp_is_empty!8973 (not b!375767) b_and!15567 (not b!375753) (not b!375752))
(check-sat b_and!15567 (not b_next!8325))
