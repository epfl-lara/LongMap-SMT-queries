; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37332 () Bool)

(assert start!37332)

(declare-fun b_free!8473 () Bool)

(declare-fun b_next!8473 () Bool)

(assert (=> start!37332 (= b_free!8473 (not b_next!8473))))

(declare-fun tp!30134 () Bool)

(declare-fun b_and!15689 () Bool)

(assert (=> start!37332 (= tp!30134 b_and!15689)))

(declare-fun b!378824 () Bool)

(declare-fun e!230502 () Bool)

(assert (=> b!378824 (= e!230502 true)))

(declare-datatypes ((V!13267 0))(
  ( (V!13268 (val!4605 Int)) )
))
(declare-datatypes ((tuple2!6132 0))(
  ( (tuple2!6133 (_1!3077 (_ BitVec 64)) (_2!3077 V!13267)) )
))
(declare-datatypes ((List!5961 0))(
  ( (Nil!5958) (Cons!5957 (h!6813 tuple2!6132) (t!11102 List!5961)) )
))
(declare-datatypes ((ListLongMap!5035 0))(
  ( (ListLongMap!5036 (toList!2533 List!5961)) )
))
(declare-fun lt!176662 () ListLongMap!5035)

(declare-fun lt!176661 () ListLongMap!5035)

(declare-fun lt!176654 () tuple2!6132)

(declare-fun +!901 (ListLongMap!5035 tuple2!6132) ListLongMap!5035)

(assert (=> b!378824 (= lt!176662 (+!901 lt!176661 lt!176654))))

(declare-fun v!373 () V!13267)

(declare-fun lt!176664 () ListLongMap!5035)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11666 0))(
  ( (Unit!11667) )
))
(declare-fun lt!176659 () Unit!11666)

(declare-fun minValue!472 () V!13267)

(declare-fun addCommutativeForDiffKeys!300 (ListLongMap!5035 (_ BitVec 64) V!13267 (_ BitVec 64) V!13267) Unit!11666)

(assert (=> b!378824 (= lt!176659 (addCommutativeForDiffKeys!300 lt!176664 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378825 () Bool)

(declare-fun res!214752 () Bool)

(declare-fun e!230498 () Bool)

(assert (=> b!378825 (=> (not res!214752) (not e!230498))))

(declare-datatypes ((array!22147 0))(
  ( (array!22148 (arr!10542 (Array (_ BitVec 32) (_ BitVec 64))) (size!10895 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22147)

(declare-datatypes ((List!5962 0))(
  ( (Nil!5959) (Cons!5958 (h!6814 (_ BitVec 64)) (t!11103 List!5962)) )
))
(declare-fun arrayNoDuplicates!0 (array!22147 (_ BitVec 32) List!5962) Bool)

(assert (=> b!378825 (= res!214752 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5959))))

(declare-fun b!378826 () Bool)

(declare-fun res!214750 () Bool)

(assert (=> b!378826 (=> (not res!214750) (not e!230498))))

(declare-fun arrayContainsKey!0 (array!22147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378826 (= res!214750 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15246 () Bool)

(declare-fun mapRes!15246 () Bool)

(assert (=> mapIsEmpty!15246 mapRes!15246))

(declare-fun b!378827 () Bool)

(declare-fun res!214743 () Bool)

(assert (=> b!378827 (=> (not res!214743) (not e!230498))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378827 (= res!214743 (or (= (select (arr!10542 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10542 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378828 () Bool)

(declare-fun res!214751 () Bool)

(assert (=> b!378828 (=> (not res!214751) (not e!230498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378828 (= res!214751 (validKeyInArray!0 k0!778))))

(declare-fun b!378829 () Bool)

(declare-fun e!230504 () Bool)

(declare-fun tp_is_empty!9121 () Bool)

(assert (=> b!378829 (= e!230504 tp_is_empty!9121)))

(declare-fun b!378830 () Bool)

(declare-fun e!230499 () Bool)

(declare-fun e!230497 () Bool)

(assert (=> b!378830 (= e!230499 (and e!230497 mapRes!15246))))

(declare-fun condMapEmpty!15246 () Bool)

(declare-datatypes ((ValueCell!4217 0))(
  ( (ValueCellFull!4217 (v!6796 V!13267)) (EmptyCell!4217) )
))
(declare-datatypes ((array!22149 0))(
  ( (array!22150 (arr!10543 (Array (_ BitVec 32) ValueCell!4217)) (size!10896 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22149)

(declare-fun mapDefault!15246 () ValueCell!4217)

(assert (=> b!378830 (= condMapEmpty!15246 (= (arr!10543 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4217)) mapDefault!15246)))))

(declare-fun b!378831 () Bool)

(declare-fun res!214745 () Bool)

(declare-fun e!230503 () Bool)

(assert (=> b!378831 (=> (not res!214745) (not e!230503))))

(declare-fun lt!176660 () array!22147)

(assert (=> b!378831 (= res!214745 (arrayNoDuplicates!0 lt!176660 #b00000000000000000000000000000000 Nil!5959))))

(declare-fun b!378832 () Bool)

(assert (=> b!378832 (= e!230498 e!230503)))

(declare-fun res!214744 () Bool)

(assert (=> b!378832 (=> (not res!214744) (not e!230503))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22147 (_ BitVec 32)) Bool)

(assert (=> b!378832 (= res!214744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176660 mask!970))))

(assert (=> b!378832 (= lt!176660 (array!22148 (store (arr!10542 _keys!658) i!548 k0!778) (size!10895 _keys!658)))))

(declare-fun mapNonEmpty!15246 () Bool)

(declare-fun tp!30135 () Bool)

(assert (=> mapNonEmpty!15246 (= mapRes!15246 (and tp!30135 e!230504))))

(declare-fun mapKey!15246 () (_ BitVec 32))

(declare-fun mapRest!15246 () (Array (_ BitVec 32) ValueCell!4217))

(declare-fun mapValue!15246 () ValueCell!4217)

(assert (=> mapNonEmpty!15246 (= (arr!10543 _values!506) (store mapRest!15246 mapKey!15246 mapValue!15246))))

(declare-fun b!378833 () Bool)

(declare-fun e!230500 () Bool)

(assert (=> b!378833 (= e!230500 e!230502)))

(declare-fun res!214754 () Bool)

(assert (=> b!378833 (=> res!214754 e!230502)))

(assert (=> b!378833 (= res!214754 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176656 () ListLongMap!5035)

(assert (=> b!378833 (= lt!176656 lt!176661)))

(declare-fun lt!176663 () tuple2!6132)

(assert (=> b!378833 (= lt!176661 (+!901 lt!176664 lt!176663))))

(declare-fun lt!176655 () ListLongMap!5035)

(assert (=> b!378833 (= lt!176655 lt!176662)))

(declare-fun lt!176658 () ListLongMap!5035)

(assert (=> b!378833 (= lt!176662 (+!901 lt!176658 lt!176663))))

(declare-fun lt!176652 () ListLongMap!5035)

(assert (=> b!378833 (= lt!176655 (+!901 lt!176652 lt!176663))))

(assert (=> b!378833 (= lt!176663 (tuple2!6133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378834 () Bool)

(assert (=> b!378834 (= e!230497 tp_is_empty!9121)))

(declare-fun b!378835 () Bool)

(assert (=> b!378835 (= e!230503 (not e!230500))))

(declare-fun res!214749 () Bool)

(assert (=> b!378835 (=> res!214749 e!230500)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378835 (= res!214749 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13267)

(declare-fun getCurrentListMap!1934 (array!22147 array!22149 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) Int) ListLongMap!5035)

(assert (=> b!378835 (= lt!176656 (getCurrentListMap!1934 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176653 () array!22149)

(assert (=> b!378835 (= lt!176655 (getCurrentListMap!1934 lt!176660 lt!176653 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378835 (and (= lt!176652 lt!176658) (= lt!176658 lt!176652))))

(assert (=> b!378835 (= lt!176658 (+!901 lt!176664 lt!176654))))

(assert (=> b!378835 (= lt!176654 (tuple2!6133 k0!778 v!373))))

(declare-fun lt!176657 () Unit!11666)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!127 (array!22147 array!22149 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) (_ BitVec 64) V!13267 (_ BitVec 32) Int) Unit!11666)

(assert (=> b!378835 (= lt!176657 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!127 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!799 (array!22147 array!22149 (_ BitVec 32) (_ BitVec 32) V!13267 V!13267 (_ BitVec 32) Int) ListLongMap!5035)

(assert (=> b!378835 (= lt!176652 (getCurrentListMapNoExtraKeys!799 lt!176660 lt!176653 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378835 (= lt!176653 (array!22150 (store (arr!10543 _values!506) i!548 (ValueCellFull!4217 v!373)) (size!10896 _values!506)))))

(assert (=> b!378835 (= lt!176664 (getCurrentListMapNoExtraKeys!799 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378836 () Bool)

(declare-fun res!214753 () Bool)

(assert (=> b!378836 (=> (not res!214753) (not e!230498))))

(assert (=> b!378836 (= res!214753 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10895 _keys!658))))))

(declare-fun b!378837 () Bool)

(declare-fun res!214746 () Bool)

(assert (=> b!378837 (=> (not res!214746) (not e!230498))))

(assert (=> b!378837 (= res!214746 (and (= (size!10896 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10895 _keys!658) (size!10896 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!214748 () Bool)

(assert (=> start!37332 (=> (not res!214748) (not e!230498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37332 (= res!214748 (validMask!0 mask!970))))

(assert (=> start!37332 e!230498))

(declare-fun array_inv!7768 (array!22149) Bool)

(assert (=> start!37332 (and (array_inv!7768 _values!506) e!230499)))

(assert (=> start!37332 tp!30134))

(assert (=> start!37332 true))

(assert (=> start!37332 tp_is_empty!9121))

(declare-fun array_inv!7769 (array!22147) Bool)

(assert (=> start!37332 (array_inv!7769 _keys!658)))

(declare-fun b!378838 () Bool)

(declare-fun res!214747 () Bool)

(assert (=> b!378838 (=> (not res!214747) (not e!230498))))

(assert (=> b!378838 (= res!214747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37332 res!214748) b!378837))

(assert (= (and b!378837 res!214746) b!378838))

(assert (= (and b!378838 res!214747) b!378825))

(assert (= (and b!378825 res!214752) b!378836))

(assert (= (and b!378836 res!214753) b!378828))

(assert (= (and b!378828 res!214751) b!378827))

(assert (= (and b!378827 res!214743) b!378826))

(assert (= (and b!378826 res!214750) b!378832))

(assert (= (and b!378832 res!214744) b!378831))

(assert (= (and b!378831 res!214745) b!378835))

(assert (= (and b!378835 (not res!214749)) b!378833))

(assert (= (and b!378833 (not res!214754)) b!378824))

(assert (= (and b!378830 condMapEmpty!15246) mapIsEmpty!15246))

(assert (= (and b!378830 (not condMapEmpty!15246)) mapNonEmpty!15246))

(get-info :version)

(assert (= (and mapNonEmpty!15246 ((_ is ValueCellFull!4217) mapValue!15246)) b!378829))

(assert (= (and b!378830 ((_ is ValueCellFull!4217) mapDefault!15246)) b!378834))

(assert (= start!37332 b!378830))

(declare-fun m!375227 () Bool)

(assert (=> b!378838 m!375227))

(declare-fun m!375229 () Bool)

(assert (=> b!378828 m!375229))

(declare-fun m!375231 () Bool)

(assert (=> b!378833 m!375231))

(declare-fun m!375233 () Bool)

(assert (=> b!378833 m!375233))

(declare-fun m!375235 () Bool)

(assert (=> b!378833 m!375235))

(declare-fun m!375237 () Bool)

(assert (=> b!378831 m!375237))

(declare-fun m!375239 () Bool)

(assert (=> b!378826 m!375239))

(declare-fun m!375241 () Bool)

(assert (=> start!37332 m!375241))

(declare-fun m!375243 () Bool)

(assert (=> start!37332 m!375243))

(declare-fun m!375245 () Bool)

(assert (=> start!37332 m!375245))

(declare-fun m!375247 () Bool)

(assert (=> b!378827 m!375247))

(declare-fun m!375249 () Bool)

(assert (=> b!378832 m!375249))

(declare-fun m!375251 () Bool)

(assert (=> b!378832 m!375251))

(declare-fun m!375253 () Bool)

(assert (=> b!378825 m!375253))

(declare-fun m!375255 () Bool)

(assert (=> b!378835 m!375255))

(declare-fun m!375257 () Bool)

(assert (=> b!378835 m!375257))

(declare-fun m!375259 () Bool)

(assert (=> b!378835 m!375259))

(declare-fun m!375261 () Bool)

(assert (=> b!378835 m!375261))

(declare-fun m!375263 () Bool)

(assert (=> b!378835 m!375263))

(declare-fun m!375265 () Bool)

(assert (=> b!378835 m!375265))

(declare-fun m!375267 () Bool)

(assert (=> b!378835 m!375267))

(declare-fun m!375269 () Bool)

(assert (=> b!378824 m!375269))

(declare-fun m!375271 () Bool)

(assert (=> b!378824 m!375271))

(declare-fun m!375273 () Bool)

(assert (=> mapNonEmpty!15246 m!375273))

(check-sat (not mapNonEmpty!15246) b_and!15689 (not b!378828) tp_is_empty!9121 (not b!378824) (not b!378831) (not b!378826) (not b!378835) (not start!37332) (not b!378825) (not b!378833) (not b!378832) (not b_next!8473) (not b!378838))
(check-sat b_and!15689 (not b_next!8473))
