; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40468 () Bool)

(assert start!40468)

(declare-fun b_free!10539 () Bool)

(declare-fun b_next!10539 () Bool)

(assert (=> start!40468 (= b_free!10539 (not b_next!10539))))

(declare-fun tp!37394 () Bool)

(declare-fun b_and!18523 () Bool)

(assert (=> start!40468 (= tp!37394 b_and!18523)))

(declare-fun b!445501 () Bool)

(declare-fun res!264350 () Bool)

(declare-fun e!261860 () Bool)

(assert (=> b!445501 (=> (not res!264350) (not e!261860))))

(declare-datatypes ((array!27513 0))(
  ( (array!27514 (arr!13204 (Array (_ BitVec 32) (_ BitVec 64))) (size!13556 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27513)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445501 (= res!264350 (or (= (select (arr!13204 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13204 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!16909 0))(
  ( (V!16910 (val!5971 Int)) )
))
(declare-fun minValue!515 () V!16909)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7842 0))(
  ( (tuple2!7843 (_1!3932 (_ BitVec 64)) (_2!3932 V!16909)) )
))
(declare-datatypes ((List!7892 0))(
  ( (Nil!7889) (Cons!7888 (h!8744 tuple2!7842) (t!13650 List!7892)) )
))
(declare-datatypes ((ListLongMap!6755 0))(
  ( (ListLongMap!6756 (toList!3393 List!7892)) )
))
(declare-fun call!29573 () ListLongMap!6755)

(declare-datatypes ((ValueCell!5583 0))(
  ( (ValueCellFull!5583 (v!8222 V!16909)) (EmptyCell!5583) )
))
(declare-datatypes ((array!27515 0))(
  ( (array!27516 (arr!13205 (Array (_ BitVec 32) ValueCell!5583)) (size!13557 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27515)

(declare-fun zeroValue!515 () V!16909)

(declare-fun lt!203642 () array!27513)

(declare-fun bm!29570 () Bool)

(declare-fun v!412 () V!16909)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!55854 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1582 (array!27513 array!27515 (_ BitVec 32) (_ BitVec 32) V!16909 V!16909 (_ BitVec 32) Int) ListLongMap!6755)

(assert (=> bm!29570 (= call!29573 (getCurrentListMapNoExtraKeys!1582 (ite c!55854 lt!203642 _keys!709) (ite c!55854 (array!27516 (store (arr!13205 _values!549) i!563 (ValueCellFull!5583 v!412)) (size!13557 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445502 () Bool)

(declare-fun res!264361 () Bool)

(declare-fun e!261857 () Bool)

(assert (=> b!445502 (=> (not res!264361) (not e!261857))))

(declare-datatypes ((List!7893 0))(
  ( (Nil!7890) (Cons!7889 (h!8745 (_ BitVec 64)) (t!13651 List!7893)) )
))
(declare-fun arrayNoDuplicates!0 (array!27513 (_ BitVec 32) List!7893) Bool)

(assert (=> b!445502 (= res!264361 (arrayNoDuplicates!0 lt!203642 #b00000000000000000000000000000000 Nil!7890))))

(declare-fun b!445504 () Bool)

(declare-fun res!264360 () Bool)

(assert (=> b!445504 (=> (not res!264360) (not e!261860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27513 (_ BitVec 32)) Bool)

(assert (=> b!445504 (= res!264360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!29571 () Bool)

(declare-fun call!29574 () ListLongMap!6755)

(assert (=> bm!29571 (= call!29574 (getCurrentListMapNoExtraKeys!1582 (ite c!55854 _keys!709 lt!203642) (ite c!55854 _values!549 (array!27516 (store (arr!13205 _values!549) i!563 (ValueCellFull!5583 v!412)) (size!13557 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445505 () Bool)

(declare-fun res!264353 () Bool)

(assert (=> b!445505 (=> (not res!264353) (not e!261860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445505 (= res!264353 (validMask!0 mask!1025))))

(declare-fun b!445506 () Bool)

(declare-fun res!264359 () Bool)

(assert (=> b!445506 (=> (not res!264359) (not e!261860))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445506 (= res!264359 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445507 () Bool)

(declare-fun e!261854 () Bool)

(declare-fun tp_is_empty!11853 () Bool)

(assert (=> b!445507 (= e!261854 tp_is_empty!11853)))

(declare-fun b!445508 () Bool)

(assert (=> b!445508 (= e!261857 (not true))))

(declare-fun e!261855 () Bool)

(assert (=> b!445508 e!261855))

(assert (=> b!445508 (= c!55854 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13158 0))(
  ( (Unit!13159) )
))
(declare-fun lt!203641 () Unit!13158)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 (array!27513 array!27515 (_ BitVec 32) (_ BitVec 32) V!16909 V!16909 (_ BitVec 32) (_ BitVec 64) V!16909 (_ BitVec 32) Int) Unit!13158)

(assert (=> b!445508 (= lt!203641 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445509 () Bool)

(declare-fun e!261856 () Bool)

(declare-fun e!261858 () Bool)

(declare-fun mapRes!19407 () Bool)

(assert (=> b!445509 (= e!261856 (and e!261858 mapRes!19407))))

(declare-fun condMapEmpty!19407 () Bool)

(declare-fun mapDefault!19407 () ValueCell!5583)

(assert (=> b!445509 (= condMapEmpty!19407 (= (arr!13205 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5583)) mapDefault!19407)))))

(declare-fun mapIsEmpty!19407 () Bool)

(assert (=> mapIsEmpty!19407 mapRes!19407))

(declare-fun b!445510 () Bool)

(assert (=> b!445510 (= e!261858 tp_is_empty!11853)))

(declare-fun b!445511 () Bool)

(declare-fun res!264356 () Bool)

(assert (=> b!445511 (=> (not res!264356) (not e!261860))))

(assert (=> b!445511 (= res!264356 (and (= (size!13557 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13556 _keys!709) (size!13557 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445512 () Bool)

(declare-fun +!1524 (ListLongMap!6755 tuple2!7842) ListLongMap!6755)

(assert (=> b!445512 (= e!261855 (= call!29573 (+!1524 call!29574 (tuple2!7843 k0!794 v!412))))))

(declare-fun res!264358 () Bool)

(assert (=> start!40468 (=> (not res!264358) (not e!261860))))

(assert (=> start!40468 (= res!264358 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13556 _keys!709))))))

(assert (=> start!40468 e!261860))

(assert (=> start!40468 tp_is_empty!11853))

(assert (=> start!40468 tp!37394))

(assert (=> start!40468 true))

(declare-fun array_inv!9574 (array!27515) Bool)

(assert (=> start!40468 (and (array_inv!9574 _values!549) e!261856)))

(declare-fun array_inv!9575 (array!27513) Bool)

(assert (=> start!40468 (array_inv!9575 _keys!709)))

(declare-fun b!445503 () Bool)

(declare-fun res!264355 () Bool)

(assert (=> b!445503 (=> (not res!264355) (not e!261857))))

(assert (=> b!445503 (= res!264355 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13556 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445513 () Bool)

(declare-fun res!264357 () Bool)

(assert (=> b!445513 (=> (not res!264357) (not e!261860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445513 (= res!264357 (validKeyInArray!0 k0!794))))

(declare-fun b!445514 () Bool)

(assert (=> b!445514 (= e!261855 (= call!29574 call!29573))))

(declare-fun b!445515 () Bool)

(declare-fun res!264352 () Bool)

(assert (=> b!445515 (=> (not res!264352) (not e!261860))))

(assert (=> b!445515 (= res!264352 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13556 _keys!709))))))

(declare-fun mapNonEmpty!19407 () Bool)

(declare-fun tp!37395 () Bool)

(assert (=> mapNonEmpty!19407 (= mapRes!19407 (and tp!37395 e!261854))))

(declare-fun mapValue!19407 () ValueCell!5583)

(declare-fun mapRest!19407 () (Array (_ BitVec 32) ValueCell!5583))

(declare-fun mapKey!19407 () (_ BitVec 32))

(assert (=> mapNonEmpty!19407 (= (arr!13205 _values!549) (store mapRest!19407 mapKey!19407 mapValue!19407))))

(declare-fun b!445516 () Bool)

(assert (=> b!445516 (= e!261860 e!261857)))

(declare-fun res!264354 () Bool)

(assert (=> b!445516 (=> (not res!264354) (not e!261857))))

(assert (=> b!445516 (= res!264354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203642 mask!1025))))

(assert (=> b!445516 (= lt!203642 (array!27514 (store (arr!13204 _keys!709) i!563 k0!794) (size!13556 _keys!709)))))

(declare-fun b!445517 () Bool)

(declare-fun res!264351 () Bool)

(assert (=> b!445517 (=> (not res!264351) (not e!261860))))

(assert (=> b!445517 (= res!264351 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7890))))

(assert (= (and start!40468 res!264358) b!445505))

(assert (= (and b!445505 res!264353) b!445511))

(assert (= (and b!445511 res!264356) b!445504))

(assert (= (and b!445504 res!264360) b!445517))

(assert (= (and b!445517 res!264351) b!445515))

(assert (= (and b!445515 res!264352) b!445513))

(assert (= (and b!445513 res!264357) b!445501))

(assert (= (and b!445501 res!264350) b!445506))

(assert (= (and b!445506 res!264359) b!445516))

(assert (= (and b!445516 res!264354) b!445502))

(assert (= (and b!445502 res!264361) b!445503))

(assert (= (and b!445503 res!264355) b!445508))

(assert (= (and b!445508 c!55854) b!445512))

(assert (= (and b!445508 (not c!55854)) b!445514))

(assert (= (or b!445512 b!445514) bm!29570))

(assert (= (or b!445512 b!445514) bm!29571))

(assert (= (and b!445509 condMapEmpty!19407) mapIsEmpty!19407))

(assert (= (and b!445509 (not condMapEmpty!19407)) mapNonEmpty!19407))

(get-info :version)

(assert (= (and mapNonEmpty!19407 ((_ is ValueCellFull!5583) mapValue!19407)) b!445507))

(assert (= (and b!445509 ((_ is ValueCellFull!5583) mapDefault!19407)) b!445510))

(assert (= start!40468 b!445509))

(declare-fun m!430967 () Bool)

(assert (=> bm!29570 m!430967))

(declare-fun m!430969 () Bool)

(assert (=> bm!29570 m!430969))

(declare-fun m!430971 () Bool)

(assert (=> mapNonEmpty!19407 m!430971))

(declare-fun m!430973 () Bool)

(assert (=> b!445513 m!430973))

(declare-fun m!430975 () Bool)

(assert (=> b!445508 m!430975))

(declare-fun m!430977 () Bool)

(assert (=> b!445506 m!430977))

(declare-fun m!430979 () Bool)

(assert (=> b!445517 m!430979))

(declare-fun m!430981 () Bool)

(assert (=> b!445501 m!430981))

(declare-fun m!430983 () Bool)

(assert (=> b!445512 m!430983))

(declare-fun m!430985 () Bool)

(assert (=> b!445516 m!430985))

(declare-fun m!430987 () Bool)

(assert (=> b!445516 m!430987))

(declare-fun m!430989 () Bool)

(assert (=> start!40468 m!430989))

(declare-fun m!430991 () Bool)

(assert (=> start!40468 m!430991))

(declare-fun m!430993 () Bool)

(assert (=> b!445504 m!430993))

(assert (=> bm!29571 m!430967))

(declare-fun m!430995 () Bool)

(assert (=> bm!29571 m!430995))

(declare-fun m!430997 () Bool)

(assert (=> b!445505 m!430997))

(declare-fun m!430999 () Bool)

(assert (=> b!445502 m!430999))

(check-sat (not bm!29571) (not b!445505) (not b!445506) (not b!445508) (not mapNonEmpty!19407) (not b!445502) (not b!445517) tp_is_empty!11853 (not b_next!10539) b_and!18523 (not start!40468) (not b!445516) (not b!445513) (not b!445512) (not bm!29570) (not b!445504))
(check-sat b_and!18523 (not b_next!10539))
