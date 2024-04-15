; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37746 () Bool)

(assert start!37746)

(declare-fun b_free!8863 () Bool)

(declare-fun b_next!8863 () Bool)

(assert (=> start!37746 (= b_free!8863 (not b_next!8863))))

(declare-fun tp!31340 () Bool)

(declare-fun b_and!16079 () Bool)

(assert (=> start!37746 (= tp!31340 b_and!16079)))

(declare-fun b!387262 () Bool)

(declare-fun e!234764 () Bool)

(declare-fun tp_is_empty!9535 () Bool)

(assert (=> b!387262 (= e!234764 tp_is_empty!9535)))

(declare-fun b!387263 () Bool)

(declare-fun res!221320 () Bool)

(declare-fun e!234763 () Bool)

(assert (=> b!387263 (=> (not res!221320) (not e!234763))))

(declare-datatypes ((array!22949 0))(
  ( (array!22950 (arr!10943 (Array (_ BitVec 32) (_ BitVec 64))) (size!11296 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22949)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387263 (= res!221320 (or (= (select (arr!10943 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10943 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387264 () Bool)

(declare-fun e!234761 () Bool)

(assert (=> b!387264 (= e!234761 tp_is_empty!9535)))

(declare-fun b!387265 () Bool)

(declare-fun res!221323 () Bool)

(assert (=> b!387265 (=> (not res!221323) (not e!234763))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22949 (_ BitVec 32)) Bool)

(assert (=> b!387265 (= res!221323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387266 () Bool)

(declare-fun res!221325 () Bool)

(assert (=> b!387266 (=> (not res!221325) (not e!234763))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387266 (= res!221325 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15867 () Bool)

(declare-fun mapRes!15867 () Bool)

(declare-fun tp!31341 () Bool)

(assert (=> mapNonEmpty!15867 (= mapRes!15867 (and tp!31341 e!234761))))

(declare-datatypes ((V!13819 0))(
  ( (V!13820 (val!4812 Int)) )
))
(declare-datatypes ((ValueCell!4424 0))(
  ( (ValueCellFull!4424 (v!7003 V!13819)) (EmptyCell!4424) )
))
(declare-fun mapValue!15867 () ValueCell!4424)

(declare-fun mapKey!15867 () (_ BitVec 32))

(declare-datatypes ((array!22951 0))(
  ( (array!22952 (arr!10944 (Array (_ BitVec 32) ValueCell!4424)) (size!11297 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22951)

(declare-fun mapRest!15867 () (Array (_ BitVec 32) ValueCell!4424))

(assert (=> mapNonEmpty!15867 (= (arr!10944 _values!506) (store mapRest!15867 mapKey!15867 mapValue!15867))))

(declare-fun b!387267 () Bool)

(declare-fun res!221327 () Bool)

(assert (=> b!387267 (=> (not res!221327) (not e!234763))))

(assert (=> b!387267 (= res!221327 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11296 _keys!658))))))

(declare-fun mapIsEmpty!15867 () Bool)

(assert (=> mapIsEmpty!15867 mapRes!15867))

(declare-fun b!387268 () Bool)

(declare-fun res!221326 () Bool)

(assert (=> b!387268 (=> (not res!221326) (not e!234763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387268 (= res!221326 (validKeyInArray!0 k0!778))))

(declare-fun b!387269 () Bool)

(declare-fun res!221324 () Bool)

(assert (=> b!387269 (=> (not res!221324) (not e!234763))))

(declare-datatypes ((List!6284 0))(
  ( (Nil!6281) (Cons!6280 (h!7136 (_ BitVec 64)) (t!11425 List!6284)) )
))
(declare-fun arrayNoDuplicates!0 (array!22949 (_ BitVec 32) List!6284) Bool)

(assert (=> b!387269 (= res!221324 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6281))))

(declare-fun b!387270 () Bool)

(declare-fun e!234762 () Bool)

(assert (=> b!387270 (= e!234763 e!234762)))

(declare-fun res!221321 () Bool)

(assert (=> b!387270 (=> (not res!221321) (not e!234762))))

(declare-fun lt!181827 () array!22949)

(assert (=> b!387270 (= res!221321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181827 mask!970))))

(assert (=> b!387270 (= lt!181827 (array!22950 (store (arr!10943 _keys!658) i!548 k0!778) (size!11296 _keys!658)))))

(declare-fun res!221319 () Bool)

(assert (=> start!37746 (=> (not res!221319) (not e!234763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37746 (= res!221319 (validMask!0 mask!970))))

(assert (=> start!37746 e!234763))

(declare-fun e!234759 () Bool)

(declare-fun array_inv!8048 (array!22951) Bool)

(assert (=> start!37746 (and (array_inv!8048 _values!506) e!234759)))

(assert (=> start!37746 tp!31340))

(assert (=> start!37746 true))

(assert (=> start!37746 tp_is_empty!9535))

(declare-fun array_inv!8049 (array!22949) Bool)

(assert (=> start!37746 (array_inv!8049 _keys!658)))

(declare-fun b!387271 () Bool)

(assert (=> b!387271 (= e!234762 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13819)

(declare-datatypes ((tuple2!6444 0))(
  ( (tuple2!6445 (_1!3233 (_ BitVec 64)) (_2!3233 V!13819)) )
))
(declare-datatypes ((List!6285 0))(
  ( (Nil!6282) (Cons!6281 (h!7137 tuple2!6444) (t!11426 List!6285)) )
))
(declare-datatypes ((ListLongMap!5347 0))(
  ( (ListLongMap!5348 (toList!2689 List!6285)) )
))
(declare-fun lt!181825 () ListLongMap!5347)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13819)

(declare-fun minValue!472 () V!13819)

(declare-fun getCurrentListMapNoExtraKeys!929 (array!22949 array!22951 (_ BitVec 32) (_ BitVec 32) V!13819 V!13819 (_ BitVec 32) Int) ListLongMap!5347)

(assert (=> b!387271 (= lt!181825 (getCurrentListMapNoExtraKeys!929 lt!181827 (array!22952 (store (arr!10944 _values!506) i!548 (ValueCellFull!4424 v!373)) (size!11297 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181826 () ListLongMap!5347)

(assert (=> b!387271 (= lt!181826 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387272 () Bool)

(assert (=> b!387272 (= e!234759 (and e!234764 mapRes!15867))))

(declare-fun condMapEmpty!15867 () Bool)

(declare-fun mapDefault!15867 () ValueCell!4424)

(assert (=> b!387272 (= condMapEmpty!15867 (= (arr!10944 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4424)) mapDefault!15867)))))

(declare-fun b!387273 () Bool)

(declare-fun res!221322 () Bool)

(assert (=> b!387273 (=> (not res!221322) (not e!234763))))

(assert (=> b!387273 (= res!221322 (and (= (size!11297 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11296 _keys!658) (size!11297 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387274 () Bool)

(declare-fun res!221318 () Bool)

(assert (=> b!387274 (=> (not res!221318) (not e!234762))))

(assert (=> b!387274 (= res!221318 (arrayNoDuplicates!0 lt!181827 #b00000000000000000000000000000000 Nil!6281))))

(assert (= (and start!37746 res!221319) b!387273))

(assert (= (and b!387273 res!221322) b!387265))

(assert (= (and b!387265 res!221323) b!387269))

(assert (= (and b!387269 res!221324) b!387267))

(assert (= (and b!387267 res!221327) b!387268))

(assert (= (and b!387268 res!221326) b!387263))

(assert (= (and b!387263 res!221320) b!387266))

(assert (= (and b!387266 res!221325) b!387270))

(assert (= (and b!387270 res!221321) b!387274))

(assert (= (and b!387274 res!221318) b!387271))

(assert (= (and b!387272 condMapEmpty!15867) mapIsEmpty!15867))

(assert (= (and b!387272 (not condMapEmpty!15867)) mapNonEmpty!15867))

(get-info :version)

(assert (= (and mapNonEmpty!15867 ((_ is ValueCellFull!4424) mapValue!15867)) b!387264))

(assert (= (and b!387272 ((_ is ValueCellFull!4424) mapDefault!15867)) b!387262))

(assert (= start!37746 b!387272))

(declare-fun m!382901 () Bool)

(assert (=> b!387274 m!382901))

(declare-fun m!382903 () Bool)

(assert (=> b!387265 m!382903))

(declare-fun m!382905 () Bool)

(assert (=> b!387270 m!382905))

(declare-fun m!382907 () Bool)

(assert (=> b!387270 m!382907))

(declare-fun m!382909 () Bool)

(assert (=> b!387266 m!382909))

(declare-fun m!382911 () Bool)

(assert (=> b!387269 m!382911))

(declare-fun m!382913 () Bool)

(assert (=> b!387268 m!382913))

(declare-fun m!382915 () Bool)

(assert (=> b!387271 m!382915))

(declare-fun m!382917 () Bool)

(assert (=> b!387271 m!382917))

(declare-fun m!382919 () Bool)

(assert (=> b!387271 m!382919))

(declare-fun m!382921 () Bool)

(assert (=> mapNonEmpty!15867 m!382921))

(declare-fun m!382923 () Bool)

(assert (=> start!37746 m!382923))

(declare-fun m!382925 () Bool)

(assert (=> start!37746 m!382925))

(declare-fun m!382927 () Bool)

(assert (=> start!37746 m!382927))

(declare-fun m!382929 () Bool)

(assert (=> b!387263 m!382929))

(check-sat (not mapNonEmpty!15867) (not b!387274) (not b!387268) (not b!387271) (not b!387265) (not b!387266) (not b_next!8863) tp_is_empty!9535 (not start!37746) (not b!387269) (not b!387270) b_and!16079)
(check-sat b_and!16079 (not b_next!8863))
