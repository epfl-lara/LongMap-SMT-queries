; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39608 () Bool)

(assert start!39608)

(declare-fun b_free!9889 () Bool)

(declare-fun b_next!9889 () Bool)

(assert (=> start!39608 (= b_free!9889 (not b_next!9889))))

(declare-fun tp!35196 () Bool)

(declare-fun b_and!17519 () Bool)

(assert (=> start!39608 (= tp!35196 b_and!17519)))

(declare-fun b!424480 () Bool)

(declare-fun res!248406 () Bool)

(declare-fun e!252093 () Bool)

(assert (=> b!424480 (=> (not res!248406) (not e!252093))))

(declare-datatypes ((array!25911 0))(
  ( (array!25912 (arr!12405 (Array (_ BitVec 32) (_ BitVec 64))) (size!12758 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25911)

(declare-datatypes ((List!7293 0))(
  ( (Nil!7290) (Cons!7289 (h!8145 (_ BitVec 64)) (t!12728 List!7293)) )
))
(declare-fun arrayNoDuplicates!0 (array!25911 (_ BitVec 32) List!7293) Bool)

(assert (=> b!424480 (= res!248406 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7290))))

(declare-fun b!424481 () Bool)

(declare-fun res!248402 () Bool)

(declare-fun e!252089 () Bool)

(assert (=> b!424481 (=> (not res!248402) (not e!252089))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424481 (= res!248402 (bvsle from!863 i!563))))

(declare-fun b!424482 () Bool)

(declare-fun e!252091 () Bool)

(assert (=> b!424482 (= e!252091 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15827 0))(
  ( (V!15828 (val!5565 Int)) )
))
(declare-datatypes ((ValueCell!5177 0))(
  ( (ValueCellFull!5177 (v!7806 V!15827)) (EmptyCell!5177) )
))
(declare-datatypes ((array!25913 0))(
  ( (array!25914 (arr!12406 (Array (_ BitVec 32) ValueCell!5177)) (size!12759 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25913)

(declare-fun zeroValue!515 () V!15827)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!194200 () array!25911)

(declare-fun v!412 () V!15827)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15827)

(declare-fun lt!194201 () array!25913)

(declare-datatypes ((tuple2!7294 0))(
  ( (tuple2!7295 (_1!3658 (_ BitVec 64)) (_2!3658 V!15827)) )
))
(declare-datatypes ((List!7294 0))(
  ( (Nil!7291) (Cons!7290 (h!8146 tuple2!7294) (t!12729 List!7294)) )
))
(declare-datatypes ((ListLongMap!6197 0))(
  ( (ListLongMap!6198 (toList!3114 List!7294)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1322 (array!25911 array!25913 (_ BitVec 32) (_ BitVec 32) V!15827 V!15827 (_ BitVec 32) Int) ListLongMap!6197)

(declare-fun +!1298 (ListLongMap!6197 tuple2!7294) ListLongMap!6197)

(assert (=> b!424482 (= (getCurrentListMapNoExtraKeys!1322 lt!194200 lt!194201 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1298 (getCurrentListMapNoExtraKeys!1322 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7295 k0!794 v!412)))))

(declare-datatypes ((Unit!12442 0))(
  ( (Unit!12443) )
))
(declare-fun lt!194204 () Unit!12442)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!469 (array!25911 array!25913 (_ BitVec 32) (_ BitVec 32) V!15827 V!15827 (_ BitVec 32) (_ BitVec 64) V!15827 (_ BitVec 32) Int) Unit!12442)

(assert (=> b!424482 (= lt!194204 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!469 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424483 () Bool)

(declare-fun e!252088 () Bool)

(declare-fun e!252090 () Bool)

(declare-fun mapRes!18183 () Bool)

(assert (=> b!424483 (= e!252088 (and e!252090 mapRes!18183))))

(declare-fun condMapEmpty!18183 () Bool)

(declare-fun mapDefault!18183 () ValueCell!5177)

(assert (=> b!424483 (= condMapEmpty!18183 (= (arr!12406 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5177)) mapDefault!18183)))))

(declare-fun b!424484 () Bool)

(declare-fun e!252092 () Bool)

(declare-fun tp_is_empty!11041 () Bool)

(assert (=> b!424484 (= e!252092 tp_is_empty!11041)))

(declare-fun b!424486 () Bool)

(assert (=> b!424486 (= e!252090 tp_is_empty!11041)))

(declare-fun b!424487 () Bool)

(declare-fun res!248407 () Bool)

(assert (=> b!424487 (=> (not res!248407) (not e!252093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424487 (= res!248407 (validKeyInArray!0 k0!794))))

(declare-fun b!424488 () Bool)

(declare-fun res!248397 () Bool)

(assert (=> b!424488 (=> (not res!248397) (not e!252093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424488 (= res!248397 (validMask!0 mask!1025))))

(declare-fun b!424489 () Bool)

(assert (=> b!424489 (= e!252093 e!252089)))

(declare-fun res!248399 () Bool)

(assert (=> b!424489 (=> (not res!248399) (not e!252089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25911 (_ BitVec 32)) Bool)

(assert (=> b!424489 (= res!248399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194200 mask!1025))))

(assert (=> b!424489 (= lt!194200 (array!25912 (store (arr!12405 _keys!709) i!563 k0!794) (size!12758 _keys!709)))))

(declare-fun b!424490 () Bool)

(declare-fun res!248409 () Bool)

(assert (=> b!424490 (=> (not res!248409) (not e!252093))))

(assert (=> b!424490 (= res!248409 (and (= (size!12759 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12758 _keys!709) (size!12759 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424491 () Bool)

(assert (=> b!424491 (= e!252089 e!252091)))

(declare-fun res!248405 () Bool)

(assert (=> b!424491 (=> (not res!248405) (not e!252091))))

(assert (=> b!424491 (= res!248405 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194203 () ListLongMap!6197)

(assert (=> b!424491 (= lt!194203 (getCurrentListMapNoExtraKeys!1322 lt!194200 lt!194201 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!424491 (= lt!194201 (array!25914 (store (arr!12406 _values!549) i!563 (ValueCellFull!5177 v!412)) (size!12759 _values!549)))))

(declare-fun lt!194202 () ListLongMap!6197)

(assert (=> b!424491 (= lt!194202 (getCurrentListMapNoExtraKeys!1322 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18183 () Bool)

(declare-fun tp!35195 () Bool)

(assert (=> mapNonEmpty!18183 (= mapRes!18183 (and tp!35195 e!252092))))

(declare-fun mapValue!18183 () ValueCell!5177)

(declare-fun mapKey!18183 () (_ BitVec 32))

(declare-fun mapRest!18183 () (Array (_ BitVec 32) ValueCell!5177))

(assert (=> mapNonEmpty!18183 (= (arr!12406 _values!549) (store mapRest!18183 mapKey!18183 mapValue!18183))))

(declare-fun mapIsEmpty!18183 () Bool)

(assert (=> mapIsEmpty!18183 mapRes!18183))

(declare-fun res!248404 () Bool)

(assert (=> start!39608 (=> (not res!248404) (not e!252093))))

(assert (=> start!39608 (= res!248404 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12758 _keys!709))))))

(assert (=> start!39608 e!252093))

(assert (=> start!39608 tp_is_empty!11041))

(assert (=> start!39608 tp!35196))

(assert (=> start!39608 true))

(declare-fun array_inv!9072 (array!25913) Bool)

(assert (=> start!39608 (and (array_inv!9072 _values!549) e!252088)))

(declare-fun array_inv!9073 (array!25911) Bool)

(assert (=> start!39608 (array_inv!9073 _keys!709)))

(declare-fun b!424485 () Bool)

(declare-fun res!248403 () Bool)

(assert (=> b!424485 (=> (not res!248403) (not e!252089))))

(assert (=> b!424485 (= res!248403 (arrayNoDuplicates!0 lt!194200 #b00000000000000000000000000000000 Nil!7290))))

(declare-fun b!424492 () Bool)

(declare-fun res!248408 () Bool)

(assert (=> b!424492 (=> (not res!248408) (not e!252093))))

(declare-fun arrayContainsKey!0 (array!25911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424492 (= res!248408 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424493 () Bool)

(declare-fun res!248398 () Bool)

(assert (=> b!424493 (=> (not res!248398) (not e!252093))))

(assert (=> b!424493 (= res!248398 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12758 _keys!709))))))

(declare-fun b!424494 () Bool)

(declare-fun res!248400 () Bool)

(assert (=> b!424494 (=> (not res!248400) (not e!252093))))

(assert (=> b!424494 (= res!248400 (or (= (select (arr!12405 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12405 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424495 () Bool)

(declare-fun res!248401 () Bool)

(assert (=> b!424495 (=> (not res!248401) (not e!252093))))

(assert (=> b!424495 (= res!248401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39608 res!248404) b!424488))

(assert (= (and b!424488 res!248397) b!424490))

(assert (= (and b!424490 res!248409) b!424495))

(assert (= (and b!424495 res!248401) b!424480))

(assert (= (and b!424480 res!248406) b!424493))

(assert (= (and b!424493 res!248398) b!424487))

(assert (= (and b!424487 res!248407) b!424494))

(assert (= (and b!424494 res!248400) b!424492))

(assert (= (and b!424492 res!248408) b!424489))

(assert (= (and b!424489 res!248399) b!424485))

(assert (= (and b!424485 res!248403) b!424481))

(assert (= (and b!424481 res!248402) b!424491))

(assert (= (and b!424491 res!248405) b!424482))

(assert (= (and b!424483 condMapEmpty!18183) mapIsEmpty!18183))

(assert (= (and b!424483 (not condMapEmpty!18183)) mapNonEmpty!18183))

(get-info :version)

(assert (= (and mapNonEmpty!18183 ((_ is ValueCellFull!5177) mapValue!18183)) b!424484))

(assert (= (and b!424483 ((_ is ValueCellFull!5177) mapDefault!18183)) b!424486))

(assert (= start!39608 b!424483))

(declare-fun m!413061 () Bool)

(assert (=> b!424485 m!413061))

(declare-fun m!413063 () Bool)

(assert (=> b!424495 m!413063))

(declare-fun m!413065 () Bool)

(assert (=> b!424487 m!413065))

(declare-fun m!413067 () Bool)

(assert (=> start!39608 m!413067))

(declare-fun m!413069 () Bool)

(assert (=> start!39608 m!413069))

(declare-fun m!413071 () Bool)

(assert (=> b!424480 m!413071))

(declare-fun m!413073 () Bool)

(assert (=> mapNonEmpty!18183 m!413073))

(declare-fun m!413075 () Bool)

(assert (=> b!424489 m!413075))

(declare-fun m!413077 () Bool)

(assert (=> b!424489 m!413077))

(declare-fun m!413079 () Bool)

(assert (=> b!424492 m!413079))

(declare-fun m!413081 () Bool)

(assert (=> b!424488 m!413081))

(declare-fun m!413083 () Bool)

(assert (=> b!424482 m!413083))

(declare-fun m!413085 () Bool)

(assert (=> b!424482 m!413085))

(assert (=> b!424482 m!413085))

(declare-fun m!413087 () Bool)

(assert (=> b!424482 m!413087))

(declare-fun m!413089 () Bool)

(assert (=> b!424482 m!413089))

(declare-fun m!413091 () Bool)

(assert (=> b!424494 m!413091))

(declare-fun m!413093 () Bool)

(assert (=> b!424491 m!413093))

(declare-fun m!413095 () Bool)

(assert (=> b!424491 m!413095))

(declare-fun m!413097 () Bool)

(assert (=> b!424491 m!413097))

(check-sat (not b!424488) (not start!39608) (not b!424482) tp_is_empty!11041 (not b!424487) (not mapNonEmpty!18183) b_and!17519 (not b!424495) (not b!424491) (not b!424480) (not b_next!9889) (not b!424489) (not b!424485) (not b!424492))
(check-sat b_and!17519 (not b_next!9889))
