; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40644 () Bool)

(assert start!40644)

(declare-fun b_free!10669 () Bool)

(declare-fun b_next!10669 () Bool)

(assert (=> start!40644 (= b_free!10669 (not b_next!10669))))

(declare-fun tp!37827 () Bool)

(declare-fun b_and!18691 () Bool)

(assert (=> start!40644 (= tp!37827 b_and!18691)))

(declare-fun b!449173 () Bool)

(declare-fun e!263411 () Bool)

(assert (=> b!449173 (= e!263411 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17115 0))(
  ( (V!17116 (val!6048 Int)) )
))
(declare-datatypes ((tuple2!7846 0))(
  ( (tuple2!7847 (_1!3934 (_ BitVec 64)) (_2!3934 V!17115)) )
))
(declare-datatypes ((List!7917 0))(
  ( (Nil!7914) (Cons!7913 (h!8769 tuple2!7846) (t!13671 List!7917)) )
))
(declare-datatypes ((ListLongMap!6761 0))(
  ( (ListLongMap!6762 (toList!3396 List!7917)) )
))
(declare-fun lt!204341 () ListLongMap!6761)

(declare-fun minValue!515 () V!17115)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27816 0))(
  ( (array!27817 (arr!13353 (Array (_ BitVec 32) (_ BitVec 64))) (size!13705 (_ BitVec 32))) )
))
(declare-fun lt!204342 () array!27816)

(declare-datatypes ((ValueCell!5660 0))(
  ( (ValueCellFull!5660 (v!8304 V!17115)) (EmptyCell!5660) )
))
(declare-datatypes ((array!27818 0))(
  ( (array!27819 (arr!13354 (Array (_ BitVec 32) ValueCell!5660)) (size!13706 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27818)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17115)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17115)

(declare-fun getCurrentListMapNoExtraKeys!1626 (array!27816 array!27818 (_ BitVec 32) (_ BitVec 32) V!17115 V!17115 (_ BitVec 32) Int) ListLongMap!6761)

(assert (=> b!449173 (= lt!204341 (getCurrentListMapNoExtraKeys!1626 lt!204342 (array!27819 (store (arr!13354 _values!549) i!563 (ValueCellFull!5660 v!412)) (size!13706 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204343 () ListLongMap!6761)

(declare-fun _keys!709 () array!27816)

(assert (=> b!449173 (= lt!204343 (getCurrentListMapNoExtraKeys!1626 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449174 () Bool)

(declare-fun res!267162 () Bool)

(declare-fun e!263409 () Bool)

(assert (=> b!449174 (=> (not res!267162) (not e!263409))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449174 (= res!267162 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449175 () Bool)

(declare-fun e!263412 () Bool)

(declare-fun e!263407 () Bool)

(declare-fun mapRes!19644 () Bool)

(assert (=> b!449175 (= e!263412 (and e!263407 mapRes!19644))))

(declare-fun condMapEmpty!19644 () Bool)

(declare-fun mapDefault!19644 () ValueCell!5660)

(assert (=> b!449175 (= condMapEmpty!19644 (= (arr!13354 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5660)) mapDefault!19644)))))

(declare-fun b!449176 () Bool)

(declare-fun res!267160 () Bool)

(assert (=> b!449176 (=> (not res!267160) (not e!263409))))

(declare-datatypes ((List!7918 0))(
  ( (Nil!7915) (Cons!7914 (h!8770 (_ BitVec 64)) (t!13672 List!7918)) )
))
(declare-fun arrayNoDuplicates!0 (array!27816 (_ BitVec 32) List!7918) Bool)

(assert (=> b!449176 (= res!267160 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7915))))

(declare-fun res!267168 () Bool)

(assert (=> start!40644 (=> (not res!267168) (not e!263409))))

(assert (=> start!40644 (= res!267168 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13705 _keys!709))))))

(assert (=> start!40644 e!263409))

(declare-fun tp_is_empty!12007 () Bool)

(assert (=> start!40644 tp_is_empty!12007))

(assert (=> start!40644 tp!37827))

(assert (=> start!40644 true))

(declare-fun array_inv!9754 (array!27818) Bool)

(assert (=> start!40644 (and (array_inv!9754 _values!549) e!263412)))

(declare-fun array_inv!9755 (array!27816) Bool)

(assert (=> start!40644 (array_inv!9755 _keys!709)))

(declare-fun b!449177 () Bool)

(declare-fun res!267165 () Bool)

(assert (=> b!449177 (=> (not res!267165) (not e!263409))))

(assert (=> b!449177 (= res!267165 (or (= (select (arr!13353 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13353 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19644 () Bool)

(declare-fun tp!37826 () Bool)

(declare-fun e!263410 () Bool)

(assert (=> mapNonEmpty!19644 (= mapRes!19644 (and tp!37826 e!263410))))

(declare-fun mapKey!19644 () (_ BitVec 32))

(declare-fun mapValue!19644 () ValueCell!5660)

(declare-fun mapRest!19644 () (Array (_ BitVec 32) ValueCell!5660))

(assert (=> mapNonEmpty!19644 (= (arr!13354 _values!549) (store mapRest!19644 mapKey!19644 mapValue!19644))))

(declare-fun mapIsEmpty!19644 () Bool)

(assert (=> mapIsEmpty!19644 mapRes!19644))

(declare-fun b!449178 () Bool)

(declare-fun res!267164 () Bool)

(assert (=> b!449178 (=> (not res!267164) (not e!263411))))

(assert (=> b!449178 (= res!267164 (bvsle from!863 i!563))))

(declare-fun b!449179 () Bool)

(assert (=> b!449179 (= e!263409 e!263411)))

(declare-fun res!267166 () Bool)

(assert (=> b!449179 (=> (not res!267166) (not e!263411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27816 (_ BitVec 32)) Bool)

(assert (=> b!449179 (= res!267166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204342 mask!1025))))

(assert (=> b!449179 (= lt!204342 (array!27817 (store (arr!13353 _keys!709) i!563 k0!794) (size!13705 _keys!709)))))

(declare-fun b!449180 () Bool)

(declare-fun res!267159 () Bool)

(assert (=> b!449180 (=> (not res!267159) (not e!263411))))

(assert (=> b!449180 (= res!267159 (arrayNoDuplicates!0 lt!204342 #b00000000000000000000000000000000 Nil!7915))))

(declare-fun b!449181 () Bool)

(declare-fun res!267157 () Bool)

(assert (=> b!449181 (=> (not res!267157) (not e!263409))))

(assert (=> b!449181 (= res!267157 (and (= (size!13706 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13705 _keys!709) (size!13706 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449182 () Bool)

(assert (=> b!449182 (= e!263407 tp_is_empty!12007)))

(declare-fun b!449183 () Bool)

(declare-fun res!267163 () Bool)

(assert (=> b!449183 (=> (not res!267163) (not e!263409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449183 (= res!267163 (validKeyInArray!0 k0!794))))

(declare-fun b!449184 () Bool)

(declare-fun res!267158 () Bool)

(assert (=> b!449184 (=> (not res!267158) (not e!263409))))

(assert (=> b!449184 (= res!267158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449185 () Bool)

(assert (=> b!449185 (= e!263410 tp_is_empty!12007)))

(declare-fun b!449186 () Bool)

(declare-fun res!267167 () Bool)

(assert (=> b!449186 (=> (not res!267167) (not e!263409))))

(assert (=> b!449186 (= res!267167 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13705 _keys!709))))))

(declare-fun b!449187 () Bool)

(declare-fun res!267161 () Bool)

(assert (=> b!449187 (=> (not res!267161) (not e!263409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449187 (= res!267161 (validMask!0 mask!1025))))

(assert (= (and start!40644 res!267168) b!449187))

(assert (= (and b!449187 res!267161) b!449181))

(assert (= (and b!449181 res!267157) b!449184))

(assert (= (and b!449184 res!267158) b!449176))

(assert (= (and b!449176 res!267160) b!449186))

(assert (= (and b!449186 res!267167) b!449183))

(assert (= (and b!449183 res!267163) b!449177))

(assert (= (and b!449177 res!267165) b!449174))

(assert (= (and b!449174 res!267162) b!449179))

(assert (= (and b!449179 res!267166) b!449180))

(assert (= (and b!449180 res!267159) b!449178))

(assert (= (and b!449178 res!267164) b!449173))

(assert (= (and b!449175 condMapEmpty!19644) mapIsEmpty!19644))

(assert (= (and b!449175 (not condMapEmpty!19644)) mapNonEmpty!19644))

(get-info :version)

(assert (= (and mapNonEmpty!19644 ((_ is ValueCellFull!5660) mapValue!19644)) b!449185))

(assert (= (and b!449175 ((_ is ValueCellFull!5660) mapDefault!19644)) b!449182))

(assert (= start!40644 b!449175))

(declare-fun m!433731 () Bool)

(assert (=> b!449177 m!433731))

(declare-fun m!433733 () Bool)

(assert (=> b!449176 m!433733))

(declare-fun m!433735 () Bool)

(assert (=> mapNonEmpty!19644 m!433735))

(declare-fun m!433737 () Bool)

(assert (=> b!449173 m!433737))

(declare-fun m!433739 () Bool)

(assert (=> b!449173 m!433739))

(declare-fun m!433741 () Bool)

(assert (=> b!449173 m!433741))

(declare-fun m!433743 () Bool)

(assert (=> b!449183 m!433743))

(declare-fun m!433745 () Bool)

(assert (=> b!449174 m!433745))

(declare-fun m!433747 () Bool)

(assert (=> b!449187 m!433747))

(declare-fun m!433749 () Bool)

(assert (=> b!449179 m!433749))

(declare-fun m!433751 () Bool)

(assert (=> b!449179 m!433751))

(declare-fun m!433753 () Bool)

(assert (=> start!40644 m!433753))

(declare-fun m!433755 () Bool)

(assert (=> start!40644 m!433755))

(declare-fun m!433757 () Bool)

(assert (=> b!449184 m!433757))

(declare-fun m!433759 () Bool)

(assert (=> b!449180 m!433759))

(check-sat b_and!18691 (not b!449183) (not b!449184) (not b_next!10669) tp_is_empty!12007 (not start!40644) (not b!449173) (not b!449180) (not b!449176) (not b!449174) (not b!449187) (not b!449179) (not mapNonEmpty!19644))
(check-sat b_and!18691 (not b_next!10669))
