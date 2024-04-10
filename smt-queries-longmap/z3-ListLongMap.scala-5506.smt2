; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72822 () Bool)

(assert start!72822)

(declare-fun res!574106 () Bool)

(declare-fun e!471783 () Bool)

(assert (=> start!72822 (=> (not res!574106) (not e!471783))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47968 0))(
  ( (array!47969 (arr!23015 (Array (_ BitVec 32) (_ BitVec 64))) (size!23455 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47968)

(assert (=> start!72822 (= res!574106 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23455 _keys!868))))))

(assert (=> start!72822 e!471783))

(assert (=> start!72822 true))

(declare-fun array_inv!18292 (array!47968) Bool)

(assert (=> start!72822 (array_inv!18292 _keys!868)))

(declare-datatypes ((V!26211 0))(
  ( (V!26212 (val!7984 Int)) )
))
(declare-datatypes ((ValueCell!7497 0))(
  ( (ValueCellFull!7497 (v!10409 V!26211)) (EmptyCell!7497) )
))
(declare-datatypes ((array!47970 0))(
  ( (array!47971 (arr!23016 (Array (_ BitVec 32) ValueCell!7497)) (size!23456 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47970)

(declare-fun e!471785 () Bool)

(declare-fun array_inv!18293 (array!47970) Bool)

(assert (=> start!72822 (and (array_inv!18293 _values!688) e!471785)))

(declare-fun b!845096 () Bool)

(declare-fun e!471787 () Bool)

(declare-fun tp_is_empty!15873 () Bool)

(assert (=> b!845096 (= e!471787 tp_is_empty!15873)))

(declare-fun b!845097 () Bool)

(declare-fun e!471784 () Bool)

(declare-fun mapRes!25409 () Bool)

(assert (=> b!845097 (= e!471785 (and e!471784 mapRes!25409))))

(declare-fun condMapEmpty!25409 () Bool)

(declare-fun mapDefault!25409 () ValueCell!7497)

(assert (=> b!845097 (= condMapEmpty!25409 (= (arr!23016 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7497)) mapDefault!25409)))))

(declare-fun b!845098 () Bool)

(declare-fun res!574109 () Bool)

(assert (=> b!845098 (=> (not res!574109) (not e!471783))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845098 (= res!574109 (validMask!0 mask!1196))))

(declare-fun b!845099 () Bool)

(assert (=> b!845099 (= e!471784 tp_is_empty!15873)))

(declare-fun b!845100 () Bool)

(declare-fun res!574108 () Bool)

(assert (=> b!845100 (=> (not res!574108) (not e!471783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47968 (_ BitVec 32)) Bool)

(assert (=> b!845100 (= res!574108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845101 () Bool)

(assert (=> b!845101 (= e!471783 false)))

(declare-fun lt!381376 () Bool)

(declare-datatypes ((List!16293 0))(
  ( (Nil!16290) (Cons!16289 (h!17420 (_ BitVec 64)) (t!22664 List!16293)) )
))
(declare-fun arrayNoDuplicates!0 (array!47968 (_ BitVec 32) List!16293) Bool)

(assert (=> b!845101 (= lt!381376 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16290))))

(declare-fun mapIsEmpty!25409 () Bool)

(assert (=> mapIsEmpty!25409 mapRes!25409))

(declare-fun b!845102 () Bool)

(declare-fun res!574107 () Bool)

(assert (=> b!845102 (=> (not res!574107) (not e!471783))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845102 (= res!574107 (and (= (size!23456 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23455 _keys!868) (size!23456 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25409 () Bool)

(declare-fun tp!48727 () Bool)

(assert (=> mapNonEmpty!25409 (= mapRes!25409 (and tp!48727 e!471787))))

(declare-fun mapRest!25409 () (Array (_ BitVec 32) ValueCell!7497))

(declare-fun mapKey!25409 () (_ BitVec 32))

(declare-fun mapValue!25409 () ValueCell!7497)

(assert (=> mapNonEmpty!25409 (= (arr!23016 _values!688) (store mapRest!25409 mapKey!25409 mapValue!25409))))

(assert (= (and start!72822 res!574106) b!845098))

(assert (= (and b!845098 res!574109) b!845102))

(assert (= (and b!845102 res!574107) b!845100))

(assert (= (and b!845100 res!574108) b!845101))

(assert (= (and b!845097 condMapEmpty!25409) mapIsEmpty!25409))

(assert (= (and b!845097 (not condMapEmpty!25409)) mapNonEmpty!25409))

(get-info :version)

(assert (= (and mapNonEmpty!25409 ((_ is ValueCellFull!7497) mapValue!25409)) b!845096))

(assert (= (and b!845097 ((_ is ValueCellFull!7497) mapDefault!25409)) b!845099))

(assert (= start!72822 b!845097))

(declare-fun m!787065 () Bool)

(assert (=> b!845098 m!787065))

(declare-fun m!787067 () Bool)

(assert (=> b!845100 m!787067))

(declare-fun m!787069 () Bool)

(assert (=> mapNonEmpty!25409 m!787069))

(declare-fun m!787071 () Bool)

(assert (=> b!845101 m!787071))

(declare-fun m!787073 () Bool)

(assert (=> start!72822 m!787073))

(declare-fun m!787075 () Bool)

(assert (=> start!72822 m!787075))

(check-sat (not b!845100) tp_is_empty!15873 (not mapNonEmpty!25409) (not start!72822) (not b!845101) (not b!845098))
(check-sat)
