; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40602 () Bool)

(assert start!40602)

(declare-fun b_free!10627 () Bool)

(declare-fun b_next!10627 () Bool)

(assert (=> start!40602 (= b_free!10627 (not b_next!10627))))

(declare-fun tp!37700 () Bool)

(declare-fun b_and!18609 () Bool)

(assert (=> start!40602 (= tp!37700 b_and!18609)))

(declare-fun b!448006 () Bool)

(declare-fun e!262888 () Bool)

(declare-fun tp_is_empty!11965 () Bool)

(assert (=> b!448006 (= e!262888 tp_is_empty!11965)))

(declare-fun b!448007 () Bool)

(declare-fun res!266285 () Bool)

(declare-fun e!262889 () Bool)

(assert (=> b!448007 (=> (not res!266285) (not e!262889))))

(declare-datatypes ((array!27735 0))(
  ( (array!27736 (arr!13313 (Array (_ BitVec 32) (_ BitVec 64))) (size!13666 (_ BitVec 32))) )
))
(declare-fun lt!203901 () array!27735)

(declare-datatypes ((List!7974 0))(
  ( (Nil!7971) (Cons!7970 (h!8826 (_ BitVec 64)) (t!13727 List!7974)) )
))
(declare-fun arrayNoDuplicates!0 (array!27735 (_ BitVec 32) List!7974) Bool)

(assert (=> b!448007 (= res!266285 (arrayNoDuplicates!0 lt!203901 #b00000000000000000000000000000000 Nil!7971))))

(declare-fun b!448008 () Bool)

(declare-fun res!266282 () Bool)

(declare-fun e!262891 () Bool)

(assert (=> b!448008 (=> (not res!266282) (not e!262891))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448008 (= res!266282 (validKeyInArray!0 k0!794))))

(declare-fun b!448009 () Bool)

(declare-fun res!266275 () Bool)

(assert (=> b!448009 (=> (not res!266275) (not e!262891))))

(declare-fun _keys!709 () array!27735)

(assert (=> b!448009 (= res!266275 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7971))))

(declare-fun mapIsEmpty!19581 () Bool)

(declare-fun mapRes!19581 () Bool)

(assert (=> mapIsEmpty!19581 mapRes!19581))

(declare-fun b!448010 () Bool)

(declare-fun res!266278 () Bool)

(assert (=> b!448010 (=> (not res!266278) (not e!262891))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448010 (= res!266278 (or (= (select (arr!13313 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13313 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!266281 () Bool)

(assert (=> start!40602 (=> (not res!266281) (not e!262891))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40602 (= res!266281 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13666 _keys!709))))))

(assert (=> start!40602 e!262891))

(assert (=> start!40602 tp_is_empty!11965))

(assert (=> start!40602 tp!37700))

(assert (=> start!40602 true))

(declare-datatypes ((V!17059 0))(
  ( (V!17060 (val!6027 Int)) )
))
(declare-datatypes ((ValueCell!5639 0))(
  ( (ValueCellFull!5639 (v!8276 V!17059)) (EmptyCell!5639) )
))
(declare-datatypes ((array!27737 0))(
  ( (array!27738 (arr!13314 (Array (_ BitVec 32) ValueCell!5639)) (size!13667 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27737)

(declare-fun e!262890 () Bool)

(declare-fun array_inv!9702 (array!27737) Bool)

(assert (=> start!40602 (and (array_inv!9702 _values!549) e!262890)))

(declare-fun array_inv!9703 (array!27735) Bool)

(assert (=> start!40602 (array_inv!9703 _keys!709)))

(declare-fun b!448011 () Bool)

(declare-fun res!266276 () Bool)

(assert (=> b!448011 (=> (not res!266276) (not e!262891))))

(assert (=> b!448011 (= res!266276 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13666 _keys!709))))))

(declare-fun b!448012 () Bool)

(declare-fun res!266279 () Bool)

(assert (=> b!448012 (=> (not res!266279) (not e!262891))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27735 (_ BitVec 32)) Bool)

(assert (=> b!448012 (= res!266279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448013 () Bool)

(declare-fun res!266284 () Bool)

(assert (=> b!448013 (=> (not res!266284) (not e!262891))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448013 (= res!266284 (and (= (size!13667 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13666 _keys!709) (size!13667 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448014 () Bool)

(declare-fun e!262892 () Bool)

(assert (=> b!448014 (= e!262892 tp_is_empty!11965)))

(declare-fun mapNonEmpty!19581 () Bool)

(declare-fun tp!37701 () Bool)

(assert (=> mapNonEmpty!19581 (= mapRes!19581 (and tp!37701 e!262888))))

(declare-fun mapRest!19581 () (Array (_ BitVec 32) ValueCell!5639))

(declare-fun mapValue!19581 () ValueCell!5639)

(declare-fun mapKey!19581 () (_ BitVec 32))

(assert (=> mapNonEmpty!19581 (= (arr!13314 _values!549) (store mapRest!19581 mapKey!19581 mapValue!19581))))

(declare-fun b!448015 () Bool)

(declare-fun res!266277 () Bool)

(assert (=> b!448015 (=> (not res!266277) (not e!262891))))

(declare-fun arrayContainsKey!0 (array!27735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448015 (= res!266277 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448016 () Bool)

(assert (=> b!448016 (= e!262889 false)))

(declare-datatypes ((tuple2!7912 0))(
  ( (tuple2!7913 (_1!3967 (_ BitVec 64)) (_2!3967 V!17059)) )
))
(declare-datatypes ((List!7975 0))(
  ( (Nil!7972) (Cons!7971 (h!8827 tuple2!7912) (t!13728 List!7975)) )
))
(declare-datatypes ((ListLongMap!6815 0))(
  ( (ListLongMap!6816 (toList!3423 List!7975)) )
))
(declare-fun lt!203899 () ListLongMap!6815)

(declare-fun minValue!515 () V!17059)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17059)

(declare-fun v!412 () V!17059)

(declare-fun getCurrentListMapNoExtraKeys!1621 (array!27735 array!27737 (_ BitVec 32) (_ BitVec 32) V!17059 V!17059 (_ BitVec 32) Int) ListLongMap!6815)

(assert (=> b!448016 (= lt!203899 (getCurrentListMapNoExtraKeys!1621 lt!203901 (array!27738 (store (arr!13314 _values!549) i!563 (ValueCellFull!5639 v!412)) (size!13667 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203900 () ListLongMap!6815)

(assert (=> b!448016 (= lt!203900 (getCurrentListMapNoExtraKeys!1621 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448017 () Bool)

(declare-fun res!266280 () Bool)

(assert (=> b!448017 (=> (not res!266280) (not e!262889))))

(assert (=> b!448017 (= res!266280 (bvsle from!863 i!563))))

(declare-fun b!448018 () Bool)

(assert (=> b!448018 (= e!262891 e!262889)))

(declare-fun res!266283 () Bool)

(assert (=> b!448018 (=> (not res!266283) (not e!262889))))

(assert (=> b!448018 (= res!266283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203901 mask!1025))))

(assert (=> b!448018 (= lt!203901 (array!27736 (store (arr!13313 _keys!709) i!563 k0!794) (size!13666 _keys!709)))))

(declare-fun b!448019 () Bool)

(assert (=> b!448019 (= e!262890 (and e!262892 mapRes!19581))))

(declare-fun condMapEmpty!19581 () Bool)

(declare-fun mapDefault!19581 () ValueCell!5639)

(assert (=> b!448019 (= condMapEmpty!19581 (= (arr!13314 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5639)) mapDefault!19581)))))

(declare-fun b!448020 () Bool)

(declare-fun res!266286 () Bool)

(assert (=> b!448020 (=> (not res!266286) (not e!262891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448020 (= res!266286 (validMask!0 mask!1025))))

(assert (= (and start!40602 res!266281) b!448020))

(assert (= (and b!448020 res!266286) b!448013))

(assert (= (and b!448013 res!266284) b!448012))

(assert (= (and b!448012 res!266279) b!448009))

(assert (= (and b!448009 res!266275) b!448011))

(assert (= (and b!448011 res!266276) b!448008))

(assert (= (and b!448008 res!266282) b!448010))

(assert (= (and b!448010 res!266278) b!448015))

(assert (= (and b!448015 res!266277) b!448018))

(assert (= (and b!448018 res!266283) b!448007))

(assert (= (and b!448007 res!266285) b!448017))

(assert (= (and b!448017 res!266280) b!448016))

(assert (= (and b!448019 condMapEmpty!19581) mapIsEmpty!19581))

(assert (= (and b!448019 (not condMapEmpty!19581)) mapNonEmpty!19581))

(get-info :version)

(assert (= (and mapNonEmpty!19581 ((_ is ValueCellFull!5639) mapValue!19581)) b!448006))

(assert (= (and b!448019 ((_ is ValueCellFull!5639) mapDefault!19581)) b!448014))

(assert (= start!40602 b!448019))

(declare-fun m!432151 () Bool)

(assert (=> b!448009 m!432151))

(declare-fun m!432153 () Bool)

(assert (=> b!448020 m!432153))

(declare-fun m!432155 () Bool)

(assert (=> b!448010 m!432155))

(declare-fun m!432157 () Bool)

(assert (=> b!448012 m!432157))

(declare-fun m!432159 () Bool)

(assert (=> b!448018 m!432159))

(declare-fun m!432161 () Bool)

(assert (=> b!448018 m!432161))

(declare-fun m!432163 () Bool)

(assert (=> b!448007 m!432163))

(declare-fun m!432165 () Bool)

(assert (=> b!448016 m!432165))

(declare-fun m!432167 () Bool)

(assert (=> b!448016 m!432167))

(declare-fun m!432169 () Bool)

(assert (=> b!448016 m!432169))

(declare-fun m!432171 () Bool)

(assert (=> b!448015 m!432171))

(declare-fun m!432173 () Bool)

(assert (=> mapNonEmpty!19581 m!432173))

(declare-fun m!432175 () Bool)

(assert (=> b!448008 m!432175))

(declare-fun m!432177 () Bool)

(assert (=> start!40602 m!432177))

(declare-fun m!432179 () Bool)

(assert (=> start!40602 m!432179))

(check-sat (not mapNonEmpty!19581) (not b!448018) b_and!18609 (not b!448008) (not b!448007) (not b!448009) (not start!40602) (not b!448012) (not b!448015) tp_is_empty!11965 (not b!448020) (not b!448016) (not b_next!10627))
(check-sat b_and!18609 (not b_next!10627))
