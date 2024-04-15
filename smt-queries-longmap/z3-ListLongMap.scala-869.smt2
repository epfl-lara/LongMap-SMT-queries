; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20314 () Bool)

(assert start!20314)

(declare-fun b_free!4969 () Bool)

(declare-fun b_next!4969 () Bool)

(assert (=> start!20314 (= b_free!4969 (not b_next!4969))))

(declare-fun tp!17938 () Bool)

(declare-fun b_and!11689 () Bool)

(assert (=> start!20314 (= tp!17938 b_and!11689)))

(declare-fun b!199938 () Bool)

(declare-fun e!131145 () Bool)

(declare-fun e!131147 () Bool)

(declare-fun mapRes!8306 () Bool)

(assert (=> b!199938 (= e!131145 (and e!131147 mapRes!8306))))

(declare-fun condMapEmpty!8306 () Bool)

(declare-datatypes ((V!6081 0))(
  ( (V!6082 (val!2457 Int)) )
))
(declare-datatypes ((ValueCell!2069 0))(
  ( (ValueCellFull!2069 (v!4421 V!6081)) (EmptyCell!2069) )
))
(declare-datatypes ((array!8869 0))(
  ( (array!8870 (arr!4184 (Array (_ BitVec 32) ValueCell!2069)) (size!4510 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8869)

(declare-fun mapDefault!8306 () ValueCell!2069)

(assert (=> b!199938 (= condMapEmpty!8306 (= (arr!4184 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2069)) mapDefault!8306)))))

(declare-fun b!199939 () Bool)

(declare-fun res!95147 () Bool)

(declare-fun e!131144 () Bool)

(assert (=> b!199939 (=> (not res!95147) (not e!131144))))

(declare-datatypes ((array!8871 0))(
  ( (array!8872 (arr!4185 (Array (_ BitVec 32) (_ BitVec 64))) (size!4511 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8871)

(declare-datatypes ((List!2613 0))(
  ( (Nil!2610) (Cons!2609 (h!3251 (_ BitVec 64)) (t!7535 List!2613)) )
))
(declare-fun arrayNoDuplicates!0 (array!8871 (_ BitVec 32) List!2613) Bool)

(assert (=> b!199939 (= res!95147 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2610))))

(declare-fun mapIsEmpty!8306 () Bool)

(assert (=> mapIsEmpty!8306 mapRes!8306))

(declare-fun mapNonEmpty!8306 () Bool)

(declare-fun tp!17939 () Bool)

(declare-fun e!131148 () Bool)

(assert (=> mapNonEmpty!8306 (= mapRes!8306 (and tp!17939 e!131148))))

(declare-fun mapKey!8306 () (_ BitVec 32))

(declare-fun mapRest!8306 () (Array (_ BitVec 32) ValueCell!2069))

(declare-fun mapValue!8306 () ValueCell!2069)

(assert (=> mapNonEmpty!8306 (= (arr!4184 _values!649) (store mapRest!8306 mapKey!8306 mapValue!8306))))

(declare-fun b!199940 () Bool)

(declare-fun res!95146 () Bool)

(assert (=> b!199940 (=> (not res!95146) (not e!131144))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8871 (_ BitVec 32)) Bool)

(assert (=> b!199940 (= res!95146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!95145 () Bool)

(assert (=> start!20314 (=> (not res!95145) (not e!131144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20314 (= res!95145 (validMask!0 mask!1149))))

(assert (=> start!20314 e!131144))

(declare-fun array_inv!2731 (array!8869) Bool)

(assert (=> start!20314 (and (array_inv!2731 _values!649) e!131145)))

(assert (=> start!20314 true))

(declare-fun tp_is_empty!4825 () Bool)

(assert (=> start!20314 tp_is_empty!4825))

(declare-fun array_inv!2732 (array!8871) Bool)

(assert (=> start!20314 (array_inv!2732 _keys!825)))

(assert (=> start!20314 tp!17938))

(declare-fun b!199937 () Bool)

(assert (=> b!199937 (= e!131147 tp_is_empty!4825)))

(declare-fun b!199941 () Bool)

(declare-fun res!95148 () Bool)

(assert (=> b!199941 (=> (not res!95148) (not e!131144))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199941 (= res!95148 (= (select (arr!4185 _keys!825) i!601) k0!843))))

(declare-fun b!199942 () Bool)

(declare-fun res!95149 () Bool)

(assert (=> b!199942 (=> (not res!95149) (not e!131144))))

(assert (=> b!199942 (= res!95149 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4511 _keys!825))))))

(declare-fun b!199943 () Bool)

(assert (=> b!199943 (= e!131148 tp_is_empty!4825)))

(declare-fun b!199944 () Bool)

(declare-fun res!95144 () Bool)

(assert (=> b!199944 (=> (not res!95144) (not e!131144))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199944 (= res!95144 (and (= (size!4510 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4511 _keys!825) (size!4510 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199945 () Bool)

(declare-fun res!95150 () Bool)

(assert (=> b!199945 (=> (not res!95150) (not e!131144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199945 (= res!95150 (validKeyInArray!0 k0!843))))

(declare-fun b!199946 () Bool)

(assert (=> b!199946 (= e!131144 (not (bvsle #b00000000000000000000000000000000 (size!4511 _keys!825))))))

(declare-fun lt!98526 () array!8869)

(declare-datatypes ((tuple2!3686 0))(
  ( (tuple2!3687 (_1!1854 (_ BitVec 64)) (_2!1854 V!6081)) )
))
(declare-datatypes ((List!2614 0))(
  ( (Nil!2611) (Cons!2610 (h!3252 tuple2!3686) (t!7536 List!2614)) )
))
(declare-datatypes ((ListLongMap!2589 0))(
  ( (ListLongMap!2590 (toList!1310 List!2614)) )
))
(declare-fun lt!98527 () ListLongMap!2589)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6081)

(declare-fun zeroValue!615 () V!6081)

(declare-fun getCurrentListMap!880 (array!8871 array!8869 (_ BitVec 32) (_ BitVec 32) V!6081 V!6081 (_ BitVec 32) Int) ListLongMap!2589)

(assert (=> b!199946 (= lt!98527 (getCurrentListMap!880 _keys!825 lt!98526 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98523 () ListLongMap!2589)

(declare-fun lt!98524 () ListLongMap!2589)

(assert (=> b!199946 (and (= lt!98523 lt!98524) (= lt!98524 lt!98523))))

(declare-fun lt!98528 () ListLongMap!2589)

(declare-fun v!520 () V!6081)

(declare-fun +!359 (ListLongMap!2589 tuple2!3686) ListLongMap!2589)

(assert (=> b!199946 (= lt!98524 (+!359 lt!98528 (tuple2!3687 k0!843 v!520)))))

(declare-datatypes ((Unit!5970 0))(
  ( (Unit!5971) )
))
(declare-fun lt!98525 () Unit!5970)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!39 (array!8871 array!8869 (_ BitVec 32) (_ BitVec 32) V!6081 V!6081 (_ BitVec 32) (_ BitVec 64) V!6081 (_ BitVec 32) Int) Unit!5970)

(assert (=> b!199946 (= lt!98525 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!39 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!290 (array!8871 array!8869 (_ BitVec 32) (_ BitVec 32) V!6081 V!6081 (_ BitVec 32) Int) ListLongMap!2589)

(assert (=> b!199946 (= lt!98523 (getCurrentListMapNoExtraKeys!290 _keys!825 lt!98526 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199946 (= lt!98526 (array!8870 (store (arr!4184 _values!649) i!601 (ValueCellFull!2069 v!520)) (size!4510 _values!649)))))

(assert (=> b!199946 (= lt!98528 (getCurrentListMapNoExtraKeys!290 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20314 res!95145) b!199944))

(assert (= (and b!199944 res!95144) b!199940))

(assert (= (and b!199940 res!95146) b!199939))

(assert (= (and b!199939 res!95147) b!199942))

(assert (= (and b!199942 res!95149) b!199945))

(assert (= (and b!199945 res!95150) b!199941))

(assert (= (and b!199941 res!95148) b!199946))

(assert (= (and b!199938 condMapEmpty!8306) mapIsEmpty!8306))

(assert (= (and b!199938 (not condMapEmpty!8306)) mapNonEmpty!8306))

(get-info :version)

(assert (= (and mapNonEmpty!8306 ((_ is ValueCellFull!2069) mapValue!8306)) b!199943))

(assert (= (and b!199938 ((_ is ValueCellFull!2069) mapDefault!8306)) b!199937))

(assert (= start!20314 b!199938))

(declare-fun m!225891 () Bool)

(assert (=> b!199941 m!225891))

(declare-fun m!225893 () Bool)

(assert (=> start!20314 m!225893))

(declare-fun m!225895 () Bool)

(assert (=> start!20314 m!225895))

(declare-fun m!225897 () Bool)

(assert (=> start!20314 m!225897))

(declare-fun m!225899 () Bool)

(assert (=> b!199940 m!225899))

(declare-fun m!225901 () Bool)

(assert (=> b!199939 m!225901))

(declare-fun m!225903 () Bool)

(assert (=> b!199945 m!225903))

(declare-fun m!225905 () Bool)

(assert (=> b!199946 m!225905))

(declare-fun m!225907 () Bool)

(assert (=> b!199946 m!225907))

(declare-fun m!225909 () Bool)

(assert (=> b!199946 m!225909))

(declare-fun m!225911 () Bool)

(assert (=> b!199946 m!225911))

(declare-fun m!225913 () Bool)

(assert (=> b!199946 m!225913))

(declare-fun m!225915 () Bool)

(assert (=> b!199946 m!225915))

(declare-fun m!225917 () Bool)

(assert (=> mapNonEmpty!8306 m!225917))

(check-sat (not start!20314) (not b!199940) (not b!199945) (not b!199939) (not mapNonEmpty!8306) tp_is_empty!4825 (not b_next!4969) (not b!199946) b_and!11689)
(check-sat b_and!11689 (not b_next!4969))
