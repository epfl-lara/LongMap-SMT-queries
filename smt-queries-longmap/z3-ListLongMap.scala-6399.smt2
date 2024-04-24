; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82358 () Bool)

(assert start!82358)

(declare-fun b_free!18463 () Bool)

(declare-fun b_next!18463 () Bool)

(assert (=> start!82358 (= b_free!18463 (not b_next!18463))))

(declare-fun tp!64351 () Bool)

(declare-fun b_and!29961 () Bool)

(assert (=> start!82358 (= tp!64351 b_and!29961)))

(declare-fun b!958832 () Bool)

(declare-fun e!540624 () Bool)

(assert (=> b!958832 (= e!540624 false)))

(declare-fun lt!430747 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33209 0))(
  ( (V!33210 (val!10635 Int)) )
))
(declare-fun minValue!1328 () V!33209)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58468 0))(
  ( (array!58469 (arr!28103 (Array (_ BitVec 32) (_ BitVec 64))) (size!28583 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58468)

(declare-datatypes ((ValueCell!10103 0))(
  ( (ValueCellFull!10103 (v!13189 V!33209)) (EmptyCell!10103) )
))
(declare-datatypes ((array!58470 0))(
  ( (array!58471 (arr!28104 (Array (_ BitVec 32) ValueCell!10103)) (size!28584 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58470)

(declare-fun zeroValue!1328 () V!33209)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13692 0))(
  ( (tuple2!13693 (_1!6857 (_ BitVec 64)) (_2!6857 V!33209)) )
))
(declare-datatypes ((List!19524 0))(
  ( (Nil!19521) (Cons!19520 (h!20688 tuple2!13692) (t!27879 List!19524)) )
))
(declare-datatypes ((ListLongMap!12391 0))(
  ( (ListLongMap!12392 (toList!6211 List!19524)) )
))
(declare-fun contains!5325 (ListLongMap!12391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3444 (array!58468 array!58470 (_ BitVec 32) (_ BitVec 32) V!33209 V!33209 (_ BitVec 32) Int) ListLongMap!12391)

(assert (=> b!958832 (= lt!430747 (contains!5325 (getCurrentListMap!3444 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28103 _keys!1668) i!793)))))

(declare-fun b!958833 () Bool)

(declare-fun e!540625 () Bool)

(declare-fun e!540627 () Bool)

(declare-fun mapRes!33733 () Bool)

(assert (=> b!958833 (= e!540625 (and e!540627 mapRes!33733))))

(declare-fun condMapEmpty!33733 () Bool)

(declare-fun mapDefault!33733 () ValueCell!10103)

(assert (=> b!958833 (= condMapEmpty!33733 (= (arr!28104 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10103)) mapDefault!33733)))))

(declare-fun mapNonEmpty!33733 () Bool)

(declare-fun tp!64350 () Bool)

(declare-fun e!540626 () Bool)

(assert (=> mapNonEmpty!33733 (= mapRes!33733 (and tp!64350 e!540626))))

(declare-fun mapRest!33733 () (Array (_ BitVec 32) ValueCell!10103))

(declare-fun mapValue!33733 () ValueCell!10103)

(declare-fun mapKey!33733 () (_ BitVec 32))

(assert (=> mapNonEmpty!33733 (= (arr!28104 _values!1386) (store mapRest!33733 mapKey!33733 mapValue!33733))))

(declare-fun res!641553 () Bool)

(assert (=> start!82358 (=> (not res!641553) (not e!540624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82358 (= res!641553 (validMask!0 mask!2088))))

(assert (=> start!82358 e!540624))

(assert (=> start!82358 true))

(declare-fun tp_is_empty!21169 () Bool)

(assert (=> start!82358 tp_is_empty!21169))

(declare-fun array_inv!21873 (array!58468) Bool)

(assert (=> start!82358 (array_inv!21873 _keys!1668)))

(declare-fun array_inv!21874 (array!58470) Bool)

(assert (=> start!82358 (and (array_inv!21874 _values!1386) e!540625)))

(assert (=> start!82358 tp!64351))

(declare-fun b!958834 () Bool)

(declare-fun res!641551 () Bool)

(assert (=> b!958834 (=> (not res!641551) (not e!540624))))

(assert (=> b!958834 (= res!641551 (and (= (size!28584 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28583 _keys!1668) (size!28584 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958835 () Bool)

(assert (=> b!958835 (= e!540627 tp_is_empty!21169)))

(declare-fun mapIsEmpty!33733 () Bool)

(assert (=> mapIsEmpty!33733 mapRes!33733))

(declare-fun b!958836 () Bool)

(declare-fun res!641554 () Bool)

(assert (=> b!958836 (=> (not res!641554) (not e!540624))))

(declare-datatypes ((List!19525 0))(
  ( (Nil!19522) (Cons!19521 (h!20689 (_ BitVec 64)) (t!27880 List!19525)) )
))
(declare-fun arrayNoDuplicates!0 (array!58468 (_ BitVec 32) List!19525) Bool)

(assert (=> b!958836 (= res!641554 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19522))))

(declare-fun b!958837 () Bool)

(declare-fun res!641550 () Bool)

(assert (=> b!958837 (=> (not res!641550) (not e!540624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58468 (_ BitVec 32)) Bool)

(assert (=> b!958837 (= res!641550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958838 () Bool)

(declare-fun res!641552 () Bool)

(assert (=> b!958838 (=> (not res!641552) (not e!540624))))

(assert (=> b!958838 (= res!641552 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28583 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28583 _keys!1668))))))

(declare-fun b!958839 () Bool)

(declare-fun res!641549 () Bool)

(assert (=> b!958839 (=> (not res!641549) (not e!540624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958839 (= res!641549 (validKeyInArray!0 (select (arr!28103 _keys!1668) i!793)))))

(declare-fun b!958840 () Bool)

(assert (=> b!958840 (= e!540626 tp_is_empty!21169)))

(assert (= (and start!82358 res!641553) b!958834))

(assert (= (and b!958834 res!641551) b!958837))

(assert (= (and b!958837 res!641550) b!958836))

(assert (= (and b!958836 res!641554) b!958838))

(assert (= (and b!958838 res!641552) b!958839))

(assert (= (and b!958839 res!641549) b!958832))

(assert (= (and b!958833 condMapEmpty!33733) mapIsEmpty!33733))

(assert (= (and b!958833 (not condMapEmpty!33733)) mapNonEmpty!33733))

(get-info :version)

(assert (= (and mapNonEmpty!33733 ((_ is ValueCellFull!10103) mapValue!33733)) b!958840))

(assert (= (and b!958833 ((_ is ValueCellFull!10103) mapDefault!33733)) b!958835))

(assert (= start!82358 b!958833))

(declare-fun m!890031 () Bool)

(assert (=> mapNonEmpty!33733 m!890031))

(declare-fun m!890033 () Bool)

(assert (=> start!82358 m!890033))

(declare-fun m!890035 () Bool)

(assert (=> start!82358 m!890035))

(declare-fun m!890037 () Bool)

(assert (=> start!82358 m!890037))

(declare-fun m!890039 () Bool)

(assert (=> b!958836 m!890039))

(declare-fun m!890041 () Bool)

(assert (=> b!958837 m!890041))

(declare-fun m!890043 () Bool)

(assert (=> b!958832 m!890043))

(declare-fun m!890045 () Bool)

(assert (=> b!958832 m!890045))

(assert (=> b!958832 m!890043))

(assert (=> b!958832 m!890045))

(declare-fun m!890047 () Bool)

(assert (=> b!958832 m!890047))

(assert (=> b!958839 m!890045))

(assert (=> b!958839 m!890045))

(declare-fun m!890049 () Bool)

(assert (=> b!958839 m!890049))

(check-sat (not b!958832) (not b!958837) (not b!958839) (not b_next!18463) (not mapNonEmpty!33733) (not b!958836) b_and!29961 tp_is_empty!21169 (not start!82358))
(check-sat b_and!29961 (not b_next!18463))
