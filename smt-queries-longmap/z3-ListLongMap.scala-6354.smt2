; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81842 () Bool)

(assert start!81842)

(declare-fun b_free!18355 () Bool)

(declare-fun b_next!18355 () Bool)

(assert (=> start!81842 (= b_free!18355 (not b_next!18355))))

(declare-fun tp!63766 () Bool)

(declare-fun b_and!29815 () Bool)

(assert (=> start!81842 (= tp!63766 b_and!29815)))

(declare-fun b!954431 () Bool)

(declare-fun e!537703 () Bool)

(declare-fun tp_is_empty!20899 () Bool)

(assert (=> b!954431 (= e!537703 tp_is_empty!20899)))

(declare-fun mapIsEmpty!33310 () Bool)

(declare-fun mapRes!33310 () Bool)

(assert (=> mapIsEmpty!33310 mapRes!33310))

(declare-fun mapNonEmpty!33310 () Bool)

(declare-fun tp!63765 () Bool)

(declare-fun e!537701 () Bool)

(assert (=> mapNonEmpty!33310 (= mapRes!33310 (and tp!63765 e!537701))))

(declare-fun mapKey!33310 () (_ BitVec 32))

(declare-datatypes ((V!32849 0))(
  ( (V!32850 (val!10500 Int)) )
))
(declare-datatypes ((ValueCell!9968 0))(
  ( (ValueCellFull!9968 (v!13054 V!32849)) (EmptyCell!9968) )
))
(declare-datatypes ((array!57868 0))(
  ( (array!57869 (arr!27814 (Array (_ BitVec 32) ValueCell!9968)) (size!28295 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57868)

(declare-fun mapRest!33310 () (Array (_ BitVec 32) ValueCell!9968))

(declare-fun mapValue!33310 () ValueCell!9968)

(assert (=> mapNonEmpty!33310 (= (arr!27814 _values!1197) (store mapRest!33310 mapKey!33310 mapValue!33310))))

(declare-fun b!954433 () Bool)

(declare-fun res!639180 () Bool)

(declare-fun e!537705 () Bool)

(assert (=> b!954433 (=> (not res!639180) (not e!537705))))

(declare-datatypes ((array!57870 0))(
  ( (array!57871 (arr!27815 (Array (_ BitVec 32) (_ BitVec 64))) (size!28296 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57870)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57870 (_ BitVec 32)) Bool)

(assert (=> b!954433 (= res!639180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954434 () Bool)

(declare-fun res!639181 () Bool)

(assert (=> b!954434 (=> (not res!639181) (not e!537705))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954434 (= res!639181 (validKeyInArray!0 (select (arr!27815 _keys!1441) i!735)))))

(declare-fun b!954435 () Bool)

(declare-fun res!639183 () Bool)

(assert (=> b!954435 (=> (not res!639183) (not e!537705))))

(declare-datatypes ((List!19414 0))(
  ( (Nil!19411) (Cons!19410 (h!20572 (_ BitVec 64)) (t!27766 List!19414)) )
))
(declare-fun arrayNoDuplicates!0 (array!57870 (_ BitVec 32) List!19414) Bool)

(assert (=> b!954435 (= res!639183 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19411))))

(declare-fun b!954436 () Bool)

(declare-fun res!639179 () Bool)

(assert (=> b!954436 (=> (not res!639179) (not e!537705))))

(assert (=> b!954436 (= res!639179 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28296 _keys!1441))))))

(declare-fun b!954437 () Bool)

(assert (=> b!954437 (= e!537705 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32849)

(declare-fun lt!429690 () Bool)

(declare-fun minValue!1139 () V!32849)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13672 0))(
  ( (tuple2!13673 (_1!6847 (_ BitVec 64)) (_2!6847 V!32849)) )
))
(declare-datatypes ((List!19415 0))(
  ( (Nil!19412) (Cons!19411 (h!20573 tuple2!13672) (t!27767 List!19415)) )
))
(declare-datatypes ((ListLongMap!12359 0))(
  ( (ListLongMap!12360 (toList!6195 List!19415)) )
))
(declare-fun contains!5236 (ListLongMap!12359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3357 (array!57870 array!57868 (_ BitVec 32) (_ BitVec 32) V!32849 V!32849 (_ BitVec 32) Int) ListLongMap!12359)

(assert (=> b!954437 (= lt!429690 (contains!5236 (getCurrentListMap!3357 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27815 _keys!1441) i!735)))))

(declare-fun b!954438 () Bool)

(assert (=> b!954438 (= e!537701 tp_is_empty!20899)))

(declare-fun b!954439 () Bool)

(declare-fun e!537702 () Bool)

(assert (=> b!954439 (= e!537702 (and e!537703 mapRes!33310))))

(declare-fun condMapEmpty!33310 () Bool)

(declare-fun mapDefault!33310 () ValueCell!9968)

(assert (=> b!954439 (= condMapEmpty!33310 (= (arr!27814 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9968)) mapDefault!33310)))))

(declare-fun b!954432 () Bool)

(declare-fun res!639184 () Bool)

(assert (=> b!954432 (=> (not res!639184) (not e!537705))))

(assert (=> b!954432 (= res!639184 (and (= (size!28295 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28296 _keys!1441) (size!28295 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639182 () Bool)

(assert (=> start!81842 (=> (not res!639182) (not e!537705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81842 (= res!639182 (validMask!0 mask!1823))))

(assert (=> start!81842 e!537705))

(assert (=> start!81842 true))

(assert (=> start!81842 tp_is_empty!20899))

(declare-fun array_inv!21653 (array!57870) Bool)

(assert (=> start!81842 (array_inv!21653 _keys!1441)))

(declare-fun array_inv!21654 (array!57868) Bool)

(assert (=> start!81842 (and (array_inv!21654 _values!1197) e!537702)))

(assert (=> start!81842 tp!63766))

(assert (= (and start!81842 res!639182) b!954432))

(assert (= (and b!954432 res!639184) b!954433))

(assert (= (and b!954433 res!639180) b!954435))

(assert (= (and b!954435 res!639183) b!954436))

(assert (= (and b!954436 res!639179) b!954434))

(assert (= (and b!954434 res!639181) b!954437))

(assert (= (and b!954439 condMapEmpty!33310) mapIsEmpty!33310))

(assert (= (and b!954439 (not condMapEmpty!33310)) mapNonEmpty!33310))

(get-info :version)

(assert (= (and mapNonEmpty!33310 ((_ is ValueCellFull!9968) mapValue!33310)) b!954438))

(assert (= (and b!954439 ((_ is ValueCellFull!9968) mapDefault!33310)) b!954431))

(assert (= start!81842 b!954439))

(declare-fun m!885585 () Bool)

(assert (=> b!954437 m!885585))

(declare-fun m!885587 () Bool)

(assert (=> b!954437 m!885587))

(assert (=> b!954437 m!885585))

(assert (=> b!954437 m!885587))

(declare-fun m!885589 () Bool)

(assert (=> b!954437 m!885589))

(declare-fun m!885591 () Bool)

(assert (=> mapNonEmpty!33310 m!885591))

(declare-fun m!885593 () Bool)

(assert (=> start!81842 m!885593))

(declare-fun m!885595 () Bool)

(assert (=> start!81842 m!885595))

(declare-fun m!885597 () Bool)

(assert (=> start!81842 m!885597))

(declare-fun m!885599 () Bool)

(assert (=> b!954435 m!885599))

(declare-fun m!885601 () Bool)

(assert (=> b!954433 m!885601))

(assert (=> b!954434 m!885587))

(assert (=> b!954434 m!885587))

(declare-fun m!885603 () Bool)

(assert (=> b!954434 m!885603))

(check-sat (not b!954434) (not b_next!18355) (not start!81842) (not mapNonEmpty!33310) tp_is_empty!20899 (not b!954433) (not b!954437) b_and!29815 (not b!954435))
(check-sat b_and!29815 (not b_next!18355))
