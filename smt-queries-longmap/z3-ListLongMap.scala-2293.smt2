; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37206 () Bool)

(assert start!37206)

(declare-fun b_free!8347 () Bool)

(declare-fun b_next!8347 () Bool)

(assert (=> start!37206 (= b_free!8347 (not b_next!8347))))

(declare-fun tp!29757 () Bool)

(declare-fun b_and!15563 () Bool)

(assert (=> start!37206 (= tp!29757 b_and!15563)))

(declare-fun b!375980 () Bool)

(declare-fun res!212466 () Bool)

(declare-fun e!228987 () Bool)

(assert (=> b!375980 (=> (not res!212466) (not e!228987))))

(declare-datatypes ((array!21903 0))(
  ( (array!21904 (arr!10420 (Array (_ BitVec 32) (_ BitVec 64))) (size!10773 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21903)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375980 (= res!212466 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375981 () Bool)

(declare-fun e!228988 () Bool)

(assert (=> b!375981 (= e!228987 e!228988)))

(declare-fun res!212473 () Bool)

(assert (=> b!375981 (=> (not res!212473) (not e!228988))))

(declare-fun lt!174232 () array!21903)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21903 (_ BitVec 32)) Bool)

(assert (=> b!375981 (= res!212473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174232 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375981 (= lt!174232 (array!21904 (store (arr!10420 _keys!658) i!548 k0!778) (size!10773 _keys!658)))))

(declare-fun b!375982 () Bool)

(declare-fun res!212474 () Bool)

(assert (=> b!375982 (=> (not res!212474) (not e!228987))))

(declare-datatypes ((List!5857 0))(
  ( (Nil!5854) (Cons!5853 (h!6709 (_ BitVec 64)) (t!10998 List!5857)) )
))
(declare-fun arrayNoDuplicates!0 (array!21903 (_ BitVec 32) List!5857) Bool)

(assert (=> b!375982 (= res!212474 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5854))))

(declare-fun b!375983 () Bool)

(declare-fun e!228991 () Bool)

(assert (=> b!375983 (= e!228988 (not e!228991))))

(declare-fun res!212470 () Bool)

(assert (=> b!375983 (=> res!212470 e!228991)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375983 (= res!212470 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13099 0))(
  ( (V!13100 (val!4542 Int)) )
))
(declare-datatypes ((ValueCell!4154 0))(
  ( (ValueCellFull!4154 (v!6733 V!13099)) (EmptyCell!4154) )
))
(declare-datatypes ((array!21905 0))(
  ( (array!21906 (arr!10421 (Array (_ BitVec 32) ValueCell!4154)) (size!10774 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21905)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6028 0))(
  ( (tuple2!6029 (_1!3025 (_ BitVec 64)) (_2!3025 V!13099)) )
))
(declare-datatypes ((List!5858 0))(
  ( (Nil!5855) (Cons!5854 (h!6710 tuple2!6028) (t!10999 List!5858)) )
))
(declare-datatypes ((ListLongMap!4931 0))(
  ( (ListLongMap!4932 (toList!2481 List!5858)) )
))
(declare-fun lt!174239 () ListLongMap!4931)

(declare-fun zeroValue!472 () V!13099)

(declare-fun minValue!472 () V!13099)

(declare-fun getCurrentListMap!1893 (array!21903 array!21905 (_ BitVec 32) (_ BitVec 32) V!13099 V!13099 (_ BitVec 32) Int) ListLongMap!4931)

(assert (=> b!375983 (= lt!174239 (getCurrentListMap!1893 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174235 () ListLongMap!4931)

(declare-fun lt!174238 () array!21905)

(assert (=> b!375983 (= lt!174235 (getCurrentListMap!1893 lt!174232 lt!174238 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174236 () ListLongMap!4931)

(declare-fun lt!174233 () ListLongMap!4931)

(assert (=> b!375983 (and (= lt!174236 lt!174233) (= lt!174233 lt!174236))))

(declare-fun lt!174243 () ListLongMap!4931)

(declare-fun lt!174237 () tuple2!6028)

(declare-fun +!849 (ListLongMap!4931 tuple2!6028) ListLongMap!4931)

(assert (=> b!375983 (= lt!174233 (+!849 lt!174243 lt!174237))))

(declare-fun v!373 () V!13099)

(assert (=> b!375983 (= lt!174237 (tuple2!6029 k0!778 v!373))))

(declare-datatypes ((Unit!11570 0))(
  ( (Unit!11571) )
))
(declare-fun lt!174240 () Unit!11570)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!86 (array!21903 array!21905 (_ BitVec 32) (_ BitVec 32) V!13099 V!13099 (_ BitVec 32) (_ BitVec 64) V!13099 (_ BitVec 32) Int) Unit!11570)

(assert (=> b!375983 (= lt!174240 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!86 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!758 (array!21903 array!21905 (_ BitVec 32) (_ BitVec 32) V!13099 V!13099 (_ BitVec 32) Int) ListLongMap!4931)

(assert (=> b!375983 (= lt!174236 (getCurrentListMapNoExtraKeys!758 lt!174232 lt!174238 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375983 (= lt!174238 (array!21906 (store (arr!10421 _values!506) i!548 (ValueCellFull!4154 v!373)) (size!10774 _values!506)))))

(assert (=> b!375983 (= lt!174243 (getCurrentListMapNoExtraKeys!758 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15057 () Bool)

(declare-fun mapRes!15057 () Bool)

(declare-fun tp!29756 () Bool)

(declare-fun e!228992 () Bool)

(assert (=> mapNonEmpty!15057 (= mapRes!15057 (and tp!29756 e!228992))))

(declare-fun mapValue!15057 () ValueCell!4154)

(declare-fun mapRest!15057 () (Array (_ BitVec 32) ValueCell!4154))

(declare-fun mapKey!15057 () (_ BitVec 32))

(assert (=> mapNonEmpty!15057 (= (arr!10421 _values!506) (store mapRest!15057 mapKey!15057 mapValue!15057))))

(declare-fun res!212468 () Bool)

(assert (=> start!37206 (=> (not res!212468) (not e!228987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37206 (= res!212468 (validMask!0 mask!970))))

(assert (=> start!37206 e!228987))

(declare-fun e!228985 () Bool)

(declare-fun array_inv!7684 (array!21905) Bool)

(assert (=> start!37206 (and (array_inv!7684 _values!506) e!228985)))

(assert (=> start!37206 tp!29757))

(assert (=> start!37206 true))

(declare-fun tp_is_empty!8995 () Bool)

(assert (=> start!37206 tp_is_empty!8995))

(declare-fun array_inv!7685 (array!21903) Bool)

(assert (=> start!37206 (array_inv!7685 _keys!658)))

(declare-fun b!375984 () Bool)

(declare-fun res!212476 () Bool)

(assert (=> b!375984 (=> (not res!212476) (not e!228987))))

(assert (=> b!375984 (= res!212476 (and (= (size!10774 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10773 _keys!658) (size!10774 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375985 () Bool)

(declare-fun res!212469 () Bool)

(assert (=> b!375985 (=> (not res!212469) (not e!228987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375985 (= res!212469 (validKeyInArray!0 k0!778))))

(declare-fun b!375986 () Bool)

(declare-fun res!212477 () Bool)

(assert (=> b!375986 (=> (not res!212477) (not e!228987))))

(assert (=> b!375986 (= res!212477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375987 () Bool)

(declare-fun e!228986 () Bool)

(assert (=> b!375987 (= e!228986 tp_is_empty!8995)))

(declare-fun b!375988 () Bool)

(declare-fun res!212475 () Bool)

(assert (=> b!375988 (=> (not res!212475) (not e!228987))))

(assert (=> b!375988 (= res!212475 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10773 _keys!658))))))

(declare-fun b!375989 () Bool)

(declare-fun res!212472 () Bool)

(assert (=> b!375989 (=> (not res!212472) (not e!228988))))

(assert (=> b!375989 (= res!212472 (arrayNoDuplicates!0 lt!174232 #b00000000000000000000000000000000 Nil!5854))))

(declare-fun b!375990 () Bool)

(assert (=> b!375990 (= e!228992 tp_is_empty!8995)))

(declare-fun mapIsEmpty!15057 () Bool)

(assert (=> mapIsEmpty!15057 mapRes!15057))

(declare-fun b!375991 () Bool)

(declare-fun e!228990 () Bool)

(assert (=> b!375991 (= e!228990 true)))

(declare-fun lt!174231 () ListLongMap!4931)

(declare-fun lt!174234 () ListLongMap!4931)

(assert (=> b!375991 (= lt!174231 (+!849 lt!174234 lt!174237))))

(declare-fun lt!174242 () Unit!11570)

(declare-fun addCommutativeForDiffKeys!260 (ListLongMap!4931 (_ BitVec 64) V!13099 (_ BitVec 64) V!13099) Unit!11570)

(assert (=> b!375991 (= lt!174242 (addCommutativeForDiffKeys!260 lt!174243 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375992 () Bool)

(assert (=> b!375992 (= e!228985 (and e!228986 mapRes!15057))))

(declare-fun condMapEmpty!15057 () Bool)

(declare-fun mapDefault!15057 () ValueCell!4154)

(assert (=> b!375992 (= condMapEmpty!15057 (= (arr!10421 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4154)) mapDefault!15057)))))

(declare-fun b!375993 () Bool)

(assert (=> b!375993 (= e!228991 e!228990)))

(declare-fun res!212467 () Bool)

(assert (=> b!375993 (=> res!212467 e!228990)))

(assert (=> b!375993 (= res!212467 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!375993 (= lt!174235 lt!174231)))

(declare-fun lt!174241 () tuple2!6028)

(assert (=> b!375993 (= lt!174231 (+!849 lt!174233 lt!174241))))

(assert (=> b!375993 (= lt!174239 lt!174234)))

(assert (=> b!375993 (= lt!174234 (+!849 lt!174243 lt!174241))))

(assert (=> b!375993 (= lt!174235 (+!849 lt!174236 lt!174241))))

(assert (=> b!375993 (= lt!174241 (tuple2!6029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375994 () Bool)

(declare-fun res!212471 () Bool)

(assert (=> b!375994 (=> (not res!212471) (not e!228987))))

(assert (=> b!375994 (= res!212471 (or (= (select (arr!10420 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10420 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37206 res!212468) b!375984))

(assert (= (and b!375984 res!212476) b!375986))

(assert (= (and b!375986 res!212477) b!375982))

(assert (= (and b!375982 res!212474) b!375988))

(assert (= (and b!375988 res!212475) b!375985))

(assert (= (and b!375985 res!212469) b!375994))

(assert (= (and b!375994 res!212471) b!375980))

(assert (= (and b!375980 res!212466) b!375981))

(assert (= (and b!375981 res!212473) b!375989))

(assert (= (and b!375989 res!212472) b!375983))

(assert (= (and b!375983 (not res!212470)) b!375993))

(assert (= (and b!375993 (not res!212467)) b!375991))

(assert (= (and b!375992 condMapEmpty!15057) mapIsEmpty!15057))

(assert (= (and b!375992 (not condMapEmpty!15057)) mapNonEmpty!15057))

(get-info :version)

(assert (= (and mapNonEmpty!15057 ((_ is ValueCellFull!4154) mapValue!15057)) b!375990))

(assert (= (and b!375992 ((_ is ValueCellFull!4154) mapDefault!15057)) b!375987))

(assert (= start!37206 b!375992))

(declare-fun m!372215 () Bool)

(assert (=> b!375991 m!372215))

(declare-fun m!372217 () Bool)

(assert (=> b!375991 m!372217))

(declare-fun m!372219 () Bool)

(assert (=> b!375981 m!372219))

(declare-fun m!372221 () Bool)

(assert (=> b!375981 m!372221))

(declare-fun m!372223 () Bool)

(assert (=> b!375982 m!372223))

(declare-fun m!372225 () Bool)

(assert (=> b!375994 m!372225))

(declare-fun m!372227 () Bool)

(assert (=> b!375993 m!372227))

(declare-fun m!372229 () Bool)

(assert (=> b!375993 m!372229))

(declare-fun m!372231 () Bool)

(assert (=> b!375993 m!372231))

(declare-fun m!372233 () Bool)

(assert (=> b!375980 m!372233))

(declare-fun m!372235 () Bool)

(assert (=> b!375986 m!372235))

(declare-fun m!372237 () Bool)

(assert (=> start!37206 m!372237))

(declare-fun m!372239 () Bool)

(assert (=> start!37206 m!372239))

(declare-fun m!372241 () Bool)

(assert (=> start!37206 m!372241))

(declare-fun m!372243 () Bool)

(assert (=> b!375983 m!372243))

(declare-fun m!372245 () Bool)

(assert (=> b!375983 m!372245))

(declare-fun m!372247 () Bool)

(assert (=> b!375983 m!372247))

(declare-fun m!372249 () Bool)

(assert (=> b!375983 m!372249))

(declare-fun m!372251 () Bool)

(assert (=> b!375983 m!372251))

(declare-fun m!372253 () Bool)

(assert (=> b!375983 m!372253))

(declare-fun m!372255 () Bool)

(assert (=> b!375983 m!372255))

(declare-fun m!372257 () Bool)

(assert (=> mapNonEmpty!15057 m!372257))

(declare-fun m!372259 () Bool)

(assert (=> b!375989 m!372259))

(declare-fun m!372261 () Bool)

(assert (=> b!375985 m!372261))

(check-sat (not b!375983) (not b!375993) (not b!375981) b_and!15563 tp_is_empty!8995 (not b!375980) (not b!375982) (not mapNonEmpty!15057) (not b!375985) (not start!37206) (not b!375991) (not b_next!8347) (not b!375986) (not b!375989))
(check-sat b_and!15563 (not b_next!8347))
