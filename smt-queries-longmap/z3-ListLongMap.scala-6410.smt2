; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82424 () Bool)

(assert start!82424)

(declare-fun b_free!18529 () Bool)

(declare-fun b_next!18529 () Bool)

(assert (=> start!82424 (= b_free!18529 (not b_next!18529))))

(declare-fun tp!64549 () Bool)

(declare-fun b_and!30027 () Bool)

(assert (=> start!82424 (= tp!64549 b_and!30027)))

(declare-fun b!959725 () Bool)

(declare-fun e!541120 () Bool)

(declare-fun tp_is_empty!21235 () Bool)

(assert (=> b!959725 (= e!541120 tp_is_empty!21235)))

(declare-fun b!959726 () Bool)

(declare-fun res!642145 () Bool)

(declare-fun e!541118 () Bool)

(assert (=> b!959726 (=> (not res!642145) (not e!541118))))

(declare-datatypes ((array!58598 0))(
  ( (array!58599 (arr!28168 (Array (_ BitVec 32) (_ BitVec 64))) (size!28648 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58598)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959726 (= res!642145 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28648 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28648 _keys!1668))))))

(declare-fun b!959727 () Bool)

(declare-fun res!642148 () Bool)

(assert (=> b!959727 (=> (not res!642148) (not e!541118))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33297 0))(
  ( (V!33298 (val!10668 Int)) )
))
(declare-fun minValue!1328 () V!33297)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10136 0))(
  ( (ValueCellFull!10136 (v!13222 V!33297)) (EmptyCell!10136) )
))
(declare-datatypes ((array!58600 0))(
  ( (array!58601 (arr!28169 (Array (_ BitVec 32) ValueCell!10136)) (size!28649 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58600)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33297)

(declare-datatypes ((tuple2!13738 0))(
  ( (tuple2!13739 (_1!6880 (_ BitVec 64)) (_2!6880 V!33297)) )
))
(declare-datatypes ((List!19570 0))(
  ( (Nil!19567) (Cons!19566 (h!20734 tuple2!13738) (t!27925 List!19570)) )
))
(declare-datatypes ((ListLongMap!12437 0))(
  ( (ListLongMap!12438 (toList!6234 List!19570)) )
))
(declare-fun contains!5348 (ListLongMap!12437 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3467 (array!58598 array!58600 (_ BitVec 32) (_ BitVec 32) V!33297 V!33297 (_ BitVec 32) Int) ListLongMap!12437)

(assert (=> b!959727 (= res!642148 (contains!5348 (getCurrentListMap!3467 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28168 _keys!1668) i!793)))))

(declare-fun b!959728 () Bool)

(declare-fun res!642146 () Bool)

(assert (=> b!959728 (=> (not res!642146) (not e!541118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58598 (_ BitVec 32)) Bool)

(assert (=> b!959728 (= res!642146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!642147 () Bool)

(assert (=> start!82424 (=> (not res!642147) (not e!541118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82424 (= res!642147 (validMask!0 mask!2088))))

(assert (=> start!82424 e!541118))

(assert (=> start!82424 true))

(assert (=> start!82424 tp_is_empty!21235))

(declare-fun array_inv!21919 (array!58598) Bool)

(assert (=> start!82424 (array_inv!21919 _keys!1668)))

(declare-fun e!541119 () Bool)

(declare-fun array_inv!21920 (array!58600) Bool)

(assert (=> start!82424 (and (array_inv!21920 _values!1386) e!541119)))

(assert (=> start!82424 tp!64549))

(declare-fun mapIsEmpty!33832 () Bool)

(declare-fun mapRes!33832 () Bool)

(assert (=> mapIsEmpty!33832 mapRes!33832))

(declare-fun mapNonEmpty!33832 () Bool)

(declare-fun tp!64548 () Bool)

(assert (=> mapNonEmpty!33832 (= mapRes!33832 (and tp!64548 e!541120))))

(declare-fun mapRest!33832 () (Array (_ BitVec 32) ValueCell!10136))

(declare-fun mapValue!33832 () ValueCell!10136)

(declare-fun mapKey!33832 () (_ BitVec 32))

(assert (=> mapNonEmpty!33832 (= (arr!28169 _values!1386) (store mapRest!33832 mapKey!33832 mapValue!33832))))

(declare-fun b!959729 () Bool)

(declare-fun res!642151 () Bool)

(assert (=> b!959729 (=> (not res!642151) (not e!541118))))

(assert (=> b!959729 (= res!642151 (and (= (size!28649 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28648 _keys!1668) (size!28649 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959730 () Bool)

(declare-fun res!642150 () Bool)

(assert (=> b!959730 (=> (not res!642150) (not e!541118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959730 (= res!642150 (validKeyInArray!0 (select (arr!28168 _keys!1668) i!793)))))

(declare-fun b!959731 () Bool)

(declare-fun e!541122 () Bool)

(assert (=> b!959731 (= e!541122 tp_is_empty!21235)))

(declare-fun b!959732 () Bool)

(declare-fun res!642149 () Bool)

(assert (=> b!959732 (=> (not res!642149) (not e!541118))))

(declare-datatypes ((List!19571 0))(
  ( (Nil!19568) (Cons!19567 (h!20735 (_ BitVec 64)) (t!27926 List!19571)) )
))
(declare-fun arrayNoDuplicates!0 (array!58598 (_ BitVec 32) List!19571) Bool)

(assert (=> b!959732 (= res!642149 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19568))))

(declare-fun b!959733 () Bool)

(assert (=> b!959733 (= e!541118 (not true))))

(assert (=> b!959733 (contains!5348 (getCurrentListMap!3467 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28168 _keys!1668) i!793))))

(declare-datatypes ((Unit!32126 0))(
  ( (Unit!32127) )
))
(declare-fun lt!430846 () Unit!32126)

(declare-fun lemmaInListMapFromThenInFromSmaller!1 (array!58598 array!58600 (_ BitVec 32) (_ BitVec 32) V!33297 V!33297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32126)

(assert (=> b!959733 (= lt!430846 (lemmaInListMapFromThenInFromSmaller!1 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959734 () Bool)

(assert (=> b!959734 (= e!541119 (and e!541122 mapRes!33832))))

(declare-fun condMapEmpty!33832 () Bool)

(declare-fun mapDefault!33832 () ValueCell!10136)

(assert (=> b!959734 (= condMapEmpty!33832 (= (arr!28169 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10136)) mapDefault!33832)))))

(assert (= (and start!82424 res!642147) b!959729))

(assert (= (and b!959729 res!642151) b!959728))

(assert (= (and b!959728 res!642146) b!959732))

(assert (= (and b!959732 res!642149) b!959726))

(assert (= (and b!959726 res!642145) b!959730))

(assert (= (and b!959730 res!642150) b!959727))

(assert (= (and b!959727 res!642148) b!959733))

(assert (= (and b!959734 condMapEmpty!33832) mapIsEmpty!33832))

(assert (= (and b!959734 (not condMapEmpty!33832)) mapNonEmpty!33832))

(get-info :version)

(assert (= (and mapNonEmpty!33832 ((_ is ValueCellFull!10136) mapValue!33832)) b!959725))

(assert (= (and b!959734 ((_ is ValueCellFull!10136) mapDefault!33832)) b!959731))

(assert (= start!82424 b!959734))

(declare-fun m!890691 () Bool)

(assert (=> b!959732 m!890691))

(declare-fun m!890693 () Bool)

(assert (=> b!959730 m!890693))

(assert (=> b!959730 m!890693))

(declare-fun m!890695 () Bool)

(assert (=> b!959730 m!890695))

(declare-fun m!890697 () Bool)

(assert (=> mapNonEmpty!33832 m!890697))

(declare-fun m!890699 () Bool)

(assert (=> b!959728 m!890699))

(declare-fun m!890701 () Bool)

(assert (=> start!82424 m!890701))

(declare-fun m!890703 () Bool)

(assert (=> start!82424 m!890703))

(declare-fun m!890705 () Bool)

(assert (=> start!82424 m!890705))

(declare-fun m!890707 () Bool)

(assert (=> b!959727 m!890707))

(assert (=> b!959727 m!890693))

(assert (=> b!959727 m!890707))

(assert (=> b!959727 m!890693))

(declare-fun m!890709 () Bool)

(assert (=> b!959727 m!890709))

(declare-fun m!890711 () Bool)

(assert (=> b!959733 m!890711))

(assert (=> b!959733 m!890693))

(assert (=> b!959733 m!890711))

(assert (=> b!959733 m!890693))

(declare-fun m!890713 () Bool)

(assert (=> b!959733 m!890713))

(declare-fun m!890715 () Bool)

(assert (=> b!959733 m!890715))

(check-sat (not b!959727) (not b!959733) tp_is_empty!21235 b_and!30027 (not mapNonEmpty!33832) (not b!959728) (not start!82424) (not b_next!18529) (not b!959732) (not b!959730))
(check-sat b_and!30027 (not b_next!18529))
