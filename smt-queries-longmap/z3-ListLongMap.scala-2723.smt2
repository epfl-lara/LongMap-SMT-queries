; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40142 () Bool)

(assert start!40142)

(declare-fun b_free!10423 () Bool)

(declare-fun b_next!10423 () Bool)

(assert (=> start!40142 (= b_free!10423 (not b_next!10423))))

(declare-fun tp!36798 () Bool)

(declare-fun b_and!18365 () Bool)

(assert (=> start!40142 (= tp!36798 b_and!18365)))

(declare-fun b!439237 () Bool)

(declare-fun res!259621 () Bool)

(declare-fun e!258914 () Bool)

(assert (=> b!439237 (=> (not res!259621) (not e!258914))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439237 (= res!259621 (validKeyInArray!0 k0!794))))

(declare-fun b!439238 () Bool)

(declare-fun e!258909 () Bool)

(assert (=> b!439238 (= e!258914 e!258909)))

(declare-fun res!259615 () Bool)

(assert (=> b!439238 (=> (not res!259615) (not e!258909))))

(declare-datatypes ((array!26967 0))(
  ( (array!26968 (arr!12933 (Array (_ BitVec 32) (_ BitVec 64))) (size!13286 (_ BitVec 32))) )
))
(declare-fun lt!202061 () array!26967)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26967 (_ BitVec 32)) Bool)

(assert (=> b!439238 (= res!259615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202061 mask!1025))))

(declare-fun _keys!709 () array!26967)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439238 (= lt!202061 (array!26968 (store (arr!12933 _keys!709) i!563 k0!794) (size!13286 _keys!709)))))

(declare-fun b!439239 () Bool)

(declare-fun e!258915 () Bool)

(declare-fun tp_is_empty!11575 () Bool)

(assert (=> b!439239 (= e!258915 tp_is_empty!11575)))

(declare-fun res!259618 () Bool)

(assert (=> start!40142 (=> (not res!259618) (not e!258914))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40142 (= res!259618 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13286 _keys!709))))))

(assert (=> start!40142 e!258914))

(assert (=> start!40142 tp_is_empty!11575))

(assert (=> start!40142 tp!36798))

(assert (=> start!40142 true))

(declare-datatypes ((V!16539 0))(
  ( (V!16540 (val!5832 Int)) )
))
(declare-datatypes ((ValueCell!5444 0))(
  ( (ValueCellFull!5444 (v!8073 V!16539)) (EmptyCell!5444) )
))
(declare-datatypes ((array!26969 0))(
  ( (array!26970 (arr!12934 (Array (_ BitVec 32) ValueCell!5444)) (size!13287 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26969)

(declare-fun e!258912 () Bool)

(declare-fun array_inv!9434 (array!26969) Bool)

(assert (=> start!40142 (and (array_inv!9434 _values!549) e!258912)))

(declare-fun array_inv!9435 (array!26967) Bool)

(assert (=> start!40142 (array_inv!9435 _keys!709)))

(declare-fun b!439240 () Bool)

(declare-fun res!259622 () Bool)

(assert (=> b!439240 (=> (not res!259622) (not e!258909))))

(assert (=> b!439240 (= res!259622 (bvsle from!863 i!563))))

(declare-fun b!439241 () Bool)

(declare-fun e!258910 () Bool)

(assert (=> b!439241 (= e!258910 tp_is_empty!11575)))

(declare-fun b!439242 () Bool)

(declare-fun res!259619 () Bool)

(assert (=> b!439242 (=> (not res!259619) (not e!258914))))

(assert (=> b!439242 (= res!259619 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13286 _keys!709))))))

(declare-fun b!439243 () Bool)

(declare-fun res!259620 () Bool)

(assert (=> b!439243 (=> (not res!259620) (not e!258914))))

(assert (=> b!439243 (= res!259620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18984 () Bool)

(declare-fun mapRes!18984 () Bool)

(assert (=> mapIsEmpty!18984 mapRes!18984))

(declare-fun b!439244 () Bool)

(declare-fun res!259623 () Bool)

(assert (=> b!439244 (=> (not res!259623) (not e!258909))))

(declare-datatypes ((List!7747 0))(
  ( (Nil!7744) (Cons!7743 (h!8599 (_ BitVec 64)) (t!13494 List!7747)) )
))
(declare-fun arrayNoDuplicates!0 (array!26967 (_ BitVec 32) List!7747) Bool)

(assert (=> b!439244 (= res!259623 (arrayNoDuplicates!0 lt!202061 #b00000000000000000000000000000000 Nil!7744))))

(declare-fun b!439245 () Bool)

(declare-fun res!259617 () Bool)

(assert (=> b!439245 (=> (not res!259617) (not e!258914))))

(assert (=> b!439245 (= res!259617 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7744))))

(declare-fun b!439246 () Bool)

(declare-fun e!258913 () Bool)

(assert (=> b!439246 (= e!258909 e!258913)))

(declare-fun res!259613 () Bool)

(assert (=> b!439246 (=> (not res!259613) (not e!258913))))

(assert (=> b!439246 (= res!259613 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16539)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7760 0))(
  ( (tuple2!7761 (_1!3891 (_ BitVec 64)) (_2!3891 V!16539)) )
))
(declare-datatypes ((List!7748 0))(
  ( (Nil!7745) (Cons!7744 (h!8600 tuple2!7760) (t!13495 List!7748)) )
))
(declare-datatypes ((ListLongMap!6663 0))(
  ( (ListLongMap!6664 (toList!3347 List!7748)) )
))
(declare-fun lt!202060 () ListLongMap!6663)

(declare-fun zeroValue!515 () V!16539)

(declare-fun lt!202057 () array!26969)

(declare-fun getCurrentListMapNoExtraKeys!1546 (array!26967 array!26969 (_ BitVec 32) (_ BitVec 32) V!16539 V!16539 (_ BitVec 32) Int) ListLongMap!6663)

(assert (=> b!439246 (= lt!202060 (getCurrentListMapNoExtraKeys!1546 lt!202061 lt!202057 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16539)

(assert (=> b!439246 (= lt!202057 (array!26970 (store (arr!12934 _values!549) i!563 (ValueCellFull!5444 v!412)) (size!13287 _values!549)))))

(declare-fun lt!202058 () ListLongMap!6663)

(assert (=> b!439246 (= lt!202058 (getCurrentListMapNoExtraKeys!1546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439247 () Bool)

(assert (=> b!439247 (= e!258913 (not true))))

(declare-fun +!1511 (ListLongMap!6663 tuple2!7760) ListLongMap!6663)

(assert (=> b!439247 (= (getCurrentListMapNoExtraKeys!1546 lt!202061 lt!202057 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1511 (getCurrentListMapNoExtraKeys!1546 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7761 k0!794 v!412)))))

(declare-datatypes ((Unit!13039 0))(
  ( (Unit!13040) )
))
(declare-fun lt!202059 () Unit!13039)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!649 (array!26967 array!26969 (_ BitVec 32) (_ BitVec 32) V!16539 V!16539 (_ BitVec 32) (_ BitVec 64) V!16539 (_ BitVec 32) Int) Unit!13039)

(assert (=> b!439247 (= lt!202059 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!649 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439248 () Bool)

(declare-fun res!259614 () Bool)

(assert (=> b!439248 (=> (not res!259614) (not e!258914))))

(declare-fun arrayContainsKey!0 (array!26967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439248 (= res!259614 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439249 () Bool)

(declare-fun res!259616 () Bool)

(assert (=> b!439249 (=> (not res!259616) (not e!258914))))

(assert (=> b!439249 (= res!259616 (or (= (select (arr!12933 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12933 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439250 () Bool)

(declare-fun res!259612 () Bool)

(assert (=> b!439250 (=> (not res!259612) (not e!258914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439250 (= res!259612 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18984 () Bool)

(declare-fun tp!36797 () Bool)

(assert (=> mapNonEmpty!18984 (= mapRes!18984 (and tp!36797 e!258915))))

(declare-fun mapKey!18984 () (_ BitVec 32))

(declare-fun mapValue!18984 () ValueCell!5444)

(declare-fun mapRest!18984 () (Array (_ BitVec 32) ValueCell!5444))

(assert (=> mapNonEmpty!18984 (= (arr!12934 _values!549) (store mapRest!18984 mapKey!18984 mapValue!18984))))

(declare-fun b!439251 () Bool)

(declare-fun res!259611 () Bool)

(assert (=> b!439251 (=> (not res!259611) (not e!258914))))

(assert (=> b!439251 (= res!259611 (and (= (size!13287 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13286 _keys!709) (size!13287 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439252 () Bool)

(assert (=> b!439252 (= e!258912 (and e!258910 mapRes!18984))))

(declare-fun condMapEmpty!18984 () Bool)

(declare-fun mapDefault!18984 () ValueCell!5444)

(assert (=> b!439252 (= condMapEmpty!18984 (= (arr!12934 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5444)) mapDefault!18984)))))

(assert (= (and start!40142 res!259618) b!439250))

(assert (= (and b!439250 res!259612) b!439251))

(assert (= (and b!439251 res!259611) b!439243))

(assert (= (and b!439243 res!259620) b!439245))

(assert (= (and b!439245 res!259617) b!439242))

(assert (= (and b!439242 res!259619) b!439237))

(assert (= (and b!439237 res!259621) b!439249))

(assert (= (and b!439249 res!259616) b!439248))

(assert (= (and b!439248 res!259614) b!439238))

(assert (= (and b!439238 res!259615) b!439244))

(assert (= (and b!439244 res!259623) b!439240))

(assert (= (and b!439240 res!259622) b!439246))

(assert (= (and b!439246 res!259613) b!439247))

(assert (= (and b!439252 condMapEmpty!18984) mapIsEmpty!18984))

(assert (= (and b!439252 (not condMapEmpty!18984)) mapNonEmpty!18984))

(get-info :version)

(assert (= (and mapNonEmpty!18984 ((_ is ValueCellFull!5444) mapValue!18984)) b!439239))

(assert (= (and b!439252 ((_ is ValueCellFull!5444) mapDefault!18984)) b!439241))

(assert (= start!40142 b!439252))

(declare-fun m!426015 () Bool)

(assert (=> b!439247 m!426015))

(declare-fun m!426017 () Bool)

(assert (=> b!439247 m!426017))

(assert (=> b!439247 m!426017))

(declare-fun m!426019 () Bool)

(assert (=> b!439247 m!426019))

(declare-fun m!426021 () Bool)

(assert (=> b!439247 m!426021))

(declare-fun m!426023 () Bool)

(assert (=> b!439250 m!426023))

(declare-fun m!426025 () Bool)

(assert (=> b!439237 m!426025))

(declare-fun m!426027 () Bool)

(assert (=> b!439249 m!426027))

(declare-fun m!426029 () Bool)

(assert (=> b!439246 m!426029))

(declare-fun m!426031 () Bool)

(assert (=> b!439246 m!426031))

(declare-fun m!426033 () Bool)

(assert (=> b!439246 m!426033))

(declare-fun m!426035 () Bool)

(assert (=> start!40142 m!426035))

(declare-fun m!426037 () Bool)

(assert (=> start!40142 m!426037))

(declare-fun m!426039 () Bool)

(assert (=> b!439243 m!426039))

(declare-fun m!426041 () Bool)

(assert (=> b!439244 m!426041))

(declare-fun m!426043 () Bool)

(assert (=> b!439245 m!426043))

(declare-fun m!426045 () Bool)

(assert (=> mapNonEmpty!18984 m!426045))

(declare-fun m!426047 () Bool)

(assert (=> b!439248 m!426047))

(declare-fun m!426049 () Bool)

(assert (=> b!439238 m!426049))

(declare-fun m!426051 () Bool)

(assert (=> b!439238 m!426051))

(check-sat (not mapNonEmpty!18984) (not b!439243) (not b!439237) (not b!439246) tp_is_empty!11575 (not b!439247) b_and!18365 (not b!439244) (not b!439245) (not start!40142) (not b_next!10423) (not b!439248) (not b!439238) (not b!439250))
(check-sat b_and!18365 (not b_next!10423))
