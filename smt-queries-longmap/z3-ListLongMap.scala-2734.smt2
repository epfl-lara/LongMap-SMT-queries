; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40208 () Bool)

(assert start!40208)

(declare-fun b_free!10489 () Bool)

(declare-fun b_next!10489 () Bool)

(assert (=> start!40208 (= b_free!10489 (not b_next!10489))))

(declare-fun tp!36996 () Bool)

(declare-fun b_and!18471 () Bool)

(assert (=> start!40208 (= tp!36996 b_and!18471)))

(declare-fun b!441043 () Bool)

(declare-fun e!259747 () Bool)

(assert (=> b!441043 (= e!259747 (not true))))

(declare-datatypes ((V!16627 0))(
  ( (V!16628 (val!5865 Int)) )
))
(declare-fun minValue!515 () V!16627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5477 0))(
  ( (ValueCellFull!5477 (v!8113 V!16627)) (EmptyCell!5477) )
))
(declare-datatypes ((array!27102 0))(
  ( (array!27103 (arr!13000 (Array (_ BitVec 32) ValueCell!5477)) (size!13352 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27102)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16627)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27104 0))(
  ( (array!27105 (arr!13001 (Array (_ BitVec 32) (_ BitVec 64))) (size!13353 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27104)

(declare-fun lt!202807 () array!27104)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202806 () array!27102)

(declare-fun zeroValue!515 () V!16627)

(declare-datatypes ((tuple2!7706 0))(
  ( (tuple2!7707 (_1!3864 (_ BitVec 64)) (_2!3864 V!16627)) )
))
(declare-datatypes ((List!7695 0))(
  ( (Nil!7692) (Cons!7691 (h!8547 tuple2!7706) (t!13443 List!7695)) )
))
(declare-datatypes ((ListLongMap!6621 0))(
  ( (ListLongMap!6622 (toList!3326 List!7695)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1559 (array!27104 array!27102 (_ BitVec 32) (_ BitVec 32) V!16627 V!16627 (_ BitVec 32) Int) ListLongMap!6621)

(declare-fun +!1516 (ListLongMap!6621 tuple2!7706) ListLongMap!6621)

(assert (=> b!441043 (= (getCurrentListMapNoExtraKeys!1559 lt!202807 lt!202806 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1516 (getCurrentListMapNoExtraKeys!1559 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7707 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13107 0))(
  ( (Unit!13108) )
))
(declare-fun lt!202805 () Unit!13107)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!676 (array!27104 array!27102 (_ BitVec 32) (_ BitVec 32) V!16627 V!16627 (_ BitVec 32) (_ BitVec 64) V!16627 (_ BitVec 32) Int) Unit!13107)

(assert (=> b!441043 (= lt!202805 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!676 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441044 () Bool)

(declare-fun e!259745 () Bool)

(declare-fun e!259746 () Bool)

(assert (=> b!441044 (= e!259745 e!259746)))

(declare-fun res!261030 () Bool)

(assert (=> b!441044 (=> (not res!261030) (not e!259746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27104 (_ BitVec 32)) Bool)

(assert (=> b!441044 (= res!261030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202807 mask!1025))))

(assert (=> b!441044 (= lt!202807 (array!27105 (store (arr!13001 _keys!709) i!563 k0!794) (size!13353 _keys!709)))))

(declare-fun mapIsEmpty!19083 () Bool)

(declare-fun mapRes!19083 () Bool)

(assert (=> mapIsEmpty!19083 mapRes!19083))

(declare-fun b!441045 () Bool)

(declare-fun res!261029 () Bool)

(assert (=> b!441045 (=> (not res!261029) (not e!259745))))

(assert (=> b!441045 (= res!261029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441046 () Bool)

(assert (=> b!441046 (= e!259746 e!259747)))

(declare-fun res!261031 () Bool)

(assert (=> b!441046 (=> (not res!261031) (not e!259747))))

(assert (=> b!441046 (= res!261031 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202808 () ListLongMap!6621)

(assert (=> b!441046 (= lt!202808 (getCurrentListMapNoExtraKeys!1559 lt!202807 lt!202806 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441046 (= lt!202806 (array!27103 (store (arr!13000 _values!549) i!563 (ValueCellFull!5477 v!412)) (size!13352 _values!549)))))

(declare-fun lt!202809 () ListLongMap!6621)

(assert (=> b!441046 (= lt!202809 (getCurrentListMapNoExtraKeys!1559 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441047 () Bool)

(declare-fun res!261033 () Bool)

(assert (=> b!441047 (=> (not res!261033) (not e!259745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441047 (= res!261033 (validMask!0 mask!1025))))

(declare-fun b!441048 () Bool)

(declare-fun res!261035 () Bool)

(assert (=> b!441048 (=> (not res!261035) (not e!259746))))

(assert (=> b!441048 (= res!261035 (bvsle from!863 i!563))))

(declare-fun b!441049 () Bool)

(declare-fun res!261024 () Bool)

(assert (=> b!441049 (=> (not res!261024) (not e!259745))))

(declare-datatypes ((List!7696 0))(
  ( (Nil!7693) (Cons!7692 (h!8548 (_ BitVec 64)) (t!13444 List!7696)) )
))
(declare-fun arrayNoDuplicates!0 (array!27104 (_ BitVec 32) List!7696) Bool)

(assert (=> b!441049 (= res!261024 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7693))))

(declare-fun b!441051 () Bool)

(declare-fun res!261027 () Bool)

(assert (=> b!441051 (=> (not res!261027) (not e!259745))))

(assert (=> b!441051 (= res!261027 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13353 _keys!709))))))

(declare-fun b!441052 () Bool)

(declare-fun res!261036 () Bool)

(assert (=> b!441052 (=> (not res!261036) (not e!259745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441052 (= res!261036 (validKeyInArray!0 k0!794))))

(declare-fun b!441053 () Bool)

(declare-fun res!261025 () Bool)

(assert (=> b!441053 (=> (not res!261025) (not e!259745))))

(assert (=> b!441053 (= res!261025 (or (= (select (arr!13001 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13001 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441054 () Bool)

(declare-fun e!259749 () Bool)

(declare-fun e!259750 () Bool)

(assert (=> b!441054 (= e!259749 (and e!259750 mapRes!19083))))

(declare-fun condMapEmpty!19083 () Bool)

(declare-fun mapDefault!19083 () ValueCell!5477)

(assert (=> b!441054 (= condMapEmpty!19083 (= (arr!13000 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5477)) mapDefault!19083)))))

(declare-fun b!441055 () Bool)

(declare-fun res!261028 () Bool)

(assert (=> b!441055 (=> (not res!261028) (not e!259746))))

(assert (=> b!441055 (= res!261028 (arrayNoDuplicates!0 lt!202807 #b00000000000000000000000000000000 Nil!7693))))

(declare-fun b!441056 () Bool)

(declare-fun res!261026 () Bool)

(assert (=> b!441056 (=> (not res!261026) (not e!259745))))

(assert (=> b!441056 (= res!261026 (and (= (size!13352 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13353 _keys!709) (size!13352 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441057 () Bool)

(declare-fun tp_is_empty!11641 () Bool)

(assert (=> b!441057 (= e!259750 tp_is_empty!11641)))

(declare-fun b!441058 () Bool)

(declare-fun res!261034 () Bool)

(assert (=> b!441058 (=> (not res!261034) (not e!259745))))

(declare-fun arrayContainsKey!0 (array!27104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441058 (= res!261034 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19083 () Bool)

(declare-fun tp!36995 () Bool)

(declare-fun e!259748 () Bool)

(assert (=> mapNonEmpty!19083 (= mapRes!19083 (and tp!36995 e!259748))))

(declare-fun mapRest!19083 () (Array (_ BitVec 32) ValueCell!5477))

(declare-fun mapValue!19083 () ValueCell!5477)

(declare-fun mapKey!19083 () (_ BitVec 32))

(assert (=> mapNonEmpty!19083 (= (arr!13000 _values!549) (store mapRest!19083 mapKey!19083 mapValue!19083))))

(declare-fun res!261032 () Bool)

(assert (=> start!40208 (=> (not res!261032) (not e!259745))))

(assert (=> start!40208 (= res!261032 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13353 _keys!709))))))

(assert (=> start!40208 e!259745))

(assert (=> start!40208 tp_is_empty!11641))

(assert (=> start!40208 tp!36996))

(assert (=> start!40208 true))

(declare-fun array_inv!9500 (array!27102) Bool)

(assert (=> start!40208 (and (array_inv!9500 _values!549) e!259749)))

(declare-fun array_inv!9501 (array!27104) Bool)

(assert (=> start!40208 (array_inv!9501 _keys!709)))

(declare-fun b!441050 () Bool)

(assert (=> b!441050 (= e!259748 tp_is_empty!11641)))

(assert (= (and start!40208 res!261032) b!441047))

(assert (= (and b!441047 res!261033) b!441056))

(assert (= (and b!441056 res!261026) b!441045))

(assert (= (and b!441045 res!261029) b!441049))

(assert (= (and b!441049 res!261024) b!441051))

(assert (= (and b!441051 res!261027) b!441052))

(assert (= (and b!441052 res!261036) b!441053))

(assert (= (and b!441053 res!261025) b!441058))

(assert (= (and b!441058 res!261034) b!441044))

(assert (= (and b!441044 res!261030) b!441055))

(assert (= (and b!441055 res!261028) b!441048))

(assert (= (and b!441048 res!261035) b!441046))

(assert (= (and b!441046 res!261031) b!441043))

(assert (= (and b!441054 condMapEmpty!19083) mapIsEmpty!19083))

(assert (= (and b!441054 (not condMapEmpty!19083)) mapNonEmpty!19083))

(get-info :version)

(assert (= (and mapNonEmpty!19083 ((_ is ValueCellFull!5477) mapValue!19083)) b!441050))

(assert (= (and b!441054 ((_ is ValueCellFull!5477) mapDefault!19083)) b!441057))

(assert (= start!40208 b!441054))

(declare-fun m!428219 () Bool)

(assert (=> b!441047 m!428219))

(declare-fun m!428221 () Bool)

(assert (=> b!441044 m!428221))

(declare-fun m!428223 () Bool)

(assert (=> b!441044 m!428223))

(declare-fun m!428225 () Bool)

(assert (=> b!441058 m!428225))

(declare-fun m!428227 () Bool)

(assert (=> b!441055 m!428227))

(declare-fun m!428229 () Bool)

(assert (=> b!441045 m!428229))

(declare-fun m!428231 () Bool)

(assert (=> b!441043 m!428231))

(declare-fun m!428233 () Bool)

(assert (=> b!441043 m!428233))

(assert (=> b!441043 m!428233))

(declare-fun m!428235 () Bool)

(assert (=> b!441043 m!428235))

(declare-fun m!428237 () Bool)

(assert (=> b!441043 m!428237))

(declare-fun m!428239 () Bool)

(assert (=> b!441052 m!428239))

(declare-fun m!428241 () Bool)

(assert (=> b!441049 m!428241))

(declare-fun m!428243 () Bool)

(assert (=> start!40208 m!428243))

(declare-fun m!428245 () Bool)

(assert (=> start!40208 m!428245))

(declare-fun m!428247 () Bool)

(assert (=> b!441053 m!428247))

(declare-fun m!428249 () Bool)

(assert (=> b!441046 m!428249))

(declare-fun m!428251 () Bool)

(assert (=> b!441046 m!428251))

(declare-fun m!428253 () Bool)

(assert (=> b!441046 m!428253))

(declare-fun m!428255 () Bool)

(assert (=> mapNonEmpty!19083 m!428255))

(check-sat (not b!441055) b_and!18471 (not b!441044) (not b!441046) (not b!441047) (not b!441049) (not b!441058) (not b!441043) (not b_next!10489) (not b!441052) (not b!441045) (not mapNonEmpty!19083) (not start!40208) tp_is_empty!11641)
(check-sat b_and!18471 (not b_next!10489))
