; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37338 () Bool)

(assert start!37338)

(declare-fun b_free!8479 () Bool)

(declare-fun b_next!8479 () Bool)

(assert (=> start!37338 (= b_free!8479 (not b_next!8479))))

(declare-fun tp!30153 () Bool)

(declare-fun b_and!15735 () Bool)

(assert (=> start!37338 (= tp!30153 b_and!15735)))

(declare-fun mapIsEmpty!15255 () Bool)

(declare-fun mapRes!15255 () Bool)

(assert (=> mapIsEmpty!15255 mapRes!15255))

(declare-fun b!379181 () Bool)

(declare-fun e!230718 () Bool)

(declare-fun tp_is_empty!9127 () Bool)

(assert (=> b!379181 (= e!230718 tp_is_empty!9127)))

(declare-fun b!379182 () Bool)

(declare-fun res!214987 () Bool)

(declare-fun e!230717 () Bool)

(assert (=> b!379182 (=> (not res!214987) (not e!230717))))

(declare-datatypes ((array!22164 0))(
  ( (array!22165 (arr!10550 (Array (_ BitVec 32) (_ BitVec 64))) (size!10902 (_ BitVec 32))) )
))
(declare-fun lt!177024 () array!22164)

(declare-datatypes ((List!5896 0))(
  ( (Nil!5893) (Cons!5892 (h!6748 (_ BitVec 64)) (t!11038 List!5896)) )
))
(declare-fun arrayNoDuplicates!0 (array!22164 (_ BitVec 32) List!5896) Bool)

(assert (=> b!379182 (= res!214987 (arrayNoDuplicates!0 lt!177024 #b00000000000000000000000000000000 Nil!5893))))

(declare-fun res!214978 () Bool)

(declare-fun e!230711 () Bool)

(assert (=> start!37338 (=> (not res!214978) (not e!230711))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37338 (= res!214978 (validMask!0 mask!970))))

(assert (=> start!37338 e!230711))

(declare-datatypes ((V!13275 0))(
  ( (V!13276 (val!4608 Int)) )
))
(declare-datatypes ((ValueCell!4220 0))(
  ( (ValueCellFull!4220 (v!6806 V!13275)) (EmptyCell!4220) )
))
(declare-datatypes ((array!22166 0))(
  ( (array!22167 (arr!10551 (Array (_ BitVec 32) ValueCell!4220)) (size!10903 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22166)

(declare-fun e!230715 () Bool)

(declare-fun array_inv!7818 (array!22166) Bool)

(assert (=> start!37338 (and (array_inv!7818 _values!506) e!230715)))

(assert (=> start!37338 tp!30153))

(assert (=> start!37338 true))

(assert (=> start!37338 tp_is_empty!9127))

(declare-fun _keys!658 () array!22164)

(declare-fun array_inv!7819 (array!22164) Bool)

(assert (=> start!37338 (array_inv!7819 _keys!658)))

(declare-fun mapNonEmpty!15255 () Bool)

(declare-fun tp!30152 () Bool)

(assert (=> mapNonEmpty!15255 (= mapRes!15255 (and tp!30152 e!230718))))

(declare-fun mapValue!15255 () ValueCell!4220)

(declare-fun mapRest!15255 () (Array (_ BitVec 32) ValueCell!4220))

(declare-fun mapKey!15255 () (_ BitVec 32))

(assert (=> mapNonEmpty!15255 (= (arr!10551 _values!506) (store mapRest!15255 mapKey!15255 mapValue!15255))))

(declare-fun b!379183 () Bool)

(declare-fun res!214977 () Bool)

(assert (=> b!379183 (=> (not res!214977) (not e!230711))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379183 (= res!214977 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10902 _keys!658))))))

(declare-fun b!379184 () Bool)

(declare-fun res!214984 () Bool)

(assert (=> b!379184 (=> (not res!214984) (not e!230711))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379184 (= res!214984 (validKeyInArray!0 k0!778))))

(declare-fun b!379185 () Bool)

(declare-fun res!214983 () Bool)

(assert (=> b!379185 (=> (not res!214983) (not e!230711))))

(assert (=> b!379185 (= res!214983 (or (= (select (arr!10550 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10550 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379186 () Bool)

(declare-fun res!214986 () Bool)

(assert (=> b!379186 (=> (not res!214986) (not e!230711))))

(assert (=> b!379186 (= res!214986 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5893))))

(declare-fun b!379187 () Bool)

(declare-fun e!230712 () Bool)

(assert (=> b!379187 (= e!230712 true)))

(declare-datatypes ((tuple2!6058 0))(
  ( (tuple2!6059 (_1!3040 (_ BitVec 64)) (_2!3040 V!13275)) )
))
(declare-datatypes ((List!5897 0))(
  ( (Nil!5894) (Cons!5893 (h!6749 tuple2!6058) (t!11039 List!5897)) )
))
(declare-datatypes ((ListLongMap!4973 0))(
  ( (ListLongMap!4974 (toList!2502 List!5897)) )
))
(declare-fun lt!177034 () ListLongMap!4973)

(declare-fun lt!177026 () ListLongMap!4973)

(declare-fun lt!177033 () tuple2!6058)

(declare-fun +!898 (ListLongMap!4973 tuple2!6058) ListLongMap!4973)

(assert (=> b!379187 (= lt!177034 (+!898 lt!177026 lt!177033))))

(declare-fun v!373 () V!13275)

(declare-fun lt!177030 () ListLongMap!4973)

(declare-datatypes ((Unit!11679 0))(
  ( (Unit!11680) )
))
(declare-fun lt!177028 () Unit!11679)

(declare-fun minValue!472 () V!13275)

(declare-fun addCommutativeForDiffKeys!311 (ListLongMap!4973 (_ BitVec 64) V!13275 (_ BitVec 64) V!13275) Unit!11679)

(assert (=> b!379187 (= lt!177028 (addCommutativeForDiffKeys!311 lt!177030 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379188 () Bool)

(assert (=> b!379188 (= e!230711 e!230717)))

(declare-fun res!214981 () Bool)

(assert (=> b!379188 (=> (not res!214981) (not e!230717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22164 (_ BitVec 32)) Bool)

(assert (=> b!379188 (= res!214981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177024 mask!970))))

(assert (=> b!379188 (= lt!177024 (array!22165 (store (arr!10550 _keys!658) i!548 k0!778) (size!10902 _keys!658)))))

(declare-fun b!379189 () Bool)

(declare-fun e!230714 () Bool)

(assert (=> b!379189 (= e!230714 e!230712)))

(declare-fun res!214980 () Bool)

(assert (=> b!379189 (=> res!214980 e!230712)))

(assert (=> b!379189 (= res!214980 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177029 () ListLongMap!4973)

(assert (=> b!379189 (= lt!177029 lt!177026)))

(declare-fun lt!177027 () tuple2!6058)

(assert (=> b!379189 (= lt!177026 (+!898 lt!177030 lt!177027))))

(declare-fun lt!177023 () ListLongMap!4973)

(assert (=> b!379189 (= lt!177023 lt!177034)))

(declare-fun lt!177025 () ListLongMap!4973)

(assert (=> b!379189 (= lt!177034 (+!898 lt!177025 lt!177027))))

(declare-fun lt!177032 () ListLongMap!4973)

(assert (=> b!379189 (= lt!177023 (+!898 lt!177032 lt!177027))))

(assert (=> b!379189 (= lt!177027 (tuple2!6059 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379190 () Bool)

(declare-fun e!230713 () Bool)

(assert (=> b!379190 (= e!230715 (and e!230713 mapRes!15255))))

(declare-fun condMapEmpty!15255 () Bool)

(declare-fun mapDefault!15255 () ValueCell!4220)

(assert (=> b!379190 (= condMapEmpty!15255 (= (arr!10551 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4220)) mapDefault!15255)))))

(declare-fun b!379191 () Bool)

(assert (=> b!379191 (= e!230717 (not e!230714))))

(declare-fun res!214985 () Bool)

(assert (=> b!379191 (=> res!214985 e!230714)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379191 (= res!214985 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13275)

(declare-fun getCurrentListMap!1943 (array!22164 array!22166 (_ BitVec 32) (_ BitVec 32) V!13275 V!13275 (_ BitVec 32) Int) ListLongMap!4973)

(assert (=> b!379191 (= lt!177029 (getCurrentListMap!1943 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177031 () array!22166)

(assert (=> b!379191 (= lt!177023 (getCurrentListMap!1943 lt!177024 lt!177031 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379191 (and (= lt!177032 lt!177025) (= lt!177025 lt!177032))))

(assert (=> b!379191 (= lt!177025 (+!898 lt!177030 lt!177033))))

(assert (=> b!379191 (= lt!177033 (tuple2!6059 k0!778 v!373))))

(declare-fun lt!177022 () Unit!11679)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!130 (array!22164 array!22166 (_ BitVec 32) (_ BitVec 32) V!13275 V!13275 (_ BitVec 32) (_ BitVec 64) V!13275 (_ BitVec 32) Int) Unit!11679)

(assert (=> b!379191 (= lt!177022 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!130 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!790 (array!22164 array!22166 (_ BitVec 32) (_ BitVec 32) V!13275 V!13275 (_ BitVec 32) Int) ListLongMap!4973)

(assert (=> b!379191 (= lt!177032 (getCurrentListMapNoExtraKeys!790 lt!177024 lt!177031 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379191 (= lt!177031 (array!22167 (store (arr!10551 _values!506) i!548 (ValueCellFull!4220 v!373)) (size!10903 _values!506)))))

(assert (=> b!379191 (= lt!177030 (getCurrentListMapNoExtraKeys!790 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379192 () Bool)

(declare-fun res!214982 () Bool)

(assert (=> b!379192 (=> (not res!214982) (not e!230711))))

(assert (=> b!379192 (= res!214982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379193 () Bool)

(assert (=> b!379193 (= e!230713 tp_is_empty!9127)))

(declare-fun b!379194 () Bool)

(declare-fun res!214979 () Bool)

(assert (=> b!379194 (=> (not res!214979) (not e!230711))))

(declare-fun arrayContainsKey!0 (array!22164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379194 (= res!214979 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379195 () Bool)

(declare-fun res!214988 () Bool)

(assert (=> b!379195 (=> (not res!214988) (not e!230711))))

(assert (=> b!379195 (= res!214988 (and (= (size!10903 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10902 _keys!658) (size!10903 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37338 res!214978) b!379195))

(assert (= (and b!379195 res!214988) b!379192))

(assert (= (and b!379192 res!214982) b!379186))

(assert (= (and b!379186 res!214986) b!379183))

(assert (= (and b!379183 res!214977) b!379184))

(assert (= (and b!379184 res!214984) b!379185))

(assert (= (and b!379185 res!214983) b!379194))

(assert (= (and b!379194 res!214979) b!379188))

(assert (= (and b!379188 res!214981) b!379182))

(assert (= (and b!379182 res!214987) b!379191))

(assert (= (and b!379191 (not res!214985)) b!379189))

(assert (= (and b!379189 (not res!214980)) b!379187))

(assert (= (and b!379190 condMapEmpty!15255) mapIsEmpty!15255))

(assert (= (and b!379190 (not condMapEmpty!15255)) mapNonEmpty!15255))

(get-info :version)

(assert (= (and mapNonEmpty!15255 ((_ is ValueCellFull!4220) mapValue!15255)) b!379181))

(assert (= (and b!379190 ((_ is ValueCellFull!4220) mapDefault!15255)) b!379193))

(assert (= start!37338 b!379190))

(declare-fun m!376325 () Bool)

(assert (=> b!379194 m!376325))

(declare-fun m!376327 () Bool)

(assert (=> b!379187 m!376327))

(declare-fun m!376329 () Bool)

(assert (=> b!379187 m!376329))

(declare-fun m!376331 () Bool)

(assert (=> b!379185 m!376331))

(declare-fun m!376333 () Bool)

(assert (=> b!379186 m!376333))

(declare-fun m!376335 () Bool)

(assert (=> mapNonEmpty!15255 m!376335))

(declare-fun m!376337 () Bool)

(assert (=> b!379189 m!376337))

(declare-fun m!376339 () Bool)

(assert (=> b!379189 m!376339))

(declare-fun m!376341 () Bool)

(assert (=> b!379189 m!376341))

(declare-fun m!376343 () Bool)

(assert (=> b!379191 m!376343))

(declare-fun m!376345 () Bool)

(assert (=> b!379191 m!376345))

(declare-fun m!376347 () Bool)

(assert (=> b!379191 m!376347))

(declare-fun m!376349 () Bool)

(assert (=> b!379191 m!376349))

(declare-fun m!376351 () Bool)

(assert (=> b!379191 m!376351))

(declare-fun m!376353 () Bool)

(assert (=> b!379191 m!376353))

(declare-fun m!376355 () Bool)

(assert (=> b!379191 m!376355))

(declare-fun m!376357 () Bool)

(assert (=> b!379188 m!376357))

(declare-fun m!376359 () Bool)

(assert (=> b!379188 m!376359))

(declare-fun m!376361 () Bool)

(assert (=> b!379184 m!376361))

(declare-fun m!376363 () Bool)

(assert (=> b!379192 m!376363))

(declare-fun m!376365 () Bool)

(assert (=> b!379182 m!376365))

(declare-fun m!376367 () Bool)

(assert (=> start!37338 m!376367))

(declare-fun m!376369 () Bool)

(assert (=> start!37338 m!376369))

(declare-fun m!376371 () Bool)

(assert (=> start!37338 m!376371))

(check-sat (not b_next!8479) (not start!37338) (not b!379189) (not b!379184) (not b!379192) (not b!379187) (not b!379186) (not mapNonEmpty!15255) (not b!379194) tp_is_empty!9127 (not b!379188) (not b!379191) (not b!379182) b_and!15735)
(check-sat b_and!15735 (not b_next!8479))
