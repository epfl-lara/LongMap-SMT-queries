; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95632 () Bool)

(assert start!95632)

(declare-fun b_free!22291 () Bool)

(declare-fun b_next!22291 () Bool)

(assert (=> start!95632 (= b_free!22291 (not b_next!22291))))

(declare-fun tp!78722 () Bool)

(declare-fun b_and!35243 () Bool)

(assert (=> start!95632 (= tp!78722 b_and!35243)))

(declare-fun b!1080600 () Bool)

(declare-fun res!720257 () Bool)

(declare-fun e!617705 () Bool)

(assert (=> b!1080600 (=> (not res!720257) (not e!617705))))

(declare-datatypes ((array!69466 0))(
  ( (array!69467 (arr!33407 (Array (_ BitVec 32) (_ BitVec 64))) (size!33945 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69466)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69466 (_ BitVec 32)) Bool)

(assert (=> b!1080600 (= res!720257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080601 () Bool)

(declare-fun res!720260 () Bool)

(assert (=> b!1080601 (=> (not res!720260) (not e!617705))))

(declare-datatypes ((List!23354 0))(
  ( (Nil!23351) (Cons!23350 (h!24559 (_ BitVec 64)) (t!32704 List!23354)) )
))
(declare-fun arrayNoDuplicates!0 (array!69466 (_ BitVec 32) List!23354) Bool)

(assert (=> b!1080601 (= res!720260 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23351))))

(declare-fun b!1080602 () Bool)

(declare-fun e!617703 () Bool)

(assert (=> b!1080602 (= e!617703 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40185 0))(
  ( (V!40186 (val!13203 Int)) )
))
(declare-fun minValue!831 () V!40185)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16792 0))(
  ( (tuple2!16793 (_1!8407 (_ BitVec 64)) (_2!8407 V!40185)) )
))
(declare-datatypes ((List!23355 0))(
  ( (Nil!23352) (Cons!23351 (h!24560 tuple2!16792) (t!32705 List!23355)) )
))
(declare-datatypes ((ListLongMap!14761 0))(
  ( (ListLongMap!14762 (toList!7396 List!23355)) )
))
(declare-fun lt!478898 () ListLongMap!14761)

(declare-fun zeroValue!831 () V!40185)

(declare-datatypes ((ValueCell!12437 0))(
  ( (ValueCellFull!12437 (v!15823 V!40185)) (EmptyCell!12437) )
))
(declare-datatypes ((array!69468 0))(
  ( (array!69469 (arr!33408 (Array (_ BitVec 32) ValueCell!12437)) (size!33946 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69468)

(declare-fun getCurrentListMapNoExtraKeys!3959 (array!69466 array!69468 (_ BitVec 32) (_ BitVec 32) V!40185 V!40185 (_ BitVec 32) Int) ListLongMap!14761)

(assert (=> b!1080602 (= lt!478898 (getCurrentListMapNoExtraKeys!3959 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080602 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35385 0))(
  ( (Unit!35386) )
))
(declare-fun lt!478897 () Unit!35385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69466 (_ BitVec 64) (_ BitVec 32)) Unit!35385)

(assert (=> b!1080602 (= lt!478897 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080603 () Bool)

(declare-fun res!720261 () Bool)

(assert (=> b!1080603 (=> (not res!720261) (not e!617703))))

(declare-fun lt!478896 () array!69466)

(assert (=> b!1080603 (= res!720261 (arrayNoDuplicates!0 lt!478896 #b00000000000000000000000000000000 Nil!23351))))

(declare-fun b!1080604 () Bool)

(declare-fun res!720263 () Bool)

(assert (=> b!1080604 (=> (not res!720263) (not e!617705))))

(assert (=> b!1080604 (= res!720263 (and (= (size!33946 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33945 _keys!1070) (size!33946 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!720264 () Bool)

(assert (=> start!95632 (=> (not res!720264) (not e!617705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95632 (= res!720264 (validMask!0 mask!1414))))

(assert (=> start!95632 e!617705))

(assert (=> start!95632 tp!78722))

(assert (=> start!95632 true))

(declare-fun tp_is_empty!26293 () Bool)

(assert (=> start!95632 tp_is_empty!26293))

(declare-fun array_inv!25826 (array!69466) Bool)

(assert (=> start!95632 (array_inv!25826 _keys!1070)))

(declare-fun e!617708 () Bool)

(declare-fun array_inv!25827 (array!69468) Bool)

(assert (=> start!95632 (and (array_inv!25827 _values!874) e!617708)))

(declare-fun b!1080605 () Bool)

(declare-fun res!720256 () Bool)

(assert (=> b!1080605 (=> (not res!720256) (not e!617705))))

(assert (=> b!1080605 (= res!720256 (= (select (arr!33407 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41194 () Bool)

(declare-fun mapRes!41194 () Bool)

(declare-fun tp!78721 () Bool)

(declare-fun e!617704 () Bool)

(assert (=> mapNonEmpty!41194 (= mapRes!41194 (and tp!78721 e!617704))))

(declare-fun mapValue!41194 () ValueCell!12437)

(declare-fun mapKey!41194 () (_ BitVec 32))

(declare-fun mapRest!41194 () (Array (_ BitVec 32) ValueCell!12437))

(assert (=> mapNonEmpty!41194 (= (arr!33408 _values!874) (store mapRest!41194 mapKey!41194 mapValue!41194))))

(declare-fun mapIsEmpty!41194 () Bool)

(assert (=> mapIsEmpty!41194 mapRes!41194))

(declare-fun b!1080606 () Bool)

(declare-fun res!720262 () Bool)

(assert (=> b!1080606 (=> (not res!720262) (not e!617705))))

(assert (=> b!1080606 (= res!720262 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33945 _keys!1070))))))

(declare-fun b!1080607 () Bool)

(declare-fun e!617706 () Bool)

(assert (=> b!1080607 (= e!617706 tp_is_empty!26293)))

(declare-fun b!1080608 () Bool)

(assert (=> b!1080608 (= e!617705 e!617703)))

(declare-fun res!720258 () Bool)

(assert (=> b!1080608 (=> (not res!720258) (not e!617703))))

(assert (=> b!1080608 (= res!720258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478896 mask!1414))))

(assert (=> b!1080608 (= lt!478896 (array!69467 (store (arr!33407 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33945 _keys!1070)))))

(declare-fun b!1080609 () Bool)

(declare-fun res!720259 () Bool)

(assert (=> b!1080609 (=> (not res!720259) (not e!617705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080609 (= res!720259 (validKeyInArray!0 k0!904))))

(declare-fun b!1080610 () Bool)

(assert (=> b!1080610 (= e!617708 (and e!617706 mapRes!41194))))

(declare-fun condMapEmpty!41194 () Bool)

(declare-fun mapDefault!41194 () ValueCell!12437)

(assert (=> b!1080610 (= condMapEmpty!41194 (= (arr!33408 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12437)) mapDefault!41194)))))

(declare-fun b!1080611 () Bool)

(assert (=> b!1080611 (= e!617704 tp_is_empty!26293)))

(assert (= (and start!95632 res!720264) b!1080604))

(assert (= (and b!1080604 res!720263) b!1080600))

(assert (= (and b!1080600 res!720257) b!1080601))

(assert (= (and b!1080601 res!720260) b!1080606))

(assert (= (and b!1080606 res!720262) b!1080609))

(assert (= (and b!1080609 res!720259) b!1080605))

(assert (= (and b!1080605 res!720256) b!1080608))

(assert (= (and b!1080608 res!720258) b!1080603))

(assert (= (and b!1080603 res!720261) b!1080602))

(assert (= (and b!1080610 condMapEmpty!41194) mapIsEmpty!41194))

(assert (= (and b!1080610 (not condMapEmpty!41194)) mapNonEmpty!41194))

(get-info :version)

(assert (= (and mapNonEmpty!41194 ((_ is ValueCellFull!12437) mapValue!41194)) b!1080611))

(assert (= (and b!1080610 ((_ is ValueCellFull!12437) mapDefault!41194)) b!1080607))

(assert (= start!95632 b!1080610))

(declare-fun m!998015 () Bool)

(assert (=> b!1080608 m!998015))

(declare-fun m!998017 () Bool)

(assert (=> b!1080608 m!998017))

(declare-fun m!998019 () Bool)

(assert (=> start!95632 m!998019))

(declare-fun m!998021 () Bool)

(assert (=> start!95632 m!998021))

(declare-fun m!998023 () Bool)

(assert (=> start!95632 m!998023))

(declare-fun m!998025 () Bool)

(assert (=> b!1080602 m!998025))

(declare-fun m!998027 () Bool)

(assert (=> b!1080602 m!998027))

(declare-fun m!998029 () Bool)

(assert (=> b!1080602 m!998029))

(declare-fun m!998031 () Bool)

(assert (=> b!1080603 m!998031))

(declare-fun m!998033 () Bool)

(assert (=> b!1080605 m!998033))

(declare-fun m!998035 () Bool)

(assert (=> mapNonEmpty!41194 m!998035))

(declare-fun m!998037 () Bool)

(assert (=> b!1080600 m!998037))

(declare-fun m!998039 () Bool)

(assert (=> b!1080609 m!998039))

(declare-fun m!998041 () Bool)

(assert (=> b!1080601 m!998041))

(check-sat (not b!1080602) (not start!95632) (not b!1080601) (not b_next!22291) b_and!35243 tp_is_empty!26293 (not b!1080600) (not b!1080603) (not mapNonEmpty!41194) (not b!1080608) (not b!1080609))
(check-sat b_and!35243 (not b_next!22291))
