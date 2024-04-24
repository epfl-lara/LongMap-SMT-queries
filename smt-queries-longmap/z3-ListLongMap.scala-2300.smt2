; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37248 () Bool)

(assert start!37248)

(declare-fun b_free!8389 () Bool)

(declare-fun b_next!8389 () Bool)

(assert (=> start!37248 (= b_free!8389 (not b_next!8389))))

(declare-fun tp!29883 () Bool)

(declare-fun b_and!15645 () Bool)

(assert (=> start!37248 (= tp!29883 b_and!15645)))

(declare-fun b!377147 () Bool)

(declare-fun e!229637 () Bool)

(declare-fun tp_is_empty!9037 () Bool)

(assert (=> b!377147 (= e!229637 tp_is_empty!9037)))

(declare-fun b!377148 () Bool)

(declare-fun res!213358 () Bool)

(declare-fun e!229631 () Bool)

(assert (=> b!377148 (=> (not res!213358) (not e!229631))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13155 0))(
  ( (V!13156 (val!4563 Int)) )
))
(declare-datatypes ((ValueCell!4175 0))(
  ( (ValueCellFull!4175 (v!6761 V!13155)) (EmptyCell!4175) )
))
(declare-datatypes ((array!21990 0))(
  ( (array!21991 (arr!10463 (Array (_ BitVec 32) ValueCell!4175)) (size!10815 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21990)

(declare-datatypes ((array!21992 0))(
  ( (array!21993 (arr!10464 (Array (_ BitVec 32) (_ BitVec 64))) (size!10816 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21992)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!377148 (= res!213358 (and (= (size!10815 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10816 _keys!658) (size!10815 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377149 () Bool)

(declare-fun res!213359 () Bool)

(assert (=> b!377149 (=> (not res!213359) (not e!229631))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377149 (= res!213359 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10816 _keys!658))))))

(declare-fun b!377150 () Bool)

(declare-fun res!213354 () Bool)

(assert (=> b!377150 (=> (not res!213354) (not e!229631))))

(assert (=> b!377150 (= res!213354 (or (= (select (arr!10464 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10464 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377151 () Bool)

(declare-fun e!229632 () Bool)

(declare-fun mapRes!15120 () Bool)

(assert (=> b!377151 (= e!229632 (and e!229637 mapRes!15120))))

(declare-fun condMapEmpty!15120 () Bool)

(declare-fun mapDefault!15120 () ValueCell!4175)

(assert (=> b!377151 (= condMapEmpty!15120 (= (arr!10463 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4175)) mapDefault!15120)))))

(declare-fun mapNonEmpty!15120 () Bool)

(declare-fun tp!29882 () Bool)

(declare-fun e!229636 () Bool)

(assert (=> mapNonEmpty!15120 (= mapRes!15120 (and tp!29882 e!229636))))

(declare-fun mapRest!15120 () (Array (_ BitVec 32) ValueCell!4175))

(declare-fun mapValue!15120 () ValueCell!4175)

(declare-fun mapKey!15120 () (_ BitVec 32))

(assert (=> mapNonEmpty!15120 (= (arr!10463 _values!506) (store mapRest!15120 mapKey!15120 mapValue!15120))))

(declare-fun b!377152 () Bool)

(declare-fun e!229635 () Bool)

(declare-fun e!229634 () Bool)

(assert (=> b!377152 (= e!229635 e!229634)))

(declare-fun res!213353 () Bool)

(assert (=> b!377152 (=> res!213353 e!229634)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!377152 (= res!213353 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5986 0))(
  ( (tuple2!5987 (_1!3004 (_ BitVec 64)) (_2!3004 V!13155)) )
))
(declare-datatypes ((List!5826 0))(
  ( (Nil!5823) (Cons!5822 (h!6678 tuple2!5986) (t!10968 List!5826)) )
))
(declare-datatypes ((ListLongMap!4901 0))(
  ( (ListLongMap!4902 (toList!2466 List!5826)) )
))
(declare-fun lt!175307 () ListLongMap!4901)

(declare-fun lt!175305 () ListLongMap!4901)

(assert (=> b!377152 (= lt!175307 lt!175305)))

(declare-fun lt!175311 () ListLongMap!4901)

(declare-fun lt!175313 () tuple2!5986)

(declare-fun +!862 (ListLongMap!4901 tuple2!5986) ListLongMap!4901)

(assert (=> b!377152 (= lt!175305 (+!862 lt!175311 lt!175313))))

(declare-fun lt!175303 () ListLongMap!4901)

(declare-fun lt!175308 () ListLongMap!4901)

(assert (=> b!377152 (= lt!175303 lt!175308)))

(declare-fun lt!175315 () ListLongMap!4901)

(assert (=> b!377152 (= lt!175308 (+!862 lt!175315 lt!175313))))

(declare-fun lt!175304 () ListLongMap!4901)

(assert (=> b!377152 (= lt!175307 (+!862 lt!175304 lt!175313))))

(declare-fun zeroValue!472 () V!13155)

(assert (=> b!377152 (= lt!175313 (tuple2!5987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377153 () Bool)

(declare-fun res!213356 () Bool)

(assert (=> b!377153 (=> (not res!213356) (not e!229631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377153 (= res!213356 (validKeyInArray!0 k0!778))))

(declare-fun b!377154 () Bool)

(declare-fun res!213357 () Bool)

(assert (=> b!377154 (=> (not res!213357) (not e!229631))))

(declare-fun arrayContainsKey!0 (array!21992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377154 (= res!213357 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377155 () Bool)

(declare-fun res!213349 () Bool)

(assert (=> b!377155 (=> (not res!213349) (not e!229631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21992 (_ BitVec 32)) Bool)

(assert (=> b!377155 (= res!213349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377156 () Bool)

(declare-fun e!229638 () Bool)

(assert (=> b!377156 (= e!229638 (not e!229635))))

(declare-fun res!213352 () Bool)

(assert (=> b!377156 (=> res!213352 e!229635)))

(assert (=> b!377156 (= res!213352 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13155)

(declare-fun getCurrentListMap!1914 (array!21992 array!21990 (_ BitVec 32) (_ BitVec 32) V!13155 V!13155 (_ BitVec 32) Int) ListLongMap!4901)

(assert (=> b!377156 (= lt!175303 (getCurrentListMap!1914 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175312 () array!21992)

(declare-fun lt!175314 () array!21990)

(assert (=> b!377156 (= lt!175307 (getCurrentListMap!1914 lt!175312 lt!175314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377156 (and (= lt!175304 lt!175311) (= lt!175311 lt!175304))))

(declare-fun lt!175306 () tuple2!5986)

(assert (=> b!377156 (= lt!175311 (+!862 lt!175315 lt!175306))))

(declare-fun v!373 () V!13155)

(assert (=> b!377156 (= lt!175306 (tuple2!5987 k0!778 v!373))))

(declare-datatypes ((Unit!11609 0))(
  ( (Unit!11610) )
))
(declare-fun lt!175310 () Unit!11609)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!101 (array!21992 array!21990 (_ BitVec 32) (_ BitVec 32) V!13155 V!13155 (_ BitVec 32) (_ BitVec 64) V!13155 (_ BitVec 32) Int) Unit!11609)

(assert (=> b!377156 (= lt!175310 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!101 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!761 (array!21992 array!21990 (_ BitVec 32) (_ BitVec 32) V!13155 V!13155 (_ BitVec 32) Int) ListLongMap!4901)

(assert (=> b!377156 (= lt!175304 (getCurrentListMapNoExtraKeys!761 lt!175312 lt!175314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377156 (= lt!175314 (array!21991 (store (arr!10463 _values!506) i!548 (ValueCellFull!4175 v!373)) (size!10815 _values!506)))))

(assert (=> b!377156 (= lt!175315 (getCurrentListMapNoExtraKeys!761 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!213348 () Bool)

(assert (=> start!37248 (=> (not res!213348) (not e!229631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37248 (= res!213348 (validMask!0 mask!970))))

(assert (=> start!37248 e!229631))

(declare-fun array_inv!7762 (array!21990) Bool)

(assert (=> start!37248 (and (array_inv!7762 _values!506) e!229632)))

(assert (=> start!37248 tp!29883))

(assert (=> start!37248 true))

(assert (=> start!37248 tp_is_empty!9037))

(declare-fun array_inv!7763 (array!21992) Bool)

(assert (=> start!37248 (array_inv!7763 _keys!658)))

(declare-fun b!377157 () Bool)

(declare-fun res!213355 () Bool)

(assert (=> b!377157 (=> (not res!213355) (not e!229631))))

(declare-datatypes ((List!5827 0))(
  ( (Nil!5824) (Cons!5823 (h!6679 (_ BitVec 64)) (t!10969 List!5827)) )
))
(declare-fun arrayNoDuplicates!0 (array!21992 (_ BitVec 32) List!5827) Bool)

(assert (=> b!377157 (= res!213355 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5824))))

(declare-fun b!377158 () Bool)

(declare-fun res!213350 () Bool)

(assert (=> b!377158 (=> (not res!213350) (not e!229638))))

(assert (=> b!377158 (= res!213350 (arrayNoDuplicates!0 lt!175312 #b00000000000000000000000000000000 Nil!5824))))

(declare-fun b!377159 () Bool)

(assert (=> b!377159 (= e!229634 true)))

(assert (=> b!377159 (= lt!175305 (+!862 lt!175308 lt!175306))))

(declare-fun lt!175309 () Unit!11609)

(declare-fun addCommutativeForDiffKeys!281 (ListLongMap!4901 (_ BitVec 64) V!13155 (_ BitVec 64) V!13155) Unit!11609)

(assert (=> b!377159 (= lt!175309 (addCommutativeForDiffKeys!281 lt!175315 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377160 () Bool)

(assert (=> b!377160 (= e!229631 e!229638)))

(declare-fun res!213351 () Bool)

(assert (=> b!377160 (=> (not res!213351) (not e!229638))))

(assert (=> b!377160 (= res!213351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175312 mask!970))))

(assert (=> b!377160 (= lt!175312 (array!21993 (store (arr!10464 _keys!658) i!548 k0!778) (size!10816 _keys!658)))))

(declare-fun mapIsEmpty!15120 () Bool)

(assert (=> mapIsEmpty!15120 mapRes!15120))

(declare-fun b!377161 () Bool)

(assert (=> b!377161 (= e!229636 tp_is_empty!9037)))

(assert (= (and start!37248 res!213348) b!377148))

(assert (= (and b!377148 res!213358) b!377155))

(assert (= (and b!377155 res!213349) b!377157))

(assert (= (and b!377157 res!213355) b!377149))

(assert (= (and b!377149 res!213359) b!377153))

(assert (= (and b!377153 res!213356) b!377150))

(assert (= (and b!377150 res!213354) b!377154))

(assert (= (and b!377154 res!213357) b!377160))

(assert (= (and b!377160 res!213351) b!377158))

(assert (= (and b!377158 res!213350) b!377156))

(assert (= (and b!377156 (not res!213352)) b!377152))

(assert (= (and b!377152 (not res!213353)) b!377159))

(assert (= (and b!377151 condMapEmpty!15120) mapIsEmpty!15120))

(assert (= (and b!377151 (not condMapEmpty!15120)) mapNonEmpty!15120))

(get-info :version)

(assert (= (and mapNonEmpty!15120 ((_ is ValueCellFull!4175) mapValue!15120)) b!377161))

(assert (= (and b!377151 ((_ is ValueCellFull!4175) mapDefault!15120)) b!377147))

(assert (= start!37248 b!377151))

(declare-fun m!374177 () Bool)

(assert (=> b!377157 m!374177))

(declare-fun m!374179 () Bool)

(assert (=> b!377160 m!374179))

(declare-fun m!374181 () Bool)

(assert (=> b!377160 m!374181))

(declare-fun m!374183 () Bool)

(assert (=> b!377158 m!374183))

(declare-fun m!374185 () Bool)

(assert (=> b!377154 m!374185))

(declare-fun m!374187 () Bool)

(assert (=> mapNonEmpty!15120 m!374187))

(declare-fun m!374189 () Bool)

(assert (=> b!377153 m!374189))

(declare-fun m!374191 () Bool)

(assert (=> b!377155 m!374191))

(declare-fun m!374193 () Bool)

(assert (=> start!37248 m!374193))

(declare-fun m!374195 () Bool)

(assert (=> start!37248 m!374195))

(declare-fun m!374197 () Bool)

(assert (=> start!37248 m!374197))

(declare-fun m!374199 () Bool)

(assert (=> b!377150 m!374199))

(declare-fun m!374201 () Bool)

(assert (=> b!377159 m!374201))

(declare-fun m!374203 () Bool)

(assert (=> b!377159 m!374203))

(declare-fun m!374205 () Bool)

(assert (=> b!377152 m!374205))

(declare-fun m!374207 () Bool)

(assert (=> b!377152 m!374207))

(declare-fun m!374209 () Bool)

(assert (=> b!377152 m!374209))

(declare-fun m!374211 () Bool)

(assert (=> b!377156 m!374211))

(declare-fun m!374213 () Bool)

(assert (=> b!377156 m!374213))

(declare-fun m!374215 () Bool)

(assert (=> b!377156 m!374215))

(declare-fun m!374217 () Bool)

(assert (=> b!377156 m!374217))

(declare-fun m!374219 () Bool)

(assert (=> b!377156 m!374219))

(declare-fun m!374221 () Bool)

(assert (=> b!377156 m!374221))

(declare-fun m!374223 () Bool)

(assert (=> b!377156 m!374223))

(check-sat (not b!377159) b_and!15645 (not b!377157) (not mapNonEmpty!15120) (not b_next!8389) (not start!37248) (not b!377153) (not b!377160) (not b!377155) (not b!377152) (not b!377158) (not b!377154) tp_is_empty!9037 (not b!377156))
(check-sat b_and!15645 (not b_next!8389))
