; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95874 () Bool)

(assert start!95874)

(declare-fun b_free!22291 () Bool)

(declare-fun b_next!22291 () Bool)

(assert (=> start!95874 (= b_free!22291 (not b_next!22291))))

(declare-fun tp!78722 () Bool)

(declare-fun b_and!35279 () Bool)

(assert (=> start!95874 (= tp!78722 b_and!35279)))

(declare-fun mapIsEmpty!41194 () Bool)

(declare-fun mapRes!41194 () Bool)

(assert (=> mapIsEmpty!41194 mapRes!41194))

(declare-fun b!1082080 () Bool)

(declare-fun e!618651 () Bool)

(declare-fun tp_is_empty!26293 () Bool)

(assert (=> b!1082080 (= e!618651 tp_is_empty!26293)))

(declare-fun b!1082081 () Bool)

(declare-fun e!618656 () Bool)

(declare-fun e!618654 () Bool)

(assert (=> b!1082081 (= e!618656 e!618654)))

(declare-fun res!720850 () Bool)

(assert (=> b!1082081 (=> (not res!720850) (not e!618654))))

(declare-datatypes ((array!69571 0))(
  ( (array!69572 (arr!33453 (Array (_ BitVec 32) (_ BitVec 64))) (size!33990 (_ BitVec 32))) )
))
(declare-fun lt!479612 () array!69571)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69571 (_ BitVec 32)) Bool)

(assert (=> b!1082081 (= res!720850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479612 mask!1414))))

(declare-fun _keys!1070 () array!69571)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082081 (= lt!479612 (array!69572 (store (arr!33453 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33990 _keys!1070)))))

(declare-fun b!1082082 () Bool)

(assert (=> b!1082082 (= e!618654 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40185 0))(
  ( (V!40186 (val!13203 Int)) )
))
(declare-datatypes ((tuple2!16718 0))(
  ( (tuple2!16719 (_1!8370 (_ BitVec 64)) (_2!8370 V!40185)) )
))
(declare-datatypes ((List!23310 0))(
  ( (Nil!23307) (Cons!23306 (h!24524 tuple2!16718) (t!32661 List!23310)) )
))
(declare-datatypes ((ListLongMap!14695 0))(
  ( (ListLongMap!14696 (toList!7363 List!23310)) )
))
(declare-fun lt!479611 () ListLongMap!14695)

(declare-fun minValue!831 () V!40185)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40185)

(declare-datatypes ((ValueCell!12437 0))(
  ( (ValueCellFull!12437 (v!15820 V!40185)) (EmptyCell!12437) )
))
(declare-datatypes ((array!69573 0))(
  ( (array!69574 (arr!33454 (Array (_ BitVec 32) ValueCell!12437)) (size!33991 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69573)

(declare-fun getCurrentListMapNoExtraKeys!3940 (array!69571 array!69573 (_ BitVec 32) (_ BitVec 32) V!40185 V!40185 (_ BitVec 32) Int) ListLongMap!14695)

(assert (=> b!1082082 (= lt!479611 (getCurrentListMapNoExtraKeys!3940 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082082 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35517 0))(
  ( (Unit!35518) )
))
(declare-fun lt!479613 () Unit!35517)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69571 (_ BitVec 64) (_ BitVec 32)) Unit!35517)

(assert (=> b!1082082 (= lt!479613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082083 () Bool)

(declare-fun res!720848 () Bool)

(assert (=> b!1082083 (=> (not res!720848) (not e!618656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082083 (= res!720848 (validKeyInArray!0 k0!904))))

(declare-fun b!1082084 () Bool)

(declare-fun res!720852 () Bool)

(assert (=> b!1082084 (=> (not res!720852) (not e!618656))))

(assert (=> b!1082084 (= res!720852 (= (select (arr!33453 _keys!1070) i!650) k0!904))))

(declare-fun res!720847 () Bool)

(assert (=> start!95874 (=> (not res!720847) (not e!618656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95874 (= res!720847 (validMask!0 mask!1414))))

(assert (=> start!95874 e!618656))

(assert (=> start!95874 tp!78722))

(assert (=> start!95874 true))

(assert (=> start!95874 tp_is_empty!26293))

(declare-fun array_inv!25868 (array!69571) Bool)

(assert (=> start!95874 (array_inv!25868 _keys!1070)))

(declare-fun e!618652 () Bool)

(declare-fun array_inv!25869 (array!69573) Bool)

(assert (=> start!95874 (and (array_inv!25869 _values!874) e!618652)))

(declare-fun b!1082085 () Bool)

(declare-fun res!720853 () Bool)

(assert (=> b!1082085 (=> (not res!720853) (not e!618656))))

(assert (=> b!1082085 (= res!720853 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33990 _keys!1070))))))

(declare-fun b!1082086 () Bool)

(declare-fun res!720851 () Bool)

(assert (=> b!1082086 (=> (not res!720851) (not e!618656))))

(assert (=> b!1082086 (= res!720851 (and (= (size!33991 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33990 _keys!1070) (size!33991 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082087 () Bool)

(declare-fun res!720854 () Bool)

(assert (=> b!1082087 (=> (not res!720854) (not e!618656))))

(assert (=> b!1082087 (= res!720854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082088 () Bool)

(declare-fun e!618653 () Bool)

(assert (=> b!1082088 (= e!618653 tp_is_empty!26293)))

(declare-fun mapNonEmpty!41194 () Bool)

(declare-fun tp!78721 () Bool)

(assert (=> mapNonEmpty!41194 (= mapRes!41194 (and tp!78721 e!618651))))

(declare-fun mapKey!41194 () (_ BitVec 32))

(declare-fun mapRest!41194 () (Array (_ BitVec 32) ValueCell!12437))

(declare-fun mapValue!41194 () ValueCell!12437)

(assert (=> mapNonEmpty!41194 (= (arr!33454 _values!874) (store mapRest!41194 mapKey!41194 mapValue!41194))))

(declare-fun b!1082089 () Bool)

(declare-fun res!720849 () Bool)

(assert (=> b!1082089 (=> (not res!720849) (not e!618656))))

(declare-datatypes ((List!23311 0))(
  ( (Nil!23308) (Cons!23307 (h!24525 (_ BitVec 64)) (t!32662 List!23311)) )
))
(declare-fun arrayNoDuplicates!0 (array!69571 (_ BitVec 32) List!23311) Bool)

(assert (=> b!1082089 (= res!720849 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23308))))

(declare-fun b!1082090 () Bool)

(declare-fun res!720855 () Bool)

(assert (=> b!1082090 (=> (not res!720855) (not e!618654))))

(assert (=> b!1082090 (= res!720855 (arrayNoDuplicates!0 lt!479612 #b00000000000000000000000000000000 Nil!23308))))

(declare-fun b!1082091 () Bool)

(assert (=> b!1082091 (= e!618652 (and e!618653 mapRes!41194))))

(declare-fun condMapEmpty!41194 () Bool)

(declare-fun mapDefault!41194 () ValueCell!12437)

(assert (=> b!1082091 (= condMapEmpty!41194 (= (arr!33454 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12437)) mapDefault!41194)))))

(assert (= (and start!95874 res!720847) b!1082086))

(assert (= (and b!1082086 res!720851) b!1082087))

(assert (= (and b!1082087 res!720854) b!1082089))

(assert (= (and b!1082089 res!720849) b!1082085))

(assert (= (and b!1082085 res!720853) b!1082083))

(assert (= (and b!1082083 res!720848) b!1082084))

(assert (= (and b!1082084 res!720852) b!1082081))

(assert (= (and b!1082081 res!720850) b!1082090))

(assert (= (and b!1082090 res!720855) b!1082082))

(assert (= (and b!1082091 condMapEmpty!41194) mapIsEmpty!41194))

(assert (= (and b!1082091 (not condMapEmpty!41194)) mapNonEmpty!41194))

(get-info :version)

(assert (= (and mapNonEmpty!41194 ((_ is ValueCellFull!12437) mapValue!41194)) b!1082080))

(assert (= (and b!1082091 ((_ is ValueCellFull!12437) mapDefault!41194)) b!1082088))

(assert (= start!95874 b!1082091))

(declare-fun m!1000313 () Bool)

(assert (=> b!1082081 m!1000313))

(declare-fun m!1000315 () Bool)

(assert (=> b!1082081 m!1000315))

(declare-fun m!1000317 () Bool)

(assert (=> b!1082089 m!1000317))

(declare-fun m!1000319 () Bool)

(assert (=> b!1082087 m!1000319))

(declare-fun m!1000321 () Bool)

(assert (=> b!1082083 m!1000321))

(declare-fun m!1000323 () Bool)

(assert (=> mapNonEmpty!41194 m!1000323))

(declare-fun m!1000325 () Bool)

(assert (=> b!1082082 m!1000325))

(declare-fun m!1000327 () Bool)

(assert (=> b!1082082 m!1000327))

(declare-fun m!1000329 () Bool)

(assert (=> b!1082082 m!1000329))

(declare-fun m!1000331 () Bool)

(assert (=> b!1082084 m!1000331))

(declare-fun m!1000333 () Bool)

(assert (=> b!1082090 m!1000333))

(declare-fun m!1000335 () Bool)

(assert (=> start!95874 m!1000335))

(declare-fun m!1000337 () Bool)

(assert (=> start!95874 m!1000337))

(declare-fun m!1000339 () Bool)

(assert (=> start!95874 m!1000339))

(check-sat (not b!1082087) b_and!35279 (not mapNonEmpty!41194) tp_is_empty!26293 (not b_next!22291) (not b!1082089) (not b!1082090) (not start!95874) (not b!1082082) (not b!1082081) (not b!1082083))
(check-sat b_and!35279 (not b_next!22291))
