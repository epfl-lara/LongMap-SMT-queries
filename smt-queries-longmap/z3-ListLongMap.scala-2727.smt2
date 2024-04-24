; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40166 () Bool)

(assert start!40166)

(declare-fun b_free!10447 () Bool)

(declare-fun b_next!10447 () Bool)

(assert (=> start!40166 (= b_free!10447 (not b_next!10447))))

(declare-fun tp!36869 () Bool)

(declare-fun b_and!18429 () Bool)

(assert (=> start!40166 (= tp!36869 b_and!18429)))

(declare-fun b!440035 () Bool)

(declare-fun e!259304 () Bool)

(declare-fun e!259307 () Bool)

(assert (=> b!440035 (= e!259304 e!259307)))

(declare-fun res!260205 () Bool)

(assert (=> b!440035 (=> (not res!260205) (not e!259307))))

(declare-datatypes ((array!27020 0))(
  ( (array!27021 (arr!12959 (Array (_ BitVec 32) (_ BitVec 64))) (size!13311 (_ BitVec 32))) )
))
(declare-fun lt!202490 () array!27020)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27020 (_ BitVec 32)) Bool)

(assert (=> b!440035 (= res!260205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202490 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!27020)

(assert (=> b!440035 (= lt!202490 (array!27021 (store (arr!12959 _keys!709) i!563 k0!794) (size!13311 _keys!709)))))

(declare-fun b!440036 () Bool)

(declare-fun e!259308 () Bool)

(declare-fun e!259303 () Bool)

(declare-fun mapRes!19020 () Bool)

(assert (=> b!440036 (= e!259308 (and e!259303 mapRes!19020))))

(declare-fun condMapEmpty!19020 () Bool)

(declare-datatypes ((V!16571 0))(
  ( (V!16572 (val!5844 Int)) )
))
(declare-datatypes ((ValueCell!5456 0))(
  ( (ValueCellFull!5456 (v!8092 V!16571)) (EmptyCell!5456) )
))
(declare-datatypes ((array!27022 0))(
  ( (array!27023 (arr!12960 (Array (_ BitVec 32) ValueCell!5456)) (size!13312 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27022)

(declare-fun mapDefault!19020 () ValueCell!5456)

(assert (=> b!440036 (= condMapEmpty!19020 (= (arr!12960 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5456)) mapDefault!19020)))))

(declare-fun mapIsEmpty!19020 () Bool)

(assert (=> mapIsEmpty!19020 mapRes!19020))

(declare-fun res!260208 () Bool)

(assert (=> start!40166 (=> (not res!260208) (not e!259304))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40166 (= res!260208 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13311 _keys!709))))))

(assert (=> start!40166 e!259304))

(declare-fun tp_is_empty!11599 () Bool)

(assert (=> start!40166 tp_is_empty!11599))

(assert (=> start!40166 tp!36869))

(assert (=> start!40166 true))

(declare-fun array_inv!9474 (array!27022) Bool)

(assert (=> start!40166 (and (array_inv!9474 _values!549) e!259308)))

(declare-fun array_inv!9475 (array!27020) Bool)

(assert (=> start!40166 (array_inv!9475 _keys!709)))

(declare-fun b!440037 () Bool)

(declare-fun res!260216 () Bool)

(assert (=> b!440037 (=> (not res!260216) (not e!259307))))

(declare-datatypes ((List!7660 0))(
  ( (Nil!7657) (Cons!7656 (h!8512 (_ BitVec 64)) (t!13408 List!7660)) )
))
(declare-fun arrayNoDuplicates!0 (array!27020 (_ BitVec 32) List!7660) Bool)

(assert (=> b!440037 (= res!260216 (arrayNoDuplicates!0 lt!202490 #b00000000000000000000000000000000 Nil!7657))))

(declare-fun b!440038 () Bool)

(declare-fun res!260210 () Bool)

(assert (=> b!440038 (=> (not res!260210) (not e!259304))))

(assert (=> b!440038 (= res!260210 (or (= (select (arr!12959 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12959 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440039 () Bool)

(declare-fun res!260211 () Bool)

(assert (=> b!440039 (=> (not res!260211) (not e!259304))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!440039 (= res!260211 (and (= (size!13312 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13311 _keys!709) (size!13312 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440040 () Bool)

(assert (=> b!440040 (= e!259303 tp_is_empty!11599)))

(declare-fun b!440041 () Bool)

(declare-fun e!259306 () Bool)

(assert (=> b!440041 (= e!259306 tp_is_empty!11599)))

(declare-fun b!440042 () Bool)

(declare-fun e!259309 () Bool)

(assert (=> b!440042 (= e!259307 e!259309)))

(declare-fun res!260214 () Bool)

(assert (=> b!440042 (=> (not res!260214) (not e!259309))))

(assert (=> b!440042 (= res!260214 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16571)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7672 0))(
  ( (tuple2!7673 (_1!3847 (_ BitVec 64)) (_2!3847 V!16571)) )
))
(declare-datatypes ((List!7661 0))(
  ( (Nil!7658) (Cons!7657 (h!8513 tuple2!7672) (t!13409 List!7661)) )
))
(declare-datatypes ((ListLongMap!6587 0))(
  ( (ListLongMap!6588 (toList!3309 List!7661)) )
))
(declare-fun lt!202493 () ListLongMap!6587)

(declare-fun zeroValue!515 () V!16571)

(declare-fun lt!202491 () array!27022)

(declare-fun getCurrentListMapNoExtraKeys!1542 (array!27020 array!27022 (_ BitVec 32) (_ BitVec 32) V!16571 V!16571 (_ BitVec 32) Int) ListLongMap!6587)

(assert (=> b!440042 (= lt!202493 (getCurrentListMapNoExtraKeys!1542 lt!202490 lt!202491 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16571)

(assert (=> b!440042 (= lt!202491 (array!27023 (store (arr!12960 _values!549) i!563 (ValueCellFull!5456 v!412)) (size!13312 _values!549)))))

(declare-fun lt!202492 () ListLongMap!6587)

(assert (=> b!440042 (= lt!202492 (getCurrentListMapNoExtraKeys!1542 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440043 () Bool)

(declare-fun res!260212 () Bool)

(assert (=> b!440043 (=> (not res!260212) (not e!259307))))

(assert (=> b!440043 (= res!260212 (bvsle from!863 i!563))))

(declare-fun b!440044 () Bool)

(declare-fun res!260213 () Bool)

(assert (=> b!440044 (=> (not res!260213) (not e!259304))))

(assert (=> b!440044 (= res!260213 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7657))))

(declare-fun b!440045 () Bool)

(declare-fun res!260207 () Bool)

(assert (=> b!440045 (=> (not res!260207) (not e!259304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440045 (= res!260207 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19020 () Bool)

(declare-fun tp!36870 () Bool)

(assert (=> mapNonEmpty!19020 (= mapRes!19020 (and tp!36870 e!259306))))

(declare-fun mapRest!19020 () (Array (_ BitVec 32) ValueCell!5456))

(declare-fun mapValue!19020 () ValueCell!5456)

(declare-fun mapKey!19020 () (_ BitVec 32))

(assert (=> mapNonEmpty!19020 (= (arr!12960 _values!549) (store mapRest!19020 mapKey!19020 mapValue!19020))))

(declare-fun b!440046 () Bool)

(declare-fun res!260206 () Bool)

(assert (=> b!440046 (=> (not res!260206) (not e!259304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440046 (= res!260206 (validKeyInArray!0 k0!794))))

(declare-fun b!440047 () Bool)

(declare-fun res!260217 () Bool)

(assert (=> b!440047 (=> (not res!260217) (not e!259304))))

(declare-fun arrayContainsKey!0 (array!27020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440047 (= res!260217 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440048 () Bool)

(declare-fun res!260215 () Bool)

(assert (=> b!440048 (=> (not res!260215) (not e!259304))))

(assert (=> b!440048 (= res!260215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440049 () Bool)

(declare-fun res!260209 () Bool)

(assert (=> b!440049 (=> (not res!260209) (not e!259304))))

(assert (=> b!440049 (= res!260209 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13311 _keys!709))))))

(declare-fun b!440050 () Bool)

(assert (=> b!440050 (= e!259309 (not true))))

(declare-fun +!1502 (ListLongMap!6587 tuple2!7672) ListLongMap!6587)

(assert (=> b!440050 (= (getCurrentListMapNoExtraKeys!1542 lt!202490 lt!202491 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1502 (getCurrentListMapNoExtraKeys!1542 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7673 k0!794 v!412)))))

(declare-datatypes ((Unit!13079 0))(
  ( (Unit!13080) )
))
(declare-fun lt!202494 () Unit!13079)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!662 (array!27020 array!27022 (_ BitVec 32) (_ BitVec 32) V!16571 V!16571 (_ BitVec 32) (_ BitVec 64) V!16571 (_ BitVec 32) Int) Unit!13079)

(assert (=> b!440050 (= lt!202494 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!662 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40166 res!260208) b!440045))

(assert (= (and b!440045 res!260207) b!440039))

(assert (= (and b!440039 res!260211) b!440048))

(assert (= (and b!440048 res!260215) b!440044))

(assert (= (and b!440044 res!260213) b!440049))

(assert (= (and b!440049 res!260209) b!440046))

(assert (= (and b!440046 res!260206) b!440038))

(assert (= (and b!440038 res!260210) b!440047))

(assert (= (and b!440047 res!260217) b!440035))

(assert (= (and b!440035 res!260205) b!440037))

(assert (= (and b!440037 res!260216) b!440043))

(assert (= (and b!440043 res!260212) b!440042))

(assert (= (and b!440042 res!260214) b!440050))

(assert (= (and b!440036 condMapEmpty!19020) mapIsEmpty!19020))

(assert (= (and b!440036 (not condMapEmpty!19020)) mapNonEmpty!19020))

(get-info :version)

(assert (= (and mapNonEmpty!19020 ((_ is ValueCellFull!5456) mapValue!19020)) b!440041))

(assert (= (and b!440036 ((_ is ValueCellFull!5456) mapDefault!19020)) b!440040))

(assert (= start!40166 b!440036))

(declare-fun m!427421 () Bool)

(assert (=> b!440046 m!427421))

(declare-fun m!427423 () Bool)

(assert (=> b!440045 m!427423))

(declare-fun m!427425 () Bool)

(assert (=> b!440037 m!427425))

(declare-fun m!427427 () Bool)

(assert (=> b!440038 m!427427))

(declare-fun m!427429 () Bool)

(assert (=> b!440035 m!427429))

(declare-fun m!427431 () Bool)

(assert (=> b!440035 m!427431))

(declare-fun m!427433 () Bool)

(assert (=> b!440042 m!427433))

(declare-fun m!427435 () Bool)

(assert (=> b!440042 m!427435))

(declare-fun m!427437 () Bool)

(assert (=> b!440042 m!427437))

(declare-fun m!427439 () Bool)

(assert (=> b!440048 m!427439))

(declare-fun m!427441 () Bool)

(assert (=> b!440044 m!427441))

(declare-fun m!427443 () Bool)

(assert (=> start!40166 m!427443))

(declare-fun m!427445 () Bool)

(assert (=> start!40166 m!427445))

(declare-fun m!427447 () Bool)

(assert (=> b!440047 m!427447))

(declare-fun m!427449 () Bool)

(assert (=> b!440050 m!427449))

(declare-fun m!427451 () Bool)

(assert (=> b!440050 m!427451))

(assert (=> b!440050 m!427451))

(declare-fun m!427453 () Bool)

(assert (=> b!440050 m!427453))

(declare-fun m!427455 () Bool)

(assert (=> b!440050 m!427455))

(declare-fun m!427457 () Bool)

(assert (=> mapNonEmpty!19020 m!427457))

(check-sat (not b!440035) b_and!18429 tp_is_empty!11599 (not b!440046) (not b!440042) (not b!440044) (not b!440045) (not b!440050) (not b!440047) (not b!440048) (not mapNonEmpty!19020) (not start!40166) (not b_next!10447) (not b!440037))
(check-sat b_and!18429 (not b_next!10447))
