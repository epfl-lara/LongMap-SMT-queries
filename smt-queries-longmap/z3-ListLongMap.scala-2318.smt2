; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37372 () Bool)

(assert start!37372)

(declare-fun b_free!8499 () Bool)

(declare-fun b_next!8499 () Bool)

(assert (=> start!37372 (= b_free!8499 (not b_next!8499))))

(declare-fun tp!30212 () Bool)

(declare-fun b_and!15741 () Bool)

(assert (=> start!37372 (= tp!30212 b_and!15741)))

(declare-fun mapNonEmpty!15285 () Bool)

(declare-fun mapRes!15285 () Bool)

(declare-fun tp!30213 () Bool)

(declare-fun e!230986 () Bool)

(assert (=> mapNonEmpty!15285 (= mapRes!15285 (and tp!30213 e!230986))))

(declare-datatypes ((V!13301 0))(
  ( (V!13302 (val!4618 Int)) )
))
(declare-datatypes ((ValueCell!4230 0))(
  ( (ValueCellFull!4230 (v!6815 V!13301)) (EmptyCell!4230) )
))
(declare-datatypes ((array!22215 0))(
  ( (array!22216 (arr!10576 (Array (_ BitVec 32) ValueCell!4230)) (size!10928 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22215)

(declare-fun mapValue!15285 () ValueCell!4230)

(declare-fun mapKey!15285 () (_ BitVec 32))

(declare-fun mapRest!15285 () (Array (_ BitVec 32) ValueCell!4230))

(assert (=> mapNonEmpty!15285 (= (arr!10576 _values!506) (store mapRest!15285 mapKey!15285 mapValue!15285))))

(declare-fun b!379680 () Bool)

(declare-fun res!215345 () Bool)

(declare-fun e!230990 () Bool)

(assert (=> b!379680 (=> (not res!215345) (not e!230990))))

(declare-datatypes ((array!22217 0))(
  ( (array!22218 (arr!10577 (Array (_ BitVec 32) (_ BitVec 64))) (size!10929 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22217)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379680 (= res!215345 (or (= (select (arr!10577 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10577 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379681 () Bool)

(declare-fun res!215351 () Bool)

(declare-fun e!230983 () Bool)

(assert (=> b!379681 (=> (not res!215351) (not e!230983))))

(declare-fun lt!177402 () array!22217)

(declare-datatypes ((List!6017 0))(
  ( (Nil!6014) (Cons!6013 (h!6869 (_ BitVec 64)) (t!11167 List!6017)) )
))
(declare-fun arrayNoDuplicates!0 (array!22217 (_ BitVec 32) List!6017) Bool)

(assert (=> b!379681 (= res!215351 (arrayNoDuplicates!0 lt!177402 #b00000000000000000000000000000000 Nil!6014))))

(declare-fun b!379682 () Bool)

(declare-fun e!230989 () Bool)

(assert (=> b!379682 (= e!230983 (not e!230989))))

(declare-fun res!215346 () Bool)

(assert (=> b!379682 (=> res!215346 e!230989)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379682 (= res!215346 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6182 0))(
  ( (tuple2!6183 (_1!3102 (_ BitVec 64)) (_2!3102 V!13301)) )
))
(declare-datatypes ((List!6018 0))(
  ( (Nil!6015) (Cons!6014 (h!6870 tuple2!6182) (t!11168 List!6018)) )
))
(declare-datatypes ((ListLongMap!5095 0))(
  ( (ListLongMap!5096 (toList!2563 List!6018)) )
))
(declare-fun lt!177394 () ListLongMap!5095)

(declare-fun zeroValue!472 () V!13301)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13301)

(declare-fun getCurrentListMap!1983 (array!22217 array!22215 (_ BitVec 32) (_ BitVec 32) V!13301 V!13301 (_ BitVec 32) Int) ListLongMap!5095)

(assert (=> b!379682 (= lt!177394 (getCurrentListMap!1983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177397 () ListLongMap!5095)

(declare-fun lt!177396 () array!22215)

(assert (=> b!379682 (= lt!177397 (getCurrentListMap!1983 lt!177402 lt!177396 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177404 () ListLongMap!5095)

(declare-fun lt!177400 () ListLongMap!5095)

(assert (=> b!379682 (and (= lt!177404 lt!177400) (= lt!177400 lt!177404))))

(declare-fun lt!177395 () ListLongMap!5095)

(declare-fun lt!177399 () tuple2!6182)

(declare-fun +!909 (ListLongMap!5095 tuple2!6182) ListLongMap!5095)

(assert (=> b!379682 (= lt!177400 (+!909 lt!177395 lt!177399))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13301)

(assert (=> b!379682 (= lt!177399 (tuple2!6183 k0!778 v!373))))

(declare-datatypes ((Unit!11712 0))(
  ( (Unit!11713) )
))
(declare-fun lt!177398 () Unit!11712)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!141 (array!22217 array!22215 (_ BitVec 32) (_ BitVec 32) V!13301 V!13301 (_ BitVec 32) (_ BitVec 64) V!13301 (_ BitVec 32) Int) Unit!11712)

(assert (=> b!379682 (= lt!177398 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!141 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!817 (array!22217 array!22215 (_ BitVec 32) (_ BitVec 32) V!13301 V!13301 (_ BitVec 32) Int) ListLongMap!5095)

(assert (=> b!379682 (= lt!177404 (getCurrentListMapNoExtraKeys!817 lt!177402 lt!177396 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379682 (= lt!177396 (array!22216 (store (arr!10576 _values!506) i!548 (ValueCellFull!4230 v!373)) (size!10928 _values!506)))))

(assert (=> b!379682 (= lt!177395 (getCurrentListMapNoExtraKeys!817 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379683 () Bool)

(declare-fun tp_is_empty!9147 () Bool)

(assert (=> b!379683 (= e!230986 tp_is_empty!9147)))

(declare-fun b!379684 () Bool)

(declare-fun res!215344 () Bool)

(assert (=> b!379684 (=> (not res!215344) (not e!230990))))

(assert (=> b!379684 (= res!215344 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6014))))

(declare-fun b!379686 () Bool)

(declare-fun res!215340 () Bool)

(assert (=> b!379686 (=> (not res!215340) (not e!230990))))

(assert (=> b!379686 (= res!215340 (and (= (size!10928 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10929 _keys!658) (size!10928 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379687 () Bool)

(declare-fun res!215349 () Bool)

(assert (=> b!379687 (=> (not res!215349) (not e!230990))))

(declare-fun arrayContainsKey!0 (array!22217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379687 (= res!215349 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379688 () Bool)

(declare-fun e!230988 () Bool)

(declare-fun e!230987 () Bool)

(assert (=> b!379688 (= e!230988 (and e!230987 mapRes!15285))))

(declare-fun condMapEmpty!15285 () Bool)

(declare-fun mapDefault!15285 () ValueCell!4230)

(assert (=> b!379688 (= condMapEmpty!15285 (= (arr!10576 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4230)) mapDefault!15285)))))

(declare-fun mapIsEmpty!15285 () Bool)

(assert (=> mapIsEmpty!15285 mapRes!15285))

(declare-fun b!379689 () Bool)

(assert (=> b!379689 (= e!230987 tp_is_empty!9147)))

(declare-fun b!379690 () Bool)

(declare-fun res!215341 () Bool)

(assert (=> b!379690 (=> (not res!215341) (not e!230990))))

(assert (=> b!379690 (= res!215341 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10929 _keys!658))))))

(declare-fun b!379691 () Bool)

(declare-fun res!215348 () Bool)

(assert (=> b!379691 (=> (not res!215348) (not e!230990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379691 (= res!215348 (validKeyInArray!0 k0!778))))

(declare-fun b!379692 () Bool)

(assert (=> b!379692 (= e!230990 e!230983)))

(declare-fun res!215350 () Bool)

(assert (=> b!379692 (=> (not res!215350) (not e!230983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22217 (_ BitVec 32)) Bool)

(assert (=> b!379692 (= res!215350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177402 mask!970))))

(assert (=> b!379692 (= lt!177402 (array!22218 (store (arr!10577 _keys!658) i!548 k0!778) (size!10929 _keys!658)))))

(declare-fun res!215342 () Bool)

(assert (=> start!37372 (=> (not res!215342) (not e!230990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37372 (= res!215342 (validMask!0 mask!970))))

(assert (=> start!37372 e!230990))

(declare-fun array_inv!7786 (array!22215) Bool)

(assert (=> start!37372 (and (array_inv!7786 _values!506) e!230988)))

(assert (=> start!37372 tp!30212))

(assert (=> start!37372 true))

(assert (=> start!37372 tp_is_empty!9147))

(declare-fun array_inv!7787 (array!22217) Bool)

(assert (=> start!37372 (array_inv!7787 _keys!658)))

(declare-fun b!379685 () Bool)

(declare-fun res!215343 () Bool)

(assert (=> b!379685 (=> (not res!215343) (not e!230990))))

(assert (=> b!379685 (= res!215343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379693 () Bool)

(declare-fun e!230984 () Bool)

(assert (=> b!379693 (= e!230989 e!230984)))

(declare-fun res!215347 () Bool)

(assert (=> b!379693 (=> res!215347 e!230984)))

(assert (=> b!379693 (= res!215347 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177401 () ListLongMap!5095)

(assert (=> b!379693 (= lt!177394 lt!177401)))

(declare-fun lt!177403 () tuple2!6182)

(assert (=> b!379693 (= lt!177401 (+!909 lt!177395 lt!177403))))

(declare-fun lt!177405 () ListLongMap!5095)

(assert (=> b!379693 (= lt!177397 lt!177405)))

(assert (=> b!379693 (= lt!177405 (+!909 lt!177400 lt!177403))))

(assert (=> b!379693 (= lt!177397 (+!909 lt!177404 lt!177403))))

(assert (=> b!379693 (= lt!177403 (tuple2!6183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379694 () Bool)

(assert (=> b!379694 (= e!230984 true)))

(assert (=> b!379694 (= lt!177405 (+!909 lt!177401 lt!177399))))

(declare-fun lt!177393 () Unit!11712)

(declare-fun addCommutativeForDiffKeys!306 (ListLongMap!5095 (_ BitVec 64) V!13301 (_ BitVec 64) V!13301) Unit!11712)

(assert (=> b!379694 (= lt!177393 (addCommutativeForDiffKeys!306 lt!177395 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37372 res!215342) b!379686))

(assert (= (and b!379686 res!215340) b!379685))

(assert (= (and b!379685 res!215343) b!379684))

(assert (= (and b!379684 res!215344) b!379690))

(assert (= (and b!379690 res!215341) b!379691))

(assert (= (and b!379691 res!215348) b!379680))

(assert (= (and b!379680 res!215345) b!379687))

(assert (= (and b!379687 res!215349) b!379692))

(assert (= (and b!379692 res!215350) b!379681))

(assert (= (and b!379681 res!215351) b!379682))

(assert (= (and b!379682 (not res!215346)) b!379693))

(assert (= (and b!379693 (not res!215347)) b!379694))

(assert (= (and b!379688 condMapEmpty!15285) mapIsEmpty!15285))

(assert (= (and b!379688 (not condMapEmpty!15285)) mapNonEmpty!15285))

(get-info :version)

(assert (= (and mapNonEmpty!15285 ((_ is ValueCellFull!4230) mapValue!15285)) b!379683))

(assert (= (and b!379688 ((_ is ValueCellFull!4230) mapDefault!15285)) b!379689))

(assert (= start!37372 b!379688))

(declare-fun m!376575 () Bool)

(assert (=> b!379691 m!376575))

(declare-fun m!376577 () Bool)

(assert (=> b!379680 m!376577))

(declare-fun m!376579 () Bool)

(assert (=> b!379685 m!376579))

(declare-fun m!376581 () Bool)

(assert (=> b!379684 m!376581))

(declare-fun m!376583 () Bool)

(assert (=> b!379682 m!376583))

(declare-fun m!376585 () Bool)

(assert (=> b!379682 m!376585))

(declare-fun m!376587 () Bool)

(assert (=> b!379682 m!376587))

(declare-fun m!376589 () Bool)

(assert (=> b!379682 m!376589))

(declare-fun m!376591 () Bool)

(assert (=> b!379682 m!376591))

(declare-fun m!376593 () Bool)

(assert (=> b!379682 m!376593))

(declare-fun m!376595 () Bool)

(assert (=> b!379682 m!376595))

(declare-fun m!376597 () Bool)

(assert (=> b!379694 m!376597))

(declare-fun m!376599 () Bool)

(assert (=> b!379694 m!376599))

(declare-fun m!376601 () Bool)

(assert (=> b!379693 m!376601))

(declare-fun m!376603 () Bool)

(assert (=> b!379693 m!376603))

(declare-fun m!376605 () Bool)

(assert (=> b!379693 m!376605))

(declare-fun m!376607 () Bool)

(assert (=> b!379692 m!376607))

(declare-fun m!376609 () Bool)

(assert (=> b!379692 m!376609))

(declare-fun m!376611 () Bool)

(assert (=> start!37372 m!376611))

(declare-fun m!376613 () Bool)

(assert (=> start!37372 m!376613))

(declare-fun m!376615 () Bool)

(assert (=> start!37372 m!376615))

(declare-fun m!376617 () Bool)

(assert (=> b!379687 m!376617))

(declare-fun m!376619 () Bool)

(assert (=> b!379681 m!376619))

(declare-fun m!376621 () Bool)

(assert (=> mapNonEmpty!15285 m!376621))

(check-sat (not b!379692) (not b!379691) (not b!379685) (not start!37372) (not b_next!8499) (not b!379687) (not mapNonEmpty!15285) (not b!379694) tp_is_empty!9147 (not b!379684) b_and!15741 (not b!379693) (not b!379681) (not b!379682))
(check-sat b_and!15741 (not b_next!8499))
