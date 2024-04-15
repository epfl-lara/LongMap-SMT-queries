; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37098 () Bool)

(assert start!37098)

(declare-fun b_free!8239 () Bool)

(declare-fun b_next!8239 () Bool)

(assert (=> start!37098 (= b_free!8239 (not b_next!8239))))

(declare-fun tp!29433 () Bool)

(declare-fun b_and!15455 () Bool)

(assert (=> start!37098 (= tp!29433 b_and!15455)))

(declare-fun b!373541 () Bool)

(declare-fun e!227689 () Bool)

(declare-fun e!227694 () Bool)

(assert (=> b!373541 (= e!227689 e!227694)))

(declare-fun res!210519 () Bool)

(assert (=> b!373541 (=> res!210519 e!227694)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!373541 (= res!210519 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12955 0))(
  ( (V!12956 (val!4488 Int)) )
))
(declare-datatypes ((tuple2!5930 0))(
  ( (tuple2!5931 (_1!2976 (_ BitVec 64)) (_2!2976 V!12955)) )
))
(declare-datatypes ((List!5765 0))(
  ( (Nil!5762) (Cons!5761 (h!6617 tuple2!5930) (t!10906 List!5765)) )
))
(declare-datatypes ((ListLongMap!4833 0))(
  ( (ListLongMap!4834 (toList!2432 List!5765)) )
))
(declare-fun lt!171680 () ListLongMap!4833)

(declare-fun lt!171673 () ListLongMap!4833)

(assert (=> b!373541 (= lt!171680 lt!171673)))

(declare-fun lt!171676 () ListLongMap!4833)

(declare-fun lt!171677 () tuple2!5930)

(declare-fun +!800 (ListLongMap!4833 tuple2!5930) ListLongMap!4833)

(assert (=> b!373541 (= lt!171673 (+!800 lt!171676 lt!171677))))

(declare-datatypes ((Unit!11472 0))(
  ( (Unit!11473) )
))
(declare-fun lt!171666 () Unit!11472)

(declare-fun lt!171674 () ListLongMap!4833)

(declare-fun v!373 () V!12955)

(declare-fun zeroValue!472 () V!12955)

(declare-fun addCommutativeForDiffKeys!219 (ListLongMap!4833 (_ BitVec 64) V!12955 (_ BitVec 64) V!12955) Unit!11472)

(assert (=> b!373541 (= lt!171666 (addCommutativeForDiffKeys!219 lt!171674 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171665 () ListLongMap!4833)

(declare-fun lt!171681 () tuple2!5930)

(assert (=> b!373541 (= lt!171665 (+!800 lt!171680 lt!171681))))

(declare-fun lt!171672 () ListLongMap!4833)

(declare-fun lt!171668 () tuple2!5930)

(assert (=> b!373541 (= lt!171680 (+!800 lt!171672 lt!171668))))

(declare-fun lt!171678 () ListLongMap!4833)

(declare-fun lt!171670 () ListLongMap!4833)

(assert (=> b!373541 (= lt!171678 lt!171670)))

(assert (=> b!373541 (= lt!171670 (+!800 lt!171676 lt!171681))))

(assert (=> b!373541 (= lt!171676 (+!800 lt!171674 lt!171668))))

(declare-fun lt!171671 () ListLongMap!4833)

(assert (=> b!373541 (= lt!171665 (+!800 (+!800 lt!171671 lt!171668) lt!171681))))

(declare-fun minValue!472 () V!12955)

(assert (=> b!373541 (= lt!171681 (tuple2!5931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373541 (= lt!171668 (tuple2!5931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373542 () Bool)

(declare-fun e!227691 () Bool)

(declare-fun e!227693 () Bool)

(declare-fun mapRes!14895 () Bool)

(assert (=> b!373542 (= e!227691 (and e!227693 mapRes!14895))))

(declare-fun condMapEmpty!14895 () Bool)

(declare-datatypes ((ValueCell!4100 0))(
  ( (ValueCellFull!4100 (v!6679 V!12955)) (EmptyCell!4100) )
))
(declare-datatypes ((array!21691 0))(
  ( (array!21692 (arr!10314 (Array (_ BitVec 32) ValueCell!4100)) (size!10667 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21691)

(declare-fun mapDefault!14895 () ValueCell!4100)

(assert (=> b!373542 (= condMapEmpty!14895 (= (arr!10314 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4100)) mapDefault!14895)))))

(declare-fun b!373543 () Bool)

(declare-fun e!227695 () Bool)

(declare-fun e!227696 () Bool)

(assert (=> b!373543 (= e!227695 e!227696)))

(declare-fun res!210523 () Bool)

(assert (=> b!373543 (=> (not res!210523) (not e!227696))))

(declare-datatypes ((array!21693 0))(
  ( (array!21694 (arr!10315 (Array (_ BitVec 32) (_ BitVec 64))) (size!10668 (_ BitVec 32))) )
))
(declare-fun lt!171667 () array!21693)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21693 (_ BitVec 32)) Bool)

(assert (=> b!373543 (= res!210523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171667 mask!970))))

(declare-fun _keys!658 () array!21693)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373543 (= lt!171667 (array!21694 (store (arr!10315 _keys!658) i!548 k0!778) (size!10668 _keys!658)))))

(declare-fun b!373544 () Bool)

(declare-fun res!210521 () Bool)

(assert (=> b!373544 (=> (not res!210521) (not e!227695))))

(declare-datatypes ((List!5766 0))(
  ( (Nil!5763) (Cons!5762 (h!6618 (_ BitVec 64)) (t!10907 List!5766)) )
))
(declare-fun arrayNoDuplicates!0 (array!21693 (_ BitVec 32) List!5766) Bool)

(assert (=> b!373544 (= res!210521 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5763))))

(declare-fun b!373545 () Bool)

(declare-fun res!210524 () Bool)

(assert (=> b!373545 (=> (not res!210524) (not e!227695))))

(assert (=> b!373545 (= res!210524 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10668 _keys!658))))))

(declare-fun mapIsEmpty!14895 () Bool)

(assert (=> mapIsEmpty!14895 mapRes!14895))

(declare-fun b!373546 () Bool)

(assert (=> b!373546 (= e!227694 true)))

(assert (=> b!373546 (= (+!800 lt!171673 lt!171681) (+!800 lt!171670 lt!171677))))

(declare-fun lt!171675 () Unit!11472)

(assert (=> b!373546 (= lt!171675 (addCommutativeForDiffKeys!219 lt!171676 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373547 () Bool)

(declare-fun res!210522 () Bool)

(assert (=> b!373547 (=> (not res!210522) (not e!227695))))

(declare-fun arrayContainsKey!0 (array!21693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373547 (= res!210522 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373548 () Bool)

(declare-fun res!210516 () Bool)

(assert (=> b!373548 (=> (not res!210516) (not e!227696))))

(assert (=> b!373548 (= res!210516 (arrayNoDuplicates!0 lt!171667 #b00000000000000000000000000000000 Nil!5763))))

(declare-fun mapNonEmpty!14895 () Bool)

(declare-fun tp!29432 () Bool)

(declare-fun e!227692 () Bool)

(assert (=> mapNonEmpty!14895 (= mapRes!14895 (and tp!29432 e!227692))))

(declare-fun mapKey!14895 () (_ BitVec 32))

(declare-fun mapValue!14895 () ValueCell!4100)

(declare-fun mapRest!14895 () (Array (_ BitVec 32) ValueCell!4100))

(assert (=> mapNonEmpty!14895 (= (arr!10314 _values!506) (store mapRest!14895 mapKey!14895 mapValue!14895))))

(declare-fun b!373549 () Bool)

(declare-fun res!210515 () Bool)

(assert (=> b!373549 (=> (not res!210515) (not e!227695))))

(assert (=> b!373549 (= res!210515 (or (= (select (arr!10315 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10315 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373550 () Bool)

(declare-fun tp_is_empty!8887 () Bool)

(assert (=> b!373550 (= e!227692 tp_is_empty!8887)))

(declare-fun b!373551 () Bool)

(declare-fun res!210514 () Bool)

(assert (=> b!373551 (=> (not res!210514) (not e!227695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373551 (= res!210514 (validKeyInArray!0 k0!778))))

(declare-fun b!373552 () Bool)

(declare-fun res!210518 () Bool)

(assert (=> b!373552 (=> (not res!210518) (not e!227695))))

(assert (=> b!373552 (= res!210518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373554 () Bool)

(assert (=> b!373554 (= e!227693 tp_is_empty!8887)))

(declare-fun b!373555 () Bool)

(assert (=> b!373555 (= e!227696 (not e!227689))))

(declare-fun res!210520 () Bool)

(assert (=> b!373555 (=> res!210520 e!227689)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373555 (= res!210520 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1854 (array!21693 array!21691 (_ BitVec 32) (_ BitVec 32) V!12955 V!12955 (_ BitVec 32) Int) ListLongMap!4833)

(assert (=> b!373555 (= lt!171678 (getCurrentListMap!1854 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171669 () array!21691)

(assert (=> b!373555 (= lt!171665 (getCurrentListMap!1854 lt!171667 lt!171669 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373555 (and (= lt!171671 lt!171672) (= lt!171672 lt!171671))))

(assert (=> b!373555 (= lt!171672 (+!800 lt!171674 lt!171677))))

(assert (=> b!373555 (= lt!171677 (tuple2!5931 k0!778 v!373))))

(declare-fun lt!171679 () Unit!11472)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!47 (array!21693 array!21691 (_ BitVec 32) (_ BitVec 32) V!12955 V!12955 (_ BitVec 32) (_ BitVec 64) V!12955 (_ BitVec 32) Int) Unit!11472)

(assert (=> b!373555 (= lt!171679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!47 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!719 (array!21693 array!21691 (_ BitVec 32) (_ BitVec 32) V!12955 V!12955 (_ BitVec 32) Int) ListLongMap!4833)

(assert (=> b!373555 (= lt!171671 (getCurrentListMapNoExtraKeys!719 lt!171667 lt!171669 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373555 (= lt!171669 (array!21692 (store (arr!10314 _values!506) i!548 (ValueCellFull!4100 v!373)) (size!10667 _values!506)))))

(assert (=> b!373555 (= lt!171674 (getCurrentListMapNoExtraKeys!719 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!210517 () Bool)

(assert (=> start!37098 (=> (not res!210517) (not e!227695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37098 (= res!210517 (validMask!0 mask!970))))

(assert (=> start!37098 e!227695))

(declare-fun array_inv!7612 (array!21691) Bool)

(assert (=> start!37098 (and (array_inv!7612 _values!506) e!227691)))

(assert (=> start!37098 tp!29433))

(assert (=> start!37098 true))

(assert (=> start!37098 tp_is_empty!8887))

(declare-fun array_inv!7613 (array!21693) Bool)

(assert (=> start!37098 (array_inv!7613 _keys!658)))

(declare-fun b!373553 () Bool)

(declare-fun res!210513 () Bool)

(assert (=> b!373553 (=> (not res!210513) (not e!227695))))

(assert (=> b!373553 (= res!210513 (and (= (size!10667 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10668 _keys!658) (size!10667 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37098 res!210517) b!373553))

(assert (= (and b!373553 res!210513) b!373552))

(assert (= (and b!373552 res!210518) b!373544))

(assert (= (and b!373544 res!210521) b!373545))

(assert (= (and b!373545 res!210524) b!373551))

(assert (= (and b!373551 res!210514) b!373549))

(assert (= (and b!373549 res!210515) b!373547))

(assert (= (and b!373547 res!210522) b!373543))

(assert (= (and b!373543 res!210523) b!373548))

(assert (= (and b!373548 res!210516) b!373555))

(assert (= (and b!373555 (not res!210520)) b!373541))

(assert (= (and b!373541 (not res!210519)) b!373546))

(assert (= (and b!373542 condMapEmpty!14895) mapIsEmpty!14895))

(assert (= (and b!373542 (not condMapEmpty!14895)) mapNonEmpty!14895))

(get-info :version)

(assert (= (and mapNonEmpty!14895 ((_ is ValueCellFull!4100) mapValue!14895)) b!373550))

(assert (= (and b!373542 ((_ is ValueCellFull!4100) mapDefault!14895)) b!373554))

(assert (= start!37098 b!373542))

(declare-fun m!369131 () Bool)

(assert (=> b!373552 m!369131))

(declare-fun m!369133 () Bool)

(assert (=> b!373551 m!369133))

(declare-fun m!369135 () Bool)

(assert (=> b!373541 m!369135))

(declare-fun m!369137 () Bool)

(assert (=> b!373541 m!369137))

(declare-fun m!369139 () Bool)

(assert (=> b!373541 m!369139))

(declare-fun m!369141 () Bool)

(assert (=> b!373541 m!369141))

(declare-fun m!369143 () Bool)

(assert (=> b!373541 m!369143))

(declare-fun m!369145 () Bool)

(assert (=> b!373541 m!369145))

(declare-fun m!369147 () Bool)

(assert (=> b!373541 m!369147))

(assert (=> b!373541 m!369139))

(declare-fun m!369149 () Bool)

(assert (=> b!373541 m!369149))

(declare-fun m!369151 () Bool)

(assert (=> b!373548 m!369151))

(declare-fun m!369153 () Bool)

(assert (=> b!373544 m!369153))

(declare-fun m!369155 () Bool)

(assert (=> b!373555 m!369155))

(declare-fun m!369157 () Bool)

(assert (=> b!373555 m!369157))

(declare-fun m!369159 () Bool)

(assert (=> b!373555 m!369159))

(declare-fun m!369161 () Bool)

(assert (=> b!373555 m!369161))

(declare-fun m!369163 () Bool)

(assert (=> b!373555 m!369163))

(declare-fun m!369165 () Bool)

(assert (=> b!373555 m!369165))

(declare-fun m!369167 () Bool)

(assert (=> b!373555 m!369167))

(declare-fun m!369169 () Bool)

(assert (=> mapNonEmpty!14895 m!369169))

(declare-fun m!369171 () Bool)

(assert (=> start!37098 m!369171))

(declare-fun m!369173 () Bool)

(assert (=> start!37098 m!369173))

(declare-fun m!369175 () Bool)

(assert (=> start!37098 m!369175))

(declare-fun m!369177 () Bool)

(assert (=> b!373549 m!369177))

(declare-fun m!369179 () Bool)

(assert (=> b!373547 m!369179))

(declare-fun m!369181 () Bool)

(assert (=> b!373543 m!369181))

(declare-fun m!369183 () Bool)

(assert (=> b!373543 m!369183))

(declare-fun m!369185 () Bool)

(assert (=> b!373546 m!369185))

(declare-fun m!369187 () Bool)

(assert (=> b!373546 m!369187))

(declare-fun m!369189 () Bool)

(assert (=> b!373546 m!369189))

(check-sat (not b!373547) (not start!37098) b_and!15455 (not b_next!8239) (not b!373544) (not b!373555) (not b!373543) (not b!373551) (not b!373541) (not mapNonEmpty!14895) tp_is_empty!8887 (not b!373548) (not b!373552) (not b!373546))
(check-sat b_and!15455 (not b_next!8239))
