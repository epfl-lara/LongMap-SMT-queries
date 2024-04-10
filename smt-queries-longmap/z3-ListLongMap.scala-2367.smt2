; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37666 () Bool)

(assert start!37666)

(declare-fun b_free!8769 () Bool)

(declare-fun b_next!8769 () Bool)

(assert (=> start!37666 (= b_free!8769 (not b_next!8769))))

(declare-fun tp!31059 () Bool)

(declare-fun b_and!16011 () Bool)

(assert (=> start!37666 (= tp!31059 b_and!16011)))

(declare-fun b!385700 () Bool)

(declare-fun res!220038 () Bool)

(declare-fun e!234087 () Bool)

(assert (=> b!385700 (=> (not res!220038) (not e!234087))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13693 0))(
  ( (V!13694 (val!4765 Int)) )
))
(declare-datatypes ((ValueCell!4377 0))(
  ( (ValueCellFull!4377 (v!6962 V!13693)) (EmptyCell!4377) )
))
(declare-datatypes ((array!22781 0))(
  ( (array!22782 (arr!10859 (Array (_ BitVec 32) ValueCell!4377)) (size!11211 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22781)

(declare-datatypes ((array!22783 0))(
  ( (array!22784 (arr!10860 (Array (_ BitVec 32) (_ BitVec 64))) (size!11212 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22783)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!385700 (= res!220038 (and (= (size!11211 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11212 _keys!658) (size!11211 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385701 () Bool)

(declare-fun e!234090 () Bool)

(assert (=> b!385701 (= e!234090 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6406 0))(
  ( (tuple2!6407 (_1!3214 (_ BitVec 64)) (_2!3214 V!13693)) )
))
(declare-datatypes ((List!6252 0))(
  ( (Nil!6249) (Cons!6248 (h!7104 tuple2!6406) (t!11402 List!6252)) )
))
(declare-datatypes ((ListLongMap!5319 0))(
  ( (ListLongMap!5320 (toList!2675 List!6252)) )
))
(declare-fun lt!181649 () ListLongMap!5319)

(declare-fun zeroValue!472 () V!13693)

(declare-fun minValue!472 () V!13693)

(declare-fun getCurrentListMapNoExtraKeys!904 (array!22783 array!22781 (_ BitVec 32) (_ BitVec 32) V!13693 V!13693 (_ BitVec 32) Int) ListLongMap!5319)

(assert (=> b!385701 (= lt!181649 (getCurrentListMapNoExtraKeys!904 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15726 () Bool)

(declare-fun mapRes!15726 () Bool)

(declare-fun tp!31058 () Bool)

(declare-fun e!234091 () Bool)

(assert (=> mapNonEmpty!15726 (= mapRes!15726 (and tp!31058 e!234091))))

(declare-fun mapKey!15726 () (_ BitVec 32))

(declare-fun mapRest!15726 () (Array (_ BitVec 32) ValueCell!4377))

(declare-fun mapValue!15726 () ValueCell!4377)

(assert (=> mapNonEmpty!15726 (= (arr!10859 _values!506) (store mapRest!15726 mapKey!15726 mapValue!15726))))

(declare-fun b!385702 () Bool)

(declare-fun res!220041 () Bool)

(assert (=> b!385702 (=> (not res!220041) (not e!234087))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385702 (= res!220041 (validKeyInArray!0 k0!778))))

(declare-fun b!385703 () Bool)

(declare-fun tp_is_empty!9441 () Bool)

(assert (=> b!385703 (= e!234091 tp_is_empty!9441)))

(declare-fun mapIsEmpty!15726 () Bool)

(assert (=> mapIsEmpty!15726 mapRes!15726))

(declare-fun b!385704 () Bool)

(declare-fun res!220042 () Bool)

(assert (=> b!385704 (=> (not res!220042) (not e!234087))))

(declare-fun arrayContainsKey!0 (array!22783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385704 (= res!220042 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385705 () Bool)

(declare-fun res!220046 () Bool)

(assert (=> b!385705 (=> (not res!220046) (not e!234087))))

(declare-datatypes ((List!6253 0))(
  ( (Nil!6250) (Cons!6249 (h!7105 (_ BitVec 64)) (t!11403 List!6253)) )
))
(declare-fun arrayNoDuplicates!0 (array!22783 (_ BitVec 32) List!6253) Bool)

(assert (=> b!385705 (= res!220046 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6250))))

(declare-fun b!385707 () Bool)

(declare-fun res!220043 () Bool)

(assert (=> b!385707 (=> (not res!220043) (not e!234090))))

(declare-fun lt!181650 () array!22783)

(assert (=> b!385707 (= res!220043 (arrayNoDuplicates!0 lt!181650 #b00000000000000000000000000000000 Nil!6250))))

(declare-fun b!385708 () Bool)

(declare-fun res!220044 () Bool)

(assert (=> b!385708 (=> (not res!220044) (not e!234087))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385708 (= res!220044 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11212 _keys!658))))))

(declare-fun b!385709 () Bool)

(declare-fun res!220039 () Bool)

(assert (=> b!385709 (=> (not res!220039) (not e!234087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22783 (_ BitVec 32)) Bool)

(assert (=> b!385709 (= res!220039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385710 () Bool)

(declare-fun e!234092 () Bool)

(assert (=> b!385710 (= e!234092 tp_is_empty!9441)))

(declare-fun b!385706 () Bool)

(declare-fun e!234089 () Bool)

(assert (=> b!385706 (= e!234089 (and e!234092 mapRes!15726))))

(declare-fun condMapEmpty!15726 () Bool)

(declare-fun mapDefault!15726 () ValueCell!4377)

(assert (=> b!385706 (= condMapEmpty!15726 (= (arr!10859 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4377)) mapDefault!15726)))))

(declare-fun res!220040 () Bool)

(assert (=> start!37666 (=> (not res!220040) (not e!234087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37666 (= res!220040 (validMask!0 mask!970))))

(assert (=> start!37666 e!234087))

(assert (=> start!37666 true))

(declare-fun array_inv!7994 (array!22781) Bool)

(assert (=> start!37666 (and (array_inv!7994 _values!506) e!234089)))

(assert (=> start!37666 tp!31059))

(assert (=> start!37666 tp_is_empty!9441))

(declare-fun array_inv!7995 (array!22783) Bool)

(assert (=> start!37666 (array_inv!7995 _keys!658)))

(declare-fun b!385711 () Bool)

(assert (=> b!385711 (= e!234087 e!234090)))

(declare-fun res!220037 () Bool)

(assert (=> b!385711 (=> (not res!220037) (not e!234090))))

(assert (=> b!385711 (= res!220037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181650 mask!970))))

(assert (=> b!385711 (= lt!181650 (array!22784 (store (arr!10860 _keys!658) i!548 k0!778) (size!11212 _keys!658)))))

(declare-fun b!385712 () Bool)

(declare-fun res!220045 () Bool)

(assert (=> b!385712 (=> (not res!220045) (not e!234087))))

(assert (=> b!385712 (= res!220045 (or (= (select (arr!10860 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10860 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37666 res!220040) b!385700))

(assert (= (and b!385700 res!220038) b!385709))

(assert (= (and b!385709 res!220039) b!385705))

(assert (= (and b!385705 res!220046) b!385708))

(assert (= (and b!385708 res!220044) b!385702))

(assert (= (and b!385702 res!220041) b!385712))

(assert (= (and b!385712 res!220045) b!385704))

(assert (= (and b!385704 res!220042) b!385711))

(assert (= (and b!385711 res!220037) b!385707))

(assert (= (and b!385707 res!220043) b!385701))

(assert (= (and b!385706 condMapEmpty!15726) mapIsEmpty!15726))

(assert (= (and b!385706 (not condMapEmpty!15726)) mapNonEmpty!15726))

(get-info :version)

(assert (= (and mapNonEmpty!15726 ((_ is ValueCellFull!4377) mapValue!15726)) b!385703))

(assert (= (and b!385706 ((_ is ValueCellFull!4377) mapDefault!15726)) b!385710))

(assert (= start!37666 b!385706))

(declare-fun m!382235 () Bool)

(assert (=> b!385707 m!382235))

(declare-fun m!382237 () Bool)

(assert (=> b!385709 m!382237))

(declare-fun m!382239 () Bool)

(assert (=> b!385705 m!382239))

(declare-fun m!382241 () Bool)

(assert (=> mapNonEmpty!15726 m!382241))

(declare-fun m!382243 () Bool)

(assert (=> b!385711 m!382243))

(declare-fun m!382245 () Bool)

(assert (=> b!385711 m!382245))

(declare-fun m!382247 () Bool)

(assert (=> b!385712 m!382247))

(declare-fun m!382249 () Bool)

(assert (=> b!385704 m!382249))

(declare-fun m!382251 () Bool)

(assert (=> b!385702 m!382251))

(declare-fun m!382253 () Bool)

(assert (=> b!385701 m!382253))

(declare-fun m!382255 () Bool)

(assert (=> start!37666 m!382255))

(declare-fun m!382257 () Bool)

(assert (=> start!37666 m!382257))

(declare-fun m!382259 () Bool)

(assert (=> start!37666 m!382259))

(check-sat (not b!385704) (not b!385711) (not b!385705) (not b!385707) (not b_next!8769) (not mapNonEmpty!15726) b_and!16011 (not b!385702) tp_is_empty!9441 (not start!37666) (not b!385701) (not b!385709))
(check-sat b_and!16011 (not b_next!8769))
