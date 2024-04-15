; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37740 () Bool)

(assert start!37740)

(declare-fun b_free!8857 () Bool)

(declare-fun b_next!8857 () Bool)

(assert (=> start!37740 (= b_free!8857 (not b_next!8857))))

(declare-fun tp!31322 () Bool)

(declare-fun b_and!16073 () Bool)

(assert (=> start!37740 (= tp!31322 b_and!16073)))

(declare-fun b!387145 () Bool)

(declare-fun res!221237 () Bool)

(declare-fun e!234705 () Bool)

(assert (=> b!387145 (=> (not res!221237) (not e!234705))))

(declare-datatypes ((array!22939 0))(
  ( (array!22940 (arr!10938 (Array (_ BitVec 32) (_ BitVec 64))) (size!11291 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22939)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387145 (= res!221237 (or (= (select (arr!10938 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10938 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387146 () Bool)

(declare-fun res!221232 () Bool)

(assert (=> b!387146 (=> (not res!221232) (not e!234705))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22939 (_ BitVec 32)) Bool)

(assert (=> b!387146 (= res!221232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387147 () Bool)

(declare-fun res!221231 () Bool)

(assert (=> b!387147 (=> (not res!221231) (not e!234705))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387147 (= res!221231 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15858 () Bool)

(declare-fun mapRes!15858 () Bool)

(assert (=> mapIsEmpty!15858 mapRes!15858))

(declare-fun b!387148 () Bool)

(declare-fun e!234707 () Bool)

(declare-fun e!234710 () Bool)

(assert (=> b!387148 (= e!234707 (and e!234710 mapRes!15858))))

(declare-fun condMapEmpty!15858 () Bool)

(declare-datatypes ((V!13811 0))(
  ( (V!13812 (val!4809 Int)) )
))
(declare-datatypes ((ValueCell!4421 0))(
  ( (ValueCellFull!4421 (v!7000 V!13811)) (EmptyCell!4421) )
))
(declare-datatypes ((array!22941 0))(
  ( (array!22942 (arr!10939 (Array (_ BitVec 32) ValueCell!4421)) (size!11292 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22941)

(declare-fun mapDefault!15858 () ValueCell!4421)

(assert (=> b!387148 (= condMapEmpty!15858 (= (arr!10939 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4421)) mapDefault!15858)))))

(declare-fun b!387149 () Bool)

(declare-fun res!221235 () Bool)

(assert (=> b!387149 (=> (not res!221235) (not e!234705))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387149 (= res!221235 (and (= (size!11292 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11291 _keys!658) (size!11292 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387150 () Bool)

(declare-fun res!221233 () Bool)

(assert (=> b!387150 (=> (not res!221233) (not e!234705))))

(assert (=> b!387150 (= res!221233 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11291 _keys!658))))))

(declare-fun b!387151 () Bool)

(declare-fun e!234706 () Bool)

(assert (=> b!387151 (= e!234705 e!234706)))

(declare-fun res!221228 () Bool)

(assert (=> b!387151 (=> (not res!221228) (not e!234706))))

(declare-fun lt!181800 () array!22939)

(assert (=> b!387151 (= res!221228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181800 mask!970))))

(assert (=> b!387151 (= lt!181800 (array!22940 (store (arr!10938 _keys!658) i!548 k0!778) (size!11291 _keys!658)))))

(declare-fun b!387152 () Bool)

(declare-fun e!234709 () Bool)

(declare-fun tp_is_empty!9529 () Bool)

(assert (=> b!387152 (= e!234709 tp_is_empty!9529)))

(declare-fun b!387153 () Bool)

(assert (=> b!387153 (= e!234710 tp_is_empty!9529)))

(declare-fun b!387154 () Bool)

(declare-fun res!221230 () Bool)

(assert (=> b!387154 (=> (not res!221230) (not e!234705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387154 (= res!221230 (validKeyInArray!0 k0!778))))

(declare-fun b!387155 () Bool)

(declare-fun res!221236 () Bool)

(assert (=> b!387155 (=> (not res!221236) (not e!234705))))

(declare-datatypes ((List!6281 0))(
  ( (Nil!6278) (Cons!6277 (h!7133 (_ BitVec 64)) (t!11422 List!6281)) )
))
(declare-fun arrayNoDuplicates!0 (array!22939 (_ BitVec 32) List!6281) Bool)

(assert (=> b!387155 (= res!221236 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6278))))

(declare-fun b!387156 () Bool)

(declare-fun res!221234 () Bool)

(assert (=> b!387156 (=> (not res!221234) (not e!234706))))

(assert (=> b!387156 (= res!221234 (arrayNoDuplicates!0 lt!181800 #b00000000000000000000000000000000 Nil!6278))))

(declare-fun b!387157 () Bool)

(assert (=> b!387157 (= e!234706 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13811)

(declare-fun v!373 () V!13811)

(declare-fun minValue!472 () V!13811)

(declare-datatypes ((tuple2!6442 0))(
  ( (tuple2!6443 (_1!3232 (_ BitVec 64)) (_2!3232 V!13811)) )
))
(declare-datatypes ((List!6282 0))(
  ( (Nil!6279) (Cons!6278 (h!7134 tuple2!6442) (t!11423 List!6282)) )
))
(declare-datatypes ((ListLongMap!5345 0))(
  ( (ListLongMap!5346 (toList!2688 List!6282)) )
))
(declare-fun lt!181798 () ListLongMap!5345)

(declare-fun getCurrentListMapNoExtraKeys!928 (array!22939 array!22941 (_ BitVec 32) (_ BitVec 32) V!13811 V!13811 (_ BitVec 32) Int) ListLongMap!5345)

(assert (=> b!387157 (= lt!181798 (getCurrentListMapNoExtraKeys!928 lt!181800 (array!22942 (store (arr!10939 _values!506) i!548 (ValueCellFull!4421 v!373)) (size!11292 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181799 () ListLongMap!5345)

(assert (=> b!387157 (= lt!181799 (getCurrentListMapNoExtraKeys!928 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!221229 () Bool)

(assert (=> start!37740 (=> (not res!221229) (not e!234705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37740 (= res!221229 (validMask!0 mask!970))))

(assert (=> start!37740 e!234705))

(declare-fun array_inv!8044 (array!22941) Bool)

(assert (=> start!37740 (and (array_inv!8044 _values!506) e!234707)))

(assert (=> start!37740 tp!31322))

(assert (=> start!37740 true))

(assert (=> start!37740 tp_is_empty!9529))

(declare-fun array_inv!8045 (array!22939) Bool)

(assert (=> start!37740 (array_inv!8045 _keys!658)))

(declare-fun mapNonEmpty!15858 () Bool)

(declare-fun tp!31323 () Bool)

(assert (=> mapNonEmpty!15858 (= mapRes!15858 (and tp!31323 e!234709))))

(declare-fun mapValue!15858 () ValueCell!4421)

(declare-fun mapRest!15858 () (Array (_ BitVec 32) ValueCell!4421))

(declare-fun mapKey!15858 () (_ BitVec 32))

(assert (=> mapNonEmpty!15858 (= (arr!10939 _values!506) (store mapRest!15858 mapKey!15858 mapValue!15858))))

(assert (= (and start!37740 res!221229) b!387149))

(assert (= (and b!387149 res!221235) b!387146))

(assert (= (and b!387146 res!221232) b!387155))

(assert (= (and b!387155 res!221236) b!387150))

(assert (= (and b!387150 res!221233) b!387154))

(assert (= (and b!387154 res!221230) b!387145))

(assert (= (and b!387145 res!221237) b!387147))

(assert (= (and b!387147 res!221231) b!387151))

(assert (= (and b!387151 res!221228) b!387156))

(assert (= (and b!387156 res!221234) b!387157))

(assert (= (and b!387148 condMapEmpty!15858) mapIsEmpty!15858))

(assert (= (and b!387148 (not condMapEmpty!15858)) mapNonEmpty!15858))

(get-info :version)

(assert (= (and mapNonEmpty!15858 ((_ is ValueCellFull!4421) mapValue!15858)) b!387152))

(assert (= (and b!387148 ((_ is ValueCellFull!4421) mapDefault!15858)) b!387153))

(assert (= start!37740 b!387148))

(declare-fun m!382811 () Bool)

(assert (=> b!387156 m!382811))

(declare-fun m!382813 () Bool)

(assert (=> start!37740 m!382813))

(declare-fun m!382815 () Bool)

(assert (=> start!37740 m!382815))

(declare-fun m!382817 () Bool)

(assert (=> start!37740 m!382817))

(declare-fun m!382819 () Bool)

(assert (=> mapNonEmpty!15858 m!382819))

(declare-fun m!382821 () Bool)

(assert (=> b!387151 m!382821))

(declare-fun m!382823 () Bool)

(assert (=> b!387151 m!382823))

(declare-fun m!382825 () Bool)

(assert (=> b!387154 m!382825))

(declare-fun m!382827 () Bool)

(assert (=> b!387157 m!382827))

(declare-fun m!382829 () Bool)

(assert (=> b!387157 m!382829))

(declare-fun m!382831 () Bool)

(assert (=> b!387157 m!382831))

(declare-fun m!382833 () Bool)

(assert (=> b!387155 m!382833))

(declare-fun m!382835 () Bool)

(assert (=> b!387145 m!382835))

(declare-fun m!382837 () Bool)

(assert (=> b!387147 m!382837))

(declare-fun m!382839 () Bool)

(assert (=> b!387146 m!382839))

(check-sat tp_is_empty!9529 (not b!387155) (not start!37740) (not b!387154) (not b!387146) (not b_next!8857) (not b!387147) b_and!16073 (not b!387157) (not b!387156) (not b!387151) (not mapNonEmpty!15858))
(check-sat b_and!16073 (not b_next!8857))
