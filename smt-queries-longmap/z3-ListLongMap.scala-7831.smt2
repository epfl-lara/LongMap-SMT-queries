; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97966 () Bool)

(assert start!97966)

(declare-fun b!1118800 () Bool)

(declare-fun res!746760 () Bool)

(declare-fun e!637426 () Bool)

(assert (=> b!1118800 (=> (not res!746760) (not e!637426))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118800 (= res!746760 (validKeyInArray!0 k0!934))))

(declare-fun b!1118801 () Bool)

(declare-fun e!637424 () Bool)

(assert (=> b!1118801 (= e!637426 e!637424)))

(declare-fun res!746763 () Bool)

(assert (=> b!1118801 (=> (not res!746763) (not e!637424))))

(declare-datatypes ((array!72859 0))(
  ( (array!72860 (arr!35076 (Array (_ BitVec 32) (_ BitVec 64))) (size!35613 (_ BitVec 32))) )
))
(declare-fun lt!497809 () array!72859)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72859 (_ BitVec 32)) Bool)

(assert (=> b!1118801 (= res!746763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497809 mask!1564))))

(declare-fun _keys!1208 () array!72859)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118801 (= lt!497809 (array!72860 (store (arr!35076 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35613 _keys!1208)))))

(declare-fun b!1118802 () Bool)

(declare-fun res!746764 () Bool)

(assert (=> b!1118802 (=> (not res!746764) (not e!637426))))

(assert (=> b!1118802 (= res!746764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43759 () Bool)

(declare-fun mapRes!43759 () Bool)

(assert (=> mapIsEmpty!43759 mapRes!43759))

(declare-fun b!1118803 () Bool)

(assert (=> b!1118803 (= e!637424 (not true))))

(declare-fun arrayContainsKey!0 (array!72859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118803 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36657 0))(
  ( (Unit!36658) )
))
(declare-fun lt!497808 () Unit!36657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72859 (_ BitVec 64) (_ BitVec 32)) Unit!36657)

(assert (=> b!1118803 (= lt!497808 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118804 () Bool)

(declare-fun res!746762 () Bool)

(assert (=> b!1118804 (=> (not res!746762) (not e!637426))))

(assert (=> b!1118804 (= res!746762 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35613 _keys!1208))))))

(declare-fun b!1118805 () Bool)

(declare-fun res!746755 () Bool)

(assert (=> b!1118805 (=> (not res!746755) (not e!637426))))

(declare-datatypes ((List!24412 0))(
  ( (Nil!24409) (Cons!24408 (h!25626 (_ BitVec 64)) (t!34885 List!24412)) )
))
(declare-fun arrayNoDuplicates!0 (array!72859 (_ BitVec 32) List!24412) Bool)

(assert (=> b!1118805 (= res!746755 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24409))))

(declare-fun b!1118806 () Bool)

(declare-fun e!637427 () Bool)

(declare-fun tp_is_empty!27961 () Bool)

(assert (=> b!1118806 (= e!637427 tp_is_empty!27961)))

(declare-fun res!746757 () Bool)

(assert (=> start!97966 (=> (not res!746757) (not e!637426))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97966 (= res!746757 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35613 _keys!1208))))))

(assert (=> start!97966 e!637426))

(declare-fun array_inv!27022 (array!72859) Bool)

(assert (=> start!97966 (array_inv!27022 _keys!1208)))

(assert (=> start!97966 true))

(declare-datatypes ((V!42409 0))(
  ( (V!42410 (val!14037 Int)) )
))
(declare-datatypes ((ValueCell!13271 0))(
  ( (ValueCellFull!13271 (v!16666 V!42409)) (EmptyCell!13271) )
))
(declare-datatypes ((array!72861 0))(
  ( (array!72862 (arr!35077 (Array (_ BitVec 32) ValueCell!13271)) (size!35614 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72861)

(declare-fun e!637425 () Bool)

(declare-fun array_inv!27023 (array!72861) Bool)

(assert (=> start!97966 (and (array_inv!27023 _values!996) e!637425)))

(declare-fun b!1118807 () Bool)

(declare-fun e!637423 () Bool)

(assert (=> b!1118807 (= e!637423 tp_is_empty!27961)))

(declare-fun mapNonEmpty!43759 () Bool)

(declare-fun tp!83003 () Bool)

(assert (=> mapNonEmpty!43759 (= mapRes!43759 (and tp!83003 e!637427))))

(declare-fun mapValue!43759 () ValueCell!13271)

(declare-fun mapKey!43759 () (_ BitVec 32))

(declare-fun mapRest!43759 () (Array (_ BitVec 32) ValueCell!13271))

(assert (=> mapNonEmpty!43759 (= (arr!35077 _values!996) (store mapRest!43759 mapKey!43759 mapValue!43759))))

(declare-fun b!1118808 () Bool)

(declare-fun res!746761 () Bool)

(assert (=> b!1118808 (=> (not res!746761) (not e!637424))))

(assert (=> b!1118808 (= res!746761 (arrayNoDuplicates!0 lt!497809 #b00000000000000000000000000000000 Nil!24409))))

(declare-fun b!1118809 () Bool)

(declare-fun res!746756 () Bool)

(assert (=> b!1118809 (=> (not res!746756) (not e!637426))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118809 (= res!746756 (and (= (size!35614 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35613 _keys!1208) (size!35614 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118810 () Bool)

(declare-fun res!746759 () Bool)

(assert (=> b!1118810 (=> (not res!746759) (not e!637426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118810 (= res!746759 (validMask!0 mask!1564))))

(declare-fun b!1118811 () Bool)

(assert (=> b!1118811 (= e!637425 (and e!637423 mapRes!43759))))

(declare-fun condMapEmpty!43759 () Bool)

(declare-fun mapDefault!43759 () ValueCell!13271)

(assert (=> b!1118811 (= condMapEmpty!43759 (= (arr!35077 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13271)) mapDefault!43759)))))

(declare-fun b!1118812 () Bool)

(declare-fun res!746758 () Bool)

(assert (=> b!1118812 (=> (not res!746758) (not e!637426))))

(assert (=> b!1118812 (= res!746758 (= (select (arr!35076 _keys!1208) i!673) k0!934))))

(assert (= (and start!97966 res!746757) b!1118810))

(assert (= (and b!1118810 res!746759) b!1118809))

(assert (= (and b!1118809 res!746756) b!1118802))

(assert (= (and b!1118802 res!746764) b!1118805))

(assert (= (and b!1118805 res!746755) b!1118804))

(assert (= (and b!1118804 res!746762) b!1118800))

(assert (= (and b!1118800 res!746760) b!1118812))

(assert (= (and b!1118812 res!746758) b!1118801))

(assert (= (and b!1118801 res!746763) b!1118808))

(assert (= (and b!1118808 res!746761) b!1118803))

(assert (= (and b!1118811 condMapEmpty!43759) mapIsEmpty!43759))

(assert (= (and b!1118811 (not condMapEmpty!43759)) mapNonEmpty!43759))

(get-info :version)

(assert (= (and mapNonEmpty!43759 ((_ is ValueCellFull!13271) mapValue!43759)) b!1118806))

(assert (= (and b!1118811 ((_ is ValueCellFull!13271) mapDefault!43759)) b!1118807))

(assert (= start!97966 b!1118811))

(declare-fun m!1035009 () Bool)

(assert (=> start!97966 m!1035009))

(declare-fun m!1035011 () Bool)

(assert (=> start!97966 m!1035011))

(declare-fun m!1035013 () Bool)

(assert (=> b!1118800 m!1035013))

(declare-fun m!1035015 () Bool)

(assert (=> b!1118803 m!1035015))

(declare-fun m!1035017 () Bool)

(assert (=> b!1118803 m!1035017))

(declare-fun m!1035019 () Bool)

(assert (=> b!1118810 m!1035019))

(declare-fun m!1035021 () Bool)

(assert (=> b!1118802 m!1035021))

(declare-fun m!1035023 () Bool)

(assert (=> b!1118808 m!1035023))

(declare-fun m!1035025 () Bool)

(assert (=> b!1118801 m!1035025))

(declare-fun m!1035027 () Bool)

(assert (=> b!1118801 m!1035027))

(declare-fun m!1035029 () Bool)

(assert (=> b!1118812 m!1035029))

(declare-fun m!1035031 () Bool)

(assert (=> b!1118805 m!1035031))

(declare-fun m!1035033 () Bool)

(assert (=> mapNonEmpty!43759 m!1035033))

(check-sat (not b!1118808) (not b!1118802) tp_is_empty!27961 (not start!97966) (not mapNonEmpty!43759) (not b!1118801) (not b!1118800) (not b!1118810) (not b!1118805) (not b!1118803))
(check-sat)
