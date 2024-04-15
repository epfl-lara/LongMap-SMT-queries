; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37752 () Bool)

(assert start!37752)

(declare-fun b_free!8869 () Bool)

(declare-fun b_next!8869 () Bool)

(assert (=> start!37752 (= b_free!8869 (not b_next!8869))))

(declare-fun tp!31359 () Bool)

(declare-fun b_and!16085 () Bool)

(assert (=> start!37752 (= tp!31359 b_and!16085)))

(declare-fun b!387379 () Bool)

(declare-fun res!221411 () Bool)

(declare-fun e!234817 () Bool)

(assert (=> b!387379 (=> (not res!221411) (not e!234817))))

(declare-datatypes ((array!22961 0))(
  ( (array!22962 (arr!10949 (Array (_ BitVec 32) (_ BitVec 64))) (size!11302 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22961)

(declare-datatypes ((List!6289 0))(
  ( (Nil!6286) (Cons!6285 (h!7141 (_ BitVec 64)) (t!11430 List!6289)) )
))
(declare-fun arrayNoDuplicates!0 (array!22961 (_ BitVec 32) List!6289) Bool)

(assert (=> b!387379 (= res!221411 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6286))))

(declare-fun b!387380 () Bool)

(declare-fun res!221412 () Bool)

(assert (=> b!387380 (=> (not res!221412) (not e!234817))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387380 (= res!221412 (validKeyInArray!0 k0!778))))

(declare-fun b!387381 () Bool)

(declare-fun res!221414 () Bool)

(assert (=> b!387381 (=> (not res!221414) (not e!234817))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387381 (= res!221414 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11302 _keys!658))))))

(declare-fun res!221410 () Bool)

(assert (=> start!37752 (=> (not res!221410) (not e!234817))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37752 (= res!221410 (validMask!0 mask!970))))

(assert (=> start!37752 e!234817))

(declare-datatypes ((V!13827 0))(
  ( (V!13828 (val!4815 Int)) )
))
(declare-datatypes ((ValueCell!4427 0))(
  ( (ValueCellFull!4427 (v!7006 V!13827)) (EmptyCell!4427) )
))
(declare-datatypes ((array!22963 0))(
  ( (array!22964 (arr!10950 (Array (_ BitVec 32) ValueCell!4427)) (size!11303 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22963)

(declare-fun e!234818 () Bool)

(declare-fun array_inv!8054 (array!22963) Bool)

(assert (=> start!37752 (and (array_inv!8054 _values!506) e!234818)))

(assert (=> start!37752 tp!31359))

(assert (=> start!37752 true))

(declare-fun tp_is_empty!9541 () Bool)

(assert (=> start!37752 tp_is_empty!9541))

(declare-fun array_inv!8055 (array!22961) Bool)

(assert (=> start!37752 (array_inv!8055 _keys!658)))

(declare-fun mapNonEmpty!15876 () Bool)

(declare-fun mapRes!15876 () Bool)

(declare-fun tp!31358 () Bool)

(declare-fun e!234814 () Bool)

(assert (=> mapNonEmpty!15876 (= mapRes!15876 (and tp!31358 e!234814))))

(declare-fun mapKey!15876 () (_ BitVec 32))

(declare-fun mapValue!15876 () ValueCell!4427)

(declare-fun mapRest!15876 () (Array (_ BitVec 32) ValueCell!4427))

(assert (=> mapNonEmpty!15876 (= (arr!10950 _values!506) (store mapRest!15876 mapKey!15876 mapValue!15876))))

(declare-fun b!387382 () Bool)

(declare-fun res!221415 () Bool)

(assert (=> b!387382 (=> (not res!221415) (not e!234817))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387382 (= res!221415 (and (= (size!11303 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11302 _keys!658) (size!11303 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387383 () Bool)

(declare-fun res!221408 () Bool)

(assert (=> b!387383 (=> (not res!221408) (not e!234817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22961 (_ BitVec 32)) Bool)

(assert (=> b!387383 (= res!221408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15876 () Bool)

(assert (=> mapIsEmpty!15876 mapRes!15876))

(declare-fun b!387384 () Bool)

(declare-fun res!221409 () Bool)

(assert (=> b!387384 (=> (not res!221409) (not e!234817))))

(assert (=> b!387384 (= res!221409 (or (= (select (arr!10949 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10949 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387385 () Bool)

(declare-fun e!234813 () Bool)

(assert (=> b!387385 (= e!234813 false)))

(declare-fun lt!181852 () array!22961)

(declare-datatypes ((tuple2!6448 0))(
  ( (tuple2!6449 (_1!3235 (_ BitVec 64)) (_2!3235 V!13827)) )
))
(declare-datatypes ((List!6290 0))(
  ( (Nil!6287) (Cons!6286 (h!7142 tuple2!6448) (t!11431 List!6290)) )
))
(declare-datatypes ((ListLongMap!5351 0))(
  ( (ListLongMap!5352 (toList!2691 List!6290)) )
))
(declare-fun lt!181854 () ListLongMap!5351)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13827)

(declare-fun v!373 () V!13827)

(declare-fun minValue!472 () V!13827)

(declare-fun getCurrentListMapNoExtraKeys!931 (array!22961 array!22963 (_ BitVec 32) (_ BitVec 32) V!13827 V!13827 (_ BitVec 32) Int) ListLongMap!5351)

(assert (=> b!387385 (= lt!181854 (getCurrentListMapNoExtraKeys!931 lt!181852 (array!22964 (store (arr!10950 _values!506) i!548 (ValueCellFull!4427 v!373)) (size!11303 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181853 () ListLongMap!5351)

(assert (=> b!387385 (= lt!181853 (getCurrentListMapNoExtraKeys!931 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387386 () Bool)

(assert (=> b!387386 (= e!234814 tp_is_empty!9541)))

(declare-fun b!387387 () Bool)

(declare-fun e!234815 () Bool)

(assert (=> b!387387 (= e!234815 tp_is_empty!9541)))

(declare-fun b!387388 () Bool)

(declare-fun res!221416 () Bool)

(assert (=> b!387388 (=> (not res!221416) (not e!234813))))

(assert (=> b!387388 (= res!221416 (arrayNoDuplicates!0 lt!181852 #b00000000000000000000000000000000 Nil!6286))))

(declare-fun b!387389 () Bool)

(assert (=> b!387389 (= e!234817 e!234813)))

(declare-fun res!221417 () Bool)

(assert (=> b!387389 (=> (not res!221417) (not e!234813))))

(assert (=> b!387389 (= res!221417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181852 mask!970))))

(assert (=> b!387389 (= lt!181852 (array!22962 (store (arr!10949 _keys!658) i!548 k0!778) (size!11302 _keys!658)))))

(declare-fun b!387390 () Bool)

(declare-fun res!221413 () Bool)

(assert (=> b!387390 (=> (not res!221413) (not e!234817))))

(declare-fun arrayContainsKey!0 (array!22961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387390 (= res!221413 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387391 () Bool)

(assert (=> b!387391 (= e!234818 (and e!234815 mapRes!15876))))

(declare-fun condMapEmpty!15876 () Bool)

(declare-fun mapDefault!15876 () ValueCell!4427)

(assert (=> b!387391 (= condMapEmpty!15876 (= (arr!10950 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4427)) mapDefault!15876)))))

(assert (= (and start!37752 res!221410) b!387382))

(assert (= (and b!387382 res!221415) b!387383))

(assert (= (and b!387383 res!221408) b!387379))

(assert (= (and b!387379 res!221411) b!387381))

(assert (= (and b!387381 res!221414) b!387380))

(assert (= (and b!387380 res!221412) b!387384))

(assert (= (and b!387384 res!221409) b!387390))

(assert (= (and b!387390 res!221413) b!387389))

(assert (= (and b!387389 res!221417) b!387388))

(assert (= (and b!387388 res!221416) b!387385))

(assert (= (and b!387391 condMapEmpty!15876) mapIsEmpty!15876))

(assert (= (and b!387391 (not condMapEmpty!15876)) mapNonEmpty!15876))

(get-info :version)

(assert (= (and mapNonEmpty!15876 ((_ is ValueCellFull!4427) mapValue!15876)) b!387386))

(assert (= (and b!387391 ((_ is ValueCellFull!4427) mapDefault!15876)) b!387387))

(assert (= start!37752 b!387391))

(declare-fun m!382991 () Bool)

(assert (=> b!387383 m!382991))

(declare-fun m!382993 () Bool)

(assert (=> b!387389 m!382993))

(declare-fun m!382995 () Bool)

(assert (=> b!387389 m!382995))

(declare-fun m!382997 () Bool)

(assert (=> start!37752 m!382997))

(declare-fun m!382999 () Bool)

(assert (=> start!37752 m!382999))

(declare-fun m!383001 () Bool)

(assert (=> start!37752 m!383001))

(declare-fun m!383003 () Bool)

(assert (=> b!387390 m!383003))

(declare-fun m!383005 () Bool)

(assert (=> b!387385 m!383005))

(declare-fun m!383007 () Bool)

(assert (=> b!387385 m!383007))

(declare-fun m!383009 () Bool)

(assert (=> b!387385 m!383009))

(declare-fun m!383011 () Bool)

(assert (=> b!387388 m!383011))

(declare-fun m!383013 () Bool)

(assert (=> b!387384 m!383013))

(declare-fun m!383015 () Bool)

(assert (=> mapNonEmpty!15876 m!383015))

(declare-fun m!383017 () Bool)

(assert (=> b!387380 m!383017))

(declare-fun m!383019 () Bool)

(assert (=> b!387379 m!383019))

(check-sat (not start!37752) (not mapNonEmpty!15876) (not b!387379) tp_is_empty!9541 b_and!16085 (not b_next!8869) (not b!387380) (not b!387389) (not b!387383) (not b!387390) (not b!387385) (not b!387388))
(check-sat b_and!16085 (not b_next!8869))
