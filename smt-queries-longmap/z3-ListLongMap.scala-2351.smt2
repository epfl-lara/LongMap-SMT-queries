; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37554 () Bool)

(assert start!37554)

(declare-fun b_free!8695 () Bool)

(declare-fun b_next!8695 () Bool)

(assert (=> start!37554 (= b_free!8695 (not b_next!8695))))

(declare-fun tp!30800 () Bool)

(declare-fun b_and!15911 () Bool)

(assert (=> start!37554 (= tp!30800 b_and!15911)))

(declare-fun res!218527 () Bool)

(declare-fun e!232947 () Bool)

(assert (=> start!37554 (=> (not res!218527) (not e!232947))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37554 (= res!218527 (validMask!0 mask!970))))

(assert (=> start!37554 e!232947))

(declare-datatypes ((V!13563 0))(
  ( (V!13564 (val!4716 Int)) )
))
(declare-datatypes ((ValueCell!4328 0))(
  ( (ValueCellFull!4328 (v!6907 V!13563)) (EmptyCell!4328) )
))
(declare-datatypes ((array!22575 0))(
  ( (array!22576 (arr!10756 (Array (_ BitVec 32) ValueCell!4328)) (size!11109 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22575)

(declare-fun e!232943 () Bool)

(declare-fun array_inv!7920 (array!22575) Bool)

(assert (=> start!37554 (and (array_inv!7920 _values!506) e!232943)))

(assert (=> start!37554 tp!30800))

(assert (=> start!37554 true))

(declare-fun tp_is_empty!9343 () Bool)

(assert (=> start!37554 tp_is_empty!9343))

(declare-datatypes ((array!22577 0))(
  ( (array!22578 (arr!10757 (Array (_ BitVec 32) (_ BitVec 64))) (size!11110 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22577)

(declare-fun array_inv!7921 (array!22577) Bool)

(assert (=> start!37554 (array_inv!7921 _keys!658)))

(declare-fun b!383601 () Bool)

(declare-fun res!218530 () Bool)

(declare-fun e!232945 () Bool)

(assert (=> b!383601 (=> (not res!218530) (not e!232945))))

(declare-fun lt!180221 () array!22577)

(declare-datatypes ((List!6150 0))(
  ( (Nil!6147) (Cons!6146 (h!7002 (_ BitVec 64)) (t!11291 List!6150)) )
))
(declare-fun arrayNoDuplicates!0 (array!22577 (_ BitVec 32) List!6150) Bool)

(assert (=> b!383601 (= res!218530 (arrayNoDuplicates!0 lt!180221 #b00000000000000000000000000000000 Nil!6147))))

(declare-fun b!383602 () Bool)

(declare-fun res!218531 () Bool)

(assert (=> b!383602 (=> (not res!218531) (not e!232947))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383602 (= res!218531 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15579 () Bool)

(declare-fun mapRes!15579 () Bool)

(declare-fun tp!30801 () Bool)

(declare-fun e!232946 () Bool)

(assert (=> mapNonEmpty!15579 (= mapRes!15579 (and tp!30801 e!232946))))

(declare-fun mapKey!15579 () (_ BitVec 32))

(declare-fun mapRest!15579 () (Array (_ BitVec 32) ValueCell!4328))

(declare-fun mapValue!15579 () ValueCell!4328)

(assert (=> mapNonEmpty!15579 (= (arr!10756 _values!506) (store mapRest!15579 mapKey!15579 mapValue!15579))))

(declare-fun mapIsEmpty!15579 () Bool)

(assert (=> mapIsEmpty!15579 mapRes!15579))

(declare-fun b!383603 () Bool)

(declare-fun res!218528 () Bool)

(assert (=> b!383603 (=> (not res!218528) (not e!232947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383603 (= res!218528 (validKeyInArray!0 k0!778))))

(declare-fun b!383604 () Bool)

(declare-fun res!218526 () Bool)

(assert (=> b!383604 (=> (not res!218526) (not e!232947))))

(assert (=> b!383604 (= res!218526 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6147))))

(declare-fun b!383605 () Bool)

(declare-fun e!232944 () Bool)

(assert (=> b!383605 (= e!232944 true)))

(declare-datatypes ((tuple2!6326 0))(
  ( (tuple2!6327 (_1!3174 (_ BitVec 64)) (_2!3174 V!13563)) )
))
(declare-datatypes ((List!6151 0))(
  ( (Nil!6148) (Cons!6147 (h!7003 tuple2!6326) (t!11292 List!6151)) )
))
(declare-datatypes ((ListLongMap!5229 0))(
  ( (ListLongMap!5230 (toList!2630 List!6151)) )
))
(declare-fun lt!180230 () ListLongMap!5229)

(declare-fun lt!180229 () ListLongMap!5229)

(declare-fun lt!180228 () tuple2!6326)

(declare-fun +!987 (ListLongMap!5229 tuple2!6326) ListLongMap!5229)

(assert (=> b!383605 (= lt!180230 (+!987 lt!180229 lt!180228))))

(declare-fun lt!180227 () ListLongMap!5229)

(declare-fun lt!180224 () ListLongMap!5229)

(assert (=> b!383605 (= lt!180227 lt!180224)))

(declare-fun b!383606 () Bool)

(assert (=> b!383606 (= e!232947 e!232945)))

(declare-fun res!218523 () Bool)

(assert (=> b!383606 (=> (not res!218523) (not e!232945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22577 (_ BitVec 32)) Bool)

(assert (=> b!383606 (= res!218523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180221 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383606 (= lt!180221 (array!22578 (store (arr!10757 _keys!658) i!548 k0!778) (size!11110 _keys!658)))))

(declare-fun b!383607 () Bool)

(declare-fun res!218524 () Bool)

(assert (=> b!383607 (=> (not res!218524) (not e!232947))))

(assert (=> b!383607 (= res!218524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383608 () Bool)

(declare-fun res!218522 () Bool)

(assert (=> b!383608 (=> (not res!218522) (not e!232947))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383608 (= res!218522 (and (= (size!11109 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11110 _keys!658) (size!11109 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383609 () Bool)

(declare-fun e!232948 () Bool)

(assert (=> b!383609 (= e!232948 tp_is_empty!9343)))

(declare-fun b!383610 () Bool)

(declare-fun res!218525 () Bool)

(assert (=> b!383610 (=> (not res!218525) (not e!232947))))

(assert (=> b!383610 (= res!218525 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11110 _keys!658))))))

(declare-fun b!383611 () Bool)

(assert (=> b!383611 (= e!232946 tp_is_empty!9343)))

(declare-fun b!383612 () Bool)

(declare-fun res!218521 () Bool)

(assert (=> b!383612 (=> (not res!218521) (not e!232947))))

(assert (=> b!383612 (= res!218521 (or (= (select (arr!10757 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10757 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383613 () Bool)

(assert (=> b!383613 (= e!232945 (not e!232944))))

(declare-fun res!218529 () Bool)

(assert (=> b!383613 (=> res!218529 e!232944)))

(declare-fun lt!180223 () Bool)

(assert (=> b!383613 (= res!218529 (or (and (not lt!180223) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180223) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180223)))))

(assert (=> b!383613 (= lt!180223 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13563)

(declare-fun minValue!472 () V!13563)

(declare-fun getCurrentListMap!2010 (array!22577 array!22575 (_ BitVec 32) (_ BitVec 32) V!13563 V!13563 (_ BitVec 32) Int) ListLongMap!5229)

(assert (=> b!383613 (= lt!180229 (getCurrentListMap!2010 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180231 () array!22575)

(assert (=> b!383613 (= lt!180227 (getCurrentListMap!2010 lt!180221 lt!180231 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180226 () ListLongMap!5229)

(assert (=> b!383613 (and (= lt!180224 lt!180226) (= lt!180226 lt!180224))))

(declare-fun lt!180222 () ListLongMap!5229)

(assert (=> b!383613 (= lt!180226 (+!987 lt!180222 lt!180228))))

(declare-fun v!373 () V!13563)

(assert (=> b!383613 (= lt!180228 (tuple2!6327 k0!778 v!373))))

(declare-datatypes ((Unit!11826 0))(
  ( (Unit!11827) )
))
(declare-fun lt!180225 () Unit!11826)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!203 (array!22577 array!22575 (_ BitVec 32) (_ BitVec 32) V!13563 V!13563 (_ BitVec 32) (_ BitVec 64) V!13563 (_ BitVec 32) Int) Unit!11826)

(assert (=> b!383613 (= lt!180225 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!203 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!875 (array!22577 array!22575 (_ BitVec 32) (_ BitVec 32) V!13563 V!13563 (_ BitVec 32) Int) ListLongMap!5229)

(assert (=> b!383613 (= lt!180224 (getCurrentListMapNoExtraKeys!875 lt!180221 lt!180231 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383613 (= lt!180231 (array!22576 (store (arr!10756 _values!506) i!548 (ValueCellFull!4328 v!373)) (size!11109 _values!506)))))

(assert (=> b!383613 (= lt!180222 (getCurrentListMapNoExtraKeys!875 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383614 () Bool)

(assert (=> b!383614 (= e!232943 (and e!232948 mapRes!15579))))

(declare-fun condMapEmpty!15579 () Bool)

(declare-fun mapDefault!15579 () ValueCell!4328)

(assert (=> b!383614 (= condMapEmpty!15579 (= (arr!10756 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4328)) mapDefault!15579)))))

(assert (= (and start!37554 res!218527) b!383608))

(assert (= (and b!383608 res!218522) b!383607))

(assert (= (and b!383607 res!218524) b!383604))

(assert (= (and b!383604 res!218526) b!383610))

(assert (= (and b!383610 res!218525) b!383603))

(assert (= (and b!383603 res!218528) b!383612))

(assert (= (and b!383612 res!218521) b!383602))

(assert (= (and b!383602 res!218531) b!383606))

(assert (= (and b!383606 res!218523) b!383601))

(assert (= (and b!383601 res!218530) b!383613))

(assert (= (and b!383613 (not res!218529)) b!383605))

(assert (= (and b!383614 condMapEmpty!15579) mapIsEmpty!15579))

(assert (= (and b!383614 (not condMapEmpty!15579)) mapNonEmpty!15579))

(get-info :version)

(assert (= (and mapNonEmpty!15579 ((_ is ValueCellFull!4328) mapValue!15579)) b!383611))

(assert (= (and b!383614 ((_ is ValueCellFull!4328) mapDefault!15579)) b!383609))

(assert (= start!37554 b!383614))

(declare-fun m!379871 () Bool)

(assert (=> b!383606 m!379871))

(declare-fun m!379873 () Bool)

(assert (=> b!383606 m!379873))

(declare-fun m!379875 () Bool)

(assert (=> b!383607 m!379875))

(declare-fun m!379877 () Bool)

(assert (=> b!383603 m!379877))

(declare-fun m!379879 () Bool)

(assert (=> b!383613 m!379879))

(declare-fun m!379881 () Bool)

(assert (=> b!383613 m!379881))

(declare-fun m!379883 () Bool)

(assert (=> b!383613 m!379883))

(declare-fun m!379885 () Bool)

(assert (=> b!383613 m!379885))

(declare-fun m!379887 () Bool)

(assert (=> b!383613 m!379887))

(declare-fun m!379889 () Bool)

(assert (=> b!383613 m!379889))

(declare-fun m!379891 () Bool)

(assert (=> b!383613 m!379891))

(declare-fun m!379893 () Bool)

(assert (=> b!383604 m!379893))

(declare-fun m!379895 () Bool)

(assert (=> mapNonEmpty!15579 m!379895))

(declare-fun m!379897 () Bool)

(assert (=> b!383602 m!379897))

(declare-fun m!379899 () Bool)

(assert (=> b!383612 m!379899))

(declare-fun m!379901 () Bool)

(assert (=> b!383605 m!379901))

(declare-fun m!379903 () Bool)

(assert (=> b!383601 m!379903))

(declare-fun m!379905 () Bool)

(assert (=> start!37554 m!379905))

(declare-fun m!379907 () Bool)

(assert (=> start!37554 m!379907))

(declare-fun m!379909 () Bool)

(assert (=> start!37554 m!379909))

(check-sat (not b!383607) (not b_next!8695) (not b!383602) (not b!383601) b_and!15911 (not b!383604) (not mapNonEmpty!15579) (not b!383605) (not b!383603) (not b!383613) (not start!37554) (not b!383606) tp_is_empty!9343)
(check-sat b_and!15911 (not b_next!8695))
