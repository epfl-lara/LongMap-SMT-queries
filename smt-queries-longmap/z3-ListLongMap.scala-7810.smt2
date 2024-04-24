; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97840 () Bool)

(assert start!97840)

(declare-fun b!1116343 () Bool)

(declare-fun res!744872 () Bool)

(declare-fun e!636289 () Bool)

(assert (=> b!1116343 (=> (not res!744872) (not e!636289))))

(declare-datatypes ((array!72609 0))(
  ( (array!72610 (arr!34951 (Array (_ BitVec 32) (_ BitVec 64))) (size!35488 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72609)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116343 (= res!744872 (= (select (arr!34951 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43570 () Bool)

(declare-fun mapRes!43570 () Bool)

(assert (=> mapIsEmpty!43570 mapRes!43570))

(declare-fun b!1116344 () Bool)

(declare-fun res!744867 () Bool)

(assert (=> b!1116344 (=> (not res!744867) (not e!636289))))

(assert (=> b!1116344 (= res!744867 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35488 _keys!1208))))))

(declare-fun b!1116345 () Bool)

(declare-fun e!636293 () Bool)

(assert (=> b!1116345 (= e!636293 (not true))))

(declare-fun arrayContainsKey!0 (array!72609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116345 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36563 0))(
  ( (Unit!36564) )
))
(declare-fun lt!497430 () Unit!36563)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72609 (_ BitVec 64) (_ BitVec 32)) Unit!36563)

(assert (=> b!1116345 (= lt!497430 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116346 () Bool)

(declare-fun res!744874 () Bool)

(assert (=> b!1116346 (=> (not res!744874) (not e!636289))))

(declare-datatypes ((List!24357 0))(
  ( (Nil!24354) (Cons!24353 (h!25571 (_ BitVec 64)) (t!34830 List!24357)) )
))
(declare-fun arrayNoDuplicates!0 (array!72609 (_ BitVec 32) List!24357) Bool)

(assert (=> b!1116346 (= res!744874 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24354))))

(declare-fun b!1116347 () Bool)

(declare-fun e!636290 () Bool)

(declare-fun tp_is_empty!27835 () Bool)

(assert (=> b!1116347 (= e!636290 tp_is_empty!27835)))

(declare-fun b!1116348 () Bool)

(declare-fun res!744873 () Bool)

(assert (=> b!1116348 (=> (not res!744873) (not e!636293))))

(declare-fun lt!497431 () array!72609)

(assert (=> b!1116348 (= res!744873 (arrayNoDuplicates!0 lt!497431 #b00000000000000000000000000000000 Nil!24354))))

(declare-fun mapNonEmpty!43570 () Bool)

(declare-fun tp!82814 () Bool)

(assert (=> mapNonEmpty!43570 (= mapRes!43570 (and tp!82814 e!636290))))

(declare-fun mapKey!43570 () (_ BitVec 32))

(declare-datatypes ((V!42241 0))(
  ( (V!42242 (val!13974 Int)) )
))
(declare-datatypes ((ValueCell!13208 0))(
  ( (ValueCellFull!13208 (v!16603 V!42241)) (EmptyCell!13208) )
))
(declare-fun mapValue!43570 () ValueCell!13208)

(declare-fun mapRest!43570 () (Array (_ BitVec 32) ValueCell!13208))

(declare-datatypes ((array!72611 0))(
  ( (array!72612 (arr!34952 (Array (_ BitVec 32) ValueCell!13208)) (size!35489 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72611)

(assert (=> mapNonEmpty!43570 (= (arr!34952 _values!996) (store mapRest!43570 mapKey!43570 mapValue!43570))))

(declare-fun b!1116349 () Bool)

(declare-fun res!744871 () Bool)

(assert (=> b!1116349 (=> (not res!744871) (not e!636289))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1116349 (= res!744871 (and (= (size!35489 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35488 _keys!1208) (size!35489 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!744866 () Bool)

(assert (=> start!97840 (=> (not res!744866) (not e!636289))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97840 (= res!744866 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35488 _keys!1208))))))

(assert (=> start!97840 e!636289))

(declare-fun array_inv!26930 (array!72609) Bool)

(assert (=> start!97840 (array_inv!26930 _keys!1208)))

(assert (=> start!97840 true))

(declare-fun e!636294 () Bool)

(declare-fun array_inv!26931 (array!72611) Bool)

(assert (=> start!97840 (and (array_inv!26931 _values!996) e!636294)))

(declare-fun b!1116350 () Bool)

(assert (=> b!1116350 (= e!636289 e!636293)))

(declare-fun res!744869 () Bool)

(assert (=> b!1116350 (=> (not res!744869) (not e!636293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72609 (_ BitVec 32)) Bool)

(assert (=> b!1116350 (= res!744869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497431 mask!1564))))

(assert (=> b!1116350 (= lt!497431 (array!72610 (store (arr!34951 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35488 _keys!1208)))))

(declare-fun b!1116351 () Bool)

(declare-fun res!744870 () Bool)

(assert (=> b!1116351 (=> (not res!744870) (not e!636289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116351 (= res!744870 (validMask!0 mask!1564))))

(declare-fun b!1116352 () Bool)

(declare-fun e!636291 () Bool)

(assert (=> b!1116352 (= e!636294 (and e!636291 mapRes!43570))))

(declare-fun condMapEmpty!43570 () Bool)

(declare-fun mapDefault!43570 () ValueCell!13208)

(assert (=> b!1116352 (= condMapEmpty!43570 (= (arr!34952 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13208)) mapDefault!43570)))))

(declare-fun b!1116353 () Bool)

(assert (=> b!1116353 (= e!636291 tp_is_empty!27835)))

(declare-fun b!1116354 () Bool)

(declare-fun res!744865 () Bool)

(assert (=> b!1116354 (=> (not res!744865) (not e!636289))))

(assert (=> b!1116354 (= res!744865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116355 () Bool)

(declare-fun res!744868 () Bool)

(assert (=> b!1116355 (=> (not res!744868) (not e!636289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116355 (= res!744868 (validKeyInArray!0 k0!934))))

(assert (= (and start!97840 res!744866) b!1116351))

(assert (= (and b!1116351 res!744870) b!1116349))

(assert (= (and b!1116349 res!744871) b!1116354))

(assert (= (and b!1116354 res!744865) b!1116346))

(assert (= (and b!1116346 res!744874) b!1116344))

(assert (= (and b!1116344 res!744867) b!1116355))

(assert (= (and b!1116355 res!744868) b!1116343))

(assert (= (and b!1116343 res!744872) b!1116350))

(assert (= (and b!1116350 res!744869) b!1116348))

(assert (= (and b!1116348 res!744873) b!1116345))

(assert (= (and b!1116352 condMapEmpty!43570) mapIsEmpty!43570))

(assert (= (and b!1116352 (not condMapEmpty!43570)) mapNonEmpty!43570))

(get-info :version)

(assert (= (and mapNonEmpty!43570 ((_ is ValueCellFull!13208) mapValue!43570)) b!1116347))

(assert (= (and b!1116352 ((_ is ValueCellFull!13208) mapDefault!43570)) b!1116353))

(assert (= start!97840 b!1116352))

(declare-fun m!1033371 () Bool)

(assert (=> b!1116351 m!1033371))

(declare-fun m!1033373 () Bool)

(assert (=> b!1116345 m!1033373))

(declare-fun m!1033375 () Bool)

(assert (=> b!1116345 m!1033375))

(declare-fun m!1033377 () Bool)

(assert (=> b!1116355 m!1033377))

(declare-fun m!1033379 () Bool)

(assert (=> b!1116350 m!1033379))

(declare-fun m!1033381 () Bool)

(assert (=> b!1116350 m!1033381))

(declare-fun m!1033383 () Bool)

(assert (=> b!1116354 m!1033383))

(declare-fun m!1033385 () Bool)

(assert (=> b!1116346 m!1033385))

(declare-fun m!1033387 () Bool)

(assert (=> start!97840 m!1033387))

(declare-fun m!1033389 () Bool)

(assert (=> start!97840 m!1033389))

(declare-fun m!1033391 () Bool)

(assert (=> b!1116343 m!1033391))

(declare-fun m!1033393 () Bool)

(assert (=> b!1116348 m!1033393))

(declare-fun m!1033395 () Bool)

(assert (=> mapNonEmpty!43570 m!1033395))

(check-sat (not b!1116354) (not start!97840) (not b!1116345) (not b!1116348) (not b!1116351) (not b!1116346) tp_is_empty!27835 (not b!1116350) (not b!1116355) (not mapNonEmpty!43570))
(check-sat)
