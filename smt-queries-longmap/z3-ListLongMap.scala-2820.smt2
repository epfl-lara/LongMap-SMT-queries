; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40886 () Bool)

(assert start!40886)

(declare-fun b_free!10821 () Bool)

(declare-fun b_next!10821 () Bool)

(assert (=> start!40886 (= b_free!10821 (not b_next!10821))))

(declare-fun tp!38290 () Bool)

(declare-fun b_and!18963 () Bool)

(assert (=> start!40886 (= tp!38290 b_and!18963)))

(declare-fun b!454097 () Bool)

(declare-fun res!270499 () Bool)

(declare-fun e!265747 () Bool)

(assert (=> b!454097 (=> (not res!270499) (not e!265747))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454097 (= res!270499 (bvsle from!863 i!563))))

(declare-fun b!454098 () Bool)

(assert (=> b!454098 (= e!265747 false)))

(declare-datatypes ((V!17317 0))(
  ( (V!17318 (val!6124 Int)) )
))
(declare-fun minValue!515 () V!17317)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5736 0))(
  ( (ValueCellFull!5736 (v!8390 V!17317)) (EmptyCell!5736) )
))
(declare-datatypes ((array!28123 0))(
  ( (array!28124 (arr!13505 (Array (_ BitVec 32) ValueCell!5736)) (size!13857 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28123)

(declare-fun zeroValue!515 () V!17317)

(declare-fun v!412 () V!17317)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28125 0))(
  ( (array!28126 (arr!13506 (Array (_ BitVec 32) (_ BitVec 64))) (size!13858 (_ BitVec 32))) )
))
(declare-fun lt!206067 () array!28125)

(declare-datatypes ((tuple2!8068 0))(
  ( (tuple2!8069 (_1!4045 (_ BitVec 64)) (_2!4045 V!17317)) )
))
(declare-datatypes ((List!8126 0))(
  ( (Nil!8123) (Cons!8122 (h!8978 tuple2!8068) (t!13954 List!8126)) )
))
(declare-datatypes ((ListLongMap!6981 0))(
  ( (ListLongMap!6982 (toList!3506 List!8126)) )
))
(declare-fun lt!206068 () ListLongMap!6981)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1689 (array!28125 array!28123 (_ BitVec 32) (_ BitVec 32) V!17317 V!17317 (_ BitVec 32) Int) ListLongMap!6981)

(assert (=> b!454098 (= lt!206068 (getCurrentListMapNoExtraKeys!1689 lt!206067 (array!28124 (store (arr!13505 _values!549) i!563 (ValueCellFull!5736 v!412)) (size!13857 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206069 () ListLongMap!6981)

(declare-fun _keys!709 () array!28125)

(assert (=> b!454098 (= lt!206069 (getCurrentListMapNoExtraKeys!1689 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454099 () Bool)

(declare-fun res!270502 () Bool)

(declare-fun e!265746 () Bool)

(assert (=> b!454099 (=> (not res!270502) (not e!265746))))

(assert (=> b!454099 (= res!270502 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13858 _keys!709))))))

(declare-fun res!270503 () Bool)

(assert (=> start!40886 (=> (not res!270503) (not e!265746))))

(assert (=> start!40886 (= res!270503 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13858 _keys!709))))))

(assert (=> start!40886 e!265746))

(declare-fun tp_is_empty!12159 () Bool)

(assert (=> start!40886 tp_is_empty!12159))

(assert (=> start!40886 tp!38290))

(assert (=> start!40886 true))

(declare-fun e!265743 () Bool)

(declare-fun array_inv!9780 (array!28123) Bool)

(assert (=> start!40886 (and (array_inv!9780 _values!549) e!265743)))

(declare-fun array_inv!9781 (array!28125) Bool)

(assert (=> start!40886 (array_inv!9781 _keys!709)))

(declare-fun mapNonEmpty!19879 () Bool)

(declare-fun mapRes!19879 () Bool)

(declare-fun tp!38289 () Bool)

(declare-fun e!265742 () Bool)

(assert (=> mapNonEmpty!19879 (= mapRes!19879 (and tp!38289 e!265742))))

(declare-fun mapRest!19879 () (Array (_ BitVec 32) ValueCell!5736))

(declare-fun mapValue!19879 () ValueCell!5736)

(declare-fun mapKey!19879 () (_ BitVec 32))

(assert (=> mapNonEmpty!19879 (= (arr!13505 _values!549) (store mapRest!19879 mapKey!19879 mapValue!19879))))

(declare-fun b!454100 () Bool)

(declare-fun res!270496 () Bool)

(assert (=> b!454100 (=> (not res!270496) (not e!265746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454100 (= res!270496 (validMask!0 mask!1025))))

(declare-fun b!454101 () Bool)

(declare-fun res!270498 () Bool)

(assert (=> b!454101 (=> (not res!270498) (not e!265746))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454101 (= res!270498 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19879 () Bool)

(assert (=> mapIsEmpty!19879 mapRes!19879))

(declare-fun b!454102 () Bool)

(declare-fun e!265745 () Bool)

(assert (=> b!454102 (= e!265745 tp_is_empty!12159)))

(declare-fun b!454103 () Bool)

(assert (=> b!454103 (= e!265743 (and e!265745 mapRes!19879))))

(declare-fun condMapEmpty!19879 () Bool)

(declare-fun mapDefault!19879 () ValueCell!5736)

(assert (=> b!454103 (= condMapEmpty!19879 (= (arr!13505 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5736)) mapDefault!19879)))))

(declare-fun b!454104 () Bool)

(assert (=> b!454104 (= e!265742 tp_is_empty!12159)))

(declare-fun b!454105 () Bool)

(declare-fun res!270493 () Bool)

(assert (=> b!454105 (=> (not res!270493) (not e!265746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28125 (_ BitVec 32)) Bool)

(assert (=> b!454105 (= res!270493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454106 () Bool)

(declare-fun res!270497 () Bool)

(assert (=> b!454106 (=> (not res!270497) (not e!265746))))

(declare-fun arrayContainsKey!0 (array!28125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454106 (= res!270497 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454107 () Bool)

(assert (=> b!454107 (= e!265746 e!265747)))

(declare-fun res!270501 () Bool)

(assert (=> b!454107 (=> (not res!270501) (not e!265747))))

(assert (=> b!454107 (= res!270501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206067 mask!1025))))

(assert (=> b!454107 (= lt!206067 (array!28126 (store (arr!13506 _keys!709) i!563 k0!794) (size!13858 _keys!709)))))

(declare-fun b!454108 () Bool)

(declare-fun res!270494 () Bool)

(assert (=> b!454108 (=> (not res!270494) (not e!265746))))

(assert (=> b!454108 (= res!270494 (and (= (size!13857 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13858 _keys!709) (size!13857 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454109 () Bool)

(declare-fun res!270495 () Bool)

(assert (=> b!454109 (=> (not res!270495) (not e!265747))))

(declare-datatypes ((List!8127 0))(
  ( (Nil!8124) (Cons!8123 (h!8979 (_ BitVec 64)) (t!13955 List!8127)) )
))
(declare-fun arrayNoDuplicates!0 (array!28125 (_ BitVec 32) List!8127) Bool)

(assert (=> b!454109 (= res!270495 (arrayNoDuplicates!0 lt!206067 #b00000000000000000000000000000000 Nil!8124))))

(declare-fun b!454110 () Bool)

(declare-fun res!270500 () Bool)

(assert (=> b!454110 (=> (not res!270500) (not e!265746))))

(assert (=> b!454110 (= res!270500 (or (= (select (arr!13506 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13506 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454111 () Bool)

(declare-fun res!270492 () Bool)

(assert (=> b!454111 (=> (not res!270492) (not e!265746))))

(assert (=> b!454111 (= res!270492 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8124))))

(assert (= (and start!40886 res!270503) b!454100))

(assert (= (and b!454100 res!270496) b!454108))

(assert (= (and b!454108 res!270494) b!454105))

(assert (= (and b!454105 res!270493) b!454111))

(assert (= (and b!454111 res!270492) b!454099))

(assert (= (and b!454099 res!270502) b!454101))

(assert (= (and b!454101 res!270498) b!454110))

(assert (= (and b!454110 res!270500) b!454106))

(assert (= (and b!454106 res!270497) b!454107))

(assert (= (and b!454107 res!270501) b!454109))

(assert (= (and b!454109 res!270495) b!454097))

(assert (= (and b!454097 res!270499) b!454098))

(assert (= (and b!454103 condMapEmpty!19879) mapIsEmpty!19879))

(assert (= (and b!454103 (not condMapEmpty!19879)) mapNonEmpty!19879))

(get-info :version)

(assert (= (and mapNonEmpty!19879 ((_ is ValueCellFull!5736) mapValue!19879)) b!454104))

(assert (= (and b!454103 ((_ is ValueCellFull!5736) mapDefault!19879)) b!454102))

(assert (= start!40886 b!454103))

(declare-fun m!438331 () Bool)

(assert (=> b!454106 m!438331))

(declare-fun m!438333 () Bool)

(assert (=> b!454111 m!438333))

(declare-fun m!438335 () Bool)

(assert (=> b!454107 m!438335))

(declare-fun m!438337 () Bool)

(assert (=> b!454107 m!438337))

(declare-fun m!438339 () Bool)

(assert (=> start!40886 m!438339))

(declare-fun m!438341 () Bool)

(assert (=> start!40886 m!438341))

(declare-fun m!438343 () Bool)

(assert (=> b!454098 m!438343))

(declare-fun m!438345 () Bool)

(assert (=> b!454098 m!438345))

(declare-fun m!438347 () Bool)

(assert (=> b!454098 m!438347))

(declare-fun m!438349 () Bool)

(assert (=> b!454100 m!438349))

(declare-fun m!438351 () Bool)

(assert (=> b!454101 m!438351))

(declare-fun m!438353 () Bool)

(assert (=> b!454110 m!438353))

(declare-fun m!438355 () Bool)

(assert (=> b!454109 m!438355))

(declare-fun m!438357 () Bool)

(assert (=> b!454105 m!438357))

(declare-fun m!438359 () Bool)

(assert (=> mapNonEmpty!19879 m!438359))

(check-sat (not mapNonEmpty!19879) (not b!454109) (not b!454100) (not b!454098) (not b!454107) (not b!454111) (not start!40886) (not b!454101) b_and!18963 (not b_next!10821) (not b!454105) tp_is_empty!12159 (not b!454106))
(check-sat b_and!18963 (not b_next!10821))
