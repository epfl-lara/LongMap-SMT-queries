; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38546 () Bool)

(assert start!38546)

(declare-fun b_free!9097 () Bool)

(declare-fun b_next!9097 () Bool)

(assert (=> start!38546 (= b_free!9097 (not b_next!9097))))

(declare-fun tp!32414 () Bool)

(declare-fun b_and!16457 () Bool)

(assert (=> start!38546 (= tp!32414 b_and!16457)))

(declare-fun mapNonEmpty!16590 () Bool)

(declare-fun mapRes!16590 () Bool)

(declare-fun tp!32415 () Bool)

(declare-fun e!240851 () Bool)

(assert (=> mapNonEmpty!16590 (= mapRes!16590 (and tp!32415 e!240851))))

(declare-datatypes ((V!14411 0))(
  ( (V!14412 (val!5034 Int)) )
))
(declare-datatypes ((ValueCell!4646 0))(
  ( (ValueCellFull!4646 (v!7275 V!14411)) (EmptyCell!4646) )
))
(declare-datatypes ((array!23847 0))(
  ( (array!23848 (arr!11373 (Array (_ BitVec 32) ValueCell!4646)) (size!11726 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23847)

(declare-fun mapValue!16590 () ValueCell!4646)

(declare-fun mapKey!16590 () (_ BitVec 32))

(declare-fun mapRest!16590 () (Array (_ BitVec 32) ValueCell!4646))

(assert (=> mapNonEmpty!16590 (= (arr!11373 _values!549) (store mapRest!16590 mapKey!16590 mapValue!16590))))

(declare-fun b!398661 () Bool)

(declare-fun res!229195 () Bool)

(declare-fun e!240849 () Bool)

(assert (=> b!398661 (=> (not res!229195) (not e!240849))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398661 (= res!229195 (validKeyInArray!0 k0!794))))

(declare-fun b!398662 () Bool)

(declare-fun res!229192 () Bool)

(assert (=> b!398662 (=> (not res!229192) (not e!240849))))

(declare-datatypes ((array!23849 0))(
  ( (array!23850 (arr!11374 (Array (_ BitVec 32) (_ BitVec 64))) (size!11727 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23849)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23849 (_ BitVec 32)) Bool)

(assert (=> b!398662 (= res!229192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398663 () Bool)

(declare-fun res!229200 () Bool)

(declare-fun e!240850 () Bool)

(assert (=> b!398663 (=> (not res!229200) (not e!240850))))

(declare-fun lt!187283 () array!23849)

(declare-datatypes ((List!6544 0))(
  ( (Nil!6541) (Cons!6540 (h!7396 (_ BitVec 64)) (t!11709 List!6544)) )
))
(declare-fun arrayNoDuplicates!0 (array!23849 (_ BitVec 32) List!6544) Bool)

(assert (=> b!398663 (= res!229200 (arrayNoDuplicates!0 lt!187283 #b00000000000000000000000000000000 Nil!6541))))

(declare-fun b!398664 () Bool)

(declare-fun res!229189 () Bool)

(assert (=> b!398664 (=> (not res!229189) (not e!240849))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398664 (= res!229189 (or (= (select (arr!11374 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11374 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!515 () V!14411)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6632 0))(
  ( (tuple2!6633 (_1!3327 (_ BitVec 64)) (_2!3327 V!14411)) )
))
(declare-datatypes ((List!6545 0))(
  ( (Nil!6542) (Cons!6541 (h!7397 tuple2!6632) (t!11710 List!6545)) )
))
(declare-datatypes ((ListLongMap!5535 0))(
  ( (ListLongMap!5536 (toList!2783 List!6545)) )
))
(declare-fun call!27930 () ListLongMap!5535)

(declare-fun c!54531 () Bool)

(declare-fun bm!27927 () Bool)

(declare-fun v!412 () V!14411)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14411)

(declare-fun getCurrentListMapNoExtraKeys!1004 (array!23849 array!23847 (_ BitVec 32) (_ BitVec 32) V!14411 V!14411 (_ BitVec 32) Int) ListLongMap!5535)

(assert (=> bm!27927 (= call!27930 (getCurrentListMapNoExtraKeys!1004 (ite c!54531 lt!187283 _keys!709) (ite c!54531 (array!23848 (store (arr!11373 _values!549) i!563 (ValueCellFull!4646 v!412)) (size!11726 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398665 () Bool)

(declare-fun e!240847 () Bool)

(declare-fun call!27931 () ListLongMap!5535)

(assert (=> b!398665 (= e!240847 (= call!27931 call!27930))))

(declare-fun b!398666 () Bool)

(declare-fun res!229199 () Bool)

(assert (=> b!398666 (=> (not res!229199) (not e!240849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398666 (= res!229199 (validMask!0 mask!1025))))

(declare-fun b!398667 () Bool)

(declare-fun res!229197 () Bool)

(assert (=> b!398667 (=> (not res!229197) (not e!240849))))

(assert (=> b!398667 (= res!229197 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6541))))

(declare-fun b!398668 () Bool)

(declare-fun e!240846 () Bool)

(declare-fun e!240852 () Bool)

(assert (=> b!398668 (= e!240846 (and e!240852 mapRes!16590))))

(declare-fun condMapEmpty!16590 () Bool)

(declare-fun mapDefault!16590 () ValueCell!4646)

(assert (=> b!398668 (= condMapEmpty!16590 (= (arr!11373 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4646)) mapDefault!16590)))))

(declare-fun b!398669 () Bool)

(declare-fun tp_is_empty!9979 () Bool)

(assert (=> b!398669 (= e!240852 tp_is_empty!9979)))

(declare-fun b!398670 () Bool)

(assert (=> b!398670 (= e!240851 tp_is_empty!9979)))

(declare-fun b!398671 () Bool)

(declare-fun res!229191 () Bool)

(assert (=> b!398671 (=> (not res!229191) (not e!240849))))

(declare-fun arrayContainsKey!0 (array!23849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398671 (= res!229191 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16590 () Bool)

(assert (=> mapIsEmpty!16590 mapRes!16590))

(declare-fun b!398673 () Bool)

(declare-fun res!229190 () Bool)

(assert (=> b!398673 (=> (not res!229190) (not e!240850))))

(assert (=> b!398673 (= res!229190 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11727 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398674 () Bool)

(declare-fun res!229193 () Bool)

(assert (=> b!398674 (=> (not res!229193) (not e!240849))))

(assert (=> b!398674 (= res!229193 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11727 _keys!709))))))

(declare-fun b!398675 () Bool)

(declare-fun +!1101 (ListLongMap!5535 tuple2!6632) ListLongMap!5535)

(assert (=> b!398675 (= e!240847 (= call!27930 (+!1101 call!27931 (tuple2!6633 k0!794 v!412))))))

(declare-fun bm!27928 () Bool)

(assert (=> bm!27928 (= call!27931 (getCurrentListMapNoExtraKeys!1004 (ite c!54531 _keys!709 lt!187283) (ite c!54531 _values!549 (array!23848 (store (arr!11373 _values!549) i!563 (ValueCellFull!4646 v!412)) (size!11726 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398676 () Bool)

(assert (=> b!398676 (= e!240849 e!240850)))

(declare-fun res!229196 () Bool)

(assert (=> b!398676 (=> (not res!229196) (not e!240850))))

(assert (=> b!398676 (= res!229196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187283 mask!1025))))

(assert (=> b!398676 (= lt!187283 (array!23850 (store (arr!11374 _keys!709) i!563 k0!794) (size!11727 _keys!709)))))

(declare-fun b!398677 () Bool)

(assert (=> b!398677 (= e!240850 (not true))))

(assert (=> b!398677 e!240847))

(assert (=> b!398677 (= c!54531 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12062 0))(
  ( (Unit!12063) )
))
(declare-fun lt!187282 () Unit!12062)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!294 (array!23849 array!23847 (_ BitVec 32) (_ BitVec 32) V!14411 V!14411 (_ BitVec 32) (_ BitVec 64) V!14411 (_ BitVec 32) Int) Unit!12062)

(assert (=> b!398677 (= lt!187282 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!294 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!229198 () Bool)

(assert (=> start!38546 (=> (not res!229198) (not e!240849))))

(assert (=> start!38546 (= res!229198 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11727 _keys!709))))))

(assert (=> start!38546 e!240849))

(assert (=> start!38546 tp_is_empty!9979))

(assert (=> start!38546 tp!32414))

(assert (=> start!38546 true))

(declare-fun array_inv!8348 (array!23847) Bool)

(assert (=> start!38546 (and (array_inv!8348 _values!549) e!240846)))

(declare-fun array_inv!8349 (array!23849) Bool)

(assert (=> start!38546 (array_inv!8349 _keys!709)))

(declare-fun b!398672 () Bool)

(declare-fun res!229194 () Bool)

(assert (=> b!398672 (=> (not res!229194) (not e!240849))))

(assert (=> b!398672 (= res!229194 (and (= (size!11726 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11727 _keys!709) (size!11726 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38546 res!229198) b!398666))

(assert (= (and b!398666 res!229199) b!398672))

(assert (= (and b!398672 res!229194) b!398662))

(assert (= (and b!398662 res!229192) b!398667))

(assert (= (and b!398667 res!229197) b!398674))

(assert (= (and b!398674 res!229193) b!398661))

(assert (= (and b!398661 res!229195) b!398664))

(assert (= (and b!398664 res!229189) b!398671))

(assert (= (and b!398671 res!229191) b!398676))

(assert (= (and b!398676 res!229196) b!398663))

(assert (= (and b!398663 res!229200) b!398673))

(assert (= (and b!398673 res!229190) b!398677))

(assert (= (and b!398677 c!54531) b!398675))

(assert (= (and b!398677 (not c!54531)) b!398665))

(assert (= (or b!398675 b!398665) bm!27927))

(assert (= (or b!398675 b!398665) bm!27928))

(assert (= (and b!398668 condMapEmpty!16590) mapIsEmpty!16590))

(assert (= (and b!398668 (not condMapEmpty!16590)) mapNonEmpty!16590))

(get-info :version)

(assert (= (and mapNonEmpty!16590 ((_ is ValueCellFull!4646) mapValue!16590)) b!398670))

(assert (= (and b!398668 ((_ is ValueCellFull!4646) mapDefault!16590)) b!398669))

(assert (= start!38546 b!398668))

(declare-fun m!392901 () Bool)

(assert (=> bm!27928 m!392901))

(declare-fun m!392903 () Bool)

(assert (=> bm!27928 m!392903))

(declare-fun m!392905 () Bool)

(assert (=> b!398663 m!392905))

(declare-fun m!392907 () Bool)

(assert (=> b!398666 m!392907))

(assert (=> bm!27927 m!392901))

(declare-fun m!392909 () Bool)

(assert (=> bm!27927 m!392909))

(declare-fun m!392911 () Bool)

(assert (=> mapNonEmpty!16590 m!392911))

(declare-fun m!392913 () Bool)

(assert (=> b!398667 m!392913))

(declare-fun m!392915 () Bool)

(assert (=> b!398662 m!392915))

(declare-fun m!392917 () Bool)

(assert (=> b!398661 m!392917))

(declare-fun m!392919 () Bool)

(assert (=> b!398664 m!392919))

(declare-fun m!392921 () Bool)

(assert (=> b!398676 m!392921))

(declare-fun m!392923 () Bool)

(assert (=> b!398676 m!392923))

(declare-fun m!392925 () Bool)

(assert (=> b!398675 m!392925))

(declare-fun m!392927 () Bool)

(assert (=> b!398677 m!392927))

(declare-fun m!392929 () Bool)

(assert (=> start!38546 m!392929))

(declare-fun m!392931 () Bool)

(assert (=> start!38546 m!392931))

(declare-fun m!392933 () Bool)

(assert (=> b!398671 m!392933))

(check-sat (not b!398662) (not mapNonEmpty!16590) (not b!398661) (not b!398675) (not bm!27927) (not b!398663) b_and!16457 (not b!398671) (not b_next!9097) (not b!398666) (not b!398667) (not bm!27928) tp_is_empty!9979 (not start!38546) (not b!398677) (not b!398676))
(check-sat b_and!16457 (not b_next!9097))
