; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40650 () Bool)

(assert start!40650)

(declare-fun b_free!10675 () Bool)

(declare-fun b_next!10675 () Bool)

(assert (=> start!40650 (= b_free!10675 (not b_next!10675))))

(declare-fun tp!37845 () Bool)

(declare-fun b_and!18697 () Bool)

(assert (=> start!40650 (= tp!37845 b_and!18697)))

(declare-fun b!449308 () Bool)

(declare-fun res!267275 () Bool)

(declare-fun e!263462 () Bool)

(assert (=> b!449308 (=> (not res!267275) (not e!263462))))

(declare-datatypes ((array!27828 0))(
  ( (array!27829 (arr!13359 (Array (_ BitVec 32) (_ BitVec 64))) (size!13711 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27828)

(declare-datatypes ((List!7920 0))(
  ( (Nil!7917) (Cons!7916 (h!8772 (_ BitVec 64)) (t!13674 List!7920)) )
))
(declare-fun arrayNoDuplicates!0 (array!27828 (_ BitVec 32) List!7920) Bool)

(assert (=> b!449308 (= res!267275 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7917))))

(declare-fun b!449309 () Bool)

(declare-fun res!267267 () Bool)

(assert (=> b!449309 (=> (not res!267267) (not e!263462))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449309 (= res!267267 (or (= (select (arr!13359 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13359 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!267271 () Bool)

(assert (=> start!40650 (=> (not res!267271) (not e!263462))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40650 (= res!267271 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13711 _keys!709))))))

(assert (=> start!40650 e!263462))

(declare-fun tp_is_empty!12013 () Bool)

(assert (=> start!40650 tp_is_empty!12013))

(assert (=> start!40650 tp!37845))

(assert (=> start!40650 true))

(declare-datatypes ((V!17123 0))(
  ( (V!17124 (val!6051 Int)) )
))
(declare-datatypes ((ValueCell!5663 0))(
  ( (ValueCellFull!5663 (v!8307 V!17123)) (EmptyCell!5663) )
))
(declare-datatypes ((array!27830 0))(
  ( (array!27831 (arr!13360 (Array (_ BitVec 32) ValueCell!5663)) (size!13712 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27830)

(declare-fun e!263464 () Bool)

(declare-fun array_inv!9758 (array!27830) Bool)

(assert (=> start!40650 (and (array_inv!9758 _values!549) e!263464)))

(declare-fun array_inv!9759 (array!27828) Bool)

(assert (=> start!40650 (array_inv!9759 _keys!709)))

(declare-fun mapIsEmpty!19653 () Bool)

(declare-fun mapRes!19653 () Bool)

(assert (=> mapIsEmpty!19653 mapRes!19653))

(declare-fun b!449310 () Bool)

(declare-fun res!267276 () Bool)

(assert (=> b!449310 (=> (not res!267276) (not e!263462))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449310 (= res!267276 (validMask!0 mask!1025))))

(declare-fun b!449311 () Bool)

(declare-fun res!267266 () Bool)

(assert (=> b!449311 (=> (not res!267266) (not e!263462))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449311 (= res!267266 (and (= (size!13712 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13711 _keys!709) (size!13712 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19653 () Bool)

(declare-fun tp!37844 () Bool)

(declare-fun e!263461 () Bool)

(assert (=> mapNonEmpty!19653 (= mapRes!19653 (and tp!37844 e!263461))))

(declare-fun mapKey!19653 () (_ BitVec 32))

(declare-fun mapRest!19653 () (Array (_ BitVec 32) ValueCell!5663))

(declare-fun mapValue!19653 () ValueCell!5663)

(assert (=> mapNonEmpty!19653 (= (arr!13360 _values!549) (store mapRest!19653 mapKey!19653 mapValue!19653))))

(declare-fun b!449312 () Bool)

(declare-fun e!263466 () Bool)

(assert (=> b!449312 (= e!263462 e!263466)))

(declare-fun res!267270 () Bool)

(assert (=> b!449312 (=> (not res!267270) (not e!263466))))

(declare-fun lt!204370 () array!27828)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27828 (_ BitVec 32)) Bool)

(assert (=> b!449312 (= res!267270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204370 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!449312 (= lt!204370 (array!27829 (store (arr!13359 _keys!709) i!563 k0!794) (size!13711 _keys!709)))))

(declare-fun b!449313 () Bool)

(assert (=> b!449313 (= e!263466 false)))

(declare-fun minValue!515 () V!17123)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17123)

(declare-datatypes ((tuple2!7850 0))(
  ( (tuple2!7851 (_1!3936 (_ BitVec 64)) (_2!3936 V!17123)) )
))
(declare-datatypes ((List!7921 0))(
  ( (Nil!7918) (Cons!7917 (h!8773 tuple2!7850) (t!13675 List!7921)) )
))
(declare-datatypes ((ListLongMap!6765 0))(
  ( (ListLongMap!6766 (toList!3398 List!7921)) )
))
(declare-fun lt!204369 () ListLongMap!6765)

(declare-fun v!412 () V!17123)

(declare-fun getCurrentListMapNoExtraKeys!1628 (array!27828 array!27830 (_ BitVec 32) (_ BitVec 32) V!17123 V!17123 (_ BitVec 32) Int) ListLongMap!6765)

(assert (=> b!449313 (= lt!204369 (getCurrentListMapNoExtraKeys!1628 lt!204370 (array!27831 (store (arr!13360 _values!549) i!563 (ValueCellFull!5663 v!412)) (size!13712 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204368 () ListLongMap!6765)

(assert (=> b!449313 (= lt!204368 (getCurrentListMapNoExtraKeys!1628 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449314 () Bool)

(declare-fun e!263465 () Bool)

(assert (=> b!449314 (= e!263465 tp_is_empty!12013)))

(declare-fun b!449315 () Bool)

(declare-fun res!267272 () Bool)

(assert (=> b!449315 (=> (not res!267272) (not e!263462))))

(declare-fun arrayContainsKey!0 (array!27828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449315 (= res!267272 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449316 () Bool)

(assert (=> b!449316 (= e!263461 tp_is_empty!12013)))

(declare-fun b!449317 () Bool)

(declare-fun res!267265 () Bool)

(assert (=> b!449317 (=> (not res!267265) (not e!263462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449317 (= res!267265 (validKeyInArray!0 k0!794))))

(declare-fun b!449318 () Bool)

(assert (=> b!449318 (= e!263464 (and e!263465 mapRes!19653))))

(declare-fun condMapEmpty!19653 () Bool)

(declare-fun mapDefault!19653 () ValueCell!5663)

(assert (=> b!449318 (= condMapEmpty!19653 (= (arr!13360 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5663)) mapDefault!19653)))))

(declare-fun b!449319 () Bool)

(declare-fun res!267274 () Bool)

(assert (=> b!449319 (=> (not res!267274) (not e!263466))))

(assert (=> b!449319 (= res!267274 (arrayNoDuplicates!0 lt!204370 #b00000000000000000000000000000000 Nil!7917))))

(declare-fun b!449320 () Bool)

(declare-fun res!267273 () Bool)

(assert (=> b!449320 (=> (not res!267273) (not e!263462))))

(assert (=> b!449320 (= res!267273 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13711 _keys!709))))))

(declare-fun b!449321 () Bool)

(declare-fun res!267269 () Bool)

(assert (=> b!449321 (=> (not res!267269) (not e!263462))))

(assert (=> b!449321 (= res!267269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449322 () Bool)

(declare-fun res!267268 () Bool)

(assert (=> b!449322 (=> (not res!267268) (not e!263466))))

(assert (=> b!449322 (= res!267268 (bvsle from!863 i!563))))

(assert (= (and start!40650 res!267271) b!449310))

(assert (= (and b!449310 res!267276) b!449311))

(assert (= (and b!449311 res!267266) b!449321))

(assert (= (and b!449321 res!267269) b!449308))

(assert (= (and b!449308 res!267275) b!449320))

(assert (= (and b!449320 res!267273) b!449317))

(assert (= (and b!449317 res!267265) b!449309))

(assert (= (and b!449309 res!267267) b!449315))

(assert (= (and b!449315 res!267272) b!449312))

(assert (= (and b!449312 res!267270) b!449319))

(assert (= (and b!449319 res!267274) b!449322))

(assert (= (and b!449322 res!267268) b!449313))

(assert (= (and b!449318 condMapEmpty!19653) mapIsEmpty!19653))

(assert (= (and b!449318 (not condMapEmpty!19653)) mapNonEmpty!19653))

(get-info :version)

(assert (= (and mapNonEmpty!19653 ((_ is ValueCellFull!5663) mapValue!19653)) b!449316))

(assert (= (and b!449318 ((_ is ValueCellFull!5663) mapDefault!19653)) b!449314))

(assert (= start!40650 b!449318))

(declare-fun m!433821 () Bool)

(assert (=> b!449319 m!433821))

(declare-fun m!433823 () Bool)

(assert (=> mapNonEmpty!19653 m!433823))

(declare-fun m!433825 () Bool)

(assert (=> b!449312 m!433825))

(declare-fun m!433827 () Bool)

(assert (=> b!449312 m!433827))

(declare-fun m!433829 () Bool)

(assert (=> b!449317 m!433829))

(declare-fun m!433831 () Bool)

(assert (=> start!40650 m!433831))

(declare-fun m!433833 () Bool)

(assert (=> start!40650 m!433833))

(declare-fun m!433835 () Bool)

(assert (=> b!449310 m!433835))

(declare-fun m!433837 () Bool)

(assert (=> b!449313 m!433837))

(declare-fun m!433839 () Bool)

(assert (=> b!449313 m!433839))

(declare-fun m!433841 () Bool)

(assert (=> b!449313 m!433841))

(declare-fun m!433843 () Bool)

(assert (=> b!449309 m!433843))

(declare-fun m!433845 () Bool)

(assert (=> b!449321 m!433845))

(declare-fun m!433847 () Bool)

(assert (=> b!449315 m!433847))

(declare-fun m!433849 () Bool)

(assert (=> b!449308 m!433849))

(check-sat (not b!449317) (not mapNonEmpty!19653) (not b!449313) (not b!449315) (not b!449321) (not b!449310) tp_is_empty!12013 (not start!40650) (not b_next!10675) (not b!449319) b_and!18697 (not b!449308) (not b!449312))
(check-sat b_and!18697 (not b_next!10675))
