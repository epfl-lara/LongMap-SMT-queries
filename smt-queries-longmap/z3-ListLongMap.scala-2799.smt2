; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40668 () Bool)

(assert start!40668)

(declare-fun b_free!10693 () Bool)

(declare-fun b_next!10693 () Bool)

(assert (=> start!40668 (= b_free!10693 (not b_next!10693))))

(declare-fun tp!37898 () Bool)

(declare-fun b_and!18675 () Bool)

(assert (=> start!40668 (= tp!37898 b_and!18675)))

(declare-fun b!449491 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun e!263483 () Bool)

(declare-datatypes ((array!27867 0))(
  ( (array!27868 (arr!13379 (Array (_ BitVec 32) (_ BitVec 64))) (size!13732 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27867)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449491 (= e!263483 (and (= from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13732 _keys!709)) (bvsge (bvsub (size!13732 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13732 _keys!709) from!863))))))

(declare-datatypes ((V!17147 0))(
  ( (V!17148 (val!6060 Int)) )
))
(declare-fun minValue!515 () V!17147)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5672 0))(
  ( (ValueCellFull!5672 (v!8309 V!17147)) (EmptyCell!5672) )
))
(declare-datatypes ((array!27869 0))(
  ( (array!27870 (arr!13380 (Array (_ BitVec 32) ValueCell!5672)) (size!13733 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27869)

(declare-fun lt!204198 () array!27867)

(declare-fun v!412 () V!17147)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7966 0))(
  ( (tuple2!7967 (_1!3994 (_ BitVec 64)) (_2!3994 V!17147)) )
))
(declare-datatypes ((List!8030 0))(
  ( (Nil!8027) (Cons!8026 (h!8882 tuple2!7966) (t!13783 List!8030)) )
))
(declare-datatypes ((ListLongMap!6869 0))(
  ( (ListLongMap!6870 (toList!3450 List!8030)) )
))
(declare-fun lt!204196 () ListLongMap!6869)

(declare-fun zeroValue!515 () V!17147)

(declare-fun getCurrentListMapNoExtraKeys!1648 (array!27867 array!27869 (_ BitVec 32) (_ BitVec 32) V!17147 V!17147 (_ BitVec 32) Int) ListLongMap!6869)

(assert (=> b!449491 (= lt!204196 (getCurrentListMapNoExtraKeys!1648 lt!204198 (array!27870 (store (arr!13380 _values!549) i!563 (ValueCellFull!5672 v!412)) (size!13733 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204197 () ListLongMap!6869)

(assert (=> b!449491 (= lt!204197 (getCurrentListMapNoExtraKeys!1648 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449493 () Bool)

(declare-fun res!267471 () Bool)

(declare-fun e!263482 () Bool)

(assert (=> b!449493 (=> (not res!267471) (not e!263482))))

(assert (=> b!449493 (= res!267471 (or (= (select (arr!13379 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13379 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19680 () Bool)

(declare-fun mapRes!19680 () Bool)

(declare-fun tp!37899 () Bool)

(declare-fun e!263486 () Bool)

(assert (=> mapNonEmpty!19680 (= mapRes!19680 (and tp!37899 e!263486))))

(declare-fun mapRest!19680 () (Array (_ BitVec 32) ValueCell!5672))

(declare-fun mapKey!19680 () (_ BitVec 32))

(declare-fun mapValue!19680 () ValueCell!5672)

(assert (=> mapNonEmpty!19680 (= (arr!13380 _values!549) (store mapRest!19680 mapKey!19680 mapValue!19680))))

(declare-fun mapIsEmpty!19680 () Bool)

(assert (=> mapIsEmpty!19680 mapRes!19680))

(declare-fun b!449494 () Bool)

(declare-fun e!263485 () Bool)

(declare-fun tp_is_empty!12031 () Bool)

(assert (=> b!449494 (= e!263485 tp_is_empty!12031)))

(declare-fun b!449495 () Bool)

(declare-fun res!267474 () Bool)

(assert (=> b!449495 (=> (not res!267474) (not e!263482))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449495 (= res!267474 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449496 () Bool)

(declare-fun res!267463 () Bool)

(assert (=> b!449496 (=> (not res!267463) (not e!263482))))

(assert (=> b!449496 (= res!267463 (and (= (size!13733 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13732 _keys!709) (size!13733 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449497 () Bool)

(assert (=> b!449497 (= e!263482 e!263483)))

(declare-fun res!267464 () Bool)

(assert (=> b!449497 (=> (not res!267464) (not e!263483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27867 (_ BitVec 32)) Bool)

(assert (=> b!449497 (= res!267464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204198 mask!1025))))

(assert (=> b!449497 (= lt!204198 (array!27868 (store (arr!13379 _keys!709) i!563 k0!794) (size!13732 _keys!709)))))

(declare-fun b!449498 () Bool)

(declare-fun res!267472 () Bool)

(assert (=> b!449498 (=> (not res!267472) (not e!263482))))

(assert (=> b!449498 (= res!267472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449499 () Bool)

(declare-fun res!267469 () Bool)

(assert (=> b!449499 (=> (not res!267469) (not e!263482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449499 (= res!267469 (validKeyInArray!0 k0!794))))

(declare-fun b!449500 () Bool)

(declare-fun res!267473 () Bool)

(assert (=> b!449500 (=> (not res!267473) (not e!263483))))

(declare-datatypes ((List!8031 0))(
  ( (Nil!8028) (Cons!8027 (h!8883 (_ BitVec 64)) (t!13784 List!8031)) )
))
(declare-fun arrayNoDuplicates!0 (array!27867 (_ BitVec 32) List!8031) Bool)

(assert (=> b!449500 (= res!267473 (arrayNoDuplicates!0 lt!204198 #b00000000000000000000000000000000 Nil!8028))))

(declare-fun b!449492 () Bool)

(declare-fun res!267468 () Bool)

(assert (=> b!449492 (=> (not res!267468) (not e!263482))))

(assert (=> b!449492 (= res!267468 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8028))))

(declare-fun res!267470 () Bool)

(assert (=> start!40668 (=> (not res!267470) (not e!263482))))

(assert (=> start!40668 (= res!267470 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13732 _keys!709))))))

(assert (=> start!40668 e!263482))

(assert (=> start!40668 tp_is_empty!12031))

(assert (=> start!40668 tp!37898))

(assert (=> start!40668 true))

(declare-fun e!263484 () Bool)

(declare-fun array_inv!9752 (array!27869) Bool)

(assert (=> start!40668 (and (array_inv!9752 _values!549) e!263484)))

(declare-fun array_inv!9753 (array!27867) Bool)

(assert (=> start!40668 (array_inv!9753 _keys!709)))

(declare-fun b!449501 () Bool)

(assert (=> b!449501 (= e!263484 (and e!263485 mapRes!19680))))

(declare-fun condMapEmpty!19680 () Bool)

(declare-fun mapDefault!19680 () ValueCell!5672)

(assert (=> b!449501 (= condMapEmpty!19680 (= (arr!13380 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5672)) mapDefault!19680)))))

(declare-fun b!449502 () Bool)

(declare-fun res!267466 () Bool)

(assert (=> b!449502 (=> (not res!267466) (not e!263482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449502 (= res!267466 (validMask!0 mask!1025))))

(declare-fun b!449503 () Bool)

(declare-fun res!267465 () Bool)

(assert (=> b!449503 (=> (not res!267465) (not e!263482))))

(assert (=> b!449503 (= res!267465 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13732 _keys!709))))))

(declare-fun b!449504 () Bool)

(declare-fun res!267467 () Bool)

(assert (=> b!449504 (=> (not res!267467) (not e!263483))))

(assert (=> b!449504 (= res!267467 (bvsle from!863 i!563))))

(declare-fun b!449505 () Bool)

(assert (=> b!449505 (= e!263486 tp_is_empty!12031)))

(assert (= (and start!40668 res!267470) b!449502))

(assert (= (and b!449502 res!267466) b!449496))

(assert (= (and b!449496 res!267463) b!449498))

(assert (= (and b!449498 res!267472) b!449492))

(assert (= (and b!449492 res!267468) b!449503))

(assert (= (and b!449503 res!267465) b!449499))

(assert (= (and b!449499 res!267469) b!449493))

(assert (= (and b!449493 res!267471) b!449495))

(assert (= (and b!449495 res!267474) b!449497))

(assert (= (and b!449497 res!267464) b!449500))

(assert (= (and b!449500 res!267473) b!449504))

(assert (= (and b!449504 res!267467) b!449491))

(assert (= (and b!449501 condMapEmpty!19680) mapIsEmpty!19680))

(assert (= (and b!449501 (not condMapEmpty!19680)) mapNonEmpty!19680))

(get-info :version)

(assert (= (and mapNonEmpty!19680 ((_ is ValueCellFull!5672) mapValue!19680)) b!449505))

(assert (= (and b!449501 ((_ is ValueCellFull!5672) mapDefault!19680)) b!449494))

(assert (= start!40668 b!449501))

(declare-fun m!433141 () Bool)

(assert (=> b!449502 m!433141))

(declare-fun m!433143 () Bool)

(assert (=> b!449498 m!433143))

(declare-fun m!433145 () Bool)

(assert (=> b!449493 m!433145))

(declare-fun m!433147 () Bool)

(assert (=> b!449492 m!433147))

(declare-fun m!433149 () Bool)

(assert (=> mapNonEmpty!19680 m!433149))

(declare-fun m!433151 () Bool)

(assert (=> b!449499 m!433151))

(declare-fun m!433153 () Bool)

(assert (=> b!449497 m!433153))

(declare-fun m!433155 () Bool)

(assert (=> b!449497 m!433155))

(declare-fun m!433157 () Bool)

(assert (=> b!449500 m!433157))

(declare-fun m!433159 () Bool)

(assert (=> start!40668 m!433159))

(declare-fun m!433161 () Bool)

(assert (=> start!40668 m!433161))

(declare-fun m!433163 () Bool)

(assert (=> b!449495 m!433163))

(declare-fun m!433165 () Bool)

(assert (=> b!449491 m!433165))

(declare-fun m!433167 () Bool)

(assert (=> b!449491 m!433167))

(declare-fun m!433169 () Bool)

(assert (=> b!449491 m!433169))

(check-sat (not b!449491) (not mapNonEmpty!19680) (not start!40668) (not b!449495) b_and!18675 (not b!449500) (not b!449499) tp_is_empty!12031 (not b!449502) (not b!449492) (not b!449497) (not b!449498) (not b_next!10693))
(check-sat b_and!18675 (not b_next!10693))
