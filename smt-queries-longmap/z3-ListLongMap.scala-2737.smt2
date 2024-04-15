; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40226 () Bool)

(assert start!40226)

(declare-fun b_free!10507 () Bool)

(declare-fun b_next!10507 () Bool)

(assert (=> start!40226 (= b_free!10507 (not b_next!10507))))

(declare-fun tp!37050 () Bool)

(declare-fun b_and!18449 () Bool)

(assert (=> start!40226 (= tp!37050 b_and!18449)))

(declare-fun b!441253 () Bool)

(declare-fun e!259795 () Bool)

(declare-fun tp_is_empty!11659 () Bool)

(assert (=> b!441253 (= e!259795 tp_is_empty!11659)))

(declare-fun b!441254 () Bool)

(declare-fun e!259794 () Bool)

(assert (=> b!441254 (= e!259794 (not true))))

(declare-datatypes ((V!16651 0))(
  ( (V!16652 (val!5874 Int)) )
))
(declare-fun minValue!515 () V!16651)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5486 0))(
  ( (ValueCellFull!5486 (v!8115 V!16651)) (EmptyCell!5486) )
))
(declare-datatypes ((array!27133 0))(
  ( (array!27134 (arr!13016 (Array (_ BitVec 32) ValueCell!5486)) (size!13369 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27133)

(declare-fun zeroValue!515 () V!16651)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27135 0))(
  ( (array!27136 (arr!13017 (Array (_ BitVec 32) (_ BitVec 64))) (size!13370 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27135)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202689 () array!27135)

(declare-fun lt!202690 () array!27133)

(declare-fun v!412 () V!16651)

(declare-datatypes ((tuple2!7828 0))(
  ( (tuple2!7829 (_1!3925 (_ BitVec 64)) (_2!3925 V!16651)) )
))
(declare-datatypes ((List!7814 0))(
  ( (Nil!7811) (Cons!7810 (h!8666 tuple2!7828) (t!13561 List!7814)) )
))
(declare-datatypes ((ListLongMap!6731 0))(
  ( (ListLongMap!6732 (toList!3381 List!7814)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1580 (array!27135 array!27133 (_ BitVec 32) (_ BitVec 32) V!16651 V!16651 (_ BitVec 32) Int) ListLongMap!6731)

(declare-fun +!1541 (ListLongMap!6731 tuple2!7828) ListLongMap!6731)

(assert (=> b!441254 (= (getCurrentListMapNoExtraKeys!1580 lt!202689 lt!202690 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1541 (getCurrentListMapNoExtraKeys!1580 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7829 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13099 0))(
  ( (Unit!13100) )
))
(declare-fun lt!202687 () Unit!13099)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!679 (array!27135 array!27133 (_ BitVec 32) (_ BitVec 32) V!16651 V!16651 (_ BitVec 32) (_ BitVec 64) V!16651 (_ BitVec 32) Int) Unit!13099)

(assert (=> b!441254 (= lt!202687 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!679 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441255 () Bool)

(declare-fun res!261251 () Bool)

(declare-fun e!259796 () Bool)

(assert (=> b!441255 (=> (not res!261251) (not e!259796))))

(declare-datatypes ((List!7815 0))(
  ( (Nil!7812) (Cons!7811 (h!8667 (_ BitVec 64)) (t!13562 List!7815)) )
))
(declare-fun arrayNoDuplicates!0 (array!27135 (_ BitVec 32) List!7815) Bool)

(assert (=> b!441255 (= res!261251 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7812))))

(declare-fun b!441256 () Bool)

(declare-fun res!261255 () Bool)

(assert (=> b!441256 (=> (not res!261255) (not e!259796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441256 (= res!261255 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19110 () Bool)

(declare-fun mapRes!19110 () Bool)

(assert (=> mapIsEmpty!19110 mapRes!19110))

(declare-fun b!441257 () Bool)

(declare-fun e!259791 () Bool)

(assert (=> b!441257 (= e!259791 tp_is_empty!11659)))

(declare-fun b!441258 () Bool)

(declare-fun e!259793 () Bool)

(assert (=> b!441258 (= e!259793 e!259794)))

(declare-fun res!261253 () Bool)

(assert (=> b!441258 (=> (not res!261253) (not e!259794))))

(assert (=> b!441258 (= res!261253 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202688 () ListLongMap!6731)

(assert (=> b!441258 (= lt!202688 (getCurrentListMapNoExtraKeys!1580 lt!202689 lt!202690 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441258 (= lt!202690 (array!27134 (store (arr!13016 _values!549) i!563 (ValueCellFull!5486 v!412)) (size!13369 _values!549)))))

(declare-fun lt!202691 () ListLongMap!6731)

(assert (=> b!441258 (= lt!202691 (getCurrentListMapNoExtraKeys!1580 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441259 () Bool)

(declare-fun res!261250 () Bool)

(assert (=> b!441259 (=> (not res!261250) (not e!259793))))

(assert (=> b!441259 (= res!261250 (arrayNoDuplicates!0 lt!202689 #b00000000000000000000000000000000 Nil!7812))))

(declare-fun b!441260 () Bool)

(declare-fun res!261249 () Bool)

(assert (=> b!441260 (=> (not res!261249) (not e!259796))))

(assert (=> b!441260 (= res!261249 (or (= (select (arr!13017 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13017 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19110 () Bool)

(declare-fun tp!37049 () Bool)

(assert (=> mapNonEmpty!19110 (= mapRes!19110 (and tp!37049 e!259795))))

(declare-fun mapKey!19110 () (_ BitVec 32))

(declare-fun mapRest!19110 () (Array (_ BitVec 32) ValueCell!5486))

(declare-fun mapValue!19110 () ValueCell!5486)

(assert (=> mapNonEmpty!19110 (= (arr!13016 _values!549) (store mapRest!19110 mapKey!19110 mapValue!19110))))

(declare-fun b!441261 () Bool)

(declare-fun res!261254 () Bool)

(assert (=> b!441261 (=> (not res!261254) (not e!259796))))

(assert (=> b!441261 (= res!261254 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13370 _keys!709))))))

(declare-fun b!441262 () Bool)

(assert (=> b!441262 (= e!259796 e!259793)))

(declare-fun res!261260 () Bool)

(assert (=> b!441262 (=> (not res!261260) (not e!259793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27135 (_ BitVec 32)) Bool)

(assert (=> b!441262 (= res!261260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202689 mask!1025))))

(assert (=> b!441262 (= lt!202689 (array!27136 (store (arr!13017 _keys!709) i!563 k0!794) (size!13370 _keys!709)))))

(declare-fun b!441263 () Bool)

(declare-fun res!261256 () Bool)

(assert (=> b!441263 (=> (not res!261256) (not e!259796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441263 (= res!261256 (validMask!0 mask!1025))))

(declare-fun b!441264 () Bool)

(declare-fun res!261258 () Bool)

(assert (=> b!441264 (=> (not res!261258) (not e!259796))))

(assert (=> b!441264 (= res!261258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441266 () Bool)

(declare-fun res!261252 () Bool)

(assert (=> b!441266 (=> (not res!261252) (not e!259796))))

(assert (=> b!441266 (= res!261252 (and (= (size!13369 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13370 _keys!709) (size!13369 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!261261 () Bool)

(assert (=> start!40226 (=> (not res!261261) (not e!259796))))

(assert (=> start!40226 (= res!261261 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13370 _keys!709))))))

(assert (=> start!40226 e!259796))

(assert (=> start!40226 tp_is_empty!11659))

(assert (=> start!40226 tp!37050))

(assert (=> start!40226 true))

(declare-fun e!259792 () Bool)

(declare-fun array_inv!9492 (array!27133) Bool)

(assert (=> start!40226 (and (array_inv!9492 _values!549) e!259792)))

(declare-fun array_inv!9493 (array!27135) Bool)

(assert (=> start!40226 (array_inv!9493 _keys!709)))

(declare-fun b!441265 () Bool)

(declare-fun res!261257 () Bool)

(assert (=> b!441265 (=> (not res!261257) (not e!259796))))

(declare-fun arrayContainsKey!0 (array!27135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441265 (= res!261257 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441267 () Bool)

(assert (=> b!441267 (= e!259792 (and e!259791 mapRes!19110))))

(declare-fun condMapEmpty!19110 () Bool)

(declare-fun mapDefault!19110 () ValueCell!5486)

(assert (=> b!441267 (= condMapEmpty!19110 (= (arr!13016 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5486)) mapDefault!19110)))))

(declare-fun b!441268 () Bool)

(declare-fun res!261259 () Bool)

(assert (=> b!441268 (=> (not res!261259) (not e!259793))))

(assert (=> b!441268 (= res!261259 (bvsle from!863 i!563))))

(assert (= (and start!40226 res!261261) b!441263))

(assert (= (and b!441263 res!261256) b!441266))

(assert (= (and b!441266 res!261252) b!441264))

(assert (= (and b!441264 res!261258) b!441255))

(assert (= (and b!441255 res!261251) b!441261))

(assert (= (and b!441261 res!261254) b!441256))

(assert (= (and b!441256 res!261255) b!441260))

(assert (= (and b!441260 res!261249) b!441265))

(assert (= (and b!441265 res!261257) b!441262))

(assert (= (and b!441262 res!261260) b!441259))

(assert (= (and b!441259 res!261250) b!441268))

(assert (= (and b!441268 res!261259) b!441258))

(assert (= (and b!441258 res!261253) b!441254))

(assert (= (and b!441267 condMapEmpty!19110) mapIsEmpty!19110))

(assert (= (and b!441267 (not condMapEmpty!19110)) mapNonEmpty!19110))

(get-info :version)

(assert (= (and mapNonEmpty!19110 ((_ is ValueCellFull!5486) mapValue!19110)) b!441253))

(assert (= (and b!441267 ((_ is ValueCellFull!5486) mapDefault!19110)) b!441257))

(assert (= start!40226 b!441267))

(declare-fun m!427611 () Bool)

(assert (=> b!441258 m!427611))

(declare-fun m!427613 () Bool)

(assert (=> b!441258 m!427613))

(declare-fun m!427615 () Bool)

(assert (=> b!441258 m!427615))

(declare-fun m!427617 () Bool)

(assert (=> b!441255 m!427617))

(declare-fun m!427619 () Bool)

(assert (=> b!441259 m!427619))

(declare-fun m!427621 () Bool)

(assert (=> b!441263 m!427621))

(declare-fun m!427623 () Bool)

(assert (=> b!441265 m!427623))

(declare-fun m!427625 () Bool)

(assert (=> b!441260 m!427625))

(declare-fun m!427627 () Bool)

(assert (=> start!40226 m!427627))

(declare-fun m!427629 () Bool)

(assert (=> start!40226 m!427629))

(declare-fun m!427631 () Bool)

(assert (=> b!441256 m!427631))

(declare-fun m!427633 () Bool)

(assert (=> b!441264 m!427633))

(declare-fun m!427635 () Bool)

(assert (=> b!441262 m!427635))

(declare-fun m!427637 () Bool)

(assert (=> b!441262 m!427637))

(declare-fun m!427639 () Bool)

(assert (=> mapNonEmpty!19110 m!427639))

(declare-fun m!427641 () Bool)

(assert (=> b!441254 m!427641))

(declare-fun m!427643 () Bool)

(assert (=> b!441254 m!427643))

(assert (=> b!441254 m!427643))

(declare-fun m!427645 () Bool)

(assert (=> b!441254 m!427645))

(declare-fun m!427647 () Bool)

(assert (=> b!441254 m!427647))

(check-sat (not b!441256) (not b!441262) (not b_next!10507) (not b!441258) (not b!441265) (not b!441255) (not mapNonEmpty!19110) tp_is_empty!11659 (not b!441254) (not b!441259) (not b!441263) b_and!18449 (not start!40226) (not b!441264))
(check-sat b_and!18449 (not b_next!10507))
