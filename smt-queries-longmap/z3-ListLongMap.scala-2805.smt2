; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40704 () Bool)

(assert start!40704)

(declare-fun b_free!10729 () Bool)

(declare-fun b_next!10729 () Bool)

(assert (=> start!40704 (= b_free!10729 (not b_next!10729))))

(declare-fun tp!38006 () Bool)

(declare-fun b_and!18711 () Bool)

(assert (=> start!40704 (= tp!38006 b_and!18711)))

(declare-fun b!450462 () Bool)

(declare-fun res!268185 () Bool)

(declare-fun e!263927 () Bool)

(assert (=> b!450462 (=> (not res!268185) (not e!263927))))

(declare-datatypes ((array!27935 0))(
  ( (array!27936 (arr!13413 (Array (_ BitVec 32) (_ BitVec 64))) (size!13766 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27935)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17195 0))(
  ( (V!17196 (val!6078 Int)) )
))
(declare-datatypes ((ValueCell!5690 0))(
  ( (ValueCellFull!5690 (v!8327 V!17195)) (EmptyCell!5690) )
))
(declare-datatypes ((array!27937 0))(
  ( (array!27938 (arr!13414 (Array (_ BitVec 32) ValueCell!5690)) (size!13767 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27937)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!450462 (= res!268185 (and (= (size!13767 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13766 _keys!709) (size!13767 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!17195)

(declare-fun zeroValue!515 () V!17195)

(declare-fun bm!29751 () Bool)

(declare-fun c!55929 () Bool)

(declare-fun lt!204458 () array!27937)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204459 () array!27935)

(declare-datatypes ((tuple2!7998 0))(
  ( (tuple2!7999 (_1!4010 (_ BitVec 64)) (_2!4010 V!17195)) )
))
(declare-datatypes ((List!8061 0))(
  ( (Nil!8058) (Cons!8057 (h!8913 tuple2!7998) (t!13814 List!8061)) )
))
(declare-datatypes ((ListLongMap!6901 0))(
  ( (ListLongMap!6902 (toList!3466 List!8061)) )
))
(declare-fun call!29755 () ListLongMap!6901)

(declare-fun getCurrentListMapNoExtraKeys!1663 (array!27935 array!27937 (_ BitVec 32) (_ BitVec 32) V!17195 V!17195 (_ BitVec 32) Int) ListLongMap!6901)

(assert (=> bm!29751 (= call!29755 (getCurrentListMapNoExtraKeys!1663 (ite c!55929 lt!204459 _keys!709) (ite c!55929 lt!204458 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450463 () Bool)

(declare-fun e!263924 () Bool)

(declare-fun e!263919 () Bool)

(declare-fun mapRes!19734 () Bool)

(assert (=> b!450463 (= e!263924 (and e!263919 mapRes!19734))))

(declare-fun condMapEmpty!19734 () Bool)

(declare-fun mapDefault!19734 () ValueCell!5690)

(assert (=> b!450463 (= condMapEmpty!19734 (= (arr!13414 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5690)) mapDefault!19734)))))

(declare-fun b!450464 () Bool)

(declare-fun tp_is_empty!12067 () Bool)

(assert (=> b!450464 (= e!263919 tp_is_empty!12067)))

(declare-fun b!450465 () Bool)

(declare-fun e!263923 () Bool)

(assert (=> b!450465 (= e!263927 e!263923)))

(declare-fun res!268183 () Bool)

(assert (=> b!450465 (=> (not res!268183) (not e!263923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27935 (_ BitVec 32)) Bool)

(assert (=> b!450465 (= res!268183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204459 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450465 (= lt!204459 (array!27936 (store (arr!13413 _keys!709) i!563 k0!794) (size!13766 _keys!709)))))

(declare-fun call!29754 () ListLongMap!6901)

(declare-fun b!450466 () Bool)

(declare-fun e!263922 () Bool)

(declare-fun v!412 () V!17195)

(declare-fun +!1570 (ListLongMap!6901 tuple2!7998) ListLongMap!6901)

(assert (=> b!450466 (= e!263922 (= call!29755 (+!1570 call!29754 (tuple2!7999 k0!794 v!412))))))

(declare-fun b!450467 () Bool)

(declare-fun res!268178 () Bool)

(assert (=> b!450467 (=> (not res!268178) (not e!263927))))

(declare-fun arrayContainsKey!0 (array!27935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450467 (= res!268178 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450469 () Bool)

(declare-fun res!268187 () Bool)

(assert (=> b!450469 (=> (not res!268187) (not e!263927))))

(assert (=> b!450469 (= res!268187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450470 () Bool)

(declare-fun res!268186 () Bool)

(assert (=> b!450470 (=> (not res!268186) (not e!263923))))

(declare-datatypes ((List!8062 0))(
  ( (Nil!8059) (Cons!8058 (h!8914 (_ BitVec 64)) (t!13815 List!8062)) )
))
(declare-fun arrayNoDuplicates!0 (array!27935 (_ BitVec 32) List!8062) Bool)

(assert (=> b!450470 (= res!268186 (arrayNoDuplicates!0 lt!204459 #b00000000000000000000000000000000 Nil!8059))))

(declare-fun bm!29752 () Bool)

(assert (=> bm!29752 (= call!29754 (getCurrentListMapNoExtraKeys!1663 (ite c!55929 _keys!709 lt!204459) (ite c!55929 _values!549 lt!204458) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19734 () Bool)

(assert (=> mapIsEmpty!19734 mapRes!19734))

(declare-fun b!450471 () Bool)

(declare-fun res!268189 () Bool)

(assert (=> b!450471 (=> (not res!268189) (not e!263927))))

(assert (=> b!450471 (= res!268189 (or (= (select (arr!13413 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13413 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450472 () Bool)

(declare-fun res!268191 () Bool)

(assert (=> b!450472 (=> (not res!268191) (not e!263927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450472 (= res!268191 (validMask!0 mask!1025))))

(declare-fun b!450473 () Bool)

(declare-fun res!268179 () Bool)

(assert (=> b!450473 (=> (not res!268179) (not e!263923))))

(assert (=> b!450473 (= res!268179 (bvsle from!863 i!563))))

(declare-fun b!450474 () Bool)

(declare-fun e!263925 () Bool)

(assert (=> b!450474 (= e!263925 (bvslt from!863 (size!13766 _keys!709)))))

(declare-fun lt!204455 () ListLongMap!6901)

(assert (=> b!450474 (= lt!204455 (getCurrentListMapNoExtraKeys!1663 lt!204459 lt!204458 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450475 () Bool)

(declare-fun e!263926 () Bool)

(assert (=> b!450475 (= e!263926 (not e!263925))))

(declare-fun res!268190 () Bool)

(assert (=> b!450475 (=> res!268190 e!263925)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450475 (= res!268190 (validKeyInArray!0 (select (arr!13413 _keys!709) from!863)))))

(assert (=> b!450475 e!263922))

(assert (=> b!450475 (= c!55929 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13157 0))(
  ( (Unit!13158) )
))
(declare-fun lt!204457 () Unit!13157)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!706 (array!27935 array!27937 (_ BitVec 32) (_ BitVec 32) V!17195 V!17195 (_ BitVec 32) (_ BitVec 64) V!17195 (_ BitVec 32) Int) Unit!13157)

(assert (=> b!450475 (= lt!204457 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!706 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19734 () Bool)

(declare-fun tp!38007 () Bool)

(declare-fun e!263921 () Bool)

(assert (=> mapNonEmpty!19734 (= mapRes!19734 (and tp!38007 e!263921))))

(declare-fun mapValue!19734 () ValueCell!5690)

(declare-fun mapKey!19734 () (_ BitVec 32))

(declare-fun mapRest!19734 () (Array (_ BitVec 32) ValueCell!5690))

(assert (=> mapNonEmpty!19734 (= (arr!13414 _values!549) (store mapRest!19734 mapKey!19734 mapValue!19734))))

(declare-fun b!450476 () Bool)

(declare-fun res!268180 () Bool)

(assert (=> b!450476 (=> (not res!268180) (not e!263927))))

(assert (=> b!450476 (= res!268180 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13766 _keys!709))))))

(declare-fun b!450477 () Bool)

(assert (=> b!450477 (= e!263922 (= call!29754 call!29755))))

(declare-fun b!450478 () Bool)

(assert (=> b!450478 (= e!263923 e!263926)))

(declare-fun res!268188 () Bool)

(assert (=> b!450478 (=> (not res!268188) (not e!263926))))

(assert (=> b!450478 (= res!268188 (= from!863 i!563))))

(declare-fun lt!204454 () ListLongMap!6901)

(assert (=> b!450478 (= lt!204454 (getCurrentListMapNoExtraKeys!1663 lt!204459 lt!204458 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450478 (= lt!204458 (array!27938 (store (arr!13414 _values!549) i!563 (ValueCellFull!5690 v!412)) (size!13767 _values!549)))))

(declare-fun lt!204456 () ListLongMap!6901)

(assert (=> b!450478 (= lt!204456 (getCurrentListMapNoExtraKeys!1663 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!268184 () Bool)

(assert (=> start!40704 (=> (not res!268184) (not e!263927))))

(assert (=> start!40704 (= res!268184 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13766 _keys!709))))))

(assert (=> start!40704 e!263927))

(assert (=> start!40704 tp_is_empty!12067))

(assert (=> start!40704 tp!38006))

(assert (=> start!40704 true))

(declare-fun array_inv!9778 (array!27937) Bool)

(assert (=> start!40704 (and (array_inv!9778 _values!549) e!263924)))

(declare-fun array_inv!9779 (array!27935) Bool)

(assert (=> start!40704 (array_inv!9779 _keys!709)))

(declare-fun b!450468 () Bool)

(declare-fun res!268181 () Bool)

(assert (=> b!450468 (=> (not res!268181) (not e!263927))))

(assert (=> b!450468 (= res!268181 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8059))))

(declare-fun b!450479 () Bool)

(declare-fun res!268182 () Bool)

(assert (=> b!450479 (=> (not res!268182) (not e!263927))))

(assert (=> b!450479 (= res!268182 (validKeyInArray!0 k0!794))))

(declare-fun b!450480 () Bool)

(assert (=> b!450480 (= e!263921 tp_is_empty!12067)))

(assert (= (and start!40704 res!268184) b!450472))

(assert (= (and b!450472 res!268191) b!450462))

(assert (= (and b!450462 res!268185) b!450469))

(assert (= (and b!450469 res!268187) b!450468))

(assert (= (and b!450468 res!268181) b!450476))

(assert (= (and b!450476 res!268180) b!450479))

(assert (= (and b!450479 res!268182) b!450471))

(assert (= (and b!450471 res!268189) b!450467))

(assert (= (and b!450467 res!268178) b!450465))

(assert (= (and b!450465 res!268183) b!450470))

(assert (= (and b!450470 res!268186) b!450473))

(assert (= (and b!450473 res!268179) b!450478))

(assert (= (and b!450478 res!268188) b!450475))

(assert (= (and b!450475 c!55929) b!450466))

(assert (= (and b!450475 (not c!55929)) b!450477))

(assert (= (or b!450466 b!450477) bm!29751))

(assert (= (or b!450466 b!450477) bm!29752))

(assert (= (and b!450475 (not res!268190)) b!450474))

(assert (= (and b!450463 condMapEmpty!19734) mapIsEmpty!19734))

(assert (= (and b!450463 (not condMapEmpty!19734)) mapNonEmpty!19734))

(get-info :version)

(assert (= (and mapNonEmpty!19734 ((_ is ValueCellFull!5690) mapValue!19734)) b!450480))

(assert (= (and b!450463 ((_ is ValueCellFull!5690) mapDefault!19734)) b!450464))

(assert (= start!40704 b!450463))

(declare-fun m!433825 () Bool)

(assert (=> b!450467 m!433825))

(declare-fun m!433827 () Bool)

(assert (=> b!450466 m!433827))

(declare-fun m!433829 () Bool)

(assert (=> b!450471 m!433829))

(declare-fun m!433831 () Bool)

(assert (=> b!450469 m!433831))

(declare-fun m!433833 () Bool)

(assert (=> b!450475 m!433833))

(assert (=> b!450475 m!433833))

(declare-fun m!433835 () Bool)

(assert (=> b!450475 m!433835))

(declare-fun m!433837 () Bool)

(assert (=> b!450475 m!433837))

(declare-fun m!433839 () Bool)

(assert (=> bm!29751 m!433839))

(declare-fun m!433841 () Bool)

(assert (=> b!450474 m!433841))

(declare-fun m!433843 () Bool)

(assert (=> bm!29752 m!433843))

(declare-fun m!433845 () Bool)

(assert (=> b!450470 m!433845))

(declare-fun m!433847 () Bool)

(assert (=> b!450468 m!433847))

(declare-fun m!433849 () Bool)

(assert (=> b!450465 m!433849))

(declare-fun m!433851 () Bool)

(assert (=> b!450465 m!433851))

(declare-fun m!433853 () Bool)

(assert (=> b!450479 m!433853))

(declare-fun m!433855 () Bool)

(assert (=> b!450472 m!433855))

(declare-fun m!433857 () Bool)

(assert (=> start!40704 m!433857))

(declare-fun m!433859 () Bool)

(assert (=> start!40704 m!433859))

(declare-fun m!433861 () Bool)

(assert (=> mapNonEmpty!19734 m!433861))

(declare-fun m!433863 () Bool)

(assert (=> b!450478 m!433863))

(declare-fun m!433865 () Bool)

(assert (=> b!450478 m!433865))

(declare-fun m!433867 () Bool)

(assert (=> b!450478 m!433867))

(check-sat (not start!40704) (not b!450469) (not b!450466) (not mapNonEmpty!19734) (not b!450468) (not b!450474) b_and!18711 (not b!450472) (not bm!29752) (not b_next!10729) (not b!450479) (not b!450467) (not b!450465) (not b!450470) (not b!450478) (not bm!29751) tp_is_empty!12067 (not b!450475))
(check-sat b_and!18711 (not b_next!10729))
