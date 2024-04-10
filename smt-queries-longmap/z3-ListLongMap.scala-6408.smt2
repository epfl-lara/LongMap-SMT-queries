; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82246 () Bool)

(assert start!82246)

(declare-fun b_free!18519 () Bool)

(declare-fun b_next!18519 () Bool)

(assert (=> start!82246 (= b_free!18519 (not b_next!18519))))

(declare-fun tp!64517 () Bool)

(declare-fun b_and!30007 () Bool)

(assert (=> start!82246 (= tp!64517 b_and!30007)))

(declare-fun mapIsEmpty!33817 () Bool)

(declare-fun mapRes!33817 () Bool)

(assert (=> mapIsEmpty!33817 mapRes!33817))

(declare-fun b!958685 () Bool)

(declare-fun res!641713 () Bool)

(declare-fun e!540461 () Bool)

(assert (=> b!958685 (=> (not res!641713) (not e!540461))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58549 0))(
  ( (array!58550 (arr!28148 (Array (_ BitVec 32) (_ BitVec 64))) (size!28627 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58549)

(declare-datatypes ((V!33283 0))(
  ( (V!33284 (val!10663 Int)) )
))
(declare-datatypes ((ValueCell!10131 0))(
  ( (ValueCellFull!10131 (v!13220 V!33283)) (EmptyCell!10131) )
))
(declare-datatypes ((array!58551 0))(
  ( (array!58552 (arr!28149 (Array (_ BitVec 32) ValueCell!10131)) (size!28628 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58551)

(assert (=> b!958685 (= res!641713 (and (= (size!28628 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28627 _keys!1668) (size!28628 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958686 () Bool)

(declare-fun e!540464 () Bool)

(declare-fun tp_is_empty!21225 () Bool)

(assert (=> b!958686 (= e!540464 tp_is_empty!21225)))

(declare-fun b!958687 () Bool)

(declare-fun res!641714 () Bool)

(assert (=> b!958687 (=> (not res!641714) (not e!540461))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958687 (= res!641714 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28627 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28627 _keys!1668))))))

(declare-fun b!958688 () Bool)

(declare-fun res!641710 () Bool)

(assert (=> b!958688 (=> (not res!641710) (not e!540461))))

(declare-datatypes ((List!19569 0))(
  ( (Nil!19566) (Cons!19565 (h!20727 (_ BitVec 64)) (t!27932 List!19569)) )
))
(declare-fun arrayNoDuplicates!0 (array!58549 (_ BitVec 32) List!19569) Bool)

(assert (=> b!958688 (= res!641710 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19566))))

(declare-fun b!958689 () Bool)

(declare-fun res!641709 () Bool)

(assert (=> b!958689 (=> (not res!641709) (not e!540461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58549 (_ BitVec 32)) Bool)

(assert (=> b!958689 (= res!641709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958690 () Bool)

(declare-fun e!540462 () Bool)

(assert (=> b!958690 (= e!540462 (and e!540464 mapRes!33817))))

(declare-fun condMapEmpty!33817 () Bool)

(declare-fun mapDefault!33817 () ValueCell!10131)

(assert (=> b!958690 (= condMapEmpty!33817 (= (arr!28149 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10131)) mapDefault!33817)))))

(declare-fun mapNonEmpty!33817 () Bool)

(declare-fun tp!64518 () Bool)

(declare-fun e!540465 () Bool)

(assert (=> mapNonEmpty!33817 (= mapRes!33817 (and tp!64518 e!540465))))

(declare-fun mapRest!33817 () (Array (_ BitVec 32) ValueCell!10131))

(declare-fun mapKey!33817 () (_ BitVec 32))

(declare-fun mapValue!33817 () ValueCell!10131)

(assert (=> mapNonEmpty!33817 (= (arr!28149 _values!1386) (store mapRest!33817 mapKey!33817 mapValue!33817))))

(declare-fun b!958691 () Bool)

(declare-fun res!641711 () Bool)

(assert (=> b!958691 (=> (not res!641711) (not e!540461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958691 (= res!641711 (validKeyInArray!0 (select (arr!28148 _keys!1668) i!793)))))

(declare-fun b!958692 () Bool)

(assert (=> b!958692 (= e!540461 false)))

(declare-fun minValue!1328 () V!33283)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33283)

(declare-fun lt!430470 () Bool)

(declare-datatypes ((tuple2!13748 0))(
  ( (tuple2!13749 (_1!6885 (_ BitVec 64)) (_2!6885 V!33283)) )
))
(declare-datatypes ((List!19570 0))(
  ( (Nil!19567) (Cons!19566 (h!20728 tuple2!13748) (t!27933 List!19570)) )
))
(declare-datatypes ((ListLongMap!12445 0))(
  ( (ListLongMap!12446 (toList!6238 List!19570)) )
))
(declare-fun contains!5339 (ListLongMap!12445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3471 (array!58549 array!58551 (_ BitVec 32) (_ BitVec 32) V!33283 V!33283 (_ BitVec 32) Int) ListLongMap!12445)

(assert (=> b!958692 (= lt!430470 (contains!5339 (getCurrentListMap!3471 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28148 _keys!1668) i!793)))))

(declare-fun b!958693 () Bool)

(assert (=> b!958693 (= e!540465 tp_is_empty!21225)))

(declare-fun res!641712 () Bool)

(assert (=> start!82246 (=> (not res!641712) (not e!540461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82246 (= res!641712 (validMask!0 mask!2088))))

(assert (=> start!82246 e!540461))

(assert (=> start!82246 true))

(assert (=> start!82246 tp_is_empty!21225))

(declare-fun array_inv!21827 (array!58549) Bool)

(assert (=> start!82246 (array_inv!21827 _keys!1668)))

(declare-fun array_inv!21828 (array!58551) Bool)

(assert (=> start!82246 (and (array_inv!21828 _values!1386) e!540462)))

(assert (=> start!82246 tp!64517))

(assert (= (and start!82246 res!641712) b!958685))

(assert (= (and b!958685 res!641713) b!958689))

(assert (= (and b!958689 res!641709) b!958688))

(assert (= (and b!958688 res!641710) b!958687))

(assert (= (and b!958687 res!641714) b!958691))

(assert (= (and b!958691 res!641711) b!958692))

(assert (= (and b!958690 condMapEmpty!33817) mapIsEmpty!33817))

(assert (= (and b!958690 (not condMapEmpty!33817)) mapNonEmpty!33817))

(get-info :version)

(assert (= (and mapNonEmpty!33817 ((_ is ValueCellFull!10131) mapValue!33817)) b!958693))

(assert (= (and b!958690 ((_ is ValueCellFull!10131) mapDefault!33817)) b!958686))

(assert (= start!82246 b!958690))

(declare-fun m!889297 () Bool)

(assert (=> b!958692 m!889297))

(declare-fun m!889299 () Bool)

(assert (=> b!958692 m!889299))

(assert (=> b!958692 m!889297))

(assert (=> b!958692 m!889299))

(declare-fun m!889301 () Bool)

(assert (=> b!958692 m!889301))

(assert (=> b!958691 m!889299))

(assert (=> b!958691 m!889299))

(declare-fun m!889303 () Bool)

(assert (=> b!958691 m!889303))

(declare-fun m!889305 () Bool)

(assert (=> b!958689 m!889305))

(declare-fun m!889307 () Bool)

(assert (=> start!82246 m!889307))

(declare-fun m!889309 () Bool)

(assert (=> start!82246 m!889309))

(declare-fun m!889311 () Bool)

(assert (=> start!82246 m!889311))

(declare-fun m!889313 () Bool)

(assert (=> b!958688 m!889313))

(declare-fun m!889315 () Bool)

(assert (=> mapNonEmpty!33817 m!889315))

(check-sat (not b!958691) (not start!82246) tp_is_empty!21225 b_and!30007 (not mapNonEmpty!33817) (not b!958689) (not b!958688) (not b!958692) (not b_next!18519))
(check-sat b_and!30007 (not b_next!18519))
