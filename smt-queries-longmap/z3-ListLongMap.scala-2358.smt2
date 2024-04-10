; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37612 () Bool)

(assert start!37612)

(declare-fun b_free!8739 () Bool)

(declare-fun b_next!8739 () Bool)

(assert (=> start!37612 (= b_free!8739 (not b_next!8739))))

(declare-fun tp!30932 () Bool)

(declare-fun b_and!15981 () Bool)

(assert (=> start!37612 (= tp!30932 b_and!15981)))

(declare-fun mapIsEmpty!15645 () Bool)

(declare-fun mapRes!15645 () Bool)

(assert (=> mapIsEmpty!15645 mapRes!15645))

(declare-fun b!384805 () Bool)

(declare-fun res!219387 () Bool)

(declare-fun e!233588 () Bool)

(assert (=> b!384805 (=> (not res!219387) (not e!233588))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22675 0))(
  ( (array!22676 (arr!10806 (Array (_ BitVec 32) (_ BitVec 64))) (size!11158 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22675)

(assert (=> b!384805 (= res!219387 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11158 _keys!658))))))

(declare-fun b!384806 () Bool)

(declare-fun res!219391 () Bool)

(assert (=> b!384806 (=> (not res!219391) (not e!233588))))

(declare-datatypes ((List!6215 0))(
  ( (Nil!6212) (Cons!6211 (h!7067 (_ BitVec 64)) (t!11365 List!6215)) )
))
(declare-fun arrayNoDuplicates!0 (array!22675 (_ BitVec 32) List!6215) Bool)

(assert (=> b!384806 (= res!219391 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6212))))

(declare-fun b!384807 () Bool)

(declare-fun res!219386 () Bool)

(assert (=> b!384807 (=> (not res!219386) (not e!233588))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22675 (_ BitVec 32)) Bool)

(assert (=> b!384807 (= res!219386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384808 () Bool)

(declare-fun e!233593 () Bool)

(declare-fun tp_is_empty!9387 () Bool)

(assert (=> b!384808 (= e!233593 tp_is_empty!9387)))

(declare-fun b!384809 () Bool)

(declare-fun e!233594 () Bool)

(declare-fun e!233589 () Bool)

(assert (=> b!384809 (= e!233594 (and e!233589 mapRes!15645))))

(declare-fun condMapEmpty!15645 () Bool)

(declare-datatypes ((V!13621 0))(
  ( (V!13622 (val!4738 Int)) )
))
(declare-datatypes ((ValueCell!4350 0))(
  ( (ValueCellFull!4350 (v!6935 V!13621)) (EmptyCell!4350) )
))
(declare-datatypes ((array!22677 0))(
  ( (array!22678 (arr!10807 (Array (_ BitVec 32) ValueCell!4350)) (size!11159 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22677)

(declare-fun mapDefault!15645 () ValueCell!4350)

(assert (=> b!384809 (= condMapEmpty!15645 (= (arr!10807 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4350)) mapDefault!15645)))))

(declare-fun b!384810 () Bool)

(assert (=> b!384810 (= e!233589 tp_is_empty!9387)))

(declare-fun b!384811 () Bool)

(declare-fun e!233590 () Bool)

(declare-fun e!233592 () Bool)

(assert (=> b!384811 (= e!233590 (not e!233592))))

(declare-fun res!219394 () Bool)

(assert (=> b!384811 (=> res!219394 e!233592)))

(declare-fun lt!181181 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384811 (= res!219394 (or (and (not lt!181181) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181181) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181181)))))

(assert (=> b!384811 (= lt!181181 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13621)

(declare-datatypes ((tuple2!6380 0))(
  ( (tuple2!6381 (_1!3201 (_ BitVec 64)) (_2!3201 V!13621)) )
))
(declare-datatypes ((List!6216 0))(
  ( (Nil!6213) (Cons!6212 (h!7068 tuple2!6380) (t!11366 List!6216)) )
))
(declare-datatypes ((ListLongMap!5293 0))(
  ( (ListLongMap!5294 (toList!2662 List!6216)) )
))
(declare-fun lt!181177 () ListLongMap!5293)

(declare-fun minValue!472 () V!13621)

(declare-fun getCurrentListMap!2061 (array!22675 array!22677 (_ BitVec 32) (_ BitVec 32) V!13621 V!13621 (_ BitVec 32) Int) ListLongMap!5293)

(assert (=> b!384811 (= lt!181177 (getCurrentListMap!2061 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181182 () array!22677)

(declare-fun lt!181174 () ListLongMap!5293)

(declare-fun lt!181178 () array!22675)

(assert (=> b!384811 (= lt!181174 (getCurrentListMap!2061 lt!181178 lt!181182 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181179 () ListLongMap!5293)

(declare-fun lt!181173 () ListLongMap!5293)

(assert (=> b!384811 (and (= lt!181179 lt!181173) (= lt!181173 lt!181179))))

(declare-fun lt!181172 () ListLongMap!5293)

(declare-fun lt!181175 () tuple2!6380)

(declare-fun +!997 (ListLongMap!5293 tuple2!6380) ListLongMap!5293)

(assert (=> b!384811 (= lt!181173 (+!997 lt!181172 lt!181175))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13621)

(assert (=> b!384811 (= lt!181175 (tuple2!6381 k0!778 v!373))))

(declare-datatypes ((Unit!11876 0))(
  ( (Unit!11877) )
))
(declare-fun lt!181176 () Unit!11876)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!219 (array!22675 array!22677 (_ BitVec 32) (_ BitVec 32) V!13621 V!13621 (_ BitVec 32) (_ BitVec 64) V!13621 (_ BitVec 32) Int) Unit!11876)

(assert (=> b!384811 (= lt!181176 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!219 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!895 (array!22675 array!22677 (_ BitVec 32) (_ BitVec 32) V!13621 V!13621 (_ BitVec 32) Int) ListLongMap!5293)

(assert (=> b!384811 (= lt!181179 (getCurrentListMapNoExtraKeys!895 lt!181178 lt!181182 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384811 (= lt!181182 (array!22678 (store (arr!10807 _values!506) i!548 (ValueCellFull!4350 v!373)) (size!11159 _values!506)))))

(assert (=> b!384811 (= lt!181172 (getCurrentListMapNoExtraKeys!895 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384812 () Bool)

(declare-fun res!219392 () Bool)

(assert (=> b!384812 (=> (not res!219392) (not e!233588))))

(declare-fun arrayContainsKey!0 (array!22675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384812 (= res!219392 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384813 () Bool)

(declare-fun res!219389 () Bool)

(assert (=> b!384813 (=> (not res!219389) (not e!233590))))

(assert (=> b!384813 (= res!219389 (arrayNoDuplicates!0 lt!181178 #b00000000000000000000000000000000 Nil!6212))))

(declare-fun b!384814 () Bool)

(declare-fun res!219385 () Bool)

(assert (=> b!384814 (=> (not res!219385) (not e!233588))))

(assert (=> b!384814 (= res!219385 (or (= (select (arr!10806 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10806 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!219390 () Bool)

(assert (=> start!37612 (=> (not res!219390) (not e!233588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37612 (= res!219390 (validMask!0 mask!970))))

(assert (=> start!37612 e!233588))

(declare-fun array_inv!7956 (array!22677) Bool)

(assert (=> start!37612 (and (array_inv!7956 _values!506) e!233594)))

(assert (=> start!37612 tp!30932))

(assert (=> start!37612 true))

(assert (=> start!37612 tp_is_empty!9387))

(declare-fun array_inv!7957 (array!22675) Bool)

(assert (=> start!37612 (array_inv!7957 _keys!658)))

(declare-fun b!384815 () Bool)

(declare-fun res!219395 () Bool)

(assert (=> b!384815 (=> (not res!219395) (not e!233588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384815 (= res!219395 (validKeyInArray!0 k0!778))))

(declare-fun b!384816 () Bool)

(declare-fun res!219393 () Bool)

(assert (=> b!384816 (=> (not res!219393) (not e!233588))))

(assert (=> b!384816 (= res!219393 (and (= (size!11159 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11158 _keys!658) (size!11159 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384817 () Bool)

(assert (=> b!384817 (= e!233592 true)))

(declare-fun lt!181180 () ListLongMap!5293)

(assert (=> b!384817 (= lt!181180 (+!997 lt!181177 lt!181175))))

(assert (=> b!384817 (= lt!181174 lt!181179)))

(declare-fun b!384818 () Bool)

(assert (=> b!384818 (= e!233588 e!233590)))

(declare-fun res!219388 () Bool)

(assert (=> b!384818 (=> (not res!219388) (not e!233590))))

(assert (=> b!384818 (= res!219388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181178 mask!970))))

(assert (=> b!384818 (= lt!181178 (array!22676 (store (arr!10806 _keys!658) i!548 k0!778) (size!11158 _keys!658)))))

(declare-fun mapNonEmpty!15645 () Bool)

(declare-fun tp!30933 () Bool)

(assert (=> mapNonEmpty!15645 (= mapRes!15645 (and tp!30933 e!233593))))

(declare-fun mapRest!15645 () (Array (_ BitVec 32) ValueCell!4350))

(declare-fun mapKey!15645 () (_ BitVec 32))

(declare-fun mapValue!15645 () ValueCell!4350)

(assert (=> mapNonEmpty!15645 (= (arr!10807 _values!506) (store mapRest!15645 mapKey!15645 mapValue!15645))))

(assert (= (and start!37612 res!219390) b!384816))

(assert (= (and b!384816 res!219393) b!384807))

(assert (= (and b!384807 res!219386) b!384806))

(assert (= (and b!384806 res!219391) b!384805))

(assert (= (and b!384805 res!219387) b!384815))

(assert (= (and b!384815 res!219395) b!384814))

(assert (= (and b!384814 res!219385) b!384812))

(assert (= (and b!384812 res!219392) b!384818))

(assert (= (and b!384818 res!219388) b!384813))

(assert (= (and b!384813 res!219389) b!384811))

(assert (= (and b!384811 (not res!219394)) b!384817))

(assert (= (and b!384809 condMapEmpty!15645) mapIsEmpty!15645))

(assert (= (and b!384809 (not condMapEmpty!15645)) mapNonEmpty!15645))

(get-info :version)

(assert (= (and mapNonEmpty!15645 ((_ is ValueCellFull!4350) mapValue!15645)) b!384808))

(assert (= (and b!384809 ((_ is ValueCellFull!4350) mapDefault!15645)) b!384810))

(assert (= start!37612 b!384809))

(declare-fun m!381475 () Bool)

(assert (=> b!384813 m!381475))

(declare-fun m!381477 () Bool)

(assert (=> b!384811 m!381477))

(declare-fun m!381479 () Bool)

(assert (=> b!384811 m!381479))

(declare-fun m!381481 () Bool)

(assert (=> b!384811 m!381481))

(declare-fun m!381483 () Bool)

(assert (=> b!384811 m!381483))

(declare-fun m!381485 () Bool)

(assert (=> b!384811 m!381485))

(declare-fun m!381487 () Bool)

(assert (=> b!384811 m!381487))

(declare-fun m!381489 () Bool)

(assert (=> b!384811 m!381489))

(declare-fun m!381491 () Bool)

(assert (=> b!384807 m!381491))

(declare-fun m!381493 () Bool)

(assert (=> b!384818 m!381493))

(declare-fun m!381495 () Bool)

(assert (=> b!384818 m!381495))

(declare-fun m!381497 () Bool)

(assert (=> start!37612 m!381497))

(declare-fun m!381499 () Bool)

(assert (=> start!37612 m!381499))

(declare-fun m!381501 () Bool)

(assert (=> start!37612 m!381501))

(declare-fun m!381503 () Bool)

(assert (=> mapNonEmpty!15645 m!381503))

(declare-fun m!381505 () Bool)

(assert (=> b!384814 m!381505))

(declare-fun m!381507 () Bool)

(assert (=> b!384815 m!381507))

(declare-fun m!381509 () Bool)

(assert (=> b!384806 m!381509))

(declare-fun m!381511 () Bool)

(assert (=> b!384812 m!381511))

(declare-fun m!381513 () Bool)

(assert (=> b!384817 m!381513))

(check-sat (not b!384818) (not b!384817) (not mapNonEmpty!15645) (not b!384812) (not b!384813) (not b!384807) (not start!37612) b_and!15981 (not b!384815) (not b!384806) (not b!384811) (not b_next!8739) tp_is_empty!9387)
(check-sat b_and!15981 (not b_next!8739))
