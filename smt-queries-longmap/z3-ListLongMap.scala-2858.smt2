; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41164 () Bool)

(assert start!41164)

(declare-fun b_free!11047 () Bool)

(declare-fun b_next!11047 () Bool)

(assert (=> start!41164 (= b_free!11047 (not b_next!11047))))

(declare-fun tp!38976 () Bool)

(declare-fun b_and!19343 () Bool)

(assert (=> start!41164 (= tp!38976 b_and!19343)))

(declare-fun b!460186 () Bool)

(declare-fun e!268498 () Bool)

(declare-fun e!268496 () Bool)

(assert (=> b!460186 (= e!268498 e!268496)))

(declare-fun res!275143 () Bool)

(assert (=> b!460186 (=> res!275143 e!268496)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!28564 0))(
  ( (array!28565 (arr!13722 (Array (_ BitVec 32) (_ BitVec 64))) (size!14074 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28564)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!460186 (= res!275143 (= k0!794 (select (arr!13722 _keys!709) from!863)))))

(assert (=> b!460186 (not (= (select (arr!13722 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!13382 0))(
  ( (Unit!13383) )
))
(declare-fun lt!208378 () Unit!13382)

(declare-fun e!268491 () Unit!13382)

(assert (=> b!460186 (= lt!208378 e!268491)))

(declare-fun c!56492 () Bool)

(assert (=> b!460186 (= c!56492 (= (select (arr!13722 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!17619 0))(
  ( (V!17620 (val!6237 Int)) )
))
(declare-datatypes ((tuple2!8152 0))(
  ( (tuple2!8153 (_1!4087 (_ BitVec 64)) (_2!4087 V!17619)) )
))
(declare-datatypes ((List!8217 0))(
  ( (Nil!8214) (Cons!8213 (h!9069 tuple2!8152) (t!14135 List!8217)) )
))
(declare-datatypes ((ListLongMap!7067 0))(
  ( (ListLongMap!7068 (toList!3549 List!8217)) )
))
(declare-fun lt!208385 () ListLongMap!7067)

(declare-fun lt!208383 () ListLongMap!7067)

(assert (=> b!460186 (= lt!208385 lt!208383)))

(declare-fun lt!208381 () ListLongMap!7067)

(declare-fun lt!208374 () tuple2!8152)

(declare-fun +!1625 (ListLongMap!7067 tuple2!8152) ListLongMap!7067)

(assert (=> b!460186 (= lt!208383 (+!1625 lt!208381 lt!208374))))

(declare-fun lt!208377 () V!17619)

(assert (=> b!460186 (= lt!208374 (tuple2!8153 (select (arr!13722 _keys!709) from!863) lt!208377))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5849 0))(
  ( (ValueCellFull!5849 (v!8516 V!17619)) (EmptyCell!5849) )
))
(declare-datatypes ((array!28566 0))(
  ( (array!28567 (arr!13723 (Array (_ BitVec 32) ValueCell!5849)) (size!14075 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28566)

(declare-fun get!6777 (ValueCell!5849 V!17619) V!17619)

(declare-fun dynLambda!901 (Int (_ BitVec 64)) V!17619)

(assert (=> b!460186 (= lt!208377 (get!6777 (select (arr!13723 _values!549) from!863) (dynLambda!901 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460187 () Bool)

(declare-fun e!268494 () Bool)

(declare-fun e!268492 () Bool)

(declare-fun mapRes!20227 () Bool)

(assert (=> b!460187 (= e!268494 (and e!268492 mapRes!20227))))

(declare-fun condMapEmpty!20227 () Bool)

(declare-fun mapDefault!20227 () ValueCell!5849)

(assert (=> b!460187 (= condMapEmpty!20227 (= (arr!13723 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5849)) mapDefault!20227)))))

(declare-fun b!460188 () Bool)

(declare-fun e!268497 () Bool)

(declare-fun e!268500 () Bool)

(assert (=> b!460188 (= e!268497 e!268500)))

(declare-fun res!275144 () Bool)

(assert (=> b!460188 (=> (not res!275144) (not e!268500))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460188 (= res!275144 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17619)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208384 () array!28566)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!208376 () array!28564)

(declare-fun zeroValue!515 () V!17619)

(declare-fun getCurrentListMapNoExtraKeys!1777 (array!28564 array!28566 (_ BitVec 32) (_ BitVec 32) V!17619 V!17619 (_ BitVec 32) Int) ListLongMap!7067)

(assert (=> b!460188 (= lt!208385 (getCurrentListMapNoExtraKeys!1777 lt!208376 lt!208384 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17619)

(assert (=> b!460188 (= lt!208384 (array!28567 (store (arr!13723 _values!549) i!563 (ValueCellFull!5849 v!412)) (size!14075 _values!549)))))

(declare-fun lt!208387 () ListLongMap!7067)

(assert (=> b!460188 (= lt!208387 (getCurrentListMapNoExtraKeys!1777 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460189 () Bool)

(declare-fun res!275152 () Bool)

(assert (=> b!460189 (=> (not res!275152) (not e!268497))))

(declare-datatypes ((List!8218 0))(
  ( (Nil!8215) (Cons!8214 (h!9070 (_ BitVec 64)) (t!14136 List!8218)) )
))
(declare-fun arrayNoDuplicates!0 (array!28564 (_ BitVec 32) List!8218) Bool)

(assert (=> b!460189 (= res!275152 (arrayNoDuplicates!0 lt!208376 #b00000000000000000000000000000000 Nil!8215))))

(declare-fun b!460190 () Bool)

(declare-fun Unit!13384 () Unit!13382)

(assert (=> b!460190 (= e!268491 Unit!13384)))

(declare-fun b!460191 () Bool)

(declare-fun res!275145 () Bool)

(declare-fun e!268499 () Bool)

(assert (=> b!460191 (=> (not res!275145) (not e!268499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460191 (= res!275145 (validMask!0 mask!1025))))

(declare-fun res!275153 () Bool)

(assert (=> start!41164 (=> (not res!275153) (not e!268499))))

(assert (=> start!41164 (= res!275153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14074 _keys!709))))))

(assert (=> start!41164 e!268499))

(declare-fun tp_is_empty!12385 () Bool)

(assert (=> start!41164 tp_is_empty!12385))

(assert (=> start!41164 tp!38976))

(assert (=> start!41164 true))

(declare-fun array_inv!10008 (array!28566) Bool)

(assert (=> start!41164 (and (array_inv!10008 _values!549) e!268494)))

(declare-fun array_inv!10009 (array!28564) Bool)

(assert (=> start!41164 (array_inv!10009 _keys!709)))

(declare-fun b!460192 () Bool)

(declare-fun e!268493 () Bool)

(assert (=> b!460192 (= e!268493 tp_is_empty!12385)))

(declare-fun b!460193 () Bool)

(assert (=> b!460193 (= e!268499 e!268497)))

(declare-fun res!275150 () Bool)

(assert (=> b!460193 (=> (not res!275150) (not e!268497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28564 (_ BitVec 32)) Bool)

(assert (=> b!460193 (= res!275150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208376 mask!1025))))

(assert (=> b!460193 (= lt!208376 (array!28565 (store (arr!13722 _keys!709) i!563 k0!794) (size!14074 _keys!709)))))

(declare-fun b!460194 () Bool)

(assert (=> b!460194 (= e!268496 true)))

(declare-fun lt!208379 () tuple2!8152)

(declare-fun lt!208388 () ListLongMap!7067)

(assert (=> b!460194 (= lt!208383 (+!1625 (+!1625 lt!208388 lt!208374) lt!208379))))

(declare-fun lt!208386 () Unit!13382)

(declare-fun addCommutativeForDiffKeys!423 (ListLongMap!7067 (_ BitVec 64) V!17619 (_ BitVec 64) V!17619) Unit!13382)

(assert (=> b!460194 (= lt!208386 (addCommutativeForDiffKeys!423 lt!208388 k0!794 v!412 (select (arr!13722 _keys!709) from!863) lt!208377))))

(declare-fun mapNonEmpty!20227 () Bool)

(declare-fun tp!38977 () Bool)

(assert (=> mapNonEmpty!20227 (= mapRes!20227 (and tp!38977 e!268493))))

(declare-fun mapValue!20227 () ValueCell!5849)

(declare-fun mapKey!20227 () (_ BitVec 32))

(declare-fun mapRest!20227 () (Array (_ BitVec 32) ValueCell!5849))

(assert (=> mapNonEmpty!20227 (= (arr!13723 _values!549) (store mapRest!20227 mapKey!20227 mapValue!20227))))

(declare-fun b!460195 () Bool)

(declare-fun res!275149 () Bool)

(assert (=> b!460195 (=> (not res!275149) (not e!268499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460195 (= res!275149 (validKeyInArray!0 k0!794))))

(declare-fun b!460196 () Bool)

(declare-fun res!275147 () Bool)

(assert (=> b!460196 (=> (not res!275147) (not e!268499))))

(assert (=> b!460196 (= res!275147 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14074 _keys!709))))))

(declare-fun b!460197 () Bool)

(declare-fun res!275140 () Bool)

(assert (=> b!460197 (=> (not res!275140) (not e!268497))))

(assert (=> b!460197 (= res!275140 (bvsle from!863 i!563))))

(declare-fun b!460198 () Bool)

(assert (=> b!460198 (= e!268492 tp_is_empty!12385)))

(declare-fun b!460199 () Bool)

(declare-fun res!275151 () Bool)

(assert (=> b!460199 (=> (not res!275151) (not e!268499))))

(declare-fun arrayContainsKey!0 (array!28564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460199 (= res!275151 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460200 () Bool)

(declare-fun res!275148 () Bool)

(assert (=> b!460200 (=> (not res!275148) (not e!268499))))

(assert (=> b!460200 (= res!275148 (and (= (size!14075 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14074 _keys!709) (size!14075 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460201 () Bool)

(declare-fun res!275154 () Bool)

(assert (=> b!460201 (=> (not res!275154) (not e!268499))))

(assert (=> b!460201 (= res!275154 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8215))))

(declare-fun b!460202 () Bool)

(declare-fun res!275142 () Bool)

(assert (=> b!460202 (=> (not res!275142) (not e!268499))))

(assert (=> b!460202 (= res!275142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!20227 () Bool)

(assert (=> mapIsEmpty!20227 mapRes!20227))

(declare-fun b!460203 () Bool)

(declare-fun res!275141 () Bool)

(assert (=> b!460203 (=> (not res!275141) (not e!268499))))

(assert (=> b!460203 (= res!275141 (or (= (select (arr!13722 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13722 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460204 () Bool)

(declare-fun Unit!13385 () Unit!13382)

(assert (=> b!460204 (= e!268491 Unit!13385)))

(declare-fun lt!208380 () Unit!13382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28564 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13382)

(assert (=> b!460204 (= lt!208380 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460204 false))

(declare-fun b!460205 () Bool)

(assert (=> b!460205 (= e!268500 (not e!268498))))

(declare-fun res!275146 () Bool)

(assert (=> b!460205 (=> res!275146 e!268498)))

(assert (=> b!460205 (= res!275146 (not (validKeyInArray!0 (select (arr!13722 _keys!709) from!863))))))

(declare-fun lt!208375 () ListLongMap!7067)

(assert (=> b!460205 (= lt!208375 lt!208381)))

(assert (=> b!460205 (= lt!208381 (+!1625 lt!208388 lt!208379))))

(assert (=> b!460205 (= lt!208375 (getCurrentListMapNoExtraKeys!1777 lt!208376 lt!208384 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460205 (= lt!208379 (tuple2!8153 k0!794 v!412))))

(assert (=> b!460205 (= lt!208388 (getCurrentListMapNoExtraKeys!1777 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208382 () Unit!13382)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!781 (array!28564 array!28566 (_ BitVec 32) (_ BitVec 32) V!17619 V!17619 (_ BitVec 32) (_ BitVec 64) V!17619 (_ BitVec 32) Int) Unit!13382)

(assert (=> b!460205 (= lt!208382 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!41164 res!275153) b!460191))

(assert (= (and b!460191 res!275145) b!460200))

(assert (= (and b!460200 res!275148) b!460202))

(assert (= (and b!460202 res!275142) b!460201))

(assert (= (and b!460201 res!275154) b!460196))

(assert (= (and b!460196 res!275147) b!460195))

(assert (= (and b!460195 res!275149) b!460203))

(assert (= (and b!460203 res!275141) b!460199))

(assert (= (and b!460199 res!275151) b!460193))

(assert (= (and b!460193 res!275150) b!460189))

(assert (= (and b!460189 res!275152) b!460197))

(assert (= (and b!460197 res!275140) b!460188))

(assert (= (and b!460188 res!275144) b!460205))

(assert (= (and b!460205 (not res!275146)) b!460186))

(assert (= (and b!460186 c!56492) b!460204))

(assert (= (and b!460186 (not c!56492)) b!460190))

(assert (= (and b!460186 (not res!275143)) b!460194))

(assert (= (and b!460187 condMapEmpty!20227) mapIsEmpty!20227))

(assert (= (and b!460187 (not condMapEmpty!20227)) mapNonEmpty!20227))

(get-info :version)

(assert (= (and mapNonEmpty!20227 ((_ is ValueCellFull!5849) mapValue!20227)) b!460192))

(assert (= (and b!460187 ((_ is ValueCellFull!5849) mapDefault!20227)) b!460198))

(assert (= start!41164 b!460187))

(declare-fun b_lambda!9895 () Bool)

(assert (=> (not b_lambda!9895) (not b!460186)))

(declare-fun t!14134 () Bool)

(declare-fun tb!3875 () Bool)

(assert (=> (and start!41164 (= defaultEntry!557 defaultEntry!557) t!14134) tb!3875))

(declare-fun result!7303 () Bool)

(assert (=> tb!3875 (= result!7303 tp_is_empty!12385)))

(assert (=> b!460186 t!14134))

(declare-fun b_and!19345 () Bool)

(assert (= b_and!19343 (and (=> t!14134 result!7303) b_and!19345)))

(declare-fun m!443633 () Bool)

(assert (=> b!460199 m!443633))

(declare-fun m!443635 () Bool)

(assert (=> b!460189 m!443635))

(declare-fun m!443637 () Bool)

(assert (=> b!460203 m!443637))

(declare-fun m!443639 () Bool)

(assert (=> b!460202 m!443639))

(declare-fun m!443641 () Bool)

(assert (=> b!460191 m!443641))

(declare-fun m!443643 () Bool)

(assert (=> b!460186 m!443643))

(declare-fun m!443645 () Bool)

(assert (=> b!460186 m!443645))

(declare-fun m!443647 () Bool)

(assert (=> b!460186 m!443647))

(declare-fun m!443649 () Bool)

(assert (=> b!460186 m!443649))

(assert (=> b!460186 m!443649))

(assert (=> b!460186 m!443647))

(declare-fun m!443651 () Bool)

(assert (=> b!460186 m!443651))

(declare-fun m!443653 () Bool)

(assert (=> b!460188 m!443653))

(declare-fun m!443655 () Bool)

(assert (=> b!460188 m!443655))

(declare-fun m!443657 () Bool)

(assert (=> b!460188 m!443657))

(declare-fun m!443659 () Bool)

(assert (=> b!460194 m!443659))

(assert (=> b!460194 m!443659))

(declare-fun m!443661 () Bool)

(assert (=> b!460194 m!443661))

(assert (=> b!460194 m!443643))

(assert (=> b!460194 m!443643))

(declare-fun m!443663 () Bool)

(assert (=> b!460194 m!443663))

(declare-fun m!443665 () Bool)

(assert (=> b!460201 m!443665))

(declare-fun m!443667 () Bool)

(assert (=> start!41164 m!443667))

(declare-fun m!443669 () Bool)

(assert (=> start!41164 m!443669))

(declare-fun m!443671 () Bool)

(assert (=> b!460193 m!443671))

(declare-fun m!443673 () Bool)

(assert (=> b!460193 m!443673))

(declare-fun m!443675 () Bool)

(assert (=> b!460204 m!443675))

(assert (=> b!460205 m!443643))

(declare-fun m!443677 () Bool)

(assert (=> b!460205 m!443677))

(declare-fun m!443679 () Bool)

(assert (=> b!460205 m!443679))

(declare-fun m!443681 () Bool)

(assert (=> b!460205 m!443681))

(assert (=> b!460205 m!443643))

(declare-fun m!443683 () Bool)

(assert (=> b!460205 m!443683))

(declare-fun m!443685 () Bool)

(assert (=> b!460205 m!443685))

(declare-fun m!443687 () Bool)

(assert (=> mapNonEmpty!20227 m!443687))

(declare-fun m!443689 () Bool)

(assert (=> b!460195 m!443689))

(check-sat (not b_lambda!9895) (not mapNonEmpty!20227) (not b!460194) (not b!460189) (not b!460193) (not b!460188) tp_is_empty!12385 (not b!460195) (not b!460201) (not b!460191) (not b!460202) (not b!460204) (not b!460186) b_and!19345 (not start!41164) (not b!460199) (not b!460205) (not b_next!11047))
(check-sat b_and!19345 (not b_next!11047))
