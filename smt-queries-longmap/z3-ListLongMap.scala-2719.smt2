; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40134 () Bool)

(assert start!40134)

(declare-fun b_free!10401 () Bool)

(declare-fun b_next!10401 () Bool)

(assert (=> start!40134 (= b_free!10401 (not b_next!10401))))

(declare-fun tp!36731 () Bool)

(declare-fun b_and!18369 () Bool)

(assert (=> start!40134 (= tp!36731 b_and!18369)))

(declare-fun b!438980 () Bool)

(declare-fun e!258856 () Bool)

(declare-fun tp_is_empty!11553 () Bool)

(assert (=> b!438980 (= e!258856 tp_is_empty!11553)))

(declare-fun b!438981 () Bool)

(declare-fun e!258853 () Bool)

(assert (=> b!438981 (= e!258853 (not true))))

(declare-datatypes ((array!26923 0))(
  ( (array!26924 (arr!12911 (Array (_ BitVec 32) (_ BitVec 64))) (size!13263 (_ BitVec 32))) )
))
(declare-fun lt!202130 () array!26923)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16509 0))(
  ( (V!16510 (val!5821 Int)) )
))
(declare-datatypes ((ValueCell!5433 0))(
  ( (ValueCellFull!5433 (v!8068 V!16509)) (EmptyCell!5433) )
))
(declare-datatypes ((array!26925 0))(
  ( (array!26926 (arr!12912 (Array (_ BitVec 32) ValueCell!5433)) (size!13264 (_ BitVec 32))) )
))
(declare-fun lt!202128 () array!26925)

(declare-fun _values!549 () array!26925)

(declare-fun zeroValue!515 () V!16509)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16509)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26923)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16509)

(declare-datatypes ((tuple2!7726 0))(
  ( (tuple2!7727 (_1!3874 (_ BitVec 64)) (_2!3874 V!16509)) )
))
(declare-datatypes ((List!7723 0))(
  ( (Nil!7720) (Cons!7719 (h!8575 tuple2!7726) (t!13479 List!7723)) )
))
(declare-datatypes ((ListLongMap!6639 0))(
  ( (ListLongMap!6640 (toList!3335 List!7723)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1524 (array!26923 array!26925 (_ BitVec 32) (_ BitVec 32) V!16509 V!16509 (_ BitVec 32) Int) ListLongMap!6639)

(declare-fun +!1477 (ListLongMap!6639 tuple2!7726) ListLongMap!6639)

(assert (=> b!438981 (= (getCurrentListMapNoExtraKeys!1524 lt!202130 lt!202128 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1477 (getCurrentListMapNoExtraKeys!1524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7727 k0!794 v!412)))))

(declare-datatypes ((Unit!13058 0))(
  ( (Unit!13059) )
))
(declare-fun lt!202129 () Unit!13058)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!646 (array!26923 array!26925 (_ BitVec 32) (_ BitVec 32) V!16509 V!16509 (_ BitVec 32) (_ BitVec 64) V!16509 (_ BitVec 32) Int) Unit!13058)

(assert (=> b!438981 (= lt!202129 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!646 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438982 () Bool)

(declare-fun res!259313 () Bool)

(declare-fun e!258858 () Bool)

(assert (=> b!438982 (=> (not res!259313) (not e!258858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438982 (= res!259313 (validMask!0 mask!1025))))

(declare-fun b!438983 () Bool)

(declare-fun e!258855 () Bool)

(assert (=> b!438983 (= e!258855 e!258853)))

(declare-fun res!259321 () Bool)

(assert (=> b!438983 (=> (not res!259321) (not e!258853))))

(assert (=> b!438983 (= res!259321 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202126 () ListLongMap!6639)

(assert (=> b!438983 (= lt!202126 (getCurrentListMapNoExtraKeys!1524 lt!202130 lt!202128 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438983 (= lt!202128 (array!26926 (store (arr!12912 _values!549) i!563 (ValueCellFull!5433 v!412)) (size!13264 _values!549)))))

(declare-fun lt!202127 () ListLongMap!6639)

(assert (=> b!438983 (= lt!202127 (getCurrentListMapNoExtraKeys!1524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18951 () Bool)

(declare-fun mapRes!18951 () Bool)

(declare-fun tp!36732 () Bool)

(assert (=> mapNonEmpty!18951 (= mapRes!18951 (and tp!36732 e!258856))))

(declare-fun mapRest!18951 () (Array (_ BitVec 32) ValueCell!5433))

(declare-fun mapValue!18951 () ValueCell!5433)

(declare-fun mapKey!18951 () (_ BitVec 32))

(assert (=> mapNonEmpty!18951 (= (arr!12912 _values!549) (store mapRest!18951 mapKey!18951 mapValue!18951))))

(declare-fun b!438985 () Bool)

(declare-fun res!259312 () Bool)

(assert (=> b!438985 (=> (not res!259312) (not e!258858))))

(declare-datatypes ((List!7724 0))(
  ( (Nil!7721) (Cons!7720 (h!8576 (_ BitVec 64)) (t!13480 List!7724)) )
))
(declare-fun arrayNoDuplicates!0 (array!26923 (_ BitVec 32) List!7724) Bool)

(assert (=> b!438985 (= res!259312 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7721))))

(declare-fun b!438986 () Bool)

(declare-fun res!259316 () Bool)

(assert (=> b!438986 (=> (not res!259316) (not e!258858))))

(assert (=> b!438986 (= res!259316 (and (= (size!13264 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13263 _keys!709) (size!13264 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438987 () Bool)

(declare-fun e!258852 () Bool)

(assert (=> b!438987 (= e!258852 tp_is_empty!11553)))

(declare-fun b!438988 () Bool)

(declare-fun e!258854 () Bool)

(assert (=> b!438988 (= e!258854 (and e!258852 mapRes!18951))))

(declare-fun condMapEmpty!18951 () Bool)

(declare-fun mapDefault!18951 () ValueCell!5433)

(assert (=> b!438988 (= condMapEmpty!18951 (= (arr!12912 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5433)) mapDefault!18951)))))

(declare-fun mapIsEmpty!18951 () Bool)

(assert (=> mapIsEmpty!18951 mapRes!18951))

(declare-fun b!438989 () Bool)

(declare-fun res!259311 () Bool)

(assert (=> b!438989 (=> (not res!259311) (not e!258858))))

(assert (=> b!438989 (= res!259311 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13263 _keys!709))))))

(declare-fun b!438990 () Bool)

(declare-fun res!259323 () Bool)

(assert (=> b!438990 (=> (not res!259323) (not e!258858))))

(assert (=> b!438990 (= res!259323 (or (= (select (arr!12911 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12911 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438991 () Bool)

(declare-fun res!259314 () Bool)

(assert (=> b!438991 (=> (not res!259314) (not e!258858))))

(declare-fun arrayContainsKey!0 (array!26923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438991 (= res!259314 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438992 () Bool)

(declare-fun res!259318 () Bool)

(assert (=> b!438992 (=> (not res!259318) (not e!258855))))

(assert (=> b!438992 (= res!259318 (arrayNoDuplicates!0 lt!202130 #b00000000000000000000000000000000 Nil!7721))))

(declare-fun b!438993 () Bool)

(declare-fun res!259315 () Bool)

(assert (=> b!438993 (=> (not res!259315) (not e!258855))))

(assert (=> b!438993 (= res!259315 (bvsle from!863 i!563))))

(declare-fun res!259319 () Bool)

(assert (=> start!40134 (=> (not res!259319) (not e!258858))))

(assert (=> start!40134 (= res!259319 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13263 _keys!709))))))

(assert (=> start!40134 e!258858))

(assert (=> start!40134 tp_is_empty!11553))

(assert (=> start!40134 tp!36731))

(assert (=> start!40134 true))

(declare-fun array_inv!9378 (array!26925) Bool)

(assert (=> start!40134 (and (array_inv!9378 _values!549) e!258854)))

(declare-fun array_inv!9379 (array!26923) Bool)

(assert (=> start!40134 (array_inv!9379 _keys!709)))

(declare-fun b!438984 () Bool)

(declare-fun res!259320 () Bool)

(assert (=> b!438984 (=> (not res!259320) (not e!258858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438984 (= res!259320 (validKeyInArray!0 k0!794))))

(declare-fun b!438994 () Bool)

(assert (=> b!438994 (= e!258858 e!258855)))

(declare-fun res!259317 () Bool)

(assert (=> b!438994 (=> (not res!259317) (not e!258855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26923 (_ BitVec 32)) Bool)

(assert (=> b!438994 (= res!259317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202130 mask!1025))))

(assert (=> b!438994 (= lt!202130 (array!26924 (store (arr!12911 _keys!709) i!563 k0!794) (size!13263 _keys!709)))))

(declare-fun b!438995 () Bool)

(declare-fun res!259322 () Bool)

(assert (=> b!438995 (=> (not res!259322) (not e!258858))))

(assert (=> b!438995 (= res!259322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40134 res!259319) b!438982))

(assert (= (and b!438982 res!259313) b!438986))

(assert (= (and b!438986 res!259316) b!438995))

(assert (= (and b!438995 res!259322) b!438985))

(assert (= (and b!438985 res!259312) b!438989))

(assert (= (and b!438989 res!259311) b!438984))

(assert (= (and b!438984 res!259320) b!438990))

(assert (= (and b!438990 res!259323) b!438991))

(assert (= (and b!438991 res!259314) b!438994))

(assert (= (and b!438994 res!259317) b!438992))

(assert (= (and b!438992 res!259318) b!438993))

(assert (= (and b!438993 res!259315) b!438983))

(assert (= (and b!438983 res!259321) b!438981))

(assert (= (and b!438988 condMapEmpty!18951) mapIsEmpty!18951))

(assert (= (and b!438988 (not condMapEmpty!18951)) mapNonEmpty!18951))

(get-info :version)

(assert (= (and mapNonEmpty!18951 ((_ is ValueCellFull!5433) mapValue!18951)) b!438980))

(assert (= (and b!438988 ((_ is ValueCellFull!5433) mapDefault!18951)) b!438987))

(assert (= start!40134 b!438988))

(declare-fun m!426329 () Bool)

(assert (=> b!438982 m!426329))

(declare-fun m!426331 () Bool)

(assert (=> b!438985 m!426331))

(declare-fun m!426333 () Bool)

(assert (=> b!438983 m!426333))

(declare-fun m!426335 () Bool)

(assert (=> b!438983 m!426335))

(declare-fun m!426337 () Bool)

(assert (=> b!438983 m!426337))

(declare-fun m!426339 () Bool)

(assert (=> mapNonEmpty!18951 m!426339))

(declare-fun m!426341 () Bool)

(assert (=> b!438984 m!426341))

(declare-fun m!426343 () Bool)

(assert (=> b!438991 m!426343))

(declare-fun m!426345 () Bool)

(assert (=> b!438995 m!426345))

(declare-fun m!426347 () Bool)

(assert (=> b!438990 m!426347))

(declare-fun m!426349 () Bool)

(assert (=> start!40134 m!426349))

(declare-fun m!426351 () Bool)

(assert (=> start!40134 m!426351))

(declare-fun m!426353 () Bool)

(assert (=> b!438992 m!426353))

(declare-fun m!426355 () Bool)

(assert (=> b!438994 m!426355))

(declare-fun m!426357 () Bool)

(assert (=> b!438994 m!426357))

(declare-fun m!426359 () Bool)

(assert (=> b!438981 m!426359))

(declare-fun m!426361 () Bool)

(assert (=> b!438981 m!426361))

(assert (=> b!438981 m!426361))

(declare-fun m!426363 () Bool)

(assert (=> b!438981 m!426363))

(declare-fun m!426365 () Bool)

(assert (=> b!438981 m!426365))

(check-sat (not b!438985) (not b!438991) (not b!438994) (not b!438981) (not b_next!10401) tp_is_empty!11553 (not b!438982) (not start!40134) (not mapNonEmpty!18951) (not b!438995) (not b!438992) b_and!18369 (not b!438983) (not b!438984))
(check-sat b_and!18369 (not b_next!10401))
