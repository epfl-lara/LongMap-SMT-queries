; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40648 () Bool)

(assert start!40648)

(declare-fun b_free!10659 () Bool)

(declare-fun b_next!10659 () Bool)

(assert (=> start!40648 (= b_free!10659 (not b_next!10659))))

(declare-fun tp!37797 () Bool)

(declare-fun b_and!18667 () Bool)

(assert (=> start!40648 (= tp!37797 b_and!18667)))

(declare-fun b!448997 () Bool)

(declare-fun res!266986 () Bool)

(declare-fun e!263353 () Bool)

(assert (=> b!448997 (=> (not res!266986) (not e!263353))))

(declare-datatypes ((array!27801 0))(
  ( (array!27802 (arr!13346 (Array (_ BitVec 32) (_ BitVec 64))) (size!13698 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27801)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27801 (_ BitVec 32)) Bool)

(assert (=> b!448997 (= res!266986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19629 () Bool)

(declare-fun mapRes!19629 () Bool)

(assert (=> mapIsEmpty!19629 mapRes!19629))

(declare-fun b!448998 () Bool)

(declare-fun res!266990 () Bool)

(declare-fun e!263351 () Bool)

(assert (=> b!448998 (=> (not res!266990) (not e!263351))))

(declare-fun lt!204277 () array!27801)

(declare-datatypes ((List!7995 0))(
  ( (Nil!7992) (Cons!7991 (h!8847 (_ BitVec 64)) (t!13757 List!7995)) )
))
(declare-fun arrayNoDuplicates!0 (array!27801 (_ BitVec 32) List!7995) Bool)

(assert (=> b!448998 (= res!266990 (arrayNoDuplicates!0 lt!204277 #b00000000000000000000000000000000 Nil!7992))))

(declare-fun b!448999 () Bool)

(declare-fun res!266984 () Bool)

(assert (=> b!448999 (=> (not res!266984) (not e!263353))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448999 (= res!266984 (or (= (select (arr!13346 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13346 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19629 () Bool)

(declare-fun tp!37796 () Bool)

(declare-fun e!263350 () Bool)

(assert (=> mapNonEmpty!19629 (= mapRes!19629 (and tp!37796 e!263350))))

(declare-datatypes ((V!17101 0))(
  ( (V!17102 (val!6043 Int)) )
))
(declare-datatypes ((ValueCell!5655 0))(
  ( (ValueCellFull!5655 (v!8298 V!17101)) (EmptyCell!5655) )
))
(declare-fun mapValue!19629 () ValueCell!5655)

(declare-fun mapRest!19629 () (Array (_ BitVec 32) ValueCell!5655))

(declare-datatypes ((array!27803 0))(
  ( (array!27804 (arr!13347 (Array (_ BitVec 32) ValueCell!5655)) (size!13699 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27803)

(declare-fun mapKey!19629 () (_ BitVec 32))

(assert (=> mapNonEmpty!19629 (= (arr!13347 _values!549) (store mapRest!19629 mapKey!19629 mapValue!19629))))

(declare-fun b!449000 () Bool)

(declare-fun res!266980 () Bool)

(assert (=> b!449000 (=> (not res!266980) (not e!263351))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449000 (= res!266980 (bvsle from!863 i!563))))

(declare-fun res!266987 () Bool)

(assert (=> start!40648 (=> (not res!266987) (not e!263353))))

(assert (=> start!40648 (= res!266987 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13698 _keys!709))))))

(assert (=> start!40648 e!263353))

(declare-fun tp_is_empty!11997 () Bool)

(assert (=> start!40648 tp_is_empty!11997))

(assert (=> start!40648 tp!37797))

(assert (=> start!40648 true))

(declare-fun e!263352 () Bool)

(declare-fun array_inv!9672 (array!27803) Bool)

(assert (=> start!40648 (and (array_inv!9672 _values!549) e!263352)))

(declare-fun array_inv!9673 (array!27801) Bool)

(assert (=> start!40648 (array_inv!9673 _keys!709)))

(declare-fun b!449001 () Bool)

(declare-fun e!263349 () Bool)

(assert (=> b!449001 (= e!263352 (and e!263349 mapRes!19629))))

(declare-fun condMapEmpty!19629 () Bool)

(declare-fun mapDefault!19629 () ValueCell!5655)

(assert (=> b!449001 (= condMapEmpty!19629 (= (arr!13347 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5655)) mapDefault!19629)))))

(declare-fun b!449002 () Bool)

(declare-fun res!266991 () Bool)

(assert (=> b!449002 (=> (not res!266991) (not e!263353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449002 (= res!266991 (validMask!0 mask!1025))))

(declare-fun b!449003 () Bool)

(assert (=> b!449003 (= e!263349 tp_is_empty!11997)))

(declare-fun b!449004 () Bool)

(declare-fun res!266983 () Bool)

(assert (=> b!449004 (=> (not res!266983) (not e!263353))))

(assert (=> b!449004 (= res!266983 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7992))))

(declare-fun b!449005 () Bool)

(assert (=> b!449005 (= e!263353 e!263351)))

(declare-fun res!266989 () Bool)

(assert (=> b!449005 (=> (not res!266989) (not e!263351))))

(assert (=> b!449005 (= res!266989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204277 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!449005 (= lt!204277 (array!27802 (store (arr!13346 _keys!709) i!563 k0!794) (size!13698 _keys!709)))))

(declare-fun b!449006 () Bool)

(declare-fun res!266981 () Bool)

(assert (=> b!449006 (=> (not res!266981) (not e!263353))))

(declare-fun arrayContainsKey!0 (array!27801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449006 (= res!266981 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449007 () Bool)

(assert (=> b!449007 (= e!263350 tp_is_empty!11997)))

(declare-fun b!449008 () Bool)

(declare-fun res!266982 () Bool)

(assert (=> b!449008 (=> (not res!266982) (not e!263353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449008 (= res!266982 (validKeyInArray!0 k0!794))))

(declare-fun b!449009 () Bool)

(declare-fun res!266988 () Bool)

(assert (=> b!449009 (=> (not res!266988) (not e!263353))))

(assert (=> b!449009 (= res!266988 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13698 _keys!709))))))

(declare-fun b!449010 () Bool)

(assert (=> b!449010 (= e!263351 false)))

(declare-fun minValue!515 () V!17101)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17101)

(declare-fun v!412 () V!17101)

(declare-datatypes ((tuple2!7930 0))(
  ( (tuple2!7931 (_1!3976 (_ BitVec 64)) (_2!3976 V!17101)) )
))
(declare-datatypes ((List!7996 0))(
  ( (Nil!7993) (Cons!7992 (h!8848 tuple2!7930) (t!13758 List!7996)) )
))
(declare-datatypes ((ListLongMap!6843 0))(
  ( (ListLongMap!6844 (toList!3437 List!7996)) )
))
(declare-fun lt!204278 () ListLongMap!6843)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1623 (array!27801 array!27803 (_ BitVec 32) (_ BitVec 32) V!17101 V!17101 (_ BitVec 32) Int) ListLongMap!6843)

(assert (=> b!449010 (= lt!204278 (getCurrentListMapNoExtraKeys!1623 lt!204277 (array!27804 (store (arr!13347 _values!549) i!563 (ValueCellFull!5655 v!412)) (size!13699 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204279 () ListLongMap!6843)

(assert (=> b!449010 (= lt!204279 (getCurrentListMapNoExtraKeys!1623 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449011 () Bool)

(declare-fun res!266985 () Bool)

(assert (=> b!449011 (=> (not res!266985) (not e!263353))))

(assert (=> b!449011 (= res!266985 (and (= (size!13699 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13698 _keys!709) (size!13699 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40648 res!266987) b!449002))

(assert (= (and b!449002 res!266991) b!449011))

(assert (= (and b!449011 res!266985) b!448997))

(assert (= (and b!448997 res!266986) b!449004))

(assert (= (and b!449004 res!266983) b!449009))

(assert (= (and b!449009 res!266988) b!449008))

(assert (= (and b!449008 res!266982) b!448999))

(assert (= (and b!448999 res!266984) b!449006))

(assert (= (and b!449006 res!266981) b!449005))

(assert (= (and b!449005 res!266989) b!448998))

(assert (= (and b!448998 res!266990) b!449000))

(assert (= (and b!449000 res!266980) b!449010))

(assert (= (and b!449001 condMapEmpty!19629) mapIsEmpty!19629))

(assert (= (and b!449001 (not condMapEmpty!19629)) mapNonEmpty!19629))

(get-info :version)

(assert (= (and mapNonEmpty!19629 ((_ is ValueCellFull!5655) mapValue!19629)) b!449007))

(assert (= (and b!449001 ((_ is ValueCellFull!5655) mapDefault!19629)) b!449003))

(assert (= start!40648 b!449001))

(declare-fun m!433363 () Bool)

(assert (=> start!40648 m!433363))

(declare-fun m!433365 () Bool)

(assert (=> start!40648 m!433365))

(declare-fun m!433367 () Bool)

(assert (=> b!449008 m!433367))

(declare-fun m!433369 () Bool)

(assert (=> b!449002 m!433369))

(declare-fun m!433371 () Bool)

(assert (=> b!448998 m!433371))

(declare-fun m!433373 () Bool)

(assert (=> b!448997 m!433373))

(declare-fun m!433375 () Bool)

(assert (=> b!449004 m!433375))

(declare-fun m!433377 () Bool)

(assert (=> mapNonEmpty!19629 m!433377))

(declare-fun m!433379 () Bool)

(assert (=> b!449010 m!433379))

(declare-fun m!433381 () Bool)

(assert (=> b!449010 m!433381))

(declare-fun m!433383 () Bool)

(assert (=> b!449010 m!433383))

(declare-fun m!433385 () Bool)

(assert (=> b!448999 m!433385))

(declare-fun m!433387 () Bool)

(assert (=> b!449005 m!433387))

(declare-fun m!433389 () Bool)

(assert (=> b!449005 m!433389))

(declare-fun m!433391 () Bool)

(assert (=> b!449006 m!433391))

(check-sat (not b!449008) (not b!448997) b_and!18667 (not b!449004) (not b!449002) (not b!449006) (not b_next!10659) (not mapNonEmpty!19629) (not b!449005) tp_is_empty!11997 (not start!40648) (not b!448998) (not b!449010))
(check-sat b_and!18667 (not b_next!10659))
