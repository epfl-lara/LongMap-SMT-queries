; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72816 () Bool)

(assert start!72816)

(declare-fun b!845033 () Bool)

(declare-fun res!574072 () Bool)

(declare-fun e!471739 () Bool)

(assert (=> b!845033 (=> (not res!574072) (not e!471739))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845033 (= res!574072 (validMask!0 mask!1196))))

(declare-fun b!845034 () Bool)

(assert (=> b!845034 (= e!471739 false)))

(declare-fun lt!381367 () Bool)

(declare-datatypes ((array!47956 0))(
  ( (array!47957 (arr!23009 (Array (_ BitVec 32) (_ BitVec 64))) (size!23449 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47956)

(declare-datatypes ((List!16291 0))(
  ( (Nil!16288) (Cons!16287 (h!17418 (_ BitVec 64)) (t!22662 List!16291)) )
))
(declare-fun arrayNoDuplicates!0 (array!47956 (_ BitVec 32) List!16291) Bool)

(assert (=> b!845034 (= lt!381367 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16288))))

(declare-fun b!845035 () Bool)

(declare-fun res!574071 () Bool)

(assert (=> b!845035 (=> (not res!574071) (not e!471739))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26203 0))(
  ( (V!26204 (val!7981 Int)) )
))
(declare-datatypes ((ValueCell!7494 0))(
  ( (ValueCellFull!7494 (v!10406 V!26203)) (EmptyCell!7494) )
))
(declare-datatypes ((array!47958 0))(
  ( (array!47959 (arr!23010 (Array (_ BitVec 32) ValueCell!7494)) (size!23450 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47958)

(assert (=> b!845035 (= res!574071 (and (= (size!23450 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23449 _keys!868) (size!23450 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845036 () Bool)

(declare-fun res!574070 () Bool)

(assert (=> b!845036 (=> (not res!574070) (not e!471739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47956 (_ BitVec 32)) Bool)

(assert (=> b!845036 (= res!574070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25400 () Bool)

(declare-fun mapRes!25400 () Bool)

(declare-fun tp!48718 () Bool)

(declare-fun e!471738 () Bool)

(assert (=> mapNonEmpty!25400 (= mapRes!25400 (and tp!48718 e!471738))))

(declare-fun mapKey!25400 () (_ BitVec 32))

(declare-fun mapValue!25400 () ValueCell!7494)

(declare-fun mapRest!25400 () (Array (_ BitVec 32) ValueCell!7494))

(assert (=> mapNonEmpty!25400 (= (arr!23010 _values!688) (store mapRest!25400 mapKey!25400 mapValue!25400))))

(declare-fun b!845037 () Bool)

(declare-fun tp_is_empty!15867 () Bool)

(assert (=> b!845037 (= e!471738 tp_is_empty!15867)))

(declare-fun b!845038 () Bool)

(declare-fun e!471740 () Bool)

(declare-fun e!471742 () Bool)

(assert (=> b!845038 (= e!471740 (and e!471742 mapRes!25400))))

(declare-fun condMapEmpty!25400 () Bool)

(declare-fun mapDefault!25400 () ValueCell!7494)

(assert (=> b!845038 (= condMapEmpty!25400 (= (arr!23010 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7494)) mapDefault!25400)))))

(declare-fun b!845039 () Bool)

(assert (=> b!845039 (= e!471742 tp_is_empty!15867)))

(declare-fun res!574073 () Bool)

(assert (=> start!72816 (=> (not res!574073) (not e!471739))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72816 (= res!574073 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23449 _keys!868))))))

(assert (=> start!72816 e!471739))

(assert (=> start!72816 true))

(declare-fun array_inv!18290 (array!47956) Bool)

(assert (=> start!72816 (array_inv!18290 _keys!868)))

(declare-fun array_inv!18291 (array!47958) Bool)

(assert (=> start!72816 (and (array_inv!18291 _values!688) e!471740)))

(declare-fun mapIsEmpty!25400 () Bool)

(assert (=> mapIsEmpty!25400 mapRes!25400))

(assert (= (and start!72816 res!574073) b!845033))

(assert (= (and b!845033 res!574072) b!845035))

(assert (= (and b!845035 res!574071) b!845036))

(assert (= (and b!845036 res!574070) b!845034))

(assert (= (and b!845038 condMapEmpty!25400) mapIsEmpty!25400))

(assert (= (and b!845038 (not condMapEmpty!25400)) mapNonEmpty!25400))

(get-info :version)

(assert (= (and mapNonEmpty!25400 ((_ is ValueCellFull!7494) mapValue!25400)) b!845037))

(assert (= (and b!845038 ((_ is ValueCellFull!7494) mapDefault!25400)) b!845039))

(assert (= start!72816 b!845038))

(declare-fun m!787029 () Bool)

(assert (=> mapNonEmpty!25400 m!787029))

(declare-fun m!787031 () Bool)

(assert (=> b!845033 m!787031))

(declare-fun m!787033 () Bool)

(assert (=> start!72816 m!787033))

(declare-fun m!787035 () Bool)

(assert (=> start!72816 m!787035))

(declare-fun m!787037 () Bool)

(assert (=> b!845036 m!787037))

(declare-fun m!787039 () Bool)

(assert (=> b!845034 m!787039))

(check-sat tp_is_empty!15867 (not b!845034) (not mapNonEmpty!25400) (not start!72816) (not b!845036) (not b!845033))
(check-sat)
