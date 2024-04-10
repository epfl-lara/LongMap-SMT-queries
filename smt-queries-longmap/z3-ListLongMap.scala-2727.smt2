; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40182 () Bool)

(assert start!40182)

(declare-fun b_free!10449 () Bool)

(declare-fun b_next!10449 () Bool)

(assert (=> start!40182 (= b_free!10449 (not b_next!10449))))

(declare-fun tp!36876 () Bool)

(declare-fun b_and!18417 () Bool)

(assert (=> start!40182 (= tp!36876 b_and!18417)))

(declare-fun b!440132 () Bool)

(declare-fun e!259360 () Bool)

(declare-fun e!259357 () Bool)

(assert (=> b!440132 (= e!259360 e!259357)))

(declare-fun res!260247 () Bool)

(assert (=> b!440132 (=> (not res!260247) (not e!259357))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440132 (= res!260247 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16573 0))(
  ( (V!16574 (val!5845 Int)) )
))
(declare-fun minValue!515 () V!16573)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7766 0))(
  ( (tuple2!7767 (_1!3894 (_ BitVec 64)) (_2!3894 V!16573)) )
))
(declare-datatypes ((List!7764 0))(
  ( (Nil!7761) (Cons!7760 (h!8616 tuple2!7766) (t!13520 List!7764)) )
))
(declare-datatypes ((ListLongMap!6679 0))(
  ( (ListLongMap!6680 (toList!3355 List!7764)) )
))
(declare-fun lt!202490 () ListLongMap!6679)

(declare-datatypes ((ValueCell!5457 0))(
  ( (ValueCellFull!5457 (v!8092 V!16573)) (EmptyCell!5457) )
))
(declare-datatypes ((array!27017 0))(
  ( (array!27018 (arr!12958 (Array (_ BitVec 32) ValueCell!5457)) (size!13310 (_ BitVec 32))) )
))
(declare-fun lt!202489 () array!27017)

(declare-fun zeroValue!515 () V!16573)

(declare-datatypes ((array!27019 0))(
  ( (array!27020 (arr!12959 (Array (_ BitVec 32) (_ BitVec 64))) (size!13311 (_ BitVec 32))) )
))
(declare-fun lt!202487 () array!27019)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1544 (array!27019 array!27017 (_ BitVec 32) (_ BitVec 32) V!16573 V!16573 (_ BitVec 32) Int) ListLongMap!6679)

(assert (=> b!440132 (= lt!202490 (getCurrentListMapNoExtraKeys!1544 lt!202487 lt!202489 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27017)

(declare-fun v!412 () V!16573)

(assert (=> b!440132 (= lt!202489 (array!27018 (store (arr!12958 _values!549) i!563 (ValueCellFull!5457 v!412)) (size!13310 _values!549)))))

(declare-fun lt!202486 () ListLongMap!6679)

(declare-fun _keys!709 () array!27019)

(assert (=> b!440132 (= lt!202486 (getCurrentListMapNoExtraKeys!1544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440133 () Bool)

(declare-fun e!259356 () Bool)

(declare-fun e!259359 () Bool)

(declare-fun mapRes!19023 () Bool)

(assert (=> b!440133 (= e!259356 (and e!259359 mapRes!19023))))

(declare-fun condMapEmpty!19023 () Bool)

(declare-fun mapDefault!19023 () ValueCell!5457)

(assert (=> b!440133 (= condMapEmpty!19023 (= (arr!12958 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5457)) mapDefault!19023)))))

(declare-fun b!440134 () Bool)

(declare-fun res!260256 () Bool)

(declare-fun e!259361 () Bool)

(assert (=> b!440134 (=> (not res!260256) (not e!259361))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440134 (= res!260256 (validKeyInArray!0 k0!794))))

(declare-fun b!440135 () Bool)

(declare-fun res!260248 () Bool)

(assert (=> b!440135 (=> (not res!260248) (not e!259361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440135 (= res!260248 (validMask!0 mask!1025))))

(declare-fun b!440136 () Bool)

(declare-fun res!260252 () Bool)

(assert (=> b!440136 (=> (not res!260252) (not e!259361))))

(declare-datatypes ((List!7765 0))(
  ( (Nil!7762) (Cons!7761 (h!8617 (_ BitVec 64)) (t!13521 List!7765)) )
))
(declare-fun arrayNoDuplicates!0 (array!27019 (_ BitVec 32) List!7765) Bool)

(assert (=> b!440136 (= res!260252 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7762))))

(declare-fun b!440137 () Bool)

(declare-fun res!260259 () Bool)

(assert (=> b!440137 (=> (not res!260259) (not e!259360))))

(assert (=> b!440137 (= res!260259 (arrayNoDuplicates!0 lt!202487 #b00000000000000000000000000000000 Nil!7762))))

(declare-fun mapIsEmpty!19023 () Bool)

(assert (=> mapIsEmpty!19023 mapRes!19023))

(declare-fun b!440138 () Bool)

(declare-fun res!260255 () Bool)

(assert (=> b!440138 (=> (not res!260255) (not e!259361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27019 (_ BitVec 32)) Bool)

(assert (=> b!440138 (= res!260255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440139 () Bool)

(declare-fun res!260250 () Bool)

(assert (=> b!440139 (=> (not res!260250) (not e!259361))))

(assert (=> b!440139 (= res!260250 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13311 _keys!709))))))

(declare-fun res!260251 () Bool)

(assert (=> start!40182 (=> (not res!260251) (not e!259361))))

(assert (=> start!40182 (= res!260251 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13311 _keys!709))))))

(assert (=> start!40182 e!259361))

(declare-fun tp_is_empty!11601 () Bool)

(assert (=> start!40182 tp_is_empty!11601))

(assert (=> start!40182 tp!36876))

(assert (=> start!40182 true))

(declare-fun array_inv!9408 (array!27017) Bool)

(assert (=> start!40182 (and (array_inv!9408 _values!549) e!259356)))

(declare-fun array_inv!9409 (array!27019) Bool)

(assert (=> start!40182 (array_inv!9409 _keys!709)))

(declare-fun b!440140 () Bool)

(declare-fun res!260249 () Bool)

(assert (=> b!440140 (=> (not res!260249) (not e!259361))))

(assert (=> b!440140 (= res!260249 (and (= (size!13310 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13311 _keys!709) (size!13310 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440141 () Bool)

(declare-fun res!260254 () Bool)

(assert (=> b!440141 (=> (not res!260254) (not e!259360))))

(assert (=> b!440141 (= res!260254 (bvsle from!863 i!563))))

(declare-fun b!440142 () Bool)

(assert (=> b!440142 (= e!259361 e!259360)))

(declare-fun res!260253 () Bool)

(assert (=> b!440142 (=> (not res!260253) (not e!259360))))

(assert (=> b!440142 (= res!260253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202487 mask!1025))))

(assert (=> b!440142 (= lt!202487 (array!27020 (store (arr!12959 _keys!709) i!563 k0!794) (size!13311 _keys!709)))))

(declare-fun b!440143 () Bool)

(assert (=> b!440143 (= e!259357 (not true))))

(declare-fun +!1494 (ListLongMap!6679 tuple2!7766) ListLongMap!6679)

(assert (=> b!440143 (= (getCurrentListMapNoExtraKeys!1544 lt!202487 lt!202489 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1494 (getCurrentListMapNoExtraKeys!1544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7767 k0!794 v!412)))))

(declare-datatypes ((Unit!13092 0))(
  ( (Unit!13093) )
))
(declare-fun lt!202488 () Unit!13092)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!663 (array!27019 array!27017 (_ BitVec 32) (_ BitVec 32) V!16573 V!16573 (_ BitVec 32) (_ BitVec 64) V!16573 (_ BitVec 32) Int) Unit!13092)

(assert (=> b!440143 (= lt!202488 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!663 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440144 () Bool)

(declare-fun e!259362 () Bool)

(assert (=> b!440144 (= e!259362 tp_is_empty!11601)))

(declare-fun b!440145 () Bool)

(declare-fun res!260258 () Bool)

(assert (=> b!440145 (=> (not res!260258) (not e!259361))))

(assert (=> b!440145 (= res!260258 (or (= (select (arr!12959 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12959 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440146 () Bool)

(declare-fun res!260257 () Bool)

(assert (=> b!440146 (=> (not res!260257) (not e!259361))))

(declare-fun arrayContainsKey!0 (array!27019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440146 (= res!260257 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440147 () Bool)

(assert (=> b!440147 (= e!259359 tp_is_empty!11601)))

(declare-fun mapNonEmpty!19023 () Bool)

(declare-fun tp!36875 () Bool)

(assert (=> mapNonEmpty!19023 (= mapRes!19023 (and tp!36875 e!259362))))

(declare-fun mapKey!19023 () (_ BitVec 32))

(declare-fun mapRest!19023 () (Array (_ BitVec 32) ValueCell!5457))

(declare-fun mapValue!19023 () ValueCell!5457)

(assert (=> mapNonEmpty!19023 (= (arr!12958 _values!549) (store mapRest!19023 mapKey!19023 mapValue!19023))))

(assert (= (and start!40182 res!260251) b!440135))

(assert (= (and b!440135 res!260248) b!440140))

(assert (= (and b!440140 res!260249) b!440138))

(assert (= (and b!440138 res!260255) b!440136))

(assert (= (and b!440136 res!260252) b!440139))

(assert (= (and b!440139 res!260250) b!440134))

(assert (= (and b!440134 res!260256) b!440145))

(assert (= (and b!440145 res!260258) b!440146))

(assert (= (and b!440146 res!260257) b!440142))

(assert (= (and b!440142 res!260253) b!440137))

(assert (= (and b!440137 res!260259) b!440141))

(assert (= (and b!440141 res!260254) b!440132))

(assert (= (and b!440132 res!260247) b!440143))

(assert (= (and b!440133 condMapEmpty!19023) mapIsEmpty!19023))

(assert (= (and b!440133 (not condMapEmpty!19023)) mapNonEmpty!19023))

(get-info :version)

(assert (= (and mapNonEmpty!19023 ((_ is ValueCellFull!5457) mapValue!19023)) b!440144))

(assert (= (and b!440133 ((_ is ValueCellFull!5457) mapDefault!19023)) b!440147))

(assert (= start!40182 b!440133))

(declare-fun m!427241 () Bool)

(assert (=> b!440138 m!427241))

(declare-fun m!427243 () Bool)

(assert (=> mapNonEmpty!19023 m!427243))

(declare-fun m!427245 () Bool)

(assert (=> b!440135 m!427245))

(declare-fun m!427247 () Bool)

(assert (=> b!440146 m!427247))

(declare-fun m!427249 () Bool)

(assert (=> b!440143 m!427249))

(declare-fun m!427251 () Bool)

(assert (=> b!440143 m!427251))

(assert (=> b!440143 m!427251))

(declare-fun m!427253 () Bool)

(assert (=> b!440143 m!427253))

(declare-fun m!427255 () Bool)

(assert (=> b!440143 m!427255))

(declare-fun m!427257 () Bool)

(assert (=> b!440132 m!427257))

(declare-fun m!427259 () Bool)

(assert (=> b!440132 m!427259))

(declare-fun m!427261 () Bool)

(assert (=> b!440132 m!427261))

(declare-fun m!427263 () Bool)

(assert (=> b!440137 m!427263))

(declare-fun m!427265 () Bool)

(assert (=> b!440145 m!427265))

(declare-fun m!427267 () Bool)

(assert (=> start!40182 m!427267))

(declare-fun m!427269 () Bool)

(assert (=> start!40182 m!427269))

(declare-fun m!427271 () Bool)

(assert (=> b!440142 m!427271))

(declare-fun m!427273 () Bool)

(assert (=> b!440142 m!427273))

(declare-fun m!427275 () Bool)

(assert (=> b!440136 m!427275))

(declare-fun m!427277 () Bool)

(assert (=> b!440134 m!427277))

(check-sat (not mapNonEmpty!19023) (not b!440134) (not b!440138) (not b!440136) (not b!440143) (not b!440135) (not b!440132) (not b!440142) tp_is_empty!11601 (not start!40182) (not b!440137) b_and!18417 (not b!440146) (not b_next!10449))
(check-sat b_and!18417 (not b_next!10449))
