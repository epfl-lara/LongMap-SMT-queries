; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40948 () Bool)

(assert start!40948)

(declare-fun b_free!10897 () Bool)

(declare-fun b_next!10897 () Bool)

(assert (=> start!40948 (= b_free!10897 (not b_next!10897))))

(declare-fun tp!38517 () Bool)

(declare-fun b_and!19049 () Bool)

(assert (=> start!40948 (= tp!38517 b_and!19049)))

(declare-fun b!455746 () Bool)

(declare-fun res!271862 () Bool)

(declare-fun e!266388 () Bool)

(assert (=> b!455746 (=> (not res!271862) (not e!266388))))

(declare-datatypes ((array!28264 0))(
  ( (array!28265 (arr!13575 (Array (_ BitVec 32) (_ BitVec 64))) (size!13927 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28264)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28264 (_ BitVec 32)) Bool)

(assert (=> b!455746 (= res!271862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455747 () Bool)

(declare-fun e!266391 () Bool)

(declare-fun tp_is_empty!12235 () Bool)

(assert (=> b!455747 (= e!266391 tp_is_empty!12235)))

(declare-fun b!455749 () Bool)

(declare-fun e!266390 () Bool)

(assert (=> b!455749 (= e!266390 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17419 0))(
  ( (V!17420 (val!6162 Int)) )
))
(declare-fun minValue!515 () V!17419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5774 0))(
  ( (ValueCellFull!5774 (v!8429 V!17419)) (EmptyCell!5774) )
))
(declare-datatypes ((array!28266 0))(
  ( (array!28267 (arr!13576 (Array (_ BitVec 32) ValueCell!5774)) (size!13928 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28266)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!206421 () array!28264)

(declare-datatypes ((tuple2!8028 0))(
  ( (tuple2!8029 (_1!4025 (_ BitVec 64)) (_2!4025 V!17419)) )
))
(declare-datatypes ((List!8099 0))(
  ( (Nil!8096) (Cons!8095 (h!8951 tuple2!8028) (t!13919 List!8099)) )
))
(declare-datatypes ((ListLongMap!6943 0))(
  ( (ListLongMap!6944 (toList!3487 List!8099)) )
))
(declare-fun lt!206423 () ListLongMap!6943)

(declare-fun v!412 () V!17419)

(declare-fun zeroValue!515 () V!17419)

(declare-fun getCurrentListMapNoExtraKeys!1716 (array!28264 array!28266 (_ BitVec 32) (_ BitVec 32) V!17419 V!17419 (_ BitVec 32) Int) ListLongMap!6943)

(assert (=> b!455749 (= lt!206423 (getCurrentListMapNoExtraKeys!1716 lt!206421 (array!28267 (store (arr!13576 _values!549) i!563 (ValueCellFull!5774 v!412)) (size!13928 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206422 () ListLongMap!6943)

(assert (=> b!455749 (= lt!206422 (getCurrentListMapNoExtraKeys!1716 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455750 () Bool)

(declare-fun res!271854 () Bool)

(assert (=> b!455750 (=> (not res!271854) (not e!266388))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455750 (= res!271854 (validKeyInArray!0 k0!794))))

(declare-fun b!455751 () Bool)

(declare-fun res!271855 () Bool)

(assert (=> b!455751 (=> (not res!271855) (not e!266388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455751 (= res!271855 (validMask!0 mask!1025))))

(declare-fun b!455752 () Bool)

(declare-fun res!271861 () Bool)

(assert (=> b!455752 (=> (not res!271861) (not e!266388))))

(declare-fun arrayContainsKey!0 (array!28264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455752 (= res!271861 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455753 () Bool)

(assert (=> b!455753 (= e!266388 e!266390)))

(declare-fun res!271863 () Bool)

(assert (=> b!455753 (=> (not res!271863) (not e!266390))))

(assert (=> b!455753 (= res!271863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206421 mask!1025))))

(assert (=> b!455753 (= lt!206421 (array!28265 (store (arr!13575 _keys!709) i!563 k0!794) (size!13927 _keys!709)))))

(declare-fun b!455754 () Bool)

(declare-fun res!271860 () Bool)

(assert (=> b!455754 (=> (not res!271860) (not e!266388))))

(declare-datatypes ((List!8100 0))(
  ( (Nil!8097) (Cons!8096 (h!8952 (_ BitVec 64)) (t!13920 List!8100)) )
))
(declare-fun arrayNoDuplicates!0 (array!28264 (_ BitVec 32) List!8100) Bool)

(assert (=> b!455754 (= res!271860 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8097))))

(declare-fun mapNonEmpty!19993 () Bool)

(declare-fun mapRes!19993 () Bool)

(declare-fun tp!38518 () Bool)

(declare-fun e!266387 () Bool)

(assert (=> mapNonEmpty!19993 (= mapRes!19993 (and tp!38518 e!266387))))

(declare-fun mapValue!19993 () ValueCell!5774)

(declare-fun mapRest!19993 () (Array (_ BitVec 32) ValueCell!5774))

(declare-fun mapKey!19993 () (_ BitVec 32))

(assert (=> mapNonEmpty!19993 (= (arr!13576 _values!549) (store mapRest!19993 mapKey!19993 mapValue!19993))))

(declare-fun b!455755 () Bool)

(assert (=> b!455755 (= e!266387 tp_is_empty!12235)))

(declare-fun b!455756 () Bool)

(declare-fun e!266392 () Bool)

(assert (=> b!455756 (= e!266392 (and e!266391 mapRes!19993))))

(declare-fun condMapEmpty!19993 () Bool)

(declare-fun mapDefault!19993 () ValueCell!5774)

(assert (=> b!455756 (= condMapEmpty!19993 (= (arr!13576 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5774)) mapDefault!19993)))))

(declare-fun b!455757 () Bool)

(declare-fun res!271858 () Bool)

(assert (=> b!455757 (=> (not res!271858) (not e!266390))))

(assert (=> b!455757 (= res!271858 (arrayNoDuplicates!0 lt!206421 #b00000000000000000000000000000000 Nil!8097))))

(declare-fun b!455758 () Bool)

(declare-fun res!271864 () Bool)

(assert (=> b!455758 (=> (not res!271864) (not e!266388))))

(assert (=> b!455758 (= res!271864 (or (= (select (arr!13575 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13575 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19993 () Bool)

(assert (=> mapIsEmpty!19993 mapRes!19993))

(declare-fun res!271853 () Bool)

(assert (=> start!40948 (=> (not res!271853) (not e!266388))))

(assert (=> start!40948 (= res!271853 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13927 _keys!709))))))

(assert (=> start!40948 e!266388))

(assert (=> start!40948 tp_is_empty!12235))

(assert (=> start!40948 tp!38517))

(assert (=> start!40948 true))

(declare-fun array_inv!9908 (array!28266) Bool)

(assert (=> start!40948 (and (array_inv!9908 _values!549) e!266392)))

(declare-fun array_inv!9909 (array!28264) Bool)

(assert (=> start!40948 (array_inv!9909 _keys!709)))

(declare-fun b!455748 () Bool)

(declare-fun res!271857 () Bool)

(assert (=> b!455748 (=> (not res!271857) (not e!266388))))

(assert (=> b!455748 (= res!271857 (and (= (size!13928 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13927 _keys!709) (size!13928 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455759 () Bool)

(declare-fun res!271856 () Bool)

(assert (=> b!455759 (=> (not res!271856) (not e!266390))))

(assert (=> b!455759 (= res!271856 (bvsle from!863 i!563))))

(declare-fun b!455760 () Bool)

(declare-fun res!271859 () Bool)

(assert (=> b!455760 (=> (not res!271859) (not e!266388))))

(assert (=> b!455760 (= res!271859 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13927 _keys!709))))))

(assert (= (and start!40948 res!271853) b!455751))

(assert (= (and b!455751 res!271855) b!455748))

(assert (= (and b!455748 res!271857) b!455746))

(assert (= (and b!455746 res!271862) b!455754))

(assert (= (and b!455754 res!271860) b!455760))

(assert (= (and b!455760 res!271859) b!455750))

(assert (= (and b!455750 res!271854) b!455758))

(assert (= (and b!455758 res!271864) b!455752))

(assert (= (and b!455752 res!271861) b!455753))

(assert (= (and b!455753 res!271863) b!455757))

(assert (= (and b!455757 res!271858) b!455759))

(assert (= (and b!455759 res!271856) b!455749))

(assert (= (and b!455756 condMapEmpty!19993) mapIsEmpty!19993))

(assert (= (and b!455756 (not condMapEmpty!19993)) mapNonEmpty!19993))

(get-info :version)

(assert (= (and mapNonEmpty!19993 ((_ is ValueCellFull!5774) mapValue!19993)) b!455755))

(assert (= (and b!455756 ((_ is ValueCellFull!5774) mapDefault!19993)) b!455747))

(assert (= start!40948 b!455756))

(declare-fun m!439653 () Bool)

(assert (=> b!455751 m!439653))

(declare-fun m!439655 () Bool)

(assert (=> b!455757 m!439655))

(declare-fun m!439657 () Bool)

(assert (=> b!455752 m!439657))

(declare-fun m!439659 () Bool)

(assert (=> b!455753 m!439659))

(declare-fun m!439661 () Bool)

(assert (=> b!455753 m!439661))

(declare-fun m!439663 () Bool)

(assert (=> start!40948 m!439663))

(declare-fun m!439665 () Bool)

(assert (=> start!40948 m!439665))

(declare-fun m!439667 () Bool)

(assert (=> b!455754 m!439667))

(declare-fun m!439669 () Bool)

(assert (=> b!455746 m!439669))

(declare-fun m!439671 () Bool)

(assert (=> b!455758 m!439671))

(declare-fun m!439673 () Bool)

(assert (=> b!455750 m!439673))

(declare-fun m!439675 () Bool)

(assert (=> mapNonEmpty!19993 m!439675))

(declare-fun m!439677 () Bool)

(assert (=> b!455749 m!439677))

(declare-fun m!439679 () Bool)

(assert (=> b!455749 m!439679))

(declare-fun m!439681 () Bool)

(assert (=> b!455749 m!439681))

(check-sat (not b!455750) (not b!455757) b_and!19049 (not b!455749) (not b_next!10897) (not b!455751) (not b!455752) (not b!455753) (not mapNonEmpty!19993) (not b!455746) (not start!40948) (not b!455754) tp_is_empty!12235)
(check-sat b_and!19049 (not b_next!10897))
