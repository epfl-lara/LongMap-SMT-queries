; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108082 () Bool)

(assert start!108082)

(declare-fun b_free!27795 () Bool)

(declare-fun b_next!27795 () Bool)

(assert (=> start!108082 (= b_free!27795 (not b_next!27795))))

(declare-fun tp!98338 () Bool)

(declare-fun b_and!45851 () Bool)

(assert (=> start!108082 (= tp!98338 b_and!45851)))

(declare-fun b!1276418 () Bool)

(declare-fun res!848272 () Bool)

(declare-fun e!728867 () Bool)

(assert (=> b!1276418 (=> (not res!848272) (not e!728867))))

(declare-datatypes ((array!83784 0))(
  ( (array!83785 (arr!40403 (Array (_ BitVec 32) (_ BitVec 64))) (size!40953 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83784)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83784 (_ BitVec 32)) Bool)

(assert (=> b!1276418 (= res!848272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276419 () Bool)

(declare-fun e!728870 () Bool)

(declare-fun e!728871 () Bool)

(declare-fun mapRes!51548 () Bool)

(assert (=> b!1276419 (= e!728870 (and e!728871 mapRes!51548))))

(declare-fun condMapEmpty!51548 () Bool)

(declare-datatypes ((V!49563 0))(
  ( (V!49564 (val!16747 Int)) )
))
(declare-datatypes ((ValueCell!15774 0))(
  ( (ValueCellFull!15774 (v!19344 V!49563)) (EmptyCell!15774) )
))
(declare-datatypes ((array!83786 0))(
  ( (array!83787 (arr!40404 (Array (_ BitVec 32) ValueCell!15774)) (size!40954 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83786)

(declare-fun mapDefault!51548 () ValueCell!15774)

(assert (=> b!1276419 (= condMapEmpty!51548 (= (arr!40404 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15774)) mapDefault!51548)))))

(declare-fun b!1276420 () Bool)

(declare-fun res!848273 () Bool)

(assert (=> b!1276420 (=> (not res!848273) (not e!728867))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276420 (= res!848273 (and (= (size!40954 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40953 _keys!1427) (size!40954 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51548 () Bool)

(assert (=> mapIsEmpty!51548 mapRes!51548))

(declare-fun mapNonEmpty!51548 () Bool)

(declare-fun tp!98339 () Bool)

(declare-fun e!728869 () Bool)

(assert (=> mapNonEmpty!51548 (= mapRes!51548 (and tp!98339 e!728869))))

(declare-fun mapValue!51548 () ValueCell!15774)

(declare-fun mapKey!51548 () (_ BitVec 32))

(declare-fun mapRest!51548 () (Array (_ BitVec 32) ValueCell!15774))

(assert (=> mapNonEmpty!51548 (= (arr!40404 _values!1187) (store mapRest!51548 mapKey!51548 mapValue!51548))))

(declare-fun res!848271 () Bool)

(assert (=> start!108082 (=> (not res!848271) (not e!728867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108082 (= res!848271 (validMask!0 mask!1805))))

(assert (=> start!108082 e!728867))

(assert (=> start!108082 true))

(assert (=> start!108082 tp!98338))

(declare-fun tp_is_empty!33345 () Bool)

(assert (=> start!108082 tp_is_empty!33345))

(declare-fun array_inv!30707 (array!83786) Bool)

(assert (=> start!108082 (and (array_inv!30707 _values!1187) e!728870)))

(declare-fun array_inv!30708 (array!83784) Bool)

(assert (=> start!108082 (array_inv!30708 _keys!1427)))

(declare-fun b!1276421 () Bool)

(assert (=> b!1276421 (= e!728867 false)))

(declare-fun minValue!1129 () V!49563)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49563)

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575485 () Bool)

(declare-datatypes ((tuple2!21480 0))(
  ( (tuple2!21481 (_1!10751 (_ BitVec 64)) (_2!10751 V!49563)) )
))
(declare-datatypes ((List!28653 0))(
  ( (Nil!28650) (Cons!28649 (h!29858 tuple2!21480) (t!42189 List!28653)) )
))
(declare-datatypes ((ListLongMap!19137 0))(
  ( (ListLongMap!19138 (toList!9584 List!28653)) )
))
(declare-fun contains!7693 (ListLongMap!19137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4668 (array!83784 array!83786 (_ BitVec 32) (_ BitVec 32) V!49563 V!49563 (_ BitVec 32) Int) ListLongMap!19137)

(assert (=> b!1276421 (= lt!575485 (contains!7693 (getCurrentListMap!4668 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276422 () Bool)

(assert (=> b!1276422 (= e!728871 tp_is_empty!33345)))

(declare-fun b!1276423 () Bool)

(declare-fun res!848274 () Bool)

(assert (=> b!1276423 (=> (not res!848274) (not e!728867))))

(declare-datatypes ((List!28654 0))(
  ( (Nil!28651) (Cons!28650 (h!29859 (_ BitVec 64)) (t!42190 List!28654)) )
))
(declare-fun arrayNoDuplicates!0 (array!83784 (_ BitVec 32) List!28654) Bool)

(assert (=> b!1276423 (= res!848274 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28651))))

(declare-fun b!1276424 () Bool)

(assert (=> b!1276424 (= e!728869 tp_is_empty!33345)))

(assert (= (and start!108082 res!848271) b!1276420))

(assert (= (and b!1276420 res!848273) b!1276418))

(assert (= (and b!1276418 res!848272) b!1276423))

(assert (= (and b!1276423 res!848274) b!1276421))

(assert (= (and b!1276419 condMapEmpty!51548) mapIsEmpty!51548))

(assert (= (and b!1276419 (not condMapEmpty!51548)) mapNonEmpty!51548))

(get-info :version)

(assert (= (and mapNonEmpty!51548 ((_ is ValueCellFull!15774) mapValue!51548)) b!1276424))

(assert (= (and b!1276419 ((_ is ValueCellFull!15774) mapDefault!51548)) b!1276422))

(assert (= start!108082 b!1276419))

(declare-fun m!1172337 () Bool)

(assert (=> b!1276421 m!1172337))

(assert (=> b!1276421 m!1172337))

(declare-fun m!1172339 () Bool)

(assert (=> b!1276421 m!1172339))

(declare-fun m!1172341 () Bool)

(assert (=> b!1276418 m!1172341))

(declare-fun m!1172343 () Bool)

(assert (=> b!1276423 m!1172343))

(declare-fun m!1172345 () Bool)

(assert (=> mapNonEmpty!51548 m!1172345))

(declare-fun m!1172347 () Bool)

(assert (=> start!108082 m!1172347))

(declare-fun m!1172349 () Bool)

(assert (=> start!108082 m!1172349))

(declare-fun m!1172351 () Bool)

(assert (=> start!108082 m!1172351))

(check-sat (not b_next!27795) (not b!1276421) (not b!1276418) tp_is_empty!33345 (not start!108082) (not b!1276423) (not mapNonEmpty!51548) b_and!45851)
(check-sat b_and!45851 (not b_next!27795))
