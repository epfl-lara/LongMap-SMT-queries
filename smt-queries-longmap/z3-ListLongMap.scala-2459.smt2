; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38574 () Bool)

(assert start!38574)

(declare-fun b_free!9111 () Bool)

(declare-fun b_next!9111 () Bool)

(assert (=> start!38574 (= b_free!9111 (not b_next!9111))))

(declare-fun tp!32456 () Bool)

(declare-fun b_and!16497 () Bool)

(assert (=> start!38574 (= tp!32456 b_and!16497)))

(declare-datatypes ((V!14429 0))(
  ( (V!14430 (val!5041 Int)) )
))
(declare-datatypes ((tuple2!6672 0))(
  ( (tuple2!6673 (_1!3347 (_ BitVec 64)) (_2!3347 V!14429)) )
))
(declare-datatypes ((List!6599 0))(
  ( (Nil!6596) (Cons!6595 (h!7451 tuple2!6672) (t!11773 List!6599)) )
))
(declare-datatypes ((ListLongMap!5585 0))(
  ( (ListLongMap!5586 (toList!2808 List!6599)) )
))
(declare-fun call!27998 () ListLongMap!5585)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4653 0))(
  ( (ValueCellFull!4653 (v!7288 V!14429)) (EmptyCell!4653) )
))
(declare-datatypes ((array!23897 0))(
  ( (array!23898 (arr!11398 (Array (_ BitVec 32) ValueCell!4653)) (size!11750 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23897)

(declare-fun bm!27994 () Bool)

(declare-fun zeroValue!515 () V!14429)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14429)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23899 0))(
  ( (array!23900 (arr!11399 (Array (_ BitVec 32) (_ BitVec 64))) (size!11751 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23899)

(declare-fun lt!187559 () array!23899)

(declare-fun c!54623 () Bool)

(declare-fun minValue!515 () V!14429)

(declare-fun getCurrentListMapNoExtraKeys!1025 (array!23899 array!23897 (_ BitVec 32) (_ BitVec 32) V!14429 V!14429 (_ BitVec 32) Int) ListLongMap!5585)

(assert (=> bm!27994 (= call!27998 (getCurrentListMapNoExtraKeys!1025 (ite c!54623 _keys!709 lt!187559) (ite c!54623 _values!549 (array!23898 (store (arr!11398 _values!549) i!563 (ValueCellFull!4653 v!412)) (size!11750 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399289 () Bool)

(declare-fun res!229571 () Bool)

(declare-fun e!241172 () Bool)

(assert (=> b!399289 (=> (not res!229571) (not e!241172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399289 (= res!229571 (validMask!0 mask!1025))))

(declare-fun b!399290 () Bool)

(declare-fun e!241168 () Bool)

(declare-fun tp_is_empty!9993 () Bool)

(assert (=> b!399290 (= e!241168 tp_is_empty!9993)))

(declare-fun b!399291 () Bool)

(declare-fun res!229570 () Bool)

(assert (=> b!399291 (=> (not res!229570) (not e!241172))))

(assert (=> b!399291 (= res!229570 (and (= (size!11750 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11751 _keys!709) (size!11750 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399292 () Bool)

(declare-fun res!229581 () Bool)

(assert (=> b!399292 (=> (not res!229581) (not e!241172))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399292 (= res!229581 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399293 () Bool)

(declare-fun e!241173 () Bool)

(declare-fun call!27997 () ListLongMap!5585)

(assert (=> b!399293 (= e!241173 (= call!27998 call!27997))))

(declare-fun b!399294 () Bool)

(declare-fun e!241169 () Bool)

(assert (=> b!399294 (= e!241169 tp_is_empty!9993)))

(declare-fun mapIsEmpty!16611 () Bool)

(declare-fun mapRes!16611 () Bool)

(assert (=> mapIsEmpty!16611 mapRes!16611))

(declare-fun b!399295 () Bool)

(declare-fun res!229580 () Bool)

(assert (=> b!399295 (=> (not res!229580) (not e!241172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23899 (_ BitVec 32)) Bool)

(assert (=> b!399295 (= res!229580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!27995 () Bool)

(assert (=> bm!27995 (= call!27997 (getCurrentListMapNoExtraKeys!1025 (ite c!54623 lt!187559 _keys!709) (ite c!54623 (array!23898 (store (arr!11398 _values!549) i!563 (ValueCellFull!4653 v!412)) (size!11750 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16611 () Bool)

(declare-fun tp!32457 () Bool)

(assert (=> mapNonEmpty!16611 (= mapRes!16611 (and tp!32457 e!241168))))

(declare-fun mapRest!16611 () (Array (_ BitVec 32) ValueCell!4653))

(declare-fun mapValue!16611 () ValueCell!4653)

(declare-fun mapKey!16611 () (_ BitVec 32))

(assert (=> mapNonEmpty!16611 (= (arr!11398 _values!549) (store mapRest!16611 mapKey!16611 mapValue!16611))))

(declare-fun res!229576 () Bool)

(assert (=> start!38574 (=> (not res!229576) (not e!241172))))

(assert (=> start!38574 (= res!229576 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11751 _keys!709))))))

(assert (=> start!38574 e!241172))

(assert (=> start!38574 tp_is_empty!9993))

(assert (=> start!38574 tp!32456))

(assert (=> start!38574 true))

(declare-fun e!241167 () Bool)

(declare-fun array_inv!8352 (array!23897) Bool)

(assert (=> start!38574 (and (array_inv!8352 _values!549) e!241167)))

(declare-fun array_inv!8353 (array!23899) Bool)

(assert (=> start!38574 (array_inv!8353 _keys!709)))

(declare-fun b!399296 () Bool)

(declare-fun +!1097 (ListLongMap!5585 tuple2!6672) ListLongMap!5585)

(assert (=> b!399296 (= e!241173 (= call!27997 (+!1097 call!27998 (tuple2!6673 k0!794 v!412))))))

(declare-fun b!399297 () Bool)

(declare-fun res!229579 () Bool)

(assert (=> b!399297 (=> (not res!229579) (not e!241172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399297 (= res!229579 (validKeyInArray!0 k0!794))))

(declare-fun b!399298 () Bool)

(declare-fun res!229574 () Bool)

(assert (=> b!399298 (=> (not res!229574) (not e!241172))))

(assert (=> b!399298 (= res!229574 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11751 _keys!709))))))

(declare-fun b!399299 () Bool)

(declare-fun res!229578 () Bool)

(assert (=> b!399299 (=> (not res!229578) (not e!241172))))

(assert (=> b!399299 (= res!229578 (or (= (select (arr!11399 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11399 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399300 () Bool)

(declare-fun e!241170 () Bool)

(assert (=> b!399300 (= e!241172 e!241170)))

(declare-fun res!229572 () Bool)

(assert (=> b!399300 (=> (not res!229572) (not e!241170))))

(assert (=> b!399300 (= res!229572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187559 mask!1025))))

(assert (=> b!399300 (= lt!187559 (array!23900 (store (arr!11399 _keys!709) i!563 k0!794) (size!11751 _keys!709)))))

(declare-fun b!399301 () Bool)

(assert (=> b!399301 (= e!241170 (not true))))

(assert (=> b!399301 e!241173))

(assert (=> b!399301 (= c!54623 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12100 0))(
  ( (Unit!12101) )
))
(declare-fun lt!187558 () Unit!12100)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!308 (array!23899 array!23897 (_ BitVec 32) (_ BitVec 32) V!14429 V!14429 (_ BitVec 32) (_ BitVec 64) V!14429 (_ BitVec 32) Int) Unit!12100)

(assert (=> b!399301 (= lt!187558 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!308 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399302 () Bool)

(assert (=> b!399302 (= e!241167 (and e!241169 mapRes!16611))))

(declare-fun condMapEmpty!16611 () Bool)

(declare-fun mapDefault!16611 () ValueCell!4653)

(assert (=> b!399302 (= condMapEmpty!16611 (= (arr!11398 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4653)) mapDefault!16611)))))

(declare-fun b!399303 () Bool)

(declare-fun res!229573 () Bool)

(assert (=> b!399303 (=> (not res!229573) (not e!241170))))

(declare-datatypes ((List!6600 0))(
  ( (Nil!6597) (Cons!6596 (h!7452 (_ BitVec 64)) (t!11774 List!6600)) )
))
(declare-fun arrayNoDuplicates!0 (array!23899 (_ BitVec 32) List!6600) Bool)

(assert (=> b!399303 (= res!229573 (arrayNoDuplicates!0 lt!187559 #b00000000000000000000000000000000 Nil!6597))))

(declare-fun b!399304 () Bool)

(declare-fun res!229575 () Bool)

(assert (=> b!399304 (=> (not res!229575) (not e!241172))))

(assert (=> b!399304 (= res!229575 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6597))))

(declare-fun b!399305 () Bool)

(declare-fun res!229577 () Bool)

(assert (=> b!399305 (=> (not res!229577) (not e!241170))))

(assert (=> b!399305 (= res!229577 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11751 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38574 res!229576) b!399289))

(assert (= (and b!399289 res!229571) b!399291))

(assert (= (and b!399291 res!229570) b!399295))

(assert (= (and b!399295 res!229580) b!399304))

(assert (= (and b!399304 res!229575) b!399298))

(assert (= (and b!399298 res!229574) b!399297))

(assert (= (and b!399297 res!229579) b!399299))

(assert (= (and b!399299 res!229578) b!399292))

(assert (= (and b!399292 res!229581) b!399300))

(assert (= (and b!399300 res!229572) b!399303))

(assert (= (and b!399303 res!229573) b!399305))

(assert (= (and b!399305 res!229577) b!399301))

(assert (= (and b!399301 c!54623) b!399296))

(assert (= (and b!399301 (not c!54623)) b!399293))

(assert (= (or b!399296 b!399293) bm!27995))

(assert (= (or b!399296 b!399293) bm!27994))

(assert (= (and b!399302 condMapEmpty!16611) mapIsEmpty!16611))

(assert (= (and b!399302 (not condMapEmpty!16611)) mapNonEmpty!16611))

(get-info :version)

(assert (= (and mapNonEmpty!16611 ((_ is ValueCellFull!4653) mapValue!16611)) b!399290))

(assert (= (and b!399302 ((_ is ValueCellFull!4653) mapDefault!16611)) b!399294))

(assert (= start!38574 b!399302))

(declare-fun m!393863 () Bool)

(assert (=> b!399295 m!393863))

(declare-fun m!393865 () Bool)

(assert (=> b!399300 m!393865))

(declare-fun m!393867 () Bool)

(assert (=> b!399300 m!393867))

(declare-fun m!393869 () Bool)

(assert (=> b!399304 m!393869))

(declare-fun m!393871 () Bool)

(assert (=> start!38574 m!393871))

(declare-fun m!393873 () Bool)

(assert (=> start!38574 m!393873))

(declare-fun m!393875 () Bool)

(assert (=> b!399292 m!393875))

(declare-fun m!393877 () Bool)

(assert (=> b!399301 m!393877))

(declare-fun m!393879 () Bool)

(assert (=> bm!27994 m!393879))

(declare-fun m!393881 () Bool)

(assert (=> bm!27994 m!393881))

(declare-fun m!393883 () Bool)

(assert (=> b!399297 m!393883))

(declare-fun m!393885 () Bool)

(assert (=> b!399296 m!393885))

(declare-fun m!393887 () Bool)

(assert (=> b!399303 m!393887))

(declare-fun m!393889 () Bool)

(assert (=> b!399299 m!393889))

(assert (=> bm!27995 m!393879))

(declare-fun m!393891 () Bool)

(assert (=> bm!27995 m!393891))

(declare-fun m!393893 () Bool)

(assert (=> mapNonEmpty!16611 m!393893))

(declare-fun m!393895 () Bool)

(assert (=> b!399289 m!393895))

(check-sat (not b!399303) tp_is_empty!9993 (not b_next!9111) (not b!399300) (not b!399304) (not mapNonEmpty!16611) (not b!399296) (not b!399289) (not b!399297) (not b!399295) (not start!38574) (not bm!27995) b_and!16497 (not bm!27994) (not b!399292) (not b!399301))
(check-sat b_and!16497 (not b_next!9111))
