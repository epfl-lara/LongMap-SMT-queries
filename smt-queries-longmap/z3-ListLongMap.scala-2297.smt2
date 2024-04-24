; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37230 () Bool)

(assert start!37230)

(declare-fun b_free!8371 () Bool)

(declare-fun b_next!8371 () Bool)

(assert (=> start!37230 (= b_free!8371 (not b_next!8371))))

(declare-fun tp!29829 () Bool)

(declare-fun b_and!15627 () Bool)

(assert (=> start!37230 (= tp!29829 b_and!15627)))

(declare-fun b!376742 () Bool)

(declare-fun res!213029 () Bool)

(declare-fun e!229418 () Bool)

(assert (=> b!376742 (=> (not res!213029) (not e!229418))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376742 (= res!213029 (validKeyInArray!0 k0!778))))

(declare-fun b!376743 () Bool)

(declare-fun res!213027 () Bool)

(assert (=> b!376743 (=> (not res!213027) (not e!229418))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13131 0))(
  ( (V!13132 (val!4554 Int)) )
))
(declare-datatypes ((ValueCell!4166 0))(
  ( (ValueCellFull!4166 (v!6752 V!13131)) (EmptyCell!4166) )
))
(declare-datatypes ((array!21956 0))(
  ( (array!21957 (arr!10446 (Array (_ BitVec 32) ValueCell!4166)) (size!10798 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21956)

(declare-datatypes ((array!21958 0))(
  ( (array!21959 (arr!10447 (Array (_ BitVec 32) (_ BitVec 64))) (size!10799 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21958)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376743 (= res!213027 (and (= (size!10798 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10799 _keys!658) (size!10798 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376744 () Bool)

(declare-fun e!229422 () Bool)

(declare-fun e!229419 () Bool)

(declare-fun mapRes!15093 () Bool)

(assert (=> b!376744 (= e!229422 (and e!229419 mapRes!15093))))

(declare-fun condMapEmpty!15093 () Bool)

(declare-fun mapDefault!15093 () ValueCell!4166)

(assert (=> b!376744 (= condMapEmpty!15093 (= (arr!10446 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4166)) mapDefault!15093)))))

(declare-fun b!376745 () Bool)

(declare-fun res!213031 () Bool)

(assert (=> b!376745 (=> (not res!213031) (not e!229418))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376745 (= res!213031 (or (= (select (arr!10447 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10447 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376746 () Bool)

(declare-fun e!229415 () Bool)

(assert (=> b!376746 (= e!229415 true)))

(declare-datatypes ((tuple2!5972 0))(
  ( (tuple2!5973 (_1!2997 (_ BitVec 64)) (_2!2997 V!13131)) )
))
(declare-datatypes ((List!5813 0))(
  ( (Nil!5810) (Cons!5809 (h!6665 tuple2!5972) (t!10955 List!5813)) )
))
(declare-datatypes ((ListLongMap!4887 0))(
  ( (ListLongMap!4888 (toList!2459 List!5813)) )
))
(declare-fun lt!174964 () ListLongMap!4887)

(declare-fun lt!174962 () ListLongMap!4887)

(declare-fun lt!174954 () tuple2!5972)

(declare-fun +!855 (ListLongMap!4887 tuple2!5972) ListLongMap!4887)

(assert (=> b!376746 (= lt!174964 (+!855 lt!174962 lt!174954))))

(declare-fun v!373 () V!13131)

(declare-datatypes ((Unit!11597 0))(
  ( (Unit!11598) )
))
(declare-fun lt!174953 () Unit!11597)

(declare-fun lt!174959 () ListLongMap!4887)

(declare-fun zeroValue!472 () V!13131)

(declare-fun addCommutativeForDiffKeys!276 (ListLongMap!4887 (_ BitVec 64) V!13131 (_ BitVec 64) V!13131) Unit!11597)

(assert (=> b!376746 (= lt!174953 (addCommutativeForDiffKeys!276 lt!174959 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376747 () Bool)

(declare-fun res!213034 () Bool)

(assert (=> b!376747 (=> (not res!213034) (not e!229418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21958 (_ BitVec 32)) Bool)

(assert (=> b!376747 (= res!213034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376748 () Bool)

(declare-fun res!213032 () Bool)

(assert (=> b!376748 (=> (not res!213032) (not e!229418))))

(assert (=> b!376748 (= res!213032 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10799 _keys!658))))))

(declare-fun b!376749 () Bool)

(declare-fun e!229416 () Bool)

(declare-fun e!229421 () Bool)

(assert (=> b!376749 (= e!229416 (not e!229421))))

(declare-fun res!213030 () Bool)

(assert (=> b!376749 (=> res!213030 e!229421)))

(assert (=> b!376749 (= res!213030 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!174957 () ListLongMap!4887)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13131)

(declare-fun getCurrentListMap!1908 (array!21958 array!21956 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) Int) ListLongMap!4887)

(assert (=> b!376749 (= lt!174957 (getCurrentListMap!1908 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174963 () array!21958)

(declare-fun lt!174961 () ListLongMap!4887)

(declare-fun lt!174960 () array!21956)

(assert (=> b!376749 (= lt!174961 (getCurrentListMap!1908 lt!174963 lt!174960 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174955 () ListLongMap!4887)

(declare-fun lt!174952 () ListLongMap!4887)

(assert (=> b!376749 (and (= lt!174955 lt!174952) (= lt!174952 lt!174955))))

(assert (=> b!376749 (= lt!174952 (+!855 lt!174959 lt!174954))))

(assert (=> b!376749 (= lt!174954 (tuple2!5973 k0!778 v!373))))

(declare-fun lt!174956 () Unit!11597)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!95 (array!21958 array!21956 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) (_ BitVec 64) V!13131 (_ BitVec 32) Int) Unit!11597)

(assert (=> b!376749 (= lt!174956 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!95 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!755 (array!21958 array!21956 (_ BitVec 32) (_ BitVec 32) V!13131 V!13131 (_ BitVec 32) Int) ListLongMap!4887)

(assert (=> b!376749 (= lt!174955 (getCurrentListMapNoExtraKeys!755 lt!174963 lt!174960 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376749 (= lt!174960 (array!21957 (store (arr!10446 _values!506) i!548 (ValueCellFull!4166 v!373)) (size!10798 _values!506)))))

(assert (=> b!376749 (= lt!174959 (getCurrentListMapNoExtraKeys!755 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376750 () Bool)

(declare-fun tp_is_empty!9019 () Bool)

(assert (=> b!376750 (= e!229419 tp_is_empty!9019)))

(declare-fun b!376751 () Bool)

(declare-fun res!213026 () Bool)

(assert (=> b!376751 (=> (not res!213026) (not e!229418))))

(declare-fun arrayContainsKey!0 (array!21958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376751 (= res!213026 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!213028 () Bool)

(assert (=> start!37230 (=> (not res!213028) (not e!229418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37230 (= res!213028 (validMask!0 mask!970))))

(assert (=> start!37230 e!229418))

(declare-fun array_inv!7752 (array!21956) Bool)

(assert (=> start!37230 (and (array_inv!7752 _values!506) e!229422)))

(assert (=> start!37230 tp!29829))

(assert (=> start!37230 true))

(assert (=> start!37230 tp_is_empty!9019))

(declare-fun array_inv!7753 (array!21958) Bool)

(assert (=> start!37230 (array_inv!7753 _keys!658)))

(declare-fun b!376752 () Bool)

(declare-fun e!229417 () Bool)

(assert (=> b!376752 (= e!229417 tp_is_empty!9019)))

(declare-fun b!376753 () Bool)

(declare-fun res!213035 () Bool)

(assert (=> b!376753 (=> (not res!213035) (not e!229416))))

(declare-datatypes ((List!5814 0))(
  ( (Nil!5811) (Cons!5810 (h!6666 (_ BitVec 64)) (t!10956 List!5814)) )
))
(declare-fun arrayNoDuplicates!0 (array!21958 (_ BitVec 32) List!5814) Bool)

(assert (=> b!376753 (= res!213035 (arrayNoDuplicates!0 lt!174963 #b00000000000000000000000000000000 Nil!5811))))

(declare-fun b!376754 () Bool)

(assert (=> b!376754 (= e!229421 e!229415)))

(declare-fun res!213025 () Bool)

(assert (=> b!376754 (=> res!213025 e!229415)))

(assert (=> b!376754 (= res!213025 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!376754 (= lt!174961 lt!174964)))

(declare-fun lt!174958 () tuple2!5972)

(assert (=> b!376754 (= lt!174964 (+!855 lt!174952 lt!174958))))

(assert (=> b!376754 (= lt!174957 lt!174962)))

(assert (=> b!376754 (= lt!174962 (+!855 lt!174959 lt!174958))))

(assert (=> b!376754 (= lt!174961 (+!855 lt!174955 lt!174958))))

(assert (=> b!376754 (= lt!174958 (tuple2!5973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15093 () Bool)

(assert (=> mapIsEmpty!15093 mapRes!15093))

(declare-fun b!376755 () Bool)

(declare-fun res!213024 () Bool)

(assert (=> b!376755 (=> (not res!213024) (not e!229418))))

(assert (=> b!376755 (= res!213024 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5811))))

(declare-fun b!376756 () Bool)

(assert (=> b!376756 (= e!229418 e!229416)))

(declare-fun res!213033 () Bool)

(assert (=> b!376756 (=> (not res!213033) (not e!229416))))

(assert (=> b!376756 (= res!213033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174963 mask!970))))

(assert (=> b!376756 (= lt!174963 (array!21959 (store (arr!10447 _keys!658) i!548 k0!778) (size!10799 _keys!658)))))

(declare-fun mapNonEmpty!15093 () Bool)

(declare-fun tp!29828 () Bool)

(assert (=> mapNonEmpty!15093 (= mapRes!15093 (and tp!29828 e!229417))))

(declare-fun mapRest!15093 () (Array (_ BitVec 32) ValueCell!4166))

(declare-fun mapValue!15093 () ValueCell!4166)

(declare-fun mapKey!15093 () (_ BitVec 32))

(assert (=> mapNonEmpty!15093 (= (arr!10446 _values!506) (store mapRest!15093 mapKey!15093 mapValue!15093))))

(assert (= (and start!37230 res!213028) b!376743))

(assert (= (and b!376743 res!213027) b!376747))

(assert (= (and b!376747 res!213034) b!376755))

(assert (= (and b!376755 res!213024) b!376748))

(assert (= (and b!376748 res!213032) b!376742))

(assert (= (and b!376742 res!213029) b!376745))

(assert (= (and b!376745 res!213031) b!376751))

(assert (= (and b!376751 res!213026) b!376756))

(assert (= (and b!376756 res!213033) b!376753))

(assert (= (and b!376753 res!213035) b!376749))

(assert (= (and b!376749 (not res!213030)) b!376754))

(assert (= (and b!376754 (not res!213025)) b!376746))

(assert (= (and b!376744 condMapEmpty!15093) mapIsEmpty!15093))

(assert (= (and b!376744 (not condMapEmpty!15093)) mapNonEmpty!15093))

(get-info :version)

(assert (= (and mapNonEmpty!15093 ((_ is ValueCellFull!4166) mapValue!15093)) b!376752))

(assert (= (and b!376744 ((_ is ValueCellFull!4166) mapDefault!15093)) b!376750))

(assert (= start!37230 b!376744))

(declare-fun m!373745 () Bool)

(assert (=> b!376756 m!373745))

(declare-fun m!373747 () Bool)

(assert (=> b!376756 m!373747))

(declare-fun m!373749 () Bool)

(assert (=> b!376745 m!373749))

(declare-fun m!373751 () Bool)

(assert (=> b!376751 m!373751))

(declare-fun m!373753 () Bool)

(assert (=> start!37230 m!373753))

(declare-fun m!373755 () Bool)

(assert (=> start!37230 m!373755))

(declare-fun m!373757 () Bool)

(assert (=> start!37230 m!373757))

(declare-fun m!373759 () Bool)

(assert (=> b!376747 m!373759))

(declare-fun m!373761 () Bool)

(assert (=> b!376753 m!373761))

(declare-fun m!373763 () Bool)

(assert (=> b!376749 m!373763))

(declare-fun m!373765 () Bool)

(assert (=> b!376749 m!373765))

(declare-fun m!373767 () Bool)

(assert (=> b!376749 m!373767))

(declare-fun m!373769 () Bool)

(assert (=> b!376749 m!373769))

(declare-fun m!373771 () Bool)

(assert (=> b!376749 m!373771))

(declare-fun m!373773 () Bool)

(assert (=> b!376749 m!373773))

(declare-fun m!373775 () Bool)

(assert (=> b!376749 m!373775))

(declare-fun m!373777 () Bool)

(assert (=> b!376746 m!373777))

(declare-fun m!373779 () Bool)

(assert (=> b!376746 m!373779))

(declare-fun m!373781 () Bool)

(assert (=> b!376755 m!373781))

(declare-fun m!373783 () Bool)

(assert (=> mapNonEmpty!15093 m!373783))

(declare-fun m!373785 () Bool)

(assert (=> b!376754 m!373785))

(declare-fun m!373787 () Bool)

(assert (=> b!376754 m!373787))

(declare-fun m!373789 () Bool)

(assert (=> b!376754 m!373789))

(declare-fun m!373791 () Bool)

(assert (=> b!376742 m!373791))

(check-sat (not b!376754) (not b!376751) (not b!376742) tp_is_empty!9019 (not b!376755) (not b_next!8371) (not b!376747) (not start!37230) (not b!376756) b_and!15627 (not b!376746) (not b!376749) (not b!376753) (not mapNonEmpty!15093))
(check-sat b_and!15627 (not b_next!8371))
