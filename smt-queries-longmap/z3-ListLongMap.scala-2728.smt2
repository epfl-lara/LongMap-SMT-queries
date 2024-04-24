; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40172 () Bool)

(assert start!40172)

(declare-fun b_free!10453 () Bool)

(declare-fun b_next!10453 () Bool)

(assert (=> start!40172 (= b_free!10453 (not b_next!10453))))

(declare-fun tp!36888 () Bool)

(declare-fun b_and!18435 () Bool)

(assert (=> start!40172 (= tp!36888 b_and!18435)))

(declare-fun b!440179 () Bool)

(declare-fun e!259371 () Bool)

(declare-fun e!259366 () Bool)

(assert (=> b!440179 (= e!259371 e!259366)))

(declare-fun res!260325 () Bool)

(assert (=> b!440179 (=> (not res!260325) (not e!259366))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440179 (= res!260325 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((array!27030 0))(
  ( (array!27031 (arr!12964 (Array (_ BitVec 32) (_ BitVec 64))) (size!13316 (_ BitVec 32))) )
))
(declare-fun lt!202538 () array!27030)

(declare-datatypes ((V!16579 0))(
  ( (V!16580 (val!5847 Int)) )
))
(declare-fun zeroValue!515 () V!16579)

(declare-datatypes ((ValueCell!5459 0))(
  ( (ValueCellFull!5459 (v!8095 V!16579)) (EmptyCell!5459) )
))
(declare-datatypes ((array!27032 0))(
  ( (array!27033 (arr!12965 (Array (_ BitVec 32) ValueCell!5459)) (size!13317 (_ BitVec 32))) )
))
(declare-fun lt!202539 () array!27032)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!16579)

(declare-datatypes ((tuple2!7676 0))(
  ( (tuple2!7677 (_1!3849 (_ BitVec 64)) (_2!3849 V!16579)) )
))
(declare-datatypes ((List!7664 0))(
  ( (Nil!7661) (Cons!7660 (h!8516 tuple2!7676) (t!13412 List!7664)) )
))
(declare-datatypes ((ListLongMap!6591 0))(
  ( (ListLongMap!6592 (toList!3311 List!7664)) )
))
(declare-fun lt!202535 () ListLongMap!6591)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1544 (array!27030 array!27032 (_ BitVec 32) (_ BitVec 32) V!16579 V!16579 (_ BitVec 32) Int) ListLongMap!6591)

(assert (=> b!440179 (= lt!202535 (getCurrentListMapNoExtraKeys!1544 lt!202538 lt!202539 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27032)

(declare-fun v!412 () V!16579)

(assert (=> b!440179 (= lt!202539 (array!27033 (store (arr!12965 _values!549) i!563 (ValueCellFull!5459 v!412)) (size!13317 _values!549)))))

(declare-fun lt!202536 () ListLongMap!6591)

(declare-fun _keys!709 () array!27030)

(assert (=> b!440179 (= lt!202536 (getCurrentListMapNoExtraKeys!1544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440180 () Bool)

(declare-fun e!259367 () Bool)

(declare-fun tp_is_empty!11605 () Bool)

(assert (=> b!440180 (= e!259367 tp_is_empty!11605)))

(declare-fun b!440181 () Bool)

(declare-fun res!260323 () Bool)

(declare-fun e!259368 () Bool)

(assert (=> b!440181 (=> (not res!260323) (not e!259368))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440181 (= res!260323 (validKeyInArray!0 k0!794))))

(declare-fun b!440182 () Bool)

(declare-fun res!260330 () Bool)

(assert (=> b!440182 (=> (not res!260330) (not e!259371))))

(declare-datatypes ((List!7665 0))(
  ( (Nil!7662) (Cons!7661 (h!8517 (_ BitVec 64)) (t!13413 List!7665)) )
))
(declare-fun arrayNoDuplicates!0 (array!27030 (_ BitVec 32) List!7665) Bool)

(assert (=> b!440182 (= res!260330 (arrayNoDuplicates!0 lt!202538 #b00000000000000000000000000000000 Nil!7662))))

(declare-fun b!440183 () Bool)

(declare-fun res!260329 () Bool)

(assert (=> b!440183 (=> (not res!260329) (not e!259368))))

(declare-fun arrayContainsKey!0 (array!27030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440183 (= res!260329 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440184 () Bool)

(assert (=> b!440184 (= e!259368 e!259371)))

(declare-fun res!260334 () Bool)

(assert (=> b!440184 (=> (not res!260334) (not e!259371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27030 (_ BitVec 32)) Bool)

(assert (=> b!440184 (= res!260334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202538 mask!1025))))

(assert (=> b!440184 (= lt!202538 (array!27031 (store (arr!12964 _keys!709) i!563 k0!794) (size!13316 _keys!709)))))

(declare-fun mapNonEmpty!19029 () Bool)

(declare-fun mapRes!19029 () Bool)

(declare-fun tp!36887 () Bool)

(declare-fun e!259372 () Bool)

(assert (=> mapNonEmpty!19029 (= mapRes!19029 (and tp!36887 e!259372))))

(declare-fun mapRest!19029 () (Array (_ BitVec 32) ValueCell!5459))

(declare-fun mapKey!19029 () (_ BitVec 32))

(declare-fun mapValue!19029 () ValueCell!5459)

(assert (=> mapNonEmpty!19029 (= (arr!12965 _values!549) (store mapRest!19029 mapKey!19029 mapValue!19029))))

(declare-fun b!440185 () Bool)

(declare-fun res!260324 () Bool)

(assert (=> b!440185 (=> (not res!260324) (not e!259371))))

(assert (=> b!440185 (= res!260324 (bvsle from!863 i!563))))

(declare-fun b!440186 () Bool)

(declare-fun e!259370 () Bool)

(assert (=> b!440186 (= e!259370 (and e!259367 mapRes!19029))))

(declare-fun condMapEmpty!19029 () Bool)

(declare-fun mapDefault!19029 () ValueCell!5459)

(assert (=> b!440186 (= condMapEmpty!19029 (= (arr!12965 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5459)) mapDefault!19029)))))

(declare-fun b!440187 () Bool)

(declare-fun res!260331 () Bool)

(assert (=> b!440187 (=> (not res!260331) (not e!259368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440187 (= res!260331 (validMask!0 mask!1025))))

(declare-fun b!440188 () Bool)

(declare-fun res!260322 () Bool)

(assert (=> b!440188 (=> (not res!260322) (not e!259368))))

(assert (=> b!440188 (= res!260322 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13316 _keys!709))))))

(declare-fun b!440190 () Bool)

(declare-fun res!260332 () Bool)

(assert (=> b!440190 (=> (not res!260332) (not e!259368))))

(assert (=> b!440190 (= res!260332 (and (= (size!13317 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13316 _keys!709) (size!13317 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440191 () Bool)

(assert (=> b!440191 (= e!259366 (not true))))

(declare-fun +!1504 (ListLongMap!6591 tuple2!7676) ListLongMap!6591)

(assert (=> b!440191 (= (getCurrentListMapNoExtraKeys!1544 lt!202538 lt!202539 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1504 (getCurrentListMapNoExtraKeys!1544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7677 k0!794 v!412)))))

(declare-datatypes ((Unit!13083 0))(
  ( (Unit!13084) )
))
(declare-fun lt!202537 () Unit!13083)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!664 (array!27030 array!27032 (_ BitVec 32) (_ BitVec 32) V!16579 V!16579 (_ BitVec 32) (_ BitVec 64) V!16579 (_ BitVec 32) Int) Unit!13083)

(assert (=> b!440191 (= lt!202537 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!664 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440192 () Bool)

(assert (=> b!440192 (= e!259372 tp_is_empty!11605)))

(declare-fun b!440193 () Bool)

(declare-fun res!260333 () Bool)

(assert (=> b!440193 (=> (not res!260333) (not e!259368))))

(assert (=> b!440193 (= res!260333 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7662))))

(declare-fun mapIsEmpty!19029 () Bool)

(assert (=> mapIsEmpty!19029 mapRes!19029))

(declare-fun b!440194 () Bool)

(declare-fun res!260328 () Bool)

(assert (=> b!440194 (=> (not res!260328) (not e!259368))))

(assert (=> b!440194 (= res!260328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440189 () Bool)

(declare-fun res!260326 () Bool)

(assert (=> b!440189 (=> (not res!260326) (not e!259368))))

(assert (=> b!440189 (= res!260326 (or (= (select (arr!12964 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12964 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!260327 () Bool)

(assert (=> start!40172 (=> (not res!260327) (not e!259368))))

(assert (=> start!40172 (= res!260327 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13316 _keys!709))))))

(assert (=> start!40172 e!259368))

(assert (=> start!40172 tp_is_empty!11605))

(assert (=> start!40172 tp!36888))

(assert (=> start!40172 true))

(declare-fun array_inv!9478 (array!27032) Bool)

(assert (=> start!40172 (and (array_inv!9478 _values!549) e!259370)))

(declare-fun array_inv!9479 (array!27030) Bool)

(assert (=> start!40172 (array_inv!9479 _keys!709)))

(assert (= (and start!40172 res!260327) b!440187))

(assert (= (and b!440187 res!260331) b!440190))

(assert (= (and b!440190 res!260332) b!440194))

(assert (= (and b!440194 res!260328) b!440193))

(assert (= (and b!440193 res!260333) b!440188))

(assert (= (and b!440188 res!260322) b!440181))

(assert (= (and b!440181 res!260323) b!440189))

(assert (= (and b!440189 res!260326) b!440183))

(assert (= (and b!440183 res!260329) b!440184))

(assert (= (and b!440184 res!260334) b!440182))

(assert (= (and b!440182 res!260330) b!440185))

(assert (= (and b!440185 res!260324) b!440179))

(assert (= (and b!440179 res!260325) b!440191))

(assert (= (and b!440186 condMapEmpty!19029) mapIsEmpty!19029))

(assert (= (and b!440186 (not condMapEmpty!19029)) mapNonEmpty!19029))

(get-info :version)

(assert (= (and mapNonEmpty!19029 ((_ is ValueCellFull!5459) mapValue!19029)) b!440192))

(assert (= (and b!440186 ((_ is ValueCellFull!5459) mapDefault!19029)) b!440180))

(assert (= start!40172 b!440186))

(declare-fun m!427535 () Bool)

(assert (=> b!440184 m!427535))

(declare-fun m!427537 () Bool)

(assert (=> b!440184 m!427537))

(declare-fun m!427539 () Bool)

(assert (=> b!440193 m!427539))

(declare-fun m!427541 () Bool)

(assert (=> b!440181 m!427541))

(declare-fun m!427543 () Bool)

(assert (=> b!440183 m!427543))

(declare-fun m!427545 () Bool)

(assert (=> b!440191 m!427545))

(declare-fun m!427547 () Bool)

(assert (=> b!440191 m!427547))

(assert (=> b!440191 m!427547))

(declare-fun m!427549 () Bool)

(assert (=> b!440191 m!427549))

(declare-fun m!427551 () Bool)

(assert (=> b!440191 m!427551))

(declare-fun m!427553 () Bool)

(assert (=> b!440182 m!427553))

(declare-fun m!427555 () Bool)

(assert (=> b!440194 m!427555))

(declare-fun m!427557 () Bool)

(assert (=> b!440189 m!427557))

(declare-fun m!427559 () Bool)

(assert (=> b!440187 m!427559))

(declare-fun m!427561 () Bool)

(assert (=> mapNonEmpty!19029 m!427561))

(declare-fun m!427563 () Bool)

(assert (=> b!440179 m!427563))

(declare-fun m!427565 () Bool)

(assert (=> b!440179 m!427565))

(declare-fun m!427567 () Bool)

(assert (=> b!440179 m!427567))

(declare-fun m!427569 () Bool)

(assert (=> start!40172 m!427569))

(declare-fun m!427571 () Bool)

(assert (=> start!40172 m!427571))

(check-sat (not b!440191) (not b!440184) (not b!440187) tp_is_empty!11605 (not b!440194) (not b!440193) (not b!440181) (not b!440183) (not mapNonEmpty!19029) (not b_next!10453) (not b!440182) b_and!18435 (not start!40172) (not b!440179))
(check-sat b_and!18435 (not b_next!10453))
