; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82234 () Bool)

(assert start!82234)

(declare-fun b_free!18507 () Bool)

(declare-fun b_next!18507 () Bool)

(assert (=> start!82234 (= b_free!18507 (not b_next!18507))))

(declare-fun tp!64481 () Bool)

(declare-fun b_and!29995 () Bool)

(assert (=> start!82234 (= tp!64481 b_and!29995)))

(declare-fun b!958523 () Bool)

(declare-fun res!641602 () Bool)

(declare-fun e!540374 () Bool)

(assert (=> b!958523 (=> (not res!641602) (not e!540374))))

(declare-datatypes ((array!58525 0))(
  ( (array!58526 (arr!28136 (Array (_ BitVec 32) (_ BitVec 64))) (size!28615 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58525)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58525 (_ BitVec 32)) Bool)

(assert (=> b!958523 (= res!641602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958524 () Bool)

(declare-fun res!641604 () Bool)

(assert (=> b!958524 (=> (not res!641604) (not e!540374))))

(declare-datatypes ((List!19559 0))(
  ( (Nil!19556) (Cons!19555 (h!20717 (_ BitVec 64)) (t!27922 List!19559)) )
))
(declare-fun arrayNoDuplicates!0 (array!58525 (_ BitVec 32) List!19559) Bool)

(assert (=> b!958524 (= res!641604 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19556))))

(declare-fun res!641603 () Bool)

(assert (=> start!82234 (=> (not res!641603) (not e!540374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82234 (= res!641603 (validMask!0 mask!2088))))

(assert (=> start!82234 e!540374))

(assert (=> start!82234 true))

(declare-fun tp_is_empty!21213 () Bool)

(assert (=> start!82234 tp_is_empty!21213))

(declare-fun array_inv!21821 (array!58525) Bool)

(assert (=> start!82234 (array_inv!21821 _keys!1668)))

(declare-datatypes ((V!33267 0))(
  ( (V!33268 (val!10657 Int)) )
))
(declare-datatypes ((ValueCell!10125 0))(
  ( (ValueCellFull!10125 (v!13214 V!33267)) (EmptyCell!10125) )
))
(declare-datatypes ((array!58527 0))(
  ( (array!58528 (arr!28137 (Array (_ BitVec 32) ValueCell!10125)) (size!28616 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58527)

(declare-fun e!540375 () Bool)

(declare-fun array_inv!21822 (array!58527) Bool)

(assert (=> start!82234 (and (array_inv!21822 _values!1386) e!540375)))

(assert (=> start!82234 tp!64481))

(declare-fun b!958525 () Bool)

(declare-fun res!641605 () Bool)

(assert (=> b!958525 (=> (not res!641605) (not e!540374))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958525 (= res!641605 (validKeyInArray!0 (select (arr!28136 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33799 () Bool)

(declare-fun mapRes!33799 () Bool)

(declare-fun tp!64482 () Bool)

(declare-fun e!540372 () Bool)

(assert (=> mapNonEmpty!33799 (= mapRes!33799 (and tp!64482 e!540372))))

(declare-fun mapValue!33799 () ValueCell!10125)

(declare-fun mapRest!33799 () (Array (_ BitVec 32) ValueCell!10125))

(declare-fun mapKey!33799 () (_ BitVec 32))

(assert (=> mapNonEmpty!33799 (= (arr!28137 _values!1386) (store mapRest!33799 mapKey!33799 mapValue!33799))))

(declare-fun b!958526 () Bool)

(declare-fun e!540373 () Bool)

(assert (=> b!958526 (= e!540375 (and e!540373 mapRes!33799))))

(declare-fun condMapEmpty!33799 () Bool)

(declare-fun mapDefault!33799 () ValueCell!10125)

(assert (=> b!958526 (= condMapEmpty!33799 (= (arr!28137 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10125)) mapDefault!33799)))))

(declare-fun b!958527 () Bool)

(assert (=> b!958527 (= e!540374 false)))

(declare-fun minValue!1328 () V!33267)

(declare-fun lt!430452 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33267)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13736 0))(
  ( (tuple2!13737 (_1!6879 (_ BitVec 64)) (_2!6879 V!33267)) )
))
(declare-datatypes ((List!19560 0))(
  ( (Nil!19557) (Cons!19556 (h!20718 tuple2!13736) (t!27923 List!19560)) )
))
(declare-datatypes ((ListLongMap!12433 0))(
  ( (ListLongMap!12434 (toList!6232 List!19560)) )
))
(declare-fun contains!5333 (ListLongMap!12433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3465 (array!58525 array!58527 (_ BitVec 32) (_ BitVec 32) V!33267 V!33267 (_ BitVec 32) Int) ListLongMap!12433)

(assert (=> b!958527 (= lt!430452 (contains!5333 (getCurrentListMap!3465 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28136 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33799 () Bool)

(assert (=> mapIsEmpty!33799 mapRes!33799))

(declare-fun b!958528 () Bool)

(assert (=> b!958528 (= e!540372 tp_is_empty!21213)))

(declare-fun b!958529 () Bool)

(assert (=> b!958529 (= e!540373 tp_is_empty!21213)))

(declare-fun b!958530 () Bool)

(declare-fun res!641601 () Bool)

(assert (=> b!958530 (=> (not res!641601) (not e!540374))))

(assert (=> b!958530 (= res!641601 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28615 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28615 _keys!1668))))))

(declare-fun b!958531 () Bool)

(declare-fun res!641606 () Bool)

(assert (=> b!958531 (=> (not res!641606) (not e!540374))))

(assert (=> b!958531 (= res!641606 (and (= (size!28616 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28615 _keys!1668) (size!28616 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82234 res!641603) b!958531))

(assert (= (and b!958531 res!641606) b!958523))

(assert (= (and b!958523 res!641602) b!958524))

(assert (= (and b!958524 res!641604) b!958530))

(assert (= (and b!958530 res!641601) b!958525))

(assert (= (and b!958525 res!641605) b!958527))

(assert (= (and b!958526 condMapEmpty!33799) mapIsEmpty!33799))

(assert (= (and b!958526 (not condMapEmpty!33799)) mapNonEmpty!33799))

(get-info :version)

(assert (= (and mapNonEmpty!33799 ((_ is ValueCellFull!10125) mapValue!33799)) b!958528))

(assert (= (and b!958526 ((_ is ValueCellFull!10125) mapDefault!33799)) b!958529))

(assert (= start!82234 b!958526))

(declare-fun m!889177 () Bool)

(assert (=> b!958527 m!889177))

(declare-fun m!889179 () Bool)

(assert (=> b!958527 m!889179))

(assert (=> b!958527 m!889177))

(assert (=> b!958527 m!889179))

(declare-fun m!889181 () Bool)

(assert (=> b!958527 m!889181))

(declare-fun m!889183 () Bool)

(assert (=> b!958524 m!889183))

(declare-fun m!889185 () Bool)

(assert (=> start!82234 m!889185))

(declare-fun m!889187 () Bool)

(assert (=> start!82234 m!889187))

(declare-fun m!889189 () Bool)

(assert (=> start!82234 m!889189))

(assert (=> b!958525 m!889179))

(assert (=> b!958525 m!889179))

(declare-fun m!889191 () Bool)

(assert (=> b!958525 m!889191))

(declare-fun m!889193 () Bool)

(assert (=> mapNonEmpty!33799 m!889193))

(declare-fun m!889195 () Bool)

(assert (=> b!958523 m!889195))

(check-sat (not b!958525) (not b!958523) b_and!29995 tp_is_empty!21213 (not b!958527) (not start!82234) (not b_next!18507) (not b!958524) (not mapNonEmpty!33799))
(check-sat b_and!29995 (not b_next!18507))
