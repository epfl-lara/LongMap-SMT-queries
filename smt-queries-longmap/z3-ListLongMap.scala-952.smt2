; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20812 () Bool)

(assert start!20812)

(declare-fun b_free!5461 () Bool)

(declare-fun b_next!5461 () Bool)

(assert (=> start!20812 (= b_free!5461 (not b_next!5461))))

(declare-fun tp!19424 () Bool)

(declare-fun b_and!12221 () Bool)

(assert (=> start!20812 (= tp!19424 b_and!12221)))

(declare-fun b!208627 () Bool)

(declare-fun res!101515 () Bool)

(declare-fun e!136042 () Bool)

(assert (=> b!208627 (=> (not res!101515) (not e!136042))))

(declare-datatypes ((array!9841 0))(
  ( (array!9842 (arr!4671 (Array (_ BitVec 32) (_ BitVec 64))) (size!4996 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9841)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9841 (_ BitVec 32)) Bool)

(assert (=> b!208627 (= res!101515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208628 () Bool)

(declare-fun res!101520 () Bool)

(assert (=> b!208628 (=> (not res!101520) (not e!136042))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6745 0))(
  ( (V!6746 (val!2706 Int)) )
))
(declare-datatypes ((ValueCell!2318 0))(
  ( (ValueCellFull!2318 (v!4677 V!6745)) (EmptyCell!2318) )
))
(declare-datatypes ((array!9843 0))(
  ( (array!9844 (arr!4672 (Array (_ BitVec 32) ValueCell!2318)) (size!4997 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9843)

(assert (=> b!208628 (= res!101520 (and (= (size!4997 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4996 _keys!825) (size!4997 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208629 () Bool)

(declare-fun res!101517 () Bool)

(assert (=> b!208629 (=> (not res!101517) (not e!136042))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208629 (= res!101517 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4996 _keys!825))))))

(declare-fun b!208630 () Bool)

(declare-fun res!101516 () Bool)

(assert (=> b!208630 (=> (not res!101516) (not e!136042))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208630 (= res!101516 (validKeyInArray!0 k0!843))))

(declare-fun b!208631 () Bool)

(declare-fun res!101521 () Bool)

(assert (=> b!208631 (=> (not res!101521) (not e!136042))))

(assert (=> b!208631 (= res!101521 (= (select (arr!4671 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9053 () Bool)

(declare-fun mapRes!9053 () Bool)

(assert (=> mapIsEmpty!9053 mapRes!9053))

(declare-fun b!208632 () Bool)

(assert (=> b!208632 (= e!136042 false)))

(declare-datatypes ((tuple2!4036 0))(
  ( (tuple2!4037 (_1!2029 (_ BitVec 64)) (_2!2029 V!6745)) )
))
(declare-datatypes ((List!2925 0))(
  ( (Nil!2922) (Cons!2921 (h!3563 tuple2!4036) (t!7848 List!2925)) )
))
(declare-datatypes ((ListLongMap!2951 0))(
  ( (ListLongMap!2952 (toList!1491 List!2925)) )
))
(declare-fun lt!106874 () ListLongMap!2951)

(declare-fun v!520 () V!6745)

(declare-fun zeroValue!615 () V!6745)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6745)

(declare-fun getCurrentListMapNoExtraKeys!454 (array!9841 array!9843 (_ BitVec 32) (_ BitVec 32) V!6745 V!6745 (_ BitVec 32) Int) ListLongMap!2951)

(assert (=> b!208632 (= lt!106874 (getCurrentListMapNoExtraKeys!454 _keys!825 (array!9844 (store (arr!4672 _values!649) i!601 (ValueCellFull!2318 v!520)) (size!4997 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106873 () ListLongMap!2951)

(assert (=> b!208632 (= lt!106873 (getCurrentListMapNoExtraKeys!454 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208633 () Bool)

(declare-fun e!136041 () Bool)

(declare-fun tp_is_empty!5323 () Bool)

(assert (=> b!208633 (= e!136041 tp_is_empty!5323)))

(declare-fun b!208634 () Bool)

(declare-fun e!136040 () Bool)

(assert (=> b!208634 (= e!136040 tp_is_empty!5323)))

(declare-fun b!208635 () Bool)

(declare-fun e!136043 () Bool)

(assert (=> b!208635 (= e!136043 (and e!136040 mapRes!9053))))

(declare-fun condMapEmpty!9053 () Bool)

(declare-fun mapDefault!9053 () ValueCell!2318)

(assert (=> b!208635 (= condMapEmpty!9053 (= (arr!4672 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2318)) mapDefault!9053)))))

(declare-fun b!208636 () Bool)

(declare-fun res!101518 () Bool)

(assert (=> b!208636 (=> (not res!101518) (not e!136042))))

(declare-datatypes ((List!2926 0))(
  ( (Nil!2923) (Cons!2922 (h!3564 (_ BitVec 64)) (t!7849 List!2926)) )
))
(declare-fun arrayNoDuplicates!0 (array!9841 (_ BitVec 32) List!2926) Bool)

(assert (=> b!208636 (= res!101518 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2923))))

(declare-fun res!101519 () Bool)

(assert (=> start!20812 (=> (not res!101519) (not e!136042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20812 (= res!101519 (validMask!0 mask!1149))))

(assert (=> start!20812 e!136042))

(declare-fun array_inv!3063 (array!9843) Bool)

(assert (=> start!20812 (and (array_inv!3063 _values!649) e!136043)))

(assert (=> start!20812 true))

(assert (=> start!20812 tp_is_empty!5323))

(declare-fun array_inv!3064 (array!9841) Bool)

(assert (=> start!20812 (array_inv!3064 _keys!825)))

(assert (=> start!20812 tp!19424))

(declare-fun mapNonEmpty!9053 () Bool)

(declare-fun tp!19423 () Bool)

(assert (=> mapNonEmpty!9053 (= mapRes!9053 (and tp!19423 e!136041))))

(declare-fun mapValue!9053 () ValueCell!2318)

(declare-fun mapKey!9053 () (_ BitVec 32))

(declare-fun mapRest!9053 () (Array (_ BitVec 32) ValueCell!2318))

(assert (=> mapNonEmpty!9053 (= (arr!4672 _values!649) (store mapRest!9053 mapKey!9053 mapValue!9053))))

(assert (= (and start!20812 res!101519) b!208628))

(assert (= (and b!208628 res!101520) b!208627))

(assert (= (and b!208627 res!101515) b!208636))

(assert (= (and b!208636 res!101518) b!208629))

(assert (= (and b!208629 res!101517) b!208630))

(assert (= (and b!208630 res!101516) b!208631))

(assert (= (and b!208631 res!101521) b!208632))

(assert (= (and b!208635 condMapEmpty!9053) mapIsEmpty!9053))

(assert (= (and b!208635 (not condMapEmpty!9053)) mapNonEmpty!9053))

(get-info :version)

(assert (= (and mapNonEmpty!9053 ((_ is ValueCellFull!2318) mapValue!9053)) b!208633))

(assert (= (and b!208635 ((_ is ValueCellFull!2318) mapDefault!9053)) b!208634))

(assert (= start!20812 b!208635))

(declare-fun m!236355 () Bool)

(assert (=> b!208636 m!236355))

(declare-fun m!236357 () Bool)

(assert (=> b!208627 m!236357))

(declare-fun m!236359 () Bool)

(assert (=> mapNonEmpty!9053 m!236359))

(declare-fun m!236361 () Bool)

(assert (=> start!20812 m!236361))

(declare-fun m!236363 () Bool)

(assert (=> start!20812 m!236363))

(declare-fun m!236365 () Bool)

(assert (=> start!20812 m!236365))

(declare-fun m!236367 () Bool)

(assert (=> b!208630 m!236367))

(declare-fun m!236369 () Bool)

(assert (=> b!208631 m!236369))

(declare-fun m!236371 () Bool)

(assert (=> b!208632 m!236371))

(declare-fun m!236373 () Bool)

(assert (=> b!208632 m!236373))

(declare-fun m!236375 () Bool)

(assert (=> b!208632 m!236375))

(check-sat (not b!208636) (not b!208627) (not start!20812) tp_is_empty!5323 b_and!12221 (not b!208632) (not mapNonEmpty!9053) (not b_next!5461) (not b!208630))
(check-sat b_and!12221 (not b_next!5461))
