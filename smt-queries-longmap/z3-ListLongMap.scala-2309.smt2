; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37302 () Bool)

(assert start!37302)

(declare-fun b_free!8443 () Bool)

(declare-fun b_next!8443 () Bool)

(assert (=> start!37302 (= b_free!8443 (not b_next!8443))))

(declare-fun tp!30045 () Bool)

(declare-fun b_and!15659 () Bool)

(assert (=> start!37302 (= tp!30045 b_and!15659)))

(declare-fun b!378149 () Bool)

(declare-fun e!230141 () Bool)

(declare-fun tp_is_empty!9091 () Bool)

(assert (=> b!378149 (= e!230141 tp_is_empty!9091)))

(declare-fun b!378150 () Bool)

(declare-fun res!214207 () Bool)

(declare-fun e!230137 () Bool)

(assert (=> b!378150 (=> (not res!214207) (not e!230137))))

(declare-datatypes ((array!22089 0))(
  ( (array!22090 (arr!10513 (Array (_ BitVec 32) (_ BitVec 64))) (size!10866 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22089)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378150 (= res!214207 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378151 () Bool)

(declare-fun e!230140 () Bool)

(assert (=> b!378151 (= e!230140 true)))

(declare-datatypes ((V!13227 0))(
  ( (V!13228 (val!4590 Int)) )
))
(declare-datatypes ((tuple2!6108 0))(
  ( (tuple2!6109 (_1!3065 (_ BitVec 64)) (_2!3065 V!13227)) )
))
(declare-datatypes ((List!5937 0))(
  ( (Nil!5934) (Cons!5933 (h!6789 tuple2!6108) (t!11078 List!5937)) )
))
(declare-datatypes ((ListLongMap!5011 0))(
  ( (ListLongMap!5012 (toList!2521 List!5937)) )
))
(declare-fun lt!176077 () ListLongMap!5011)

(declare-fun lt!176068 () ListLongMap!5011)

(declare-fun lt!176069 () tuple2!6108)

(declare-fun +!889 (ListLongMap!5011 tuple2!6108) ListLongMap!5011)

(assert (=> b!378151 (= lt!176077 (+!889 lt!176068 lt!176069))))

(declare-datatypes ((Unit!11644 0))(
  ( (Unit!11645) )
))
(declare-fun lt!176072 () Unit!11644)

(declare-fun lt!176071 () ListLongMap!5011)

(declare-fun minValue!472 () V!13227)

(declare-fun v!373 () V!13227)

(declare-fun addCommutativeForDiffKeys!291 (ListLongMap!5011 (_ BitVec 64) V!13227 (_ BitVec 64) V!13227) Unit!11644)

(assert (=> b!378151 (= lt!176072 (addCommutativeForDiffKeys!291 lt!176071 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378152 () Bool)

(declare-fun e!230143 () Bool)

(declare-fun e!230142 () Bool)

(assert (=> b!378152 (= e!230143 (not e!230142))))

(declare-fun res!214209 () Bool)

(assert (=> b!378152 (=> res!214209 e!230142)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378152 (= res!214209 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4202 0))(
  ( (ValueCellFull!4202 (v!6781 V!13227)) (EmptyCell!4202) )
))
(declare-datatypes ((array!22091 0))(
  ( (array!22092 (arr!10514 (Array (_ BitVec 32) ValueCell!4202)) (size!10867 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22091)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!176079 () ListLongMap!5011)

(declare-fun zeroValue!472 () V!13227)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1925 (array!22089 array!22091 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) Int) ListLongMap!5011)

(assert (=> b!378152 (= lt!176079 (getCurrentListMap!1925 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176075 () array!22089)

(declare-fun lt!176078 () array!22091)

(declare-fun lt!176067 () ListLongMap!5011)

(assert (=> b!378152 (= lt!176067 (getCurrentListMap!1925 lt!176075 lt!176078 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176070 () ListLongMap!5011)

(declare-fun lt!176076 () ListLongMap!5011)

(assert (=> b!378152 (and (= lt!176070 lt!176076) (= lt!176076 lt!176070))))

(assert (=> b!378152 (= lt!176076 (+!889 lt!176071 lt!176069))))

(assert (=> b!378152 (= lt!176069 (tuple2!6109 k0!778 v!373))))

(declare-fun lt!176074 () Unit!11644)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!118 (array!22089 array!22091 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) (_ BitVec 64) V!13227 (_ BitVec 32) Int) Unit!11644)

(assert (=> b!378152 (= lt!176074 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!118 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!790 (array!22089 array!22091 (_ BitVec 32) (_ BitVec 32) V!13227 V!13227 (_ BitVec 32) Int) ListLongMap!5011)

(assert (=> b!378152 (= lt!176070 (getCurrentListMapNoExtraKeys!790 lt!176075 lt!176078 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378152 (= lt!176078 (array!22092 (store (arr!10514 _values!506) i!548 (ValueCellFull!4202 v!373)) (size!10867 _values!506)))))

(assert (=> b!378152 (= lt!176071 (getCurrentListMapNoExtraKeys!790 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378153 () Bool)

(declare-fun res!214213 () Bool)

(assert (=> b!378153 (=> (not res!214213) (not e!230137))))

(assert (=> b!378153 (= res!214213 (and (= (size!10867 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10866 _keys!658) (size!10867 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378154 () Bool)

(assert (=> b!378154 (= e!230142 e!230140)))

(declare-fun res!214204 () Bool)

(assert (=> b!378154 (=> res!214204 e!230140)))

(assert (=> b!378154 (= res!214204 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!378154 (= lt!176079 lt!176068)))

(declare-fun lt!176073 () tuple2!6108)

(assert (=> b!378154 (= lt!176068 (+!889 lt!176071 lt!176073))))

(assert (=> b!378154 (= lt!176067 lt!176077)))

(assert (=> b!378154 (= lt!176077 (+!889 lt!176076 lt!176073))))

(assert (=> b!378154 (= lt!176067 (+!889 lt!176070 lt!176073))))

(assert (=> b!378154 (= lt!176073 (tuple2!6109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378155 () Bool)

(declare-fun res!214205 () Bool)

(assert (=> b!378155 (=> (not res!214205) (not e!230137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22089 (_ BitVec 32)) Bool)

(assert (=> b!378155 (= res!214205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378156 () Bool)

(declare-fun e!230139 () Bool)

(declare-fun e!230144 () Bool)

(declare-fun mapRes!15201 () Bool)

(assert (=> b!378156 (= e!230139 (and e!230144 mapRes!15201))))

(declare-fun condMapEmpty!15201 () Bool)

(declare-fun mapDefault!15201 () ValueCell!4202)

(assert (=> b!378156 (= condMapEmpty!15201 (= (arr!10514 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4202)) mapDefault!15201)))))

(declare-fun b!378157 () Bool)

(declare-fun res!214208 () Bool)

(assert (=> b!378157 (=> (not res!214208) (not e!230137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378157 (= res!214208 (validKeyInArray!0 k0!778))))

(declare-fun res!214214 () Bool)

(assert (=> start!37302 (=> (not res!214214) (not e!230137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37302 (= res!214214 (validMask!0 mask!970))))

(assert (=> start!37302 e!230137))

(declare-fun array_inv!7746 (array!22091) Bool)

(assert (=> start!37302 (and (array_inv!7746 _values!506) e!230139)))

(assert (=> start!37302 tp!30045))

(assert (=> start!37302 true))

(assert (=> start!37302 tp_is_empty!9091))

(declare-fun array_inv!7747 (array!22089) Bool)

(assert (=> start!37302 (array_inv!7747 _keys!658)))

(declare-fun b!378158 () Bool)

(declare-fun res!214210 () Bool)

(assert (=> b!378158 (=> (not res!214210) (not e!230137))))

(assert (=> b!378158 (= res!214210 (or (= (select (arr!10513 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10513 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15201 () Bool)

(assert (=> mapIsEmpty!15201 mapRes!15201))

(declare-fun b!378159 () Bool)

(assert (=> b!378159 (= e!230144 tp_is_empty!9091)))

(declare-fun b!378160 () Bool)

(declare-fun res!214206 () Bool)

(assert (=> b!378160 (=> (not res!214206) (not e!230137))))

(assert (=> b!378160 (= res!214206 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10866 _keys!658))))))

(declare-fun b!378161 () Bool)

(assert (=> b!378161 (= e!230137 e!230143)))

(declare-fun res!214212 () Bool)

(assert (=> b!378161 (=> (not res!214212) (not e!230143))))

(assert (=> b!378161 (= res!214212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176075 mask!970))))

(assert (=> b!378161 (= lt!176075 (array!22090 (store (arr!10513 _keys!658) i!548 k0!778) (size!10866 _keys!658)))))

(declare-fun b!378162 () Bool)

(declare-fun res!214211 () Bool)

(assert (=> b!378162 (=> (not res!214211) (not e!230137))))

(declare-datatypes ((List!5938 0))(
  ( (Nil!5935) (Cons!5934 (h!6790 (_ BitVec 64)) (t!11079 List!5938)) )
))
(declare-fun arrayNoDuplicates!0 (array!22089 (_ BitVec 32) List!5938) Bool)

(assert (=> b!378162 (= res!214211 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5935))))

(declare-fun mapNonEmpty!15201 () Bool)

(declare-fun tp!30044 () Bool)

(assert (=> mapNonEmpty!15201 (= mapRes!15201 (and tp!30044 e!230141))))

(declare-fun mapRest!15201 () (Array (_ BitVec 32) ValueCell!4202))

(declare-fun mapValue!15201 () ValueCell!4202)

(declare-fun mapKey!15201 () (_ BitVec 32))

(assert (=> mapNonEmpty!15201 (= (arr!10514 _values!506) (store mapRest!15201 mapKey!15201 mapValue!15201))))

(declare-fun b!378163 () Bool)

(declare-fun res!214203 () Bool)

(assert (=> b!378163 (=> (not res!214203) (not e!230143))))

(assert (=> b!378163 (= res!214203 (arrayNoDuplicates!0 lt!176075 #b00000000000000000000000000000000 Nil!5935))))

(assert (= (and start!37302 res!214214) b!378153))

(assert (= (and b!378153 res!214213) b!378155))

(assert (= (and b!378155 res!214205) b!378162))

(assert (= (and b!378162 res!214211) b!378160))

(assert (= (and b!378160 res!214206) b!378157))

(assert (= (and b!378157 res!214208) b!378158))

(assert (= (and b!378158 res!214210) b!378150))

(assert (= (and b!378150 res!214207) b!378161))

(assert (= (and b!378161 res!214212) b!378163))

(assert (= (and b!378163 res!214203) b!378152))

(assert (= (and b!378152 (not res!214209)) b!378154))

(assert (= (and b!378154 (not res!214204)) b!378151))

(assert (= (and b!378156 condMapEmpty!15201) mapIsEmpty!15201))

(assert (= (and b!378156 (not condMapEmpty!15201)) mapNonEmpty!15201))

(get-info :version)

(assert (= (and mapNonEmpty!15201 ((_ is ValueCellFull!4202) mapValue!15201)) b!378149))

(assert (= (and b!378156 ((_ is ValueCellFull!4202) mapDefault!15201)) b!378159))

(assert (= start!37302 b!378156))

(declare-fun m!374507 () Bool)

(assert (=> b!378163 m!374507))

(declare-fun m!374509 () Bool)

(assert (=> b!378155 m!374509))

(declare-fun m!374511 () Bool)

(assert (=> b!378154 m!374511))

(declare-fun m!374513 () Bool)

(assert (=> b!378154 m!374513))

(declare-fun m!374515 () Bool)

(assert (=> b!378154 m!374515))

(declare-fun m!374517 () Bool)

(assert (=> start!37302 m!374517))

(declare-fun m!374519 () Bool)

(assert (=> start!37302 m!374519))

(declare-fun m!374521 () Bool)

(assert (=> start!37302 m!374521))

(declare-fun m!374523 () Bool)

(assert (=> b!378152 m!374523))

(declare-fun m!374525 () Bool)

(assert (=> b!378152 m!374525))

(declare-fun m!374527 () Bool)

(assert (=> b!378152 m!374527))

(declare-fun m!374529 () Bool)

(assert (=> b!378152 m!374529))

(declare-fun m!374531 () Bool)

(assert (=> b!378152 m!374531))

(declare-fun m!374533 () Bool)

(assert (=> b!378152 m!374533))

(declare-fun m!374535 () Bool)

(assert (=> b!378152 m!374535))

(declare-fun m!374537 () Bool)

(assert (=> b!378157 m!374537))

(declare-fun m!374539 () Bool)

(assert (=> b!378150 m!374539))

(declare-fun m!374541 () Bool)

(assert (=> mapNonEmpty!15201 m!374541))

(declare-fun m!374543 () Bool)

(assert (=> b!378151 m!374543))

(declare-fun m!374545 () Bool)

(assert (=> b!378151 m!374545))

(declare-fun m!374547 () Bool)

(assert (=> b!378161 m!374547))

(declare-fun m!374549 () Bool)

(assert (=> b!378161 m!374549))

(declare-fun m!374551 () Bool)

(assert (=> b!378158 m!374551))

(declare-fun m!374553 () Bool)

(assert (=> b!378162 m!374553))

(check-sat (not b!378163) (not b!378162) (not b!378157) (not b!378154) (not b!378152) (not b!378161) b_and!15659 (not b!378150) (not b_next!8443) (not start!37302) tp_is_empty!9091 (not b!378155) (not b!378151) (not mapNonEmpty!15201))
(check-sat b_and!15659 (not b_next!8443))
