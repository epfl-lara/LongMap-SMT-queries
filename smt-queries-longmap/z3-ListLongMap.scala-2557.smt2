; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39146 () Bool)

(assert start!39146)

(declare-fun b_free!9427 () Bool)

(declare-fun b_next!9427 () Bool)

(assert (=> start!39146 (= b_free!9427 (not b_next!9427))))

(declare-fun tp!33810 () Bool)

(declare-fun b_and!16787 () Bool)

(assert (=> start!39146 (= tp!33810 b_and!16787)))

(declare-fun b!411941 () Bool)

(declare-fun res!239179 () Bool)

(declare-fun e!246542 () Bool)

(assert (=> b!411941 (=> (not res!239179) (not e!246542))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411941 (= res!239179 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17490 () Bool)

(declare-fun mapRes!17490 () Bool)

(assert (=> mapIsEmpty!17490 mapRes!17490))

(declare-fun mapNonEmpty!17490 () Bool)

(declare-fun tp!33809 () Bool)

(declare-fun e!246546 () Bool)

(assert (=> mapNonEmpty!17490 (= mapRes!17490 (and tp!33809 e!246546))))

(declare-datatypes ((V!15211 0))(
  ( (V!15212 (val!5334 Int)) )
))
(declare-datatypes ((ValueCell!4946 0))(
  ( (ValueCellFull!4946 (v!7575 V!15211)) (EmptyCell!4946) )
))
(declare-fun mapRest!17490 () (Array (_ BitVec 32) ValueCell!4946))

(declare-datatypes ((array!25009 0))(
  ( (array!25010 (arr!11954 (Array (_ BitVec 32) ValueCell!4946)) (size!12307 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25009)

(declare-fun mapKey!17490 () (_ BitVec 32))

(declare-fun mapValue!17490 () ValueCell!4946)

(assert (=> mapNonEmpty!17490 (= (arr!11954 _values!549) (store mapRest!17490 mapKey!17490 mapValue!17490))))

(declare-fun b!411943 () Bool)

(declare-fun res!239183 () Bool)

(declare-fun e!246545 () Bool)

(assert (=> b!411943 (=> (not res!239183) (not e!246545))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411943 (= res!239183 (bvsle from!863 i!563))))

(declare-fun b!411944 () Bool)

(declare-fun res!239181 () Bool)

(assert (=> b!411944 (=> (not res!239181) (not e!246542))))

(declare-datatypes ((array!25011 0))(
  ( (array!25012 (arr!11955 (Array (_ BitVec 32) (_ BitVec 64))) (size!12308 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25011)

(declare-fun arrayContainsKey!0 (array!25011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411944 (= res!239181 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411945 () Bool)

(declare-fun res!239182 () Bool)

(assert (=> b!411945 (=> (not res!239182) (not e!246542))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411945 (= res!239182 (validMask!0 mask!1025))))

(declare-fun b!411946 () Bool)

(declare-fun res!239186 () Bool)

(assert (=> b!411946 (=> (not res!239186) (not e!246542))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411946 (= res!239186 (and (= (size!12307 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12308 _keys!709) (size!12307 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411947 () Bool)

(assert (=> b!411947 (= e!246545 false)))

(declare-fun minValue!515 () V!15211)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6904 0))(
  ( (tuple2!6905 (_1!3463 (_ BitVec 64)) (_2!3463 V!15211)) )
))
(declare-datatypes ((List!6918 0))(
  ( (Nil!6915) (Cons!6914 (h!7770 tuple2!6904) (t!12083 List!6918)) )
))
(declare-datatypes ((ListLongMap!5807 0))(
  ( (ListLongMap!5808 (toList!2919 List!6918)) )
))
(declare-fun lt!189201 () ListLongMap!5807)

(declare-fun zeroValue!515 () V!15211)

(declare-fun lt!189202 () array!25011)

(declare-fun v!412 () V!15211)

(declare-fun getCurrentListMapNoExtraKeys!1133 (array!25011 array!25009 (_ BitVec 32) (_ BitVec 32) V!15211 V!15211 (_ BitVec 32) Int) ListLongMap!5807)

(assert (=> b!411947 (= lt!189201 (getCurrentListMapNoExtraKeys!1133 lt!189202 (array!25010 (store (arr!11954 _values!549) i!563 (ValueCellFull!4946 v!412)) (size!12307 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189203 () ListLongMap!5807)

(assert (=> b!411947 (= lt!189203 (getCurrentListMapNoExtraKeys!1133 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411948 () Bool)

(declare-fun res!239184 () Bool)

(assert (=> b!411948 (=> (not res!239184) (not e!246542))))

(assert (=> b!411948 (= res!239184 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12308 _keys!709))))))

(declare-fun b!411949 () Bool)

(assert (=> b!411949 (= e!246542 e!246545)))

(declare-fun res!239185 () Bool)

(assert (=> b!411949 (=> (not res!239185) (not e!246545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25011 (_ BitVec 32)) Bool)

(assert (=> b!411949 (= res!239185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189202 mask!1025))))

(assert (=> b!411949 (= lt!189202 (array!25012 (store (arr!11955 _keys!709) i!563 k0!794) (size!12308 _keys!709)))))

(declare-fun res!239189 () Bool)

(assert (=> start!39146 (=> (not res!239189) (not e!246542))))

(assert (=> start!39146 (= res!239189 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12308 _keys!709))))))

(assert (=> start!39146 e!246542))

(declare-fun tp_is_empty!10579 () Bool)

(assert (=> start!39146 tp_is_empty!10579))

(assert (=> start!39146 tp!33810))

(assert (=> start!39146 true))

(declare-fun e!246544 () Bool)

(declare-fun array_inv!8772 (array!25009) Bool)

(assert (=> start!39146 (and (array_inv!8772 _values!549) e!246544)))

(declare-fun array_inv!8773 (array!25011) Bool)

(assert (=> start!39146 (array_inv!8773 _keys!709)))

(declare-fun b!411942 () Bool)

(assert (=> b!411942 (= e!246546 tp_is_empty!10579)))

(declare-fun b!411950 () Bool)

(declare-fun res!239188 () Bool)

(assert (=> b!411950 (=> (not res!239188) (not e!246545))))

(declare-datatypes ((List!6919 0))(
  ( (Nil!6916) (Cons!6915 (h!7771 (_ BitVec 64)) (t!12084 List!6919)) )
))
(declare-fun arrayNoDuplicates!0 (array!25011 (_ BitVec 32) List!6919) Bool)

(assert (=> b!411950 (= res!239188 (arrayNoDuplicates!0 lt!189202 #b00000000000000000000000000000000 Nil!6916))))

(declare-fun b!411951 () Bool)

(declare-fun res!239187 () Bool)

(assert (=> b!411951 (=> (not res!239187) (not e!246542))))

(assert (=> b!411951 (= res!239187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411952 () Bool)

(declare-fun res!239190 () Bool)

(assert (=> b!411952 (=> (not res!239190) (not e!246542))))

(assert (=> b!411952 (= res!239190 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6916))))

(declare-fun b!411953 () Bool)

(declare-fun e!246541 () Bool)

(assert (=> b!411953 (= e!246544 (and e!246541 mapRes!17490))))

(declare-fun condMapEmpty!17490 () Bool)

(declare-fun mapDefault!17490 () ValueCell!4946)

(assert (=> b!411953 (= condMapEmpty!17490 (= (arr!11954 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4946)) mapDefault!17490)))))

(declare-fun b!411954 () Bool)

(assert (=> b!411954 (= e!246541 tp_is_empty!10579)))

(declare-fun b!411955 () Bool)

(declare-fun res!239180 () Bool)

(assert (=> b!411955 (=> (not res!239180) (not e!246542))))

(assert (=> b!411955 (= res!239180 (or (= (select (arr!11955 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11955 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39146 res!239189) b!411945))

(assert (= (and b!411945 res!239182) b!411946))

(assert (= (and b!411946 res!239186) b!411951))

(assert (= (and b!411951 res!239187) b!411952))

(assert (= (and b!411952 res!239190) b!411948))

(assert (= (and b!411948 res!239184) b!411941))

(assert (= (and b!411941 res!239179) b!411955))

(assert (= (and b!411955 res!239180) b!411944))

(assert (= (and b!411944 res!239181) b!411949))

(assert (= (and b!411949 res!239185) b!411950))

(assert (= (and b!411950 res!239188) b!411943))

(assert (= (and b!411943 res!239183) b!411947))

(assert (= (and b!411953 condMapEmpty!17490) mapIsEmpty!17490))

(assert (= (and b!411953 (not condMapEmpty!17490)) mapNonEmpty!17490))

(get-info :version)

(assert (= (and mapNonEmpty!17490 ((_ is ValueCellFull!4946) mapValue!17490)) b!411942))

(assert (= (and b!411953 ((_ is ValueCellFull!4946) mapDefault!17490)) b!411954))

(assert (= start!39146 b!411953))

(declare-fun m!401379 () Bool)

(assert (=> b!411949 m!401379))

(declare-fun m!401381 () Bool)

(assert (=> b!411949 m!401381))

(declare-fun m!401383 () Bool)

(assert (=> b!411951 m!401383))

(declare-fun m!401385 () Bool)

(assert (=> b!411955 m!401385))

(declare-fun m!401387 () Bool)

(assert (=> b!411947 m!401387))

(declare-fun m!401389 () Bool)

(assert (=> b!411947 m!401389))

(declare-fun m!401391 () Bool)

(assert (=> b!411947 m!401391))

(declare-fun m!401393 () Bool)

(assert (=> mapNonEmpty!17490 m!401393))

(declare-fun m!401395 () Bool)

(assert (=> b!411950 m!401395))

(declare-fun m!401397 () Bool)

(assert (=> b!411952 m!401397))

(declare-fun m!401399 () Bool)

(assert (=> b!411944 m!401399))

(declare-fun m!401401 () Bool)

(assert (=> b!411945 m!401401))

(declare-fun m!401403 () Bool)

(assert (=> b!411941 m!401403))

(declare-fun m!401405 () Bool)

(assert (=> start!39146 m!401405))

(declare-fun m!401407 () Bool)

(assert (=> start!39146 m!401407))

(check-sat (not b!411949) (not start!39146) (not b_next!9427) (not b!411950) (not b!411951) (not b!411941) b_and!16787 (not mapNonEmpty!17490) (not b!411945) (not b!411944) (not b!411947) tp_is_empty!10579 (not b!411952))
(check-sat b_and!16787 (not b_next!9427))
