; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38552 () Bool)

(assert start!38552)

(declare-fun b_free!9103 () Bool)

(declare-fun b_next!9103 () Bool)

(assert (=> start!38552 (= b_free!9103 (not b_next!9103))))

(declare-fun tp!32432 () Bool)

(declare-fun b_and!16503 () Bool)

(assert (=> start!38552 (= tp!32432 b_and!16503)))

(declare-fun b!399036 () Bool)

(declare-fun res!229427 () Bool)

(declare-fun e!241057 () Bool)

(assert (=> b!399036 (=> (not res!229427) (not e!241057))))

(declare-datatypes ((array!23860 0))(
  ( (array!23861 (arr!11379 (Array (_ BitVec 32) (_ BitVec 64))) (size!11731 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23860)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23860 (_ BitVec 32)) Bool)

(assert (=> b!399036 (= res!229427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun c!54588 () Bool)

(declare-datatypes ((V!14419 0))(
  ( (V!14420 (val!5037 Int)) )
))
(declare-fun minValue!515 () V!14419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4649 0))(
  ( (ValueCellFull!4649 (v!7285 V!14419)) (EmptyCell!4649) )
))
(declare-datatypes ((array!23862 0))(
  ( (array!23863 (arr!11380 (Array (_ BitVec 32) ValueCell!4649)) (size!11732 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23862)

(declare-fun zeroValue!515 () V!14419)

(declare-fun bm!27957 () Bool)

(declare-datatypes ((tuple2!6532 0))(
  ( (tuple2!6533 (_1!3277 (_ BitVec 64)) (_2!3277 V!14419)) )
))
(declare-datatypes ((List!6452 0))(
  ( (Nil!6449) (Cons!6448 (h!7304 tuple2!6532) (t!11618 List!6452)) )
))
(declare-datatypes ((ListLongMap!5447 0))(
  ( (ListLongMap!5448 (toList!2739 List!6452)) )
))
(declare-fun call!27961 () ListLongMap!5447)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!187554 () array!23860)

(declare-fun v!412 () V!14419)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!998 (array!23860 array!23862 (_ BitVec 32) (_ BitVec 32) V!14419 V!14419 (_ BitVec 32) Int) ListLongMap!5447)

(assert (=> bm!27957 (= call!27961 (getCurrentListMapNoExtraKeys!998 (ite c!54588 lt!187554 _keys!709) (ite c!54588 (array!23863 (store (arr!11380 _values!549) i!563 (ValueCellFull!4649 v!412)) (size!11732 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399037 () Bool)

(declare-fun e!241056 () Bool)

(assert (=> b!399037 (= e!241056 (not true))))

(declare-fun e!241054 () Bool)

(assert (=> b!399037 e!241054))

(assert (=> b!399037 (= c!54588 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12067 0))(
  ( (Unit!12068) )
))
(declare-fun lt!187553 () Unit!12067)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!301 (array!23860 array!23862 (_ BitVec 32) (_ BitVec 32) V!14419 V!14419 (_ BitVec 32) (_ BitVec 64) V!14419 (_ BitVec 32) Int) Unit!12067)

(assert (=> b!399037 (= lt!187553 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!301 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399038 () Bool)

(assert (=> b!399038 (= e!241057 e!241056)))

(declare-fun res!229431 () Bool)

(assert (=> b!399038 (=> (not res!229431) (not e!241056))))

(assert (=> b!399038 (= res!229431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187554 mask!1025))))

(assert (=> b!399038 (= lt!187554 (array!23861 (store (arr!11379 _keys!709) i!563 k0!794) (size!11731 _keys!709)))))

(declare-fun b!399039 () Bool)

(declare-fun res!229429 () Bool)

(assert (=> b!399039 (=> (not res!229429) (not e!241057))))

(assert (=> b!399039 (= res!229429 (or (= (select (arr!11379 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11379 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399040 () Bool)

(declare-fun call!27960 () ListLongMap!5447)

(declare-fun +!1090 (ListLongMap!5447 tuple2!6532) ListLongMap!5447)

(assert (=> b!399040 (= e!241054 (= call!27961 (+!1090 call!27960 (tuple2!6533 k0!794 v!412))))))

(declare-fun b!399041 () Bool)

(declare-fun e!241052 () Bool)

(declare-fun tp_is_empty!9985 () Bool)

(assert (=> b!399041 (= e!241052 tp_is_empty!9985)))

(declare-fun mapIsEmpty!16599 () Bool)

(declare-fun mapRes!16599 () Bool)

(assert (=> mapIsEmpty!16599 mapRes!16599))

(declare-fun b!399042 () Bool)

(declare-fun res!229424 () Bool)

(assert (=> b!399042 (=> (not res!229424) (not e!241056))))

(assert (=> b!399042 (= res!229424 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11731 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun res!229425 () Bool)

(assert (=> start!38552 (=> (not res!229425) (not e!241057))))

(assert (=> start!38552 (= res!229425 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11731 _keys!709))))))

(assert (=> start!38552 e!241057))

(assert (=> start!38552 tp_is_empty!9985))

(assert (=> start!38552 tp!32432))

(assert (=> start!38552 true))

(declare-fun e!241055 () Bool)

(declare-fun array_inv!8404 (array!23862) Bool)

(assert (=> start!38552 (and (array_inv!8404 _values!549) e!241055)))

(declare-fun array_inv!8405 (array!23860) Bool)

(assert (=> start!38552 (array_inv!8405 _keys!709)))

(declare-fun b!399043 () Bool)

(declare-fun res!229434 () Bool)

(assert (=> b!399043 (=> (not res!229434) (not e!241057))))

(assert (=> b!399043 (= res!229434 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11731 _keys!709))))))

(declare-fun b!399044 () Bool)

(declare-fun res!229426 () Bool)

(assert (=> b!399044 (=> (not res!229426) (not e!241057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399044 (= res!229426 (validKeyInArray!0 k0!794))))

(declare-fun b!399045 () Bool)

(assert (=> b!399045 (= e!241055 (and e!241052 mapRes!16599))))

(declare-fun condMapEmpty!16599 () Bool)

(declare-fun mapDefault!16599 () ValueCell!4649)

(assert (=> b!399045 (= condMapEmpty!16599 (= (arr!11380 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4649)) mapDefault!16599)))))

(declare-fun b!399046 () Bool)

(declare-fun res!229423 () Bool)

(assert (=> b!399046 (=> (not res!229423) (not e!241057))))

(declare-datatypes ((List!6453 0))(
  ( (Nil!6450) (Cons!6449 (h!7305 (_ BitVec 64)) (t!11619 List!6453)) )
))
(declare-fun arrayNoDuplicates!0 (array!23860 (_ BitVec 32) List!6453) Bool)

(assert (=> b!399046 (= res!229423 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6450))))

(declare-fun b!399047 () Bool)

(declare-fun e!241051 () Bool)

(assert (=> b!399047 (= e!241051 tp_is_empty!9985)))

(declare-fun b!399048 () Bool)

(declare-fun res!229430 () Bool)

(assert (=> b!399048 (=> (not res!229430) (not e!241056))))

(assert (=> b!399048 (= res!229430 (arrayNoDuplicates!0 lt!187554 #b00000000000000000000000000000000 Nil!6450))))

(declare-fun b!399049 () Bool)

(declare-fun res!229433 () Bool)

(assert (=> b!399049 (=> (not res!229433) (not e!241057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399049 (= res!229433 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16599 () Bool)

(declare-fun tp!32433 () Bool)

(assert (=> mapNonEmpty!16599 (= mapRes!16599 (and tp!32433 e!241051))))

(declare-fun mapRest!16599 () (Array (_ BitVec 32) ValueCell!4649))

(declare-fun mapValue!16599 () ValueCell!4649)

(declare-fun mapKey!16599 () (_ BitVec 32))

(assert (=> mapNonEmpty!16599 (= (arr!11380 _values!549) (store mapRest!16599 mapKey!16599 mapValue!16599))))

(declare-fun bm!27958 () Bool)

(assert (=> bm!27958 (= call!27960 (getCurrentListMapNoExtraKeys!998 (ite c!54588 _keys!709 lt!187554) (ite c!54588 _values!549 (array!23863 (store (arr!11380 _values!549) i!563 (ValueCellFull!4649 v!412)) (size!11732 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399050 () Bool)

(assert (=> b!399050 (= e!241054 (= call!27960 call!27961))))

(declare-fun b!399051 () Bool)

(declare-fun res!229432 () Bool)

(assert (=> b!399051 (=> (not res!229432) (not e!241057))))

(assert (=> b!399051 (= res!229432 (and (= (size!11732 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11731 _keys!709) (size!11732 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399052 () Bool)

(declare-fun res!229428 () Bool)

(assert (=> b!399052 (=> (not res!229428) (not e!241057))))

(declare-fun arrayContainsKey!0 (array!23860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399052 (= res!229428 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38552 res!229425) b!399049))

(assert (= (and b!399049 res!229433) b!399051))

(assert (= (and b!399051 res!229432) b!399036))

(assert (= (and b!399036 res!229427) b!399046))

(assert (= (and b!399046 res!229423) b!399043))

(assert (= (and b!399043 res!229434) b!399044))

(assert (= (and b!399044 res!229426) b!399039))

(assert (= (and b!399039 res!229429) b!399052))

(assert (= (and b!399052 res!229428) b!399038))

(assert (= (and b!399038 res!229431) b!399048))

(assert (= (and b!399048 res!229430) b!399042))

(assert (= (and b!399042 res!229424) b!399037))

(assert (= (and b!399037 c!54588) b!399040))

(assert (= (and b!399037 (not c!54588)) b!399050))

(assert (= (or b!399040 b!399050) bm!27957))

(assert (= (or b!399040 b!399050) bm!27958))

(assert (= (and b!399045 condMapEmpty!16599) mapIsEmpty!16599))

(assert (= (and b!399045 (not condMapEmpty!16599)) mapNonEmpty!16599))

(get-info :version)

(assert (= (and mapNonEmpty!16599 ((_ is ValueCellFull!4649) mapValue!16599)) b!399047))

(assert (= (and b!399045 ((_ is ValueCellFull!4649) mapDefault!16599)) b!399041))

(assert (= start!38552 b!399045))

(declare-fun m!393957 () Bool)

(assert (=> bm!27958 m!393957))

(declare-fun m!393959 () Bool)

(assert (=> bm!27958 m!393959))

(declare-fun m!393961 () Bool)

(assert (=> b!399046 m!393961))

(declare-fun m!393963 () Bool)

(assert (=> b!399036 m!393963))

(declare-fun m!393965 () Bool)

(assert (=> b!399049 m!393965))

(declare-fun m!393967 () Bool)

(assert (=> b!399038 m!393967))

(declare-fun m!393969 () Bool)

(assert (=> b!399038 m!393969))

(declare-fun m!393971 () Bool)

(assert (=> b!399037 m!393971))

(declare-fun m!393973 () Bool)

(assert (=> start!38552 m!393973))

(declare-fun m!393975 () Bool)

(assert (=> start!38552 m!393975))

(declare-fun m!393977 () Bool)

(assert (=> b!399048 m!393977))

(assert (=> bm!27957 m!393957))

(declare-fun m!393979 () Bool)

(assert (=> bm!27957 m!393979))

(declare-fun m!393981 () Bool)

(assert (=> b!399044 m!393981))

(declare-fun m!393983 () Bool)

(assert (=> b!399040 m!393983))

(declare-fun m!393985 () Bool)

(assert (=> b!399039 m!393985))

(declare-fun m!393987 () Bool)

(assert (=> mapNonEmpty!16599 m!393987))

(declare-fun m!393989 () Bool)

(assert (=> b!399052 m!393989))

(check-sat (not b!399038) (not bm!27957) (not b!399040) (not bm!27958) (not b!399049) (not b!399046) (not b_next!9103) (not b!399052) (not b!399044) (not mapNonEmpty!16599) (not b!399037) (not b!399048) b_and!16503 (not b!399036) (not start!38552) tp_is_empty!9985)
(check-sat b_and!16503 (not b_next!9103))
