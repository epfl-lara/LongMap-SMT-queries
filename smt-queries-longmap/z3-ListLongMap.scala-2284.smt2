; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37152 () Bool)

(assert start!37152)

(declare-fun b_free!8293 () Bool)

(declare-fun b_next!8293 () Bool)

(assert (=> start!37152 (= b_free!8293 (not b_next!8293))))

(declare-fun tp!29595 () Bool)

(declare-fun b_and!15509 () Bool)

(assert (=> start!37152 (= tp!29595 b_and!15509)))

(declare-fun b!374757 () Bool)

(declare-fun e!228342 () Bool)

(declare-fun e!228338 () Bool)

(assert (=> b!374757 (= e!228342 (not e!228338))))

(declare-fun res!211486 () Bool)

(assert (=> b!374757 (=> res!211486 e!228338)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374757 (= res!211486 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13027 0))(
  ( (V!13028 (val!4515 Int)) )
))
(declare-fun zeroValue!472 () V!13027)

(declare-datatypes ((array!21799 0))(
  ( (array!21800 (arr!10368 (Array (_ BitVec 32) (_ BitVec 64))) (size!10721 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21799)

(declare-datatypes ((tuple2!5980 0))(
  ( (tuple2!5981 (_1!3001 (_ BitVec 64)) (_2!3001 V!13027)) )
))
(declare-datatypes ((List!5813 0))(
  ( (Nil!5810) (Cons!5809 (h!6665 tuple2!5980) (t!10954 List!5813)) )
))
(declare-datatypes ((ListLongMap!4883 0))(
  ( (ListLongMap!4884 (toList!2457 List!5813)) )
))
(declare-fun lt!173051 () ListLongMap!4883)

(declare-datatypes ((ValueCell!4127 0))(
  ( (ValueCellFull!4127 (v!6706 V!13027)) (EmptyCell!4127) )
))
(declare-datatypes ((array!21801 0))(
  ( (array!21802 (arr!10369 (Array (_ BitVec 32) ValueCell!4127)) (size!10722 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21801)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13027)

(declare-fun getCurrentListMap!1874 (array!21799 array!21801 (_ BitVec 32) (_ BitVec 32) V!13027 V!13027 (_ BitVec 32) Int) ListLongMap!4883)

(assert (=> b!374757 (= lt!173051 (getCurrentListMap!1874 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173053 () ListLongMap!4883)

(declare-fun lt!173054 () array!21799)

(declare-fun lt!173050 () array!21801)

(assert (=> b!374757 (= lt!173053 (getCurrentListMap!1874 lt!173054 lt!173050 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173044 () ListLongMap!4883)

(declare-fun lt!173042 () ListLongMap!4883)

(assert (=> b!374757 (and (= lt!173044 lt!173042) (= lt!173042 lt!173044))))

(declare-fun lt!173048 () ListLongMap!4883)

(declare-fun lt!173052 () tuple2!5980)

(declare-fun +!825 (ListLongMap!4883 tuple2!5980) ListLongMap!4883)

(assert (=> b!374757 (= lt!173042 (+!825 lt!173048 lt!173052))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13027)

(assert (=> b!374757 (= lt!173052 (tuple2!5981 k0!778 v!373))))

(declare-datatypes ((Unit!11522 0))(
  ( (Unit!11523) )
))
(declare-fun lt!173043 () Unit!11522)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!67 (array!21799 array!21801 (_ BitVec 32) (_ BitVec 32) V!13027 V!13027 (_ BitVec 32) (_ BitVec 64) V!13027 (_ BitVec 32) Int) Unit!11522)

(assert (=> b!374757 (= lt!173043 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!67 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!739 (array!21799 array!21801 (_ BitVec 32) (_ BitVec 32) V!13027 V!13027 (_ BitVec 32) Int) ListLongMap!4883)

(assert (=> b!374757 (= lt!173044 (getCurrentListMapNoExtraKeys!739 lt!173054 lt!173050 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374757 (= lt!173050 (array!21802 (store (arr!10369 _values!506) i!548 (ValueCellFull!4127 v!373)) (size!10722 _values!506)))))

(assert (=> b!374757 (= lt!173048 (getCurrentListMapNoExtraKeys!739 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374758 () Bool)

(declare-fun e!228337 () Bool)

(declare-fun e!228341 () Bool)

(declare-fun mapRes!14976 () Bool)

(assert (=> b!374758 (= e!228337 (and e!228341 mapRes!14976))))

(declare-fun condMapEmpty!14976 () Bool)

(declare-fun mapDefault!14976 () ValueCell!4127)

(assert (=> b!374758 (= condMapEmpty!14976 (= (arr!10369 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4127)) mapDefault!14976)))))

(declare-fun b!374759 () Bool)

(declare-fun e!228340 () Bool)

(assert (=> b!374759 (= e!228340 true)))

(declare-fun lt!173057 () tuple2!5980)

(declare-fun lt!173045 () ListLongMap!4883)

(declare-fun lt!173056 () ListLongMap!4883)

(assert (=> b!374759 (= (+!825 lt!173045 lt!173057) (+!825 lt!173056 lt!173052))))

(declare-fun lt!173058 () Unit!11522)

(declare-fun lt!173047 () ListLongMap!4883)

(declare-fun addCommutativeForDiffKeys!241 (ListLongMap!4883 (_ BitVec 64) V!13027 (_ BitVec 64) V!13027) Unit!11522)

(assert (=> b!374759 (= lt!173058 (addCommutativeForDiffKeys!241 lt!173047 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374760 () Bool)

(declare-fun res!211496 () Bool)

(declare-fun e!228344 () Bool)

(assert (=> b!374760 (=> (not res!211496) (not e!228344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374760 (= res!211496 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14976 () Bool)

(declare-fun tp!29594 () Bool)

(declare-fun e!228343 () Bool)

(assert (=> mapNonEmpty!14976 (= mapRes!14976 (and tp!29594 e!228343))))

(declare-fun mapValue!14976 () ValueCell!4127)

(declare-fun mapRest!14976 () (Array (_ BitVec 32) ValueCell!4127))

(declare-fun mapKey!14976 () (_ BitVec 32))

(assert (=> mapNonEmpty!14976 (= (arr!10369 _values!506) (store mapRest!14976 mapKey!14976 mapValue!14976))))

(declare-fun mapIsEmpty!14976 () Bool)

(assert (=> mapIsEmpty!14976 mapRes!14976))

(declare-fun res!211487 () Bool)

(assert (=> start!37152 (=> (not res!211487) (not e!228344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37152 (= res!211487 (validMask!0 mask!970))))

(assert (=> start!37152 e!228344))

(declare-fun array_inv!7652 (array!21801) Bool)

(assert (=> start!37152 (and (array_inv!7652 _values!506) e!228337)))

(assert (=> start!37152 tp!29595))

(assert (=> start!37152 true))

(declare-fun tp_is_empty!8941 () Bool)

(assert (=> start!37152 tp_is_empty!8941))

(declare-fun array_inv!7653 (array!21799) Bool)

(assert (=> start!37152 (array_inv!7653 _keys!658)))

(declare-fun b!374756 () Bool)

(assert (=> b!374756 (= e!228343 tp_is_empty!8941)))

(declare-fun b!374761 () Bool)

(declare-fun res!211493 () Bool)

(assert (=> b!374761 (=> (not res!211493) (not e!228342))))

(declare-datatypes ((List!5814 0))(
  ( (Nil!5811) (Cons!5810 (h!6666 (_ BitVec 64)) (t!10955 List!5814)) )
))
(declare-fun arrayNoDuplicates!0 (array!21799 (_ BitVec 32) List!5814) Bool)

(assert (=> b!374761 (= res!211493 (arrayNoDuplicates!0 lt!173054 #b00000000000000000000000000000000 Nil!5811))))

(declare-fun b!374762 () Bool)

(declare-fun res!211490 () Bool)

(assert (=> b!374762 (=> (not res!211490) (not e!228344))))

(assert (=> b!374762 (= res!211490 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5811))))

(declare-fun b!374763 () Bool)

(declare-fun res!211494 () Bool)

(assert (=> b!374763 (=> (not res!211494) (not e!228344))))

(assert (=> b!374763 (= res!211494 (or (= (select (arr!10368 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10368 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374764 () Bool)

(declare-fun res!211488 () Bool)

(assert (=> b!374764 (=> (not res!211488) (not e!228344))))

(assert (=> b!374764 (= res!211488 (and (= (size!10722 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10721 _keys!658) (size!10722 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374765 () Bool)

(declare-fun res!211492 () Bool)

(assert (=> b!374765 (=> (not res!211492) (not e!228344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21799 (_ BitVec 32)) Bool)

(assert (=> b!374765 (= res!211492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374766 () Bool)

(assert (=> b!374766 (= e!228338 e!228340)))

(declare-fun res!211495 () Bool)

(assert (=> b!374766 (=> res!211495 e!228340)))

(assert (=> b!374766 (= res!211495 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173049 () ListLongMap!4883)

(assert (=> b!374766 (= lt!173049 lt!173045)))

(assert (=> b!374766 (= lt!173045 (+!825 lt!173047 lt!173052))))

(declare-fun lt!173046 () Unit!11522)

(assert (=> b!374766 (= lt!173046 (addCommutativeForDiffKeys!241 lt!173048 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374766 (= lt!173053 (+!825 lt!173049 lt!173057))))

(declare-fun lt!173055 () tuple2!5980)

(assert (=> b!374766 (= lt!173049 (+!825 lt!173042 lt!173055))))

(assert (=> b!374766 (= lt!173051 lt!173056)))

(assert (=> b!374766 (= lt!173056 (+!825 lt!173047 lt!173057))))

(assert (=> b!374766 (= lt!173047 (+!825 lt!173048 lt!173055))))

(assert (=> b!374766 (= lt!173053 (+!825 (+!825 lt!173044 lt!173055) lt!173057))))

(assert (=> b!374766 (= lt!173057 (tuple2!5981 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374766 (= lt!173055 (tuple2!5981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374767 () Bool)

(assert (=> b!374767 (= e!228341 tp_is_empty!8941)))

(declare-fun b!374768 () Bool)

(declare-fun res!211485 () Bool)

(assert (=> b!374768 (=> (not res!211485) (not e!228344))))

(declare-fun arrayContainsKey!0 (array!21799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374768 (= res!211485 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374769 () Bool)

(assert (=> b!374769 (= e!228344 e!228342)))

(declare-fun res!211491 () Bool)

(assert (=> b!374769 (=> (not res!211491) (not e!228342))))

(assert (=> b!374769 (= res!211491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173054 mask!970))))

(assert (=> b!374769 (= lt!173054 (array!21800 (store (arr!10368 _keys!658) i!548 k0!778) (size!10721 _keys!658)))))

(declare-fun b!374770 () Bool)

(declare-fun res!211489 () Bool)

(assert (=> b!374770 (=> (not res!211489) (not e!228344))))

(assert (=> b!374770 (= res!211489 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10721 _keys!658))))))

(assert (= (and start!37152 res!211487) b!374764))

(assert (= (and b!374764 res!211488) b!374765))

(assert (= (and b!374765 res!211492) b!374762))

(assert (= (and b!374762 res!211490) b!374770))

(assert (= (and b!374770 res!211489) b!374760))

(assert (= (and b!374760 res!211496) b!374763))

(assert (= (and b!374763 res!211494) b!374768))

(assert (= (and b!374768 res!211485) b!374769))

(assert (= (and b!374769 res!211491) b!374761))

(assert (= (and b!374761 res!211493) b!374757))

(assert (= (and b!374757 (not res!211486)) b!374766))

(assert (= (and b!374766 (not res!211495)) b!374759))

(assert (= (and b!374758 condMapEmpty!14976) mapIsEmpty!14976))

(assert (= (and b!374758 (not condMapEmpty!14976)) mapNonEmpty!14976))

(get-info :version)

(assert (= (and mapNonEmpty!14976 ((_ is ValueCellFull!4127) mapValue!14976)) b!374756))

(assert (= (and b!374758 ((_ is ValueCellFull!4127) mapDefault!14976)) b!374767))

(assert (= start!37152 b!374758))

(declare-fun m!370751 () Bool)

(assert (=> mapNonEmpty!14976 m!370751))

(declare-fun m!370753 () Bool)

(assert (=> start!37152 m!370753))

(declare-fun m!370755 () Bool)

(assert (=> start!37152 m!370755))

(declare-fun m!370757 () Bool)

(assert (=> start!37152 m!370757))

(declare-fun m!370759 () Bool)

(assert (=> b!374759 m!370759))

(declare-fun m!370761 () Bool)

(assert (=> b!374759 m!370761))

(declare-fun m!370763 () Bool)

(assert (=> b!374759 m!370763))

(declare-fun m!370765 () Bool)

(assert (=> b!374763 m!370765))

(declare-fun m!370767 () Bool)

(assert (=> b!374765 m!370767))

(declare-fun m!370769 () Bool)

(assert (=> b!374757 m!370769))

(declare-fun m!370771 () Bool)

(assert (=> b!374757 m!370771))

(declare-fun m!370773 () Bool)

(assert (=> b!374757 m!370773))

(declare-fun m!370775 () Bool)

(assert (=> b!374757 m!370775))

(declare-fun m!370777 () Bool)

(assert (=> b!374757 m!370777))

(declare-fun m!370779 () Bool)

(assert (=> b!374757 m!370779))

(declare-fun m!370781 () Bool)

(assert (=> b!374757 m!370781))

(declare-fun m!370783 () Bool)

(assert (=> b!374769 m!370783))

(declare-fun m!370785 () Bool)

(assert (=> b!374769 m!370785))

(declare-fun m!370787 () Bool)

(assert (=> b!374768 m!370787))

(declare-fun m!370789 () Bool)

(assert (=> b!374760 m!370789))

(declare-fun m!370791 () Bool)

(assert (=> b!374762 m!370791))

(declare-fun m!370793 () Bool)

(assert (=> b!374761 m!370793))

(declare-fun m!370795 () Bool)

(assert (=> b!374766 m!370795))

(declare-fun m!370797 () Bool)

(assert (=> b!374766 m!370797))

(declare-fun m!370799 () Bool)

(assert (=> b!374766 m!370799))

(declare-fun m!370801 () Bool)

(assert (=> b!374766 m!370801))

(declare-fun m!370803 () Bool)

(assert (=> b!374766 m!370803))

(declare-fun m!370805 () Bool)

(assert (=> b!374766 m!370805))

(assert (=> b!374766 m!370797))

(declare-fun m!370807 () Bool)

(assert (=> b!374766 m!370807))

(declare-fun m!370809 () Bool)

(assert (=> b!374766 m!370809))

(check-sat (not b!374768) (not b_next!8293) (not start!37152) (not b!374760) (not b!374762) (not b!374761) (not b!374757) (not b!374769) (not b!374759) b_and!15509 tp_is_empty!8941 (not b!374766) (not b!374765) (not mapNonEmpty!14976))
(check-sat b_and!15509 (not b_next!8293))
