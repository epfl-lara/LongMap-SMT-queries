; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97038 () Bool)

(assert start!97038)

(declare-fun mapIsEmpty!42796 () Bool)

(declare-fun mapRes!42796 () Bool)

(assert (=> mapIsEmpty!42796 mapRes!42796))

(declare-fun b!1103747 () Bool)

(declare-fun e!630077 () Bool)

(declare-fun tp_is_empty!27327 () Bool)

(assert (=> b!1103747 (= e!630077 tp_is_empty!27327)))

(declare-fun mapNonEmpty!42796 () Bool)

(declare-fun tp!81716 () Bool)

(declare-fun e!630081 () Bool)

(assert (=> mapNonEmpty!42796 (= mapRes!42796 (and tp!81716 e!630081))))

(declare-datatypes ((V!41563 0))(
  ( (V!41564 (val!13720 Int)) )
))
(declare-datatypes ((ValueCell!12954 0))(
  ( (ValueCellFull!12954 (v!16352 V!41563)) (EmptyCell!12954) )
))
(declare-fun mapRest!42796 () (Array (_ BitVec 32) ValueCell!12954))

(declare-fun mapValue!42796 () ValueCell!12954)

(declare-fun mapKey!42796 () (_ BitVec 32))

(declare-datatypes ((array!71577 0))(
  ( (array!71578 (arr!34445 (Array (_ BitVec 32) ValueCell!12954)) (size!34981 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71577)

(assert (=> mapNonEmpty!42796 (= (arr!34445 _values!996) (store mapRest!42796 mapKey!42796 mapValue!42796))))

(declare-fun b!1103748 () Bool)

(declare-fun res!736356 () Bool)

(declare-fun e!630078 () Bool)

(assert (=> b!1103748 (=> (not res!736356) (not e!630078))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103748 (= res!736356 (validMask!0 mask!1564))))

(declare-fun b!1103749 () Bool)

(assert (=> b!1103749 (= e!630081 tp_is_empty!27327)))

(declare-fun res!736353 () Bool)

(assert (=> start!97038 (=> (not res!736353) (not e!630078))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71579 0))(
  ( (array!71580 (arr!34446 (Array (_ BitVec 32) (_ BitVec 64))) (size!34982 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71579)

(assert (=> start!97038 (= res!736353 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34982 _keys!1208))))))

(assert (=> start!97038 e!630078))

(declare-fun array_inv!26524 (array!71579) Bool)

(assert (=> start!97038 (array_inv!26524 _keys!1208)))

(assert (=> start!97038 true))

(declare-fun e!630079 () Bool)

(declare-fun array_inv!26525 (array!71577) Bool)

(assert (=> start!97038 (and (array_inv!26525 _values!996) e!630079)))

(declare-fun b!1103750 () Bool)

(declare-fun res!736350 () Bool)

(assert (=> b!1103750 (=> (not res!736350) (not e!630078))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103750 (= res!736350 (validKeyInArray!0 k0!934))))

(declare-fun b!1103751 () Bool)

(declare-fun res!736352 () Bool)

(assert (=> b!1103751 (=> (not res!736352) (not e!630078))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1103751 (= res!736352 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34982 _keys!1208))))))

(declare-fun b!1103752 () Bool)

(assert (=> b!1103752 (= e!630078 (and (= (select (arr!34446 _keys!1208) i!673) k0!934) (= (size!34982 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34982 _keys!1208))))))

(declare-fun b!1103753 () Bool)

(assert (=> b!1103753 (= e!630079 (and e!630077 mapRes!42796))))

(declare-fun condMapEmpty!42796 () Bool)

(declare-fun mapDefault!42796 () ValueCell!12954)

(assert (=> b!1103753 (= condMapEmpty!42796 (= (arr!34445 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12954)) mapDefault!42796)))))

(declare-fun b!1103754 () Bool)

(declare-fun res!736354 () Bool)

(assert (=> b!1103754 (=> (not res!736354) (not e!630078))))

(declare-datatypes ((List!24046 0))(
  ( (Nil!24043) (Cons!24042 (h!25251 (_ BitVec 64)) (t!34311 List!24046)) )
))
(declare-fun arrayNoDuplicates!0 (array!71579 (_ BitVec 32) List!24046) Bool)

(assert (=> b!1103754 (= res!736354 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24043))))

(declare-fun b!1103755 () Bool)

(declare-fun res!736351 () Bool)

(assert (=> b!1103755 (=> (not res!736351) (not e!630078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71579 (_ BitVec 32)) Bool)

(assert (=> b!1103755 (= res!736351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103756 () Bool)

(declare-fun res!736355 () Bool)

(assert (=> b!1103756 (=> (not res!736355) (not e!630078))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103756 (= res!736355 (and (= (size!34981 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34982 _keys!1208) (size!34981 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97038 res!736353) b!1103748))

(assert (= (and b!1103748 res!736356) b!1103756))

(assert (= (and b!1103756 res!736355) b!1103755))

(assert (= (and b!1103755 res!736351) b!1103754))

(assert (= (and b!1103754 res!736354) b!1103751))

(assert (= (and b!1103751 res!736352) b!1103750))

(assert (= (and b!1103750 res!736350) b!1103752))

(assert (= (and b!1103753 condMapEmpty!42796) mapIsEmpty!42796))

(assert (= (and b!1103753 (not condMapEmpty!42796)) mapNonEmpty!42796))

(get-info :version)

(assert (= (and mapNonEmpty!42796 ((_ is ValueCellFull!12954) mapValue!42796)) b!1103749))

(assert (= (and b!1103753 ((_ is ValueCellFull!12954) mapDefault!42796)) b!1103747))

(assert (= start!97038 b!1103753))

(declare-fun m!1023769 () Bool)

(assert (=> b!1103748 m!1023769))

(declare-fun m!1023771 () Bool)

(assert (=> b!1103750 m!1023771))

(declare-fun m!1023773 () Bool)

(assert (=> b!1103755 m!1023773))

(declare-fun m!1023775 () Bool)

(assert (=> b!1103752 m!1023775))

(declare-fun m!1023777 () Bool)

(assert (=> start!97038 m!1023777))

(declare-fun m!1023779 () Bool)

(assert (=> start!97038 m!1023779))

(declare-fun m!1023781 () Bool)

(assert (=> mapNonEmpty!42796 m!1023781))

(declare-fun m!1023783 () Bool)

(assert (=> b!1103754 m!1023783))

(check-sat (not start!97038) (not b!1103748) (not b!1103755) (not mapNonEmpty!42796) (not b!1103750) tp_is_empty!27327 (not b!1103754))
(check-sat)
