; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20660 () Bool)

(assert start!20660)

(declare-fun b_free!5319 () Bool)

(declare-fun b_next!5319 () Bool)

(assert (=> start!20660 (= b_free!5319 (not b_next!5319))))

(declare-fun tp!18989 () Bool)

(declare-fun b_and!12065 () Bool)

(assert (=> start!20660 (= tp!18989 b_and!12065)))

(declare-fun b!206388 () Bool)

(declare-fun e!134901 () Bool)

(declare-fun e!134899 () Bool)

(assert (=> b!206388 (= e!134901 (not e!134899))))

(declare-fun res!99971 () Bool)

(assert (=> b!206388 (=> res!99971 e!134899)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206388 (= res!99971 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6547 0))(
  ( (V!6548 (val!2632 Int)) )
))
(declare-datatypes ((tuple2!4000 0))(
  ( (tuple2!4001 (_1!2011 (_ BitVec 64)) (_2!2011 V!6547)) )
))
(declare-datatypes ((List!2891 0))(
  ( (Nil!2888) (Cons!2887 (h!3529 tuple2!4000) (t!7822 List!2891)) )
))
(declare-datatypes ((ListLongMap!2913 0))(
  ( (ListLongMap!2914 (toList!1472 List!2891)) )
))
(declare-fun lt!105526 () ListLongMap!2913)

(declare-datatypes ((ValueCell!2244 0))(
  ( (ValueCellFull!2244 (v!4602 V!6547)) (EmptyCell!2244) )
))
(declare-datatypes ((array!9561 0))(
  ( (array!9562 (arr!4531 (Array (_ BitVec 32) ValueCell!2244)) (size!4856 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9561)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6547)

(declare-datatypes ((array!9563 0))(
  ( (array!9564 (arr!4532 (Array (_ BitVec 32) (_ BitVec 64))) (size!4857 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9563)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6547)

(declare-fun getCurrentListMap!1039 (array!9563 array!9561 (_ BitVec 32) (_ BitVec 32) V!6547 V!6547 (_ BitVec 32) Int) ListLongMap!2913)

(assert (=> b!206388 (= lt!105526 (getCurrentListMap!1039 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105531 () ListLongMap!2913)

(declare-fun lt!105528 () array!9561)

(assert (=> b!206388 (= lt!105531 (getCurrentListMap!1039 _keys!825 lt!105528 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105520 () ListLongMap!2913)

(declare-fun lt!105525 () ListLongMap!2913)

(assert (=> b!206388 (and (= lt!105520 lt!105525) (= lt!105525 lt!105520))))

(declare-fun lt!105522 () ListLongMap!2913)

(declare-fun lt!105524 () tuple2!4000)

(declare-fun +!499 (ListLongMap!2913 tuple2!4000) ListLongMap!2913)

(assert (=> b!206388 (= lt!105525 (+!499 lt!105522 lt!105524))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6547)

(assert (=> b!206388 (= lt!105524 (tuple2!4001 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6286 0))(
  ( (Unit!6287) )
))
(declare-fun lt!105521 () Unit!6286)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!152 (array!9563 array!9561 (_ BitVec 32) (_ BitVec 32) V!6547 V!6547 (_ BitVec 32) (_ BitVec 64) V!6547 (_ BitVec 32) Int) Unit!6286)

(assert (=> b!206388 (= lt!105521 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!152 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!413 (array!9563 array!9561 (_ BitVec 32) (_ BitVec 32) V!6547 V!6547 (_ BitVec 32) Int) ListLongMap!2913)

(assert (=> b!206388 (= lt!105520 (getCurrentListMapNoExtraKeys!413 _keys!825 lt!105528 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206388 (= lt!105528 (array!9562 (store (arr!4531 _values!649) i!601 (ValueCellFull!2244 v!520)) (size!4856 _values!649)))))

(assert (=> b!206388 (= lt!105522 (getCurrentListMapNoExtraKeys!413 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206389 () Bool)

(declare-fun res!99974 () Bool)

(assert (=> b!206389 (=> (not res!99974) (not e!134901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206389 (= res!99974 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8831 () Bool)

(declare-fun mapRes!8831 () Bool)

(declare-fun tp!18988 () Bool)

(declare-fun e!134900 () Bool)

(assert (=> mapNonEmpty!8831 (= mapRes!8831 (and tp!18988 e!134900))))

(declare-fun mapValue!8831 () ValueCell!2244)

(declare-fun mapKey!8831 () (_ BitVec 32))

(declare-fun mapRest!8831 () (Array (_ BitVec 32) ValueCell!2244))

(assert (=> mapNonEmpty!8831 (= (arr!4531 _values!649) (store mapRest!8831 mapKey!8831 mapValue!8831))))

(declare-fun b!206390 () Bool)

(declare-fun tp_is_empty!5175 () Bool)

(assert (=> b!206390 (= e!134900 tp_is_empty!5175)))

(declare-fun b!206391 () Bool)

(declare-fun res!99973 () Bool)

(assert (=> b!206391 (=> (not res!99973) (not e!134901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9563 (_ BitVec 32)) Bool)

(assert (=> b!206391 (= res!99973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206392 () Bool)

(declare-fun e!134902 () Bool)

(declare-fun e!134903 () Bool)

(assert (=> b!206392 (= e!134902 (and e!134903 mapRes!8831))))

(declare-fun condMapEmpty!8831 () Bool)

(declare-fun mapDefault!8831 () ValueCell!2244)

(assert (=> b!206392 (= condMapEmpty!8831 (= (arr!4531 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2244)) mapDefault!8831)))))

(declare-fun b!206393 () Bool)

(declare-fun res!99975 () Bool)

(assert (=> b!206393 (=> (not res!99975) (not e!134901))))

(assert (=> b!206393 (= res!99975 (and (= (size!4856 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4857 _keys!825) (size!4856 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206394 () Bool)

(declare-fun res!99970 () Bool)

(assert (=> b!206394 (=> (not res!99970) (not e!134901))))

(declare-datatypes ((List!2892 0))(
  ( (Nil!2889) (Cons!2888 (h!3530 (_ BitVec 64)) (t!7823 List!2892)) )
))
(declare-fun arrayNoDuplicates!0 (array!9563 (_ BitVec 32) List!2892) Bool)

(assert (=> b!206394 (= res!99970 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2889))))

(declare-fun b!206395 () Bool)

(declare-fun e!134898 () Bool)

(assert (=> b!206395 (= e!134899 e!134898)))

(declare-fun res!99968 () Bool)

(assert (=> b!206395 (=> res!99968 e!134898)))

(assert (=> b!206395 (= res!99968 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105527 () ListLongMap!2913)

(assert (=> b!206395 (= lt!105526 lt!105527)))

(declare-fun lt!105523 () tuple2!4000)

(assert (=> b!206395 (= lt!105527 (+!499 lt!105522 lt!105523))))

(declare-fun lt!105529 () ListLongMap!2913)

(assert (=> b!206395 (= lt!105531 lt!105529)))

(assert (=> b!206395 (= lt!105529 (+!499 lt!105525 lt!105523))))

(assert (=> b!206395 (= lt!105531 (+!499 lt!105520 lt!105523))))

(assert (=> b!206395 (= lt!105523 (tuple2!4001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206396 () Bool)

(declare-fun res!99976 () Bool)

(assert (=> b!206396 (=> (not res!99976) (not e!134901))))

(assert (=> b!206396 (= res!99976 (= (select (arr!4532 _keys!825) i!601) k0!843))))

(declare-fun res!99969 () Bool)

(assert (=> start!20660 (=> (not res!99969) (not e!134901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20660 (= res!99969 (validMask!0 mask!1149))))

(assert (=> start!20660 e!134901))

(declare-fun array_inv!2997 (array!9561) Bool)

(assert (=> start!20660 (and (array_inv!2997 _values!649) e!134902)))

(assert (=> start!20660 true))

(assert (=> start!20660 tp_is_empty!5175))

(declare-fun array_inv!2998 (array!9563) Bool)

(assert (=> start!20660 (array_inv!2998 _keys!825)))

(assert (=> start!20660 tp!18989))

(declare-fun mapIsEmpty!8831 () Bool)

(assert (=> mapIsEmpty!8831 mapRes!8831))

(declare-fun b!206397 () Bool)

(assert (=> b!206397 (= e!134903 tp_is_empty!5175)))

(declare-fun b!206398 () Bool)

(assert (=> b!206398 (= e!134898 (bvsle #b00000000000000000000000000000000 (size!4857 _keys!825)))))

(assert (=> b!206398 (= lt!105529 (+!499 lt!105527 lt!105524))))

(declare-fun lt!105530 () Unit!6286)

(declare-fun addCommutativeForDiffKeys!197 (ListLongMap!2913 (_ BitVec 64) V!6547 (_ BitVec 64) V!6547) Unit!6286)

(assert (=> b!206398 (= lt!105530 (addCommutativeForDiffKeys!197 lt!105522 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206399 () Bool)

(declare-fun res!99972 () Bool)

(assert (=> b!206399 (=> (not res!99972) (not e!134901))))

(assert (=> b!206399 (= res!99972 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4857 _keys!825))))))

(assert (= (and start!20660 res!99969) b!206393))

(assert (= (and b!206393 res!99975) b!206391))

(assert (= (and b!206391 res!99973) b!206394))

(assert (= (and b!206394 res!99970) b!206399))

(assert (= (and b!206399 res!99972) b!206389))

(assert (= (and b!206389 res!99974) b!206396))

(assert (= (and b!206396 res!99976) b!206388))

(assert (= (and b!206388 (not res!99971)) b!206395))

(assert (= (and b!206395 (not res!99968)) b!206398))

(assert (= (and b!206392 condMapEmpty!8831) mapIsEmpty!8831))

(assert (= (and b!206392 (not condMapEmpty!8831)) mapNonEmpty!8831))

(get-info :version)

(assert (= (and mapNonEmpty!8831 ((_ is ValueCellFull!2244) mapValue!8831)) b!206390))

(assert (= (and b!206392 ((_ is ValueCellFull!2244) mapDefault!8831)) b!206397))

(assert (= start!20660 b!206392))

(declare-fun m!234119 () Bool)

(assert (=> start!20660 m!234119))

(declare-fun m!234121 () Bool)

(assert (=> start!20660 m!234121))

(declare-fun m!234123 () Bool)

(assert (=> start!20660 m!234123))

(declare-fun m!234125 () Bool)

(assert (=> b!206394 m!234125))

(declare-fun m!234127 () Bool)

(assert (=> b!206398 m!234127))

(declare-fun m!234129 () Bool)

(assert (=> b!206398 m!234129))

(declare-fun m!234131 () Bool)

(assert (=> mapNonEmpty!8831 m!234131))

(declare-fun m!234133 () Bool)

(assert (=> b!206391 m!234133))

(declare-fun m!234135 () Bool)

(assert (=> b!206388 m!234135))

(declare-fun m!234137 () Bool)

(assert (=> b!206388 m!234137))

(declare-fun m!234139 () Bool)

(assert (=> b!206388 m!234139))

(declare-fun m!234141 () Bool)

(assert (=> b!206388 m!234141))

(declare-fun m!234143 () Bool)

(assert (=> b!206388 m!234143))

(declare-fun m!234145 () Bool)

(assert (=> b!206388 m!234145))

(declare-fun m!234147 () Bool)

(assert (=> b!206388 m!234147))

(declare-fun m!234149 () Bool)

(assert (=> b!206395 m!234149))

(declare-fun m!234151 () Bool)

(assert (=> b!206395 m!234151))

(declare-fun m!234153 () Bool)

(assert (=> b!206395 m!234153))

(declare-fun m!234155 () Bool)

(assert (=> b!206389 m!234155))

(declare-fun m!234157 () Bool)

(assert (=> b!206396 m!234157))

(check-sat (not mapNonEmpty!8831) b_and!12065 (not b!206394) tp_is_empty!5175 (not b_next!5319) (not start!20660) (not b!206389) (not b!206398) (not b!206395) (not b!206391) (not b!206388))
(check-sat b_and!12065 (not b_next!5319))
