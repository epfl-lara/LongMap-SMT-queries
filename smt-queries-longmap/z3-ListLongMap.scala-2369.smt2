; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37678 () Bool)

(assert start!37678)

(declare-fun b_free!8781 () Bool)

(declare-fun b_next!8781 () Bool)

(assert (=> start!37678 (= b_free!8781 (not b_next!8781))))

(declare-fun tp!31094 () Bool)

(declare-fun b_and!16023 () Bool)

(assert (=> start!37678 (= tp!31094 b_and!16023)))

(declare-fun b!385934 () Bool)

(declare-fun e!234200 () Bool)

(declare-fun tp_is_empty!9453 () Bool)

(assert (=> b!385934 (= e!234200 tp_is_empty!9453)))

(declare-fun mapNonEmpty!15744 () Bool)

(declare-fun mapRes!15744 () Bool)

(declare-fun tp!31095 () Bool)

(declare-fun e!234199 () Bool)

(assert (=> mapNonEmpty!15744 (= mapRes!15744 (and tp!31095 e!234199))))

(declare-datatypes ((V!13709 0))(
  ( (V!13710 (val!4771 Int)) )
))
(declare-datatypes ((ValueCell!4383 0))(
  ( (ValueCellFull!4383 (v!6968 V!13709)) (EmptyCell!4383) )
))
(declare-datatypes ((array!22805 0))(
  ( (array!22806 (arr!10871 (Array (_ BitVec 32) ValueCell!4383)) (size!11223 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22805)

(declare-fun mapRest!15744 () (Array (_ BitVec 32) ValueCell!4383))

(declare-fun mapKey!15744 () (_ BitVec 32))

(declare-fun mapValue!15744 () ValueCell!4383)

(assert (=> mapNonEmpty!15744 (= (arr!10871 _values!506) (store mapRest!15744 mapKey!15744 mapValue!15744))))

(declare-fun b!385935 () Bool)

(declare-fun res!220217 () Bool)

(declare-fun e!234198 () Bool)

(assert (=> b!385935 (=> (not res!220217) (not e!234198))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22807 0))(
  ( (array!22808 (arr!10872 (Array (_ BitVec 32) (_ BitVec 64))) (size!11224 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22807)

(assert (=> b!385935 (= res!220217 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11224 _keys!658))))))

(declare-fun b!385936 () Bool)

(declare-fun res!220220 () Bool)

(assert (=> b!385936 (=> (not res!220220) (not e!234198))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385936 (= res!220220 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15744 () Bool)

(assert (=> mapIsEmpty!15744 mapRes!15744))

(declare-fun b!385937 () Bool)

(declare-fun e!234197 () Bool)

(assert (=> b!385937 (= e!234197 (and e!234200 mapRes!15744))))

(declare-fun condMapEmpty!15744 () Bool)

(declare-fun mapDefault!15744 () ValueCell!4383)

(assert (=> b!385937 (= condMapEmpty!15744 (= (arr!10871 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4383)) mapDefault!15744)))))

(declare-fun b!385938 () Bool)

(declare-fun res!220225 () Bool)

(assert (=> b!385938 (=> (not res!220225) (not e!234198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385938 (= res!220225 (validKeyInArray!0 k0!778))))

(declare-fun b!385939 () Bool)

(declare-fun res!220222 () Bool)

(assert (=> b!385939 (=> (not res!220222) (not e!234198))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!385939 (= res!220222 (and (= (size!11223 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11224 _keys!658) (size!11223 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385941 () Bool)

(declare-fun res!220224 () Bool)

(declare-fun e!234196 () Bool)

(assert (=> b!385941 (=> (not res!220224) (not e!234196))))

(declare-fun lt!181690 () array!22807)

(declare-datatypes ((List!6258 0))(
  ( (Nil!6255) (Cons!6254 (h!7110 (_ BitVec 64)) (t!11408 List!6258)) )
))
(declare-fun arrayNoDuplicates!0 (array!22807 (_ BitVec 32) List!6258) Bool)

(assert (=> b!385941 (= res!220224 (arrayNoDuplicates!0 lt!181690 #b00000000000000000000000000000000 Nil!6255))))

(declare-fun b!385942 () Bool)

(declare-fun res!220226 () Bool)

(assert (=> b!385942 (=> (not res!220226) (not e!234198))))

(assert (=> b!385942 (= res!220226 (or (= (select (arr!10872 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10872 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385943 () Bool)

(assert (=> b!385943 (= e!234198 e!234196)))

(declare-fun res!220218 () Bool)

(assert (=> b!385943 (=> (not res!220218) (not e!234196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22807 (_ BitVec 32)) Bool)

(assert (=> b!385943 (= res!220218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181690 mask!970))))

(assert (=> b!385943 (= lt!181690 (array!22808 (store (arr!10872 _keys!658) i!548 k0!778) (size!11224 _keys!658)))))

(declare-fun b!385944 () Bool)

(declare-fun res!220221 () Bool)

(assert (=> b!385944 (=> (not res!220221) (not e!234198))))

(assert (=> b!385944 (= res!220221 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6255))))

(declare-fun b!385945 () Bool)

(assert (=> b!385945 (= e!234196 (bvsgt #b00000000000000000000000000000000 (size!11224 _keys!658)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13709)

(declare-fun v!373 () V!13709)

(declare-datatypes ((tuple2!6412 0))(
  ( (tuple2!6413 (_1!3217 (_ BitVec 64)) (_2!3217 V!13709)) )
))
(declare-datatypes ((List!6259 0))(
  ( (Nil!6256) (Cons!6255 (h!7111 tuple2!6412) (t!11409 List!6259)) )
))
(declare-datatypes ((ListLongMap!5325 0))(
  ( (ListLongMap!5326 (toList!2678 List!6259)) )
))
(declare-fun lt!181692 () ListLongMap!5325)

(declare-fun minValue!472 () V!13709)

(declare-fun getCurrentListMapNoExtraKeys!907 (array!22807 array!22805 (_ BitVec 32) (_ BitVec 32) V!13709 V!13709 (_ BitVec 32) Int) ListLongMap!5325)

(assert (=> b!385945 (= lt!181692 (getCurrentListMapNoExtraKeys!907 lt!181690 (array!22806 (store (arr!10871 _values!506) i!548 (ValueCellFull!4383 v!373)) (size!11223 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181691 () ListLongMap!5325)

(assert (=> b!385945 (= lt!181691 (getCurrentListMapNoExtraKeys!907 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385946 () Bool)

(assert (=> b!385946 (= e!234199 tp_is_empty!9453)))

(declare-fun res!220223 () Bool)

(assert (=> start!37678 (=> (not res!220223) (not e!234198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37678 (= res!220223 (validMask!0 mask!970))))

(assert (=> start!37678 e!234198))

(declare-fun array_inv!8000 (array!22805) Bool)

(assert (=> start!37678 (and (array_inv!8000 _values!506) e!234197)))

(assert (=> start!37678 tp!31094))

(assert (=> start!37678 true))

(assert (=> start!37678 tp_is_empty!9453))

(declare-fun array_inv!8001 (array!22807) Bool)

(assert (=> start!37678 (array_inv!8001 _keys!658)))

(declare-fun b!385940 () Bool)

(declare-fun res!220219 () Bool)

(assert (=> b!385940 (=> (not res!220219) (not e!234198))))

(assert (=> b!385940 (= res!220219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37678 res!220223) b!385939))

(assert (= (and b!385939 res!220222) b!385940))

(assert (= (and b!385940 res!220219) b!385944))

(assert (= (and b!385944 res!220221) b!385935))

(assert (= (and b!385935 res!220217) b!385938))

(assert (= (and b!385938 res!220225) b!385942))

(assert (= (and b!385942 res!220226) b!385936))

(assert (= (and b!385936 res!220220) b!385943))

(assert (= (and b!385943 res!220218) b!385941))

(assert (= (and b!385941 res!220224) b!385945))

(assert (= (and b!385937 condMapEmpty!15744) mapIsEmpty!15744))

(assert (= (and b!385937 (not condMapEmpty!15744)) mapNonEmpty!15744))

(get-info :version)

(assert (= (and mapNonEmpty!15744 ((_ is ValueCellFull!4383) mapValue!15744)) b!385946))

(assert (= (and b!385937 ((_ is ValueCellFull!4383) mapDefault!15744)) b!385934))

(assert (= start!37678 b!385937))

(declare-fun m!382395 () Bool)

(assert (=> b!385943 m!382395))

(declare-fun m!382397 () Bool)

(assert (=> b!385943 m!382397))

(declare-fun m!382399 () Bool)

(assert (=> b!385938 m!382399))

(declare-fun m!382401 () Bool)

(assert (=> b!385941 m!382401))

(declare-fun m!382403 () Bool)

(assert (=> start!37678 m!382403))

(declare-fun m!382405 () Bool)

(assert (=> start!37678 m!382405))

(declare-fun m!382407 () Bool)

(assert (=> start!37678 m!382407))

(declare-fun m!382409 () Bool)

(assert (=> mapNonEmpty!15744 m!382409))

(declare-fun m!382411 () Bool)

(assert (=> b!385944 m!382411))

(declare-fun m!382413 () Bool)

(assert (=> b!385936 m!382413))

(declare-fun m!382415 () Bool)

(assert (=> b!385942 m!382415))

(declare-fun m!382417 () Bool)

(assert (=> b!385945 m!382417))

(declare-fun m!382419 () Bool)

(assert (=> b!385945 m!382419))

(declare-fun m!382421 () Bool)

(assert (=> b!385945 m!382421))

(declare-fun m!382423 () Bool)

(assert (=> b!385940 m!382423))

(check-sat (not b!385945) (not mapNonEmpty!15744) (not b!385944) tp_is_empty!9453 (not b_next!8781) (not b!385938) (not start!37678) (not b!385936) (not b!385940) (not b!385943) (not b!385941) b_and!16023)
(check-sat b_and!16023 (not b_next!8781))
