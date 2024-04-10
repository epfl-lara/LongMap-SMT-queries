; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81856 () Bool)

(assert start!81856)

(declare-fun b_free!18351 () Bool)

(declare-fun b_next!18351 () Bool)

(assert (=> start!81856 (= b_free!18351 (not b_next!18351))))

(declare-fun tp!63752 () Bool)

(declare-fun b_and!29837 () Bool)

(assert (=> start!81856 (= tp!63752 b_and!29837)))

(declare-fun b!954616 () Bool)

(declare-fun e!537822 () Bool)

(declare-fun e!537820 () Bool)

(declare-fun mapRes!33304 () Bool)

(assert (=> b!954616 (= e!537822 (and e!537820 mapRes!33304))))

(declare-fun condMapEmpty!33304 () Bool)

(declare-datatypes ((V!32843 0))(
  ( (V!32844 (val!10498 Int)) )
))
(declare-datatypes ((ValueCell!9966 0))(
  ( (ValueCellFull!9966 (v!13053 V!32843)) (EmptyCell!9966) )
))
(declare-datatypes ((array!57901 0))(
  ( (array!57902 (arr!27830 (Array (_ BitVec 32) ValueCell!9966)) (size!28309 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57901)

(declare-fun mapDefault!33304 () ValueCell!9966)

(assert (=> b!954616 (= condMapEmpty!33304 (= (arr!27830 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9966)) mapDefault!33304)))))

(declare-fun b!954617 () Bool)

(declare-fun res!639256 () Bool)

(declare-fun e!537819 () Bool)

(assert (=> b!954617 (=> (not res!639256) (not e!537819))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57903 0))(
  ( (array!57904 (arr!27831 (Array (_ BitVec 32) (_ BitVec 64))) (size!28310 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57903)

(assert (=> b!954617 (= res!639256 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28310 _keys!1441))))))

(declare-fun b!954618 () Bool)

(declare-fun res!639258 () Bool)

(assert (=> b!954618 (=> (not res!639258) (not e!537819))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954618 (= res!639258 (and (= (size!28309 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28310 _keys!1441) (size!28309 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954619 () Bool)

(declare-fun tp_is_empty!20895 () Bool)

(assert (=> b!954619 (= e!537820 tp_is_empty!20895)))

(declare-fun mapIsEmpty!33304 () Bool)

(assert (=> mapIsEmpty!33304 mapRes!33304))

(declare-fun b!954620 () Bool)

(declare-fun res!639254 () Bool)

(assert (=> b!954620 (=> (not res!639254) (not e!537819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954620 (= res!639254 (validKeyInArray!0 (select (arr!27831 _keys!1441) i!735)))))

(declare-fun res!639255 () Bool)

(assert (=> start!81856 (=> (not res!639255) (not e!537819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81856 (= res!639255 (validMask!0 mask!1823))))

(assert (=> start!81856 e!537819))

(assert (=> start!81856 true))

(assert (=> start!81856 tp_is_empty!20895))

(declare-fun array_inv!21605 (array!57903) Bool)

(assert (=> start!81856 (array_inv!21605 _keys!1441)))

(declare-fun array_inv!21606 (array!57901) Bool)

(assert (=> start!81856 (and (array_inv!21606 _values!1197) e!537822)))

(assert (=> start!81856 tp!63752))

(declare-fun mapNonEmpty!33304 () Bool)

(declare-fun tp!63753 () Bool)

(declare-fun e!537821 () Bool)

(assert (=> mapNonEmpty!33304 (= mapRes!33304 (and tp!63753 e!537821))))

(declare-fun mapValue!33304 () ValueCell!9966)

(declare-fun mapKey!33304 () (_ BitVec 32))

(declare-fun mapRest!33304 () (Array (_ BitVec 32) ValueCell!9966))

(assert (=> mapNonEmpty!33304 (= (arr!27830 _values!1197) (store mapRest!33304 mapKey!33304 mapValue!33304))))

(declare-fun b!954621 () Bool)

(declare-fun res!639257 () Bool)

(assert (=> b!954621 (=> (not res!639257) (not e!537819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57903 (_ BitVec 32)) Bool)

(assert (=> b!954621 (= res!639257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954622 () Bool)

(declare-fun res!639253 () Bool)

(assert (=> b!954622 (=> (not res!639253) (not e!537819))))

(declare-datatypes ((List!19402 0))(
  ( (Nil!19399) (Cons!19398 (h!20560 (_ BitVec 64)) (t!27763 List!19402)) )
))
(declare-fun arrayNoDuplicates!0 (array!57903 (_ BitVec 32) List!19402) Bool)

(assert (=> b!954622 (= res!639253 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19399))))

(declare-fun b!954623 () Bool)

(assert (=> b!954623 (= e!537821 tp_is_empty!20895)))

(declare-fun b!954624 () Bool)

(assert (=> b!954624 (= e!537819 false)))

(declare-fun lt!429920 () Bool)

(declare-fun zeroValue!1139 () V!32843)

(declare-fun minValue!1139 () V!32843)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13624 0))(
  ( (tuple2!13625 (_1!6823 (_ BitVec 64)) (_2!6823 V!32843)) )
))
(declare-datatypes ((List!19403 0))(
  ( (Nil!19400) (Cons!19399 (h!20561 tuple2!13624) (t!27764 List!19403)) )
))
(declare-datatypes ((ListLongMap!12321 0))(
  ( (ListLongMap!12322 (toList!6176 List!19403)) )
))
(declare-fun contains!5274 (ListLongMap!12321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3409 (array!57903 array!57901 (_ BitVec 32) (_ BitVec 32) V!32843 V!32843 (_ BitVec 32) Int) ListLongMap!12321)

(assert (=> b!954624 (= lt!429920 (contains!5274 (getCurrentListMap!3409 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27831 _keys!1441) i!735)))))

(assert (= (and start!81856 res!639255) b!954618))

(assert (= (and b!954618 res!639258) b!954621))

(assert (= (and b!954621 res!639257) b!954622))

(assert (= (and b!954622 res!639253) b!954617))

(assert (= (and b!954617 res!639256) b!954620))

(assert (= (and b!954620 res!639254) b!954624))

(assert (= (and b!954616 condMapEmpty!33304) mapIsEmpty!33304))

(assert (= (and b!954616 (not condMapEmpty!33304)) mapNonEmpty!33304))

(get-info :version)

(assert (= (and mapNonEmpty!33304 ((_ is ValueCellFull!9966) mapValue!33304)) b!954623))

(assert (= (and b!954616 ((_ is ValueCellFull!9966) mapDefault!33304)) b!954619))

(assert (= start!81856 b!954616))

(declare-fun m!886303 () Bool)

(assert (=> b!954620 m!886303))

(assert (=> b!954620 m!886303))

(declare-fun m!886305 () Bool)

(assert (=> b!954620 m!886305))

(declare-fun m!886307 () Bool)

(assert (=> b!954622 m!886307))

(declare-fun m!886309 () Bool)

(assert (=> b!954621 m!886309))

(declare-fun m!886311 () Bool)

(assert (=> mapNonEmpty!33304 m!886311))

(declare-fun m!886313 () Bool)

(assert (=> start!81856 m!886313))

(declare-fun m!886315 () Bool)

(assert (=> start!81856 m!886315))

(declare-fun m!886317 () Bool)

(assert (=> start!81856 m!886317))

(declare-fun m!886319 () Bool)

(assert (=> b!954624 m!886319))

(assert (=> b!954624 m!886303))

(assert (=> b!954624 m!886319))

(assert (=> b!954624 m!886303))

(declare-fun m!886321 () Bool)

(assert (=> b!954624 m!886321))

(check-sat (not b!954620) (not b_next!18351) (not b!954622) (not mapNonEmpty!33304) tp_is_empty!20895 (not b!954624) (not b!954621) (not start!81856) b_and!29837)
(check-sat b_and!29837 (not b_next!18351))
