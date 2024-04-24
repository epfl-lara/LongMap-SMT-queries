; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39626 () Bool)

(assert start!39626)

(declare-fun b_free!9907 () Bool)

(declare-fun b_next!9907 () Bool)

(assert (=> start!39626 (= b_free!9907 (not b_next!9907))))

(declare-fun tp!35250 () Bool)

(declare-fun b_and!17577 () Bool)

(assert (=> start!39626 (= tp!35250 b_and!17577)))

(declare-fun mapIsEmpty!18210 () Bool)

(declare-fun mapRes!18210 () Bool)

(assert (=> mapIsEmpty!18210 mapRes!18210))

(declare-fun b!425134 () Bool)

(declare-fun res!248884 () Bool)

(declare-fun e!252418 () Bool)

(assert (=> b!425134 (=> (not res!248884) (not e!252418))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425134 (= res!248884 (validKeyInArray!0 k0!794))))

(declare-fun b!425135 () Bool)

(declare-fun res!248880 () Bool)

(declare-fun e!252424 () Bool)

(assert (=> b!425135 (=> (not res!248880) (not e!252424))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425135 (= res!248880 (bvsle from!863 i!563))))

(declare-fun b!425136 () Bool)

(declare-fun res!248875 () Bool)

(assert (=> b!425136 (=> (not res!248875) (not e!252418))))

(declare-datatypes ((array!25964 0))(
  ( (array!25965 (arr!12431 (Array (_ BitVec 32) (_ BitVec 64))) (size!12783 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25964)

(declare-datatypes ((List!7221 0))(
  ( (Nil!7218) (Cons!7217 (h!8073 (_ BitVec 64)) (t!12657 List!7221)) )
))
(declare-fun arrayNoDuplicates!0 (array!25964 (_ BitVec 32) List!7221) Bool)

(assert (=> b!425136 (= res!248875 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7218))))

(declare-fun b!425137 () Bool)

(declare-fun res!248885 () Bool)

(assert (=> b!425137 (=> (not res!248885) (not e!252424))))

(declare-fun lt!194590 () array!25964)

(assert (=> b!425137 (= res!248885 (arrayNoDuplicates!0 lt!194590 #b00000000000000000000000000000000 Nil!7218))))

(declare-fun b!425138 () Bool)

(declare-fun e!252419 () Bool)

(declare-fun tp_is_empty!11059 () Bool)

(assert (=> b!425138 (= e!252419 tp_is_empty!11059)))

(declare-fun b!425139 () Bool)

(declare-fun res!248878 () Bool)

(assert (=> b!425139 (=> (not res!248878) (not e!252418))))

(assert (=> b!425139 (= res!248878 (or (= (select (arr!12431 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12431 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425140 () Bool)

(declare-fun e!252420 () Bool)

(assert (=> b!425140 (= e!252420 (not true))))

(declare-datatypes ((V!15851 0))(
  ( (V!15852 (val!5574 Int)) )
))
(declare-fun minValue!515 () V!15851)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5186 0))(
  ( (ValueCellFull!5186 (v!7822 V!15851)) (EmptyCell!5186) )
))
(declare-datatypes ((array!25966 0))(
  ( (array!25967 (arr!12432 (Array (_ BitVec 32) ValueCell!5186)) (size!12784 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25966)

(declare-fun zeroValue!515 () V!15851)

(declare-fun v!412 () V!15851)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194592 () array!25966)

(declare-datatypes ((tuple2!7214 0))(
  ( (tuple2!7215 (_1!3618 (_ BitVec 64)) (_2!3618 V!15851)) )
))
(declare-datatypes ((List!7222 0))(
  ( (Nil!7219) (Cons!7218 (h!8074 tuple2!7214) (t!12658 List!7222)) )
))
(declare-datatypes ((ListLongMap!6129 0))(
  ( (ListLongMap!6130 (toList!3080 List!7222)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1326 (array!25964 array!25966 (_ BitVec 32) (_ BitVec 32) V!15851 V!15851 (_ BitVec 32) Int) ListLongMap!6129)

(declare-fun +!1299 (ListLongMap!6129 tuple2!7214) ListLongMap!6129)

(assert (=> b!425140 (= (getCurrentListMapNoExtraKeys!1326 lt!194590 lt!194592 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1299 (getCurrentListMapNoExtraKeys!1326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7215 k0!794 v!412)))))

(declare-datatypes ((Unit!12473 0))(
  ( (Unit!12474) )
))
(declare-fun lt!194591 () Unit!12473)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!483 (array!25964 array!25966 (_ BitVec 32) (_ BitVec 32) V!15851 V!15851 (_ BitVec 32) (_ BitVec 64) V!15851 (_ BitVec 32) Int) Unit!12473)

(assert (=> b!425140 (= lt!194591 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!483 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425141 () Bool)

(declare-fun res!248881 () Bool)

(assert (=> b!425141 (=> (not res!248881) (not e!252418))))

(declare-fun arrayContainsKey!0 (array!25964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425141 (= res!248881 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425142 () Bool)

(declare-fun e!252423 () Bool)

(assert (=> b!425142 (= e!252423 (and e!252419 mapRes!18210))))

(declare-fun condMapEmpty!18210 () Bool)

(declare-fun mapDefault!18210 () ValueCell!5186)

(assert (=> b!425142 (= condMapEmpty!18210 (= (arr!12432 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5186)) mapDefault!18210)))))

(declare-fun b!425143 () Bool)

(assert (=> b!425143 (= e!252424 e!252420)))

(declare-fun res!248886 () Bool)

(assert (=> b!425143 (=> (not res!248886) (not e!252420))))

(assert (=> b!425143 (= res!248886 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194589 () ListLongMap!6129)

(assert (=> b!425143 (= lt!194589 (getCurrentListMapNoExtraKeys!1326 lt!194590 lt!194592 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425143 (= lt!194592 (array!25967 (store (arr!12432 _values!549) i!563 (ValueCellFull!5186 v!412)) (size!12784 _values!549)))))

(declare-fun lt!194588 () ListLongMap!6129)

(assert (=> b!425143 (= lt!194588 (getCurrentListMapNoExtraKeys!1326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!248879 () Bool)

(assert (=> start!39626 (=> (not res!248879) (not e!252418))))

(assert (=> start!39626 (= res!248879 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12783 _keys!709))))))

(assert (=> start!39626 e!252418))

(assert (=> start!39626 tp_is_empty!11059))

(assert (=> start!39626 tp!35250))

(assert (=> start!39626 true))

(declare-fun array_inv!9134 (array!25966) Bool)

(assert (=> start!39626 (and (array_inv!9134 _values!549) e!252423)))

(declare-fun array_inv!9135 (array!25964) Bool)

(assert (=> start!39626 (array_inv!9135 _keys!709)))

(declare-fun mapNonEmpty!18210 () Bool)

(declare-fun tp!35249 () Bool)

(declare-fun e!252421 () Bool)

(assert (=> mapNonEmpty!18210 (= mapRes!18210 (and tp!35249 e!252421))))

(declare-fun mapKey!18210 () (_ BitVec 32))

(declare-fun mapValue!18210 () ValueCell!5186)

(declare-fun mapRest!18210 () (Array (_ BitVec 32) ValueCell!5186))

(assert (=> mapNonEmpty!18210 (= (arr!12432 _values!549) (store mapRest!18210 mapKey!18210 mapValue!18210))))

(declare-fun b!425144 () Bool)

(declare-fun res!248874 () Bool)

(assert (=> b!425144 (=> (not res!248874) (not e!252418))))

(assert (=> b!425144 (= res!248874 (and (= (size!12784 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12783 _keys!709) (size!12784 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425145 () Bool)

(declare-fun res!248883 () Bool)

(assert (=> b!425145 (=> (not res!248883) (not e!252418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425145 (= res!248883 (validMask!0 mask!1025))))

(declare-fun b!425146 () Bool)

(assert (=> b!425146 (= e!252418 e!252424)))

(declare-fun res!248877 () Bool)

(assert (=> b!425146 (=> (not res!248877) (not e!252424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25964 (_ BitVec 32)) Bool)

(assert (=> b!425146 (= res!248877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194590 mask!1025))))

(assert (=> b!425146 (= lt!194590 (array!25965 (store (arr!12431 _keys!709) i!563 k0!794) (size!12783 _keys!709)))))

(declare-fun b!425147 () Bool)

(assert (=> b!425147 (= e!252421 tp_is_empty!11059)))

(declare-fun b!425148 () Bool)

(declare-fun res!248882 () Bool)

(assert (=> b!425148 (=> (not res!248882) (not e!252418))))

(assert (=> b!425148 (= res!248882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425149 () Bool)

(declare-fun res!248876 () Bool)

(assert (=> b!425149 (=> (not res!248876) (not e!252418))))

(assert (=> b!425149 (= res!248876 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12783 _keys!709))))))

(assert (= (and start!39626 res!248879) b!425145))

(assert (= (and b!425145 res!248883) b!425144))

(assert (= (and b!425144 res!248874) b!425148))

(assert (= (and b!425148 res!248882) b!425136))

(assert (= (and b!425136 res!248875) b!425149))

(assert (= (and b!425149 res!248876) b!425134))

(assert (= (and b!425134 res!248884) b!425139))

(assert (= (and b!425139 res!248878) b!425141))

(assert (= (and b!425141 res!248881) b!425146))

(assert (= (and b!425146 res!248877) b!425137))

(assert (= (and b!425137 res!248885) b!425135))

(assert (= (and b!425135 res!248880) b!425143))

(assert (= (and b!425143 res!248886) b!425140))

(assert (= (and b!425142 condMapEmpty!18210) mapIsEmpty!18210))

(assert (= (and b!425142 (not condMapEmpty!18210)) mapNonEmpty!18210))

(get-info :version)

(assert (= (and mapNonEmpty!18210 ((_ is ValueCellFull!5186) mapValue!18210)) b!425147))

(assert (= (and b!425142 ((_ is ValueCellFull!5186) mapDefault!18210)) b!425138))

(assert (= start!39626 b!425142))

(declare-fun m!414353 () Bool)

(assert (=> b!425146 m!414353))

(declare-fun m!414355 () Bool)

(assert (=> b!425146 m!414355))

(declare-fun m!414357 () Bool)

(assert (=> b!425143 m!414357))

(declare-fun m!414359 () Bool)

(assert (=> b!425143 m!414359))

(declare-fun m!414361 () Bool)

(assert (=> b!425143 m!414361))

(declare-fun m!414363 () Bool)

(assert (=> mapNonEmpty!18210 m!414363))

(declare-fun m!414365 () Bool)

(assert (=> start!39626 m!414365))

(declare-fun m!414367 () Bool)

(assert (=> start!39626 m!414367))

(declare-fun m!414369 () Bool)

(assert (=> b!425141 m!414369))

(declare-fun m!414371 () Bool)

(assert (=> b!425140 m!414371))

(declare-fun m!414373 () Bool)

(assert (=> b!425140 m!414373))

(assert (=> b!425140 m!414373))

(declare-fun m!414375 () Bool)

(assert (=> b!425140 m!414375))

(declare-fun m!414377 () Bool)

(assert (=> b!425140 m!414377))

(declare-fun m!414379 () Bool)

(assert (=> b!425136 m!414379))

(declare-fun m!414381 () Bool)

(assert (=> b!425145 m!414381))

(declare-fun m!414383 () Bool)

(assert (=> b!425148 m!414383))

(declare-fun m!414385 () Bool)

(assert (=> b!425134 m!414385))

(declare-fun m!414387 () Bool)

(assert (=> b!425139 m!414387))

(declare-fun m!414389 () Bool)

(assert (=> b!425137 m!414389))

(check-sat (not mapNonEmpty!18210) (not b!425141) (not b!425137) tp_is_empty!11059 (not b!425143) (not b!425136) (not b_next!9907) (not b!425145) (not b!425134) b_and!17577 (not start!39626) (not b!425140) (not b!425146) (not b!425148))
(check-sat b_and!17577 (not b_next!9907))
