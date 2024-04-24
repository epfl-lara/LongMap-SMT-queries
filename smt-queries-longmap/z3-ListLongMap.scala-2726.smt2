; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40160 () Bool)

(assert start!40160)

(declare-fun b_free!10441 () Bool)

(declare-fun b_next!10441 () Bool)

(assert (=> start!40160 (= b_free!10441 (not b_next!10441))))

(declare-fun tp!36852 () Bool)

(declare-fun b_and!18423 () Bool)

(assert (=> start!40160 (= tp!36852 b_and!18423)))

(declare-fun b!439891 () Bool)

(declare-fun res!260088 () Bool)

(declare-fun e!259242 () Bool)

(assert (=> b!439891 (=> (not res!260088) (not e!259242))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439891 (= res!260088 (validKeyInArray!0 k0!794))))

(declare-fun b!439892 () Bool)

(declare-fun e!259244 () Bool)

(declare-fun tp_is_empty!11593 () Bool)

(assert (=> b!439892 (= e!259244 tp_is_empty!11593)))

(declare-fun b!439893 () Bool)

(declare-fun res!260089 () Bool)

(assert (=> b!439893 (=> (not res!260089) (not e!259242))))

(declare-datatypes ((array!27008 0))(
  ( (array!27009 (arr!12953 (Array (_ BitVec 32) (_ BitVec 64))) (size!13305 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27008)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16563 0))(
  ( (V!16564 (val!5841 Int)) )
))
(declare-datatypes ((ValueCell!5453 0))(
  ( (ValueCellFull!5453 (v!8089 V!16563)) (EmptyCell!5453) )
))
(declare-datatypes ((array!27010 0))(
  ( (array!27011 (arr!12954 (Array (_ BitVec 32) ValueCell!5453)) (size!13306 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27010)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!439893 (= res!260089 (and (= (size!13306 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13305 _keys!709) (size!13306 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439894 () Bool)

(declare-fun res!260094 () Bool)

(assert (=> b!439894 (=> (not res!260094) (not e!259242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27008 (_ BitVec 32)) Bool)

(assert (=> b!439894 (= res!260094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439895 () Bool)

(declare-fun res!260092 () Bool)

(declare-fun e!259243 () Bool)

(assert (=> b!439895 (=> (not res!260092) (not e!259243))))

(declare-fun lt!202446 () array!27008)

(declare-datatypes ((List!7654 0))(
  ( (Nil!7651) (Cons!7650 (h!8506 (_ BitVec 64)) (t!13402 List!7654)) )
))
(declare-fun arrayNoDuplicates!0 (array!27008 (_ BitVec 32) List!7654) Bool)

(assert (=> b!439895 (= res!260092 (arrayNoDuplicates!0 lt!202446 #b00000000000000000000000000000000 Nil!7651))))

(declare-fun b!439897 () Bool)

(declare-fun res!260091 () Bool)

(assert (=> b!439897 (=> (not res!260091) (not e!259243))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439897 (= res!260091 (bvsle from!863 i!563))))

(declare-fun b!439898 () Bool)

(declare-fun res!260090 () Bool)

(assert (=> b!439898 (=> (not res!260090) (not e!259242))))

(assert (=> b!439898 (= res!260090 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7651))))

(declare-fun b!439899 () Bool)

(declare-fun res!260095 () Bool)

(assert (=> b!439899 (=> (not res!260095) (not e!259242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439899 (= res!260095 (validMask!0 mask!1025))))

(declare-fun b!439900 () Bool)

(declare-fun e!259240 () Bool)

(declare-fun mapRes!19011 () Bool)

(assert (=> b!439900 (= e!259240 (and e!259244 mapRes!19011))))

(declare-fun condMapEmpty!19011 () Bool)

(declare-fun mapDefault!19011 () ValueCell!5453)

(assert (=> b!439900 (= condMapEmpty!19011 (= (arr!12954 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5453)) mapDefault!19011)))))

(declare-fun b!439901 () Bool)

(declare-fun e!259246 () Bool)

(assert (=> b!439901 (= e!259246 tp_is_empty!11593)))

(declare-fun b!439902 () Bool)

(declare-fun e!259245 () Bool)

(assert (=> b!439902 (= e!259243 e!259245)))

(declare-fun res!260100 () Bool)

(assert (=> b!439902 (=> (not res!260100) (not e!259245))))

(assert (=> b!439902 (= res!260100 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!7666 0))(
  ( (tuple2!7667 (_1!3844 (_ BitVec 64)) (_2!3844 V!16563)) )
))
(declare-datatypes ((List!7655 0))(
  ( (Nil!7652) (Cons!7651 (h!8507 tuple2!7666) (t!13403 List!7655)) )
))
(declare-datatypes ((ListLongMap!6581 0))(
  ( (ListLongMap!6582 (toList!3306 List!7655)) )
))
(declare-fun lt!202448 () ListLongMap!6581)

(declare-fun minValue!515 () V!16563)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16563)

(declare-fun lt!202445 () array!27010)

(declare-fun getCurrentListMapNoExtraKeys!1539 (array!27008 array!27010 (_ BitVec 32) (_ BitVec 32) V!16563 V!16563 (_ BitVec 32) Int) ListLongMap!6581)

(assert (=> b!439902 (= lt!202448 (getCurrentListMapNoExtraKeys!1539 lt!202446 lt!202445 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16563)

(assert (=> b!439902 (= lt!202445 (array!27011 (store (arr!12954 _values!549) i!563 (ValueCellFull!5453 v!412)) (size!13306 _values!549)))))

(declare-fun lt!202449 () ListLongMap!6581)

(assert (=> b!439902 (= lt!202449 (getCurrentListMapNoExtraKeys!1539 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439896 () Bool)

(declare-fun res!260093 () Bool)

(assert (=> b!439896 (=> (not res!260093) (not e!259242))))

(declare-fun arrayContainsKey!0 (array!27008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439896 (= res!260093 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!260096 () Bool)

(assert (=> start!40160 (=> (not res!260096) (not e!259242))))

(assert (=> start!40160 (= res!260096 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13305 _keys!709))))))

(assert (=> start!40160 e!259242))

(assert (=> start!40160 tp_is_empty!11593))

(assert (=> start!40160 tp!36852))

(assert (=> start!40160 true))

(declare-fun array_inv!9470 (array!27010) Bool)

(assert (=> start!40160 (and (array_inv!9470 _values!549) e!259240)))

(declare-fun array_inv!9471 (array!27008) Bool)

(assert (=> start!40160 (array_inv!9471 _keys!709)))

(declare-fun mapIsEmpty!19011 () Bool)

(assert (=> mapIsEmpty!19011 mapRes!19011))

(declare-fun b!439903 () Bool)

(declare-fun res!260098 () Bool)

(assert (=> b!439903 (=> (not res!260098) (not e!259242))))

(assert (=> b!439903 (= res!260098 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13305 _keys!709))))))

(declare-fun b!439904 () Bool)

(declare-fun res!260099 () Bool)

(assert (=> b!439904 (=> (not res!260099) (not e!259242))))

(assert (=> b!439904 (= res!260099 (or (= (select (arr!12953 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12953 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19011 () Bool)

(declare-fun tp!36851 () Bool)

(assert (=> mapNonEmpty!19011 (= mapRes!19011 (and tp!36851 e!259246))))

(declare-fun mapValue!19011 () ValueCell!5453)

(declare-fun mapRest!19011 () (Array (_ BitVec 32) ValueCell!5453))

(declare-fun mapKey!19011 () (_ BitVec 32))

(assert (=> mapNonEmpty!19011 (= (arr!12954 _values!549) (store mapRest!19011 mapKey!19011 mapValue!19011))))

(declare-fun b!439905 () Bool)

(assert (=> b!439905 (= e!259245 (not true))))

(declare-fun +!1499 (ListLongMap!6581 tuple2!7666) ListLongMap!6581)

(assert (=> b!439905 (= (getCurrentListMapNoExtraKeys!1539 lt!202446 lt!202445 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1499 (getCurrentListMapNoExtraKeys!1539 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7667 k0!794 v!412)))))

(declare-datatypes ((Unit!13073 0))(
  ( (Unit!13074) )
))
(declare-fun lt!202447 () Unit!13073)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!659 (array!27008 array!27010 (_ BitVec 32) (_ BitVec 32) V!16563 V!16563 (_ BitVec 32) (_ BitVec 64) V!16563 (_ BitVec 32) Int) Unit!13073)

(assert (=> b!439905 (= lt!202447 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!659 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439906 () Bool)

(assert (=> b!439906 (= e!259242 e!259243)))

(declare-fun res!260097 () Bool)

(assert (=> b!439906 (=> (not res!260097) (not e!259243))))

(assert (=> b!439906 (= res!260097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202446 mask!1025))))

(assert (=> b!439906 (= lt!202446 (array!27009 (store (arr!12953 _keys!709) i!563 k0!794) (size!13305 _keys!709)))))

(assert (= (and start!40160 res!260096) b!439899))

(assert (= (and b!439899 res!260095) b!439893))

(assert (= (and b!439893 res!260089) b!439894))

(assert (= (and b!439894 res!260094) b!439898))

(assert (= (and b!439898 res!260090) b!439903))

(assert (= (and b!439903 res!260098) b!439891))

(assert (= (and b!439891 res!260088) b!439904))

(assert (= (and b!439904 res!260099) b!439896))

(assert (= (and b!439896 res!260093) b!439906))

(assert (= (and b!439906 res!260097) b!439895))

(assert (= (and b!439895 res!260092) b!439897))

(assert (= (and b!439897 res!260091) b!439902))

(assert (= (and b!439902 res!260100) b!439905))

(assert (= (and b!439900 condMapEmpty!19011) mapIsEmpty!19011))

(assert (= (and b!439900 (not condMapEmpty!19011)) mapNonEmpty!19011))

(get-info :version)

(assert (= (and mapNonEmpty!19011 ((_ is ValueCellFull!5453) mapValue!19011)) b!439901))

(assert (= (and b!439900 ((_ is ValueCellFull!5453) mapDefault!19011)) b!439892))

(assert (= start!40160 b!439900))

(declare-fun m!427307 () Bool)

(assert (=> mapNonEmpty!19011 m!427307))

(declare-fun m!427309 () Bool)

(assert (=> b!439906 m!427309))

(declare-fun m!427311 () Bool)

(assert (=> b!439906 m!427311))

(declare-fun m!427313 () Bool)

(assert (=> b!439894 m!427313))

(declare-fun m!427315 () Bool)

(assert (=> b!439891 m!427315))

(declare-fun m!427317 () Bool)

(assert (=> b!439899 m!427317))

(declare-fun m!427319 () Bool)

(assert (=> b!439904 m!427319))

(declare-fun m!427321 () Bool)

(assert (=> b!439902 m!427321))

(declare-fun m!427323 () Bool)

(assert (=> b!439902 m!427323))

(declare-fun m!427325 () Bool)

(assert (=> b!439902 m!427325))

(declare-fun m!427327 () Bool)

(assert (=> b!439905 m!427327))

(declare-fun m!427329 () Bool)

(assert (=> b!439905 m!427329))

(assert (=> b!439905 m!427329))

(declare-fun m!427331 () Bool)

(assert (=> b!439905 m!427331))

(declare-fun m!427333 () Bool)

(assert (=> b!439905 m!427333))

(declare-fun m!427335 () Bool)

(assert (=> b!439895 m!427335))

(declare-fun m!427337 () Bool)

(assert (=> b!439898 m!427337))

(declare-fun m!427339 () Bool)

(assert (=> start!40160 m!427339))

(declare-fun m!427341 () Bool)

(assert (=> start!40160 m!427341))

(declare-fun m!427343 () Bool)

(assert (=> b!439896 m!427343))

(check-sat (not start!40160) b_and!18423 (not b!439899) (not b!439902) tp_is_empty!11593 (not b!439905) (not b!439896) (not b!439894) (not b!439895) (not b!439906) (not b!439891) (not b_next!10441) (not mapNonEmpty!19011) (not b!439898))
(check-sat b_and!18423 (not b_next!10441))
