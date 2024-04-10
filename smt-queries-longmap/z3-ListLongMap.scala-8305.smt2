; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101180 () Bool)

(assert start!101180)

(declare-fun b_free!26103 () Bool)

(declare-fun b_next!26103 () Bool)

(assert (=> start!101180 (= b_free!26103 (not b_next!26103))))

(declare-fun tp!91331 () Bool)

(declare-fun b_and!43323 () Bool)

(assert (=> start!101180 (= tp!91331 b_and!43323)))

(declare-fun b!1214540 () Bool)

(declare-fun res!806339 () Bool)

(declare-fun e!689717 () Bool)

(assert (=> b!1214540 (=> (not res!806339) (not e!689717))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214540 (= res!806339 (validMask!0 mask!1564))))

(declare-fun b!1214541 () Bool)

(declare-fun e!689718 () Bool)

(declare-fun e!689713 () Bool)

(declare-fun mapRes!48085 () Bool)

(assert (=> b!1214541 (= e!689718 (and e!689713 mapRes!48085))))

(declare-fun condMapEmpty!48085 () Bool)

(declare-datatypes ((V!46203 0))(
  ( (V!46204 (val!15460 Int)) )
))
(declare-datatypes ((ValueCell!14694 0))(
  ( (ValueCellFull!14694 (v!18113 V!46203)) (EmptyCell!14694) )
))
(declare-datatypes ((array!78397 0))(
  ( (array!78398 (arr!37833 (Array (_ BitVec 32) ValueCell!14694)) (size!38369 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78397)

(declare-fun mapDefault!48085 () ValueCell!14694)

(assert (=> b!1214541 (= condMapEmpty!48085 (= (arr!37833 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14694)) mapDefault!48085)))))

(declare-fun b!1214542 () Bool)

(declare-fun res!806333 () Bool)

(assert (=> b!1214542 (=> (not res!806333) (not e!689717))))

(declare-datatypes ((array!78399 0))(
  ( (array!78400 (arr!37834 (Array (_ BitVec 32) (_ BitVec 64))) (size!38370 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78399)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214542 (= res!806333 (and (= (size!38369 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38370 _keys!1208) (size!38369 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214543 () Bool)

(declare-fun res!806330 () Bool)

(declare-fun e!689719 () Bool)

(assert (=> b!1214543 (=> (not res!806330) (not e!689719))))

(declare-fun lt!552372 () array!78399)

(declare-datatypes ((List!26673 0))(
  ( (Nil!26670) (Cons!26669 (h!27878 (_ BitVec 64)) (t!39756 List!26673)) )
))
(declare-fun arrayNoDuplicates!0 (array!78399 (_ BitVec 32) List!26673) Bool)

(assert (=> b!1214543 (= res!806330 (arrayNoDuplicates!0 lt!552372 #b00000000000000000000000000000000 Nil!26670))))

(declare-fun b!1214544 () Bool)

(declare-fun res!806335 () Bool)

(assert (=> b!1214544 (=> (not res!806335) (not e!689717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78399 (_ BitVec 32)) Bool)

(assert (=> b!1214544 (= res!806335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214545 () Bool)

(declare-fun res!806329 () Bool)

(assert (=> b!1214545 (=> (not res!806329) (not e!689717))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214545 (= res!806329 (validKeyInArray!0 k0!934))))

(declare-fun b!1214546 () Bool)

(declare-fun tp_is_empty!30807 () Bool)

(assert (=> b!1214546 (= e!689713 tp_is_empty!30807)))

(declare-fun mapNonEmpty!48085 () Bool)

(declare-fun tp!91330 () Bool)

(declare-fun e!689714 () Bool)

(assert (=> mapNonEmpty!48085 (= mapRes!48085 (and tp!91330 e!689714))))

(declare-fun mapKey!48085 () (_ BitVec 32))

(declare-fun mapValue!48085 () ValueCell!14694)

(declare-fun mapRest!48085 () (Array (_ BitVec 32) ValueCell!14694))

(assert (=> mapNonEmpty!48085 (= (arr!37833 _values!996) (store mapRest!48085 mapKey!48085 mapValue!48085))))

(declare-fun res!806338 () Bool)

(assert (=> start!101180 (=> (not res!806338) (not e!689717))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101180 (= res!806338 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38370 _keys!1208))))))

(assert (=> start!101180 e!689717))

(assert (=> start!101180 tp_is_empty!30807))

(declare-fun array_inv!28808 (array!78399) Bool)

(assert (=> start!101180 (array_inv!28808 _keys!1208)))

(assert (=> start!101180 true))

(assert (=> start!101180 tp!91331))

(declare-fun array_inv!28809 (array!78397) Bool)

(assert (=> start!101180 (and (array_inv!28809 _values!996) e!689718)))

(declare-fun mapIsEmpty!48085 () Bool)

(assert (=> mapIsEmpty!48085 mapRes!48085))

(declare-fun b!1214547 () Bool)

(declare-fun res!806332 () Bool)

(assert (=> b!1214547 (=> (not res!806332) (not e!689717))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214547 (= res!806332 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38370 _keys!1208))))))

(declare-fun b!1214548 () Bool)

(declare-fun res!806334 () Bool)

(assert (=> b!1214548 (=> (not res!806334) (not e!689717))))

(assert (=> b!1214548 (= res!806334 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26670))))

(declare-fun b!1214549 () Bool)

(declare-fun res!806331 () Bool)

(assert (=> b!1214549 (=> (not res!806331) (not e!689717))))

(assert (=> b!1214549 (= res!806331 (= (select (arr!37834 _keys!1208) i!673) k0!934))))

(declare-fun b!1214550 () Bool)

(assert (=> b!1214550 (= e!689717 e!689719)))

(declare-fun res!806336 () Bool)

(assert (=> b!1214550 (=> (not res!806336) (not e!689719))))

(assert (=> b!1214550 (= res!806336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552372 mask!1564))))

(assert (=> b!1214550 (= lt!552372 (array!78400 (store (arr!37834 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38370 _keys!1208)))))

(declare-fun b!1214551 () Bool)

(assert (=> b!1214551 (= e!689714 tp_is_empty!30807)))

(declare-fun b!1214552 () Bool)

(declare-fun e!689716 () Bool)

(assert (=> b!1214552 (= e!689719 (not e!689716))))

(declare-fun res!806337 () Bool)

(assert (=> b!1214552 (=> res!806337 e!689716)))

(assert (=> b!1214552 (= res!806337 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214552 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40278 0))(
  ( (Unit!40279) )
))
(declare-fun lt!552370 () Unit!40278)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78399 (_ BitVec 64) (_ BitVec 32)) Unit!40278)

(assert (=> b!1214552 (= lt!552370 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214553 () Bool)

(assert (=> b!1214553 (= e!689716 true)))

(declare-fun zeroValue!944 () V!46203)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19874 0))(
  ( (tuple2!19875 (_1!9948 (_ BitVec 64)) (_2!9948 V!46203)) )
))
(declare-datatypes ((List!26674 0))(
  ( (Nil!26671) (Cons!26670 (h!27879 tuple2!19874) (t!39757 List!26674)) )
))
(declare-datatypes ((ListLongMap!17843 0))(
  ( (ListLongMap!17844 (toList!8937 List!26674)) )
))
(declare-fun lt!552369 () ListLongMap!17843)

(declare-fun minValue!944 () V!46203)

(declare-fun getCurrentListMapNoExtraKeys!5364 (array!78399 array!78397 (_ BitVec 32) (_ BitVec 32) V!46203 V!46203 (_ BitVec 32) Int) ListLongMap!17843)

(declare-fun dynLambda!3253 (Int (_ BitVec 64)) V!46203)

(assert (=> b!1214553 (= lt!552369 (getCurrentListMapNoExtraKeys!5364 lt!552372 (array!78398 (store (arr!37833 _values!996) i!673 (ValueCellFull!14694 (dynLambda!3253 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38369 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552371 () ListLongMap!17843)

(assert (=> b!1214553 (= lt!552371 (getCurrentListMapNoExtraKeys!5364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101180 res!806338) b!1214540))

(assert (= (and b!1214540 res!806339) b!1214542))

(assert (= (and b!1214542 res!806333) b!1214544))

(assert (= (and b!1214544 res!806335) b!1214548))

(assert (= (and b!1214548 res!806334) b!1214547))

(assert (= (and b!1214547 res!806332) b!1214545))

(assert (= (and b!1214545 res!806329) b!1214549))

(assert (= (and b!1214549 res!806331) b!1214550))

(assert (= (and b!1214550 res!806336) b!1214543))

(assert (= (and b!1214543 res!806330) b!1214552))

(assert (= (and b!1214552 (not res!806337)) b!1214553))

(assert (= (and b!1214541 condMapEmpty!48085) mapIsEmpty!48085))

(assert (= (and b!1214541 (not condMapEmpty!48085)) mapNonEmpty!48085))

(get-info :version)

(assert (= (and mapNonEmpty!48085 ((_ is ValueCellFull!14694) mapValue!48085)) b!1214551))

(assert (= (and b!1214541 ((_ is ValueCellFull!14694) mapDefault!48085)) b!1214546))

(assert (= start!101180 b!1214541))

(declare-fun b_lambda!21779 () Bool)

(assert (=> (not b_lambda!21779) (not b!1214553)))

(declare-fun t!39755 () Bool)

(declare-fun tb!10903 () Bool)

(assert (=> (and start!101180 (= defaultEntry!1004 defaultEntry!1004) t!39755) tb!10903))

(declare-fun result!22403 () Bool)

(assert (=> tb!10903 (= result!22403 tp_is_empty!30807)))

(assert (=> b!1214553 t!39755))

(declare-fun b_and!43325 () Bool)

(assert (= b_and!43323 (and (=> t!39755 result!22403) b_and!43325)))

(declare-fun m!1119715 () Bool)

(assert (=> start!101180 m!1119715))

(declare-fun m!1119717 () Bool)

(assert (=> start!101180 m!1119717))

(declare-fun m!1119719 () Bool)

(assert (=> b!1214548 m!1119719))

(declare-fun m!1119721 () Bool)

(assert (=> b!1214553 m!1119721))

(declare-fun m!1119723 () Bool)

(assert (=> b!1214553 m!1119723))

(declare-fun m!1119725 () Bool)

(assert (=> b!1214553 m!1119725))

(declare-fun m!1119727 () Bool)

(assert (=> b!1214553 m!1119727))

(declare-fun m!1119729 () Bool)

(assert (=> b!1214540 m!1119729))

(declare-fun m!1119731 () Bool)

(assert (=> b!1214544 m!1119731))

(declare-fun m!1119733 () Bool)

(assert (=> mapNonEmpty!48085 m!1119733))

(declare-fun m!1119735 () Bool)

(assert (=> b!1214549 m!1119735))

(declare-fun m!1119737 () Bool)

(assert (=> b!1214552 m!1119737))

(declare-fun m!1119739 () Bool)

(assert (=> b!1214552 m!1119739))

(declare-fun m!1119741 () Bool)

(assert (=> b!1214543 m!1119741))

(declare-fun m!1119743 () Bool)

(assert (=> b!1214550 m!1119743))

(declare-fun m!1119745 () Bool)

(assert (=> b!1214550 m!1119745))

(declare-fun m!1119747 () Bool)

(assert (=> b!1214545 m!1119747))

(check-sat (not b!1214552) (not mapNonEmpty!48085) (not b_lambda!21779) tp_is_empty!30807 (not b_next!26103) (not b!1214540) (not b!1214544) (not b!1214545) (not b!1214553) (not start!101180) (not b!1214543) b_and!43325 (not b!1214548) (not b!1214550))
(check-sat b_and!43325 (not b_next!26103))
