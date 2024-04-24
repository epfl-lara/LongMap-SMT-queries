; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82406 () Bool)

(assert start!82406)

(declare-fun b_free!18511 () Bool)

(declare-fun b_next!18511 () Bool)

(assert (=> start!82406 (= b_free!18511 (not b_next!18511))))

(declare-fun tp!64494 () Bool)

(declare-fun b_and!30009 () Bool)

(assert (=> start!82406 (= tp!64494 b_and!30009)))

(declare-fun mapIsEmpty!33805 () Bool)

(declare-fun mapRes!33805 () Bool)

(assert (=> mapIsEmpty!33805 mapRes!33805))

(declare-fun mapNonEmpty!33805 () Bool)

(declare-fun tp!64495 () Bool)

(declare-fun e!540983 () Bool)

(assert (=> mapNonEmpty!33805 (= mapRes!33805 (and tp!64495 e!540983))))

(declare-fun mapKey!33805 () (_ BitVec 32))

(declare-datatypes ((V!33273 0))(
  ( (V!33274 (val!10659 Int)) )
))
(declare-datatypes ((ValueCell!10127 0))(
  ( (ValueCellFull!10127 (v!13213 V!33273)) (EmptyCell!10127) )
))
(declare-fun mapValue!33805 () ValueCell!10127)

(declare-datatypes ((array!58564 0))(
  ( (array!58565 (arr!28151 (Array (_ BitVec 32) ValueCell!10127)) (size!28631 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58564)

(declare-fun mapRest!33805 () (Array (_ BitVec 32) ValueCell!10127))

(assert (=> mapNonEmpty!33805 (= (arr!28151 _values!1386) (store mapRest!33805 mapKey!33805 mapValue!33805))))

(declare-fun b!959480 () Bool)

(declare-fun e!540984 () Bool)

(declare-fun e!540986 () Bool)

(assert (=> b!959480 (= e!540984 (and e!540986 mapRes!33805))))

(declare-fun condMapEmpty!33805 () Bool)

(declare-fun mapDefault!33805 () ValueCell!10127)

(assert (=> b!959480 (= condMapEmpty!33805 (= (arr!28151 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10127)) mapDefault!33805)))))

(declare-fun b!959481 () Bool)

(declare-fun res!641984 () Bool)

(declare-fun e!540985 () Bool)

(assert (=> b!959481 (=> (not res!641984) (not e!540985))))

(declare-datatypes ((array!58566 0))(
  ( (array!58567 (arr!28152 (Array (_ BitVec 32) (_ BitVec 64))) (size!28632 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58566)

(declare-datatypes ((List!19558 0))(
  ( (Nil!19555) (Cons!19554 (h!20722 (_ BitVec 64)) (t!27913 List!19558)) )
))
(declare-fun arrayNoDuplicates!0 (array!58566 (_ BitVec 32) List!19558) Bool)

(assert (=> b!959481 (= res!641984 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19555))))

(declare-fun b!959482 () Bool)

(assert (=> b!959482 (= e!540985 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33273)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430819 () Bool)

(declare-fun zeroValue!1328 () V!33273)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13726 0))(
  ( (tuple2!13727 (_1!6874 (_ BitVec 64)) (_2!6874 V!33273)) )
))
(declare-datatypes ((List!19559 0))(
  ( (Nil!19556) (Cons!19555 (h!20723 tuple2!13726) (t!27914 List!19559)) )
))
(declare-datatypes ((ListLongMap!12425 0))(
  ( (ListLongMap!12426 (toList!6228 List!19559)) )
))
(declare-fun contains!5342 (ListLongMap!12425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3461 (array!58566 array!58564 (_ BitVec 32) (_ BitVec 32) V!33273 V!33273 (_ BitVec 32) Int) ListLongMap!12425)

(assert (=> b!959482 (= lt!430819 (contains!5342 (getCurrentListMap!3461 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28152 _keys!1668) i!793)))))

(declare-fun b!959483 () Bool)

(declare-fun res!641982 () Bool)

(assert (=> b!959483 (=> (not res!641982) (not e!540985))))

(assert (=> b!959483 (= res!641982 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28632 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28632 _keys!1668))))))

(declare-fun b!959484 () Bool)

(declare-fun tp_is_empty!21217 () Bool)

(assert (=> b!959484 (= e!540983 tp_is_empty!21217)))

(declare-fun res!641983 () Bool)

(assert (=> start!82406 (=> (not res!641983) (not e!540985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82406 (= res!641983 (validMask!0 mask!2088))))

(assert (=> start!82406 e!540985))

(assert (=> start!82406 true))

(assert (=> start!82406 tp_is_empty!21217))

(declare-fun array_inv!21907 (array!58566) Bool)

(assert (=> start!82406 (array_inv!21907 _keys!1668)))

(declare-fun array_inv!21908 (array!58564) Bool)

(assert (=> start!82406 (and (array_inv!21908 _values!1386) e!540984)))

(assert (=> start!82406 tp!64494))

(declare-fun b!959485 () Bool)

(declare-fun res!641981 () Bool)

(assert (=> b!959485 (=> (not res!641981) (not e!540985))))

(assert (=> b!959485 (= res!641981 (and (= (size!28631 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28632 _keys!1668) (size!28631 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959486 () Bool)

(assert (=> b!959486 (= e!540986 tp_is_empty!21217)))

(declare-fun b!959487 () Bool)

(declare-fun res!641985 () Bool)

(assert (=> b!959487 (=> (not res!641985) (not e!540985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58566 (_ BitVec 32)) Bool)

(assert (=> b!959487 (= res!641985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959488 () Bool)

(declare-fun res!641986 () Bool)

(assert (=> b!959488 (=> (not res!641986) (not e!540985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959488 (= res!641986 (validKeyInArray!0 (select (arr!28152 _keys!1668) i!793)))))

(assert (= (and start!82406 res!641983) b!959485))

(assert (= (and b!959485 res!641981) b!959487))

(assert (= (and b!959487 res!641985) b!959481))

(assert (= (and b!959481 res!641984) b!959483))

(assert (= (and b!959483 res!641982) b!959488))

(assert (= (and b!959488 res!641986) b!959482))

(assert (= (and b!959480 condMapEmpty!33805) mapIsEmpty!33805))

(assert (= (and b!959480 (not condMapEmpty!33805)) mapNonEmpty!33805))

(get-info :version)

(assert (= (and mapNonEmpty!33805 ((_ is ValueCellFull!10127) mapValue!33805)) b!959484))

(assert (= (and b!959480 ((_ is ValueCellFull!10127) mapDefault!33805)) b!959486))

(assert (= start!82406 b!959480))

(declare-fun m!890511 () Bool)

(assert (=> b!959488 m!890511))

(assert (=> b!959488 m!890511))

(declare-fun m!890513 () Bool)

(assert (=> b!959488 m!890513))

(declare-fun m!890515 () Bool)

(assert (=> mapNonEmpty!33805 m!890515))

(declare-fun m!890517 () Bool)

(assert (=> start!82406 m!890517))

(declare-fun m!890519 () Bool)

(assert (=> start!82406 m!890519))

(declare-fun m!890521 () Bool)

(assert (=> start!82406 m!890521))

(declare-fun m!890523 () Bool)

(assert (=> b!959487 m!890523))

(declare-fun m!890525 () Bool)

(assert (=> b!959481 m!890525))

(declare-fun m!890527 () Bool)

(assert (=> b!959482 m!890527))

(assert (=> b!959482 m!890511))

(assert (=> b!959482 m!890527))

(assert (=> b!959482 m!890511))

(declare-fun m!890529 () Bool)

(assert (=> b!959482 m!890529))

(check-sat (not b!959482) (not b!959488) (not start!82406) (not b!959481) (not b!959487) (not mapNonEmpty!33805) b_and!30009 tp_is_empty!21217 (not b_next!18511))
(check-sat b_and!30009 (not b_next!18511))
