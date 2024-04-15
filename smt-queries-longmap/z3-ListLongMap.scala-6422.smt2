; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82310 () Bool)

(assert start!82310)

(declare-fun b_free!18595 () Bool)

(declare-fun b_next!18595 () Bool)

(assert (=> start!82310 (= b_free!18595 (not b_next!18595))))

(declare-fun tp!64755 () Bool)

(declare-fun b_and!30057 () Bool)

(assert (=> start!82310 (= tp!64755 b_and!30057)))

(declare-fun mapIsEmpty!33940 () Bool)

(declare-fun mapRes!33940 () Bool)

(assert (=> mapIsEmpty!33940 mapRes!33940))

(declare-fun b!959617 () Bool)

(declare-fun res!642402 () Bool)

(declare-fun e!540930 () Bool)

(assert (=> b!959617 (=> (not res!642402) (not e!540930))))

(declare-datatypes ((array!58642 0))(
  ( (array!58643 (arr!28195 (Array (_ BitVec 32) (_ BitVec 64))) (size!28676 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58642)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58642 (_ BitVec 32)) Bool)

(assert (=> b!959617 (= res!642402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959618 () Bool)

(declare-fun res!642405 () Bool)

(assert (=> b!959618 (=> (not res!642405) (not e!540930))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959618 (= res!642405 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28676 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28676 _keys!1668))))))

(declare-fun b!959619 () Bool)

(assert (=> b!959619 (= e!540930 false)))

(declare-datatypes ((V!33393 0))(
  ( (V!33394 (val!10704 Int)) )
))
(declare-fun minValue!1328 () V!33393)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10172 0))(
  ( (ValueCellFull!10172 (v!13260 V!33393)) (EmptyCell!10172) )
))
(declare-datatypes ((array!58644 0))(
  ( (array!58645 (arr!28196 (Array (_ BitVec 32) ValueCell!10172)) (size!28677 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58644)

(declare-fun lt!430348 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33393)

(declare-datatypes ((tuple2!13854 0))(
  ( (tuple2!13855 (_1!6938 (_ BitVec 64)) (_2!6938 V!33393)) )
))
(declare-datatypes ((List!19638 0))(
  ( (Nil!19635) (Cons!19634 (h!20796 tuple2!13854) (t!27992 List!19638)) )
))
(declare-datatypes ((ListLongMap!12541 0))(
  ( (ListLongMap!12542 (toList!6286 List!19638)) )
))
(declare-fun contains!5329 (ListLongMap!12541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3448 (array!58642 array!58644 (_ BitVec 32) (_ BitVec 32) V!33393 V!33393 (_ BitVec 32) Int) ListLongMap!12541)

(assert (=> b!959619 (= lt!430348 (contains!5329 (getCurrentListMap!3448 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28195 _keys!1668) i!793)))))

(declare-fun res!642401 () Bool)

(assert (=> start!82310 (=> (not res!642401) (not e!540930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82310 (= res!642401 (validMask!0 mask!2088))))

(assert (=> start!82310 e!540930))

(assert (=> start!82310 true))

(declare-fun tp_is_empty!21307 () Bool)

(assert (=> start!82310 tp_is_empty!21307))

(declare-fun array_inv!21913 (array!58642) Bool)

(assert (=> start!82310 (array_inv!21913 _keys!1668)))

(declare-fun e!540929 () Bool)

(declare-fun array_inv!21914 (array!58644) Bool)

(assert (=> start!82310 (and (array_inv!21914 _values!1386) e!540929)))

(assert (=> start!82310 tp!64755))

(declare-fun b!959616 () Bool)

(declare-fun e!540928 () Bool)

(assert (=> b!959616 (= e!540928 tp_is_empty!21307)))

(declare-fun b!959620 () Bool)

(declare-fun e!540932 () Bool)

(assert (=> b!959620 (= e!540932 tp_is_empty!21307)))

(declare-fun b!959621 () Bool)

(declare-fun res!642400 () Bool)

(assert (=> b!959621 (=> (not res!642400) (not e!540930))))

(assert (=> b!959621 (= res!642400 (and (= (size!28677 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28676 _keys!1668) (size!28677 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959622 () Bool)

(declare-fun res!642403 () Bool)

(assert (=> b!959622 (=> (not res!642403) (not e!540930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959622 (= res!642403 (validKeyInArray!0 (select (arr!28195 _keys!1668) i!793)))))

(declare-fun b!959623 () Bool)

(assert (=> b!959623 (= e!540929 (and e!540932 mapRes!33940))))

(declare-fun condMapEmpty!33940 () Bool)

(declare-fun mapDefault!33940 () ValueCell!10172)

(assert (=> b!959623 (= condMapEmpty!33940 (= (arr!28196 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10172)) mapDefault!33940)))))

(declare-fun mapNonEmpty!33940 () Bool)

(declare-fun tp!64756 () Bool)

(assert (=> mapNonEmpty!33940 (= mapRes!33940 (and tp!64756 e!540928))))

(declare-fun mapRest!33940 () (Array (_ BitVec 32) ValueCell!10172))

(declare-fun mapKey!33940 () (_ BitVec 32))

(declare-fun mapValue!33940 () ValueCell!10172)

(assert (=> mapNonEmpty!33940 (= (arr!28196 _values!1386) (store mapRest!33940 mapKey!33940 mapValue!33940))))

(declare-fun b!959624 () Bool)

(declare-fun res!642404 () Bool)

(assert (=> b!959624 (=> (not res!642404) (not e!540930))))

(declare-datatypes ((List!19639 0))(
  ( (Nil!19636) (Cons!19635 (h!20797 (_ BitVec 64)) (t!27993 List!19639)) )
))
(declare-fun arrayNoDuplicates!0 (array!58642 (_ BitVec 32) List!19639) Bool)

(assert (=> b!959624 (= res!642404 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19636))))

(assert (= (and start!82310 res!642401) b!959621))

(assert (= (and b!959621 res!642400) b!959617))

(assert (= (and b!959617 res!642402) b!959624))

(assert (= (and b!959624 res!642404) b!959618))

(assert (= (and b!959618 res!642405) b!959622))

(assert (= (and b!959622 res!642403) b!959619))

(assert (= (and b!959623 condMapEmpty!33940) mapIsEmpty!33940))

(assert (= (and b!959623 (not condMapEmpty!33940)) mapNonEmpty!33940))

(get-info :version)

(assert (= (and mapNonEmpty!33940 ((_ is ValueCellFull!10172) mapValue!33940)) b!959616))

(assert (= (and b!959623 ((_ is ValueCellFull!10172) mapDefault!33940)) b!959620))

(assert (= start!82310 b!959623))

(declare-fun m!889491 () Bool)

(assert (=> b!959619 m!889491))

(declare-fun m!889493 () Bool)

(assert (=> b!959619 m!889493))

(assert (=> b!959619 m!889491))

(assert (=> b!959619 m!889493))

(declare-fun m!889495 () Bool)

(assert (=> b!959619 m!889495))

(declare-fun m!889497 () Bool)

(assert (=> b!959617 m!889497))

(declare-fun m!889499 () Bool)

(assert (=> mapNonEmpty!33940 m!889499))

(declare-fun m!889501 () Bool)

(assert (=> start!82310 m!889501))

(declare-fun m!889503 () Bool)

(assert (=> start!82310 m!889503))

(declare-fun m!889505 () Bool)

(assert (=> start!82310 m!889505))

(declare-fun m!889507 () Bool)

(assert (=> b!959624 m!889507))

(assert (=> b!959622 m!889493))

(assert (=> b!959622 m!889493))

(declare-fun m!889509 () Bool)

(assert (=> b!959622 m!889509))

(check-sat (not b_next!18595) (not b!959622) (not b!959617) (not mapNonEmpty!33940) tp_is_empty!21307 b_and!30057 (not start!82310) (not b!959624) (not b!959619))
(check-sat b_and!30057 (not b_next!18595))
