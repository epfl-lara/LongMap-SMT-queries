; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110886 () Bool)

(assert start!110886)

(declare-fun b_free!29497 () Bool)

(declare-fun b_next!29497 () Bool)

(assert (=> start!110886 (= b_free!29497 (not b_next!29497))))

(declare-fun tp!103812 () Bool)

(declare-fun b_and!47707 () Bool)

(assert (=> start!110886 (= tp!103812 b_and!47707)))

(declare-fun b!1310726 () Bool)

(declare-fun res!869752 () Bool)

(declare-fun e!747932 () Bool)

(assert (=> b!1310726 (=> (not res!869752) (not e!747932))))

(declare-datatypes ((array!87511 0))(
  ( (array!87512 (arr!42231 (Array (_ BitVec 32) (_ BitVec 64))) (size!42782 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87511)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52073 0))(
  ( (V!52074 (val!17688 Int)) )
))
(declare-datatypes ((ValueCell!16715 0))(
  ( (ValueCellFull!16715 (v!20310 V!52073)) (EmptyCell!16715) )
))
(declare-datatypes ((array!87513 0))(
  ( (array!87514 (arr!42232 (Array (_ BitVec 32) ValueCell!16715)) (size!42783 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87513)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310726 (= res!869752 (and (= (size!42783 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42782 _keys!1628) (size!42783 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310727 () Bool)

(declare-fun e!747931 () Bool)

(declare-fun tp_is_empty!35227 () Bool)

(assert (=> b!1310727 (= e!747931 tp_is_empty!35227)))

(declare-fun b!1310728 () Bool)

(declare-fun res!869756 () Bool)

(assert (=> b!1310728 (=> (not res!869756) (not e!747932))))

(declare-datatypes ((List!29986 0))(
  ( (Nil!29983) (Cons!29982 (h!31200 (_ BitVec 64)) (t!43584 List!29986)) )
))
(declare-fun arrayNoDuplicates!0 (array!87511 (_ BitVec 32) List!29986) Bool)

(assert (=> b!1310728 (= res!869756 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29983))))

(declare-fun b!1310729 () Bool)

(assert (=> b!1310729 (= e!747932 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52073)

(declare-fun lt!585740 () Bool)

(declare-fun zeroValue!1296 () V!52073)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22826 0))(
  ( (tuple2!22827 (_1!11424 (_ BitVec 64)) (_2!11424 V!52073)) )
))
(declare-datatypes ((List!29987 0))(
  ( (Nil!29984) (Cons!29983 (h!31201 tuple2!22826) (t!43585 List!29987)) )
))
(declare-datatypes ((ListLongMap!20491 0))(
  ( (ListLongMap!20492 (toList!10261 List!29987)) )
))
(declare-fun contains!8423 (ListLongMap!20491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5265 (array!87511 array!87513 (_ BitVec 32) (_ BitVec 32) V!52073 V!52073 (_ BitVec 32) Int) ListLongMap!20491)

(assert (=> b!1310729 (= lt!585740 (contains!8423 (getCurrentListMap!5265 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54469 () Bool)

(declare-fun mapRes!54469 () Bool)

(declare-fun tp!103813 () Bool)

(assert (=> mapNonEmpty!54469 (= mapRes!54469 (and tp!103813 e!747931))))

(declare-fun mapRest!54469 () (Array (_ BitVec 32) ValueCell!16715))

(declare-fun mapValue!54469 () ValueCell!16715)

(declare-fun mapKey!54469 () (_ BitVec 32))

(assert (=> mapNonEmpty!54469 (= (arr!42232 _values!1354) (store mapRest!54469 mapKey!54469 mapValue!54469))))

(declare-fun b!1310730 () Bool)

(declare-fun res!869755 () Bool)

(assert (=> b!1310730 (=> (not res!869755) (not e!747932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87511 (_ BitVec 32)) Bool)

(assert (=> b!1310730 (= res!869755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310731 () Bool)

(declare-fun e!747933 () Bool)

(declare-fun e!747934 () Bool)

(assert (=> b!1310731 (= e!747933 (and e!747934 mapRes!54469))))

(declare-fun condMapEmpty!54469 () Bool)

(declare-fun mapDefault!54469 () ValueCell!16715)

(assert (=> b!1310731 (= condMapEmpty!54469 (= (arr!42232 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16715)) mapDefault!54469)))))

(declare-fun b!1310732 () Bool)

(assert (=> b!1310732 (= e!747934 tp_is_empty!35227)))

(declare-fun mapIsEmpty!54469 () Bool)

(assert (=> mapIsEmpty!54469 mapRes!54469))

(declare-fun b!1310733 () Bool)

(declare-fun res!869754 () Bool)

(assert (=> b!1310733 (=> (not res!869754) (not e!747932))))

(assert (=> b!1310733 (= res!869754 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42782 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!869753 () Bool)

(assert (=> start!110886 (=> (not res!869753) (not e!747932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110886 (= res!869753 (validMask!0 mask!2040))))

(assert (=> start!110886 e!747932))

(assert (=> start!110886 tp!103812))

(declare-fun array_inv!32183 (array!87511) Bool)

(assert (=> start!110886 (array_inv!32183 _keys!1628)))

(assert (=> start!110886 true))

(assert (=> start!110886 tp_is_empty!35227))

(declare-fun array_inv!32184 (array!87513) Bool)

(assert (=> start!110886 (and (array_inv!32184 _values!1354) e!747933)))

(assert (= (and start!110886 res!869753) b!1310726))

(assert (= (and b!1310726 res!869752) b!1310730))

(assert (= (and b!1310730 res!869755) b!1310728))

(assert (= (and b!1310728 res!869756) b!1310733))

(assert (= (and b!1310733 res!869754) b!1310729))

(assert (= (and b!1310731 condMapEmpty!54469) mapIsEmpty!54469))

(assert (= (and b!1310731 (not condMapEmpty!54469)) mapNonEmpty!54469))

(get-info :version)

(assert (= (and mapNonEmpty!54469 ((_ is ValueCellFull!16715) mapValue!54469)) b!1310727))

(assert (= (and b!1310731 ((_ is ValueCellFull!16715) mapDefault!54469)) b!1310732))

(assert (= start!110886 b!1310731))

(declare-fun m!1201109 () Bool)

(assert (=> b!1310729 m!1201109))

(assert (=> b!1310729 m!1201109))

(declare-fun m!1201111 () Bool)

(assert (=> b!1310729 m!1201111))

(declare-fun m!1201113 () Bool)

(assert (=> start!110886 m!1201113))

(declare-fun m!1201115 () Bool)

(assert (=> start!110886 m!1201115))

(declare-fun m!1201117 () Bool)

(assert (=> start!110886 m!1201117))

(declare-fun m!1201119 () Bool)

(assert (=> b!1310730 m!1201119))

(declare-fun m!1201121 () Bool)

(assert (=> mapNonEmpty!54469 m!1201121))

(declare-fun m!1201123 () Bool)

(assert (=> b!1310728 m!1201123))

(check-sat tp_is_empty!35227 (not mapNonEmpty!54469) (not b!1310728) (not start!110886) b_and!47707 (not b_next!29497) (not b!1310729) (not b!1310730))
(check-sat b_and!47707 (not b_next!29497))
