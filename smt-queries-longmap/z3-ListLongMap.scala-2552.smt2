; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39116 () Bool)

(assert start!39116)

(declare-fun b_free!9397 () Bool)

(declare-fun b_next!9397 () Bool)

(assert (=> start!39116 (= b_free!9397 (not b_next!9397))))

(declare-fun tp!33719 () Bool)

(declare-fun b_and!16757 () Bool)

(assert (=> start!39116 (= tp!33719 b_and!16757)))

(declare-fun mapNonEmpty!17445 () Bool)

(declare-fun mapRes!17445 () Bool)

(declare-fun tp!33720 () Bool)

(declare-fun e!246274 () Bool)

(assert (=> mapNonEmpty!17445 (= mapRes!17445 (and tp!33720 e!246274))))

(declare-datatypes ((V!15171 0))(
  ( (V!15172 (val!5319 Int)) )
))
(declare-datatypes ((ValueCell!4931 0))(
  ( (ValueCellFull!4931 (v!7560 V!15171)) (EmptyCell!4931) )
))
(declare-fun mapValue!17445 () ValueCell!4931)

(declare-fun mapKey!17445 () (_ BitVec 32))

(declare-datatypes ((array!24953 0))(
  ( (array!24954 (arr!11926 (Array (_ BitVec 32) ValueCell!4931)) (size!12279 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24953)

(declare-fun mapRest!17445 () (Array (_ BitVec 32) ValueCell!4931))

(assert (=> mapNonEmpty!17445 (= (arr!11926 _values!549) (store mapRest!17445 mapKey!17445 mapValue!17445))))

(declare-fun b!411266 () Bool)

(declare-fun e!246275 () Bool)

(assert (=> b!411266 (= e!246275 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6888 0))(
  ( (tuple2!6889 (_1!3455 (_ BitVec 64)) (_2!3455 V!15171)) )
))
(declare-datatypes ((List!6901 0))(
  ( (Nil!6898) (Cons!6897 (h!7753 tuple2!6888) (t!12066 List!6901)) )
))
(declare-datatypes ((ListLongMap!5791 0))(
  ( (ListLongMap!5792 (toList!2911 List!6901)) )
))
(declare-fun lt!189066 () ListLongMap!5791)

(declare-fun minValue!515 () V!15171)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15171)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24955 0))(
  ( (array!24956 (arr!11927 (Array (_ BitVec 32) (_ BitVec 64))) (size!12280 (_ BitVec 32))) )
))
(declare-fun lt!189068 () array!24955)

(declare-fun v!412 () V!15171)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1125 (array!24955 array!24953 (_ BitVec 32) (_ BitVec 32) V!15171 V!15171 (_ BitVec 32) Int) ListLongMap!5791)

(assert (=> b!411266 (= lt!189066 (getCurrentListMapNoExtraKeys!1125 lt!189068 (array!24954 (store (arr!11926 _values!549) i!563 (ValueCellFull!4931 v!412)) (size!12279 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189067 () ListLongMap!5791)

(declare-fun _keys!709 () array!24955)

(assert (=> b!411266 (= lt!189067 (getCurrentListMapNoExtraKeys!1125 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411267 () Bool)

(declare-fun res!238647 () Bool)

(declare-fun e!246272 () Bool)

(assert (=> b!411267 (=> (not res!238647) (not e!246272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411267 (= res!238647 (validMask!0 mask!1025))))

(declare-fun b!411268 () Bool)

(declare-fun res!238644 () Bool)

(assert (=> b!411268 (=> (not res!238644) (not e!246272))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411268 (= res!238644 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411269 () Bool)

(declare-fun res!238640 () Bool)

(assert (=> b!411269 (=> (not res!238640) (not e!246275))))

(declare-datatypes ((List!6902 0))(
  ( (Nil!6899) (Cons!6898 (h!7754 (_ BitVec 64)) (t!12067 List!6902)) )
))
(declare-fun arrayNoDuplicates!0 (array!24955 (_ BitVec 32) List!6902) Bool)

(assert (=> b!411269 (= res!238640 (arrayNoDuplicates!0 lt!189068 #b00000000000000000000000000000000 Nil!6899))))

(declare-fun b!411270 () Bool)

(declare-fun tp_is_empty!10549 () Bool)

(assert (=> b!411270 (= e!246274 tp_is_empty!10549)))

(declare-fun b!411271 () Bool)

(declare-fun res!238646 () Bool)

(assert (=> b!411271 (=> (not res!238646) (not e!246272))))

(assert (=> b!411271 (= res!238646 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6899))))

(declare-fun b!411272 () Bool)

(declare-fun res!238645 () Bool)

(assert (=> b!411272 (=> (not res!238645) (not e!246272))))

(assert (=> b!411272 (= res!238645 (or (= (select (arr!11927 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11927 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411274 () Bool)

(declare-fun res!238648 () Bool)

(assert (=> b!411274 (=> (not res!238648) (not e!246275))))

(assert (=> b!411274 (= res!238648 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17445 () Bool)

(assert (=> mapIsEmpty!17445 mapRes!17445))

(declare-fun b!411275 () Bool)

(declare-fun res!238650 () Bool)

(assert (=> b!411275 (=> (not res!238650) (not e!246272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24955 (_ BitVec 32)) Bool)

(assert (=> b!411275 (= res!238650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411276 () Bool)

(assert (=> b!411276 (= e!246272 e!246275)))

(declare-fun res!238639 () Bool)

(assert (=> b!411276 (=> (not res!238639) (not e!246275))))

(assert (=> b!411276 (= res!238639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189068 mask!1025))))

(assert (=> b!411276 (= lt!189068 (array!24956 (store (arr!11927 _keys!709) i!563 k0!794) (size!12280 _keys!709)))))

(declare-fun b!411277 () Bool)

(declare-fun e!246276 () Bool)

(assert (=> b!411277 (= e!246276 tp_is_empty!10549)))

(declare-fun b!411278 () Bool)

(declare-fun res!238643 () Bool)

(assert (=> b!411278 (=> (not res!238643) (not e!246272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411278 (= res!238643 (validKeyInArray!0 k0!794))))

(declare-fun b!411279 () Bool)

(declare-fun e!246273 () Bool)

(assert (=> b!411279 (= e!246273 (and e!246276 mapRes!17445))))

(declare-fun condMapEmpty!17445 () Bool)

(declare-fun mapDefault!17445 () ValueCell!4931)

(assert (=> b!411279 (= condMapEmpty!17445 (= (arr!11926 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4931)) mapDefault!17445)))))

(declare-fun b!411280 () Bool)

(declare-fun res!238649 () Bool)

(assert (=> b!411280 (=> (not res!238649) (not e!246272))))

(assert (=> b!411280 (= res!238649 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12280 _keys!709))))))

(declare-fun res!238642 () Bool)

(assert (=> start!39116 (=> (not res!238642) (not e!246272))))

(assert (=> start!39116 (= res!238642 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12280 _keys!709))))))

(assert (=> start!39116 e!246272))

(assert (=> start!39116 tp_is_empty!10549))

(assert (=> start!39116 tp!33719))

(assert (=> start!39116 true))

(declare-fun array_inv!8754 (array!24953) Bool)

(assert (=> start!39116 (and (array_inv!8754 _values!549) e!246273)))

(declare-fun array_inv!8755 (array!24955) Bool)

(assert (=> start!39116 (array_inv!8755 _keys!709)))

(declare-fun b!411273 () Bool)

(declare-fun res!238641 () Bool)

(assert (=> b!411273 (=> (not res!238641) (not e!246272))))

(assert (=> b!411273 (= res!238641 (and (= (size!12279 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12280 _keys!709) (size!12279 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39116 res!238642) b!411267))

(assert (= (and b!411267 res!238647) b!411273))

(assert (= (and b!411273 res!238641) b!411275))

(assert (= (and b!411275 res!238650) b!411271))

(assert (= (and b!411271 res!238646) b!411280))

(assert (= (and b!411280 res!238649) b!411278))

(assert (= (and b!411278 res!238643) b!411272))

(assert (= (and b!411272 res!238645) b!411268))

(assert (= (and b!411268 res!238644) b!411276))

(assert (= (and b!411276 res!238639) b!411269))

(assert (= (and b!411269 res!238640) b!411274))

(assert (= (and b!411274 res!238648) b!411266))

(assert (= (and b!411279 condMapEmpty!17445) mapIsEmpty!17445))

(assert (= (and b!411279 (not condMapEmpty!17445)) mapNonEmpty!17445))

(get-info :version)

(assert (= (and mapNonEmpty!17445 ((_ is ValueCellFull!4931) mapValue!17445)) b!411270))

(assert (= (and b!411279 ((_ is ValueCellFull!4931) mapDefault!17445)) b!411277))

(assert (= start!39116 b!411279))

(declare-fun m!400929 () Bool)

(assert (=> b!411267 m!400929))

(declare-fun m!400931 () Bool)

(assert (=> b!411278 m!400931))

(declare-fun m!400933 () Bool)

(assert (=> b!411269 m!400933))

(declare-fun m!400935 () Bool)

(assert (=> b!411266 m!400935))

(declare-fun m!400937 () Bool)

(assert (=> b!411266 m!400937))

(declare-fun m!400939 () Bool)

(assert (=> b!411266 m!400939))

(declare-fun m!400941 () Bool)

(assert (=> mapNonEmpty!17445 m!400941))

(declare-fun m!400943 () Bool)

(assert (=> start!39116 m!400943))

(declare-fun m!400945 () Bool)

(assert (=> start!39116 m!400945))

(declare-fun m!400947 () Bool)

(assert (=> b!411276 m!400947))

(declare-fun m!400949 () Bool)

(assert (=> b!411276 m!400949))

(declare-fun m!400951 () Bool)

(assert (=> b!411272 m!400951))

(declare-fun m!400953 () Bool)

(assert (=> b!411271 m!400953))

(declare-fun m!400955 () Bool)

(assert (=> b!411275 m!400955))

(declare-fun m!400957 () Bool)

(assert (=> b!411268 m!400957))

(check-sat (not b!411278) tp_is_empty!10549 (not b!411269) (not start!39116) (not mapNonEmpty!17445) (not b!411267) (not b_next!9397) (not b!411266) (not b!411276) (not b!411275) (not b!411271) b_and!16757 (not b!411268))
(check-sat b_and!16757 (not b_next!9397))
