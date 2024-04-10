; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36820 () Bool)

(assert start!36820)

(declare-fun b_free!7947 () Bool)

(declare-fun b_next!7947 () Bool)

(assert (=> start!36820 (= b_free!7947 (not b_next!7947))))

(declare-fun tp!28557 () Bool)

(declare-fun b_and!15189 () Bool)

(assert (=> start!36820 (= tp!28557 b_and!15189)))

(declare-fun b!368007 () Bool)

(declare-fun res!206157 () Bool)

(declare-fun e!225135 () Bool)

(assert (=> b!368007 (=> (not res!206157) (not e!225135))))

(declare-datatypes ((array!21147 0))(
  ( (array!21148 (arr!10042 (Array (_ BitVec 32) (_ BitVec 64))) (size!10394 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21147)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368007 (= res!206157 (or (= (select (arr!10042 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10042 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368008 () Bool)

(declare-fun res!206158 () Bool)

(assert (=> b!368008 (=> (not res!206158) (not e!225135))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368008 (= res!206158 (validKeyInArray!0 k0!778))))

(declare-fun b!368009 () Bool)

(declare-fun e!225137 () Bool)

(assert (=> b!368009 (= e!225135 e!225137)))

(declare-fun res!206153 () Bool)

(assert (=> b!368009 (=> (not res!206153) (not e!225137))))

(declare-fun lt!169464 () array!21147)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21147 (_ BitVec 32)) Bool)

(assert (=> b!368009 (= res!206153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169464 mask!970))))

(assert (=> b!368009 (= lt!169464 (array!21148 (store (arr!10042 _keys!658) i!548 k0!778) (size!10394 _keys!658)))))

(declare-fun b!368010 () Bool)

(declare-fun e!225133 () Bool)

(declare-fun e!225134 () Bool)

(declare-fun mapRes!14457 () Bool)

(assert (=> b!368010 (= e!225133 (and e!225134 mapRes!14457))))

(declare-fun condMapEmpty!14457 () Bool)

(declare-datatypes ((V!12565 0))(
  ( (V!12566 (val!4342 Int)) )
))
(declare-datatypes ((ValueCell!3954 0))(
  ( (ValueCellFull!3954 (v!6539 V!12565)) (EmptyCell!3954) )
))
(declare-datatypes ((array!21149 0))(
  ( (array!21150 (arr!10043 (Array (_ BitVec 32) ValueCell!3954)) (size!10395 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21149)

(declare-fun mapDefault!14457 () ValueCell!3954)

(assert (=> b!368010 (= condMapEmpty!14457 (= (arr!10043 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3954)) mapDefault!14457)))))

(declare-fun b!368011 () Bool)

(assert (=> b!368011 (= e!225137 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun zeroValue!472 () V!12565)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5750 0))(
  ( (tuple2!5751 (_1!2886 (_ BitVec 64)) (_2!2886 V!12565)) )
))
(declare-datatypes ((List!5582 0))(
  ( (Nil!5579) (Cons!5578 (h!6434 tuple2!5750) (t!10732 List!5582)) )
))
(declare-datatypes ((ListLongMap!4663 0))(
  ( (ListLongMap!4664 (toList!2347 List!5582)) )
))
(declare-fun lt!169463 () ListLongMap!4663)

(declare-fun minValue!472 () V!12565)

(declare-fun getCurrentListMapNoExtraKeys!624 (array!21147 array!21149 (_ BitVec 32) (_ BitVec 32) V!12565 V!12565 (_ BitVec 32) Int) ListLongMap!4663)

(assert (=> b!368011 (= lt!169463 (getCurrentListMapNoExtraKeys!624 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368012 () Bool)

(declare-fun tp_is_empty!8595 () Bool)

(assert (=> b!368012 (= e!225134 tp_is_empty!8595)))

(declare-fun mapIsEmpty!14457 () Bool)

(assert (=> mapIsEmpty!14457 mapRes!14457))

(declare-fun mapNonEmpty!14457 () Bool)

(declare-fun tp!28556 () Bool)

(declare-fun e!225136 () Bool)

(assert (=> mapNonEmpty!14457 (= mapRes!14457 (and tp!28556 e!225136))))

(declare-fun mapKey!14457 () (_ BitVec 32))

(declare-fun mapRest!14457 () (Array (_ BitVec 32) ValueCell!3954))

(declare-fun mapValue!14457 () ValueCell!3954)

(assert (=> mapNonEmpty!14457 (= (arr!10043 _values!506) (store mapRest!14457 mapKey!14457 mapValue!14457))))

(declare-fun b!368013 () Bool)

(declare-fun res!206159 () Bool)

(assert (=> b!368013 (=> (not res!206159) (not e!225135))))

(assert (=> b!368013 (= res!206159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!206151 () Bool)

(assert (=> start!36820 (=> (not res!206151) (not e!225135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36820 (= res!206151 (validMask!0 mask!970))))

(assert (=> start!36820 e!225135))

(assert (=> start!36820 true))

(declare-fun array_inv!7426 (array!21149) Bool)

(assert (=> start!36820 (and (array_inv!7426 _values!506) e!225133)))

(assert (=> start!36820 tp!28557))

(assert (=> start!36820 tp_is_empty!8595))

(declare-fun array_inv!7427 (array!21147) Bool)

(assert (=> start!36820 (array_inv!7427 _keys!658)))

(declare-fun b!368006 () Bool)

(declare-fun res!206156 () Bool)

(assert (=> b!368006 (=> (not res!206156) (not e!225135))))

(assert (=> b!368006 (= res!206156 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10394 _keys!658))))))

(declare-fun b!368014 () Bool)

(declare-fun res!206155 () Bool)

(assert (=> b!368014 (=> (not res!206155) (not e!225135))))

(declare-datatypes ((List!5583 0))(
  ( (Nil!5580) (Cons!5579 (h!6435 (_ BitVec 64)) (t!10733 List!5583)) )
))
(declare-fun arrayNoDuplicates!0 (array!21147 (_ BitVec 32) List!5583) Bool)

(assert (=> b!368014 (= res!206155 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5580))))

(declare-fun b!368015 () Bool)

(declare-fun res!206154 () Bool)

(assert (=> b!368015 (=> (not res!206154) (not e!225135))))

(declare-fun arrayContainsKey!0 (array!21147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368015 (= res!206154 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368016 () Bool)

(declare-fun res!206150 () Bool)

(assert (=> b!368016 (=> (not res!206150) (not e!225135))))

(assert (=> b!368016 (= res!206150 (and (= (size!10395 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10394 _keys!658) (size!10395 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368017 () Bool)

(assert (=> b!368017 (= e!225136 tp_is_empty!8595)))

(declare-fun b!368018 () Bool)

(declare-fun res!206152 () Bool)

(assert (=> b!368018 (=> (not res!206152) (not e!225137))))

(assert (=> b!368018 (= res!206152 (arrayNoDuplicates!0 lt!169464 #b00000000000000000000000000000000 Nil!5580))))

(assert (= (and start!36820 res!206151) b!368016))

(assert (= (and b!368016 res!206150) b!368013))

(assert (= (and b!368013 res!206159) b!368014))

(assert (= (and b!368014 res!206155) b!368006))

(assert (= (and b!368006 res!206156) b!368008))

(assert (= (and b!368008 res!206158) b!368007))

(assert (= (and b!368007 res!206157) b!368015))

(assert (= (and b!368015 res!206154) b!368009))

(assert (= (and b!368009 res!206153) b!368018))

(assert (= (and b!368018 res!206152) b!368011))

(assert (= (and b!368010 condMapEmpty!14457) mapIsEmpty!14457))

(assert (= (and b!368010 (not condMapEmpty!14457)) mapNonEmpty!14457))

(get-info :version)

(assert (= (and mapNonEmpty!14457 ((_ is ValueCellFull!3954) mapValue!14457)) b!368017))

(assert (= (and b!368010 ((_ is ValueCellFull!3954) mapDefault!14457)) b!368012))

(assert (= start!36820 b!368010))

(declare-fun m!364793 () Bool)

(assert (=> b!368008 m!364793))

(declare-fun m!364795 () Bool)

(assert (=> start!36820 m!364795))

(declare-fun m!364797 () Bool)

(assert (=> start!36820 m!364797))

(declare-fun m!364799 () Bool)

(assert (=> start!36820 m!364799))

(declare-fun m!364801 () Bool)

(assert (=> b!368018 m!364801))

(declare-fun m!364803 () Bool)

(assert (=> b!368014 m!364803))

(declare-fun m!364805 () Bool)

(assert (=> b!368011 m!364805))

(declare-fun m!364807 () Bool)

(assert (=> b!368009 m!364807))

(declare-fun m!364809 () Bool)

(assert (=> b!368009 m!364809))

(declare-fun m!364811 () Bool)

(assert (=> b!368007 m!364811))

(declare-fun m!364813 () Bool)

(assert (=> mapNonEmpty!14457 m!364813))

(declare-fun m!364815 () Bool)

(assert (=> b!368013 m!364815))

(declare-fun m!364817 () Bool)

(assert (=> b!368015 m!364817))

(check-sat (not start!36820) (not b!368008) (not b_next!7947) (not b!368013) (not b!368018) tp_is_empty!8595 (not b!368014) (not b!368009) (not b!368015) b_and!15189 (not b!368011) (not mapNonEmpty!14457))
(check-sat b_and!15189 (not b_next!7947))
