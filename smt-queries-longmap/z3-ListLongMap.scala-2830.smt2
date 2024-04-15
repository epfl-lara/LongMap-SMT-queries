; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40930 () Bool)

(assert start!40930)

(declare-fun b_free!10879 () Bool)

(declare-fun b_next!10879 () Bool)

(assert (=> start!40930 (= b_free!10879 (not b_next!10879))))

(declare-fun tp!38463 () Bool)

(declare-fun b_and!18995 () Bool)

(assert (=> start!40930 (= tp!38463 b_and!18995)))

(declare-fun b!455131 () Bool)

(declare-fun res!271409 () Bool)

(declare-fun e!266092 () Bool)

(assert (=> b!455131 (=> (not res!271409) (not e!266092))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28229 0))(
  ( (array!28230 (arr!13558 (Array (_ BitVec 32) (_ BitVec 64))) (size!13911 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28229)

(assert (=> b!455131 (= res!271409 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13911 _keys!709))))))

(declare-fun b!455132 () Bool)

(declare-fun e!266094 () Bool)

(declare-fun e!266093 () Bool)

(declare-fun mapRes!19966 () Bool)

(assert (=> b!455132 (= e!266094 (and e!266093 mapRes!19966))))

(declare-fun condMapEmpty!19966 () Bool)

(declare-datatypes ((V!17395 0))(
  ( (V!17396 (val!6153 Int)) )
))
(declare-datatypes ((ValueCell!5765 0))(
  ( (ValueCellFull!5765 (v!8413 V!17395)) (EmptyCell!5765) )
))
(declare-datatypes ((array!28231 0))(
  ( (array!28232 (arr!13559 (Array (_ BitVec 32) ValueCell!5765)) (size!13912 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28231)

(declare-fun mapDefault!19966 () ValueCell!5765)

(assert (=> b!455132 (= condMapEmpty!19966 (= (arr!13559 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5765)) mapDefault!19966)))))

(declare-fun mapIsEmpty!19966 () Bool)

(assert (=> mapIsEmpty!19966 mapRes!19966))

(declare-fun b!455133 () Bool)

(declare-fun res!271407 () Bool)

(declare-fun e!266090 () Bool)

(assert (=> b!455133 (=> (not res!271407) (not e!266090))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455133 (= res!271407 (bvsle from!863 i!563))))

(declare-fun b!455134 () Bool)

(declare-fun res!271410 () Bool)

(assert (=> b!455134 (=> (not res!271410) (not e!266092))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455134 (= res!271410 (validKeyInArray!0 k0!794))))

(declare-fun b!455135 () Bool)

(assert (=> b!455135 (= e!266090 false)))

(declare-fun minValue!515 () V!17395)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8122 0))(
  ( (tuple2!8123 (_1!4072 (_ BitVec 64)) (_2!4072 V!17395)) )
))
(declare-datatypes ((List!8182 0))(
  ( (Nil!8179) (Cons!8178 (h!9034 tuple2!8122) (t!14001 List!8182)) )
))
(declare-datatypes ((ListLongMap!7025 0))(
  ( (ListLongMap!7026 (toList!3528 List!8182)) )
))
(declare-fun lt!206096 () ListLongMap!7025)

(declare-fun zeroValue!515 () V!17395)

(declare-fun lt!206095 () array!28229)

(declare-fun v!412 () V!17395)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1723 (array!28229 array!28231 (_ BitVec 32) (_ BitVec 32) V!17395 V!17395 (_ BitVec 32) Int) ListLongMap!7025)

(assert (=> b!455135 (= lt!206096 (getCurrentListMapNoExtraKeys!1723 lt!206095 (array!28232 (store (arr!13559 _values!549) i!563 (ValueCellFull!5765 v!412)) (size!13912 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206094 () ListLongMap!7025)

(assert (=> b!455135 (= lt!206094 (getCurrentListMapNoExtraKeys!1723 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455136 () Bool)

(declare-fun res!271415 () Bool)

(assert (=> b!455136 (=> (not res!271415) (not e!266092))))

(assert (=> b!455136 (= res!271415 (or (= (select (arr!13558 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13558 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455137 () Bool)

(declare-fun res!271418 () Bool)

(assert (=> b!455137 (=> (not res!271418) (not e!266090))))

(declare-datatypes ((List!8183 0))(
  ( (Nil!8180) (Cons!8179 (h!9035 (_ BitVec 64)) (t!14002 List!8183)) )
))
(declare-fun arrayNoDuplicates!0 (array!28229 (_ BitVec 32) List!8183) Bool)

(assert (=> b!455137 (= res!271418 (arrayNoDuplicates!0 lt!206095 #b00000000000000000000000000000000 Nil!8180))))

(declare-fun b!455138 () Bool)

(declare-fun res!271416 () Bool)

(assert (=> b!455138 (=> (not res!271416) (not e!266092))))

(assert (=> b!455138 (= res!271416 (and (= (size!13912 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13911 _keys!709) (size!13912 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455139 () Bool)

(declare-fun res!271414 () Bool)

(assert (=> b!455139 (=> (not res!271414) (not e!266092))))

(declare-fun arrayContainsKey!0 (array!28229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455139 (= res!271414 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455140 () Bool)

(declare-fun tp_is_empty!12217 () Bool)

(assert (=> b!455140 (= e!266093 tp_is_empty!12217)))

(declare-fun b!455141 () Bool)

(declare-fun e!266095 () Bool)

(assert (=> b!455141 (= e!266095 tp_is_empty!12217)))

(declare-fun b!455142 () Bool)

(assert (=> b!455142 (= e!266092 e!266090)))

(declare-fun res!271413 () Bool)

(assert (=> b!455142 (=> (not res!271413) (not e!266090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28229 (_ BitVec 32)) Bool)

(assert (=> b!455142 (= res!271413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206095 mask!1025))))

(assert (=> b!455142 (= lt!206095 (array!28230 (store (arr!13558 _keys!709) i!563 k0!794) (size!13911 _keys!709)))))

(declare-fun b!455143 () Bool)

(declare-fun res!271411 () Bool)

(assert (=> b!455143 (=> (not res!271411) (not e!266092))))

(assert (=> b!455143 (= res!271411 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8180))))

(declare-fun b!455144 () Bool)

(declare-fun res!271412 () Bool)

(assert (=> b!455144 (=> (not res!271412) (not e!266092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455144 (= res!271412 (validMask!0 mask!1025))))

(declare-fun b!455145 () Bool)

(declare-fun res!271408 () Bool)

(assert (=> b!455145 (=> (not res!271408) (not e!266092))))

(assert (=> b!455145 (= res!271408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!271417 () Bool)

(assert (=> start!40930 (=> (not res!271417) (not e!266092))))

(assert (=> start!40930 (= res!271417 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13911 _keys!709))))))

(assert (=> start!40930 e!266092))

(assert (=> start!40930 tp_is_empty!12217))

(assert (=> start!40930 tp!38463))

(assert (=> start!40930 true))

(declare-fun array_inv!9882 (array!28231) Bool)

(assert (=> start!40930 (and (array_inv!9882 _values!549) e!266094)))

(declare-fun array_inv!9883 (array!28229) Bool)

(assert (=> start!40930 (array_inv!9883 _keys!709)))

(declare-fun mapNonEmpty!19966 () Bool)

(declare-fun tp!38464 () Bool)

(assert (=> mapNonEmpty!19966 (= mapRes!19966 (and tp!38464 e!266095))))

(declare-fun mapValue!19966 () ValueCell!5765)

(declare-fun mapRest!19966 () (Array (_ BitVec 32) ValueCell!5765))

(declare-fun mapKey!19966 () (_ BitVec 32))

(assert (=> mapNonEmpty!19966 (= (arr!13559 _values!549) (store mapRest!19966 mapKey!19966 mapValue!19966))))

(assert (= (and start!40930 res!271417) b!455144))

(assert (= (and b!455144 res!271412) b!455138))

(assert (= (and b!455138 res!271416) b!455145))

(assert (= (and b!455145 res!271408) b!455143))

(assert (= (and b!455143 res!271411) b!455131))

(assert (= (and b!455131 res!271409) b!455134))

(assert (= (and b!455134 res!271410) b!455136))

(assert (= (and b!455136 res!271415) b!455139))

(assert (= (and b!455139 res!271414) b!455142))

(assert (= (and b!455142 res!271413) b!455137))

(assert (= (and b!455137 res!271418) b!455133))

(assert (= (and b!455133 res!271407) b!455135))

(assert (= (and b!455132 condMapEmpty!19966) mapIsEmpty!19966))

(assert (= (and b!455132 (not condMapEmpty!19966)) mapNonEmpty!19966))

(get-info :version)

(assert (= (and mapNonEmpty!19966 ((_ is ValueCellFull!5765) mapValue!19966)) b!455141))

(assert (= (and b!455132 ((_ is ValueCellFull!5765) mapDefault!19966)) b!455140))

(assert (= start!40930 b!455132))

(declare-fun m!438467 () Bool)

(assert (=> b!455137 m!438467))

(declare-fun m!438469 () Bool)

(assert (=> b!455142 m!438469))

(declare-fun m!438471 () Bool)

(assert (=> b!455142 m!438471))

(declare-fun m!438473 () Bool)

(assert (=> b!455144 m!438473))

(declare-fun m!438475 () Bool)

(assert (=> start!40930 m!438475))

(declare-fun m!438477 () Bool)

(assert (=> start!40930 m!438477))

(declare-fun m!438479 () Bool)

(assert (=> b!455135 m!438479))

(declare-fun m!438481 () Bool)

(assert (=> b!455135 m!438481))

(declare-fun m!438483 () Bool)

(assert (=> b!455135 m!438483))

(declare-fun m!438485 () Bool)

(assert (=> b!455136 m!438485))

(declare-fun m!438487 () Bool)

(assert (=> b!455145 m!438487))

(declare-fun m!438489 () Bool)

(assert (=> b!455143 m!438489))

(declare-fun m!438491 () Bool)

(assert (=> mapNonEmpty!19966 m!438491))

(declare-fun m!438493 () Bool)

(assert (=> b!455139 m!438493))

(declare-fun m!438495 () Bool)

(assert (=> b!455134 m!438495))

(check-sat (not b!455137) (not start!40930) (not b!455145) (not b!455144) tp_is_empty!12217 (not b!455134) b_and!18995 (not b!455135) (not b!455143) (not mapNonEmpty!19966) (not b_next!10879) (not b!455139) (not b!455142))
(check-sat b_and!18995 (not b_next!10879))
