; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38442 () Bool)

(assert start!38442)

(declare-fun b!396515 () Bool)

(declare-fun e!239934 () Bool)

(declare-fun e!239933 () Bool)

(declare-fun mapRes!16413 () Bool)

(assert (=> b!396515 (= e!239934 (and e!239933 mapRes!16413))))

(declare-fun condMapEmpty!16413 () Bool)

(declare-datatypes ((V!14253 0))(
  ( (V!14254 (val!4975 Int)) )
))
(declare-datatypes ((ValueCell!4587 0))(
  ( (ValueCellFull!4587 (v!7222 V!14253)) (EmptyCell!4587) )
))
(declare-datatypes ((array!23635 0))(
  ( (array!23636 (arr!11267 (Array (_ BitVec 32) ValueCell!4587)) (size!11619 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23635)

(declare-fun mapDefault!16413 () ValueCell!4587)

(assert (=> b!396515 (= condMapEmpty!16413 (= (arr!11267 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4587)) mapDefault!16413)))))

(declare-fun b!396516 () Bool)

(declare-fun e!239930 () Bool)

(declare-fun tp_is_empty!9861 () Bool)

(assert (=> b!396516 (= e!239930 tp_is_empty!9861)))

(declare-fun b!396517 () Bool)

(declare-fun e!239931 () Bool)

(declare-fun e!239932 () Bool)

(assert (=> b!396517 (= e!239931 e!239932)))

(declare-fun res!227490 () Bool)

(assert (=> b!396517 (=> (not res!227490) (not e!239932))))

(declare-datatypes ((array!23637 0))(
  ( (array!23638 (arr!11268 (Array (_ BitVec 32) (_ BitVec 64))) (size!11620 (_ BitVec 32))) )
))
(declare-fun lt!187162 () array!23637)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23637 (_ BitVec 32)) Bool)

(assert (=> b!396517 (= res!227490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187162 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!23637)

(assert (=> b!396517 (= lt!187162 (array!23638 (store (arr!11268 _keys!709) i!563 k0!794) (size!11620 _keys!709)))))

(declare-fun res!227492 () Bool)

(assert (=> start!38442 (=> (not res!227492) (not e!239931))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38442 (= res!227492 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11620 _keys!709))))))

(assert (=> start!38442 e!239931))

(assert (=> start!38442 true))

(declare-fun array_inv!8264 (array!23635) Bool)

(assert (=> start!38442 (and (array_inv!8264 _values!549) e!239934)))

(declare-fun array_inv!8265 (array!23637) Bool)

(assert (=> start!38442 (array_inv!8265 _keys!709)))

(declare-fun b!396518 () Bool)

(declare-fun res!227496 () Bool)

(assert (=> b!396518 (=> (not res!227496) (not e!239931))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396518 (= res!227496 (and (= (size!11619 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11620 _keys!709) (size!11619 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396519 () Bool)

(assert (=> b!396519 (= e!239932 false)))

(declare-fun lt!187163 () Bool)

(declare-datatypes ((List!6528 0))(
  ( (Nil!6525) (Cons!6524 (h!7380 (_ BitVec 64)) (t!11702 List!6528)) )
))
(declare-fun arrayNoDuplicates!0 (array!23637 (_ BitVec 32) List!6528) Bool)

(assert (=> b!396519 (= lt!187163 (arrayNoDuplicates!0 lt!187162 #b00000000000000000000000000000000 Nil!6525))))

(declare-fun b!396520 () Bool)

(declare-fun res!227495 () Bool)

(assert (=> b!396520 (=> (not res!227495) (not e!239931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396520 (= res!227495 (validMask!0 mask!1025))))

(declare-fun b!396521 () Bool)

(declare-fun res!227498 () Bool)

(assert (=> b!396521 (=> (not res!227498) (not e!239931))))

(assert (=> b!396521 (= res!227498 (or (= (select (arr!11268 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11268 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396522 () Bool)

(declare-fun res!227491 () Bool)

(assert (=> b!396522 (=> (not res!227491) (not e!239931))))

(assert (=> b!396522 (= res!227491 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11620 _keys!709))))))

(declare-fun b!396523 () Bool)

(declare-fun res!227499 () Bool)

(assert (=> b!396523 (=> (not res!227499) (not e!239931))))

(assert (=> b!396523 (= res!227499 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6525))))

(declare-fun b!396524 () Bool)

(declare-fun res!227497 () Bool)

(assert (=> b!396524 (=> (not res!227497) (not e!239931))))

(assert (=> b!396524 (= res!227497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16413 () Bool)

(assert (=> mapIsEmpty!16413 mapRes!16413))

(declare-fun b!396525 () Bool)

(assert (=> b!396525 (= e!239933 tp_is_empty!9861)))

(declare-fun b!396526 () Bool)

(declare-fun res!227494 () Bool)

(assert (=> b!396526 (=> (not res!227494) (not e!239931))))

(declare-fun arrayContainsKey!0 (array!23637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396526 (= res!227494 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16413 () Bool)

(declare-fun tp!32208 () Bool)

(assert (=> mapNonEmpty!16413 (= mapRes!16413 (and tp!32208 e!239930))))

(declare-fun mapKey!16413 () (_ BitVec 32))

(declare-fun mapValue!16413 () ValueCell!4587)

(declare-fun mapRest!16413 () (Array (_ BitVec 32) ValueCell!4587))

(assert (=> mapNonEmpty!16413 (= (arr!11267 _values!549) (store mapRest!16413 mapKey!16413 mapValue!16413))))

(declare-fun b!396527 () Bool)

(declare-fun res!227493 () Bool)

(assert (=> b!396527 (=> (not res!227493) (not e!239931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396527 (= res!227493 (validKeyInArray!0 k0!794))))

(assert (= (and start!38442 res!227492) b!396520))

(assert (= (and b!396520 res!227495) b!396518))

(assert (= (and b!396518 res!227496) b!396524))

(assert (= (and b!396524 res!227497) b!396523))

(assert (= (and b!396523 res!227499) b!396522))

(assert (= (and b!396522 res!227491) b!396527))

(assert (= (and b!396527 res!227493) b!396521))

(assert (= (and b!396521 res!227498) b!396526))

(assert (= (and b!396526 res!227494) b!396517))

(assert (= (and b!396517 res!227490) b!396519))

(assert (= (and b!396515 condMapEmpty!16413) mapIsEmpty!16413))

(assert (= (and b!396515 (not condMapEmpty!16413)) mapNonEmpty!16413))

(get-info :version)

(assert (= (and mapNonEmpty!16413 ((_ is ValueCellFull!4587) mapValue!16413)) b!396516))

(assert (= (and b!396515 ((_ is ValueCellFull!4587) mapDefault!16413)) b!396525))

(assert (= start!38442 b!396515))

(declare-fun m!392119 () Bool)

(assert (=> b!396519 m!392119))

(declare-fun m!392121 () Bool)

(assert (=> b!396524 m!392121))

(declare-fun m!392123 () Bool)

(assert (=> b!396520 m!392123))

(declare-fun m!392125 () Bool)

(assert (=> b!396526 m!392125))

(declare-fun m!392127 () Bool)

(assert (=> b!396517 m!392127))

(declare-fun m!392129 () Bool)

(assert (=> b!396517 m!392129))

(declare-fun m!392131 () Bool)

(assert (=> start!38442 m!392131))

(declare-fun m!392133 () Bool)

(assert (=> start!38442 m!392133))

(declare-fun m!392135 () Bool)

(assert (=> b!396527 m!392135))

(declare-fun m!392137 () Bool)

(assert (=> mapNonEmpty!16413 m!392137))

(declare-fun m!392139 () Bool)

(assert (=> b!396523 m!392139))

(declare-fun m!392141 () Bool)

(assert (=> b!396521 m!392141))

(check-sat (not b!396523) (not b!396520) (not b!396524) (not b!396527) (not b!396519) (not b!396526) (not b!396517) (not mapNonEmpty!16413) (not start!38442) tp_is_empty!9861)
(check-sat)
