; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36828 () Bool)

(assert start!36828)

(declare-fun b_free!7969 () Bool)

(declare-fun b_next!7969 () Bool)

(assert (=> start!36828 (= b_free!7969 (not b_next!7969))))

(declare-fun tp!28623 () Bool)

(declare-fun b_and!15185 () Bool)

(assert (=> start!36828 (= tp!28623 b_and!15185)))

(declare-fun mapNonEmpty!14490 () Bool)

(declare-fun mapRes!14490 () Bool)

(declare-fun tp!28622 () Bool)

(declare-fun e!225161 () Bool)

(assert (=> mapNonEmpty!14490 (= mapRes!14490 (and tp!28622 e!225161))))

(declare-fun mapKey!14490 () (_ BitVec 32))

(declare-datatypes ((V!12595 0))(
  ( (V!12596 (val!4353 Int)) )
))
(declare-datatypes ((ValueCell!3965 0))(
  ( (ValueCellFull!3965 (v!6544 V!12595)) (EmptyCell!3965) )
))
(declare-datatypes ((array!21171 0))(
  ( (array!21172 (arr!10054 (Array (_ BitVec 32) ValueCell!3965)) (size!10407 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21171)

(declare-fun mapValue!14490 () ValueCell!3965)

(declare-fun mapRest!14490 () (Array (_ BitVec 32) ValueCell!3965))

(assert (=> mapNonEmpty!14490 (= (arr!10054 _values!506) (store mapRest!14490 mapKey!14490 mapValue!14490))))

(declare-fun b!368164 () Bool)

(declare-fun res!206358 () Bool)

(declare-fun e!225156 () Bool)

(assert (=> b!368164 (=> (not res!206358) (not e!225156))))

(declare-datatypes ((array!21173 0))(
  ( (array!21174 (arr!10055 (Array (_ BitVec 32) (_ BitVec 64))) (size!10408 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21173)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368164 (= res!206358 (and (= (size!10407 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10408 _keys!658) (size!10407 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368165 () Bool)

(declare-fun res!206352 () Bool)

(assert (=> b!368165 (=> (not res!206352) (not e!225156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21173 (_ BitVec 32)) Bool)

(assert (=> b!368165 (= res!206352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368166 () Bool)

(declare-fun res!206357 () Bool)

(assert (=> b!368166 (=> (not res!206357) (not e!225156))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368166 (= res!206357 (or (= (select (arr!10055 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10055 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368167 () Bool)

(declare-fun tp_is_empty!8617 () Bool)

(assert (=> b!368167 (= e!225161 tp_is_empty!8617)))

(declare-fun b!368168 () Bool)

(declare-fun res!206353 () Bool)

(assert (=> b!368168 (=> (not res!206353) (not e!225156))))

(declare-datatypes ((List!5566 0))(
  ( (Nil!5563) (Cons!5562 (h!6418 (_ BitVec 64)) (t!10707 List!5566)) )
))
(declare-fun arrayNoDuplicates!0 (array!21173 (_ BitVec 32) List!5566) Bool)

(assert (=> b!368168 (= res!206353 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5563))))

(declare-fun b!368169 () Bool)

(declare-fun res!206355 () Bool)

(assert (=> b!368169 (=> (not res!206355) (not e!225156))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368169 (= res!206355 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!206354 () Bool)

(assert (=> start!36828 (=> (not res!206354) (not e!225156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36828 (= res!206354 (validMask!0 mask!970))))

(assert (=> start!36828 e!225156))

(assert (=> start!36828 true))

(declare-fun e!225157 () Bool)

(declare-fun array_inv!7446 (array!21171) Bool)

(assert (=> start!36828 (and (array_inv!7446 _values!506) e!225157)))

(assert (=> start!36828 tp!28623))

(assert (=> start!36828 tp_is_empty!8617))

(declare-fun array_inv!7447 (array!21173) Bool)

(assert (=> start!36828 (array_inv!7447 _keys!658)))

(declare-fun b!368170 () Bool)

(declare-fun res!206351 () Bool)

(assert (=> b!368170 (=> (not res!206351) (not e!225156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368170 (= res!206351 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14490 () Bool)

(assert (=> mapIsEmpty!14490 mapRes!14490))

(declare-fun b!368171 () Bool)

(declare-fun res!206360 () Bool)

(declare-fun e!225160 () Bool)

(assert (=> b!368171 (=> (not res!206360) (not e!225160))))

(declare-fun lt!169296 () array!21173)

(assert (=> b!368171 (= res!206360 (arrayNoDuplicates!0 lt!169296 #b00000000000000000000000000000000 Nil!5563))))

(declare-fun b!368172 () Bool)

(declare-fun e!225159 () Bool)

(assert (=> b!368172 (= e!225159 tp_is_empty!8617)))

(declare-fun b!368173 () Bool)

(declare-fun res!206356 () Bool)

(assert (=> b!368173 (=> (not res!206356) (not e!225156))))

(assert (=> b!368173 (= res!206356 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10408 _keys!658))))))

(declare-fun b!368174 () Bool)

(assert (=> b!368174 (= e!225160 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5738 0))(
  ( (tuple2!5739 (_1!2880 (_ BitVec 64)) (_2!2880 V!12595)) )
))
(declare-datatypes ((List!5567 0))(
  ( (Nil!5564) (Cons!5563 (h!6419 tuple2!5738) (t!10708 List!5567)) )
))
(declare-datatypes ((ListLongMap!4641 0))(
  ( (ListLongMap!4642 (toList!2336 List!5567)) )
))
(declare-fun lt!169295 () ListLongMap!4641)

(declare-fun zeroValue!472 () V!12595)

(declare-fun minValue!472 () V!12595)

(declare-fun getCurrentListMapNoExtraKeys!627 (array!21173 array!21171 (_ BitVec 32) (_ BitVec 32) V!12595 V!12595 (_ BitVec 32) Int) ListLongMap!4641)

(assert (=> b!368174 (= lt!169295 (getCurrentListMapNoExtraKeys!627 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368175 () Bool)

(assert (=> b!368175 (= e!225157 (and e!225159 mapRes!14490))))

(declare-fun condMapEmpty!14490 () Bool)

(declare-fun mapDefault!14490 () ValueCell!3965)

(assert (=> b!368175 (= condMapEmpty!14490 (= (arr!10054 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3965)) mapDefault!14490)))))

(declare-fun b!368176 () Bool)

(assert (=> b!368176 (= e!225156 e!225160)))

(declare-fun res!206359 () Bool)

(assert (=> b!368176 (=> (not res!206359) (not e!225160))))

(assert (=> b!368176 (= res!206359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169296 mask!970))))

(assert (=> b!368176 (= lt!169296 (array!21174 (store (arr!10055 _keys!658) i!548 k0!778) (size!10408 _keys!658)))))

(assert (= (and start!36828 res!206354) b!368164))

(assert (= (and b!368164 res!206358) b!368165))

(assert (= (and b!368165 res!206352) b!368168))

(assert (= (and b!368168 res!206353) b!368173))

(assert (= (and b!368173 res!206356) b!368170))

(assert (= (and b!368170 res!206351) b!368166))

(assert (= (and b!368166 res!206357) b!368169))

(assert (= (and b!368169 res!206355) b!368176))

(assert (= (and b!368176 res!206359) b!368171))

(assert (= (and b!368171 res!206360) b!368174))

(assert (= (and b!368175 condMapEmpty!14490) mapIsEmpty!14490))

(assert (= (and b!368175 (not condMapEmpty!14490)) mapNonEmpty!14490))

(get-info :version)

(assert (= (and mapNonEmpty!14490 ((_ is ValueCellFull!3965) mapValue!14490)) b!368167))

(assert (= (and b!368175 ((_ is ValueCellFull!3965) mapDefault!14490)) b!368172))

(assert (= start!36828 b!368175))

(declare-fun m!364355 () Bool)

(assert (=> mapNonEmpty!14490 m!364355))

(declare-fun m!364357 () Bool)

(assert (=> b!368168 m!364357))

(declare-fun m!364359 () Bool)

(assert (=> start!36828 m!364359))

(declare-fun m!364361 () Bool)

(assert (=> start!36828 m!364361))

(declare-fun m!364363 () Bool)

(assert (=> start!36828 m!364363))

(declare-fun m!364365 () Bool)

(assert (=> b!368169 m!364365))

(declare-fun m!364367 () Bool)

(assert (=> b!368170 m!364367))

(declare-fun m!364369 () Bool)

(assert (=> b!368176 m!364369))

(declare-fun m!364371 () Bool)

(assert (=> b!368176 m!364371))

(declare-fun m!364373 () Bool)

(assert (=> b!368171 m!364373))

(declare-fun m!364375 () Bool)

(assert (=> b!368165 m!364375))

(declare-fun m!364377 () Bool)

(assert (=> b!368174 m!364377))

(declare-fun m!364379 () Bool)

(assert (=> b!368166 m!364379))

(check-sat (not b!368174) (not b!368176) tp_is_empty!8617 (not start!36828) (not b!368165) b_and!15185 (not b!368171) (not b!368170) (not mapNonEmpty!14490) (not b!368168) (not b!368169) (not b_next!7969))
(check-sat b_and!15185 (not b_next!7969))
