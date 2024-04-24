; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37422 () Bool)

(assert start!37422)

(declare-fun b_free!8563 () Bool)

(declare-fun b_next!8563 () Bool)

(assert (=> start!37422 (= b_free!8563 (not b_next!8563))))

(declare-fun tp!30405 () Bool)

(declare-fun b_and!15819 () Bool)

(assert (=> start!37422 (= tp!30405 b_and!15819)))

(declare-fun b!381051 () Bool)

(declare-fun res!216475 () Bool)

(declare-fun e!231703 () Bool)

(assert (=> b!381051 (=> (not res!216475) (not e!231703))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13387 0))(
  ( (V!13388 (val!4650 Int)) )
))
(declare-datatypes ((ValueCell!4262 0))(
  ( (ValueCellFull!4262 (v!6848 V!13387)) (EmptyCell!4262) )
))
(declare-datatypes ((array!22322 0))(
  ( (array!22323 (arr!10629 (Array (_ BitVec 32) ValueCell!4262)) (size!10981 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22322)

(declare-datatypes ((array!22324 0))(
  ( (array!22325 (arr!10630 (Array (_ BitVec 32) (_ BitVec 64))) (size!10982 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22324)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381051 (= res!216475 (and (= (size!10981 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10982 _keys!658) (size!10981 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381052 () Bool)

(declare-fun e!231699 () Bool)

(declare-fun e!231705 () Bool)

(assert (=> b!381052 (= e!231699 (not e!231705))))

(declare-fun res!216469 () Bool)

(assert (=> b!381052 (=> res!216469 e!231705)))

(declare-fun lt!178581 () Bool)

(assert (=> b!381052 (= res!216469 (or (and (not lt!178581) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178581) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178581)))))

(assert (=> b!381052 (= lt!178581 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13387)

(declare-datatypes ((tuple2!6118 0))(
  ( (tuple2!6119 (_1!3070 (_ BitVec 64)) (_2!3070 V!13387)) )
))
(declare-datatypes ((List!5955 0))(
  ( (Nil!5952) (Cons!5951 (h!6807 tuple2!6118) (t!11097 List!5955)) )
))
(declare-datatypes ((ListLongMap!5033 0))(
  ( (ListLongMap!5034 (toList!2532 List!5955)) )
))
(declare-fun lt!178582 () ListLongMap!5033)

(declare-fun minValue!472 () V!13387)

(declare-fun getCurrentListMap!1970 (array!22324 array!22322 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) Int) ListLongMap!5033)

(assert (=> b!381052 (= lt!178582 (getCurrentListMap!1970 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178586 () ListLongMap!5033)

(declare-fun lt!178583 () array!22322)

(declare-fun lt!178588 () array!22324)

(assert (=> b!381052 (= lt!178586 (getCurrentListMap!1970 lt!178588 lt!178583 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178584 () ListLongMap!5033)

(declare-fun lt!178580 () ListLongMap!5033)

(assert (=> b!381052 (and (= lt!178584 lt!178580) (= lt!178580 lt!178584))))

(declare-fun v!373 () V!13387)

(declare-fun lt!178585 () ListLongMap!5033)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!928 (ListLongMap!5033 tuple2!6118) ListLongMap!5033)

(assert (=> b!381052 (= lt!178580 (+!928 lt!178585 (tuple2!6119 k0!778 v!373)))))

(declare-datatypes ((Unit!11735 0))(
  ( (Unit!11736) )
))
(declare-fun lt!178587 () Unit!11735)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!157 (array!22324 array!22322 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) (_ BitVec 64) V!13387 (_ BitVec 32) Int) Unit!11735)

(assert (=> b!381052 (= lt!178587 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!157 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!817 (array!22324 array!22322 (_ BitVec 32) (_ BitVec 32) V!13387 V!13387 (_ BitVec 32) Int) ListLongMap!5033)

(assert (=> b!381052 (= lt!178584 (getCurrentListMapNoExtraKeys!817 lt!178588 lt!178583 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381052 (= lt!178583 (array!22323 (store (arr!10629 _values!506) i!548 (ValueCellFull!4262 v!373)) (size!10981 _values!506)))))

(assert (=> b!381052 (= lt!178585 (getCurrentListMapNoExtraKeys!817 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381053 () Bool)

(declare-fun res!216471 () Bool)

(assert (=> b!381053 (=> (not res!216471) (not e!231703))))

(assert (=> b!381053 (= res!216471 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10982 _keys!658))))))

(declare-fun b!381054 () Bool)

(declare-fun res!216477 () Bool)

(assert (=> b!381054 (=> (not res!216477) (not e!231703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381054 (= res!216477 (validKeyInArray!0 k0!778))))

(declare-fun b!381055 () Bool)

(assert (=> b!381055 (= e!231705 true)))

(assert (=> b!381055 (= lt!178586 lt!178584)))

(declare-fun b!381056 () Bool)

(declare-fun e!231700 () Bool)

(declare-fun tp_is_empty!9211 () Bool)

(assert (=> b!381056 (= e!231700 tp_is_empty!9211)))

(declare-fun mapNonEmpty!15381 () Bool)

(declare-fun mapRes!15381 () Bool)

(declare-fun tp!30404 () Bool)

(declare-fun e!231702 () Bool)

(assert (=> mapNonEmpty!15381 (= mapRes!15381 (and tp!30404 e!231702))))

(declare-fun mapRest!15381 () (Array (_ BitVec 32) ValueCell!4262))

(declare-fun mapValue!15381 () ValueCell!4262)

(declare-fun mapKey!15381 () (_ BitVec 32))

(assert (=> mapNonEmpty!15381 (= (arr!10629 _values!506) (store mapRest!15381 mapKey!15381 mapValue!15381))))

(declare-fun b!381057 () Bool)

(assert (=> b!381057 (= e!231702 tp_is_empty!9211)))

(declare-fun b!381058 () Bool)

(declare-fun res!216479 () Bool)

(assert (=> b!381058 (=> (not res!216479) (not e!231703))))

(declare-fun arrayContainsKey!0 (array!22324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381058 (= res!216479 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381060 () Bool)

(declare-fun res!216472 () Bool)

(assert (=> b!381060 (=> (not res!216472) (not e!231703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22324 (_ BitVec 32)) Bool)

(assert (=> b!381060 (= res!216472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381061 () Bool)

(declare-fun e!231704 () Bool)

(assert (=> b!381061 (= e!231704 (and e!231700 mapRes!15381))))

(declare-fun condMapEmpty!15381 () Bool)

(declare-fun mapDefault!15381 () ValueCell!4262)

(assert (=> b!381061 (= condMapEmpty!15381 (= (arr!10629 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4262)) mapDefault!15381)))))

(declare-fun mapIsEmpty!15381 () Bool)

(assert (=> mapIsEmpty!15381 mapRes!15381))

(declare-fun b!381062 () Bool)

(assert (=> b!381062 (= e!231703 e!231699)))

(declare-fun res!216470 () Bool)

(assert (=> b!381062 (=> (not res!216470) (not e!231699))))

(assert (=> b!381062 (= res!216470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178588 mask!970))))

(assert (=> b!381062 (= lt!178588 (array!22325 (store (arr!10630 _keys!658) i!548 k0!778) (size!10982 _keys!658)))))

(declare-fun res!216476 () Bool)

(assert (=> start!37422 (=> (not res!216476) (not e!231703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37422 (= res!216476 (validMask!0 mask!970))))

(assert (=> start!37422 e!231703))

(declare-fun array_inv!7868 (array!22322) Bool)

(assert (=> start!37422 (and (array_inv!7868 _values!506) e!231704)))

(assert (=> start!37422 tp!30405))

(assert (=> start!37422 true))

(assert (=> start!37422 tp_is_empty!9211))

(declare-fun array_inv!7869 (array!22324) Bool)

(assert (=> start!37422 (array_inv!7869 _keys!658)))

(declare-fun b!381059 () Bool)

(declare-fun res!216474 () Bool)

(assert (=> b!381059 (=> (not res!216474) (not e!231703))))

(assert (=> b!381059 (= res!216474 (or (= (select (arr!10630 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10630 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381063 () Bool)

(declare-fun res!216478 () Bool)

(assert (=> b!381063 (=> (not res!216478) (not e!231699))))

(declare-datatypes ((List!5956 0))(
  ( (Nil!5953) (Cons!5952 (h!6808 (_ BitVec 64)) (t!11098 List!5956)) )
))
(declare-fun arrayNoDuplicates!0 (array!22324 (_ BitVec 32) List!5956) Bool)

(assert (=> b!381063 (= res!216478 (arrayNoDuplicates!0 lt!178588 #b00000000000000000000000000000000 Nil!5953))))

(declare-fun b!381064 () Bool)

(declare-fun res!216473 () Bool)

(assert (=> b!381064 (=> (not res!216473) (not e!231703))))

(assert (=> b!381064 (= res!216473 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5953))))

(assert (= (and start!37422 res!216476) b!381051))

(assert (= (and b!381051 res!216475) b!381060))

(assert (= (and b!381060 res!216472) b!381064))

(assert (= (and b!381064 res!216473) b!381053))

(assert (= (and b!381053 res!216471) b!381054))

(assert (= (and b!381054 res!216477) b!381059))

(assert (= (and b!381059 res!216474) b!381058))

(assert (= (and b!381058 res!216479) b!381062))

(assert (= (and b!381062 res!216470) b!381063))

(assert (= (and b!381063 res!216478) b!381052))

(assert (= (and b!381052 (not res!216469)) b!381055))

(assert (= (and b!381061 condMapEmpty!15381) mapIsEmpty!15381))

(assert (= (and b!381061 (not condMapEmpty!15381)) mapNonEmpty!15381))

(get-info :version)

(assert (= (and mapNonEmpty!15381 ((_ is ValueCellFull!4262) mapValue!15381)) b!381057))

(assert (= (and b!381061 ((_ is ValueCellFull!4262) mapDefault!15381)) b!381056))

(assert (= start!37422 b!381061))

(declare-fun m!378281 () Bool)

(assert (=> mapNonEmpty!15381 m!378281))

(declare-fun m!378283 () Bool)

(assert (=> b!381064 m!378283))

(declare-fun m!378285 () Bool)

(assert (=> b!381059 m!378285))

(declare-fun m!378287 () Bool)

(assert (=> b!381062 m!378287))

(declare-fun m!378289 () Bool)

(assert (=> b!381062 m!378289))

(declare-fun m!378291 () Bool)

(assert (=> b!381054 m!378291))

(declare-fun m!378293 () Bool)

(assert (=> b!381052 m!378293))

(declare-fun m!378295 () Bool)

(assert (=> b!381052 m!378295))

(declare-fun m!378297 () Bool)

(assert (=> b!381052 m!378297))

(declare-fun m!378299 () Bool)

(assert (=> b!381052 m!378299))

(declare-fun m!378301 () Bool)

(assert (=> b!381052 m!378301))

(declare-fun m!378303 () Bool)

(assert (=> b!381052 m!378303))

(declare-fun m!378305 () Bool)

(assert (=> b!381052 m!378305))

(declare-fun m!378307 () Bool)

(assert (=> b!381063 m!378307))

(declare-fun m!378309 () Bool)

(assert (=> b!381060 m!378309))

(declare-fun m!378311 () Bool)

(assert (=> start!37422 m!378311))

(declare-fun m!378313 () Bool)

(assert (=> start!37422 m!378313))

(declare-fun m!378315 () Bool)

(assert (=> start!37422 m!378315))

(declare-fun m!378317 () Bool)

(assert (=> b!381058 m!378317))

(check-sat (not b!381064) b_and!15819 (not b_next!8563) (not b!381063) (not b!381054) (not mapNonEmpty!15381) (not b!381060) (not b!381052) (not b!381062) (not b!381058) tp_is_empty!9211 (not start!37422))
(check-sat b_and!15819 (not b_next!8563))
