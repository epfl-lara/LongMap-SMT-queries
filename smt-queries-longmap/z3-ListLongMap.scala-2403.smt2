; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38022 () Bool)

(assert start!38022)

(declare-fun b_free!8983 () Bool)

(declare-fun b_next!8983 () Bool)

(assert (=> start!38022 (= b_free!8983 (not b_next!8983))))

(declare-fun tp!31722 () Bool)

(declare-fun b_and!16283 () Bool)

(assert (=> start!38022 (= tp!31722 b_and!16283)))

(declare-fun res!223991 () Bool)

(declare-fun e!236964 () Bool)

(assert (=> start!38022 (=> (not res!223991) (not e!236964))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38022 (= res!223991 (validMask!0 mask!970))))

(assert (=> start!38022 e!236964))

(declare-datatypes ((V!13979 0))(
  ( (V!13980 (val!4872 Int)) )
))
(declare-datatypes ((ValueCell!4484 0))(
  ( (ValueCellFull!4484 (v!7091 V!13979)) (EmptyCell!4484) )
))
(declare-datatypes ((array!23197 0))(
  ( (array!23198 (arr!11060 (Array (_ BitVec 32) ValueCell!4484)) (size!11413 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23197)

(declare-fun e!236961 () Bool)

(declare-fun array_inv!8120 (array!23197) Bool)

(assert (=> start!38022 (and (array_inv!8120 _values!506) e!236961)))

(assert (=> start!38022 tp!31722))

(assert (=> start!38022 true))

(declare-fun tp_is_empty!9655 () Bool)

(assert (=> start!38022 tp_is_empty!9655))

(declare-datatypes ((array!23199 0))(
  ( (array!23200 (arr!11061 (Array (_ BitVec 32) (_ BitVec 64))) (size!11414 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23199)

(declare-fun array_inv!8121 (array!23199) Bool)

(assert (=> start!38022 (array_inv!8121 _keys!658)))

(declare-fun b!391256 () Bool)

(declare-fun res!223994 () Bool)

(assert (=> b!391256 (=> (not res!223994) (not e!236964))))

(declare-datatypes ((List!6377 0))(
  ( (Nil!6374) (Cons!6373 (h!7229 (_ BitVec 64)) (t!11532 List!6377)) )
))
(declare-fun arrayNoDuplicates!0 (array!23199 (_ BitVec 32) List!6377) Bool)

(assert (=> b!391256 (= res!223994 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6374))))

(declare-fun b!391257 () Bool)

(declare-fun e!236965 () Bool)

(declare-fun e!236962 () Bool)

(assert (=> b!391257 (= e!236965 (not e!236962))))

(declare-fun res!223997 () Bool)

(assert (=> b!391257 (=> res!223997 e!236962)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391257 (= res!223997 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6534 0))(
  ( (tuple2!6535 (_1!3278 (_ BitVec 64)) (_2!3278 V!13979)) )
))
(declare-datatypes ((List!6378 0))(
  ( (Nil!6375) (Cons!6374 (h!7230 tuple2!6534) (t!11533 List!6378)) )
))
(declare-datatypes ((ListLongMap!5437 0))(
  ( (ListLongMap!5438 (toList!2734 List!6378)) )
))
(declare-fun lt!184561 () ListLongMap!5437)

(declare-fun zeroValue!472 () V!13979)

(declare-fun minValue!472 () V!13979)

(declare-fun getCurrentListMap!2057 (array!23199 array!23197 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) Int) ListLongMap!5437)

(assert (=> b!391257 (= lt!184561 (getCurrentListMap!2057 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184556 () ListLongMap!5437)

(declare-fun lt!184560 () array!23197)

(declare-fun lt!184559 () array!23199)

(assert (=> b!391257 (= lt!184556 (getCurrentListMap!2057 lt!184559 lt!184560 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184554 () ListLongMap!5437)

(declare-fun lt!184558 () ListLongMap!5437)

(assert (=> b!391257 (and (= lt!184554 lt!184558) (= lt!184558 lt!184554))))

(declare-fun lt!184553 () ListLongMap!5437)

(declare-fun lt!184551 () tuple2!6534)

(declare-fun +!1054 (ListLongMap!5437 tuple2!6534) ListLongMap!5437)

(assert (=> b!391257 (= lt!184558 (+!1054 lt!184553 lt!184551))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13979)

(assert (=> b!391257 (= lt!184551 (tuple2!6535 k0!778 v!373))))

(declare-datatypes ((Unit!11956 0))(
  ( (Unit!11957) )
))
(declare-fun lt!184562 () Unit!11956)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!258 (array!23199 array!23197 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) (_ BitVec 64) V!13979 (_ BitVec 32) Int) Unit!11956)

(assert (=> b!391257 (= lt!184562 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!258 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!967 (array!23199 array!23197 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) Int) ListLongMap!5437)

(assert (=> b!391257 (= lt!184554 (getCurrentListMapNoExtraKeys!967 lt!184559 lt!184560 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391257 (= lt!184560 (array!23198 (store (arr!11060 _values!506) i!548 (ValueCellFull!4484 v!373)) (size!11413 _values!506)))))

(assert (=> b!391257 (= lt!184553 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391258 () Bool)

(declare-fun e!236960 () Bool)

(declare-fun mapRes!16068 () Bool)

(assert (=> b!391258 (= e!236961 (and e!236960 mapRes!16068))))

(declare-fun condMapEmpty!16068 () Bool)

(declare-fun mapDefault!16068 () ValueCell!4484)

(assert (=> b!391258 (= condMapEmpty!16068 (= (arr!11060 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4484)) mapDefault!16068)))))

(declare-fun b!391259 () Bool)

(declare-fun res!223989 () Bool)

(assert (=> b!391259 (=> (not res!223989) (not e!236964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391259 (= res!223989 (validKeyInArray!0 k0!778))))

(declare-fun b!391260 () Bool)

(declare-fun res!223992 () Bool)

(assert (=> b!391260 (=> (not res!223992) (not e!236964))))

(assert (=> b!391260 (= res!223992 (and (= (size!11413 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11414 _keys!658) (size!11413 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16068 () Bool)

(declare-fun tp!31721 () Bool)

(declare-fun e!236966 () Bool)

(assert (=> mapNonEmpty!16068 (= mapRes!16068 (and tp!31721 e!236966))))

(declare-fun mapRest!16068 () (Array (_ BitVec 32) ValueCell!4484))

(declare-fun mapKey!16068 () (_ BitVec 32))

(declare-fun mapValue!16068 () ValueCell!4484)

(assert (=> mapNonEmpty!16068 (= (arr!11060 _values!506) (store mapRest!16068 mapKey!16068 mapValue!16068))))

(declare-fun b!391261 () Bool)

(declare-fun res!223993 () Bool)

(assert (=> b!391261 (=> (not res!223993) (not e!236965))))

(assert (=> b!391261 (= res!223993 (arrayNoDuplicates!0 lt!184559 #b00000000000000000000000000000000 Nil!6374))))

(declare-fun mapIsEmpty!16068 () Bool)

(assert (=> mapIsEmpty!16068 mapRes!16068))

(declare-fun b!391262 () Bool)

(declare-fun res!223995 () Bool)

(assert (=> b!391262 (=> (not res!223995) (not e!236964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23199 (_ BitVec 32)) Bool)

(assert (=> b!391262 (= res!223995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391263 () Bool)

(declare-fun e!236963 () Bool)

(assert (=> b!391263 (= e!236962 e!236963)))

(declare-fun res!223988 () Bool)

(assert (=> b!391263 (=> res!223988 e!236963)))

(assert (=> b!391263 (= res!223988 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!184552 () ListLongMap!5437)

(assert (=> b!391263 (= lt!184556 lt!184552)))

(declare-fun lt!184557 () tuple2!6534)

(assert (=> b!391263 (= lt!184552 (+!1054 lt!184558 lt!184557))))

(declare-fun lt!184563 () ListLongMap!5437)

(assert (=> b!391263 (= lt!184561 lt!184563)))

(assert (=> b!391263 (= lt!184563 (+!1054 lt!184553 lt!184557))))

(assert (=> b!391263 (= lt!184556 (+!1054 lt!184554 lt!184557))))

(assert (=> b!391263 (= lt!184557 (tuple2!6535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391264 () Bool)

(assert (=> b!391264 (= e!236964 e!236965)))

(declare-fun res!223996 () Bool)

(assert (=> b!391264 (=> (not res!223996) (not e!236965))))

(assert (=> b!391264 (= res!223996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184559 mask!970))))

(assert (=> b!391264 (= lt!184559 (array!23200 (store (arr!11061 _keys!658) i!548 k0!778) (size!11414 _keys!658)))))

(declare-fun b!391265 () Bool)

(declare-fun res!223999 () Bool)

(assert (=> b!391265 (=> (not res!223999) (not e!236964))))

(declare-fun arrayContainsKey!0 (array!23199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391265 (= res!223999 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391266 () Bool)

(declare-fun res!223990 () Bool)

(assert (=> b!391266 (=> (not res!223990) (not e!236964))))

(assert (=> b!391266 (= res!223990 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11414 _keys!658))))))

(declare-fun b!391267 () Bool)

(assert (=> b!391267 (= e!236960 tp_is_empty!9655)))

(declare-fun b!391268 () Bool)

(declare-fun res!223998 () Bool)

(assert (=> b!391268 (=> (not res!223998) (not e!236964))))

(assert (=> b!391268 (= res!223998 (or (= (select (arr!11061 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11061 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391269 () Bool)

(assert (=> b!391269 (= e!236966 tp_is_empty!9655)))

(declare-fun b!391270 () Bool)

(assert (=> b!391270 (= e!236963 (bvslt i!548 (size!11413 _values!506)))))

(assert (=> b!391270 (= lt!184552 (+!1054 lt!184563 lt!184551))))

(declare-fun lt!184555 () Unit!11956)

(declare-fun addCommutativeForDiffKeys!334 (ListLongMap!5437 (_ BitVec 64) V!13979 (_ BitVec 64) V!13979) Unit!11956)

(assert (=> b!391270 (= lt!184555 (addCommutativeForDiffKeys!334 lt!184553 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!38022 res!223991) b!391260))

(assert (= (and b!391260 res!223992) b!391262))

(assert (= (and b!391262 res!223995) b!391256))

(assert (= (and b!391256 res!223994) b!391266))

(assert (= (and b!391266 res!223990) b!391259))

(assert (= (and b!391259 res!223989) b!391268))

(assert (= (and b!391268 res!223998) b!391265))

(assert (= (and b!391265 res!223999) b!391264))

(assert (= (and b!391264 res!223996) b!391261))

(assert (= (and b!391261 res!223993) b!391257))

(assert (= (and b!391257 (not res!223997)) b!391263))

(assert (= (and b!391263 (not res!223988)) b!391270))

(assert (= (and b!391258 condMapEmpty!16068) mapIsEmpty!16068))

(assert (= (and b!391258 (not condMapEmpty!16068)) mapNonEmpty!16068))

(get-info :version)

(assert (= (and mapNonEmpty!16068 ((_ is ValueCellFull!4484) mapValue!16068)) b!391269))

(assert (= (and b!391258 ((_ is ValueCellFull!4484) mapDefault!16068)) b!391267))

(assert (= start!38022 b!391258))

(declare-fun m!387175 () Bool)

(assert (=> mapNonEmpty!16068 m!387175))

(declare-fun m!387177 () Bool)

(assert (=> b!391262 m!387177))

(declare-fun m!387179 () Bool)

(assert (=> b!391264 m!387179))

(declare-fun m!387181 () Bool)

(assert (=> b!391264 m!387181))

(declare-fun m!387183 () Bool)

(assert (=> b!391263 m!387183))

(declare-fun m!387185 () Bool)

(assert (=> b!391263 m!387185))

(declare-fun m!387187 () Bool)

(assert (=> b!391263 m!387187))

(declare-fun m!387189 () Bool)

(assert (=> b!391259 m!387189))

(declare-fun m!387191 () Bool)

(assert (=> start!38022 m!387191))

(declare-fun m!387193 () Bool)

(assert (=> start!38022 m!387193))

(declare-fun m!387195 () Bool)

(assert (=> start!38022 m!387195))

(declare-fun m!387197 () Bool)

(assert (=> b!391265 m!387197))

(declare-fun m!387199 () Bool)

(assert (=> b!391256 m!387199))

(declare-fun m!387201 () Bool)

(assert (=> b!391270 m!387201))

(declare-fun m!387203 () Bool)

(assert (=> b!391270 m!387203))

(declare-fun m!387205 () Bool)

(assert (=> b!391261 m!387205))

(declare-fun m!387207 () Bool)

(assert (=> b!391257 m!387207))

(declare-fun m!387209 () Bool)

(assert (=> b!391257 m!387209))

(declare-fun m!387211 () Bool)

(assert (=> b!391257 m!387211))

(declare-fun m!387213 () Bool)

(assert (=> b!391257 m!387213))

(declare-fun m!387215 () Bool)

(assert (=> b!391257 m!387215))

(declare-fun m!387217 () Bool)

(assert (=> b!391257 m!387217))

(declare-fun m!387219 () Bool)

(assert (=> b!391257 m!387219))

(declare-fun m!387221 () Bool)

(assert (=> b!391268 m!387221))

(check-sat (not b!391259) (not b_next!8983) tp_is_empty!9655 (not b!391263) (not b!391264) (not b!391256) (not mapNonEmpty!16068) (not b!391261) (not b!391257) (not b!391270) b_and!16283 (not start!38022) (not b!391262) (not b!391265))
(check-sat b_and!16283 (not b_next!8983))
