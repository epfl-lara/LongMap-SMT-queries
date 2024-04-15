; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110506 () Bool)

(assert start!110506)

(declare-fun b_free!29341 () Bool)

(declare-fun b_next!29341 () Bool)

(assert (=> start!110506 (= b_free!29341 (not b_next!29341))))

(declare-fun tp!103346 () Bool)

(declare-fun b_and!47531 () Bool)

(assert (=> start!110506 (= tp!103346 b_and!47531)))

(declare-fun res!867714 () Bool)

(declare-fun e!745887 () Bool)

(assert (=> start!110506 (=> (not res!867714) (not e!745887))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110506 (= res!867714 (validMask!0 mask!2040))))

(assert (=> start!110506 e!745887))

(assert (=> start!110506 tp!103346))

(declare-datatypes ((array!87059 0))(
  ( (array!87060 (arr!42010 (Array (_ BitVec 32) (_ BitVec 64))) (size!42562 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87059)

(declare-fun array_inv!31951 (array!87059) Bool)

(assert (=> start!110506 (array_inv!31951 _keys!1628)))

(assert (=> start!110506 true))

(declare-fun tp_is_empty!35071 () Bool)

(assert (=> start!110506 tp_is_empty!35071))

(declare-datatypes ((V!51865 0))(
  ( (V!51866 (val!17610 Int)) )
))
(declare-datatypes ((ValueCell!16637 0))(
  ( (ValueCellFull!16637 (v!20236 V!51865)) (EmptyCell!16637) )
))
(declare-datatypes ((array!87061 0))(
  ( (array!87062 (arr!42011 (Array (_ BitVec 32) ValueCell!16637)) (size!42563 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87061)

(declare-fun e!745888 () Bool)

(declare-fun array_inv!31952 (array!87061) Bool)

(assert (=> start!110506 (and (array_inv!31952 _values!1354) e!745888)))

(declare-fun b!1307161 () Bool)

(declare-fun e!745889 () Bool)

(assert (=> b!1307161 (= e!745889 tp_is_empty!35071)))

(declare-fun b!1307162 () Bool)

(declare-fun e!745885 () Bool)

(assert (=> b!1307162 (= e!745885 tp_is_empty!35071)))

(declare-fun b!1307163 () Bool)

(declare-fun mapRes!54235 () Bool)

(assert (=> b!1307163 (= e!745888 (and e!745885 mapRes!54235))))

(declare-fun condMapEmpty!54235 () Bool)

(declare-fun mapDefault!54235 () ValueCell!16637)

(assert (=> b!1307163 (= condMapEmpty!54235 (= (arr!42011 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16637)) mapDefault!54235)))))

(declare-fun mapNonEmpty!54235 () Bool)

(declare-fun tp!103345 () Bool)

(assert (=> mapNonEmpty!54235 (= mapRes!54235 (and tp!103345 e!745889))))

(declare-fun mapRest!54235 () (Array (_ BitVec 32) ValueCell!16637))

(declare-fun mapKey!54235 () (_ BitVec 32))

(declare-fun mapValue!54235 () ValueCell!16637)

(assert (=> mapNonEmpty!54235 (= (arr!42011 _values!1354) (store mapRest!54235 mapKey!54235 mapValue!54235))))

(declare-fun b!1307164 () Bool)

(declare-fun res!867712 () Bool)

(assert (=> b!1307164 (=> (not res!867712) (not e!745887))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307164 (= res!867712 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42562 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307165 () Bool)

(declare-fun res!867711 () Bool)

(assert (=> b!1307165 (=> (not res!867711) (not e!745887))))

(declare-datatypes ((List!29873 0))(
  ( (Nil!29870) (Cons!29869 (h!31078 (_ BitVec 64)) (t!43471 List!29873)) )
))
(declare-fun arrayNoDuplicates!0 (array!87059 (_ BitVec 32) List!29873) Bool)

(assert (=> b!1307165 (= res!867711 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29870))))

(declare-fun b!1307166 () Bool)

(declare-fun res!867715 () Bool)

(assert (=> b!1307166 (=> (not res!867715) (not e!745887))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307166 (= res!867715 (and (= (size!42563 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42562 _keys!1628) (size!42563 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307167 () Bool)

(assert (=> b!1307167 (= e!745887 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51865)

(declare-fun zeroValue!1296 () V!51865)

(declare-fun lt!584844 () Bool)

(declare-datatypes ((tuple2!22750 0))(
  ( (tuple2!22751 (_1!11386 (_ BitVec 64)) (_2!11386 V!51865)) )
))
(declare-datatypes ((List!29874 0))(
  ( (Nil!29871) (Cons!29870 (h!31079 tuple2!22750) (t!43472 List!29874)) )
))
(declare-datatypes ((ListLongMap!20407 0))(
  ( (ListLongMap!20408 (toList!10219 List!29874)) )
))
(declare-fun contains!8296 (ListLongMap!20407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5114 (array!87059 array!87061 (_ BitVec 32) (_ BitVec 32) V!51865 V!51865 (_ BitVec 32) Int) ListLongMap!20407)

(assert (=> b!1307167 (= lt!584844 (contains!8296 (getCurrentListMap!5114 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54235 () Bool)

(assert (=> mapIsEmpty!54235 mapRes!54235))

(declare-fun b!1307168 () Bool)

(declare-fun res!867713 () Bool)

(assert (=> b!1307168 (=> (not res!867713) (not e!745887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87059 (_ BitVec 32)) Bool)

(assert (=> b!1307168 (= res!867713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110506 res!867714) b!1307166))

(assert (= (and b!1307166 res!867715) b!1307168))

(assert (= (and b!1307168 res!867713) b!1307165))

(assert (= (and b!1307165 res!867711) b!1307164))

(assert (= (and b!1307164 res!867712) b!1307167))

(assert (= (and b!1307163 condMapEmpty!54235) mapIsEmpty!54235))

(assert (= (and b!1307163 (not condMapEmpty!54235)) mapNonEmpty!54235))

(get-info :version)

(assert (= (and mapNonEmpty!54235 ((_ is ValueCellFull!16637) mapValue!54235)) b!1307161))

(assert (= (and b!1307163 ((_ is ValueCellFull!16637) mapDefault!54235)) b!1307162))

(assert (= start!110506 b!1307163))

(declare-fun m!1197477 () Bool)

(assert (=> b!1307165 m!1197477))

(declare-fun m!1197479 () Bool)

(assert (=> start!110506 m!1197479))

(declare-fun m!1197481 () Bool)

(assert (=> start!110506 m!1197481))

(declare-fun m!1197483 () Bool)

(assert (=> start!110506 m!1197483))

(declare-fun m!1197485 () Bool)

(assert (=> b!1307167 m!1197485))

(assert (=> b!1307167 m!1197485))

(declare-fun m!1197487 () Bool)

(assert (=> b!1307167 m!1197487))

(declare-fun m!1197489 () Bool)

(assert (=> mapNonEmpty!54235 m!1197489))

(declare-fun m!1197491 () Bool)

(assert (=> b!1307168 m!1197491))

(check-sat (not mapNonEmpty!54235) (not b!1307165) b_and!47531 (not start!110506) (not b!1307167) (not b_next!29341) tp_is_empty!35071 (not b!1307168))
(check-sat b_and!47531 (not b_next!29341))
