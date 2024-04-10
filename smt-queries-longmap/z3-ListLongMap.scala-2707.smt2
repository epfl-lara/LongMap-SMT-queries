; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40062 () Bool)

(assert start!40062)

(declare-fun b_free!10329 () Bool)

(declare-fun b_next!10329 () Bool)

(assert (=> start!40062 (= b_free!10329 (not b_next!10329))))

(declare-fun tp!36516 () Bool)

(declare-fun b_and!18297 () Bool)

(assert (=> start!40062 (= tp!36516 b_and!18297)))

(declare-fun b!437252 () Bool)

(declare-fun res!257912 () Bool)

(declare-fun e!258096 () Bool)

(assert (=> b!437252 (=> (not res!257912) (not e!258096))))

(declare-datatypes ((array!26781 0))(
  ( (array!26782 (arr!12840 (Array (_ BitVec 32) (_ BitVec 64))) (size!13192 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26781)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437252 (= res!257912 (or (= (select (arr!12840 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12840 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437253 () Bool)

(declare-fun res!257909 () Bool)

(declare-fun e!258098 () Bool)

(assert (=> b!437253 (=> (not res!257909) (not e!258098))))

(declare-fun lt!201588 () array!26781)

(declare-datatypes ((List!7664 0))(
  ( (Nil!7661) (Cons!7660 (h!8516 (_ BitVec 64)) (t!13420 List!7664)) )
))
(declare-fun arrayNoDuplicates!0 (array!26781 (_ BitVec 32) List!7664) Bool)

(assert (=> b!437253 (= res!257909 (arrayNoDuplicates!0 lt!201588 #b00000000000000000000000000000000 Nil!7661))))

(declare-fun b!437254 () Bool)

(declare-fun res!257914 () Bool)

(assert (=> b!437254 (=> (not res!257914) (not e!258096))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437254 (= res!257914 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437255 () Bool)

(declare-fun res!257916 () Bool)

(assert (=> b!437255 (=> (not res!257916) (not e!258096))))

(assert (=> b!437255 (= res!257916 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13192 _keys!709))))))

(declare-fun b!437256 () Bool)

(declare-fun res!257913 () Bool)

(assert (=> b!437256 (=> (not res!257913) (not e!258098))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!437256 (= res!257913 (bvsle from!863 i!563))))

(declare-fun b!437257 () Bool)

(declare-fun res!257911 () Bool)

(assert (=> b!437257 (=> (not res!257911) (not e!258096))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437257 (= res!257911 (validMask!0 mask!1025))))

(declare-fun b!437258 () Bool)

(assert (=> b!437258 (= e!258096 e!258098)))

(declare-fun res!257908 () Bool)

(assert (=> b!437258 (=> (not res!257908) (not e!258098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26781 (_ BitVec 32)) Bool)

(assert (=> b!437258 (= res!257908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201588 mask!1025))))

(assert (=> b!437258 (= lt!201588 (array!26782 (store (arr!12840 _keys!709) i!563 k0!794) (size!13192 _keys!709)))))

(declare-fun b!437259 () Bool)

(declare-fun res!257907 () Bool)

(assert (=> b!437259 (=> (not res!257907) (not e!258096))))

(assert (=> b!437259 (= res!257907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437260 () Bool)

(declare-fun res!257915 () Bool)

(assert (=> b!437260 (=> (not res!257915) (not e!258096))))

(declare-datatypes ((V!16413 0))(
  ( (V!16414 (val!5785 Int)) )
))
(declare-datatypes ((ValueCell!5397 0))(
  ( (ValueCellFull!5397 (v!8032 V!16413)) (EmptyCell!5397) )
))
(declare-datatypes ((array!26783 0))(
  ( (array!26784 (arr!12841 (Array (_ BitVec 32) ValueCell!5397)) (size!13193 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26783)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!437260 (= res!257915 (and (= (size!13193 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13192 _keys!709) (size!13193 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!257910 () Bool)

(assert (=> start!40062 (=> (not res!257910) (not e!258096))))

(assert (=> start!40062 (= res!257910 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13192 _keys!709))))))

(assert (=> start!40062 e!258096))

(declare-fun tp_is_empty!11481 () Bool)

(assert (=> start!40062 tp_is_empty!11481))

(assert (=> start!40062 tp!36516))

(assert (=> start!40062 true))

(declare-fun e!258101 () Bool)

(declare-fun array_inv!9326 (array!26783) Bool)

(assert (=> start!40062 (and (array_inv!9326 _values!549) e!258101)))

(declare-fun array_inv!9327 (array!26781) Bool)

(assert (=> start!40062 (array_inv!9327 _keys!709)))

(declare-fun b!437261 () Bool)

(declare-fun e!258099 () Bool)

(assert (=> b!437261 (= e!258099 tp_is_empty!11481)))

(declare-fun b!437262 () Bool)

(declare-fun res!257918 () Bool)

(assert (=> b!437262 (=> (not res!257918) (not e!258096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437262 (= res!257918 (validKeyInArray!0 k0!794))))

(declare-fun b!437263 () Bool)

(declare-fun e!258100 () Bool)

(assert (=> b!437263 (= e!258100 (not true))))

(declare-fun minValue!515 () V!16413)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16413)

(declare-fun v!412 () V!16413)

(declare-fun lt!201589 () array!26783)

(declare-datatypes ((tuple2!7666 0))(
  ( (tuple2!7667 (_1!3844 (_ BitVec 64)) (_2!3844 V!16413)) )
))
(declare-datatypes ((List!7665 0))(
  ( (Nil!7662) (Cons!7661 (h!8517 tuple2!7666) (t!13421 List!7665)) )
))
(declare-datatypes ((ListLongMap!6579 0))(
  ( (ListLongMap!6580 (toList!3305 List!7665)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1494 (array!26781 array!26783 (_ BitVec 32) (_ BitVec 32) V!16413 V!16413 (_ BitVec 32) Int) ListLongMap!6579)

(declare-fun +!1450 (ListLongMap!6579 tuple2!7666) ListLongMap!6579)

(assert (=> b!437263 (= (getCurrentListMapNoExtraKeys!1494 lt!201588 lt!201589 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1450 (getCurrentListMapNoExtraKeys!1494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7667 k0!794 v!412)))))

(declare-datatypes ((Unit!13004 0))(
  ( (Unit!13005) )
))
(declare-fun lt!201587 () Unit!13004)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!619 (array!26781 array!26783 (_ BitVec 32) (_ BitVec 32) V!16413 V!16413 (_ BitVec 32) (_ BitVec 64) V!16413 (_ BitVec 32) Int) Unit!13004)

(assert (=> b!437263 (= lt!201587 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!619 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18843 () Bool)

(declare-fun mapRes!18843 () Bool)

(assert (=> mapIsEmpty!18843 mapRes!18843))

(declare-fun b!437264 () Bool)

(declare-fun e!258097 () Bool)

(assert (=> b!437264 (= e!258101 (and e!258097 mapRes!18843))))

(declare-fun condMapEmpty!18843 () Bool)

(declare-fun mapDefault!18843 () ValueCell!5397)

(assert (=> b!437264 (= condMapEmpty!18843 (= (arr!12841 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5397)) mapDefault!18843)))))

(declare-fun mapNonEmpty!18843 () Bool)

(declare-fun tp!36515 () Bool)

(assert (=> mapNonEmpty!18843 (= mapRes!18843 (and tp!36515 e!258099))))

(declare-fun mapKey!18843 () (_ BitVec 32))

(declare-fun mapRest!18843 () (Array (_ BitVec 32) ValueCell!5397))

(declare-fun mapValue!18843 () ValueCell!5397)

(assert (=> mapNonEmpty!18843 (= (arr!12841 _values!549) (store mapRest!18843 mapKey!18843 mapValue!18843))))

(declare-fun b!437265 () Bool)

(declare-fun res!257917 () Bool)

(assert (=> b!437265 (=> (not res!257917) (not e!258096))))

(assert (=> b!437265 (= res!257917 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7661))))

(declare-fun b!437266 () Bool)

(assert (=> b!437266 (= e!258098 e!258100)))

(declare-fun res!257919 () Bool)

(assert (=> b!437266 (=> (not res!257919) (not e!258100))))

(assert (=> b!437266 (= res!257919 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201590 () ListLongMap!6579)

(assert (=> b!437266 (= lt!201590 (getCurrentListMapNoExtraKeys!1494 lt!201588 lt!201589 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437266 (= lt!201589 (array!26784 (store (arr!12841 _values!549) i!563 (ValueCellFull!5397 v!412)) (size!13193 _values!549)))))

(declare-fun lt!201586 () ListLongMap!6579)

(assert (=> b!437266 (= lt!201586 (getCurrentListMapNoExtraKeys!1494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437267 () Bool)

(assert (=> b!437267 (= e!258097 tp_is_empty!11481)))

(assert (= (and start!40062 res!257910) b!437257))

(assert (= (and b!437257 res!257911) b!437260))

(assert (= (and b!437260 res!257915) b!437259))

(assert (= (and b!437259 res!257907) b!437265))

(assert (= (and b!437265 res!257917) b!437255))

(assert (= (and b!437255 res!257916) b!437262))

(assert (= (and b!437262 res!257918) b!437252))

(assert (= (and b!437252 res!257912) b!437254))

(assert (= (and b!437254 res!257914) b!437258))

(assert (= (and b!437258 res!257908) b!437253))

(assert (= (and b!437253 res!257909) b!437256))

(assert (= (and b!437256 res!257913) b!437266))

(assert (= (and b!437266 res!257919) b!437263))

(assert (= (and b!437264 condMapEmpty!18843) mapIsEmpty!18843))

(assert (= (and b!437264 (not condMapEmpty!18843)) mapNonEmpty!18843))

(get-info :version)

(assert (= (and mapNonEmpty!18843 ((_ is ValueCellFull!5397) mapValue!18843)) b!437261))

(assert (= (and b!437264 ((_ is ValueCellFull!5397) mapDefault!18843)) b!437267))

(assert (= start!40062 b!437264))

(declare-fun m!424961 () Bool)

(assert (=> b!437265 m!424961))

(declare-fun m!424963 () Bool)

(assert (=> b!437259 m!424963))

(declare-fun m!424965 () Bool)

(assert (=> b!437252 m!424965))

(declare-fun m!424967 () Bool)

(assert (=> b!437253 m!424967))

(declare-fun m!424969 () Bool)

(assert (=> b!437262 m!424969))

(declare-fun m!424971 () Bool)

(assert (=> start!40062 m!424971))

(declare-fun m!424973 () Bool)

(assert (=> start!40062 m!424973))

(declare-fun m!424975 () Bool)

(assert (=> mapNonEmpty!18843 m!424975))

(declare-fun m!424977 () Bool)

(assert (=> b!437266 m!424977))

(declare-fun m!424979 () Bool)

(assert (=> b!437266 m!424979))

(declare-fun m!424981 () Bool)

(assert (=> b!437266 m!424981))

(declare-fun m!424983 () Bool)

(assert (=> b!437257 m!424983))

(declare-fun m!424985 () Bool)

(assert (=> b!437258 m!424985))

(declare-fun m!424987 () Bool)

(assert (=> b!437258 m!424987))

(declare-fun m!424989 () Bool)

(assert (=> b!437254 m!424989))

(declare-fun m!424991 () Bool)

(assert (=> b!437263 m!424991))

(declare-fun m!424993 () Bool)

(assert (=> b!437263 m!424993))

(assert (=> b!437263 m!424993))

(declare-fun m!424995 () Bool)

(assert (=> b!437263 m!424995))

(declare-fun m!424997 () Bool)

(assert (=> b!437263 m!424997))

(check-sat (not b!437257) (not b!437253) (not b!437259) (not mapNonEmpty!18843) tp_is_empty!11481 (not b!437258) (not b!437265) b_and!18297 (not b!437263) (not start!40062) (not b!437266) (not b!437254) (not b!437262) (not b_next!10329))
(check-sat b_and!18297 (not b_next!10329))
