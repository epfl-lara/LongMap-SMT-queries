; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20308 () Bool)

(assert start!20308)

(declare-fun b_free!4963 () Bool)

(declare-fun b_next!4963 () Bool)

(assert (=> start!20308 (= b_free!4963 (not b_next!4963))))

(declare-fun tp!17921 () Bool)

(declare-fun b_and!11683 () Bool)

(assert (=> start!20308 (= tp!17921 b_and!11683)))

(declare-fun b!199847 () Bool)

(declare-fun res!95087 () Bool)

(declare-fun e!131102 () Bool)

(assert (=> b!199847 (=> (not res!95087) (not e!131102))))

(declare-datatypes ((array!8859 0))(
  ( (array!8860 (arr!4179 (Array (_ BitVec 32) (_ BitVec 64))) (size!4505 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8859)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6073 0))(
  ( (V!6074 (val!2454 Int)) )
))
(declare-datatypes ((ValueCell!2066 0))(
  ( (ValueCellFull!2066 (v!4418 V!6073)) (EmptyCell!2066) )
))
(declare-datatypes ((array!8861 0))(
  ( (array!8862 (arr!4180 (Array (_ BitVec 32) ValueCell!2066)) (size!4506 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8861)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!199847 (= res!95087 (and (= (size!4506 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4505 _keys!825) (size!4506 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199848 () Bool)

(declare-fun res!95083 () Bool)

(assert (=> b!199848 (=> (not res!95083) (not e!131102))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199848 (= res!95083 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4505 _keys!825))))))

(declare-fun b!199849 () Bool)

(declare-fun e!131103 () Bool)

(declare-fun e!131101 () Bool)

(declare-fun mapRes!8297 () Bool)

(assert (=> b!199849 (= e!131103 (and e!131101 mapRes!8297))))

(declare-fun condMapEmpty!8297 () Bool)

(declare-fun mapDefault!8297 () ValueCell!2066)

(assert (=> b!199849 (= condMapEmpty!8297 (= (arr!4180 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2066)) mapDefault!8297)))))

(declare-fun b!199850 () Bool)

(declare-fun res!95081 () Bool)

(assert (=> b!199850 (=> (not res!95081) (not e!131102))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199850 (= res!95081 (validKeyInArray!0 k0!843))))

(declare-fun b!199851 () Bool)

(assert (=> b!199851 (= e!131102 (not true))))

(declare-fun lt!98470 () array!8861)

(declare-datatypes ((tuple2!3682 0))(
  ( (tuple2!3683 (_1!1852 (_ BitVec 64)) (_2!1852 V!6073)) )
))
(declare-datatypes ((List!2609 0))(
  ( (Nil!2606) (Cons!2605 (h!3247 tuple2!3682) (t!7531 List!2609)) )
))
(declare-datatypes ((ListLongMap!2585 0))(
  ( (ListLongMap!2586 (toList!1308 List!2609)) )
))
(declare-fun lt!98474 () ListLongMap!2585)

(declare-fun zeroValue!615 () V!6073)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6073)

(declare-fun getCurrentListMap!878 (array!8859 array!8861 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) Int) ListLongMap!2585)

(assert (=> b!199851 (= lt!98474 (getCurrentListMap!878 _keys!825 lt!98470 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98473 () ListLongMap!2585)

(declare-fun lt!98469 () ListLongMap!2585)

(assert (=> b!199851 (and (= lt!98473 lt!98469) (= lt!98469 lt!98473))))

(declare-fun lt!98472 () ListLongMap!2585)

(declare-fun v!520 () V!6073)

(declare-fun +!357 (ListLongMap!2585 tuple2!3682) ListLongMap!2585)

(assert (=> b!199851 (= lt!98469 (+!357 lt!98472 (tuple2!3683 k0!843 v!520)))))

(declare-datatypes ((Unit!5966 0))(
  ( (Unit!5967) )
))
(declare-fun lt!98471 () Unit!5966)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!37 (array!8859 array!8861 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) (_ BitVec 64) V!6073 (_ BitVec 32) Int) Unit!5966)

(assert (=> b!199851 (= lt!98471 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!37 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!288 (array!8859 array!8861 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) Int) ListLongMap!2585)

(assert (=> b!199851 (= lt!98473 (getCurrentListMapNoExtraKeys!288 _keys!825 lt!98470 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199851 (= lt!98470 (array!8862 (store (arr!4180 _values!649) i!601 (ValueCellFull!2066 v!520)) (size!4506 _values!649)))))

(assert (=> b!199851 (= lt!98472 (getCurrentListMapNoExtraKeys!288 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!95086 () Bool)

(assert (=> start!20308 (=> (not res!95086) (not e!131102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20308 (= res!95086 (validMask!0 mask!1149))))

(assert (=> start!20308 e!131102))

(declare-fun array_inv!2727 (array!8861) Bool)

(assert (=> start!20308 (and (array_inv!2727 _values!649) e!131103)))

(assert (=> start!20308 true))

(declare-fun tp_is_empty!4819 () Bool)

(assert (=> start!20308 tp_is_empty!4819))

(declare-fun array_inv!2728 (array!8859) Bool)

(assert (=> start!20308 (array_inv!2728 _keys!825)))

(assert (=> start!20308 tp!17921))

(declare-fun b!199852 () Bool)

(declare-fun res!95085 () Bool)

(assert (=> b!199852 (=> (not res!95085) (not e!131102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8859 (_ BitVec 32)) Bool)

(assert (=> b!199852 (= res!95085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199853 () Bool)

(declare-fun e!131099 () Bool)

(assert (=> b!199853 (= e!131099 tp_is_empty!4819)))

(declare-fun b!199854 () Bool)

(assert (=> b!199854 (= e!131101 tp_is_empty!4819)))

(declare-fun mapNonEmpty!8297 () Bool)

(declare-fun tp!17920 () Bool)

(assert (=> mapNonEmpty!8297 (= mapRes!8297 (and tp!17920 e!131099))))

(declare-fun mapKey!8297 () (_ BitVec 32))

(declare-fun mapValue!8297 () ValueCell!2066)

(declare-fun mapRest!8297 () (Array (_ BitVec 32) ValueCell!2066))

(assert (=> mapNonEmpty!8297 (= (arr!4180 _values!649) (store mapRest!8297 mapKey!8297 mapValue!8297))))

(declare-fun b!199855 () Bool)

(declare-fun res!95084 () Bool)

(assert (=> b!199855 (=> (not res!95084) (not e!131102))))

(declare-datatypes ((List!2610 0))(
  ( (Nil!2607) (Cons!2606 (h!3248 (_ BitVec 64)) (t!7532 List!2610)) )
))
(declare-fun arrayNoDuplicates!0 (array!8859 (_ BitVec 32) List!2610) Bool)

(assert (=> b!199855 (= res!95084 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2607))))

(declare-fun mapIsEmpty!8297 () Bool)

(assert (=> mapIsEmpty!8297 mapRes!8297))

(declare-fun b!199856 () Bool)

(declare-fun res!95082 () Bool)

(assert (=> b!199856 (=> (not res!95082) (not e!131102))))

(assert (=> b!199856 (= res!95082 (= (select (arr!4179 _keys!825) i!601) k0!843))))

(assert (= (and start!20308 res!95086) b!199847))

(assert (= (and b!199847 res!95087) b!199852))

(assert (= (and b!199852 res!95085) b!199855))

(assert (= (and b!199855 res!95084) b!199848))

(assert (= (and b!199848 res!95083) b!199850))

(assert (= (and b!199850 res!95081) b!199856))

(assert (= (and b!199856 res!95082) b!199851))

(assert (= (and b!199849 condMapEmpty!8297) mapIsEmpty!8297))

(assert (= (and b!199849 (not condMapEmpty!8297)) mapNonEmpty!8297))

(get-info :version)

(assert (= (and mapNonEmpty!8297 ((_ is ValueCellFull!2066) mapValue!8297)) b!199853))

(assert (= (and b!199849 ((_ is ValueCellFull!2066) mapDefault!8297)) b!199854))

(assert (= start!20308 b!199849))

(declare-fun m!225807 () Bool)

(assert (=> b!199850 m!225807))

(declare-fun m!225809 () Bool)

(assert (=> b!199855 m!225809))

(declare-fun m!225811 () Bool)

(assert (=> b!199856 m!225811))

(declare-fun m!225813 () Bool)

(assert (=> start!20308 m!225813))

(declare-fun m!225815 () Bool)

(assert (=> start!20308 m!225815))

(declare-fun m!225817 () Bool)

(assert (=> start!20308 m!225817))

(declare-fun m!225819 () Bool)

(assert (=> b!199852 m!225819))

(declare-fun m!225821 () Bool)

(assert (=> b!199851 m!225821))

(declare-fun m!225823 () Bool)

(assert (=> b!199851 m!225823))

(declare-fun m!225825 () Bool)

(assert (=> b!199851 m!225825))

(declare-fun m!225827 () Bool)

(assert (=> b!199851 m!225827))

(declare-fun m!225829 () Bool)

(assert (=> b!199851 m!225829))

(declare-fun m!225831 () Bool)

(assert (=> b!199851 m!225831))

(declare-fun m!225833 () Bool)

(assert (=> mapNonEmpty!8297 m!225833))

(check-sat (not mapNonEmpty!8297) tp_is_empty!4819 (not b!199851) (not b!199850) b_and!11683 (not b!199855) (not start!20308) (not b_next!4963) (not b!199852))
(check-sat b_and!11683 (not b_next!4963))
