; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133664 () Bool)

(assert start!133664)

(declare-fun b_free!32077 () Bool)

(declare-fun b_next!32077 () Bool)

(assert (=> start!133664 (= b_free!32077 (not b_next!32077))))

(declare-fun tp!113436 () Bool)

(declare-fun b_and!51629 () Bool)

(assert (=> start!133664 (= tp!113436 b_and!51629)))

(declare-fun b!1563112 () Bool)

(declare-fun e!871145 () Bool)

(assert (=> b!1563112 (= e!871145 false)))

(declare-fun lt!671599 () Bool)

(declare-datatypes ((V!59937 0))(
  ( (V!59938 (val!19482 Int)) )
))
(declare-datatypes ((tuple2!25210 0))(
  ( (tuple2!25211 (_1!12616 (_ BitVec 64)) (_2!12616 V!59937)) )
))
(declare-datatypes ((List!36568 0))(
  ( (Nil!36565) (Cons!36564 (h!38011 tuple2!25210) (t!51407 List!36568)) )
))
(declare-datatypes ((ListLongMap!22645 0))(
  ( (ListLongMap!22646 (toList!11338 List!36568)) )
))
(declare-fun lt!671600 () ListLongMap!22645)

(declare-fun contains!10248 (ListLongMap!22645 (_ BitVec 64)) Bool)

(assert (=> b!1563112 (= lt!671599 (contains!10248 lt!671600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563113 () Bool)

(declare-fun res!1068707 () Bool)

(declare-fun e!871149 () Bool)

(assert (=> b!1563113 (=> (not res!1068707) (not e!871149))))

(declare-datatypes ((array!104212 0))(
  ( (array!104213 (arr!50299 (Array (_ BitVec 32) (_ BitVec 64))) (size!50851 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104212)

(declare-datatypes ((List!36569 0))(
  ( (Nil!36566) (Cons!36565 (h!38012 (_ BitVec 64)) (t!51408 List!36569)) )
))
(declare-fun arrayNoDuplicates!0 (array!104212 (_ BitVec 32) List!36569) Bool)

(assert (=> b!1563113 (= res!1068707 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36566))))

(declare-fun b!1563115 () Bool)

(declare-fun e!871148 () Bool)

(declare-fun tp_is_empty!38797 () Bool)

(assert (=> b!1563115 (= e!871148 tp_is_empty!38797)))

(declare-fun mapIsEmpty!59571 () Bool)

(declare-fun mapRes!59571 () Bool)

(assert (=> mapIsEmpty!59571 mapRes!59571))

(declare-fun b!1563116 () Bool)

(declare-fun e!871150 () Bool)

(assert (=> b!1563116 (= e!871150 tp_is_empty!38797)))

(declare-fun b!1563117 () Bool)

(declare-fun e!871147 () Bool)

(assert (=> b!1563117 (= e!871147 (and e!871150 mapRes!59571))))

(declare-fun condMapEmpty!59571 () Bool)

(declare-datatypes ((ValueCell!18368 0))(
  ( (ValueCellFull!18368 (v!22230 V!59937)) (EmptyCell!18368) )
))
(declare-datatypes ((array!104214 0))(
  ( (array!104215 (arr!50300 (Array (_ BitVec 32) ValueCell!18368)) (size!50852 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104214)

(declare-fun mapDefault!59571 () ValueCell!18368)

(assert (=> b!1563117 (= condMapEmpty!59571 (= (arr!50300 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18368)) mapDefault!59571)))))

(declare-fun mapNonEmpty!59571 () Bool)

(declare-fun tp!113437 () Bool)

(assert (=> mapNonEmpty!59571 (= mapRes!59571 (and tp!113437 e!871148))))

(declare-fun mapRest!59571 () (Array (_ BitVec 32) ValueCell!18368))

(declare-fun mapValue!59571 () ValueCell!18368)

(declare-fun mapKey!59571 () (_ BitVec 32))

(assert (=> mapNonEmpty!59571 (= (arr!50300 _values!487) (store mapRest!59571 mapKey!59571 mapValue!59571))))

(declare-fun b!1563118 () Bool)

(declare-fun res!1068710 () Bool)

(assert (=> b!1563118 (=> (not res!1068710) (not e!871149))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563118 (= res!1068710 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50851 _keys!637)) (bvslt from!782 (size!50851 _keys!637))))))

(declare-fun b!1563119 () Bool)

(declare-fun res!1068709 () Bool)

(assert (=> b!1563119 (=> (not res!1068709) (not e!871149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563119 (= res!1068709 (not (validKeyInArray!0 (select (arr!50299 _keys!637) from!782))))))

(declare-fun res!1068706 () Bool)

(assert (=> start!133664 (=> (not res!1068706) (not e!871149))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133664 (= res!1068706 (validMask!0 mask!947))))

(assert (=> start!133664 e!871149))

(assert (=> start!133664 tp!113436))

(assert (=> start!133664 tp_is_empty!38797))

(assert (=> start!133664 true))

(declare-fun array_inv!39281 (array!104212) Bool)

(assert (=> start!133664 (array_inv!39281 _keys!637)))

(declare-fun array_inv!39282 (array!104214) Bool)

(assert (=> start!133664 (and (array_inv!39282 _values!487) e!871147)))

(declare-fun b!1563114 () Bool)

(declare-fun res!1068711 () Bool)

(assert (=> b!1563114 (=> (not res!1068711) (not e!871149))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563114 (= res!1068711 (and (= (size!50852 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50851 _keys!637) (size!50852 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563120 () Bool)

(assert (=> b!1563120 (= e!871149 e!871145)))

(declare-fun res!1068708 () Bool)

(assert (=> b!1563120 (=> (not res!1068708) (not e!871145))))

(assert (=> b!1563120 (= res!1068708 (not (contains!10248 lt!671600 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59937)

(declare-fun minValue!453 () V!59937)

(declare-fun getCurrentListMapNoExtraKeys!6711 (array!104212 array!104214 (_ BitVec 32) (_ BitVec 32) V!59937 V!59937 (_ BitVec 32) Int) ListLongMap!22645)

(assert (=> b!1563120 (= lt!671600 (getCurrentListMapNoExtraKeys!6711 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563121 () Bool)

(declare-fun res!1068705 () Bool)

(assert (=> b!1563121 (=> (not res!1068705) (not e!871149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104212 (_ BitVec 32)) Bool)

(assert (=> b!1563121 (= res!1068705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133664 res!1068706) b!1563114))

(assert (= (and b!1563114 res!1068711) b!1563121))

(assert (= (and b!1563121 res!1068705) b!1563113))

(assert (= (and b!1563113 res!1068707) b!1563118))

(assert (= (and b!1563118 res!1068710) b!1563119))

(assert (= (and b!1563119 res!1068709) b!1563120))

(assert (= (and b!1563120 res!1068708) b!1563112))

(assert (= (and b!1563117 condMapEmpty!59571) mapIsEmpty!59571))

(assert (= (and b!1563117 (not condMapEmpty!59571)) mapNonEmpty!59571))

(get-info :version)

(assert (= (and mapNonEmpty!59571 ((_ is ValueCellFull!18368) mapValue!59571)) b!1563115))

(assert (= (and b!1563117 ((_ is ValueCellFull!18368) mapDefault!59571)) b!1563116))

(assert (= start!133664 b!1563117))

(declare-fun m!1438059 () Bool)

(assert (=> b!1563113 m!1438059))

(declare-fun m!1438061 () Bool)

(assert (=> b!1563112 m!1438061))

(declare-fun m!1438063 () Bool)

(assert (=> start!133664 m!1438063))

(declare-fun m!1438065 () Bool)

(assert (=> start!133664 m!1438065))

(declare-fun m!1438067 () Bool)

(assert (=> start!133664 m!1438067))

(declare-fun m!1438069 () Bool)

(assert (=> b!1563121 m!1438069))

(declare-fun m!1438071 () Bool)

(assert (=> b!1563120 m!1438071))

(declare-fun m!1438073 () Bool)

(assert (=> b!1563120 m!1438073))

(declare-fun m!1438075 () Bool)

(assert (=> mapNonEmpty!59571 m!1438075))

(declare-fun m!1438077 () Bool)

(assert (=> b!1563119 m!1438077))

(assert (=> b!1563119 m!1438077))

(declare-fun m!1438079 () Bool)

(assert (=> b!1563119 m!1438079))

(check-sat b_and!51629 (not b!1563121) (not b_next!32077) (not mapNonEmpty!59571) (not b!1563113) (not b!1563119) tp_is_empty!38797 (not b!1563112) (not start!133664) (not b!1563120))
(check-sat b_and!51629 (not b_next!32077))
