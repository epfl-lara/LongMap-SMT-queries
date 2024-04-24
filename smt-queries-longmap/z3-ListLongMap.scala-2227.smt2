; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36810 () Bool)

(assert start!36810)

(declare-fun b_free!7951 () Bool)

(declare-fun b_next!7951 () Bool)

(assert (=> start!36810 (= b_free!7951 (not b_next!7951))))

(declare-fun tp!28568 () Bool)

(declare-fun b_and!15207 () Bool)

(assert (=> start!36810 (= tp!28568 b_and!15207)))

(declare-fun mapNonEmpty!14463 () Bool)

(declare-fun mapRes!14463 () Bool)

(declare-fun tp!28569 () Bool)

(declare-fun e!225136 () Bool)

(assert (=> mapNonEmpty!14463 (= mapRes!14463 (and tp!28569 e!225136))))

(declare-datatypes ((V!12571 0))(
  ( (V!12572 (val!4344 Int)) )
))
(declare-datatypes ((ValueCell!3956 0))(
  ( (ValueCellFull!3956 (v!6542 V!12571)) (EmptyCell!3956) )
))
(declare-datatypes ((array!21134 0))(
  ( (array!21135 (arr!10035 (Array (_ BitVec 32) ValueCell!3956)) (size!10387 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21134)

(declare-fun mapKey!14463 () (_ BitVec 32))

(declare-fun mapRest!14463 () (Array (_ BitVec 32) ValueCell!3956))

(declare-fun mapValue!14463 () ValueCell!3956)

(assert (=> mapNonEmpty!14463 (= (arr!10035 _values!506) (store mapRest!14463 mapKey!14463 mapValue!14463))))

(declare-fun b!368036 () Bool)

(declare-fun e!225137 () Bool)

(assert (=> b!368036 (= e!225137 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5674 0))(
  ( (tuple2!5675 (_1!2848 (_ BitVec 64)) (_2!2848 V!12571)) )
))
(declare-datatypes ((List!5493 0))(
  ( (Nil!5490) (Cons!5489 (h!6345 tuple2!5674) (t!10635 List!5493)) )
))
(declare-datatypes ((ListLongMap!4589 0))(
  ( (ListLongMap!4590 (toList!2310 List!5493)) )
))
(declare-fun lt!169495 () ListLongMap!4589)

(declare-fun zeroValue!472 () V!12571)

(declare-datatypes ((array!21136 0))(
  ( (array!21137 (arr!10036 (Array (_ BitVec 32) (_ BitVec 64))) (size!10388 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21136)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12571)

(declare-fun getCurrentListMapNoExtraKeys!619 (array!21136 array!21134 (_ BitVec 32) (_ BitVec 32) V!12571 V!12571 (_ BitVec 32) Int) ListLongMap!4589)

(assert (=> b!368036 (= lt!169495 (getCurrentListMapNoExtraKeys!619 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368037 () Bool)

(declare-fun res!206214 () Bool)

(declare-fun e!225138 () Bool)

(assert (=> b!368037 (=> (not res!206214) (not e!225138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21136 (_ BitVec 32)) Bool)

(assert (=> b!368037 (= res!206214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368038 () Bool)

(assert (=> b!368038 (= e!225138 e!225137)))

(declare-fun res!206210 () Bool)

(assert (=> b!368038 (=> (not res!206210) (not e!225137))))

(declare-fun lt!169494 () array!21136)

(assert (=> b!368038 (= res!206210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169494 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368038 (= lt!169494 (array!21137 (store (arr!10036 _keys!658) i!548 k0!778) (size!10388 _keys!658)))))

(declare-fun b!368039 () Bool)

(declare-fun res!206212 () Bool)

(assert (=> b!368039 (=> (not res!206212) (not e!225138))))

(declare-datatypes ((List!5494 0))(
  ( (Nil!5491) (Cons!5490 (h!6346 (_ BitVec 64)) (t!10636 List!5494)) )
))
(declare-fun arrayNoDuplicates!0 (array!21136 (_ BitVec 32) List!5494) Bool)

(assert (=> b!368039 (= res!206212 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5491))))

(declare-fun b!368040 () Bool)

(declare-fun res!206213 () Bool)

(assert (=> b!368040 (=> (not res!206213) (not e!225137))))

(assert (=> b!368040 (= res!206213 (arrayNoDuplicates!0 lt!169494 #b00000000000000000000000000000000 Nil!5491))))

(declare-fun b!368041 () Bool)

(declare-fun tp_is_empty!8599 () Bool)

(assert (=> b!368041 (= e!225136 tp_is_empty!8599)))

(declare-fun mapIsEmpty!14463 () Bool)

(assert (=> mapIsEmpty!14463 mapRes!14463))

(declare-fun res!206208 () Bool)

(assert (=> start!36810 (=> (not res!206208) (not e!225138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36810 (= res!206208 (validMask!0 mask!970))))

(assert (=> start!36810 e!225138))

(assert (=> start!36810 true))

(declare-fun e!225141 () Bool)

(declare-fun array_inv!7452 (array!21134) Bool)

(assert (=> start!36810 (and (array_inv!7452 _values!506) e!225141)))

(assert (=> start!36810 tp!28568))

(assert (=> start!36810 tp_is_empty!8599))

(declare-fun array_inv!7453 (array!21136) Bool)

(assert (=> start!36810 (array_inv!7453 _keys!658)))

(declare-fun b!368035 () Bool)

(declare-fun res!206215 () Bool)

(assert (=> b!368035 (=> (not res!206215) (not e!225138))))

(declare-fun arrayContainsKey!0 (array!21136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368035 (= res!206215 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368042 () Bool)

(declare-fun e!225139 () Bool)

(assert (=> b!368042 (= e!225139 tp_is_empty!8599)))

(declare-fun b!368043 () Bool)

(declare-fun res!206216 () Bool)

(assert (=> b!368043 (=> (not res!206216) (not e!225138))))

(assert (=> b!368043 (= res!206216 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10388 _keys!658))))))

(declare-fun b!368044 () Bool)

(assert (=> b!368044 (= e!225141 (and e!225139 mapRes!14463))))

(declare-fun condMapEmpty!14463 () Bool)

(declare-fun mapDefault!14463 () ValueCell!3956)

(assert (=> b!368044 (= condMapEmpty!14463 (= (arr!10035 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3956)) mapDefault!14463)))))

(declare-fun b!368045 () Bool)

(declare-fun res!206209 () Bool)

(assert (=> b!368045 (=> (not res!206209) (not e!225138))))

(assert (=> b!368045 (= res!206209 (or (= (select (arr!10036 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10036 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368046 () Bool)

(declare-fun res!206207 () Bool)

(assert (=> b!368046 (=> (not res!206207) (not e!225138))))

(assert (=> b!368046 (= res!206207 (and (= (size!10387 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10388 _keys!658) (size!10387 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368047 () Bool)

(declare-fun res!206211 () Bool)

(assert (=> b!368047 (=> (not res!206211) (not e!225138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368047 (= res!206211 (validKeyInArray!0 k0!778))))

(assert (= (and start!36810 res!206208) b!368046))

(assert (= (and b!368046 res!206207) b!368037))

(assert (= (and b!368037 res!206214) b!368039))

(assert (= (and b!368039 res!206212) b!368043))

(assert (= (and b!368043 res!206216) b!368047))

(assert (= (and b!368047 res!206211) b!368045))

(assert (= (and b!368045 res!206209) b!368035))

(assert (= (and b!368035 res!206215) b!368038))

(assert (= (and b!368038 res!206210) b!368040))

(assert (= (and b!368040 res!206213) b!368036))

(assert (= (and b!368044 condMapEmpty!14463) mapIsEmpty!14463))

(assert (= (and b!368044 (not condMapEmpty!14463)) mapNonEmpty!14463))

(get-info :version)

(assert (= (and mapNonEmpty!14463 ((_ is ValueCellFull!3956) mapValue!14463)) b!368041))

(assert (= (and b!368044 ((_ is ValueCellFull!3956) mapDefault!14463)) b!368042))

(assert (= start!36810 b!368044))

(declare-fun m!365075 () Bool)

(assert (=> b!368036 m!365075))

(declare-fun m!365077 () Bool)

(assert (=> b!368038 m!365077))

(declare-fun m!365079 () Bool)

(assert (=> b!368038 m!365079))

(declare-fun m!365081 () Bool)

(assert (=> b!368037 m!365081))

(declare-fun m!365083 () Bool)

(assert (=> b!368039 m!365083))

(declare-fun m!365085 () Bool)

(assert (=> b!368047 m!365085))

(declare-fun m!365087 () Bool)

(assert (=> b!368035 m!365087))

(declare-fun m!365089 () Bool)

(assert (=> mapNonEmpty!14463 m!365089))

(declare-fun m!365091 () Bool)

(assert (=> start!36810 m!365091))

(declare-fun m!365093 () Bool)

(assert (=> start!36810 m!365093))

(declare-fun m!365095 () Bool)

(assert (=> start!36810 m!365095))

(declare-fun m!365097 () Bool)

(assert (=> b!368040 m!365097))

(declare-fun m!365099 () Bool)

(assert (=> b!368045 m!365099))

(check-sat b_and!15207 (not b!368037) (not b!368038) (not b!368047) tp_is_empty!8599 (not b!368040) (not start!36810) (not b!368036) (not mapNonEmpty!14463) (not b!368039) (not b_next!7951) (not b!368035))
(check-sat b_and!15207 (not b_next!7951))
