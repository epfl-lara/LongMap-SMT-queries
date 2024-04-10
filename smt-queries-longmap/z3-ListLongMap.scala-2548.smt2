; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39108 () Bool)

(assert start!39108)

(declare-fun b_free!9375 () Bool)

(declare-fun b_next!9375 () Bool)

(assert (=> start!39108 (= b_free!9375 (not b_next!9375))))

(declare-fun tp!33654 () Bool)

(declare-fun b_and!16761 () Bool)

(assert (=> start!39108 (= tp!33654 b_and!16761)))

(declare-fun b!411042 () Bool)

(declare-fun res!238381 () Bool)

(declare-fun e!246250 () Bool)

(assert (=> b!411042 (=> (not res!238381) (not e!246250))))

(declare-datatypes ((array!24915 0))(
  ( (array!24916 (arr!11907 (Array (_ BitVec 32) (_ BitVec 64))) (size!12259 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24915)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411042 (= res!238381 (or (= (select (arr!11907 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11907 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411043 () Bool)

(declare-fun res!238379 () Bool)

(assert (=> b!411043 (=> (not res!238379) (not e!246250))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411043 (= res!238379 (validKeyInArray!0 k0!794))))

(declare-fun b!411044 () Bool)

(declare-fun res!238375 () Bool)

(declare-fun e!246251 () Bool)

(assert (=> b!411044 (=> (not res!238375) (not e!246251))))

(declare-fun lt!189203 () array!24915)

(declare-datatypes ((List!6909 0))(
  ( (Nil!6906) (Cons!6905 (h!7761 (_ BitVec 64)) (t!12083 List!6909)) )
))
(declare-fun arrayNoDuplicates!0 (array!24915 (_ BitVec 32) List!6909) Bool)

(assert (=> b!411044 (= res!238375 (arrayNoDuplicates!0 lt!189203 #b00000000000000000000000000000000 Nil!6906))))

(declare-fun b!411045 () Bool)

(declare-fun e!246247 () Bool)

(declare-fun tp_is_empty!10527 () Bool)

(assert (=> b!411045 (= e!246247 tp_is_empty!10527)))

(declare-fun b!411046 () Bool)

(declare-fun res!238377 () Bool)

(assert (=> b!411046 (=> (not res!238377) (not e!246250))))

(assert (=> b!411046 (= res!238377 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6906))))

(declare-fun b!411048 () Bool)

(declare-fun res!238382 () Bool)

(assert (=> b!411048 (=> (not res!238382) (not e!246250))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24915 (_ BitVec 32)) Bool)

(assert (=> b!411048 (= res!238382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411049 () Bool)

(declare-fun res!238383 () Bool)

(assert (=> b!411049 (=> (not res!238383) (not e!246250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411049 (= res!238383 (validMask!0 mask!1025))))

(declare-fun b!411050 () Bool)

(assert (=> b!411050 (= e!246250 e!246251)))

(declare-fun res!238380 () Bool)

(assert (=> b!411050 (=> (not res!238380) (not e!246251))))

(assert (=> b!411050 (= res!238380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189203 mask!1025))))

(assert (=> b!411050 (= lt!189203 (array!24916 (store (arr!11907 _keys!709) i!563 k0!794) (size!12259 _keys!709)))))

(declare-fun b!411051 () Bool)

(declare-fun res!238373 () Bool)

(assert (=> b!411051 (=> (not res!238373) (not e!246250))))

(declare-fun arrayContainsKey!0 (array!24915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411051 (= res!238373 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411052 () Bool)

(declare-fun e!246249 () Bool)

(assert (=> b!411052 (= e!246249 tp_is_empty!10527)))

(declare-fun b!411053 () Bool)

(declare-fun res!238372 () Bool)

(assert (=> b!411053 (=> (not res!238372) (not e!246251))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!411053 (= res!238372 (bvsle from!863 i!563))))

(declare-fun b!411054 () Bool)

(declare-fun res!238378 () Bool)

(assert (=> b!411054 (=> (not res!238378) (not e!246250))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15141 0))(
  ( (V!15142 (val!5308 Int)) )
))
(declare-datatypes ((ValueCell!4920 0))(
  ( (ValueCellFull!4920 (v!7555 V!15141)) (EmptyCell!4920) )
))
(declare-datatypes ((array!24917 0))(
  ( (array!24918 (arr!11908 (Array (_ BitVec 32) ValueCell!4920)) (size!12260 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24917)

(assert (=> b!411054 (= res!238378 (and (= (size!12260 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12259 _keys!709) (size!12260 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17412 () Bool)

(declare-fun mapRes!17412 () Bool)

(declare-fun tp!33653 () Bool)

(assert (=> mapNonEmpty!17412 (= mapRes!17412 (and tp!33653 e!246249))))

(declare-fun mapValue!17412 () ValueCell!4920)

(declare-fun mapKey!17412 () (_ BitVec 32))

(declare-fun mapRest!17412 () (Array (_ BitVec 32) ValueCell!4920))

(assert (=> mapNonEmpty!17412 (= (arr!11908 _values!549) (store mapRest!17412 mapKey!17412 mapValue!17412))))

(declare-fun res!238374 () Bool)

(assert (=> start!39108 (=> (not res!238374) (not e!246250))))

(assert (=> start!39108 (= res!238374 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12259 _keys!709))))))

(assert (=> start!39108 e!246250))

(assert (=> start!39108 tp_is_empty!10527))

(assert (=> start!39108 tp!33654))

(assert (=> start!39108 true))

(declare-fun e!246248 () Bool)

(declare-fun array_inv!8690 (array!24917) Bool)

(assert (=> start!39108 (and (array_inv!8690 _values!549) e!246248)))

(declare-fun array_inv!8691 (array!24915) Bool)

(assert (=> start!39108 (array_inv!8691 _keys!709)))

(declare-fun b!411047 () Bool)

(assert (=> b!411047 (= e!246248 (and e!246247 mapRes!17412))))

(declare-fun condMapEmpty!17412 () Bool)

(declare-fun mapDefault!17412 () ValueCell!4920)

(assert (=> b!411047 (= condMapEmpty!17412 (= (arr!11908 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4920)) mapDefault!17412)))))

(declare-fun b!411055 () Bool)

(declare-fun res!238376 () Bool)

(assert (=> b!411055 (=> (not res!238376) (not e!246250))))

(assert (=> b!411055 (= res!238376 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12259 _keys!709))))))

(declare-fun mapIsEmpty!17412 () Bool)

(assert (=> mapIsEmpty!17412 mapRes!17412))

(declare-fun b!411056 () Bool)

(assert (=> b!411056 (= e!246251 false)))

(declare-fun minValue!515 () V!15141)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15141)

(declare-datatypes ((tuple2!6884 0))(
  ( (tuple2!6885 (_1!3453 (_ BitVec 64)) (_2!3453 V!15141)) )
))
(declare-datatypes ((List!6910 0))(
  ( (Nil!6907) (Cons!6906 (h!7762 tuple2!6884) (t!12084 List!6910)) )
))
(declare-datatypes ((ListLongMap!5797 0))(
  ( (ListLongMap!5798 (toList!2914 List!6910)) )
))
(declare-fun lt!189201 () ListLongMap!5797)

(declare-fun v!412 () V!15141)

(declare-fun getCurrentListMapNoExtraKeys!1122 (array!24915 array!24917 (_ BitVec 32) (_ BitVec 32) V!15141 V!15141 (_ BitVec 32) Int) ListLongMap!5797)

(assert (=> b!411056 (= lt!189201 (getCurrentListMapNoExtraKeys!1122 lt!189203 (array!24918 (store (arr!11908 _values!549) i!563 (ValueCellFull!4920 v!412)) (size!12260 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189202 () ListLongMap!5797)

(assert (=> b!411056 (= lt!189202 (getCurrentListMapNoExtraKeys!1122 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39108 res!238374) b!411049))

(assert (= (and b!411049 res!238383) b!411054))

(assert (= (and b!411054 res!238378) b!411048))

(assert (= (and b!411048 res!238382) b!411046))

(assert (= (and b!411046 res!238377) b!411055))

(assert (= (and b!411055 res!238376) b!411043))

(assert (= (and b!411043 res!238379) b!411042))

(assert (= (and b!411042 res!238381) b!411051))

(assert (= (and b!411051 res!238373) b!411050))

(assert (= (and b!411050 res!238380) b!411044))

(assert (= (and b!411044 res!238375) b!411053))

(assert (= (and b!411053 res!238372) b!411056))

(assert (= (and b!411047 condMapEmpty!17412) mapIsEmpty!17412))

(assert (= (and b!411047 (not condMapEmpty!17412)) mapNonEmpty!17412))

(get-info :version)

(assert (= (and mapNonEmpty!17412 ((_ is ValueCellFull!4920) mapValue!17412)) b!411052))

(assert (= (and b!411047 ((_ is ValueCellFull!4920) mapDefault!17412)) b!411045))

(assert (= start!39108 b!411047))

(declare-fun m!401323 () Bool)

(assert (=> b!411051 m!401323))

(declare-fun m!401325 () Bool)

(assert (=> start!39108 m!401325))

(declare-fun m!401327 () Bool)

(assert (=> start!39108 m!401327))

(declare-fun m!401329 () Bool)

(assert (=> b!411044 m!401329))

(declare-fun m!401331 () Bool)

(assert (=> b!411056 m!401331))

(declare-fun m!401333 () Bool)

(assert (=> b!411056 m!401333))

(declare-fun m!401335 () Bool)

(assert (=> b!411056 m!401335))

(declare-fun m!401337 () Bool)

(assert (=> b!411049 m!401337))

(declare-fun m!401339 () Bool)

(assert (=> mapNonEmpty!17412 m!401339))

(declare-fun m!401341 () Bool)

(assert (=> b!411043 m!401341))

(declare-fun m!401343 () Bool)

(assert (=> b!411048 m!401343))

(declare-fun m!401345 () Bool)

(assert (=> b!411046 m!401345))

(declare-fun m!401347 () Bool)

(assert (=> b!411050 m!401347))

(declare-fun m!401349 () Bool)

(assert (=> b!411050 m!401349))

(declare-fun m!401351 () Bool)

(assert (=> b!411042 m!401351))

(check-sat b_and!16761 (not b!411044) (not b!411048) (not b!411049) (not start!39108) tp_is_empty!10527 (not b_next!9375) (not mapNonEmpty!17412) (not b!411056) (not b!411051) (not b!411043) (not b!411046) (not b!411050))
(check-sat b_and!16761 (not b_next!9375))
