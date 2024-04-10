; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38192 () Bool)

(assert start!38192)

(declare-fun b_free!9051 () Bool)

(declare-fun b_next!9051 () Bool)

(assert (=> start!38192 (= b_free!9051 (not b_next!9051))))

(declare-fun tp!31937 () Bool)

(declare-fun b_and!16425 () Bool)

(assert (=> start!38192 (= tp!31937 b_and!16425)))

(declare-fun b!393826 () Bool)

(declare-fun res!225666 () Bool)

(declare-fun e!238428 () Bool)

(assert (=> b!393826 (=> (not res!225666) (not e!238428))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23353 0))(
  ( (array!23354 (arr!11134 (Array (_ BitVec 32) (_ BitVec 64))) (size!11486 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23353)

(assert (=> b!393826 (= res!225666 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11486 _keys!658))))))

(declare-fun b!393827 () Bool)

(declare-fun e!238426 () Bool)

(declare-fun e!238427 () Bool)

(assert (=> b!393827 (= e!238426 (not e!238427))))

(declare-fun res!225672 () Bool)

(assert (=> b!393827 (=> res!225672 e!238427)))

(declare-fun lt!186474 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393827 (= res!225672 (or (and (not lt!186474) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186474) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186474)))))

(assert (=> b!393827 (= lt!186474 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!14069 0))(
  ( (V!14070 (val!4906 Int)) )
))
(declare-datatypes ((ValueCell!4518 0))(
  ( (ValueCellFull!4518 (v!7147 V!14069)) (EmptyCell!4518) )
))
(declare-datatypes ((array!23355 0))(
  ( (array!23356 (arr!11135 (Array (_ BitVec 32) ValueCell!4518)) (size!11487 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23355)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14069)

(declare-datatypes ((tuple2!6622 0))(
  ( (tuple2!6623 (_1!3322 (_ BitVec 64)) (_2!3322 V!14069)) )
))
(declare-datatypes ((List!6474 0))(
  ( (Nil!6471) (Cons!6470 (h!7326 tuple2!6622) (t!11646 List!6474)) )
))
(declare-datatypes ((ListLongMap!5535 0))(
  ( (ListLongMap!5536 (toList!2783 List!6474)) )
))
(declare-fun lt!186470 () ListLongMap!5535)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14069)

(declare-fun getCurrentListMap!2123 (array!23353 array!23355 (_ BitVec 32) (_ BitVec 32) V!14069 V!14069 (_ BitVec 32) Int) ListLongMap!5535)

(assert (=> b!393827 (= lt!186470 (getCurrentListMap!2123 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186467 () array!23355)

(declare-fun lt!186471 () ListLongMap!5535)

(declare-fun lt!186468 () array!23353)

(assert (=> b!393827 (= lt!186471 (getCurrentListMap!2123 lt!186468 lt!186467 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186472 () ListLongMap!5535)

(declare-fun lt!186473 () ListLongMap!5535)

(assert (=> b!393827 (and (= lt!186472 lt!186473) (= lt!186473 lt!186472))))

(declare-fun v!373 () V!14069)

(declare-fun lt!186469 () ListLongMap!5535)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!1077 (ListLongMap!5535 tuple2!6622) ListLongMap!5535)

(assert (=> b!393827 (= lt!186473 (+!1077 lt!186469 (tuple2!6623 k0!778 v!373)))))

(declare-datatypes ((Unit!12042 0))(
  ( (Unit!12043) )
))
(declare-fun lt!186466 () Unit!12042)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!287 (array!23353 array!23355 (_ BitVec 32) (_ BitVec 32) V!14069 V!14069 (_ BitVec 32) (_ BitVec 64) V!14069 (_ BitVec 32) Int) Unit!12042)

(assert (=> b!393827 (= lt!186466 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!287 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1003 (array!23353 array!23355 (_ BitVec 32) (_ BitVec 32) V!14069 V!14069 (_ BitVec 32) Int) ListLongMap!5535)

(assert (=> b!393827 (= lt!186472 (getCurrentListMapNoExtraKeys!1003 lt!186468 lt!186467 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393827 (= lt!186467 (array!23356 (store (arr!11135 _values!506) i!548 (ValueCellFull!4518 v!373)) (size!11487 _values!506)))))

(assert (=> b!393827 (= lt!186469 (getCurrentListMapNoExtraKeys!1003 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!225663 () Bool)

(assert (=> start!38192 (=> (not res!225663) (not e!238428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38192 (= res!225663 (validMask!0 mask!970))))

(assert (=> start!38192 e!238428))

(declare-fun e!238423 () Bool)

(declare-fun array_inv!8176 (array!23355) Bool)

(assert (=> start!38192 (and (array_inv!8176 _values!506) e!238423)))

(assert (=> start!38192 tp!31937))

(assert (=> start!38192 true))

(declare-fun tp_is_empty!9723 () Bool)

(assert (=> start!38192 tp_is_empty!9723))

(declare-fun array_inv!8177 (array!23353) Bool)

(assert (=> start!38192 (array_inv!8177 _keys!658)))

(declare-fun b!393828 () Bool)

(assert (=> b!393828 (= e!238428 e!238426)))

(declare-fun res!225662 () Bool)

(assert (=> b!393828 (=> (not res!225662) (not e!238426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23353 (_ BitVec 32)) Bool)

(assert (=> b!393828 (= res!225662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186468 mask!970))))

(assert (=> b!393828 (= lt!186468 (array!23354 (store (arr!11134 _keys!658) i!548 k0!778) (size!11486 _keys!658)))))

(declare-fun b!393829 () Bool)

(declare-fun e!238429 () Bool)

(assert (=> b!393829 (= e!238429 tp_is_empty!9723)))

(declare-fun b!393830 () Bool)

(declare-fun res!225667 () Bool)

(assert (=> b!393830 (=> (not res!225667) (not e!238428))))

(assert (=> b!393830 (= res!225667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393831 () Bool)

(declare-fun e!238424 () Bool)

(assert (=> b!393831 (= e!238424 tp_is_empty!9723)))

(declare-fun b!393832 () Bool)

(declare-fun res!225665 () Bool)

(assert (=> b!393832 (=> (not res!225665) (not e!238428))))

(declare-datatypes ((List!6475 0))(
  ( (Nil!6472) (Cons!6471 (h!7327 (_ BitVec 64)) (t!11647 List!6475)) )
))
(declare-fun arrayNoDuplicates!0 (array!23353 (_ BitVec 32) List!6475) Bool)

(assert (=> b!393832 (= res!225665 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6472))))

(declare-fun b!393833 () Bool)

(declare-fun res!225669 () Bool)

(assert (=> b!393833 (=> (not res!225669) (not e!238428))))

(assert (=> b!393833 (= res!225669 (or (= (select (arr!11134 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11134 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393834 () Bool)

(declare-fun res!225668 () Bool)

(assert (=> b!393834 (=> (not res!225668) (not e!238426))))

(assert (=> b!393834 (= res!225668 (arrayNoDuplicates!0 lt!186468 #b00000000000000000000000000000000 Nil!6472))))

(declare-fun b!393835 () Bool)

(declare-fun res!225670 () Bool)

(assert (=> b!393835 (=> (not res!225670) (not e!238428))))

(assert (=> b!393835 (= res!225670 (and (= (size!11487 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11486 _keys!658) (size!11487 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393836 () Bool)

(declare-fun res!225671 () Bool)

(assert (=> b!393836 (=> (not res!225671) (not e!238428))))

(declare-fun arrayContainsKey!0 (array!23353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393836 (= res!225671 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393837 () Bool)

(declare-fun mapRes!16182 () Bool)

(assert (=> b!393837 (= e!238423 (and e!238424 mapRes!16182))))

(declare-fun condMapEmpty!16182 () Bool)

(declare-fun mapDefault!16182 () ValueCell!4518)

(assert (=> b!393837 (= condMapEmpty!16182 (= (arr!11135 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4518)) mapDefault!16182)))))

(declare-fun mapIsEmpty!16182 () Bool)

(assert (=> mapIsEmpty!16182 mapRes!16182))

(declare-fun b!393838 () Bool)

(assert (=> b!393838 (= e!238427 (bvslt i!548 (size!11487 _values!506)))))

(assert (=> b!393838 (= lt!186471 lt!186472)))

(declare-fun mapNonEmpty!16182 () Bool)

(declare-fun tp!31938 () Bool)

(assert (=> mapNonEmpty!16182 (= mapRes!16182 (and tp!31938 e!238429))))

(declare-fun mapRest!16182 () (Array (_ BitVec 32) ValueCell!4518))

(declare-fun mapKey!16182 () (_ BitVec 32))

(declare-fun mapValue!16182 () ValueCell!4518)

(assert (=> mapNonEmpty!16182 (= (arr!11135 _values!506) (store mapRest!16182 mapKey!16182 mapValue!16182))))

(declare-fun b!393839 () Bool)

(declare-fun res!225664 () Bool)

(assert (=> b!393839 (=> (not res!225664) (not e!238428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393839 (= res!225664 (validKeyInArray!0 k0!778))))

(assert (= (and start!38192 res!225663) b!393835))

(assert (= (and b!393835 res!225670) b!393830))

(assert (= (and b!393830 res!225667) b!393832))

(assert (= (and b!393832 res!225665) b!393826))

(assert (= (and b!393826 res!225666) b!393839))

(assert (= (and b!393839 res!225664) b!393833))

(assert (= (and b!393833 res!225669) b!393836))

(assert (= (and b!393836 res!225671) b!393828))

(assert (= (and b!393828 res!225662) b!393834))

(assert (= (and b!393834 res!225668) b!393827))

(assert (= (and b!393827 (not res!225672)) b!393838))

(assert (= (and b!393837 condMapEmpty!16182) mapIsEmpty!16182))

(assert (= (and b!393837 (not condMapEmpty!16182)) mapNonEmpty!16182))

(get-info :version)

(assert (= (and mapNonEmpty!16182 ((_ is ValueCellFull!4518) mapValue!16182)) b!393829))

(assert (= (and b!393837 ((_ is ValueCellFull!4518) mapDefault!16182)) b!393831))

(assert (= start!38192 b!393837))

(declare-fun m!390275 () Bool)

(assert (=> mapNonEmpty!16182 m!390275))

(declare-fun m!390277 () Bool)

(assert (=> b!393830 m!390277))

(declare-fun m!390279 () Bool)

(assert (=> b!393827 m!390279))

(declare-fun m!390281 () Bool)

(assert (=> b!393827 m!390281))

(declare-fun m!390283 () Bool)

(assert (=> b!393827 m!390283))

(declare-fun m!390285 () Bool)

(assert (=> b!393827 m!390285))

(declare-fun m!390287 () Bool)

(assert (=> b!393827 m!390287))

(declare-fun m!390289 () Bool)

(assert (=> b!393827 m!390289))

(declare-fun m!390291 () Bool)

(assert (=> b!393827 m!390291))

(declare-fun m!390293 () Bool)

(assert (=> b!393828 m!390293))

(declare-fun m!390295 () Bool)

(assert (=> b!393828 m!390295))

(declare-fun m!390297 () Bool)

(assert (=> b!393834 m!390297))

(declare-fun m!390299 () Bool)

(assert (=> b!393839 m!390299))

(declare-fun m!390301 () Bool)

(assert (=> start!38192 m!390301))

(declare-fun m!390303 () Bool)

(assert (=> start!38192 m!390303))

(declare-fun m!390305 () Bool)

(assert (=> start!38192 m!390305))

(declare-fun m!390307 () Bool)

(assert (=> b!393836 m!390307))

(declare-fun m!390309 () Bool)

(assert (=> b!393833 m!390309))

(declare-fun m!390311 () Bool)

(assert (=> b!393832 m!390311))

(check-sat (not b!393827) (not mapNonEmpty!16182) (not b!393832) (not b!393834) (not b_next!9051) (not start!38192) (not b!393839) b_and!16425 (not b!393828) tp_is_empty!9723 (not b!393836) (not b!393830))
(check-sat b_and!16425 (not b_next!9051))
