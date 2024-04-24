; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39554 () Bool)

(assert start!39554)

(declare-fun b_free!9835 () Bool)

(declare-fun b_next!9835 () Bool)

(assert (=> start!39554 (= b_free!9835 (not b_next!9835))))

(declare-fun tp!35033 () Bool)

(declare-fun b_and!17505 () Bool)

(assert (=> start!39554 (= tp!35033 b_and!17505)))

(declare-fun b!423485 () Bool)

(declare-fun res!247558 () Bool)

(declare-fun e!251741 () Bool)

(assert (=> b!423485 (=> (not res!247558) (not e!251741))))

(declare-datatypes ((array!25826 0))(
  ( (array!25827 (arr!12362 (Array (_ BitVec 32) (_ BitVec 64))) (size!12714 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25826)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423485 (= res!247558 (or (= (select (arr!12362 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12362 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423486 () Bool)

(declare-fun res!247549 () Bool)

(assert (=> b!423486 (=> (not res!247549) (not e!251741))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423486 (= res!247549 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18102 () Bool)

(declare-fun mapRes!18102 () Bool)

(assert (=> mapIsEmpty!18102 mapRes!18102))

(declare-fun b!423487 () Bool)

(declare-fun res!247550 () Bool)

(assert (=> b!423487 (=> (not res!247550) (not e!251741))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423487 (= res!247550 (validMask!0 mask!1025))))

(declare-fun b!423488 () Bool)

(declare-fun res!247560 () Bool)

(assert (=> b!423488 (=> (not res!247560) (not e!251741))))

(declare-datatypes ((List!7161 0))(
  ( (Nil!7158) (Cons!7157 (h!8013 (_ BitVec 64)) (t!12597 List!7161)) )
))
(declare-fun arrayNoDuplicates!0 (array!25826 (_ BitVec 32) List!7161) Bool)

(assert (=> b!423488 (= res!247560 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7158))))

(declare-fun b!423489 () Bool)

(declare-fun res!247553 () Bool)

(assert (=> b!423489 (=> (not res!247553) (not e!251741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423489 (= res!247553 (validKeyInArray!0 k0!794))))

(declare-fun b!423490 () Bool)

(declare-fun e!251744 () Bool)

(declare-fun e!251745 () Bool)

(assert (=> b!423490 (= e!251744 (and e!251745 mapRes!18102))))

(declare-fun condMapEmpty!18102 () Bool)

(declare-datatypes ((V!15755 0))(
  ( (V!15756 (val!5538 Int)) )
))
(declare-datatypes ((ValueCell!5150 0))(
  ( (ValueCellFull!5150 (v!7786 V!15755)) (EmptyCell!5150) )
))
(declare-datatypes ((array!25828 0))(
  ( (array!25829 (arr!12363 (Array (_ BitVec 32) ValueCell!5150)) (size!12715 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25828)

(declare-fun mapDefault!18102 () ValueCell!5150)

(assert (=> b!423490 (= condMapEmpty!18102 (= (arr!12363 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5150)) mapDefault!18102)))))

(declare-fun b!423491 () Bool)

(declare-fun e!251746 () Bool)

(assert (=> b!423491 (= e!251746 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15755)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15755)

(declare-datatypes ((tuple2!7156 0))(
  ( (tuple2!7157 (_1!3589 (_ BitVec 64)) (_2!3589 V!15755)) )
))
(declare-datatypes ((List!7162 0))(
  ( (Nil!7159) (Cons!7158 (h!8014 tuple2!7156) (t!12598 List!7162)) )
))
(declare-datatypes ((ListLongMap!6071 0))(
  ( (ListLongMap!6072 (toList!3051 List!7162)) )
))
(declare-fun lt!194207 () ListLongMap!6071)

(declare-fun v!412 () V!15755)

(declare-fun lt!194206 () array!25826)

(declare-fun getCurrentListMapNoExtraKeys!1297 (array!25826 array!25828 (_ BitVec 32) (_ BitVec 32) V!15755 V!15755 (_ BitVec 32) Int) ListLongMap!6071)

(assert (=> b!423491 (= lt!194207 (getCurrentListMapNoExtraKeys!1297 lt!194206 (array!25829 (store (arr!12363 _values!549) i!563 (ValueCellFull!5150 v!412)) (size!12715 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194208 () ListLongMap!6071)

(assert (=> b!423491 (= lt!194208 (getCurrentListMapNoExtraKeys!1297 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423492 () Bool)

(declare-fun res!247557 () Bool)

(assert (=> b!423492 (=> (not res!247557) (not e!251746))))

(assert (=> b!423492 (= res!247557 (arrayNoDuplicates!0 lt!194206 #b00000000000000000000000000000000 Nil!7158))))

(declare-fun b!423493 () Bool)

(declare-fun tp_is_empty!10987 () Bool)

(assert (=> b!423493 (= e!251745 tp_is_empty!10987)))

(declare-fun b!423494 () Bool)

(assert (=> b!423494 (= e!251741 e!251746)))

(declare-fun res!247555 () Bool)

(assert (=> b!423494 (=> (not res!247555) (not e!251746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25826 (_ BitVec 32)) Bool)

(assert (=> b!423494 (= res!247555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194206 mask!1025))))

(assert (=> b!423494 (= lt!194206 (array!25827 (store (arr!12362 _keys!709) i!563 k0!794) (size!12714 _keys!709)))))

(declare-fun b!423495 () Bool)

(declare-fun res!247559 () Bool)

(assert (=> b!423495 (=> (not res!247559) (not e!251746))))

(assert (=> b!423495 (= res!247559 (bvsle from!863 i!563))))

(declare-fun b!423496 () Bool)

(declare-fun e!251743 () Bool)

(assert (=> b!423496 (= e!251743 tp_is_empty!10987)))

(declare-fun b!423497 () Bool)

(declare-fun res!247556 () Bool)

(assert (=> b!423497 (=> (not res!247556) (not e!251741))))

(assert (=> b!423497 (= res!247556 (and (= (size!12715 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12714 _keys!709) (size!12715 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18102 () Bool)

(declare-fun tp!35034 () Bool)

(assert (=> mapNonEmpty!18102 (= mapRes!18102 (and tp!35034 e!251743))))

(declare-fun mapRest!18102 () (Array (_ BitVec 32) ValueCell!5150))

(declare-fun mapValue!18102 () ValueCell!5150)

(declare-fun mapKey!18102 () (_ BitVec 32))

(assert (=> mapNonEmpty!18102 (= (arr!12363 _values!549) (store mapRest!18102 mapKey!18102 mapValue!18102))))

(declare-fun res!247554 () Bool)

(assert (=> start!39554 (=> (not res!247554) (not e!251741))))

(assert (=> start!39554 (= res!247554 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12714 _keys!709))))))

(assert (=> start!39554 e!251741))

(assert (=> start!39554 tp_is_empty!10987))

(assert (=> start!39554 tp!35033))

(assert (=> start!39554 true))

(declare-fun array_inv!9082 (array!25828) Bool)

(assert (=> start!39554 (and (array_inv!9082 _values!549) e!251744)))

(declare-fun array_inv!9083 (array!25826) Bool)

(assert (=> start!39554 (array_inv!9083 _keys!709)))

(declare-fun b!423498 () Bool)

(declare-fun res!247552 () Bool)

(assert (=> b!423498 (=> (not res!247552) (not e!251741))))

(assert (=> b!423498 (= res!247552 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12714 _keys!709))))))

(declare-fun b!423499 () Bool)

(declare-fun res!247551 () Bool)

(assert (=> b!423499 (=> (not res!247551) (not e!251741))))

(assert (=> b!423499 (= res!247551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39554 res!247554) b!423487))

(assert (= (and b!423487 res!247550) b!423497))

(assert (= (and b!423497 res!247556) b!423499))

(assert (= (and b!423499 res!247551) b!423488))

(assert (= (and b!423488 res!247560) b!423498))

(assert (= (and b!423498 res!247552) b!423489))

(assert (= (and b!423489 res!247553) b!423485))

(assert (= (and b!423485 res!247558) b!423486))

(assert (= (and b!423486 res!247549) b!423494))

(assert (= (and b!423494 res!247555) b!423492))

(assert (= (and b!423492 res!247557) b!423495))

(assert (= (and b!423495 res!247559) b!423491))

(assert (= (and b!423490 condMapEmpty!18102) mapIsEmpty!18102))

(assert (= (and b!423490 (not condMapEmpty!18102)) mapNonEmpty!18102))

(get-info :version)

(assert (= (and mapNonEmpty!18102 ((_ is ValueCellFull!5150) mapValue!18102)) b!423496))

(assert (= (and b!423490 ((_ is ValueCellFull!5150) mapDefault!18102)) b!423493))

(assert (= start!39554 b!423490))

(declare-fun m!413201 () Bool)

(assert (=> b!423487 m!413201))

(declare-fun m!413203 () Bool)

(assert (=> b!423489 m!413203))

(declare-fun m!413205 () Bool)

(assert (=> b!423486 m!413205))

(declare-fun m!413207 () Bool)

(assert (=> b!423491 m!413207))

(declare-fun m!413209 () Bool)

(assert (=> b!423491 m!413209))

(declare-fun m!413211 () Bool)

(assert (=> b!423491 m!413211))

(declare-fun m!413213 () Bool)

(assert (=> b!423499 m!413213))

(declare-fun m!413215 () Bool)

(assert (=> b!423494 m!413215))

(declare-fun m!413217 () Bool)

(assert (=> b!423494 m!413217))

(declare-fun m!413219 () Bool)

(assert (=> b!423485 m!413219))

(declare-fun m!413221 () Bool)

(assert (=> start!39554 m!413221))

(declare-fun m!413223 () Bool)

(assert (=> start!39554 m!413223))

(declare-fun m!413225 () Bool)

(assert (=> b!423492 m!413225))

(declare-fun m!413227 () Bool)

(assert (=> mapNonEmpty!18102 m!413227))

(declare-fun m!413229 () Bool)

(assert (=> b!423488 m!413229))

(check-sat (not b!423486) (not start!39554) (not b!423494) (not b!423499) b_and!17505 (not b!423487) (not b!423491) (not b!423489) tp_is_empty!10987 (not b!423492) (not mapNonEmpty!18102) (not b!423488) (not b_next!9835))
(check-sat b_and!17505 (not b_next!9835))
