; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40608 () Bool)

(assert start!40608)

(declare-fun b_free!10633 () Bool)

(declare-fun b_next!10633 () Bool)

(assert (=> start!40608 (= b_free!10633 (not b_next!10633))))

(declare-fun tp!37719 () Bool)

(declare-fun b_and!18615 () Bool)

(assert (=> start!40608 (= tp!37719 b_and!18615)))

(declare-fun b!448141 () Bool)

(declare-fun e!262941 () Bool)

(declare-fun e!262945 () Bool)

(declare-fun mapRes!19590 () Bool)

(assert (=> b!448141 (= e!262941 (and e!262945 mapRes!19590))))

(declare-fun condMapEmpty!19590 () Bool)

(declare-datatypes ((V!17067 0))(
  ( (V!17068 (val!6030 Int)) )
))
(declare-datatypes ((ValueCell!5642 0))(
  ( (ValueCellFull!5642 (v!8279 V!17067)) (EmptyCell!5642) )
))
(declare-datatypes ((array!27747 0))(
  ( (array!27748 (arr!13319 (Array (_ BitVec 32) ValueCell!5642)) (size!13672 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27747)

(declare-fun mapDefault!19590 () ValueCell!5642)

(assert (=> b!448141 (= condMapEmpty!19590 (= (arr!13319 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5642)) mapDefault!19590)))))

(declare-fun b!448142 () Bool)

(declare-fun res!266385 () Bool)

(declare-fun e!262946 () Bool)

(assert (=> b!448142 (=> (not res!266385) (not e!262946))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448142 (= res!266385 (bvsle from!863 i!563))))

(declare-fun b!448143 () Bool)

(declare-fun res!266383 () Bool)

(declare-fun e!262943 () Bool)

(assert (=> b!448143 (=> (not res!266383) (not e!262943))))

(declare-datatypes ((array!27749 0))(
  ( (array!27750 (arr!13320 (Array (_ BitVec 32) (_ BitVec 64))) (size!13673 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27749)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!448143 (= res!266383 (and (= (size!13672 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13673 _keys!709) (size!13672 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19590 () Bool)

(assert (=> mapIsEmpty!19590 mapRes!19590))

(declare-fun b!448144 () Bool)

(declare-fun res!266394 () Bool)

(assert (=> b!448144 (=> (not res!266394) (not e!262943))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448144 (= res!266394 (validKeyInArray!0 k0!794))))

(declare-fun b!448145 () Bool)

(declare-fun res!266386 () Bool)

(assert (=> b!448145 (=> (not res!266386) (not e!262943))))

(assert (=> b!448145 (= res!266386 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13673 _keys!709))))))

(declare-fun b!448146 () Bool)

(declare-fun e!262942 () Bool)

(declare-fun tp_is_empty!11971 () Bool)

(assert (=> b!448146 (= e!262942 tp_is_empty!11971)))

(declare-fun mapNonEmpty!19590 () Bool)

(declare-fun tp!37718 () Bool)

(assert (=> mapNonEmpty!19590 (= mapRes!19590 (and tp!37718 e!262942))))

(declare-fun mapValue!19590 () ValueCell!5642)

(declare-fun mapRest!19590 () (Array (_ BitVec 32) ValueCell!5642))

(declare-fun mapKey!19590 () (_ BitVec 32))

(assert (=> mapNonEmpty!19590 (= (arr!13319 _values!549) (store mapRest!19590 mapKey!19590 mapValue!19590))))

(declare-fun b!448147 () Bool)

(declare-fun res!266390 () Bool)

(assert (=> b!448147 (=> (not res!266390) (not e!262943))))

(declare-datatypes ((List!7979 0))(
  ( (Nil!7976) (Cons!7975 (h!8831 (_ BitVec 64)) (t!13732 List!7979)) )
))
(declare-fun arrayNoDuplicates!0 (array!27749 (_ BitVec 32) List!7979) Bool)

(assert (=> b!448147 (= res!266390 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7976))))

(declare-fun b!448148 () Bool)

(assert (=> b!448148 (= e!262943 e!262946)))

(declare-fun res!266388 () Bool)

(assert (=> b!448148 (=> (not res!266388) (not e!262946))))

(declare-fun lt!203927 () array!27749)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27749 (_ BitVec 32)) Bool)

(assert (=> b!448148 (= res!266388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203927 mask!1025))))

(assert (=> b!448148 (= lt!203927 (array!27750 (store (arr!13320 _keys!709) i!563 k0!794) (size!13673 _keys!709)))))

(declare-fun b!448149 () Bool)

(declare-fun res!266389 () Bool)

(assert (=> b!448149 (=> (not res!266389) (not e!262943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448149 (= res!266389 (validMask!0 mask!1025))))

(declare-fun b!448150 () Bool)

(declare-fun res!266393 () Bool)

(assert (=> b!448150 (=> (not res!266393) (not e!262943))))

(assert (=> b!448150 (= res!266393 (or (= (select (arr!13320 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13320 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448151 () Bool)

(assert (=> b!448151 (= e!262945 tp_is_empty!11971)))

(declare-fun res!266384 () Bool)

(assert (=> start!40608 (=> (not res!266384) (not e!262943))))

(assert (=> start!40608 (= res!266384 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13673 _keys!709))))))

(assert (=> start!40608 e!262943))

(assert (=> start!40608 tp_is_empty!11971))

(assert (=> start!40608 tp!37719))

(assert (=> start!40608 true))

(declare-fun array_inv!9708 (array!27747) Bool)

(assert (=> start!40608 (and (array_inv!9708 _values!549) e!262941)))

(declare-fun array_inv!9709 (array!27749) Bool)

(assert (=> start!40608 (array_inv!9709 _keys!709)))

(declare-fun b!448152 () Bool)

(assert (=> b!448152 (= e!262946 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17067)

(declare-datatypes ((tuple2!7916 0))(
  ( (tuple2!7917 (_1!3969 (_ BitVec 64)) (_2!3969 V!17067)) )
))
(declare-datatypes ((List!7980 0))(
  ( (Nil!7977) (Cons!7976 (h!8832 tuple2!7916) (t!13733 List!7980)) )
))
(declare-datatypes ((ListLongMap!6819 0))(
  ( (ListLongMap!6820 (toList!3425 List!7980)) )
))
(declare-fun lt!203926 () ListLongMap!6819)

(declare-fun v!412 () V!17067)

(declare-fun minValue!515 () V!17067)

(declare-fun getCurrentListMapNoExtraKeys!1623 (array!27749 array!27747 (_ BitVec 32) (_ BitVec 32) V!17067 V!17067 (_ BitVec 32) Int) ListLongMap!6819)

(assert (=> b!448152 (= lt!203926 (getCurrentListMapNoExtraKeys!1623 lt!203927 (array!27748 (store (arr!13319 _values!549) i!563 (ValueCellFull!5642 v!412)) (size!13672 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203928 () ListLongMap!6819)

(assert (=> b!448152 (= lt!203928 (getCurrentListMapNoExtraKeys!1623 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448153 () Bool)

(declare-fun res!266387 () Bool)

(assert (=> b!448153 (=> (not res!266387) (not e!262943))))

(assert (=> b!448153 (= res!266387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448154 () Bool)

(declare-fun res!266391 () Bool)

(assert (=> b!448154 (=> (not res!266391) (not e!262943))))

(declare-fun arrayContainsKey!0 (array!27749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448154 (= res!266391 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448155 () Bool)

(declare-fun res!266392 () Bool)

(assert (=> b!448155 (=> (not res!266392) (not e!262946))))

(assert (=> b!448155 (= res!266392 (arrayNoDuplicates!0 lt!203927 #b00000000000000000000000000000000 Nil!7976))))

(assert (= (and start!40608 res!266384) b!448149))

(assert (= (and b!448149 res!266389) b!448143))

(assert (= (and b!448143 res!266383) b!448153))

(assert (= (and b!448153 res!266387) b!448147))

(assert (= (and b!448147 res!266390) b!448145))

(assert (= (and b!448145 res!266386) b!448144))

(assert (= (and b!448144 res!266394) b!448150))

(assert (= (and b!448150 res!266393) b!448154))

(assert (= (and b!448154 res!266391) b!448148))

(assert (= (and b!448148 res!266388) b!448155))

(assert (= (and b!448155 res!266392) b!448142))

(assert (= (and b!448142 res!266385) b!448152))

(assert (= (and b!448141 condMapEmpty!19590) mapIsEmpty!19590))

(assert (= (and b!448141 (not condMapEmpty!19590)) mapNonEmpty!19590))

(get-info :version)

(assert (= (and mapNonEmpty!19590 ((_ is ValueCellFull!5642) mapValue!19590)) b!448146))

(assert (= (and b!448141 ((_ is ValueCellFull!5642) mapDefault!19590)) b!448151))

(assert (= start!40608 b!448141))

(declare-fun m!432241 () Bool)

(assert (=> b!448144 m!432241))

(declare-fun m!432243 () Bool)

(assert (=> b!448155 m!432243))

(declare-fun m!432245 () Bool)

(assert (=> b!448148 m!432245))

(declare-fun m!432247 () Bool)

(assert (=> b!448148 m!432247))

(declare-fun m!432249 () Bool)

(assert (=> mapNonEmpty!19590 m!432249))

(declare-fun m!432251 () Bool)

(assert (=> start!40608 m!432251))

(declare-fun m!432253 () Bool)

(assert (=> start!40608 m!432253))

(declare-fun m!432255 () Bool)

(assert (=> b!448152 m!432255))

(declare-fun m!432257 () Bool)

(assert (=> b!448152 m!432257))

(declare-fun m!432259 () Bool)

(assert (=> b!448152 m!432259))

(declare-fun m!432261 () Bool)

(assert (=> b!448150 m!432261))

(declare-fun m!432263 () Bool)

(assert (=> b!448154 m!432263))

(declare-fun m!432265 () Bool)

(assert (=> b!448153 m!432265))

(declare-fun m!432267 () Bool)

(assert (=> b!448147 m!432267))

(declare-fun m!432269 () Bool)

(assert (=> b!448149 m!432269))

(check-sat tp_is_empty!11971 (not mapNonEmpty!19590) (not b!448147) (not start!40608) (not b!448148) (not b!448153) b_and!18615 (not b!448154) (not b!448149) (not b!448152) (not b!448144) (not b_next!10633) (not b!448155))
(check-sat b_and!18615 (not b_next!10633))
