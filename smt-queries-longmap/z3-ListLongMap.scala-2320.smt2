; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37368 () Bool)

(assert start!37368)

(declare-fun b_free!8509 () Bool)

(declare-fun b_next!8509 () Bool)

(assert (=> start!37368 (= b_free!8509 (not b_next!8509))))

(declare-fun tp!30243 () Bool)

(declare-fun b_and!15725 () Bool)

(assert (=> start!37368 (= tp!30243 b_and!15725)))

(declare-fun b!379634 () Bool)

(declare-fun res!215392 () Bool)

(declare-fun e!230933 () Bool)

(assert (=> b!379634 (=> (not res!215392) (not e!230933))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379634 (= res!215392 (validKeyInArray!0 k0!778))))

(declare-fun b!379636 () Bool)

(declare-fun e!230930 () Bool)

(declare-fun tp_is_empty!9157 () Bool)

(assert (=> b!379636 (= e!230930 tp_is_empty!9157)))

(declare-fun b!379637 () Bool)

(declare-fun res!215402 () Bool)

(assert (=> b!379637 (=> (not res!215402) (not e!230933))))

(declare-datatypes ((array!22217 0))(
  ( (array!22218 (arr!10577 (Array (_ BitVec 32) (_ BitVec 64))) (size!10930 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22217)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379637 (= res!215402 (or (= (select (arr!10577 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10577 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379638 () Bool)

(declare-fun e!230936 () Bool)

(assert (=> b!379638 (= e!230936 true)))

(declare-datatypes ((V!13315 0))(
  ( (V!13316 (val!4623 Int)) )
))
(declare-datatypes ((tuple2!6166 0))(
  ( (tuple2!6167 (_1!3094 (_ BitVec 64)) (_2!3094 V!13315)) )
))
(declare-datatypes ((List!5995 0))(
  ( (Nil!5992) (Cons!5991 (h!6847 tuple2!6166) (t!11136 List!5995)) )
))
(declare-datatypes ((ListLongMap!5069 0))(
  ( (ListLongMap!5070 (toList!2550 List!5995)) )
))
(declare-fun lt!177357 () ListLongMap!5069)

(declare-fun lt!177360 () ListLongMap!5069)

(declare-fun lt!177354 () tuple2!6166)

(declare-fun +!918 (ListLongMap!5069 tuple2!6166) ListLongMap!5069)

(assert (=> b!379638 (= lt!177357 (+!918 lt!177360 lt!177354))))

(declare-datatypes ((Unit!11696 0))(
  ( (Unit!11697) )
))
(declare-fun lt!177356 () Unit!11696)

(declare-fun v!373 () V!13315)

(declare-fun lt!177362 () ListLongMap!5069)

(declare-fun minValue!472 () V!13315)

(declare-fun addCommutativeForDiffKeys!311 (ListLongMap!5069 (_ BitVec 64) V!13315 (_ BitVec 64) V!13315) Unit!11696)

(assert (=> b!379638 (= lt!177356 (addCommutativeForDiffKeys!311 lt!177362 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379639 () Bool)

(declare-fun res!215391 () Bool)

(declare-fun e!230932 () Bool)

(assert (=> b!379639 (=> (not res!215391) (not e!230932))))

(declare-fun lt!177358 () array!22217)

(declare-datatypes ((List!5996 0))(
  ( (Nil!5993) (Cons!5992 (h!6848 (_ BitVec 64)) (t!11137 List!5996)) )
))
(declare-fun arrayNoDuplicates!0 (array!22217 (_ BitVec 32) List!5996) Bool)

(assert (=> b!379639 (= res!215391 (arrayNoDuplicates!0 lt!177358 #b00000000000000000000000000000000 Nil!5993))))

(declare-fun b!379640 () Bool)

(declare-fun res!215401 () Bool)

(assert (=> b!379640 (=> (not res!215401) (not e!230933))))

(declare-fun arrayContainsKey!0 (array!22217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379640 (= res!215401 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379641 () Bool)

(declare-fun res!215396 () Bool)

(assert (=> b!379641 (=> (not res!215396) (not e!230933))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22217 (_ BitVec 32)) Bool)

(assert (=> b!379641 (= res!215396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379642 () Bool)

(declare-fun res!215397 () Bool)

(assert (=> b!379642 (=> (not res!215397) (not e!230933))))

(assert (=> b!379642 (= res!215397 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10930 _keys!658))))))

(declare-fun b!379643 () Bool)

(declare-fun e!230929 () Bool)

(assert (=> b!379643 (= e!230929 e!230936)))

(declare-fun res!215399 () Bool)

(assert (=> b!379643 (=> res!215399 e!230936)))

(assert (=> b!379643 (= res!215399 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177361 () ListLongMap!5069)

(assert (=> b!379643 (= lt!177361 lt!177360)))

(declare-fun lt!177363 () tuple2!6166)

(assert (=> b!379643 (= lt!177360 (+!918 lt!177362 lt!177363))))

(declare-fun lt!177364 () ListLongMap!5069)

(assert (=> b!379643 (= lt!177364 lt!177357)))

(declare-fun lt!177366 () ListLongMap!5069)

(assert (=> b!379643 (= lt!177357 (+!918 lt!177366 lt!177363))))

(declare-fun lt!177359 () ListLongMap!5069)

(assert (=> b!379643 (= lt!177364 (+!918 lt!177359 lt!177363))))

(assert (=> b!379643 (= lt!177363 (tuple2!6167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379644 () Bool)

(declare-fun e!230931 () Bool)

(assert (=> b!379644 (= e!230931 tp_is_empty!9157)))

(declare-fun b!379645 () Bool)

(declare-fun e!230935 () Bool)

(declare-fun mapRes!15300 () Bool)

(assert (=> b!379645 (= e!230935 (and e!230931 mapRes!15300))))

(declare-fun condMapEmpty!15300 () Bool)

(declare-datatypes ((ValueCell!4235 0))(
  ( (ValueCellFull!4235 (v!6814 V!13315)) (EmptyCell!4235) )
))
(declare-datatypes ((array!22219 0))(
  ( (array!22220 (arr!10578 (Array (_ BitVec 32) ValueCell!4235)) (size!10931 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22219)

(declare-fun mapDefault!15300 () ValueCell!4235)

(assert (=> b!379645 (= condMapEmpty!15300 (= (arr!10578 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4235)) mapDefault!15300)))))

(declare-fun mapIsEmpty!15300 () Bool)

(assert (=> mapIsEmpty!15300 mapRes!15300))

(declare-fun b!379635 () Bool)

(declare-fun res!215394 () Bool)

(assert (=> b!379635 (=> (not res!215394) (not e!230933))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379635 (= res!215394 (and (= (size!10931 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10930 _keys!658) (size!10931 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!215400 () Bool)

(assert (=> start!37368 (=> (not res!215400) (not e!230933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37368 (= res!215400 (validMask!0 mask!970))))

(assert (=> start!37368 e!230933))

(declare-fun array_inv!7790 (array!22219) Bool)

(assert (=> start!37368 (and (array_inv!7790 _values!506) e!230935)))

(assert (=> start!37368 tp!30243))

(assert (=> start!37368 true))

(assert (=> start!37368 tp_is_empty!9157))

(declare-fun array_inv!7791 (array!22217) Bool)

(assert (=> start!37368 (array_inv!7791 _keys!658)))

(declare-fun b!379646 () Bool)

(declare-fun res!215393 () Bool)

(assert (=> b!379646 (=> (not res!215393) (not e!230933))))

(assert (=> b!379646 (= res!215393 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5993))))

(declare-fun b!379647 () Bool)

(assert (=> b!379647 (= e!230932 (not e!230929))))

(declare-fun res!215398 () Bool)

(assert (=> b!379647 (=> res!215398 e!230929)))

(assert (=> b!379647 (= res!215398 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13315)

(declare-fun getCurrentListMap!1947 (array!22217 array!22219 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) Int) ListLongMap!5069)

(assert (=> b!379647 (= lt!177361 (getCurrentListMap!1947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177365 () array!22219)

(assert (=> b!379647 (= lt!177364 (getCurrentListMap!1947 lt!177358 lt!177365 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379647 (and (= lt!177359 lt!177366) (= lt!177366 lt!177359))))

(assert (=> b!379647 (= lt!177366 (+!918 lt!177362 lt!177354))))

(assert (=> b!379647 (= lt!177354 (tuple2!6167 k0!778 v!373))))

(declare-fun lt!177355 () Unit!11696)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!140 (array!22217 array!22219 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) (_ BitVec 64) V!13315 (_ BitVec 32) Int) Unit!11696)

(assert (=> b!379647 (= lt!177355 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!140 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!812 (array!22217 array!22219 (_ BitVec 32) (_ BitVec 32) V!13315 V!13315 (_ BitVec 32) Int) ListLongMap!5069)

(assert (=> b!379647 (= lt!177359 (getCurrentListMapNoExtraKeys!812 lt!177358 lt!177365 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379647 (= lt!177365 (array!22220 (store (arr!10578 _values!506) i!548 (ValueCellFull!4235 v!373)) (size!10931 _values!506)))))

(assert (=> b!379647 (= lt!177362 (getCurrentListMapNoExtraKeys!812 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379648 () Bool)

(assert (=> b!379648 (= e!230933 e!230932)))

(declare-fun res!215395 () Bool)

(assert (=> b!379648 (=> (not res!215395) (not e!230932))))

(assert (=> b!379648 (= res!215395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177358 mask!970))))

(assert (=> b!379648 (= lt!177358 (array!22218 (store (arr!10577 _keys!658) i!548 k0!778) (size!10930 _keys!658)))))

(declare-fun mapNonEmpty!15300 () Bool)

(declare-fun tp!30242 () Bool)

(assert (=> mapNonEmpty!15300 (= mapRes!15300 (and tp!30242 e!230930))))

(declare-fun mapValue!15300 () ValueCell!4235)

(declare-fun mapRest!15300 () (Array (_ BitVec 32) ValueCell!4235))

(declare-fun mapKey!15300 () (_ BitVec 32))

(assert (=> mapNonEmpty!15300 (= (arr!10578 _values!506) (store mapRest!15300 mapKey!15300 mapValue!15300))))

(assert (= (and start!37368 res!215400) b!379635))

(assert (= (and b!379635 res!215394) b!379641))

(assert (= (and b!379641 res!215396) b!379646))

(assert (= (and b!379646 res!215393) b!379642))

(assert (= (and b!379642 res!215397) b!379634))

(assert (= (and b!379634 res!215392) b!379637))

(assert (= (and b!379637 res!215402) b!379640))

(assert (= (and b!379640 res!215401) b!379648))

(assert (= (and b!379648 res!215395) b!379639))

(assert (= (and b!379639 res!215391) b!379647))

(assert (= (and b!379647 (not res!215398)) b!379643))

(assert (= (and b!379643 (not res!215399)) b!379638))

(assert (= (and b!379645 condMapEmpty!15300) mapIsEmpty!15300))

(assert (= (and b!379645 (not condMapEmpty!15300)) mapNonEmpty!15300))

(get-info :version)

(assert (= (and mapNonEmpty!15300 ((_ is ValueCellFull!4235) mapValue!15300)) b!379636))

(assert (= (and b!379645 ((_ is ValueCellFull!4235) mapDefault!15300)) b!379644))

(assert (= start!37368 b!379645))

(declare-fun m!376091 () Bool)

(assert (=> b!379638 m!376091))

(declare-fun m!376093 () Bool)

(assert (=> b!379638 m!376093))

(declare-fun m!376095 () Bool)

(assert (=> b!379634 m!376095))

(declare-fun m!376097 () Bool)

(assert (=> b!379639 m!376097))

(declare-fun m!376099 () Bool)

(assert (=> mapNonEmpty!15300 m!376099))

(declare-fun m!376101 () Bool)

(assert (=> b!379640 m!376101))

(declare-fun m!376103 () Bool)

(assert (=> b!379641 m!376103))

(declare-fun m!376105 () Bool)

(assert (=> start!37368 m!376105))

(declare-fun m!376107 () Bool)

(assert (=> start!37368 m!376107))

(declare-fun m!376109 () Bool)

(assert (=> start!37368 m!376109))

(declare-fun m!376111 () Bool)

(assert (=> b!379648 m!376111))

(declare-fun m!376113 () Bool)

(assert (=> b!379648 m!376113))

(declare-fun m!376115 () Bool)

(assert (=> b!379637 m!376115))

(declare-fun m!376117 () Bool)

(assert (=> b!379647 m!376117))

(declare-fun m!376119 () Bool)

(assert (=> b!379647 m!376119))

(declare-fun m!376121 () Bool)

(assert (=> b!379647 m!376121))

(declare-fun m!376123 () Bool)

(assert (=> b!379647 m!376123))

(declare-fun m!376125 () Bool)

(assert (=> b!379647 m!376125))

(declare-fun m!376127 () Bool)

(assert (=> b!379647 m!376127))

(declare-fun m!376129 () Bool)

(assert (=> b!379647 m!376129))

(declare-fun m!376131 () Bool)

(assert (=> b!379643 m!376131))

(declare-fun m!376133 () Bool)

(assert (=> b!379643 m!376133))

(declare-fun m!376135 () Bool)

(assert (=> b!379643 m!376135))

(declare-fun m!376137 () Bool)

(assert (=> b!379646 m!376137))

(check-sat (not b!379640) (not b!379643) (not mapNonEmpty!15300) tp_is_empty!9157 b_and!15725 (not b!379646) (not b!379648) (not b!379638) (not b!379634) (not b_next!8509) (not b!379647) (not start!37368) (not b!379639) (not b!379641))
(check-sat b_and!15725 (not b_next!8509))
