; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110850 () Bool)

(assert start!110850)

(declare-fun b_free!29461 () Bool)

(declare-fun b_next!29461 () Bool)

(assert (=> start!110850 (= b_free!29461 (not b_next!29461))))

(declare-fun tp!103704 () Bool)

(declare-fun b_and!47671 () Bool)

(assert (=> start!110850 (= tp!103704 b_and!47671)))

(declare-fun b!1310294 () Bool)

(declare-fun e!747663 () Bool)

(declare-fun tp_is_empty!35191 () Bool)

(assert (=> b!1310294 (= e!747663 tp_is_empty!35191)))

(declare-fun b!1310295 () Bool)

(declare-fun e!747664 () Bool)

(assert (=> b!1310295 (= e!747664 tp_is_empty!35191)))

(declare-fun b!1310296 () Bool)

(declare-fun res!869482 () Bool)

(declare-fun e!747662 () Bool)

(assert (=> b!1310296 (=> (not res!869482) (not e!747662))))

(declare-datatypes ((array!87439 0))(
  ( (array!87440 (arr!42195 (Array (_ BitVec 32) (_ BitVec 64))) (size!42746 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87439)

(declare-datatypes ((List!29957 0))(
  ( (Nil!29954) (Cons!29953 (h!31171 (_ BitVec 64)) (t!43555 List!29957)) )
))
(declare-fun arrayNoDuplicates!0 (array!87439 (_ BitVec 32) List!29957) Bool)

(assert (=> b!1310296 (= res!869482 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29954))))

(declare-fun res!869483 () Bool)

(assert (=> start!110850 (=> (not res!869483) (not e!747662))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110850 (= res!869483 (validMask!0 mask!2040))))

(assert (=> start!110850 e!747662))

(assert (=> start!110850 tp!103704))

(declare-fun array_inv!32153 (array!87439) Bool)

(assert (=> start!110850 (array_inv!32153 _keys!1628)))

(assert (=> start!110850 true))

(assert (=> start!110850 tp_is_empty!35191))

(declare-datatypes ((V!52025 0))(
  ( (V!52026 (val!17670 Int)) )
))
(declare-datatypes ((ValueCell!16697 0))(
  ( (ValueCellFull!16697 (v!20292 V!52025)) (EmptyCell!16697) )
))
(declare-datatypes ((array!87441 0))(
  ( (array!87442 (arr!42196 (Array (_ BitVec 32) ValueCell!16697)) (size!42747 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87441)

(declare-fun e!747665 () Bool)

(declare-fun array_inv!32154 (array!87441) Bool)

(assert (=> start!110850 (and (array_inv!32154 _values!1354) e!747665)))

(declare-fun mapNonEmpty!54415 () Bool)

(declare-fun mapRes!54415 () Bool)

(declare-fun tp!103705 () Bool)

(assert (=> mapNonEmpty!54415 (= mapRes!54415 (and tp!103705 e!747663))))

(declare-fun mapRest!54415 () (Array (_ BitVec 32) ValueCell!16697))

(declare-fun mapKey!54415 () (_ BitVec 32))

(declare-fun mapValue!54415 () ValueCell!16697)

(assert (=> mapNonEmpty!54415 (= (arr!42196 _values!1354) (store mapRest!54415 mapKey!54415 mapValue!54415))))

(declare-fun b!1310297 () Bool)

(declare-fun res!869485 () Bool)

(assert (=> b!1310297 (=> (not res!869485) (not e!747662))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310297 (= res!869485 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42746 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310298 () Bool)

(declare-fun res!869486 () Bool)

(assert (=> b!1310298 (=> (not res!869486) (not e!747662))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310298 (= res!869486 (and (= (size!42747 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42746 _keys!1628) (size!42747 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310299 () Bool)

(declare-fun res!869484 () Bool)

(assert (=> b!1310299 (=> (not res!869484) (not e!747662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87439 (_ BitVec 32)) Bool)

(assert (=> b!1310299 (= res!869484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54415 () Bool)

(assert (=> mapIsEmpty!54415 mapRes!54415))

(declare-fun b!1310300 () Bool)

(assert (=> b!1310300 (= e!747665 (and e!747664 mapRes!54415))))

(declare-fun condMapEmpty!54415 () Bool)

(declare-fun mapDefault!54415 () ValueCell!16697)

(assert (=> b!1310300 (= condMapEmpty!54415 (= (arr!42196 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16697)) mapDefault!54415)))))

(declare-fun b!1310301 () Bool)

(assert (=> b!1310301 (= e!747662 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585686 () Bool)

(declare-fun minValue!1296 () V!52025)

(declare-fun zeroValue!1296 () V!52025)

(declare-datatypes ((tuple2!22800 0))(
  ( (tuple2!22801 (_1!11411 (_ BitVec 64)) (_2!11411 V!52025)) )
))
(declare-datatypes ((List!29958 0))(
  ( (Nil!29955) (Cons!29954 (h!31172 tuple2!22800) (t!43556 List!29958)) )
))
(declare-datatypes ((ListLongMap!20465 0))(
  ( (ListLongMap!20466 (toList!10248 List!29958)) )
))
(declare-fun contains!8410 (ListLongMap!20465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5252 (array!87439 array!87441 (_ BitVec 32) (_ BitVec 32) V!52025 V!52025 (_ BitVec 32) Int) ListLongMap!20465)

(assert (=> b!1310301 (= lt!585686 (contains!8410 (getCurrentListMap!5252 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110850 res!869483) b!1310298))

(assert (= (and b!1310298 res!869486) b!1310299))

(assert (= (and b!1310299 res!869484) b!1310296))

(assert (= (and b!1310296 res!869482) b!1310297))

(assert (= (and b!1310297 res!869485) b!1310301))

(assert (= (and b!1310300 condMapEmpty!54415) mapIsEmpty!54415))

(assert (= (and b!1310300 (not condMapEmpty!54415)) mapNonEmpty!54415))

(get-info :version)

(assert (= (and mapNonEmpty!54415 ((_ is ValueCellFull!16697) mapValue!54415)) b!1310294))

(assert (= (and b!1310300 ((_ is ValueCellFull!16697) mapDefault!54415)) b!1310295))

(assert (= start!110850 b!1310300))

(declare-fun m!1200821 () Bool)

(assert (=> mapNonEmpty!54415 m!1200821))

(declare-fun m!1200823 () Bool)

(assert (=> b!1310296 m!1200823))

(declare-fun m!1200825 () Bool)

(assert (=> b!1310301 m!1200825))

(assert (=> b!1310301 m!1200825))

(declare-fun m!1200827 () Bool)

(assert (=> b!1310301 m!1200827))

(declare-fun m!1200829 () Bool)

(assert (=> start!110850 m!1200829))

(declare-fun m!1200831 () Bool)

(assert (=> start!110850 m!1200831))

(declare-fun m!1200833 () Bool)

(assert (=> start!110850 m!1200833))

(declare-fun m!1200835 () Bool)

(assert (=> b!1310299 m!1200835))

(check-sat b_and!47671 (not start!110850) tp_is_empty!35191 (not b!1310296) (not b!1310301) (not b!1310299) (not b_next!29461) (not mapNonEmpty!54415))
(check-sat b_and!47671 (not b_next!29461))
