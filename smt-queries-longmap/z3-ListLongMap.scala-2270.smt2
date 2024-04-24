; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37068 () Bool)

(assert start!37068)

(declare-fun b_free!8209 () Bool)

(declare-fun b_next!8209 () Bool)

(assert (=> start!37068 (= b_free!8209 (not b_next!8209))))

(declare-fun tp!29343 () Bool)

(declare-fun b_and!15465 () Bool)

(assert (=> start!37068 (= tp!29343 b_and!15465)))

(declare-fun mapIsEmpty!14850 () Bool)

(declare-fun mapRes!14850 () Bool)

(assert (=> mapIsEmpty!14850 mapRes!14850))

(declare-fun b!373095 () Bool)

(declare-fun res!210108 () Bool)

(declare-fun e!227483 () Bool)

(assert (=> b!373095 (=> (not res!210108) (not e!227483))))

(declare-datatypes ((array!21636 0))(
  ( (array!21637 (arr!10286 (Array (_ BitVec 32) (_ BitVec 64))) (size!10638 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21636)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373095 (= res!210108 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373096 () Bool)

(declare-fun res!210112 () Bool)

(assert (=> b!373096 (=> (not res!210112) (not e!227483))))

(declare-datatypes ((List!5683 0))(
  ( (Nil!5680) (Cons!5679 (h!6535 (_ BitVec 64)) (t!10825 List!5683)) )
))
(declare-fun arrayNoDuplicates!0 (array!21636 (_ BitVec 32) List!5683) Bool)

(assert (=> b!373096 (= res!210112 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5680))))

(declare-fun res!210114 () Bool)

(assert (=> start!37068 (=> (not res!210114) (not e!227483))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37068 (= res!210114 (validMask!0 mask!970))))

(assert (=> start!37068 e!227483))

(declare-datatypes ((V!12915 0))(
  ( (V!12916 (val!4473 Int)) )
))
(declare-datatypes ((ValueCell!4085 0))(
  ( (ValueCellFull!4085 (v!6671 V!12915)) (EmptyCell!4085) )
))
(declare-datatypes ((array!21638 0))(
  ( (array!21639 (arr!10287 (Array (_ BitVec 32) ValueCell!4085)) (size!10639 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21638)

(declare-fun e!227480 () Bool)

(declare-fun array_inv!7634 (array!21638) Bool)

(assert (=> start!37068 (and (array_inv!7634 _values!506) e!227480)))

(assert (=> start!37068 tp!29343))

(assert (=> start!37068 true))

(declare-fun tp_is_empty!8857 () Bool)

(assert (=> start!37068 tp_is_empty!8857))

(declare-fun array_inv!7635 (array!21636) Bool)

(assert (=> start!37068 (array_inv!7635 _keys!658)))

(declare-fun b!373097 () Bool)

(declare-fun res!210109 () Bool)

(assert (=> b!373097 (=> (not res!210109) (not e!227483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373097 (= res!210109 (validKeyInArray!0 k0!778))))

(declare-fun b!373098 () Bool)

(declare-fun res!210111 () Bool)

(assert (=> b!373098 (=> (not res!210111) (not e!227483))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373098 (= res!210111 (or (= (select (arr!10286 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10286 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373099 () Bool)

(declare-fun e!227484 () Bool)

(assert (=> b!373099 (= e!227483 e!227484)))

(declare-fun res!210113 () Bool)

(assert (=> b!373099 (=> (not res!210113) (not e!227484))))

(declare-fun lt!171176 () array!21636)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21636 (_ BitVec 32)) Bool)

(assert (=> b!373099 (= res!210113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171176 mask!970))))

(assert (=> b!373099 (= lt!171176 (array!21637 (store (arr!10286 _keys!658) i!548 k0!778) (size!10638 _keys!658)))))

(declare-fun b!373100 () Bool)

(declare-fun res!210115 () Bool)

(assert (=> b!373100 (=> (not res!210115) (not e!227483))))

(assert (=> b!373100 (= res!210115 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10638 _keys!658))))))

(declare-fun mapNonEmpty!14850 () Bool)

(declare-fun tp!29342 () Bool)

(declare-fun e!227481 () Bool)

(assert (=> mapNonEmpty!14850 (= mapRes!14850 (and tp!29342 e!227481))))

(declare-fun mapKey!14850 () (_ BitVec 32))

(declare-fun mapRest!14850 () (Array (_ BitVec 32) ValueCell!4085))

(declare-fun mapValue!14850 () ValueCell!4085)

(assert (=> mapNonEmpty!14850 (= (arr!10287 _values!506) (store mapRest!14850 mapKey!14850 mapValue!14850))))

(declare-fun b!373101 () Bool)

(declare-fun e!227478 () Bool)

(assert (=> b!373101 (= e!227478 true)))

(declare-datatypes ((tuple2!5838 0))(
  ( (tuple2!5839 (_1!2930 (_ BitVec 64)) (_2!2930 V!12915)) )
))
(declare-datatypes ((List!5684 0))(
  ( (Nil!5681) (Cons!5680 (h!6536 tuple2!5838) (t!10826 List!5684)) )
))
(declare-datatypes ((ListLongMap!4753 0))(
  ( (ListLongMap!4754 (toList!2392 List!5684)) )
))
(declare-fun lt!171187 () ListLongMap!4753)

(declare-fun lt!171181 () ListLongMap!4753)

(declare-fun lt!171182 () tuple2!5838)

(declare-fun +!788 (ListLongMap!4753 tuple2!5838) ListLongMap!4753)

(assert (=> b!373101 (= lt!171187 (+!788 lt!171181 lt!171182))))

(declare-fun v!373 () V!12915)

(declare-fun lt!171177 () ListLongMap!4753)

(declare-fun zeroValue!472 () V!12915)

(declare-datatypes ((Unit!11465 0))(
  ( (Unit!11466) )
))
(declare-fun lt!171178 () Unit!11465)

(declare-fun addCommutativeForDiffKeys!217 (ListLongMap!4753 (_ BitVec 64) V!12915 (_ BitVec 64) V!12915) Unit!11465)

(assert (=> b!373101 (= lt!171178 (addCommutativeForDiffKeys!217 lt!171177 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171180 () ListLongMap!4753)

(declare-fun lt!171175 () tuple2!5838)

(assert (=> b!373101 (= lt!171180 (+!788 lt!171187 lt!171175))))

(declare-fun lt!171184 () ListLongMap!4753)

(declare-fun lt!171183 () tuple2!5838)

(assert (=> b!373101 (= lt!171187 (+!788 lt!171184 lt!171183))))

(declare-fun lt!171179 () ListLongMap!4753)

(assert (=> b!373101 (= lt!171179 (+!788 lt!171181 lt!171175))))

(assert (=> b!373101 (= lt!171181 (+!788 lt!171177 lt!171183))))

(declare-fun lt!171174 () ListLongMap!4753)

(assert (=> b!373101 (= lt!171180 (+!788 (+!788 lt!171174 lt!171183) lt!171175))))

(declare-fun minValue!472 () V!12915)

(assert (=> b!373101 (= lt!171175 (tuple2!5839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373101 (= lt!171183 (tuple2!5839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373102 () Bool)

(declare-fun res!210107 () Bool)

(assert (=> b!373102 (=> (not res!210107) (not e!227483))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373102 (= res!210107 (and (= (size!10639 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10638 _keys!658) (size!10639 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373103 () Bool)

(assert (=> b!373103 (= e!227481 tp_is_empty!8857)))

(declare-fun b!373104 () Bool)

(declare-fun res!210116 () Bool)

(assert (=> b!373104 (=> (not res!210116) (not e!227483))))

(assert (=> b!373104 (= res!210116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373105 () Bool)

(declare-fun e!227479 () Bool)

(assert (=> b!373105 (= e!227480 (and e!227479 mapRes!14850))))

(declare-fun condMapEmpty!14850 () Bool)

(declare-fun mapDefault!14850 () ValueCell!4085)

(assert (=> b!373105 (= condMapEmpty!14850 (= (arr!10287 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4085)) mapDefault!14850)))))

(declare-fun b!373106 () Bool)

(declare-fun res!210110 () Bool)

(assert (=> b!373106 (=> (not res!210110) (not e!227484))))

(assert (=> b!373106 (= res!210110 (arrayNoDuplicates!0 lt!171176 #b00000000000000000000000000000000 Nil!5680))))

(declare-fun b!373107 () Bool)

(assert (=> b!373107 (= e!227484 (not e!227478))))

(declare-fun res!210106 () Bool)

(assert (=> b!373107 (=> res!210106 e!227478)))

(assert (=> b!373107 (= res!210106 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1853 (array!21636 array!21638 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) Int) ListLongMap!4753)

(assert (=> b!373107 (= lt!171179 (getCurrentListMap!1853 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171186 () array!21638)

(assert (=> b!373107 (= lt!171180 (getCurrentListMap!1853 lt!171176 lt!171186 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373107 (and (= lt!171174 lt!171184) (= lt!171184 lt!171174))))

(assert (=> b!373107 (= lt!171184 (+!788 lt!171177 lt!171182))))

(assert (=> b!373107 (= lt!171182 (tuple2!5839 k0!778 v!373))))

(declare-fun lt!171185 () Unit!11465)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!40 (array!21636 array!21638 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) (_ BitVec 64) V!12915 (_ BitVec 32) Int) Unit!11465)

(assert (=> b!373107 (= lt!171185 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!40 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!700 (array!21636 array!21638 (_ BitVec 32) (_ BitVec 32) V!12915 V!12915 (_ BitVec 32) Int) ListLongMap!4753)

(assert (=> b!373107 (= lt!171174 (getCurrentListMapNoExtraKeys!700 lt!171176 lt!171186 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373107 (= lt!171186 (array!21639 (store (arr!10287 _values!506) i!548 (ValueCellFull!4085 v!373)) (size!10639 _values!506)))))

(assert (=> b!373107 (= lt!171177 (getCurrentListMapNoExtraKeys!700 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373108 () Bool)

(assert (=> b!373108 (= e!227479 tp_is_empty!8857)))

(assert (= (and start!37068 res!210114) b!373102))

(assert (= (and b!373102 res!210107) b!373104))

(assert (= (and b!373104 res!210116) b!373096))

(assert (= (and b!373096 res!210112) b!373100))

(assert (= (and b!373100 res!210115) b!373097))

(assert (= (and b!373097 res!210109) b!373098))

(assert (= (and b!373098 res!210111) b!373095))

(assert (= (and b!373095 res!210108) b!373099))

(assert (= (and b!373099 res!210113) b!373106))

(assert (= (and b!373106 res!210110) b!373107))

(assert (= (and b!373107 (not res!210106)) b!373101))

(assert (= (and b!373105 condMapEmpty!14850) mapIsEmpty!14850))

(assert (= (and b!373105 (not condMapEmpty!14850)) mapNonEmpty!14850))

(get-info :version)

(assert (= (and mapNonEmpty!14850 ((_ is ValueCellFull!4085) mapValue!14850)) b!373103))

(assert (= (and b!373105 ((_ is ValueCellFull!4085) mapDefault!14850)) b!373108))

(assert (= start!37068 b!373105))

(declare-fun m!369203 () Bool)

(assert (=> b!373106 m!369203))

(declare-fun m!369205 () Bool)

(assert (=> b!373098 m!369205))

(declare-fun m!369207 () Bool)

(assert (=> b!373104 m!369207))

(declare-fun m!369209 () Bool)

(assert (=> b!373096 m!369209))

(declare-fun m!369211 () Bool)

(assert (=> start!37068 m!369211))

(declare-fun m!369213 () Bool)

(assert (=> start!37068 m!369213))

(declare-fun m!369215 () Bool)

(assert (=> start!37068 m!369215))

(declare-fun m!369217 () Bool)

(assert (=> b!373099 m!369217))

(declare-fun m!369219 () Bool)

(assert (=> b!373099 m!369219))

(declare-fun m!369221 () Bool)

(assert (=> mapNonEmpty!14850 m!369221))

(declare-fun m!369223 () Bool)

(assert (=> b!373101 m!369223))

(declare-fun m!369225 () Bool)

(assert (=> b!373101 m!369225))

(declare-fun m!369227 () Bool)

(assert (=> b!373101 m!369227))

(assert (=> b!373101 m!369225))

(declare-fun m!369229 () Bool)

(assert (=> b!373101 m!369229))

(declare-fun m!369231 () Bool)

(assert (=> b!373101 m!369231))

(declare-fun m!369233 () Bool)

(assert (=> b!373101 m!369233))

(declare-fun m!369235 () Bool)

(assert (=> b!373101 m!369235))

(declare-fun m!369237 () Bool)

(assert (=> b!373101 m!369237))

(declare-fun m!369239 () Bool)

(assert (=> b!373095 m!369239))

(declare-fun m!369241 () Bool)

(assert (=> b!373097 m!369241))

(declare-fun m!369243 () Bool)

(assert (=> b!373107 m!369243))

(declare-fun m!369245 () Bool)

(assert (=> b!373107 m!369245))

(declare-fun m!369247 () Bool)

(assert (=> b!373107 m!369247))

(declare-fun m!369249 () Bool)

(assert (=> b!373107 m!369249))

(declare-fun m!369251 () Bool)

(assert (=> b!373107 m!369251))

(declare-fun m!369253 () Bool)

(assert (=> b!373107 m!369253))

(declare-fun m!369255 () Bool)

(assert (=> b!373107 m!369255))

(check-sat (not b!373099) (not start!37068) tp_is_empty!8857 b_and!15465 (not b!373101) (not b!373097) (not b!373104) (not b!373107) (not b!373106) (not mapNonEmpty!14850) (not b!373096) (not b!373095) (not b_next!8209))
(check-sat b_and!15465 (not b_next!8209))
