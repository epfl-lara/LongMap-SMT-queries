; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72810 () Bool)

(assert start!72810)

(declare-fun mapIsEmpty!25391 () Bool)

(declare-fun mapRes!25391 () Bool)

(assert (=> mapIsEmpty!25391 mapRes!25391))

(declare-fun b!844970 () Bool)

(declare-fun res!574035 () Bool)

(declare-fun e!471693 () Bool)

(assert (=> b!844970 (=> (not res!574035) (not e!471693))))

(declare-datatypes ((array!47948 0))(
  ( (array!47949 (arr!23005 (Array (_ BitVec 32) (_ BitVec 64))) (size!23445 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47948)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47948 (_ BitVec 32)) Bool)

(assert (=> b!844970 (= res!574035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844972 () Bool)

(declare-fun res!574034 () Bool)

(assert (=> b!844972 (=> (not res!574034) (not e!471693))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26195 0))(
  ( (V!26196 (val!7978 Int)) )
))
(declare-datatypes ((ValueCell!7491 0))(
  ( (ValueCellFull!7491 (v!10403 V!26195)) (EmptyCell!7491) )
))
(declare-datatypes ((array!47950 0))(
  ( (array!47951 (arr!23006 (Array (_ BitVec 32) ValueCell!7491)) (size!23446 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47950)

(assert (=> b!844972 (= res!574034 (and (= (size!23446 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23445 _keys!868) (size!23446 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25391 () Bool)

(declare-fun tp!48709 () Bool)

(declare-fun e!471697 () Bool)

(assert (=> mapNonEmpty!25391 (= mapRes!25391 (and tp!48709 e!471697))))

(declare-fun mapRest!25391 () (Array (_ BitVec 32) ValueCell!7491))

(declare-fun mapValue!25391 () ValueCell!7491)

(declare-fun mapKey!25391 () (_ BitVec 32))

(assert (=> mapNonEmpty!25391 (= (arr!23006 _values!688) (store mapRest!25391 mapKey!25391 mapValue!25391))))

(declare-fun b!844973 () Bool)

(declare-fun e!471696 () Bool)

(declare-fun tp_is_empty!15861 () Bool)

(assert (=> b!844973 (= e!471696 tp_is_empty!15861)))

(declare-fun b!844974 () Bool)

(assert (=> b!844974 (= e!471697 tp_is_empty!15861)))

(declare-fun b!844975 () Bool)

(declare-fun res!574036 () Bool)

(assert (=> b!844975 (=> (not res!574036) (not e!471693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844975 (= res!574036 (validMask!0 mask!1196))))

(declare-fun b!844976 () Bool)

(assert (=> b!844976 (= e!471693 false)))

(declare-fun lt!381358 () Bool)

(declare-datatypes ((List!16290 0))(
  ( (Nil!16287) (Cons!16286 (h!17417 (_ BitVec 64)) (t!22661 List!16290)) )
))
(declare-fun arrayNoDuplicates!0 (array!47948 (_ BitVec 32) List!16290) Bool)

(assert (=> b!844976 (= lt!381358 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16287))))

(declare-fun res!574037 () Bool)

(assert (=> start!72810 (=> (not res!574037) (not e!471693))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72810 (= res!574037 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23445 _keys!868))))))

(assert (=> start!72810 e!471693))

(assert (=> start!72810 true))

(declare-fun array_inv!18288 (array!47948) Bool)

(assert (=> start!72810 (array_inv!18288 _keys!868)))

(declare-fun e!471695 () Bool)

(declare-fun array_inv!18289 (array!47950) Bool)

(assert (=> start!72810 (and (array_inv!18289 _values!688) e!471695)))

(declare-fun b!844971 () Bool)

(assert (=> b!844971 (= e!471695 (and e!471696 mapRes!25391))))

(declare-fun condMapEmpty!25391 () Bool)

(declare-fun mapDefault!25391 () ValueCell!7491)

(assert (=> b!844971 (= condMapEmpty!25391 (= (arr!23006 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7491)) mapDefault!25391)))))

(assert (= (and start!72810 res!574037) b!844975))

(assert (= (and b!844975 res!574036) b!844972))

(assert (= (and b!844972 res!574034) b!844970))

(assert (= (and b!844970 res!574035) b!844976))

(assert (= (and b!844971 condMapEmpty!25391) mapIsEmpty!25391))

(assert (= (and b!844971 (not condMapEmpty!25391)) mapNonEmpty!25391))

(get-info :version)

(assert (= (and mapNonEmpty!25391 ((_ is ValueCellFull!7491) mapValue!25391)) b!844974))

(assert (= (and b!844971 ((_ is ValueCellFull!7491) mapDefault!25391)) b!844973))

(assert (= start!72810 b!844971))

(declare-fun m!786993 () Bool)

(assert (=> mapNonEmpty!25391 m!786993))

(declare-fun m!786995 () Bool)

(assert (=> b!844976 m!786995))

(declare-fun m!786997 () Bool)

(assert (=> start!72810 m!786997))

(declare-fun m!786999 () Bool)

(assert (=> start!72810 m!786999))

(declare-fun m!787001 () Bool)

(assert (=> b!844975 m!787001))

(declare-fun m!787003 () Bool)

(assert (=> b!844970 m!787003))

(check-sat (not b!844975) (not b!844976) (not b!844970) (not mapNonEmpty!25391) (not start!72810) tp_is_empty!15861)
(check-sat)
