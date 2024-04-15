; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82220 () Bool)

(assert start!82220)

(declare-fun b_free!18511 () Bool)

(declare-fun b_next!18511 () Bool)

(assert (=> start!82220 (= b_free!18511 (not b_next!18511))))

(declare-fun tp!64494 () Bool)

(declare-fun b_and!29973 () Bool)

(assert (=> start!82220 (= tp!64494 b_and!29973)))

(declare-fun b!958338 () Bool)

(declare-fun res!641532 () Bool)

(declare-fun e!540256 () Bool)

(assert (=> b!958338 (=> (not res!641532) (not e!540256))))

(declare-datatypes ((array!58470 0))(
  ( (array!58471 (arr!28109 (Array (_ BitVec 32) (_ BitVec 64))) (size!28590 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58470)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58470 (_ BitVec 32)) Bool)

(assert (=> b!958338 (= res!641532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958339 () Bool)

(declare-fun res!641530 () Bool)

(assert (=> b!958339 (=> (not res!641530) (not e!540256))))

(declare-datatypes ((List!19578 0))(
  ( (Nil!19575) (Cons!19574 (h!20736 (_ BitVec 64)) (t!27932 List!19578)) )
))
(declare-fun arrayNoDuplicates!0 (array!58470 (_ BitVec 32) List!19578) Bool)

(assert (=> b!958339 (= res!641530 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19575))))

(declare-fun b!958340 () Bool)

(declare-fun e!540253 () Bool)

(declare-fun tp_is_empty!21217 () Bool)

(assert (=> b!958340 (= e!540253 tp_is_empty!21217)))

(declare-fun mapIsEmpty!33805 () Bool)

(declare-fun mapRes!33805 () Bool)

(assert (=> mapIsEmpty!33805 mapRes!33805))

(declare-fun res!641528 () Bool)

(assert (=> start!82220 (=> (not res!641528) (not e!540256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82220 (= res!641528 (validMask!0 mask!2088))))

(assert (=> start!82220 e!540256))

(assert (=> start!82220 true))

(assert (=> start!82220 tp_is_empty!21217))

(declare-fun array_inv!21857 (array!58470) Bool)

(assert (=> start!82220 (array_inv!21857 _keys!1668)))

(declare-datatypes ((V!33273 0))(
  ( (V!33274 (val!10659 Int)) )
))
(declare-datatypes ((ValueCell!10127 0))(
  ( (ValueCellFull!10127 (v!13215 V!33273)) (EmptyCell!10127) )
))
(declare-datatypes ((array!58472 0))(
  ( (array!58473 (arr!28110 (Array (_ BitVec 32) ValueCell!10127)) (size!28591 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58472)

(declare-fun e!540257 () Bool)

(declare-fun array_inv!21858 (array!58472) Bool)

(assert (=> start!82220 (and (array_inv!21858 _values!1386) e!540257)))

(assert (=> start!82220 tp!64494))

(declare-fun b!958341 () Bool)

(declare-fun res!641527 () Bool)

(assert (=> b!958341 (=> (not res!641527) (not e!540256))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958341 (= res!641527 (validKeyInArray!0 (select (arr!28109 _keys!1668) i!793)))))

(declare-fun b!958342 () Bool)

(declare-fun res!641531 () Bool)

(assert (=> b!958342 (=> (not res!641531) (not e!540256))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958342 (= res!641531 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28590 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28590 _keys!1668))))))

(declare-fun b!958343 () Bool)

(declare-fun res!641529 () Bool)

(assert (=> b!958343 (=> (not res!641529) (not e!540256))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958343 (= res!641529 (and (= (size!28591 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28590 _keys!1668) (size!28591 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958344 () Bool)

(assert (=> b!958344 (= e!540256 false)))

(declare-fun minValue!1328 () V!33273)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33273)

(declare-fun lt!430222 () Bool)

(declare-datatypes ((tuple2!13792 0))(
  ( (tuple2!13793 (_1!6907 (_ BitVec 64)) (_2!6907 V!33273)) )
))
(declare-datatypes ((List!19579 0))(
  ( (Nil!19576) (Cons!19575 (h!20737 tuple2!13792) (t!27933 List!19579)) )
))
(declare-datatypes ((ListLongMap!12479 0))(
  ( (ListLongMap!12480 (toList!6255 List!19579)) )
))
(declare-fun contains!5301 (ListLongMap!12479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3417 (array!58470 array!58472 (_ BitVec 32) (_ BitVec 32) V!33273 V!33273 (_ BitVec 32) Int) ListLongMap!12479)

(assert (=> b!958344 (= lt!430222 (contains!5301 (getCurrentListMap!3417 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28109 _keys!1668) i!793)))))

(declare-fun b!958345 () Bool)

(declare-fun e!540255 () Bool)

(assert (=> b!958345 (= e!540257 (and e!540255 mapRes!33805))))

(declare-fun condMapEmpty!33805 () Bool)

(declare-fun mapDefault!33805 () ValueCell!10127)

(assert (=> b!958345 (= condMapEmpty!33805 (= (arr!28110 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10127)) mapDefault!33805)))))

(declare-fun mapNonEmpty!33805 () Bool)

(declare-fun tp!64495 () Bool)

(assert (=> mapNonEmpty!33805 (= mapRes!33805 (and tp!64495 e!540253))))

(declare-fun mapValue!33805 () ValueCell!10127)

(declare-fun mapKey!33805 () (_ BitVec 32))

(declare-fun mapRest!33805 () (Array (_ BitVec 32) ValueCell!10127))

(assert (=> mapNonEmpty!33805 (= (arr!28110 _values!1386) (store mapRest!33805 mapKey!33805 mapValue!33805))))

(declare-fun b!958346 () Bool)

(assert (=> b!958346 (= e!540255 tp_is_empty!21217)))

(assert (= (and start!82220 res!641528) b!958343))

(assert (= (and b!958343 res!641529) b!958338))

(assert (= (and b!958338 res!641532) b!958339))

(assert (= (and b!958339 res!641530) b!958342))

(assert (= (and b!958342 res!641531) b!958341))

(assert (= (and b!958341 res!641527) b!958344))

(assert (= (and b!958345 condMapEmpty!33805) mapIsEmpty!33805))

(assert (= (and b!958345 (not condMapEmpty!33805)) mapNonEmpty!33805))

(get-info :version)

(assert (= (and mapNonEmpty!33805 ((_ is ValueCellFull!10127) mapValue!33805)) b!958340))

(assert (= (and b!958345 ((_ is ValueCellFull!10127) mapDefault!33805)) b!958346))

(assert (= start!82220 b!958345))

(declare-fun m!888459 () Bool)

(assert (=> b!958341 m!888459))

(assert (=> b!958341 m!888459))

(declare-fun m!888461 () Bool)

(assert (=> b!958341 m!888461))

(declare-fun m!888463 () Bool)

(assert (=> mapNonEmpty!33805 m!888463))

(declare-fun m!888465 () Bool)

(assert (=> start!82220 m!888465))

(declare-fun m!888467 () Bool)

(assert (=> start!82220 m!888467))

(declare-fun m!888469 () Bool)

(assert (=> start!82220 m!888469))

(declare-fun m!888471 () Bool)

(assert (=> b!958338 m!888471))

(declare-fun m!888473 () Bool)

(assert (=> b!958344 m!888473))

(assert (=> b!958344 m!888459))

(assert (=> b!958344 m!888473))

(assert (=> b!958344 m!888459))

(declare-fun m!888475 () Bool)

(assert (=> b!958344 m!888475))

(declare-fun m!888477 () Bool)

(assert (=> b!958339 m!888477))

(check-sat (not b!958339) (not b_next!18511) (not b!958338) (not b!958344) b_and!29973 (not b!958341) (not start!82220) tp_is_empty!21217 (not mapNonEmpty!33805))
(check-sat b_and!29973 (not b_next!18511))
