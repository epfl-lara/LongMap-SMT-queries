; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40164 () Bool)

(assert start!40164)

(declare-fun b_free!10431 () Bool)

(declare-fun b_next!10431 () Bool)

(assert (=> start!40164 (= b_free!10431 (not b_next!10431))))

(declare-fun tp!36821 () Bool)

(declare-fun b_and!18399 () Bool)

(assert (=> start!40164 (= tp!36821 b_and!18399)))

(declare-fun b!439701 () Bool)

(declare-fun res!259903 () Bool)

(declare-fun e!259169 () Bool)

(assert (=> b!439701 (=> (not res!259903) (not e!259169))))

(declare-datatypes ((array!26983 0))(
  ( (array!26984 (arr!12941 (Array (_ BitVec 32) (_ BitVec 64))) (size!13293 (_ BitVec 32))) )
))
(declare-fun lt!202354 () array!26983)

(declare-datatypes ((List!7748 0))(
  ( (Nil!7745) (Cons!7744 (h!8600 (_ BitVec 64)) (t!13504 List!7748)) )
))
(declare-fun arrayNoDuplicates!0 (array!26983 (_ BitVec 32) List!7748) Bool)

(assert (=> b!439701 (= res!259903 (arrayNoDuplicates!0 lt!202354 #b00000000000000000000000000000000 Nil!7745))))

(declare-fun b!439702 () Bool)

(declare-fun e!259167 () Bool)

(declare-fun tp_is_empty!11583 () Bool)

(assert (=> b!439702 (= e!259167 tp_is_empty!11583)))

(declare-fun b!439703 () Bool)

(declare-fun res!259905 () Bool)

(declare-fun e!259170 () Bool)

(assert (=> b!439703 (=> (not res!259905) (not e!259170))))

(declare-fun _keys!709 () array!26983)

(assert (=> b!439703 (= res!259905 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7745))))

(declare-fun b!439704 () Bool)

(declare-fun res!259902 () Bool)

(assert (=> b!439704 (=> (not res!259902) (not e!259170))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26983 (_ BitVec 32)) Bool)

(assert (=> b!439704 (= res!259902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18996 () Bool)

(declare-fun mapRes!18996 () Bool)

(declare-fun tp!36822 () Bool)

(assert (=> mapNonEmpty!18996 (= mapRes!18996 (and tp!36822 e!259167))))

(declare-datatypes ((V!16549 0))(
  ( (V!16550 (val!5836 Int)) )
))
(declare-datatypes ((ValueCell!5448 0))(
  ( (ValueCellFull!5448 (v!8083 V!16549)) (EmptyCell!5448) )
))
(declare-fun mapRest!18996 () (Array (_ BitVec 32) ValueCell!5448))

(declare-fun mapValue!18996 () ValueCell!5448)

(declare-datatypes ((array!26985 0))(
  ( (array!26986 (arr!12942 (Array (_ BitVec 32) ValueCell!5448)) (size!13294 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26985)

(declare-fun mapKey!18996 () (_ BitVec 32))

(assert (=> mapNonEmpty!18996 (= (arr!12942 _values!549) (store mapRest!18996 mapKey!18996 mapValue!18996))))

(declare-fun b!439705 () Bool)

(declare-fun res!259906 () Bool)

(assert (=> b!439705 (=> (not res!259906) (not e!259170))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439705 (= res!259906 (validKeyInArray!0 k0!794))))

(declare-fun b!439706 () Bool)

(declare-fun e!259171 () Bool)

(declare-fun e!259168 () Bool)

(assert (=> b!439706 (= e!259171 (and e!259168 mapRes!18996))))

(declare-fun condMapEmpty!18996 () Bool)

(declare-fun mapDefault!18996 () ValueCell!5448)

(assert (=> b!439706 (= condMapEmpty!18996 (= (arr!12942 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5448)) mapDefault!18996)))))

(declare-fun b!439707 () Bool)

(declare-fun e!259172 () Bool)

(assert (=> b!439707 (= e!259172 (not true))))

(declare-fun minValue!515 () V!16549)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun v!412 () V!16549)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202353 () array!26985)

(declare-fun zeroValue!515 () V!16549)

(declare-datatypes ((tuple2!7750 0))(
  ( (tuple2!7751 (_1!3886 (_ BitVec 64)) (_2!3886 V!16549)) )
))
(declare-datatypes ((List!7749 0))(
  ( (Nil!7746) (Cons!7745 (h!8601 tuple2!7750) (t!13505 List!7749)) )
))
(declare-datatypes ((ListLongMap!6663 0))(
  ( (ListLongMap!6664 (toList!3347 List!7749)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1536 (array!26983 array!26985 (_ BitVec 32) (_ BitVec 32) V!16549 V!16549 (_ BitVec 32) Int) ListLongMap!6663)

(declare-fun +!1487 (ListLongMap!6663 tuple2!7750) ListLongMap!6663)

(assert (=> b!439707 (= (getCurrentListMapNoExtraKeys!1536 lt!202354 lt!202353 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1487 (getCurrentListMapNoExtraKeys!1536 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7751 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13078 0))(
  ( (Unit!13079) )
))
(declare-fun lt!202351 () Unit!13078)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!656 (array!26983 array!26985 (_ BitVec 32) (_ BitVec 32) V!16549 V!16549 (_ BitVec 32) (_ BitVec 64) V!16549 (_ BitVec 32) Int) Unit!13078)

(assert (=> b!439707 (= lt!202351 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!656 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439708 () Bool)

(declare-fun res!259908 () Bool)

(assert (=> b!439708 (=> (not res!259908) (not e!259170))))

(declare-fun arrayContainsKey!0 (array!26983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439708 (= res!259908 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439709 () Bool)

(declare-fun res!259898 () Bool)

(assert (=> b!439709 (=> (not res!259898) (not e!259169))))

(assert (=> b!439709 (= res!259898 (bvsle from!863 i!563))))

(declare-fun b!439710 () Bool)

(assert (=> b!439710 (= e!259168 tp_is_empty!11583)))

(declare-fun b!439711 () Bool)

(assert (=> b!439711 (= e!259169 e!259172)))

(declare-fun res!259897 () Bool)

(assert (=> b!439711 (=> (not res!259897) (not e!259172))))

(assert (=> b!439711 (= res!259897 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202352 () ListLongMap!6663)

(assert (=> b!439711 (= lt!202352 (getCurrentListMapNoExtraKeys!1536 lt!202354 lt!202353 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439711 (= lt!202353 (array!26986 (store (arr!12942 _values!549) i!563 (ValueCellFull!5448 v!412)) (size!13294 _values!549)))))

(declare-fun lt!202355 () ListLongMap!6663)

(assert (=> b!439711 (= lt!202355 (getCurrentListMapNoExtraKeys!1536 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!259904 () Bool)

(assert (=> start!40164 (=> (not res!259904) (not e!259170))))

(assert (=> start!40164 (= res!259904 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13293 _keys!709))))))

(assert (=> start!40164 e!259170))

(assert (=> start!40164 tp_is_empty!11583))

(assert (=> start!40164 tp!36821))

(assert (=> start!40164 true))

(declare-fun array_inv!9396 (array!26985) Bool)

(assert (=> start!40164 (and (array_inv!9396 _values!549) e!259171)))

(declare-fun array_inv!9397 (array!26983) Bool)

(assert (=> start!40164 (array_inv!9397 _keys!709)))

(declare-fun b!439700 () Bool)

(declare-fun res!259899 () Bool)

(assert (=> b!439700 (=> (not res!259899) (not e!259170))))

(assert (=> b!439700 (= res!259899 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13293 _keys!709))))))

(declare-fun b!439712 () Bool)

(declare-fun res!259896 () Bool)

(assert (=> b!439712 (=> (not res!259896) (not e!259170))))

(assert (=> b!439712 (= res!259896 (or (= (select (arr!12941 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12941 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18996 () Bool)

(assert (=> mapIsEmpty!18996 mapRes!18996))

(declare-fun b!439713 () Bool)

(assert (=> b!439713 (= e!259170 e!259169)))

(declare-fun res!259901 () Bool)

(assert (=> b!439713 (=> (not res!259901) (not e!259169))))

(assert (=> b!439713 (= res!259901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202354 mask!1025))))

(assert (=> b!439713 (= lt!202354 (array!26984 (store (arr!12941 _keys!709) i!563 k0!794) (size!13293 _keys!709)))))

(declare-fun b!439714 () Bool)

(declare-fun res!259907 () Bool)

(assert (=> b!439714 (=> (not res!259907) (not e!259170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439714 (= res!259907 (validMask!0 mask!1025))))

(declare-fun b!439715 () Bool)

(declare-fun res!259900 () Bool)

(assert (=> b!439715 (=> (not res!259900) (not e!259170))))

(assert (=> b!439715 (= res!259900 (and (= (size!13294 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13293 _keys!709) (size!13294 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40164 res!259904) b!439714))

(assert (= (and b!439714 res!259907) b!439715))

(assert (= (and b!439715 res!259900) b!439704))

(assert (= (and b!439704 res!259902) b!439703))

(assert (= (and b!439703 res!259905) b!439700))

(assert (= (and b!439700 res!259899) b!439705))

(assert (= (and b!439705 res!259906) b!439712))

(assert (= (and b!439712 res!259896) b!439708))

(assert (= (and b!439708 res!259908) b!439713))

(assert (= (and b!439713 res!259901) b!439701))

(assert (= (and b!439701 res!259903) b!439709))

(assert (= (and b!439709 res!259898) b!439711))

(assert (= (and b!439711 res!259897) b!439707))

(assert (= (and b!439706 condMapEmpty!18996) mapIsEmpty!18996))

(assert (= (and b!439706 (not condMapEmpty!18996)) mapNonEmpty!18996))

(get-info :version)

(assert (= (and mapNonEmpty!18996 ((_ is ValueCellFull!5448) mapValue!18996)) b!439702))

(assert (= (and b!439706 ((_ is ValueCellFull!5448) mapDefault!18996)) b!439710))

(assert (= start!40164 b!439706))

(declare-fun m!426899 () Bool)

(assert (=> b!439707 m!426899))

(declare-fun m!426901 () Bool)

(assert (=> b!439707 m!426901))

(assert (=> b!439707 m!426901))

(declare-fun m!426903 () Bool)

(assert (=> b!439707 m!426903))

(declare-fun m!426905 () Bool)

(assert (=> b!439707 m!426905))

(declare-fun m!426907 () Bool)

(assert (=> b!439712 m!426907))

(declare-fun m!426909 () Bool)

(assert (=> b!439708 m!426909))

(declare-fun m!426911 () Bool)

(assert (=> start!40164 m!426911))

(declare-fun m!426913 () Bool)

(assert (=> start!40164 m!426913))

(declare-fun m!426915 () Bool)

(assert (=> b!439705 m!426915))

(declare-fun m!426917 () Bool)

(assert (=> b!439714 m!426917))

(declare-fun m!426919 () Bool)

(assert (=> b!439711 m!426919))

(declare-fun m!426921 () Bool)

(assert (=> b!439711 m!426921))

(declare-fun m!426923 () Bool)

(assert (=> b!439711 m!426923))

(declare-fun m!426925 () Bool)

(assert (=> mapNonEmpty!18996 m!426925))

(declare-fun m!426927 () Bool)

(assert (=> b!439704 m!426927))

(declare-fun m!426929 () Bool)

(assert (=> b!439701 m!426929))

(declare-fun m!426931 () Bool)

(assert (=> b!439703 m!426931))

(declare-fun m!426933 () Bool)

(assert (=> b!439713 m!426933))

(declare-fun m!426935 () Bool)

(assert (=> b!439713 m!426935))

(check-sat (not b!439707) b_and!18399 (not b!439703) (not b!439713) (not b!439704) (not b!439708) (not b!439701) (not b!439705) (not b_next!10431) (not b!439714) (not mapNonEmpty!18996) (not start!40164) tp_is_empty!11583 (not b!439711))
(check-sat b_and!18399 (not b_next!10431))
