; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37156 () Bool)

(assert start!37156)

(declare-fun b_free!8283 () Bool)

(declare-fun b_next!8283 () Bool)

(assert (=> start!37156 (= b_free!8283 (not b_next!8283))))

(declare-fun tp!29564 () Bool)

(declare-fun b_and!15525 () Bool)

(assert (=> start!37156 (= tp!29564 b_and!15525)))

(declare-fun b!374802 () Bool)

(declare-fun res!211443 () Bool)

(declare-fun e!228394 () Bool)

(assert (=> b!374802 (=> (not res!211443) (not e!228394))))

(declare-datatypes ((array!21801 0))(
  ( (array!21802 (arr!10369 (Array (_ BitVec 32) (_ BitVec 64))) (size!10721 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21801)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21801 (_ BitVec 32)) Bool)

(assert (=> b!374802 (= res!211443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374803 () Bool)

(declare-fun res!211434 () Bool)

(assert (=> b!374803 (=> (not res!211434) (not e!228394))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374803 (= res!211434 (validKeyInArray!0 k0!778))))

(declare-fun b!374804 () Bool)

(declare-fun e!228392 () Bool)

(assert (=> b!374804 (= e!228394 e!228392)))

(declare-fun res!211437 () Bool)

(assert (=> b!374804 (=> (not res!211437) (not e!228392))))

(declare-fun lt!173027 () array!21801)

(assert (=> b!374804 (= res!211437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173027 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374804 (= lt!173027 (array!21802 (store (arr!10369 _keys!658) i!548 k0!778) (size!10721 _keys!658)))))

(declare-fun b!374805 () Bool)

(declare-fun res!211439 () Bool)

(assert (=> b!374805 (=> (not res!211439) (not e!228394))))

(declare-fun arrayContainsKey!0 (array!21801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374805 (= res!211439 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374806 () Bool)

(declare-fun e!228395 () Bool)

(assert (=> b!374806 (= e!228392 (not e!228395))))

(declare-fun res!211440 () Bool)

(assert (=> b!374806 (=> res!211440 e!228395)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374806 (= res!211440 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13013 0))(
  ( (V!13014 (val!4510 Int)) )
))
(declare-datatypes ((ValueCell!4122 0))(
  ( (ValueCellFull!4122 (v!6707 V!13013)) (EmptyCell!4122) )
))
(declare-datatypes ((array!21803 0))(
  ( (array!21804 (arr!10370 (Array (_ BitVec 32) ValueCell!4122)) (size!10722 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21803)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6000 0))(
  ( (tuple2!6001 (_1!3011 (_ BitVec 64)) (_2!3011 V!13013)) )
))
(declare-datatypes ((List!5844 0))(
  ( (Nil!5841) (Cons!5840 (h!6696 tuple2!6000) (t!10994 List!5844)) )
))
(declare-datatypes ((ListLongMap!4913 0))(
  ( (ListLongMap!4914 (toList!2472 List!5844)) )
))
(declare-fun lt!173029 () ListLongMap!4913)

(declare-fun zeroValue!472 () V!13013)

(declare-fun minValue!472 () V!13013)

(declare-fun getCurrentListMap!1909 (array!21801 array!21803 (_ BitVec 32) (_ BitVec 32) V!13013 V!13013 (_ BitVec 32) Int) ListLongMap!4913)

(assert (=> b!374806 (= lt!173029 (getCurrentListMap!1909 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173036 () array!21803)

(declare-fun lt!173025 () ListLongMap!4913)

(assert (=> b!374806 (= lt!173025 (getCurrentListMap!1909 lt!173027 lt!173036 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173028 () ListLongMap!4913)

(declare-fun lt!173037 () ListLongMap!4913)

(assert (=> b!374806 (and (= lt!173028 lt!173037) (= lt!173037 lt!173028))))

(declare-fun lt!173021 () ListLongMap!4913)

(declare-fun lt!173026 () tuple2!6000)

(declare-fun +!818 (ListLongMap!4913 tuple2!6000) ListLongMap!4913)

(assert (=> b!374806 (= lt!173037 (+!818 lt!173021 lt!173026))))

(declare-fun v!373 () V!13013)

(assert (=> b!374806 (= lt!173026 (tuple2!6001 k0!778 v!373))))

(declare-datatypes ((Unit!11542 0))(
  ( (Unit!11543) )
))
(declare-fun lt!173033 () Unit!11542)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!67 (array!21801 array!21803 (_ BitVec 32) (_ BitVec 32) V!13013 V!13013 (_ BitVec 32) (_ BitVec 64) V!13013 (_ BitVec 32) Int) Unit!11542)

(assert (=> b!374806 (= lt!173033 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!67 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!743 (array!21801 array!21803 (_ BitVec 32) (_ BitVec 32) V!13013 V!13013 (_ BitVec 32) Int) ListLongMap!4913)

(assert (=> b!374806 (= lt!173028 (getCurrentListMapNoExtraKeys!743 lt!173027 lt!173036 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374806 (= lt!173036 (array!21804 (store (arr!10370 _values!506) i!548 (ValueCellFull!4122 v!373)) (size!10722 _values!506)))))

(assert (=> b!374806 (= lt!173021 (getCurrentListMapNoExtraKeys!743 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374807 () Bool)

(declare-fun res!211441 () Bool)

(assert (=> b!374807 (=> (not res!211441) (not e!228394))))

(declare-datatypes ((List!5845 0))(
  ( (Nil!5842) (Cons!5841 (h!6697 (_ BitVec 64)) (t!10995 List!5845)) )
))
(declare-fun arrayNoDuplicates!0 (array!21801 (_ BitVec 32) List!5845) Bool)

(assert (=> b!374807 (= res!211441 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5842))))

(declare-fun b!374808 () Bool)

(declare-fun e!228393 () Bool)

(declare-fun tp_is_empty!8931 () Bool)

(assert (=> b!374808 (= e!228393 tp_is_empty!8931)))

(declare-fun b!374809 () Bool)

(declare-fun e!228391 () Bool)

(assert (=> b!374809 (= e!228395 e!228391)))

(declare-fun res!211442 () Bool)

(assert (=> b!374809 (=> res!211442 e!228391)))

(assert (=> b!374809 (= res!211442 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173035 () ListLongMap!4913)

(declare-fun lt!173022 () ListLongMap!4913)

(assert (=> b!374809 (= lt!173035 lt!173022)))

(declare-fun lt!173030 () ListLongMap!4913)

(assert (=> b!374809 (= lt!173022 (+!818 lt!173030 lt!173026))))

(declare-fun lt!173023 () Unit!11542)

(declare-fun addCommutativeForDiffKeys!240 (ListLongMap!4913 (_ BitVec 64) V!13013 (_ BitVec 64) V!13013) Unit!11542)

(assert (=> b!374809 (= lt!173023 (addCommutativeForDiffKeys!240 lt!173021 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173032 () tuple2!6000)

(assert (=> b!374809 (= lt!173025 (+!818 lt!173035 lt!173032))))

(declare-fun lt!173034 () tuple2!6000)

(assert (=> b!374809 (= lt!173035 (+!818 lt!173037 lt!173034))))

(declare-fun lt!173024 () ListLongMap!4913)

(assert (=> b!374809 (= lt!173029 lt!173024)))

(assert (=> b!374809 (= lt!173024 (+!818 lt!173030 lt!173032))))

(assert (=> b!374809 (= lt!173030 (+!818 lt!173021 lt!173034))))

(assert (=> b!374809 (= lt!173025 (+!818 (+!818 lt!173028 lt!173034) lt!173032))))

(assert (=> b!374809 (= lt!173032 (tuple2!6001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374809 (= lt!173034 (tuple2!6001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374810 () Bool)

(declare-fun res!211444 () Bool)

(assert (=> b!374810 (=> (not res!211444) (not e!228394))))

(assert (=> b!374810 (= res!211444 (and (= (size!10722 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10721 _keys!658) (size!10722 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374811 () Bool)

(declare-fun e!228397 () Bool)

(declare-fun e!228398 () Bool)

(declare-fun mapRes!14961 () Bool)

(assert (=> b!374811 (= e!228397 (and e!228398 mapRes!14961))))

(declare-fun condMapEmpty!14961 () Bool)

(declare-fun mapDefault!14961 () ValueCell!4122)

(assert (=> b!374811 (= condMapEmpty!14961 (= (arr!10370 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4122)) mapDefault!14961)))))

(declare-fun mapNonEmpty!14961 () Bool)

(declare-fun tp!29565 () Bool)

(assert (=> mapNonEmpty!14961 (= mapRes!14961 (and tp!29565 e!228393))))

(declare-fun mapRest!14961 () (Array (_ BitVec 32) ValueCell!4122))

(declare-fun mapValue!14961 () ValueCell!4122)

(declare-fun mapKey!14961 () (_ BitVec 32))

(assert (=> mapNonEmpty!14961 (= (arr!10370 _values!506) (store mapRest!14961 mapKey!14961 mapValue!14961))))

(declare-fun mapIsEmpty!14961 () Bool)

(assert (=> mapIsEmpty!14961 mapRes!14961))

(declare-fun b!374812 () Bool)

(assert (=> b!374812 (= e!228398 tp_is_empty!8931)))

(declare-fun res!211436 () Bool)

(assert (=> start!37156 (=> (not res!211436) (not e!228394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37156 (= res!211436 (validMask!0 mask!970))))

(assert (=> start!37156 e!228394))

(declare-fun array_inv!7648 (array!21803) Bool)

(assert (=> start!37156 (and (array_inv!7648 _values!506) e!228397)))

(assert (=> start!37156 tp!29564))

(assert (=> start!37156 true))

(assert (=> start!37156 tp_is_empty!8931))

(declare-fun array_inv!7649 (array!21801) Bool)

(assert (=> start!37156 (array_inv!7649 _keys!658)))

(declare-fun b!374813 () Bool)

(declare-fun res!211435 () Bool)

(assert (=> b!374813 (=> (not res!211435) (not e!228394))))

(assert (=> b!374813 (= res!211435 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10721 _keys!658))))))

(declare-fun b!374814 () Bool)

(declare-fun res!211445 () Bool)

(assert (=> b!374814 (=> (not res!211445) (not e!228392))))

(assert (=> b!374814 (= res!211445 (arrayNoDuplicates!0 lt!173027 #b00000000000000000000000000000000 Nil!5842))))

(declare-fun b!374815 () Bool)

(declare-fun res!211438 () Bool)

(assert (=> b!374815 (=> (not res!211438) (not e!228394))))

(assert (=> b!374815 (= res!211438 (or (= (select (arr!10369 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10369 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374816 () Bool)

(assert (=> b!374816 (= e!228391 true)))

(assert (=> b!374816 (= (+!818 lt!173022 lt!173032) (+!818 lt!173024 lt!173026))))

(declare-fun lt!173031 () Unit!11542)

(assert (=> b!374816 (= lt!173031 (addCommutativeForDiffKeys!240 lt!173030 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37156 res!211436) b!374810))

(assert (= (and b!374810 res!211444) b!374802))

(assert (= (and b!374802 res!211443) b!374807))

(assert (= (and b!374807 res!211441) b!374813))

(assert (= (and b!374813 res!211435) b!374803))

(assert (= (and b!374803 res!211434) b!374815))

(assert (= (and b!374815 res!211438) b!374805))

(assert (= (and b!374805 res!211439) b!374804))

(assert (= (and b!374804 res!211437) b!374814))

(assert (= (and b!374814 res!211445) b!374806))

(assert (= (and b!374806 (not res!211440)) b!374809))

(assert (= (and b!374809 (not res!211442)) b!374816))

(assert (= (and b!374811 condMapEmpty!14961) mapIsEmpty!14961))

(assert (= (and b!374811 (not condMapEmpty!14961)) mapNonEmpty!14961))

(get-info :version)

(assert (= (and mapNonEmpty!14961 ((_ is ValueCellFull!4122) mapValue!14961)) b!374808))

(assert (= (and b!374811 ((_ is ValueCellFull!4122) mapDefault!14961)) b!374812))

(assert (= start!37156 b!374811))

(declare-fun m!371175 () Bool)

(assert (=> b!374809 m!371175))

(declare-fun m!371177 () Bool)

(assert (=> b!374809 m!371177))

(declare-fun m!371179 () Bool)

(assert (=> b!374809 m!371179))

(declare-fun m!371181 () Bool)

(assert (=> b!374809 m!371181))

(declare-fun m!371183 () Bool)

(assert (=> b!374809 m!371183))

(declare-fun m!371185 () Bool)

(assert (=> b!374809 m!371185))

(declare-fun m!371187 () Bool)

(assert (=> b!374809 m!371187))

(assert (=> b!374809 m!371183))

(declare-fun m!371189 () Bool)

(assert (=> b!374809 m!371189))

(declare-fun m!371191 () Bool)

(assert (=> b!374816 m!371191))

(declare-fun m!371193 () Bool)

(assert (=> b!374816 m!371193))

(declare-fun m!371195 () Bool)

(assert (=> b!374816 m!371195))

(declare-fun m!371197 () Bool)

(assert (=> b!374815 m!371197))

(declare-fun m!371199 () Bool)

(assert (=> b!374805 m!371199))

(declare-fun m!371201 () Bool)

(assert (=> b!374814 m!371201))

(declare-fun m!371203 () Bool)

(assert (=> start!37156 m!371203))

(declare-fun m!371205 () Bool)

(assert (=> start!37156 m!371205))

(declare-fun m!371207 () Bool)

(assert (=> start!37156 m!371207))

(declare-fun m!371209 () Bool)

(assert (=> mapNonEmpty!14961 m!371209))

(declare-fun m!371211 () Bool)

(assert (=> b!374806 m!371211))

(declare-fun m!371213 () Bool)

(assert (=> b!374806 m!371213))

(declare-fun m!371215 () Bool)

(assert (=> b!374806 m!371215))

(declare-fun m!371217 () Bool)

(assert (=> b!374806 m!371217))

(declare-fun m!371219 () Bool)

(assert (=> b!374806 m!371219))

(declare-fun m!371221 () Bool)

(assert (=> b!374806 m!371221))

(declare-fun m!371223 () Bool)

(assert (=> b!374806 m!371223))

(declare-fun m!371225 () Bool)

(assert (=> b!374803 m!371225))

(declare-fun m!371227 () Bool)

(assert (=> b!374804 m!371227))

(declare-fun m!371229 () Bool)

(assert (=> b!374804 m!371229))

(declare-fun m!371231 () Bool)

(assert (=> b!374807 m!371231))

(declare-fun m!371233 () Bool)

(assert (=> b!374802 m!371233))

(check-sat tp_is_empty!8931 b_and!15525 (not b!374804) (not start!37156) (not mapNonEmpty!14961) (not b!374807) (not b!374803) (not b!374809) (not b!374805) (not b!374816) (not b!374814) (not b!374806) (not b_next!8283) (not b!374802))
(check-sat b_and!15525 (not b_next!8283))
