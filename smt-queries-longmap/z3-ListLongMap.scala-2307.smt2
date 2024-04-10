; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37306 () Bool)

(assert start!37306)

(declare-fun b_free!8433 () Bool)

(declare-fun b_next!8433 () Bool)

(assert (=> start!37306 (= b_free!8433 (not b_next!8433))))

(declare-fun tp!30014 () Bool)

(declare-fun b_and!15675 () Bool)

(assert (=> start!37306 (= tp!30014 b_and!15675)))

(declare-fun b!378186 () Bool)

(declare-fun e!230193 () Bool)

(declare-fun e!230192 () Bool)

(assert (=> b!378186 (= e!230193 e!230192)))

(declare-fun res!214149 () Bool)

(assert (=> b!378186 (=> res!214149 e!230192)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!378186 (= res!214149 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13213 0))(
  ( (V!13214 (val!4585 Int)) )
))
(declare-datatypes ((tuple2!6122 0))(
  ( (tuple2!6123 (_1!3072 (_ BitVec 64)) (_2!3072 V!13213)) )
))
(declare-datatypes ((List!5960 0))(
  ( (Nil!5957) (Cons!5956 (h!6812 tuple2!6122) (t!11110 List!5960)) )
))
(declare-datatypes ((ListLongMap!5035 0))(
  ( (ListLongMap!5036 (toList!2533 List!5960)) )
))
(declare-fun lt!176153 () ListLongMap!5035)

(declare-fun lt!176152 () ListLongMap!5035)

(assert (=> b!378186 (= lt!176153 lt!176152)))

(declare-fun lt!176150 () ListLongMap!5035)

(declare-fun lt!176145 () tuple2!6122)

(declare-fun +!879 (ListLongMap!5035 tuple2!6122) ListLongMap!5035)

(assert (=> b!378186 (= lt!176152 (+!879 lt!176150 lt!176145))))

(declare-fun lt!176143 () ListLongMap!5035)

(declare-fun lt!176148 () ListLongMap!5035)

(assert (=> b!378186 (= lt!176143 lt!176148)))

(declare-fun lt!176142 () ListLongMap!5035)

(assert (=> b!378186 (= lt!176148 (+!879 lt!176142 lt!176145))))

(declare-fun lt!176146 () ListLongMap!5035)

(assert (=> b!378186 (= lt!176153 (+!879 lt!176146 lt!176145))))

(declare-fun zeroValue!472 () V!13213)

(assert (=> b!378186 (= lt!176145 (tuple2!6123 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!378187 () Bool)

(declare-fun res!214143 () Bool)

(declare-fun e!230191 () Bool)

(assert (=> b!378187 (=> (not res!214143) (not e!230191))))

(declare-datatypes ((array!22089 0))(
  ( (array!22090 (arr!10513 (Array (_ BitVec 32) (_ BitVec 64))) (size!10865 (_ BitVec 32))) )
))
(declare-fun lt!176154 () array!22089)

(declare-datatypes ((List!5961 0))(
  ( (Nil!5958) (Cons!5957 (h!6813 (_ BitVec 64)) (t!11111 List!5961)) )
))
(declare-fun arrayNoDuplicates!0 (array!22089 (_ BitVec 32) List!5961) Bool)

(assert (=> b!378187 (= res!214143 (arrayNoDuplicates!0 lt!176154 #b00000000000000000000000000000000 Nil!5958))))

(declare-fun b!378188 () Bool)

(declare-fun res!214148 () Bool)

(declare-fun e!230197 () Bool)

(assert (=> b!378188 (=> (not res!214148) (not e!230197))))

(declare-fun _keys!658 () array!22089)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378188 (= res!214148 (or (= (select (arr!10513 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10513 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378189 () Bool)

(declare-fun res!214144 () Bool)

(assert (=> b!378189 (=> (not res!214144) (not e!230197))))

(assert (=> b!378189 (= res!214144 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5958))))

(declare-fun b!378190 () Bool)

(declare-fun res!214146 () Bool)

(assert (=> b!378190 (=> (not res!214146) (not e!230197))))

(declare-fun arrayContainsKey!0 (array!22089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378190 (= res!214146 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378191 () Bool)

(declare-fun res!214151 () Bool)

(assert (=> b!378191 (=> (not res!214151) (not e!230197))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4197 0))(
  ( (ValueCellFull!4197 (v!6782 V!13213)) (EmptyCell!4197) )
))
(declare-datatypes ((array!22091 0))(
  ( (array!22092 (arr!10514 (Array (_ BitVec 32) ValueCell!4197)) (size!10866 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22091)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!378191 (= res!214151 (and (= (size!10866 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10865 _keys!658) (size!10866 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378192 () Bool)

(declare-fun res!214154 () Bool)

(assert (=> b!378192 (=> (not res!214154) (not e!230197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378192 (= res!214154 (validKeyInArray!0 k0!778))))

(declare-fun b!378193 () Bool)

(assert (=> b!378193 (= e!230197 e!230191)))

(declare-fun res!214152 () Bool)

(assert (=> b!378193 (=> (not res!214152) (not e!230191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22089 (_ BitVec 32)) Bool)

(assert (=> b!378193 (= res!214152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176154 mask!970))))

(assert (=> b!378193 (= lt!176154 (array!22090 (store (arr!10513 _keys!658) i!548 k0!778) (size!10865 _keys!658)))))

(declare-fun res!214153 () Bool)

(assert (=> start!37306 (=> (not res!214153) (not e!230197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37306 (= res!214153 (validMask!0 mask!970))))

(assert (=> start!37306 e!230197))

(declare-fun e!230195 () Bool)

(declare-fun array_inv!7744 (array!22091) Bool)

(assert (=> start!37306 (and (array_inv!7744 _values!506) e!230195)))

(assert (=> start!37306 tp!30014))

(assert (=> start!37306 true))

(declare-fun tp_is_empty!9081 () Bool)

(assert (=> start!37306 tp_is_empty!9081))

(declare-fun array_inv!7745 (array!22089) Bool)

(assert (=> start!37306 (array_inv!7745 _keys!658)))

(declare-fun b!378194 () Bool)

(declare-fun res!214145 () Bool)

(assert (=> b!378194 (=> (not res!214145) (not e!230197))))

(assert (=> b!378194 (= res!214145 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10865 _keys!658))))))

(declare-fun b!378195 () Bool)

(declare-fun e!230194 () Bool)

(assert (=> b!378195 (= e!230194 tp_is_empty!9081)))

(declare-fun b!378196 () Bool)

(declare-fun res!214150 () Bool)

(assert (=> b!378196 (=> (not res!214150) (not e!230197))))

(assert (=> b!378196 (= res!214150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378197 () Bool)

(assert (=> b!378197 (= e!230191 (not e!230193))))

(declare-fun res!214147 () Bool)

(assert (=> b!378197 (=> res!214147 e!230193)))

(assert (=> b!378197 (= res!214147 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13213)

(declare-fun getCurrentListMap!1959 (array!22089 array!22091 (_ BitVec 32) (_ BitVec 32) V!13213 V!13213 (_ BitVec 32) Int) ListLongMap!5035)

(assert (=> b!378197 (= lt!176143 (getCurrentListMap!1959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176147 () array!22091)

(assert (=> b!378197 (= lt!176153 (getCurrentListMap!1959 lt!176154 lt!176147 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378197 (and (= lt!176146 lt!176150) (= lt!176150 lt!176146))))

(declare-fun lt!176151 () tuple2!6122)

(assert (=> b!378197 (= lt!176150 (+!879 lt!176142 lt!176151))))

(declare-fun v!373 () V!13213)

(assert (=> b!378197 (= lt!176151 (tuple2!6123 k0!778 v!373))))

(declare-datatypes ((Unit!11658 0))(
  ( (Unit!11659) )
))
(declare-fun lt!176144 () Unit!11658)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!117 (array!22089 array!22091 (_ BitVec 32) (_ BitVec 32) V!13213 V!13213 (_ BitVec 32) (_ BitVec 64) V!13213 (_ BitVec 32) Int) Unit!11658)

(assert (=> b!378197 (= lt!176144 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!117 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!793 (array!22089 array!22091 (_ BitVec 32) (_ BitVec 32) V!13213 V!13213 (_ BitVec 32) Int) ListLongMap!5035)

(assert (=> b!378197 (= lt!176146 (getCurrentListMapNoExtraKeys!793 lt!176154 lt!176147 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378197 (= lt!176147 (array!22092 (store (arr!10514 _values!506) i!548 (ValueCellFull!4197 v!373)) (size!10866 _values!506)))))

(assert (=> b!378197 (= lt!176142 (getCurrentListMapNoExtraKeys!793 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15186 () Bool)

(declare-fun mapRes!15186 () Bool)

(declare-fun tp!30015 () Bool)

(assert (=> mapNonEmpty!15186 (= mapRes!15186 (and tp!30015 e!230194))))

(declare-fun mapRest!15186 () (Array (_ BitVec 32) ValueCell!4197))

(declare-fun mapKey!15186 () (_ BitVec 32))

(declare-fun mapValue!15186 () ValueCell!4197)

(assert (=> mapNonEmpty!15186 (= (arr!10514 _values!506) (store mapRest!15186 mapKey!15186 mapValue!15186))))

(declare-fun mapIsEmpty!15186 () Bool)

(assert (=> mapIsEmpty!15186 mapRes!15186))

(declare-fun b!378198 () Bool)

(declare-fun e!230198 () Bool)

(assert (=> b!378198 (= e!230195 (and e!230198 mapRes!15186))))

(declare-fun condMapEmpty!15186 () Bool)

(declare-fun mapDefault!15186 () ValueCell!4197)

(assert (=> b!378198 (= condMapEmpty!15186 (= (arr!10514 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4197)) mapDefault!15186)))))

(declare-fun b!378199 () Bool)

(assert (=> b!378199 (= e!230198 tp_is_empty!9081)))

(declare-fun b!378200 () Bool)

(assert (=> b!378200 (= e!230192 (bvsle #b00000000000000000000000000000000 (size!10865 _keys!658)))))

(assert (=> b!378200 (= lt!176152 (+!879 lt!176148 lt!176151))))

(declare-fun lt!176149 () Unit!11658)

(declare-fun addCommutativeForDiffKeys!285 (ListLongMap!5035 (_ BitVec 64) V!13213 (_ BitVec 64) V!13213) Unit!11658)

(assert (=> b!378200 (= lt!176149 (addCommutativeForDiffKeys!285 lt!176142 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37306 res!214153) b!378191))

(assert (= (and b!378191 res!214151) b!378196))

(assert (= (and b!378196 res!214150) b!378189))

(assert (= (and b!378189 res!214144) b!378194))

(assert (= (and b!378194 res!214145) b!378192))

(assert (= (and b!378192 res!214154) b!378188))

(assert (= (and b!378188 res!214148) b!378190))

(assert (= (and b!378190 res!214146) b!378193))

(assert (= (and b!378193 res!214152) b!378187))

(assert (= (and b!378187 res!214143) b!378197))

(assert (= (and b!378197 (not res!214147)) b!378186))

(assert (= (and b!378186 (not res!214149)) b!378200))

(assert (= (and b!378198 condMapEmpty!15186) mapIsEmpty!15186))

(assert (= (and b!378198 (not condMapEmpty!15186)) mapNonEmpty!15186))

(get-info :version)

(assert (= (and mapNonEmpty!15186 ((_ is ValueCellFull!4197) mapValue!15186)) b!378195))

(assert (= (and b!378198 ((_ is ValueCellFull!4197) mapDefault!15186)) b!378199))

(assert (= start!37306 b!378198))

(declare-fun m!375003 () Bool)

(assert (=> b!378190 m!375003))

(declare-fun m!375005 () Bool)

(assert (=> b!378186 m!375005))

(declare-fun m!375007 () Bool)

(assert (=> b!378186 m!375007))

(declare-fun m!375009 () Bool)

(assert (=> b!378186 m!375009))

(declare-fun m!375011 () Bool)

(assert (=> b!378188 m!375011))

(declare-fun m!375013 () Bool)

(assert (=> b!378192 m!375013))

(declare-fun m!375015 () Bool)

(assert (=> b!378200 m!375015))

(declare-fun m!375017 () Bool)

(assert (=> b!378200 m!375017))

(declare-fun m!375019 () Bool)

(assert (=> mapNonEmpty!15186 m!375019))

(declare-fun m!375021 () Bool)

(assert (=> start!37306 m!375021))

(declare-fun m!375023 () Bool)

(assert (=> start!37306 m!375023))

(declare-fun m!375025 () Bool)

(assert (=> start!37306 m!375025))

(declare-fun m!375027 () Bool)

(assert (=> b!378193 m!375027))

(declare-fun m!375029 () Bool)

(assert (=> b!378193 m!375029))

(declare-fun m!375031 () Bool)

(assert (=> b!378187 m!375031))

(declare-fun m!375033 () Bool)

(assert (=> b!378197 m!375033))

(declare-fun m!375035 () Bool)

(assert (=> b!378197 m!375035))

(declare-fun m!375037 () Bool)

(assert (=> b!378197 m!375037))

(declare-fun m!375039 () Bool)

(assert (=> b!378197 m!375039))

(declare-fun m!375041 () Bool)

(assert (=> b!378197 m!375041))

(declare-fun m!375043 () Bool)

(assert (=> b!378197 m!375043))

(declare-fun m!375045 () Bool)

(assert (=> b!378197 m!375045))

(declare-fun m!375047 () Bool)

(assert (=> b!378189 m!375047))

(declare-fun m!375049 () Bool)

(assert (=> b!378196 m!375049))

(check-sat (not b!378186) (not b!378190) (not mapNonEmpty!15186) (not b!378193) (not b!378200) (not start!37306) b_and!15675 (not b!378197) (not b!378196) tp_is_empty!9081 (not b!378192) (not b!378189) (not b_next!8433) (not b!378187))
(check-sat b_and!15675 (not b_next!8433))
