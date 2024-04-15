; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!946 () Bool)

(assert start!946)

(declare-fun b_free!319 () Bool)

(declare-fun b_next!319 () Bool)

(assert (=> start!946 (= b_free!319 (not b_next!319))))

(declare-fun tp!1190 () Bool)

(declare-fun b_and!467 () Bool)

(assert (=> start!946 (= tp!1190 b_and!467)))

(declare-fun b!8005 () Bool)

(declare-fun e!4532 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8005 (= e!4532 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8006 () Bool)

(declare-fun e!4535 () Bool)

(declare-fun tp_is_empty!397 () Bool)

(assert (=> b!8006 (= e!4535 tp_is_empty!397)))

(declare-fun b!8007 () Bool)

(declare-fun res!7729 () Bool)

(declare-fun e!4537 () Bool)

(assert (=> b!8007 (=> (not res!7729) (not e!4537))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!707 0))(
  ( (V!708 (val!204 Int)) )
))
(declare-datatypes ((ValueCell!182 0))(
  ( (ValueCellFull!182 (v!1296 V!707)) (EmptyCell!182) )
))
(declare-datatypes ((array!709 0))(
  ( (array!710 (arr!342 (Array (_ BitVec 32) ValueCell!182)) (size!404 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!709)

(declare-datatypes ((array!711 0))(
  ( (array!712 (arr!343 (Array (_ BitVec 32) (_ BitVec 64))) (size!405 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!711)

(assert (=> b!8007 (= res!7729 (and (= (size!404 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!405 _keys!1806) (size!404 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8008 () Bool)

(declare-fun e!4533 () Bool)

(declare-fun e!4534 () Bool)

(declare-fun mapRes!569 () Bool)

(assert (=> b!8008 (= e!4533 (and e!4534 mapRes!569))))

(declare-fun condMapEmpty!569 () Bool)

(declare-fun mapDefault!569 () ValueCell!182)

(assert (=> b!8008 (= condMapEmpty!569 (= (arr!342 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!182)) mapDefault!569)))))

(declare-fun mapNonEmpty!569 () Bool)

(declare-fun tp!1189 () Bool)

(assert (=> mapNonEmpty!569 (= mapRes!569 (and tp!1189 e!4535))))

(declare-fun mapRest!569 () (Array (_ BitVec 32) ValueCell!182))

(declare-fun mapValue!569 () ValueCell!182)

(declare-fun mapKey!569 () (_ BitVec 32))

(assert (=> mapNonEmpty!569 (= (arr!342 _values!1492) (store mapRest!569 mapKey!569 mapValue!569))))

(declare-fun res!7731 () Bool)

(assert (=> start!946 (=> (not res!7731) (not e!4537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!946 (= res!7731 (validMask!0 mask!2250))))

(assert (=> start!946 e!4537))

(assert (=> start!946 tp!1190))

(assert (=> start!946 true))

(declare-fun array_inv!251 (array!709) Bool)

(assert (=> start!946 (and (array_inv!251 _values!1492) e!4533)))

(assert (=> start!946 tp_is_empty!397))

(declare-fun array_inv!252 (array!711) Bool)

(assert (=> start!946 (array_inv!252 _keys!1806)))

(declare-fun b!8009 () Bool)

(assert (=> b!8009 (= e!4534 tp_is_empty!397)))

(declare-fun b!8010 () Bool)

(declare-fun res!7735 () Bool)

(assert (=> b!8010 (=> (not res!7735) (not e!4537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8010 (= res!7735 (validKeyInArray!0 k0!1278))))

(declare-fun b!8011 () Bool)

(declare-fun e!4536 () Bool)

(assert (=> b!8011 (= e!4537 (not e!4536))))

(declare-fun res!7734 () Bool)

(assert (=> b!8011 (=> res!7734 e!4536)))

(declare-fun arrayContainsKey!0 (array!711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8011 (= res!7734 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8011 e!4532))

(declare-fun c!560 () Bool)

(assert (=> b!8011 (= c!560 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!707)

(declare-fun zeroValue!1434 () V!707)

(declare-datatypes ((Unit!149 0))(
  ( (Unit!150) )
))
(declare-fun lt!1620 () Unit!149)

(declare-fun lemmaKeyInListMapIsInArray!56 (array!711 array!709 (_ BitVec 32) (_ BitVec 32) V!707 V!707 (_ BitVec 64) Int) Unit!149)

(assert (=> b!8011 (= lt!1620 (lemmaKeyInListMapIsInArray!56 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8012 () Bool)

(assert (=> b!8012 (= e!4532 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8013 () Bool)

(declare-fun res!7732 () Bool)

(assert (=> b!8013 (=> (not res!7732) (not e!4537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!711 (_ BitVec 32)) Bool)

(assert (=> b!8013 (= res!7732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8014 () Bool)

(assert (=> b!8014 (= e!4536 true)))

(declare-fun lt!1619 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!711 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8014 (= lt!1619 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8015 () Bool)

(declare-fun res!7730 () Bool)

(assert (=> b!8015 (=> (not res!7730) (not e!4537))))

(declare-datatypes ((List!236 0))(
  ( (Nil!233) (Cons!232 (h!798 (_ BitVec 64)) (t!2373 List!236)) )
))
(declare-fun arrayNoDuplicates!0 (array!711 (_ BitVec 32) List!236) Bool)

(assert (=> b!8015 (= res!7730 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!233))))

(declare-fun mapIsEmpty!569 () Bool)

(assert (=> mapIsEmpty!569 mapRes!569))

(declare-fun b!8016 () Bool)

(declare-fun res!7733 () Bool)

(assert (=> b!8016 (=> (not res!7733) (not e!4537))))

(declare-datatypes ((tuple2!224 0))(
  ( (tuple2!225 (_1!112 (_ BitVec 64)) (_2!112 V!707)) )
))
(declare-datatypes ((List!237 0))(
  ( (Nil!234) (Cons!233 (h!799 tuple2!224) (t!2374 List!237)) )
))
(declare-datatypes ((ListLongMap!229 0))(
  ( (ListLongMap!230 (toList!130 List!237)) )
))
(declare-fun contains!105 (ListLongMap!229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!89 (array!711 array!709 (_ BitVec 32) (_ BitVec 32) V!707 V!707 (_ BitVec 32) Int) ListLongMap!229)

(assert (=> b!8016 (= res!7733 (contains!105 (getCurrentListMap!89 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(assert (= (and start!946 res!7731) b!8007))

(assert (= (and b!8007 res!7729) b!8013))

(assert (= (and b!8013 res!7732) b!8015))

(assert (= (and b!8015 res!7730) b!8016))

(assert (= (and b!8016 res!7733) b!8010))

(assert (= (and b!8010 res!7735) b!8011))

(assert (= (and b!8011 c!560) b!8012))

(assert (= (and b!8011 (not c!560)) b!8005))

(assert (= (and b!8011 (not res!7734)) b!8014))

(assert (= (and b!8008 condMapEmpty!569) mapIsEmpty!569))

(assert (= (and b!8008 (not condMapEmpty!569)) mapNonEmpty!569))

(get-info :version)

(assert (= (and mapNonEmpty!569 ((_ is ValueCellFull!182) mapValue!569)) b!8006))

(assert (= (and b!8008 ((_ is ValueCellFull!182) mapDefault!569)) b!8009))

(assert (= start!946 b!8008))

(declare-fun m!4901 () Bool)

(assert (=> b!8016 m!4901))

(assert (=> b!8016 m!4901))

(declare-fun m!4903 () Bool)

(assert (=> b!8016 m!4903))

(declare-fun m!4905 () Bool)

(assert (=> start!946 m!4905))

(declare-fun m!4907 () Bool)

(assert (=> start!946 m!4907))

(declare-fun m!4909 () Bool)

(assert (=> start!946 m!4909))

(declare-fun m!4911 () Bool)

(assert (=> b!8014 m!4911))

(declare-fun m!4913 () Bool)

(assert (=> b!8012 m!4913))

(declare-fun m!4915 () Bool)

(assert (=> b!8010 m!4915))

(declare-fun m!4917 () Bool)

(assert (=> b!8013 m!4917))

(declare-fun m!4919 () Bool)

(assert (=> mapNonEmpty!569 m!4919))

(assert (=> b!8011 m!4913))

(declare-fun m!4921 () Bool)

(assert (=> b!8011 m!4921))

(declare-fun m!4923 () Bool)

(assert (=> b!8015 m!4923))

(check-sat (not start!946) (not b_next!319) tp_is_empty!397 (not b!8016) (not mapNonEmpty!569) (not b!8011) (not b!8014) (not b!8010) b_and!467 (not b!8013) (not b!8015) (not b!8012))
(check-sat b_and!467 (not b_next!319))
