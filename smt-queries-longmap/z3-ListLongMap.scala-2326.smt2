; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37404 () Bool)

(assert start!37404)

(declare-fun b_free!8545 () Bool)

(declare-fun b_next!8545 () Bool)

(assert (=> start!37404 (= b_free!8545 (not b_next!8545))))

(declare-fun tp!30350 () Bool)

(declare-fun b_and!15801 () Bool)

(assert (=> start!37404 (= tp!30350 b_and!15801)))

(declare-fun b!380666 () Bool)

(declare-fun e!231506 () Bool)

(declare-fun e!231510 () Bool)

(assert (=> b!380666 (= e!231506 (not e!231510))))

(declare-fun res!216176 () Bool)

(assert (=> b!380666 (=> res!216176 e!231510)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380666 (= res!216176 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13363 0))(
  ( (V!13364 (val!4641 Int)) )
))
(declare-datatypes ((ValueCell!4253 0))(
  ( (ValueCellFull!4253 (v!6839 V!13363)) (EmptyCell!4253) )
))
(declare-datatypes ((array!22288 0))(
  ( (array!22289 (arr!10612 (Array (_ BitVec 32) ValueCell!4253)) (size!10964 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22288)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6102 0))(
  ( (tuple2!6103 (_1!3062 (_ BitVec 64)) (_2!3062 V!13363)) )
))
(declare-datatypes ((List!5940 0))(
  ( (Nil!5937) (Cons!5936 (h!6792 tuple2!6102) (t!11082 List!5940)) )
))
(declare-datatypes ((ListLongMap!5017 0))(
  ( (ListLongMap!5018 (toList!2524 List!5940)) )
))
(declare-fun lt!178312 () ListLongMap!5017)

(declare-fun zeroValue!472 () V!13363)

(declare-datatypes ((array!22290 0))(
  ( (array!22291 (arr!10613 (Array (_ BitVec 32) (_ BitVec 64))) (size!10965 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22290)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13363)

(declare-fun getCurrentListMap!1963 (array!22290 array!22288 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) Int) ListLongMap!5017)

(assert (=> b!380666 (= lt!178312 (getCurrentListMap!1963 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178310 () array!22288)

(declare-fun lt!178318 () array!22290)

(declare-fun lt!178314 () ListLongMap!5017)

(assert (=> b!380666 (= lt!178314 (getCurrentListMap!1963 lt!178318 lt!178310 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178309 () ListLongMap!5017)

(declare-fun lt!178321 () ListLongMap!5017)

(assert (=> b!380666 (and (= lt!178309 lt!178321) (= lt!178321 lt!178309))))

(declare-fun lt!178320 () ListLongMap!5017)

(declare-fun lt!178313 () tuple2!6102)

(declare-fun +!920 (ListLongMap!5017 tuple2!6102) ListLongMap!5017)

(assert (=> b!380666 (= lt!178321 (+!920 lt!178320 lt!178313))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13363)

(assert (=> b!380666 (= lt!178313 (tuple2!6103 k0!778 v!373))))

(declare-datatypes ((Unit!11721 0))(
  ( (Unit!11722) )
))
(declare-fun lt!178319 () Unit!11721)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!150 (array!22290 array!22288 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) (_ BitVec 64) V!13363 (_ BitVec 32) Int) Unit!11721)

(assert (=> b!380666 (= lt!178319 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!150 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!810 (array!22290 array!22288 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) Int) ListLongMap!5017)

(assert (=> b!380666 (= lt!178309 (getCurrentListMapNoExtraKeys!810 lt!178318 lt!178310 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380666 (= lt!178310 (array!22289 (store (arr!10612 _values!506) i!548 (ValueCellFull!4253 v!373)) (size!10964 _values!506)))))

(assert (=> b!380666 (= lt!178320 (getCurrentListMapNoExtraKeys!810 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380667 () Bool)

(declare-fun e!231503 () Bool)

(declare-fun e!231509 () Bool)

(declare-fun mapRes!15354 () Bool)

(assert (=> b!380667 (= e!231503 (and e!231509 mapRes!15354))))

(declare-fun condMapEmpty!15354 () Bool)

(declare-fun mapDefault!15354 () ValueCell!4253)

(assert (=> b!380667 (= condMapEmpty!15354 (= (arr!10612 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4253)) mapDefault!15354)))))

(declare-fun mapNonEmpty!15354 () Bool)

(declare-fun tp!30351 () Bool)

(declare-fun e!231508 () Bool)

(assert (=> mapNonEmpty!15354 (= mapRes!15354 (and tp!30351 e!231508))))

(declare-fun mapKey!15354 () (_ BitVec 32))

(declare-fun mapValue!15354 () ValueCell!4253)

(declare-fun mapRest!15354 () (Array (_ BitVec 32) ValueCell!4253))

(assert (=> mapNonEmpty!15354 (= (arr!10612 _values!506) (store mapRest!15354 mapKey!15354 mapValue!15354))))

(declare-fun b!380668 () Bool)

(declare-fun tp_is_empty!9193 () Bool)

(assert (=> b!380668 (= e!231509 tp_is_empty!9193)))

(declare-fun b!380669 () Bool)

(declare-fun e!231504 () Bool)

(assert (=> b!380669 (= e!231504 (bvsle #b00000000000000000000000000000000 (size!10965 _keys!658)))))

(declare-fun lt!178317 () ListLongMap!5017)

(declare-fun lt!178316 () ListLongMap!5017)

(assert (=> b!380669 (= lt!178317 (+!920 lt!178316 lt!178313))))

(declare-fun lt!178315 () Unit!11721)

(declare-fun addCommutativeForDiffKeys!330 (ListLongMap!5017 (_ BitVec 64) V!13363 (_ BitVec 64) V!13363) Unit!11721)

(assert (=> b!380669 (= lt!178315 (addCommutativeForDiffKeys!330 lt!178320 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380670 () Bool)

(declare-fun res!216171 () Bool)

(declare-fun e!231505 () Bool)

(assert (=> b!380670 (=> (not res!216171) (not e!231505))))

(assert (=> b!380670 (= res!216171 (and (= (size!10964 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10965 _keys!658) (size!10964 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380671 () Bool)

(assert (=> b!380671 (= e!231505 e!231506)))

(declare-fun res!216175 () Bool)

(assert (=> b!380671 (=> (not res!216175) (not e!231506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22290 (_ BitVec 32)) Bool)

(assert (=> b!380671 (= res!216175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178318 mask!970))))

(assert (=> b!380671 (= lt!178318 (array!22291 (store (arr!10613 _keys!658) i!548 k0!778) (size!10965 _keys!658)))))

(declare-fun mapIsEmpty!15354 () Bool)

(assert (=> mapIsEmpty!15354 mapRes!15354))

(declare-fun res!216173 () Bool)

(assert (=> start!37404 (=> (not res!216173) (not e!231505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37404 (= res!216173 (validMask!0 mask!970))))

(assert (=> start!37404 e!231505))

(declare-fun array_inv!7858 (array!22288) Bool)

(assert (=> start!37404 (and (array_inv!7858 _values!506) e!231503)))

(assert (=> start!37404 tp!30350))

(assert (=> start!37404 true))

(assert (=> start!37404 tp_is_empty!9193))

(declare-fun array_inv!7859 (array!22290) Bool)

(assert (=> start!37404 (array_inv!7859 _keys!658)))

(declare-fun b!380672 () Bool)

(declare-fun res!216166 () Bool)

(assert (=> b!380672 (=> (not res!216166) (not e!231505))))

(assert (=> b!380672 (= res!216166 (or (= (select (arr!10613 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10613 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380673 () Bool)

(declare-fun res!216167 () Bool)

(assert (=> b!380673 (=> (not res!216167) (not e!231505))))

(declare-fun arrayContainsKey!0 (array!22290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380673 (= res!216167 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380674 () Bool)

(declare-fun res!216174 () Bool)

(assert (=> b!380674 (=> (not res!216174) (not e!231505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380674 (= res!216174 (validKeyInArray!0 k0!778))))

(declare-fun b!380675 () Bool)

(declare-fun res!216168 () Bool)

(assert (=> b!380675 (=> (not res!216168) (not e!231505))))

(declare-datatypes ((List!5941 0))(
  ( (Nil!5938) (Cons!5937 (h!6793 (_ BitVec 64)) (t!11083 List!5941)) )
))
(declare-fun arrayNoDuplicates!0 (array!22290 (_ BitVec 32) List!5941) Bool)

(assert (=> b!380675 (= res!216168 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5938))))

(declare-fun b!380676 () Bool)

(assert (=> b!380676 (= e!231508 tp_is_empty!9193)))

(declare-fun b!380677 () Bool)

(declare-fun res!216169 () Bool)

(assert (=> b!380677 (=> (not res!216169) (not e!231505))))

(assert (=> b!380677 (= res!216169 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10965 _keys!658))))))

(declare-fun b!380678 () Bool)

(assert (=> b!380678 (= e!231510 e!231504)))

(declare-fun res!216170 () Bool)

(assert (=> b!380678 (=> res!216170 e!231504)))

(assert (=> b!380678 (= res!216170 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380678 (= lt!178312 lt!178316)))

(declare-fun lt!178311 () tuple2!6102)

(assert (=> b!380678 (= lt!178316 (+!920 lt!178320 lt!178311))))

(assert (=> b!380678 (= lt!178314 lt!178317)))

(assert (=> b!380678 (= lt!178317 (+!920 lt!178321 lt!178311))))

(assert (=> b!380678 (= lt!178314 (+!920 lt!178309 lt!178311))))

(assert (=> b!380678 (= lt!178311 (tuple2!6103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380679 () Bool)

(declare-fun res!216172 () Bool)

(assert (=> b!380679 (=> (not res!216172) (not e!231505))))

(assert (=> b!380679 (= res!216172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380680 () Bool)

(declare-fun res!216165 () Bool)

(assert (=> b!380680 (=> (not res!216165) (not e!231506))))

(assert (=> b!380680 (= res!216165 (arrayNoDuplicates!0 lt!178318 #b00000000000000000000000000000000 Nil!5938))))

(assert (= (and start!37404 res!216173) b!380670))

(assert (= (and b!380670 res!216171) b!380679))

(assert (= (and b!380679 res!216172) b!380675))

(assert (= (and b!380675 res!216168) b!380677))

(assert (= (and b!380677 res!216169) b!380674))

(assert (= (and b!380674 res!216174) b!380672))

(assert (= (and b!380672 res!216166) b!380673))

(assert (= (and b!380673 res!216167) b!380671))

(assert (= (and b!380671 res!216175) b!380680))

(assert (= (and b!380680 res!216165) b!380666))

(assert (= (and b!380666 (not res!216176)) b!380678))

(assert (= (and b!380678 (not res!216170)) b!380669))

(assert (= (and b!380667 condMapEmpty!15354) mapIsEmpty!15354))

(assert (= (and b!380667 (not condMapEmpty!15354)) mapNonEmpty!15354))

(get-info :version)

(assert (= (and mapNonEmpty!15354 ((_ is ValueCellFull!4253) mapValue!15354)) b!380676))

(assert (= (and b!380667 ((_ is ValueCellFull!4253) mapDefault!15354)) b!380668))

(assert (= start!37404 b!380667))

(declare-fun m!377909 () Bool)

(assert (=> b!380680 m!377909))

(declare-fun m!377911 () Bool)

(assert (=> b!380674 m!377911))

(declare-fun m!377913 () Bool)

(assert (=> b!380672 m!377913))

(declare-fun m!377915 () Bool)

(assert (=> b!380673 m!377915))

(declare-fun m!377917 () Bool)

(assert (=> b!380679 m!377917))

(declare-fun m!377919 () Bool)

(assert (=> b!380675 m!377919))

(declare-fun m!377921 () Bool)

(assert (=> start!37404 m!377921))

(declare-fun m!377923 () Bool)

(assert (=> start!37404 m!377923))

(declare-fun m!377925 () Bool)

(assert (=> start!37404 m!377925))

(declare-fun m!377927 () Bool)

(assert (=> b!380669 m!377927))

(declare-fun m!377929 () Bool)

(assert (=> b!380669 m!377929))

(declare-fun m!377931 () Bool)

(assert (=> mapNonEmpty!15354 m!377931))

(declare-fun m!377933 () Bool)

(assert (=> b!380666 m!377933))

(declare-fun m!377935 () Bool)

(assert (=> b!380666 m!377935))

(declare-fun m!377937 () Bool)

(assert (=> b!380666 m!377937))

(declare-fun m!377939 () Bool)

(assert (=> b!380666 m!377939))

(declare-fun m!377941 () Bool)

(assert (=> b!380666 m!377941))

(declare-fun m!377943 () Bool)

(assert (=> b!380666 m!377943))

(declare-fun m!377945 () Bool)

(assert (=> b!380666 m!377945))

(declare-fun m!377947 () Bool)

(assert (=> b!380678 m!377947))

(declare-fun m!377949 () Bool)

(assert (=> b!380678 m!377949))

(declare-fun m!377951 () Bool)

(assert (=> b!380678 m!377951))

(declare-fun m!377953 () Bool)

(assert (=> b!380671 m!377953))

(declare-fun m!377955 () Bool)

(assert (=> b!380671 m!377955))

(check-sat b_and!15801 (not b!380675) (not b_next!8545) (not b!380671) (not b!380680) (not mapNonEmpty!15354) (not b!380669) (not start!37404) (not b!380666) (not b!380674) (not b!380673) (not b!380678) tp_is_empty!9193 (not b!380679))
(check-sat b_and!15801 (not b_next!8545))
