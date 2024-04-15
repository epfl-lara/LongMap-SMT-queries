; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38222 () Bool)

(assert start!38222)

(declare-fun b_free!9073 () Bool)

(declare-fun b_next!9073 () Bool)

(assert (=> start!38222 (= b_free!9073 (not b_next!9073))))

(declare-fun tp!32006 () Bool)

(declare-fun b_and!16433 () Bool)

(assert (=> start!38222 (= tp!32006 b_and!16433)))

(declare-fun b!394227 () Bool)

(declare-fun res!226004 () Bool)

(declare-fun e!238620 () Bool)

(assert (=> b!394227 (=> (not res!226004) (not e!238620))))

(declare-datatypes ((array!23383 0))(
  ( (array!23384 (arr!11148 (Array (_ BitVec 32) (_ BitVec 64))) (size!11501 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23383)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394227 (= res!226004 (or (= (select (arr!11148 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11148 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!226002 () Bool)

(assert (=> start!38222 (=> (not res!226002) (not e!238620))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38222 (= res!226002 (validMask!0 mask!970))))

(assert (=> start!38222 e!238620))

(declare-datatypes ((V!14099 0))(
  ( (V!14100 (val!4917 Int)) )
))
(declare-datatypes ((ValueCell!4529 0))(
  ( (ValueCellFull!4529 (v!7156 V!14099)) (EmptyCell!4529) )
))
(declare-datatypes ((array!23385 0))(
  ( (array!23386 (arr!11149 (Array (_ BitVec 32) ValueCell!4529)) (size!11502 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23385)

(declare-fun e!238621 () Bool)

(declare-fun array_inv!8186 (array!23385) Bool)

(assert (=> start!38222 (and (array_inv!8186 _values!506) e!238621)))

(assert (=> start!38222 tp!32006))

(assert (=> start!38222 true))

(declare-fun tp_is_empty!9745 () Bool)

(assert (=> start!38222 tp_is_empty!9745))

(declare-fun array_inv!8187 (array!23383) Bool)

(assert (=> start!38222 (array_inv!8187 _keys!658)))

(declare-fun mapIsEmpty!16218 () Bool)

(declare-fun mapRes!16218 () Bool)

(assert (=> mapIsEmpty!16218 mapRes!16218))

(declare-fun b!394228 () Bool)

(declare-fun e!238619 () Bool)

(assert (=> b!394228 (= e!238619 tp_is_empty!9745)))

(declare-fun b!394229 () Bool)

(declare-fun e!238624 () Bool)

(assert (=> b!394229 (= e!238624 tp_is_empty!9745)))

(declare-fun b!394230 () Bool)

(declare-fun res!225998 () Bool)

(assert (=> b!394230 (=> (not res!225998) (not e!238620))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394230 (= res!225998 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394231 () Bool)

(declare-fun res!225997 () Bool)

(assert (=> b!394231 (=> (not res!225997) (not e!238620))))

(assert (=> b!394231 (= res!225997 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11501 _keys!658))))))

(declare-fun b!394232 () Bool)

(declare-fun res!226003 () Bool)

(assert (=> b!394232 (=> (not res!226003) (not e!238620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23383 (_ BitVec 32)) Bool)

(assert (=> b!394232 (= res!226003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394233 () Bool)

(declare-fun res!225999 () Bool)

(assert (=> b!394233 (=> (not res!225999) (not e!238620))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394233 (= res!225999 (and (= (size!11502 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11501 _keys!658) (size!11502 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394234 () Bool)

(declare-fun e!238623 () Bool)

(assert (=> b!394234 (= e!238623 true)))

(declare-datatypes ((tuple2!6610 0))(
  ( (tuple2!6611 (_1!3316 (_ BitVec 64)) (_2!3316 V!14099)) )
))
(declare-datatypes ((List!6451 0))(
  ( (Nil!6448) (Cons!6447 (h!7303 tuple2!6610) (t!11616 List!6451)) )
))
(declare-datatypes ((ListLongMap!5513 0))(
  ( (ListLongMap!5514 (toList!2772 List!6451)) )
))
(declare-fun lt!186724 () ListLongMap!5513)

(declare-fun lt!186725 () ListLongMap!5513)

(declare-fun lt!186720 () tuple2!6610)

(declare-fun +!1092 (ListLongMap!5513 tuple2!6610) ListLongMap!5513)

(assert (=> b!394234 (= lt!186724 (+!1092 lt!186725 lt!186720))))

(declare-fun lt!186717 () ListLongMap!5513)

(declare-fun lt!186726 () ListLongMap!5513)

(assert (=> b!394234 (= lt!186717 lt!186726)))

(declare-fun b!394235 () Bool)

(assert (=> b!394235 (= e!238621 (and e!238619 mapRes!16218))))

(declare-fun condMapEmpty!16218 () Bool)

(declare-fun mapDefault!16218 () ValueCell!4529)

(assert (=> b!394235 (= condMapEmpty!16218 (= (arr!11149 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4529)) mapDefault!16218)))))

(declare-fun b!394236 () Bool)

(declare-fun e!238622 () Bool)

(assert (=> b!394236 (= e!238620 e!238622)))

(declare-fun res!226000 () Bool)

(assert (=> b!394236 (=> (not res!226000) (not e!238622))))

(declare-fun lt!186719 () array!23383)

(assert (=> b!394236 (= res!226000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186719 mask!970))))

(assert (=> b!394236 (= lt!186719 (array!23384 (store (arr!11148 _keys!658) i!548 k0!778) (size!11501 _keys!658)))))

(declare-fun b!394237 () Bool)

(assert (=> b!394237 (= e!238622 (not e!238623))))

(declare-fun res!226001 () Bool)

(assert (=> b!394237 (=> res!226001 e!238623)))

(declare-fun lt!186722 () Bool)

(assert (=> b!394237 (= res!226001 (or (and (not lt!186722) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186722) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186722)))))

(assert (=> b!394237 (= lt!186722 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14099)

(declare-fun minValue!472 () V!14099)

(declare-fun getCurrentListMap!2085 (array!23383 array!23385 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) Int) ListLongMap!5513)

(assert (=> b!394237 (= lt!186725 (getCurrentListMap!2085 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186718 () array!23385)

(assert (=> b!394237 (= lt!186717 (getCurrentListMap!2085 lt!186719 lt!186718 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186721 () ListLongMap!5513)

(assert (=> b!394237 (and (= lt!186726 lt!186721) (= lt!186721 lt!186726))))

(declare-fun lt!186723 () ListLongMap!5513)

(assert (=> b!394237 (= lt!186721 (+!1092 lt!186723 lt!186720))))

(declare-fun v!373 () V!14099)

(assert (=> b!394237 (= lt!186720 (tuple2!6611 k0!778 v!373))))

(declare-datatypes ((Unit!12032 0))(
  ( (Unit!12033) )
))
(declare-fun lt!186716 () Unit!12032)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!286 (array!23383 array!23385 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) (_ BitVec 64) V!14099 (_ BitVec 32) Int) Unit!12032)

(assert (=> b!394237 (= lt!186716 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!286 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!995 (array!23383 array!23385 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) Int) ListLongMap!5513)

(assert (=> b!394237 (= lt!186726 (getCurrentListMapNoExtraKeys!995 lt!186719 lt!186718 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394237 (= lt!186718 (array!23386 (store (arr!11149 _values!506) i!548 (ValueCellFull!4529 v!373)) (size!11502 _values!506)))))

(assert (=> b!394237 (= lt!186723 (getCurrentListMapNoExtraKeys!995 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394238 () Bool)

(declare-fun res!225995 () Bool)

(assert (=> b!394238 (=> (not res!225995) (not e!238620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394238 (= res!225995 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16218 () Bool)

(declare-fun tp!32007 () Bool)

(assert (=> mapNonEmpty!16218 (= mapRes!16218 (and tp!32007 e!238624))))

(declare-fun mapValue!16218 () ValueCell!4529)

(declare-fun mapKey!16218 () (_ BitVec 32))

(declare-fun mapRest!16218 () (Array (_ BitVec 32) ValueCell!4529))

(assert (=> mapNonEmpty!16218 (= (arr!11149 _values!506) (store mapRest!16218 mapKey!16218 mapValue!16218))))

(declare-fun b!394239 () Bool)

(declare-fun res!225996 () Bool)

(assert (=> b!394239 (=> (not res!225996) (not e!238622))))

(declare-datatypes ((List!6452 0))(
  ( (Nil!6449) (Cons!6448 (h!7304 (_ BitVec 64)) (t!11617 List!6452)) )
))
(declare-fun arrayNoDuplicates!0 (array!23383 (_ BitVec 32) List!6452) Bool)

(assert (=> b!394239 (= res!225996 (arrayNoDuplicates!0 lt!186719 #b00000000000000000000000000000000 Nil!6449))))

(declare-fun b!394240 () Bool)

(declare-fun res!225994 () Bool)

(assert (=> b!394240 (=> (not res!225994) (not e!238620))))

(assert (=> b!394240 (= res!225994 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6449))))

(assert (= (and start!38222 res!226002) b!394233))

(assert (= (and b!394233 res!225999) b!394232))

(assert (= (and b!394232 res!226003) b!394240))

(assert (= (and b!394240 res!225994) b!394231))

(assert (= (and b!394231 res!225997) b!394238))

(assert (= (and b!394238 res!225995) b!394227))

(assert (= (and b!394227 res!226004) b!394230))

(assert (= (and b!394230 res!225998) b!394236))

(assert (= (and b!394236 res!226000) b!394239))

(assert (= (and b!394239 res!225996) b!394237))

(assert (= (and b!394237 (not res!226001)) b!394234))

(assert (= (and b!394235 condMapEmpty!16218) mapIsEmpty!16218))

(assert (= (and b!394235 (not condMapEmpty!16218)) mapNonEmpty!16218))

(get-info :version)

(assert (= (and mapNonEmpty!16218 ((_ is ValueCellFull!4529) mapValue!16218)) b!394229))

(assert (= (and b!394235 ((_ is ValueCellFull!4529) mapDefault!16218)) b!394228))

(assert (= start!38222 b!394235))

(declare-fun m!390195 () Bool)

(assert (=> b!394232 m!390195))

(declare-fun m!390197 () Bool)

(assert (=> b!394227 m!390197))

(declare-fun m!390199 () Bool)

(assert (=> b!394236 m!390199))

(declare-fun m!390201 () Bool)

(assert (=> b!394236 m!390201))

(declare-fun m!390203 () Bool)

(assert (=> start!38222 m!390203))

(declare-fun m!390205 () Bool)

(assert (=> start!38222 m!390205))

(declare-fun m!390207 () Bool)

(assert (=> start!38222 m!390207))

(declare-fun m!390209 () Bool)

(assert (=> b!394234 m!390209))

(declare-fun m!390211 () Bool)

(assert (=> b!394238 m!390211))

(declare-fun m!390213 () Bool)

(assert (=> b!394240 m!390213))

(declare-fun m!390215 () Bool)

(assert (=> mapNonEmpty!16218 m!390215))

(declare-fun m!390217 () Bool)

(assert (=> b!394239 m!390217))

(declare-fun m!390219 () Bool)

(assert (=> b!394237 m!390219))

(declare-fun m!390221 () Bool)

(assert (=> b!394237 m!390221))

(declare-fun m!390223 () Bool)

(assert (=> b!394237 m!390223))

(declare-fun m!390225 () Bool)

(assert (=> b!394237 m!390225))

(declare-fun m!390227 () Bool)

(assert (=> b!394237 m!390227))

(declare-fun m!390229 () Bool)

(assert (=> b!394237 m!390229))

(declare-fun m!390231 () Bool)

(assert (=> b!394237 m!390231))

(declare-fun m!390233 () Bool)

(assert (=> b!394230 m!390233))

(check-sat (not mapNonEmpty!16218) b_and!16433 (not b!394236) (not b!394232) tp_is_empty!9745 (not start!38222) (not b!394238) (not b!394237) (not b!394230) (not b!394234) (not b_next!9073) (not b!394240) (not b!394239))
(check-sat b_and!16433 (not b_next!9073))
