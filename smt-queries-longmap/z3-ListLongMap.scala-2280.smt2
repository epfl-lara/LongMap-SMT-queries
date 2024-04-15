; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37128 () Bool)

(assert start!37128)

(declare-fun b_free!8269 () Bool)

(declare-fun b_next!8269 () Bool)

(assert (=> start!37128 (= b_free!8269 (not b_next!8269))))

(declare-fun tp!29523 () Bool)

(declare-fun b_and!15485 () Bool)

(assert (=> start!37128 (= tp!29523 b_and!15485)))

(declare-fun mapNonEmpty!14940 () Bool)

(declare-fun mapRes!14940 () Bool)

(declare-fun tp!29522 () Bool)

(declare-fun e!228053 () Bool)

(assert (=> mapNonEmpty!14940 (= mapRes!14940 (and tp!29522 e!228053))))

(declare-datatypes ((V!12995 0))(
  ( (V!12996 (val!4503 Int)) )
))
(declare-datatypes ((ValueCell!4115 0))(
  ( (ValueCellFull!4115 (v!6694 V!12995)) (EmptyCell!4115) )
))
(declare-fun mapRest!14940 () (Array (_ BitVec 32) ValueCell!4115))

(declare-datatypes ((array!21751 0))(
  ( (array!21752 (arr!10344 (Array (_ BitVec 32) ValueCell!4115)) (size!10697 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21751)

(declare-fun mapValue!14940 () ValueCell!4115)

(declare-fun mapKey!14940 () (_ BitVec 32))

(assert (=> mapNonEmpty!14940 (= (arr!10344 _values!506) (store mapRest!14940 mapKey!14940 mapValue!14940))))

(declare-fun b!374217 () Bool)

(declare-fun res!211053 () Bool)

(declare-fun e!228056 () Bool)

(assert (=> b!374217 (=> (not res!211053) (not e!228056))))

(declare-datatypes ((array!21753 0))(
  ( (array!21754 (arr!10345 (Array (_ BitVec 32) (_ BitVec 64))) (size!10698 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21753)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374217 (= res!211053 (and (= (size!10697 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10698 _keys!658) (size!10697 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374218 () Bool)

(declare-fun res!211054 () Bool)

(assert (=> b!374218 (=> (not res!211054) (not e!228056))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374218 (= res!211054 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10698 _keys!658))))))

(declare-fun b!374219 () Bool)

(declare-fun e!228050 () Bool)

(declare-fun e!228049 () Bool)

(assert (=> b!374219 (= e!228050 (not e!228049))))

(declare-fun res!211061 () Bool)

(assert (=> b!374219 (=> res!211061 e!228049)))

(assert (=> b!374219 (= res!211061 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12995)

(declare-datatypes ((tuple2!5956 0))(
  ( (tuple2!5957 (_1!2989 (_ BitVec 64)) (_2!2989 V!12995)) )
))
(declare-datatypes ((List!5789 0))(
  ( (Nil!5786) (Cons!5785 (h!6641 tuple2!5956) (t!10930 List!5789)) )
))
(declare-datatypes ((ListLongMap!4859 0))(
  ( (ListLongMap!4860 (toList!2445 List!5789)) )
))
(declare-fun lt!172435 () ListLongMap!4859)

(declare-fun minValue!472 () V!12995)

(declare-fun getCurrentListMap!1864 (array!21753 array!21751 (_ BitVec 32) (_ BitVec 32) V!12995 V!12995 (_ BitVec 32) Int) ListLongMap!4859)

(assert (=> b!374219 (= lt!172435 (getCurrentListMap!1864 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172439 () array!21753)

(declare-fun lt!172434 () array!21751)

(declare-fun lt!172431 () ListLongMap!4859)

(assert (=> b!374219 (= lt!172431 (getCurrentListMap!1864 lt!172439 lt!172434 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172441 () ListLongMap!4859)

(declare-fun lt!172444 () ListLongMap!4859)

(assert (=> b!374219 (and (= lt!172441 lt!172444) (= lt!172444 lt!172441))))

(declare-fun lt!172440 () ListLongMap!4859)

(declare-fun lt!172438 () tuple2!5956)

(declare-fun +!813 (ListLongMap!4859 tuple2!5956) ListLongMap!4859)

(assert (=> b!374219 (= lt!172444 (+!813 lt!172440 lt!172438))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!12995)

(assert (=> b!374219 (= lt!172438 (tuple2!5957 k0!778 v!373))))

(declare-datatypes ((Unit!11498 0))(
  ( (Unit!11499) )
))
(declare-fun lt!172443 () Unit!11498)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!57 (array!21753 array!21751 (_ BitVec 32) (_ BitVec 32) V!12995 V!12995 (_ BitVec 32) (_ BitVec 64) V!12995 (_ BitVec 32) Int) Unit!11498)

(assert (=> b!374219 (= lt!172443 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!57 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!729 (array!21753 array!21751 (_ BitVec 32) (_ BitVec 32) V!12995 V!12995 (_ BitVec 32) Int) ListLongMap!4859)

(assert (=> b!374219 (= lt!172441 (getCurrentListMapNoExtraKeys!729 lt!172439 lt!172434 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374219 (= lt!172434 (array!21752 (store (arr!10344 _values!506) i!548 (ValueCellFull!4115 v!373)) (size!10697 _values!506)))))

(assert (=> b!374219 (= lt!172440 (getCurrentListMapNoExtraKeys!729 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374220 () Bool)

(declare-fun tp_is_empty!8917 () Bool)

(assert (=> b!374220 (= e!228053 tp_is_empty!8917)))

(declare-fun b!374221 () Bool)

(declare-fun e!228055 () Bool)

(assert (=> b!374221 (= e!228055 true)))

(declare-fun lt!172445 () ListLongMap!4859)

(declare-fun lt!172437 () tuple2!5956)

(declare-fun lt!172442 () ListLongMap!4859)

(assert (=> b!374221 (= (+!813 lt!172442 lt!172437) (+!813 lt!172445 lt!172438))))

(declare-fun lt!172446 () ListLongMap!4859)

(declare-fun lt!172436 () Unit!11498)

(declare-fun addCommutativeForDiffKeys!229 (ListLongMap!4859 (_ BitVec 64) V!12995 (_ BitVec 64) V!12995) Unit!11498)

(assert (=> b!374221 (= lt!172436 (addCommutativeForDiffKeys!229 lt!172446 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374222 () Bool)

(assert (=> b!374222 (= e!228056 e!228050)))

(declare-fun res!211062 () Bool)

(assert (=> b!374222 (=> (not res!211062) (not e!228050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21753 (_ BitVec 32)) Bool)

(assert (=> b!374222 (= res!211062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172439 mask!970))))

(assert (=> b!374222 (= lt!172439 (array!21754 (store (arr!10345 _keys!658) i!548 k0!778) (size!10698 _keys!658)))))

(declare-fun mapIsEmpty!14940 () Bool)

(assert (=> mapIsEmpty!14940 mapRes!14940))

(declare-fun b!374223 () Bool)

(declare-fun res!211057 () Bool)

(assert (=> b!374223 (=> (not res!211057) (not e!228056))))

(declare-fun arrayContainsKey!0 (array!21753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374223 (= res!211057 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374216 () Bool)

(declare-fun e!228051 () Bool)

(declare-fun e!228054 () Bool)

(assert (=> b!374216 (= e!228051 (and e!228054 mapRes!14940))))

(declare-fun condMapEmpty!14940 () Bool)

(declare-fun mapDefault!14940 () ValueCell!4115)

(assert (=> b!374216 (= condMapEmpty!14940 (= (arr!10344 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4115)) mapDefault!14940)))))

(declare-fun res!211056 () Bool)

(assert (=> start!37128 (=> (not res!211056) (not e!228056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37128 (= res!211056 (validMask!0 mask!970))))

(assert (=> start!37128 e!228056))

(declare-fun array_inv!7630 (array!21751) Bool)

(assert (=> start!37128 (and (array_inv!7630 _values!506) e!228051)))

(assert (=> start!37128 tp!29523))

(assert (=> start!37128 true))

(assert (=> start!37128 tp_is_empty!8917))

(declare-fun array_inv!7631 (array!21753) Bool)

(assert (=> start!37128 (array_inv!7631 _keys!658)))

(declare-fun b!374224 () Bool)

(declare-fun res!211063 () Bool)

(assert (=> b!374224 (=> (not res!211063) (not e!228056))))

(declare-datatypes ((List!5790 0))(
  ( (Nil!5787) (Cons!5786 (h!6642 (_ BitVec 64)) (t!10931 List!5790)) )
))
(declare-fun arrayNoDuplicates!0 (array!21753 (_ BitVec 32) List!5790) Bool)

(assert (=> b!374224 (= res!211063 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5787))))

(declare-fun b!374225 () Bool)

(declare-fun res!211055 () Bool)

(assert (=> b!374225 (=> (not res!211055) (not e!228056))))

(assert (=> b!374225 (= res!211055 (or (= (select (arr!10345 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10345 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374226 () Bool)

(declare-fun res!211060 () Bool)

(assert (=> b!374226 (=> (not res!211060) (not e!228056))))

(assert (=> b!374226 (= res!211060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374227 () Bool)

(declare-fun res!211058 () Bool)

(assert (=> b!374227 (=> (not res!211058) (not e!228056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374227 (= res!211058 (validKeyInArray!0 k0!778))))

(declare-fun b!374228 () Bool)

(declare-fun res!211059 () Bool)

(assert (=> b!374228 (=> (not res!211059) (not e!228050))))

(assert (=> b!374228 (= res!211059 (arrayNoDuplicates!0 lt!172439 #b00000000000000000000000000000000 Nil!5787))))

(declare-fun b!374229 () Bool)

(assert (=> b!374229 (= e!228054 tp_is_empty!8917)))

(declare-fun b!374230 () Bool)

(assert (=> b!374230 (= e!228049 e!228055)))

(declare-fun res!211064 () Bool)

(assert (=> b!374230 (=> res!211064 e!228055)))

(assert (=> b!374230 (= res!211064 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172432 () ListLongMap!4859)

(assert (=> b!374230 (= lt!172432 lt!172442)))

(assert (=> b!374230 (= lt!172442 (+!813 lt!172446 lt!172438))))

(declare-fun lt!172433 () Unit!11498)

(assert (=> b!374230 (= lt!172433 (addCommutativeForDiffKeys!229 lt!172440 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!374230 (= lt!172431 (+!813 lt!172432 lt!172437))))

(declare-fun lt!172430 () tuple2!5956)

(assert (=> b!374230 (= lt!172432 (+!813 lt!172444 lt!172430))))

(assert (=> b!374230 (= lt!172435 lt!172445)))

(assert (=> b!374230 (= lt!172445 (+!813 lt!172446 lt!172437))))

(assert (=> b!374230 (= lt!172446 (+!813 lt!172440 lt!172430))))

(assert (=> b!374230 (= lt!172431 (+!813 (+!813 lt!172441 lt!172430) lt!172437))))

(assert (=> b!374230 (= lt!172437 (tuple2!5957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374230 (= lt!172430 (tuple2!5957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37128 res!211056) b!374217))

(assert (= (and b!374217 res!211053) b!374226))

(assert (= (and b!374226 res!211060) b!374224))

(assert (= (and b!374224 res!211063) b!374218))

(assert (= (and b!374218 res!211054) b!374227))

(assert (= (and b!374227 res!211058) b!374225))

(assert (= (and b!374225 res!211055) b!374223))

(assert (= (and b!374223 res!211057) b!374222))

(assert (= (and b!374222 res!211062) b!374228))

(assert (= (and b!374228 res!211059) b!374219))

(assert (= (and b!374219 (not res!211061)) b!374230))

(assert (= (and b!374230 (not res!211064)) b!374221))

(assert (= (and b!374216 condMapEmpty!14940) mapIsEmpty!14940))

(assert (= (and b!374216 (not condMapEmpty!14940)) mapNonEmpty!14940))

(get-info :version)

(assert (= (and mapNonEmpty!14940 ((_ is ValueCellFull!4115) mapValue!14940)) b!374220))

(assert (= (and b!374216 ((_ is ValueCellFull!4115) mapDefault!14940)) b!374229))

(assert (= start!37128 b!374216))

(declare-fun m!370031 () Bool)

(assert (=> b!374223 m!370031))

(declare-fun m!370033 () Bool)

(assert (=> b!374221 m!370033))

(declare-fun m!370035 () Bool)

(assert (=> b!374221 m!370035))

(declare-fun m!370037 () Bool)

(assert (=> b!374221 m!370037))

(declare-fun m!370039 () Bool)

(assert (=> b!374225 m!370039))

(declare-fun m!370041 () Bool)

(assert (=> b!374228 m!370041))

(declare-fun m!370043 () Bool)

(assert (=> b!374230 m!370043))

(declare-fun m!370045 () Bool)

(assert (=> b!374230 m!370045))

(declare-fun m!370047 () Bool)

(assert (=> b!374230 m!370047))

(declare-fun m!370049 () Bool)

(assert (=> b!374230 m!370049))

(declare-fun m!370051 () Bool)

(assert (=> b!374230 m!370051))

(declare-fun m!370053 () Bool)

(assert (=> b!374230 m!370053))

(assert (=> b!374230 m!370051))

(declare-fun m!370055 () Bool)

(assert (=> b!374230 m!370055))

(declare-fun m!370057 () Bool)

(assert (=> b!374230 m!370057))

(declare-fun m!370059 () Bool)

(assert (=> mapNonEmpty!14940 m!370059))

(declare-fun m!370061 () Bool)

(assert (=> start!37128 m!370061))

(declare-fun m!370063 () Bool)

(assert (=> start!37128 m!370063))

(declare-fun m!370065 () Bool)

(assert (=> start!37128 m!370065))

(declare-fun m!370067 () Bool)

(assert (=> b!374226 m!370067))

(declare-fun m!370069 () Bool)

(assert (=> b!374227 m!370069))

(declare-fun m!370071 () Bool)

(assert (=> b!374222 m!370071))

(declare-fun m!370073 () Bool)

(assert (=> b!374222 m!370073))

(declare-fun m!370075 () Bool)

(assert (=> b!374219 m!370075))

(declare-fun m!370077 () Bool)

(assert (=> b!374219 m!370077))

(declare-fun m!370079 () Bool)

(assert (=> b!374219 m!370079))

(declare-fun m!370081 () Bool)

(assert (=> b!374219 m!370081))

(declare-fun m!370083 () Bool)

(assert (=> b!374219 m!370083))

(declare-fun m!370085 () Bool)

(assert (=> b!374219 m!370085))

(declare-fun m!370087 () Bool)

(assert (=> b!374219 m!370087))

(declare-fun m!370089 () Bool)

(assert (=> b!374224 m!370089))

(check-sat b_and!15485 (not b!374224) (not b!374226) (not b!374221) (not start!37128) (not b!374219) (not b_next!8269) (not b!374230) tp_is_empty!8917 (not b!374222) (not b!374227) (not b!374228) (not b!374223) (not mapNonEmpty!14940))
(check-sat b_and!15485 (not b_next!8269))
