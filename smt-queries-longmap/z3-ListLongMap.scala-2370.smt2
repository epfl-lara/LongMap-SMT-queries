; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37668 () Bool)

(assert start!37668)

(declare-fun b_free!8785 () Bool)

(declare-fun b_next!8785 () Bool)

(assert (=> start!37668 (= b_free!8785 (not b_next!8785))))

(declare-fun tp!31107 () Bool)

(declare-fun b_and!16041 () Bool)

(assert (=> start!37668 (= tp!31107 b_and!16041)))

(declare-fun b!385963 () Bool)

(declare-fun res!220280 () Bool)

(declare-fun e!234201 () Bool)

(assert (=> b!385963 (=> (not res!220280) (not e!234201))))

(declare-datatypes ((array!22802 0))(
  ( (array!22803 (arr!10869 (Array (_ BitVec 32) (_ BitVec 64))) (size!11221 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22802)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22802 (_ BitVec 32)) Bool)

(assert (=> b!385963 (= res!220280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385964 () Bool)

(declare-fun res!220282 () Bool)

(assert (=> b!385964 (=> (not res!220282) (not e!234201))))

(declare-datatypes ((List!6130 0))(
  ( (Nil!6127) (Cons!6126 (h!6982 (_ BitVec 64)) (t!11272 List!6130)) )
))
(declare-fun arrayNoDuplicates!0 (array!22802 (_ BitVec 32) List!6130) Bool)

(assert (=> b!385964 (= res!220282 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6127))))

(declare-fun b!385965 () Bool)

(declare-fun res!220281 () Bool)

(assert (=> b!385965 (=> (not res!220281) (not e!234201))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385965 (= res!220281 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11221 _keys!658))))))

(declare-fun b!385966 () Bool)

(declare-fun e!234203 () Bool)

(declare-fun tp_is_empty!9457 () Bool)

(assert (=> b!385966 (= e!234203 tp_is_empty!9457)))

(declare-fun b!385967 () Bool)

(declare-fun res!220276 () Bool)

(assert (=> b!385967 (=> (not res!220276) (not e!234201))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385967 (= res!220276 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385968 () Bool)

(declare-fun e!234199 () Bool)

(assert (=> b!385968 (= e!234199 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!181727 () array!22802)

(declare-datatypes ((V!13715 0))(
  ( (V!13716 (val!4773 Int)) )
))
(declare-fun zeroValue!472 () V!13715)

(declare-datatypes ((tuple2!6282 0))(
  ( (tuple2!6283 (_1!3152 (_ BitVec 64)) (_2!3152 V!13715)) )
))
(declare-datatypes ((List!6131 0))(
  ( (Nil!6128) (Cons!6127 (h!6983 tuple2!6282) (t!11273 List!6131)) )
))
(declare-datatypes ((ListLongMap!5197 0))(
  ( (ListLongMap!5198 (toList!2614 List!6131)) )
))
(declare-fun lt!181728 () ListLongMap!5197)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13715)

(declare-datatypes ((ValueCell!4385 0))(
  ( (ValueCellFull!4385 (v!6971 V!13715)) (EmptyCell!4385) )
))
(declare-datatypes ((array!22804 0))(
  ( (array!22805 (arr!10870 (Array (_ BitVec 32) ValueCell!4385)) (size!11222 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22804)

(declare-fun minValue!472 () V!13715)

(declare-fun getCurrentListMapNoExtraKeys!889 (array!22802 array!22804 (_ BitVec 32) (_ BitVec 32) V!13715 V!13715 (_ BitVec 32) Int) ListLongMap!5197)

(assert (=> b!385968 (= lt!181728 (getCurrentListMapNoExtraKeys!889 lt!181727 (array!22805 (store (arr!10870 _values!506) i!548 (ValueCellFull!4385 v!373)) (size!11222 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181729 () ListLongMap!5197)

(assert (=> b!385968 (= lt!181729 (getCurrentListMapNoExtraKeys!889 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385969 () Bool)

(declare-fun res!220283 () Bool)

(assert (=> b!385969 (=> (not res!220283) (not e!234201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385969 (= res!220283 (validKeyInArray!0 k0!778))))

(declare-fun b!385970 () Bool)

(declare-fun e!234202 () Bool)

(declare-fun mapRes!15750 () Bool)

(assert (=> b!385970 (= e!234202 (and e!234203 mapRes!15750))))

(declare-fun condMapEmpty!15750 () Bool)

(declare-fun mapDefault!15750 () ValueCell!4385)

(assert (=> b!385970 (= condMapEmpty!15750 (= (arr!10870 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4385)) mapDefault!15750)))))

(declare-fun b!385971 () Bool)

(declare-fun res!220275 () Bool)

(assert (=> b!385971 (=> (not res!220275) (not e!234199))))

(assert (=> b!385971 (= res!220275 (arrayNoDuplicates!0 lt!181727 #b00000000000000000000000000000000 Nil!6127))))

(declare-fun b!385972 () Bool)

(declare-fun res!220279 () Bool)

(assert (=> b!385972 (=> (not res!220279) (not e!234201))))

(assert (=> b!385972 (= res!220279 (and (= (size!11222 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11221 _keys!658) (size!11222 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15750 () Bool)

(assert (=> mapIsEmpty!15750 mapRes!15750))

(declare-fun b!385974 () Bool)

(declare-fun e!234204 () Bool)

(assert (=> b!385974 (= e!234204 tp_is_empty!9457)))

(declare-fun mapNonEmpty!15750 () Bool)

(declare-fun tp!31106 () Bool)

(assert (=> mapNonEmpty!15750 (= mapRes!15750 (and tp!31106 e!234204))))

(declare-fun mapValue!15750 () ValueCell!4385)

(declare-fun mapRest!15750 () (Array (_ BitVec 32) ValueCell!4385))

(declare-fun mapKey!15750 () (_ BitVec 32))

(assert (=> mapNonEmpty!15750 (= (arr!10870 _values!506) (store mapRest!15750 mapKey!15750 mapValue!15750))))

(declare-fun b!385975 () Bool)

(declare-fun res!220277 () Bool)

(assert (=> b!385975 (=> (not res!220277) (not e!234201))))

(assert (=> b!385975 (= res!220277 (or (= (select (arr!10869 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10869 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385973 () Bool)

(assert (=> b!385973 (= e!234201 e!234199)))

(declare-fun res!220278 () Bool)

(assert (=> b!385973 (=> (not res!220278) (not e!234199))))

(assert (=> b!385973 (= res!220278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181727 mask!970))))

(assert (=> b!385973 (= lt!181727 (array!22803 (store (arr!10869 _keys!658) i!548 k0!778) (size!11221 _keys!658)))))

(declare-fun res!220274 () Bool)

(assert (=> start!37668 (=> (not res!220274) (not e!234201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37668 (= res!220274 (validMask!0 mask!970))))

(assert (=> start!37668 e!234201))

(declare-fun array_inv!8034 (array!22804) Bool)

(assert (=> start!37668 (and (array_inv!8034 _values!506) e!234202)))

(assert (=> start!37668 tp!31107))

(assert (=> start!37668 true))

(assert (=> start!37668 tp_is_empty!9457))

(declare-fun array_inv!8035 (array!22802) Bool)

(assert (=> start!37668 (array_inv!8035 _keys!658)))

(assert (= (and start!37668 res!220274) b!385972))

(assert (= (and b!385972 res!220279) b!385963))

(assert (= (and b!385963 res!220280) b!385964))

(assert (= (and b!385964 res!220282) b!385965))

(assert (= (and b!385965 res!220281) b!385969))

(assert (= (and b!385969 res!220283) b!385975))

(assert (= (and b!385975 res!220277) b!385967))

(assert (= (and b!385967 res!220276) b!385973))

(assert (= (and b!385973 res!220278) b!385971))

(assert (= (and b!385971 res!220275) b!385968))

(assert (= (and b!385970 condMapEmpty!15750) mapIsEmpty!15750))

(assert (= (and b!385970 (not condMapEmpty!15750)) mapNonEmpty!15750))

(get-info :version)

(assert (= (and mapNonEmpty!15750 ((_ is ValueCellFull!4385) mapValue!15750)) b!385974))

(assert (= (and b!385970 ((_ is ValueCellFull!4385) mapDefault!15750)) b!385966))

(assert (= start!37668 b!385970))

(declare-fun m!382685 () Bool)

(assert (=> b!385963 m!382685))

(declare-fun m!382687 () Bool)

(assert (=> b!385967 m!382687))

(declare-fun m!382689 () Bool)

(assert (=> b!385973 m!382689))

(declare-fun m!382691 () Bool)

(assert (=> b!385973 m!382691))

(declare-fun m!382693 () Bool)

(assert (=> b!385969 m!382693))

(declare-fun m!382695 () Bool)

(assert (=> start!37668 m!382695))

(declare-fun m!382697 () Bool)

(assert (=> start!37668 m!382697))

(declare-fun m!382699 () Bool)

(assert (=> start!37668 m!382699))

(declare-fun m!382701 () Bool)

(assert (=> mapNonEmpty!15750 m!382701))

(declare-fun m!382703 () Bool)

(assert (=> b!385975 m!382703))

(declare-fun m!382705 () Bool)

(assert (=> b!385964 m!382705))

(declare-fun m!382707 () Bool)

(assert (=> b!385968 m!382707))

(declare-fun m!382709 () Bool)

(assert (=> b!385968 m!382709))

(declare-fun m!382711 () Bool)

(assert (=> b!385968 m!382711))

(declare-fun m!382713 () Bool)

(assert (=> b!385971 m!382713))

(check-sat (not b!385968) (not b!385964) b_and!16041 (not b!385971) (not b!385963) (not b!385967) (not b!385969) (not b_next!8785) tp_is_empty!9457 (not mapNonEmpty!15750) (not start!37668) (not b!385973))
(check-sat b_and!16041 (not b_next!8785))
