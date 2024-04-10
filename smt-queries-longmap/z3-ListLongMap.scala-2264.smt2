; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37048 () Bool)

(assert start!37048)

(declare-fun b_free!8175 () Bool)

(declare-fun b_next!8175 () Bool)

(assert (=> start!37048 (= b_free!8175 (not b_next!8175))))

(declare-fun tp!29240 () Bool)

(declare-fun b_and!15417 () Bool)

(assert (=> start!37048 (= tp!29240 b_and!15417)))

(declare-fun b!372452 () Bool)

(declare-fun res!209573 () Bool)

(declare-fun e!227185 () Bool)

(assert (=> b!372452 (=> (not res!209573) (not e!227185))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372452 (= res!209573 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14799 () Bool)

(declare-fun mapRes!14799 () Bool)

(declare-fun tp!29241 () Bool)

(declare-fun e!227186 () Bool)

(assert (=> mapNonEmpty!14799 (= mapRes!14799 (and tp!29241 e!227186))))

(declare-datatypes ((V!12869 0))(
  ( (V!12870 (val!4456 Int)) )
))
(declare-datatypes ((ValueCell!4068 0))(
  ( (ValueCellFull!4068 (v!6653 V!12869)) (EmptyCell!4068) )
))
(declare-datatypes ((array!21587 0))(
  ( (array!21588 (arr!10262 (Array (_ BitVec 32) ValueCell!4068)) (size!10614 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21587)

(declare-fun mapValue!14799 () ValueCell!4068)

(declare-fun mapRest!14799 () (Array (_ BitVec 32) ValueCell!4068))

(declare-fun mapKey!14799 () (_ BitVec 32))

(assert (=> mapNonEmpty!14799 (= (arr!10262 _values!506) (store mapRest!14799 mapKey!14799 mapValue!14799))))

(declare-fun b!372453 () Bool)

(declare-fun res!209579 () Bool)

(assert (=> b!372453 (=> (not res!209579) (not e!227185))))

(declare-datatypes ((array!21589 0))(
  ( (array!21590 (arr!10263 (Array (_ BitVec 32) (_ BitVec 64))) (size!10615 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21589)

(declare-datatypes ((List!5753 0))(
  ( (Nil!5750) (Cons!5749 (h!6605 (_ BitVec 64)) (t!10903 List!5753)) )
))
(declare-fun arrayNoDuplicates!0 (array!21589 (_ BitVec 32) List!5753) Bool)

(assert (=> b!372453 (= res!209579 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5750))))

(declare-fun b!372454 () Bool)

(declare-fun res!209578 () Bool)

(assert (=> b!372454 (=> (not res!209578) (not e!227185))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21589 (_ BitVec 32)) Bool)

(assert (=> b!372454 (= res!209578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372455 () Bool)

(declare-fun e!227189 () Bool)

(assert (=> b!372455 (= e!227185 e!227189)))

(declare-fun res!209570 () Bool)

(assert (=> b!372455 (=> (not res!209570) (not e!227189))))

(declare-fun lt!170760 () array!21589)

(assert (=> b!372455 (= res!209570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170760 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372455 (= lt!170760 (array!21590 (store (arr!10263 _keys!658) i!548 k0!778) (size!10615 _keys!658)))))

(declare-fun mapIsEmpty!14799 () Bool)

(assert (=> mapIsEmpty!14799 mapRes!14799))

(declare-fun b!372456 () Bool)

(declare-fun res!209571 () Bool)

(assert (=> b!372456 (=> (not res!209571) (not e!227185))))

(assert (=> b!372456 (= res!209571 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10615 _keys!658))))))

(declare-fun b!372457 () Bool)

(declare-fun e!227184 () Bool)

(declare-fun e!227188 () Bool)

(assert (=> b!372457 (= e!227184 (and e!227188 mapRes!14799))))

(declare-fun condMapEmpty!14799 () Bool)

(declare-fun mapDefault!14799 () ValueCell!4068)

(assert (=> b!372457 (= condMapEmpty!14799 (= (arr!10262 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4068)) mapDefault!14799)))))

(declare-fun b!372458 () Bool)

(declare-fun res!209576 () Bool)

(assert (=> b!372458 (=> (not res!209576) (not e!227189))))

(assert (=> b!372458 (= res!209576 (arrayNoDuplicates!0 lt!170760 #b00000000000000000000000000000000 Nil!5750))))

(declare-fun b!372459 () Bool)

(declare-fun tp_is_empty!8823 () Bool)

(assert (=> b!372459 (= e!227188 tp_is_empty!8823)))

(declare-fun b!372460 () Bool)

(assert (=> b!372460 (= e!227189 (not true))))

(declare-datatypes ((tuple2!5908 0))(
  ( (tuple2!5909 (_1!2965 (_ BitVec 64)) (_2!2965 V!12869)) )
))
(declare-datatypes ((List!5754 0))(
  ( (Nil!5751) (Cons!5750 (h!6606 tuple2!5908) (t!10904 List!5754)) )
))
(declare-datatypes ((ListLongMap!4821 0))(
  ( (ListLongMap!4822 (toList!2426 List!5754)) )
))
(declare-fun lt!170757 () ListLongMap!4821)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170759 () array!21587)

(declare-fun zeroValue!472 () V!12869)

(declare-fun minValue!472 () V!12869)

(declare-fun getCurrentListMap!1869 (array!21589 array!21587 (_ BitVec 32) (_ BitVec 32) V!12869 V!12869 (_ BitVec 32) Int) ListLongMap!4821)

(assert (=> b!372460 (= lt!170757 (getCurrentListMap!1869 lt!170760 lt!170759 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170758 () ListLongMap!4821)

(declare-fun lt!170762 () ListLongMap!4821)

(assert (=> b!372460 (and (= lt!170758 lt!170762) (= lt!170762 lt!170758))))

(declare-fun v!373 () V!12869)

(declare-fun lt!170761 () ListLongMap!4821)

(declare-fun +!772 (ListLongMap!4821 tuple2!5908) ListLongMap!4821)

(assert (=> b!372460 (= lt!170762 (+!772 lt!170761 (tuple2!5909 k0!778 v!373)))))

(declare-datatypes ((Unit!11450 0))(
  ( (Unit!11451) )
))
(declare-fun lt!170763 () Unit!11450)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!27 (array!21589 array!21587 (_ BitVec 32) (_ BitVec 32) V!12869 V!12869 (_ BitVec 32) (_ BitVec 64) V!12869 (_ BitVec 32) Int) Unit!11450)

(assert (=> b!372460 (= lt!170763 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!27 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!703 (array!21589 array!21587 (_ BitVec 32) (_ BitVec 32) V!12869 V!12869 (_ BitVec 32) Int) ListLongMap!4821)

(assert (=> b!372460 (= lt!170758 (getCurrentListMapNoExtraKeys!703 lt!170760 lt!170759 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372460 (= lt!170759 (array!21588 (store (arr!10262 _values!506) i!548 (ValueCellFull!4068 v!373)) (size!10614 _values!506)))))

(assert (=> b!372460 (= lt!170761 (getCurrentListMapNoExtraKeys!703 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372461 () Bool)

(declare-fun res!209577 () Bool)

(assert (=> b!372461 (=> (not res!209577) (not e!227185))))

(declare-fun arrayContainsKey!0 (array!21589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372461 (= res!209577 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372462 () Bool)

(assert (=> b!372462 (= e!227186 tp_is_empty!8823)))

(declare-fun b!372463 () Bool)

(declare-fun res!209572 () Bool)

(assert (=> b!372463 (=> (not res!209572) (not e!227185))))

(assert (=> b!372463 (= res!209572 (or (= (select (arr!10263 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10263 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372464 () Bool)

(declare-fun res!209575 () Bool)

(assert (=> b!372464 (=> (not res!209575) (not e!227185))))

(assert (=> b!372464 (= res!209575 (and (= (size!10614 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10615 _keys!658) (size!10614 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!209574 () Bool)

(assert (=> start!37048 (=> (not res!209574) (not e!227185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37048 (= res!209574 (validMask!0 mask!970))))

(assert (=> start!37048 e!227185))

(declare-fun array_inv!7568 (array!21587) Bool)

(assert (=> start!37048 (and (array_inv!7568 _values!506) e!227184)))

(assert (=> start!37048 tp!29240))

(assert (=> start!37048 true))

(assert (=> start!37048 tp_is_empty!8823))

(declare-fun array_inv!7569 (array!21589) Bool)

(assert (=> start!37048 (array_inv!7569 _keys!658)))

(assert (= (and start!37048 res!209574) b!372464))

(assert (= (and b!372464 res!209575) b!372454))

(assert (= (and b!372454 res!209578) b!372453))

(assert (= (and b!372453 res!209579) b!372456))

(assert (= (and b!372456 res!209571) b!372452))

(assert (= (and b!372452 res!209573) b!372463))

(assert (= (and b!372463 res!209572) b!372461))

(assert (= (and b!372461 res!209577) b!372455))

(assert (= (and b!372455 res!209570) b!372458))

(assert (= (and b!372458 res!209576) b!372460))

(assert (= (and b!372457 condMapEmpty!14799) mapIsEmpty!14799))

(assert (= (and b!372457 (not condMapEmpty!14799)) mapNonEmpty!14799))

(get-info :version)

(assert (= (and mapNonEmpty!14799 ((_ is ValueCellFull!4068) mapValue!14799)) b!372462))

(assert (= (and b!372457 ((_ is ValueCellFull!4068) mapDefault!14799)) b!372459))

(assert (= start!37048 b!372457))

(declare-fun m!368319 () Bool)

(assert (=> b!372453 m!368319))

(declare-fun m!368321 () Bool)

(assert (=> b!372452 m!368321))

(declare-fun m!368323 () Bool)

(assert (=> b!372461 m!368323))

(declare-fun m!368325 () Bool)

(assert (=> b!372460 m!368325))

(declare-fun m!368327 () Bool)

(assert (=> b!372460 m!368327))

(declare-fun m!368329 () Bool)

(assert (=> b!372460 m!368329))

(declare-fun m!368331 () Bool)

(assert (=> b!372460 m!368331))

(declare-fun m!368333 () Bool)

(assert (=> b!372460 m!368333))

(declare-fun m!368335 () Bool)

(assert (=> b!372460 m!368335))

(declare-fun m!368337 () Bool)

(assert (=> start!37048 m!368337))

(declare-fun m!368339 () Bool)

(assert (=> start!37048 m!368339))

(declare-fun m!368341 () Bool)

(assert (=> start!37048 m!368341))

(declare-fun m!368343 () Bool)

(assert (=> b!372455 m!368343))

(declare-fun m!368345 () Bool)

(assert (=> b!372455 m!368345))

(declare-fun m!368347 () Bool)

(assert (=> b!372454 m!368347))

(declare-fun m!368349 () Bool)

(assert (=> b!372463 m!368349))

(declare-fun m!368351 () Bool)

(assert (=> b!372458 m!368351))

(declare-fun m!368353 () Bool)

(assert (=> mapNonEmpty!14799 m!368353))

(check-sat (not mapNonEmpty!14799) (not b!372458) (not b!372453) (not b!372455) (not b!372460) (not b!372461) tp_is_empty!8823 (not start!37048) (not b!372454) (not b_next!8175) b_and!15417 (not b!372452))
(check-sat b_and!15417 (not b_next!8175))
