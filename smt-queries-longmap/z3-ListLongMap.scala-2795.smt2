; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40660 () Bool)

(assert start!40660)

(declare-fun b_free!10671 () Bool)

(declare-fun b_next!10671 () Bool)

(assert (=> start!40660 (= b_free!10671 (not b_next!10671))))

(declare-fun tp!37833 () Bool)

(declare-fun b_and!18679 () Bool)

(assert (=> start!40660 (= tp!37833 b_and!18679)))

(declare-fun mapNonEmpty!19647 () Bool)

(declare-fun mapRes!19647 () Bool)

(declare-fun tp!37832 () Bool)

(declare-fun e!263460 () Bool)

(assert (=> mapNonEmpty!19647 (= mapRes!19647 (and tp!37832 e!263460))))

(declare-datatypes ((V!17117 0))(
  ( (V!17118 (val!6049 Int)) )
))
(declare-datatypes ((ValueCell!5661 0))(
  ( (ValueCellFull!5661 (v!8304 V!17117)) (EmptyCell!5661) )
))
(declare-datatypes ((array!27825 0))(
  ( (array!27826 (arr!13358 (Array (_ BitVec 32) ValueCell!5661)) (size!13710 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27825)

(declare-fun mapValue!19647 () ValueCell!5661)

(declare-fun mapKey!19647 () (_ BitVec 32))

(declare-fun mapRest!19647 () (Array (_ BitVec 32) ValueCell!5661))

(assert (=> mapNonEmpty!19647 (= (arr!13358 _values!549) (store mapRest!19647 mapKey!19647 mapValue!19647))))

(declare-fun b!449268 () Bool)

(declare-fun e!263457 () Bool)

(declare-fun e!263462 () Bool)

(assert (=> b!449268 (= e!263457 e!263462)))

(declare-fun res!267196 () Bool)

(assert (=> b!449268 (=> (not res!267196) (not e!263462))))

(declare-datatypes ((array!27827 0))(
  ( (array!27828 (arr!13359 (Array (_ BitVec 32) (_ BitVec 64))) (size!13711 (_ BitVec 32))) )
))
(declare-fun lt!204332 () array!27827)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27827 (_ BitVec 32)) Bool)

(assert (=> b!449268 (= res!267196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204332 mask!1025))))

(declare-fun _keys!709 () array!27827)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449268 (= lt!204332 (array!27828 (store (arr!13359 _keys!709) i!563 k0!794) (size!13711 _keys!709)))))

(declare-fun b!449269 () Bool)

(declare-fun res!267200 () Bool)

(assert (=> b!449269 (=> (not res!267200) (not e!263457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449269 (= res!267200 (validMask!0 mask!1025))))

(declare-fun b!449270 () Bool)

(declare-fun res!267199 () Bool)

(assert (=> b!449270 (=> (not res!267199) (not e!263457))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449270 (= res!267199 (and (= (size!13710 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13711 _keys!709) (size!13710 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449271 () Bool)

(declare-fun e!263459 () Bool)

(declare-fun e!263458 () Bool)

(assert (=> b!449271 (= e!263459 (and e!263458 mapRes!19647))))

(declare-fun condMapEmpty!19647 () Bool)

(declare-fun mapDefault!19647 () ValueCell!5661)

(assert (=> b!449271 (= condMapEmpty!19647 (= (arr!13358 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5661)) mapDefault!19647)))))

(declare-fun b!449272 () Bool)

(declare-fun res!267201 () Bool)

(assert (=> b!449272 (=> (not res!267201) (not e!263457))))

(assert (=> b!449272 (= res!267201 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13711 _keys!709))))))

(declare-fun b!449273 () Bool)

(declare-fun tp_is_empty!12009 () Bool)

(assert (=> b!449273 (= e!263458 tp_is_empty!12009)))

(declare-fun b!449274 () Bool)

(assert (=> b!449274 (= e!263460 tp_is_empty!12009)))

(declare-fun b!449275 () Bool)

(declare-fun res!267197 () Bool)

(assert (=> b!449275 (=> (not res!267197) (not e!263457))))

(assert (=> b!449275 (= res!267197 (or (= (select (arr!13359 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13359 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449276 () Bool)

(assert (=> b!449276 (= e!263462 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17117)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17117)

(declare-fun v!412 () V!17117)

(declare-datatypes ((tuple2!7942 0))(
  ( (tuple2!7943 (_1!3982 (_ BitVec 64)) (_2!3982 V!17117)) )
))
(declare-datatypes ((List!8007 0))(
  ( (Nil!8004) (Cons!8003 (h!8859 tuple2!7942) (t!13769 List!8007)) )
))
(declare-datatypes ((ListLongMap!6855 0))(
  ( (ListLongMap!6856 (toList!3443 List!8007)) )
))
(declare-fun lt!204331 () ListLongMap!6855)

(declare-fun getCurrentListMapNoExtraKeys!1629 (array!27827 array!27825 (_ BitVec 32) (_ BitVec 32) V!17117 V!17117 (_ BitVec 32) Int) ListLongMap!6855)

(assert (=> b!449276 (= lt!204331 (getCurrentListMapNoExtraKeys!1629 lt!204332 (array!27826 (store (arr!13358 _values!549) i!563 (ValueCellFull!5661 v!412)) (size!13710 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204333 () ListLongMap!6855)

(assert (=> b!449276 (= lt!204333 (getCurrentListMapNoExtraKeys!1629 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449277 () Bool)

(declare-fun res!267204 () Bool)

(assert (=> b!449277 (=> (not res!267204) (not e!263457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449277 (= res!267204 (validKeyInArray!0 k0!794))))

(declare-fun b!449278 () Bool)

(declare-fun res!267207 () Bool)

(assert (=> b!449278 (=> (not res!267207) (not e!263462))))

(declare-datatypes ((List!8008 0))(
  ( (Nil!8005) (Cons!8004 (h!8860 (_ BitVec 64)) (t!13770 List!8008)) )
))
(declare-fun arrayNoDuplicates!0 (array!27827 (_ BitVec 32) List!8008) Bool)

(assert (=> b!449278 (= res!267207 (arrayNoDuplicates!0 lt!204332 #b00000000000000000000000000000000 Nil!8005))))

(declare-fun b!449279 () Bool)

(declare-fun res!267203 () Bool)

(assert (=> b!449279 (=> (not res!267203) (not e!263457))))

(assert (=> b!449279 (= res!267203 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8005))))

(declare-fun mapIsEmpty!19647 () Bool)

(assert (=> mapIsEmpty!19647 mapRes!19647))

(declare-fun b!449267 () Bool)

(declare-fun res!267198 () Bool)

(assert (=> b!449267 (=> (not res!267198) (not e!263462))))

(assert (=> b!449267 (= res!267198 (bvsle from!863 i!563))))

(declare-fun res!267202 () Bool)

(assert (=> start!40660 (=> (not res!267202) (not e!263457))))

(assert (=> start!40660 (= res!267202 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13711 _keys!709))))))

(assert (=> start!40660 e!263457))

(assert (=> start!40660 tp_is_empty!12009))

(assert (=> start!40660 tp!37833))

(assert (=> start!40660 true))

(declare-fun array_inv!9682 (array!27825) Bool)

(assert (=> start!40660 (and (array_inv!9682 _values!549) e!263459)))

(declare-fun array_inv!9683 (array!27827) Bool)

(assert (=> start!40660 (array_inv!9683 _keys!709)))

(declare-fun b!449280 () Bool)

(declare-fun res!267206 () Bool)

(assert (=> b!449280 (=> (not res!267206) (not e!263457))))

(declare-fun arrayContainsKey!0 (array!27827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449280 (= res!267206 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449281 () Bool)

(declare-fun res!267205 () Bool)

(assert (=> b!449281 (=> (not res!267205) (not e!263457))))

(assert (=> b!449281 (= res!267205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40660 res!267202) b!449269))

(assert (= (and b!449269 res!267200) b!449270))

(assert (= (and b!449270 res!267199) b!449281))

(assert (= (and b!449281 res!267205) b!449279))

(assert (= (and b!449279 res!267203) b!449272))

(assert (= (and b!449272 res!267201) b!449277))

(assert (= (and b!449277 res!267204) b!449275))

(assert (= (and b!449275 res!267197) b!449280))

(assert (= (and b!449280 res!267206) b!449268))

(assert (= (and b!449268 res!267196) b!449278))

(assert (= (and b!449278 res!267207) b!449267))

(assert (= (and b!449267 res!267198) b!449276))

(assert (= (and b!449271 condMapEmpty!19647) mapIsEmpty!19647))

(assert (= (and b!449271 (not condMapEmpty!19647)) mapNonEmpty!19647))

(get-info :version)

(assert (= (and mapNonEmpty!19647 ((_ is ValueCellFull!5661) mapValue!19647)) b!449274))

(assert (= (and b!449271 ((_ is ValueCellFull!5661) mapDefault!19647)) b!449273))

(assert (= start!40660 b!449271))

(declare-fun m!433543 () Bool)

(assert (=> b!449268 m!433543))

(declare-fun m!433545 () Bool)

(assert (=> b!449268 m!433545))

(declare-fun m!433547 () Bool)

(assert (=> mapNonEmpty!19647 m!433547))

(declare-fun m!433549 () Bool)

(assert (=> b!449276 m!433549))

(declare-fun m!433551 () Bool)

(assert (=> b!449276 m!433551))

(declare-fun m!433553 () Bool)

(assert (=> b!449276 m!433553))

(declare-fun m!433555 () Bool)

(assert (=> start!40660 m!433555))

(declare-fun m!433557 () Bool)

(assert (=> start!40660 m!433557))

(declare-fun m!433559 () Bool)

(assert (=> b!449269 m!433559))

(declare-fun m!433561 () Bool)

(assert (=> b!449281 m!433561))

(declare-fun m!433563 () Bool)

(assert (=> b!449279 m!433563))

(declare-fun m!433565 () Bool)

(assert (=> b!449275 m!433565))

(declare-fun m!433567 () Bool)

(assert (=> b!449277 m!433567))

(declare-fun m!433569 () Bool)

(assert (=> b!449280 m!433569))

(declare-fun m!433571 () Bool)

(assert (=> b!449278 m!433571))

(check-sat (not b!449268) (not b_next!10671) (not b!449269) b_and!18679 (not start!40660) (not b!449281) (not mapNonEmpty!19647) tp_is_empty!12009 (not b!449276) (not b!449278) (not b!449277) (not b!449280) (not b!449279))
(check-sat b_and!18679 (not b_next!10671))
