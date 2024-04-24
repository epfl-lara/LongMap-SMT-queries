; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40064 () Bool)

(assert start!40064)

(declare-fun b_free!10345 () Bool)

(declare-fun b_next!10345 () Bool)

(assert (=> start!40064 (= b_free!10345 (not b_next!10345))))

(declare-fun tp!36564 () Bool)

(declare-fun b_and!18327 () Bool)

(assert (=> start!40064 (= tp!36564 b_and!18327)))

(declare-fun b!437587 () Bool)

(declare-fun res!258219 () Bool)

(declare-fun e!258236 () Bool)

(assert (=> b!437587 (=> (not res!258219) (not e!258236))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437587 (= res!258219 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18867 () Bool)

(declare-fun mapRes!18867 () Bool)

(assert (=> mapIsEmpty!18867 mapRes!18867))

(declare-fun b!437588 () Bool)

(declare-fun res!258226 () Bool)

(assert (=> b!437588 (=> (not res!258226) (not e!258236))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437588 (= res!258226 (validMask!0 mask!1025))))

(declare-fun b!437589 () Bool)

(declare-fun e!258232 () Bool)

(declare-fun tp_is_empty!11497 () Bool)

(assert (=> b!437589 (= e!258232 tp_is_empty!11497)))

(declare-fun b!437590 () Bool)

(declare-fun e!258238 () Bool)

(assert (=> b!437590 (= e!258238 tp_is_empty!11497)))

(declare-fun b!437591 () Bool)

(declare-fun e!258237 () Bool)

(assert (=> b!437591 (= e!258236 e!258237)))

(declare-fun res!258220 () Bool)

(assert (=> b!437591 (=> (not res!258220) (not e!258237))))

(declare-datatypes ((array!26818 0))(
  ( (array!26819 (arr!12858 (Array (_ BitVec 32) (_ BitVec 64))) (size!13210 (_ BitVec 32))) )
))
(declare-fun lt!201728 () array!26818)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26818 (_ BitVec 32)) Bool)

(assert (=> b!437591 (= res!258220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201728 mask!1025))))

(declare-fun _keys!709 () array!26818)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437591 (= lt!201728 (array!26819 (store (arr!12858 _keys!709) i!563 k0!794) (size!13210 _keys!709)))))

(declare-fun res!258224 () Bool)

(assert (=> start!40064 (=> (not res!258224) (not e!258236))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40064 (= res!258224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13210 _keys!709))))))

(assert (=> start!40064 e!258236))

(assert (=> start!40064 tp_is_empty!11497))

(assert (=> start!40064 tp!36564))

(assert (=> start!40064 true))

(declare-datatypes ((V!16435 0))(
  ( (V!16436 (val!5793 Int)) )
))
(declare-datatypes ((ValueCell!5405 0))(
  ( (ValueCellFull!5405 (v!8041 V!16435)) (EmptyCell!5405) )
))
(declare-datatypes ((array!26820 0))(
  ( (array!26821 (arr!12859 (Array (_ BitVec 32) ValueCell!5405)) (size!13211 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26820)

(declare-fun e!258235 () Bool)

(declare-fun array_inv!9404 (array!26820) Bool)

(assert (=> start!40064 (and (array_inv!9404 _values!549) e!258235)))

(declare-fun array_inv!9405 (array!26818) Bool)

(assert (=> start!40064 (array_inv!9405 _keys!709)))

(declare-fun b!437592 () Bool)

(declare-fun res!258225 () Bool)

(assert (=> b!437592 (=> (not res!258225) (not e!258236))))

(assert (=> b!437592 (= res!258225 (or (= (select (arr!12858 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12858 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437593 () Bool)

(declare-fun res!258223 () Bool)

(assert (=> b!437593 (=> (not res!258223) (not e!258236))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!437593 (= res!258223 (and (= (size!13211 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13210 _keys!709) (size!13211 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437594 () Bool)

(declare-fun res!258216 () Bool)

(assert (=> b!437594 (=> (not res!258216) (not e!258237))))

(declare-datatypes ((List!7574 0))(
  ( (Nil!7571) (Cons!7570 (h!8426 (_ BitVec 64)) (t!13322 List!7574)) )
))
(declare-fun arrayNoDuplicates!0 (array!26818 (_ BitVec 32) List!7574) Bool)

(assert (=> b!437594 (= res!258216 (arrayNoDuplicates!0 lt!201728 #b00000000000000000000000000000000 Nil!7571))))

(declare-fun b!437595 () Bool)

(declare-fun res!258217 () Bool)

(assert (=> b!437595 (=> (not res!258217) (not e!258237))))

(assert (=> b!437595 (= res!258217 (bvsle from!863 i!563))))

(declare-fun b!437596 () Bool)

(declare-fun res!258228 () Bool)

(assert (=> b!437596 (=> (not res!258228) (not e!258236))))

(declare-fun arrayContainsKey!0 (array!26818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437596 (= res!258228 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437597 () Bool)

(assert (=> b!437597 (= e!258235 (and e!258232 mapRes!18867))))

(declare-fun condMapEmpty!18867 () Bool)

(declare-fun mapDefault!18867 () ValueCell!5405)

(assert (=> b!437597 (= condMapEmpty!18867 (= (arr!12859 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5405)) mapDefault!18867)))))

(declare-fun b!437598 () Bool)

(declare-fun res!258227 () Bool)

(assert (=> b!437598 (=> (not res!258227) (not e!258236))))

(assert (=> b!437598 (= res!258227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437599 () Bool)

(declare-fun e!258234 () Bool)

(assert (=> b!437599 (= e!258237 e!258234)))

(declare-fun res!258222 () Bool)

(assert (=> b!437599 (=> (not res!258222) (not e!258234))))

(assert (=> b!437599 (= res!258222 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16435)

(declare-fun zeroValue!515 () V!16435)

(declare-fun lt!201726 () array!26820)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7586 0))(
  ( (tuple2!7587 (_1!3804 (_ BitVec 64)) (_2!3804 V!16435)) )
))
(declare-datatypes ((List!7575 0))(
  ( (Nil!7572) (Cons!7571 (h!8427 tuple2!7586) (t!13323 List!7575)) )
))
(declare-datatypes ((ListLongMap!6501 0))(
  ( (ListLongMap!6502 (toList!3266 List!7575)) )
))
(declare-fun lt!201727 () ListLongMap!6501)

(declare-fun getCurrentListMapNoExtraKeys!1499 (array!26818 array!26820 (_ BitVec 32) (_ BitVec 32) V!16435 V!16435 (_ BitVec 32) Int) ListLongMap!6501)

(assert (=> b!437599 (= lt!201727 (getCurrentListMapNoExtraKeys!1499 lt!201728 lt!201726 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16435)

(assert (=> b!437599 (= lt!201726 (array!26821 (store (arr!12859 _values!549) i!563 (ValueCellFull!5405 v!412)) (size!13211 _values!549)))))

(declare-fun lt!201729 () ListLongMap!6501)

(assert (=> b!437599 (= lt!201729 (getCurrentListMapNoExtraKeys!1499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437600 () Bool)

(declare-fun res!258221 () Bool)

(assert (=> b!437600 (=> (not res!258221) (not e!258236))))

(assert (=> b!437600 (= res!258221 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7571))))

(declare-fun mapNonEmpty!18867 () Bool)

(declare-fun tp!36563 () Bool)

(assert (=> mapNonEmpty!18867 (= mapRes!18867 (and tp!36563 e!258238))))

(declare-fun mapValue!18867 () ValueCell!5405)

(declare-fun mapRest!18867 () (Array (_ BitVec 32) ValueCell!5405))

(declare-fun mapKey!18867 () (_ BitVec 32))

(assert (=> mapNonEmpty!18867 (= (arr!12859 _values!549) (store mapRest!18867 mapKey!18867 mapValue!18867))))

(declare-fun b!437601 () Bool)

(declare-fun res!258218 () Bool)

(assert (=> b!437601 (=> (not res!258218) (not e!258236))))

(assert (=> b!437601 (= res!258218 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13210 _keys!709))))))

(declare-fun b!437602 () Bool)

(assert (=> b!437602 (= e!258234 (not true))))

(declare-fun +!1466 (ListLongMap!6501 tuple2!7586) ListLongMap!6501)

(assert (=> b!437602 (= (getCurrentListMapNoExtraKeys!1499 lt!201728 lt!201726 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1466 (getCurrentListMapNoExtraKeys!1499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7587 k0!794 v!412)))))

(declare-datatypes ((Unit!13007 0))(
  ( (Unit!13008) )
))
(declare-fun lt!201725 () Unit!13007)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!626 (array!26818 array!26820 (_ BitVec 32) (_ BitVec 32) V!16435 V!16435 (_ BitVec 32) (_ BitVec 64) V!16435 (_ BitVec 32) Int) Unit!13007)

(assert (=> b!437602 (= lt!201725 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!626 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40064 res!258224) b!437588))

(assert (= (and b!437588 res!258226) b!437593))

(assert (= (and b!437593 res!258223) b!437598))

(assert (= (and b!437598 res!258227) b!437600))

(assert (= (and b!437600 res!258221) b!437601))

(assert (= (and b!437601 res!258218) b!437587))

(assert (= (and b!437587 res!258219) b!437592))

(assert (= (and b!437592 res!258225) b!437596))

(assert (= (and b!437596 res!258228) b!437591))

(assert (= (and b!437591 res!258220) b!437594))

(assert (= (and b!437594 res!258216) b!437595))

(assert (= (and b!437595 res!258217) b!437599))

(assert (= (and b!437599 res!258222) b!437602))

(assert (= (and b!437597 condMapEmpty!18867) mapIsEmpty!18867))

(assert (= (and b!437597 (not condMapEmpty!18867)) mapNonEmpty!18867))

(get-info :version)

(assert (= (and mapNonEmpty!18867 ((_ is ValueCellFull!5405) mapValue!18867)) b!437590))

(assert (= (and b!437597 ((_ is ValueCellFull!5405) mapDefault!18867)) b!437589))

(assert (= start!40064 b!437597))

(declare-fun m!425483 () Bool)

(assert (=> start!40064 m!425483))

(declare-fun m!425485 () Bool)

(assert (=> start!40064 m!425485))

(declare-fun m!425487 () Bool)

(assert (=> b!437594 m!425487))

(declare-fun m!425489 () Bool)

(assert (=> b!437598 m!425489))

(declare-fun m!425491 () Bool)

(assert (=> b!437602 m!425491))

(declare-fun m!425493 () Bool)

(assert (=> b!437602 m!425493))

(assert (=> b!437602 m!425493))

(declare-fun m!425495 () Bool)

(assert (=> b!437602 m!425495))

(declare-fun m!425497 () Bool)

(assert (=> b!437602 m!425497))

(declare-fun m!425499 () Bool)

(assert (=> b!437599 m!425499))

(declare-fun m!425501 () Bool)

(assert (=> b!437599 m!425501))

(declare-fun m!425503 () Bool)

(assert (=> b!437599 m!425503))

(declare-fun m!425505 () Bool)

(assert (=> b!437600 m!425505))

(declare-fun m!425507 () Bool)

(assert (=> mapNonEmpty!18867 m!425507))

(declare-fun m!425509 () Bool)

(assert (=> b!437588 m!425509))

(declare-fun m!425511 () Bool)

(assert (=> b!437591 m!425511))

(declare-fun m!425513 () Bool)

(assert (=> b!437591 m!425513))

(declare-fun m!425515 () Bool)

(assert (=> b!437596 m!425515))

(declare-fun m!425517 () Bool)

(assert (=> b!437592 m!425517))

(declare-fun m!425519 () Bool)

(assert (=> b!437587 m!425519))

(check-sat (not b!437600) b_and!18327 (not b!437587) (not b!437602) (not b!437599) (not b!437596) (not start!40064) tp_is_empty!11497 (not b!437591) (not b!437588) (not mapNonEmpty!18867) (not b_next!10345) (not b!437594) (not b!437598))
(check-sat b_and!18327 (not b_next!10345))
