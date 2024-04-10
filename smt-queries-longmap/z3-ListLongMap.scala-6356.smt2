; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81874 () Bool)

(assert start!81874)

(declare-fun b_free!18369 () Bool)

(declare-fun b_next!18369 () Bool)

(assert (=> start!81874 (= b_free!18369 (not b_next!18369))))

(declare-fun tp!63806 () Bool)

(declare-fun b_and!29855 () Bool)

(assert (=> start!81874 (= tp!63806 b_and!29855)))

(declare-fun b!954859 () Bool)

(declare-fun res!639418 () Bool)

(declare-fun e!537958 () Bool)

(assert (=> b!954859 (=> (not res!639418) (not e!537958))))

(declare-datatypes ((array!57935 0))(
  ( (array!57936 (arr!27847 (Array (_ BitVec 32) (_ BitVec 64))) (size!28326 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57935)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57935 (_ BitVec 32)) Bool)

(assert (=> b!954859 (= res!639418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33331 () Bool)

(declare-fun mapRes!33331 () Bool)

(assert (=> mapIsEmpty!33331 mapRes!33331))

(declare-fun mapNonEmpty!33331 () Bool)

(declare-fun tp!63807 () Bool)

(declare-fun e!537955 () Bool)

(assert (=> mapNonEmpty!33331 (= mapRes!33331 (and tp!63807 e!537955))))

(declare-datatypes ((V!32867 0))(
  ( (V!32868 (val!10507 Int)) )
))
(declare-datatypes ((ValueCell!9975 0))(
  ( (ValueCellFull!9975 (v!13062 V!32867)) (EmptyCell!9975) )
))
(declare-fun mapRest!33331 () (Array (_ BitVec 32) ValueCell!9975))

(declare-fun mapKey!33331 () (_ BitVec 32))

(declare-datatypes ((array!57937 0))(
  ( (array!57938 (arr!27848 (Array (_ BitVec 32) ValueCell!9975)) (size!28327 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57937)

(declare-fun mapValue!33331 () ValueCell!9975)

(assert (=> mapNonEmpty!33331 (= (arr!27848 _values!1197) (store mapRest!33331 mapKey!33331 mapValue!33331))))

(declare-fun b!954860 () Bool)

(declare-fun res!639417 () Bool)

(assert (=> b!954860 (=> (not res!639417) (not e!537958))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954860 (= res!639417 (validKeyInArray!0 (select (arr!27847 _keys!1441) i!735)))))

(declare-fun b!954861 () Bool)

(assert (=> b!954861 (= e!537958 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun lt!429947 () Bool)

(declare-fun zeroValue!1139 () V!32867)

(declare-fun minValue!1139 () V!32867)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13634 0))(
  ( (tuple2!13635 (_1!6828 (_ BitVec 64)) (_2!6828 V!32867)) )
))
(declare-datatypes ((List!19410 0))(
  ( (Nil!19407) (Cons!19406 (h!20568 tuple2!13634) (t!27771 List!19410)) )
))
(declare-datatypes ((ListLongMap!12331 0))(
  ( (ListLongMap!12332 (toList!6181 List!19410)) )
))
(declare-fun contains!5279 (ListLongMap!12331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3414 (array!57935 array!57937 (_ BitVec 32) (_ BitVec 32) V!32867 V!32867 (_ BitVec 32) Int) ListLongMap!12331)

(assert (=> b!954861 (= lt!429947 (contains!5279 (getCurrentListMap!3414 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27847 _keys!1441) i!735)))))

(declare-fun b!954862 () Bool)

(declare-fun tp_is_empty!20913 () Bool)

(assert (=> b!954862 (= e!537955 tp_is_empty!20913)))

(declare-fun res!639419 () Bool)

(assert (=> start!81874 (=> (not res!639419) (not e!537958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81874 (= res!639419 (validMask!0 mask!1823))))

(assert (=> start!81874 e!537958))

(assert (=> start!81874 true))

(assert (=> start!81874 tp_is_empty!20913))

(declare-fun array_inv!21617 (array!57935) Bool)

(assert (=> start!81874 (array_inv!21617 _keys!1441)))

(declare-fun e!537956 () Bool)

(declare-fun array_inv!21618 (array!57937) Bool)

(assert (=> start!81874 (and (array_inv!21618 _values!1197) e!537956)))

(assert (=> start!81874 tp!63806))

(declare-fun b!954863 () Bool)

(declare-fun res!639415 () Bool)

(assert (=> b!954863 (=> (not res!639415) (not e!537958))))

(assert (=> b!954863 (= res!639415 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28326 _keys!1441))))))

(declare-fun b!954864 () Bool)

(declare-fun res!639420 () Bool)

(assert (=> b!954864 (=> (not res!639420) (not e!537958))))

(declare-datatypes ((List!19411 0))(
  ( (Nil!19408) (Cons!19407 (h!20569 (_ BitVec 64)) (t!27772 List!19411)) )
))
(declare-fun arrayNoDuplicates!0 (array!57935 (_ BitVec 32) List!19411) Bool)

(assert (=> b!954864 (= res!639420 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19408))))

(declare-fun b!954865 () Bool)

(declare-fun e!537954 () Bool)

(assert (=> b!954865 (= e!537956 (and e!537954 mapRes!33331))))

(declare-fun condMapEmpty!33331 () Bool)

(declare-fun mapDefault!33331 () ValueCell!9975)

(assert (=> b!954865 (= condMapEmpty!33331 (= (arr!27848 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9975)) mapDefault!33331)))))

(declare-fun b!954866 () Bool)

(assert (=> b!954866 (= e!537954 tp_is_empty!20913)))

(declare-fun b!954867 () Bool)

(declare-fun res!639416 () Bool)

(assert (=> b!954867 (=> (not res!639416) (not e!537958))))

(assert (=> b!954867 (= res!639416 (and (= (size!28327 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28326 _keys!1441) (size!28327 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!81874 res!639419) b!954867))

(assert (= (and b!954867 res!639416) b!954859))

(assert (= (and b!954859 res!639418) b!954864))

(assert (= (and b!954864 res!639420) b!954863))

(assert (= (and b!954863 res!639415) b!954860))

(assert (= (and b!954860 res!639417) b!954861))

(assert (= (and b!954865 condMapEmpty!33331) mapIsEmpty!33331))

(assert (= (and b!954865 (not condMapEmpty!33331)) mapNonEmpty!33331))

(get-info :version)

(assert (= (and mapNonEmpty!33331 ((_ is ValueCellFull!9975) mapValue!33331)) b!954862))

(assert (= (and b!954865 ((_ is ValueCellFull!9975) mapDefault!33331)) b!954866))

(assert (= start!81874 b!954865))

(declare-fun m!886483 () Bool)

(assert (=> mapNonEmpty!33331 m!886483))

(declare-fun m!886485 () Bool)

(assert (=> b!954861 m!886485))

(declare-fun m!886487 () Bool)

(assert (=> b!954861 m!886487))

(assert (=> b!954861 m!886485))

(assert (=> b!954861 m!886487))

(declare-fun m!886489 () Bool)

(assert (=> b!954861 m!886489))

(assert (=> b!954860 m!886487))

(assert (=> b!954860 m!886487))

(declare-fun m!886491 () Bool)

(assert (=> b!954860 m!886491))

(declare-fun m!886493 () Bool)

(assert (=> start!81874 m!886493))

(declare-fun m!886495 () Bool)

(assert (=> start!81874 m!886495))

(declare-fun m!886497 () Bool)

(assert (=> start!81874 m!886497))

(declare-fun m!886499 () Bool)

(assert (=> b!954859 m!886499))

(declare-fun m!886501 () Bool)

(assert (=> b!954864 m!886501))

(check-sat (not b!954864) (not start!81874) (not b!954861) (not b_next!18369) (not mapNonEmpty!33331) tp_is_empty!20913 (not b!954860) b_and!29855 (not b!954859))
(check-sat b_and!29855 (not b_next!18369))
