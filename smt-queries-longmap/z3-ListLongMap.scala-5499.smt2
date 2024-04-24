; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72946 () Bool)

(assert start!72946)

(declare-fun b!845537 () Bool)

(declare-fun res!574189 () Bool)

(declare-fun e!472039 () Bool)

(assert (=> b!845537 (=> (not res!574189) (not e!472039))))

(declare-datatypes ((array!47927 0))(
  ( (array!47928 (arr!22990 (Array (_ BitVec 32) (_ BitVec 64))) (size!23431 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47927)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47927 (_ BitVec 32)) Bool)

(assert (=> b!845537 (= res!574189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845538 () Bool)

(declare-fun e!472038 () Bool)

(declare-fun tp_is_empty!15829 () Bool)

(assert (=> b!845538 (= e!472038 tp_is_empty!15829)))

(declare-fun b!845539 () Bool)

(declare-fun e!472037 () Bool)

(assert (=> b!845539 (= e!472037 tp_is_empty!15829)))

(declare-fun b!845540 () Bool)

(declare-fun res!574188 () Bool)

(assert (=> b!845540 (=> (not res!574188) (not e!472039))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26153 0))(
  ( (V!26154 (val!7962 Int)) )
))
(declare-datatypes ((ValueCell!7475 0))(
  ( (ValueCellFull!7475 (v!10387 V!26153)) (EmptyCell!7475) )
))
(declare-datatypes ((array!47929 0))(
  ( (array!47930 (arr!22991 (Array (_ BitVec 32) ValueCell!7475)) (size!23432 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47929)

(assert (=> b!845540 (= res!574188 (and (= (size!23432 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23431 _keys!868) (size!23432 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845541 () Bool)

(assert (=> b!845541 (= e!472039 false)))

(declare-fun lt!381671 () Bool)

(declare-datatypes ((List!16205 0))(
  ( (Nil!16202) (Cons!16201 (h!17338 (_ BitVec 64)) (t!22568 List!16205)) )
))
(declare-fun arrayNoDuplicates!0 (array!47927 (_ BitVec 32) List!16205) Bool)

(assert (=> b!845541 (= lt!381671 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16202))))

(declare-fun b!845542 () Bool)

(declare-fun res!574187 () Bool)

(assert (=> b!845542 (=> (not res!574187) (not e!472039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845542 (= res!574187 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25343 () Bool)

(declare-fun mapRes!25343 () Bool)

(declare-fun tp!48662 () Bool)

(assert (=> mapNonEmpty!25343 (= mapRes!25343 (and tp!48662 e!472038))))

(declare-fun mapKey!25343 () (_ BitVec 32))

(declare-fun mapRest!25343 () (Array (_ BitVec 32) ValueCell!7475))

(declare-fun mapValue!25343 () ValueCell!7475)

(assert (=> mapNonEmpty!25343 (= (arr!22991 _values!688) (store mapRest!25343 mapKey!25343 mapValue!25343))))

(declare-fun res!574186 () Bool)

(assert (=> start!72946 (=> (not res!574186) (not e!472039))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72946 (= res!574186 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23431 _keys!868))))))

(assert (=> start!72946 e!472039))

(assert (=> start!72946 true))

(declare-fun array_inv!18324 (array!47927) Bool)

(assert (=> start!72946 (array_inv!18324 _keys!868)))

(declare-fun e!472036 () Bool)

(declare-fun array_inv!18325 (array!47929) Bool)

(assert (=> start!72946 (and (array_inv!18325 _values!688) e!472036)))

(declare-fun mapIsEmpty!25343 () Bool)

(assert (=> mapIsEmpty!25343 mapRes!25343))

(declare-fun b!845543 () Bool)

(assert (=> b!845543 (= e!472036 (and e!472037 mapRes!25343))))

(declare-fun condMapEmpty!25343 () Bool)

(declare-fun mapDefault!25343 () ValueCell!7475)

(assert (=> b!845543 (= condMapEmpty!25343 (= (arr!22991 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7475)) mapDefault!25343)))))

(assert (= (and start!72946 res!574186) b!845542))

(assert (= (and b!845542 res!574187) b!845540))

(assert (= (and b!845540 res!574188) b!845537))

(assert (= (and b!845537 res!574189) b!845541))

(assert (= (and b!845543 condMapEmpty!25343) mapIsEmpty!25343))

(assert (= (and b!845543 (not condMapEmpty!25343)) mapNonEmpty!25343))

(get-info :version)

(assert (= (and mapNonEmpty!25343 ((_ is ValueCellFull!7475) mapValue!25343)) b!845538))

(assert (= (and b!845543 ((_ is ValueCellFull!7475) mapDefault!25343)) b!845539))

(assert (= start!72946 b!845543))

(declare-fun m!788093 () Bool)

(assert (=> mapNonEmpty!25343 m!788093))

(declare-fun m!788095 () Bool)

(assert (=> b!845541 m!788095))

(declare-fun m!788097 () Bool)

(assert (=> start!72946 m!788097))

(declare-fun m!788099 () Bool)

(assert (=> start!72946 m!788099))

(declare-fun m!788101 () Bool)

(assert (=> b!845537 m!788101))

(declare-fun m!788103 () Bool)

(assert (=> b!845542 m!788103))

(check-sat (not b!845541) (not b!845537) (not mapNonEmpty!25343) (not b!845542) tp_is_empty!15829 (not start!72946))
(check-sat)
