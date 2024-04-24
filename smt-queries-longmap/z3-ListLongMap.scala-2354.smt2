; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37572 () Bool)

(assert start!37572)

(declare-fun b_free!8713 () Bool)

(declare-fun b_next!8713 () Bool)

(assert (=> start!37572 (= b_free!8713 (not b_next!8713))))

(declare-fun tp!30855 () Bool)

(declare-fun b_and!15969 () Bool)

(assert (=> start!37572 (= tp!30855 b_and!15969)))

(declare-fun b!384210 () Bool)

(declare-fun e!233283 () Bool)

(declare-fun e!233286 () Bool)

(assert (=> b!384210 (= e!233283 e!233286)))

(declare-fun res!218959 () Bool)

(assert (=> b!384210 (=> (not res!218959) (not e!233286))))

(declare-datatypes ((array!22616 0))(
  ( (array!22617 (arr!10776 (Array (_ BitVec 32) (_ BitVec 64))) (size!11128 (_ BitVec 32))) )
))
(declare-fun lt!180765 () array!22616)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22616 (_ BitVec 32)) Bool)

(assert (=> b!384210 (= res!218959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180765 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22616)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384210 (= lt!180765 (array!22617 (store (arr!10776 _keys!658) i!548 k0!778) (size!11128 _keys!658)))))

(declare-fun b!384211 () Bool)

(declare-fun e!233289 () Bool)

(declare-fun tp_is_empty!9361 () Bool)

(assert (=> b!384211 (= e!233289 tp_is_empty!9361)))

(declare-fun b!384212 () Bool)

(declare-fun e!233285 () Bool)

(assert (=> b!384212 (= e!233285 tp_is_empty!9361)))

(declare-fun b!384214 () Bool)

(declare-fun e!233284 () Bool)

(assert (=> b!384214 (= e!233284 true)))

(declare-datatypes ((V!13587 0))(
  ( (V!13588 (val!4725 Int)) )
))
(declare-datatypes ((tuple2!6236 0))(
  ( (tuple2!6237 (_1!3129 (_ BitVec 64)) (_2!3129 V!13587)) )
))
(declare-datatypes ((List!6071 0))(
  ( (Nil!6068) (Cons!6067 (h!6923 tuple2!6236) (t!11213 List!6071)) )
))
(declare-datatypes ((ListLongMap!5151 0))(
  ( (ListLongMap!5152 (toList!2591 List!6071)) )
))
(declare-fun lt!180763 () ListLongMap!5151)

(declare-fun lt!180772 () ListLongMap!5151)

(declare-fun lt!180770 () tuple2!6236)

(declare-fun +!983 (ListLongMap!5151 tuple2!6236) ListLongMap!5151)

(assert (=> b!384214 (= lt!180763 (+!983 lt!180772 lt!180770))))

(declare-fun lt!180769 () ListLongMap!5151)

(declare-fun lt!180771 () ListLongMap!5151)

(assert (=> b!384214 (= lt!180769 lt!180771)))

(declare-fun mapIsEmpty!15606 () Bool)

(declare-fun mapRes!15606 () Bool)

(assert (=> mapIsEmpty!15606 mapRes!15606))

(declare-fun b!384215 () Bool)

(declare-fun res!218955 () Bool)

(assert (=> b!384215 (=> (not res!218955) (not e!233283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384215 (= res!218955 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15606 () Bool)

(declare-fun tp!30854 () Bool)

(assert (=> mapNonEmpty!15606 (= mapRes!15606 (and tp!30854 e!233289))))

(declare-fun mapKey!15606 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4337 0))(
  ( (ValueCellFull!4337 (v!6923 V!13587)) (EmptyCell!4337) )
))
(declare-datatypes ((array!22618 0))(
  ( (array!22619 (arr!10777 (Array (_ BitVec 32) ValueCell!4337)) (size!11129 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22618)

(declare-fun mapValue!15606 () ValueCell!4337)

(declare-fun mapRest!15606 () (Array (_ BitVec 32) ValueCell!4337))

(assert (=> mapNonEmpty!15606 (= (arr!10777 _values!506) (store mapRest!15606 mapKey!15606 mapValue!15606))))

(declare-fun b!384216 () Bool)

(declare-fun res!218954 () Bool)

(assert (=> b!384216 (=> (not res!218954) (not e!233283))))

(assert (=> b!384216 (= res!218954 (or (= (select (arr!10776 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10776 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384217 () Bool)

(declare-fun res!218963 () Bool)

(assert (=> b!384217 (=> (not res!218963) (not e!233283))))

(assert (=> b!384217 (= res!218963 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11128 _keys!658))))))

(declare-fun b!384218 () Bool)

(declare-fun res!218962 () Bool)

(assert (=> b!384218 (=> (not res!218962) (not e!233283))))

(declare-datatypes ((List!6072 0))(
  ( (Nil!6069) (Cons!6068 (h!6924 (_ BitVec 64)) (t!11214 List!6072)) )
))
(declare-fun arrayNoDuplicates!0 (array!22616 (_ BitVec 32) List!6072) Bool)

(assert (=> b!384218 (= res!218962 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6069))))

(declare-fun b!384219 () Bool)

(declare-fun res!218957 () Bool)

(assert (=> b!384219 (=> (not res!218957) (not e!233283))))

(assert (=> b!384219 (= res!218957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!218961 () Bool)

(assert (=> start!37572 (=> (not res!218961) (not e!233283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37572 (= res!218961 (validMask!0 mask!970))))

(assert (=> start!37572 e!233283))

(declare-fun e!233287 () Bool)

(declare-fun array_inv!7974 (array!22618) Bool)

(assert (=> start!37572 (and (array_inv!7974 _values!506) e!233287)))

(assert (=> start!37572 tp!30855))

(assert (=> start!37572 true))

(assert (=> start!37572 tp_is_empty!9361))

(declare-fun array_inv!7975 (array!22616) Bool)

(assert (=> start!37572 (array_inv!7975 _keys!658)))

(declare-fun b!384213 () Bool)

(declare-fun res!218956 () Bool)

(assert (=> b!384213 (=> (not res!218956) (not e!233286))))

(assert (=> b!384213 (= res!218956 (arrayNoDuplicates!0 lt!180765 #b00000000000000000000000000000000 Nil!6069))))

(declare-fun b!384220 () Bool)

(declare-fun res!218953 () Bool)

(assert (=> b!384220 (=> (not res!218953) (not e!233283))))

(declare-fun arrayContainsKey!0 (array!22616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384220 (= res!218953 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384221 () Bool)

(assert (=> b!384221 (= e!233286 (not e!233284))))

(declare-fun res!218958 () Bool)

(assert (=> b!384221 (=> res!218958 e!233284)))

(declare-fun lt!180767 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384221 (= res!218958 (or (and (not lt!180767) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180767) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180767)))))

(assert (=> b!384221 (= lt!180767 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13587)

(declare-fun minValue!472 () V!13587)

(declare-fun getCurrentListMap!2021 (array!22616 array!22618 (_ BitVec 32) (_ BitVec 32) V!13587 V!13587 (_ BitVec 32) Int) ListLongMap!5151)

(assert (=> b!384221 (= lt!180772 (getCurrentListMap!2021 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180764 () array!22618)

(assert (=> b!384221 (= lt!180769 (getCurrentListMap!2021 lt!180765 lt!180764 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180766 () ListLongMap!5151)

(assert (=> b!384221 (and (= lt!180771 lt!180766) (= lt!180766 lt!180771))))

(declare-fun lt!180768 () ListLongMap!5151)

(assert (=> b!384221 (= lt!180766 (+!983 lt!180768 lt!180770))))

(declare-fun v!373 () V!13587)

(assert (=> b!384221 (= lt!180770 (tuple2!6237 k0!778 v!373))))

(declare-datatypes ((Unit!11837 0))(
  ( (Unit!11838) )
))
(declare-fun lt!180762 () Unit!11837)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!208 (array!22616 array!22618 (_ BitVec 32) (_ BitVec 32) V!13587 V!13587 (_ BitVec 32) (_ BitVec 64) V!13587 (_ BitVec 32) Int) Unit!11837)

(assert (=> b!384221 (= lt!180762 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!208 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!868 (array!22616 array!22618 (_ BitVec 32) (_ BitVec 32) V!13587 V!13587 (_ BitVec 32) Int) ListLongMap!5151)

(assert (=> b!384221 (= lt!180771 (getCurrentListMapNoExtraKeys!868 lt!180765 lt!180764 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384221 (= lt!180764 (array!22619 (store (arr!10777 _values!506) i!548 (ValueCellFull!4337 v!373)) (size!11129 _values!506)))))

(assert (=> b!384221 (= lt!180768 (getCurrentListMapNoExtraKeys!868 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384222 () Bool)

(declare-fun res!218960 () Bool)

(assert (=> b!384222 (=> (not res!218960) (not e!233283))))

(assert (=> b!384222 (= res!218960 (and (= (size!11129 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11128 _keys!658) (size!11129 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384223 () Bool)

(assert (=> b!384223 (= e!233287 (and e!233285 mapRes!15606))))

(declare-fun condMapEmpty!15606 () Bool)

(declare-fun mapDefault!15606 () ValueCell!4337)

(assert (=> b!384223 (= condMapEmpty!15606 (= (arr!10777 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4337)) mapDefault!15606)))))

(assert (= (and start!37572 res!218961) b!384222))

(assert (= (and b!384222 res!218960) b!384219))

(assert (= (and b!384219 res!218957) b!384218))

(assert (= (and b!384218 res!218962) b!384217))

(assert (= (and b!384217 res!218963) b!384215))

(assert (= (and b!384215 res!218955) b!384216))

(assert (= (and b!384216 res!218954) b!384220))

(assert (= (and b!384220 res!218953) b!384210))

(assert (= (and b!384210 res!218959) b!384213))

(assert (= (and b!384213 res!218956) b!384221))

(assert (= (and b!384221 (not res!218958)) b!384214))

(assert (= (and b!384223 condMapEmpty!15606) mapIsEmpty!15606))

(assert (= (and b!384223 (not condMapEmpty!15606)) mapNonEmpty!15606))

(get-info :version)

(assert (= (and mapNonEmpty!15606 ((_ is ValueCellFull!4337) mapValue!15606)) b!384211))

(assert (= (and b!384223 ((_ is ValueCellFull!4337) mapDefault!15606)) b!384212))

(assert (= start!37572 b!384223))

(declare-fun m!381185 () Bool)

(assert (=> b!384210 m!381185))

(declare-fun m!381187 () Bool)

(assert (=> b!384210 m!381187))

(declare-fun m!381189 () Bool)

(assert (=> b!384219 m!381189))

(declare-fun m!381191 () Bool)

(assert (=> b!384218 m!381191))

(declare-fun m!381193 () Bool)

(assert (=> b!384214 m!381193))

(declare-fun m!381195 () Bool)

(assert (=> b!384220 m!381195))

(declare-fun m!381197 () Bool)

(assert (=> mapNonEmpty!15606 m!381197))

(declare-fun m!381199 () Bool)

(assert (=> b!384216 m!381199))

(declare-fun m!381201 () Bool)

(assert (=> b!384221 m!381201))

(declare-fun m!381203 () Bool)

(assert (=> b!384221 m!381203))

(declare-fun m!381205 () Bool)

(assert (=> b!384221 m!381205))

(declare-fun m!381207 () Bool)

(assert (=> b!384221 m!381207))

(declare-fun m!381209 () Bool)

(assert (=> b!384221 m!381209))

(declare-fun m!381211 () Bool)

(assert (=> b!384221 m!381211))

(declare-fun m!381213 () Bool)

(assert (=> b!384221 m!381213))

(declare-fun m!381215 () Bool)

(assert (=> start!37572 m!381215))

(declare-fun m!381217 () Bool)

(assert (=> start!37572 m!381217))

(declare-fun m!381219 () Bool)

(assert (=> start!37572 m!381219))

(declare-fun m!381221 () Bool)

(assert (=> b!384215 m!381221))

(declare-fun m!381223 () Bool)

(assert (=> b!384213 m!381223))

(check-sat (not b!384215) (not b!384210) (not b!384219) (not b!384214) (not b!384218) (not b_next!8713) (not b!384220) (not b!384213) b_and!15969 (not mapNonEmpty!15606) (not start!37572) (not b!384221) tp_is_empty!9361)
(check-sat b_and!15969 (not b_next!8713))
