; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95592 () Bool)

(assert start!95592)

(declare-fun mapIsEmpty!41125 () Bool)

(declare-fun mapRes!41125 () Bool)

(assert (=> mapIsEmpty!41125 mapRes!41125))

(declare-fun b!1079925 () Bool)

(declare-fun e!617386 () Bool)

(declare-fun tp_is_empty!26247 () Bool)

(assert (=> b!1079925 (= e!617386 tp_is_empty!26247)))

(declare-fun b!1079926 () Bool)

(declare-fun e!617384 () Bool)

(declare-fun e!617382 () Bool)

(assert (=> b!1079926 (= e!617384 e!617382)))

(declare-fun res!719708 () Bool)

(assert (=> b!1079926 (=> (not res!719708) (not e!617382))))

(declare-datatypes ((array!69447 0))(
  ( (array!69448 (arr!33397 (Array (_ BitVec 32) (_ BitVec 64))) (size!33933 (_ BitVec 32))) )
))
(declare-fun lt!478893 () array!69447)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69447 (_ BitVec 32)) Bool)

(assert (=> b!1079926 (= res!719708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478893 mask!1414))))

(declare-fun _keys!1070 () array!69447)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079926 (= lt!478893 (array!69448 (store (arr!33397 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33933 _keys!1070)))))

(declare-fun b!1079927 () Bool)

(declare-fun res!719704 () Bool)

(assert (=> b!1079927 (=> (not res!719704) (not e!617384))))

(declare-datatypes ((List!23272 0))(
  ( (Nil!23269) (Cons!23268 (h!24477 (_ BitVec 64)) (t!32631 List!23272)) )
))
(declare-fun arrayNoDuplicates!0 (array!69447 (_ BitVec 32) List!23272) Bool)

(assert (=> b!1079927 (= res!719704 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23269))))

(declare-fun b!1079928 () Bool)

(declare-fun res!719706 () Bool)

(assert (=> b!1079928 (=> (not res!719706) (not e!617384))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079928 (= res!719706 (= (select (arr!33397 _keys!1070) i!650) k0!904))))

(declare-fun b!1079929 () Bool)

(declare-fun res!719707 () Bool)

(assert (=> b!1079929 (=> (not res!719707) (not e!617382))))

(assert (=> b!1079929 (= res!719707 (arrayNoDuplicates!0 lt!478893 #b00000000000000000000000000000000 Nil!23269))))

(declare-fun b!1079930 () Bool)

(declare-fun res!719711 () Bool)

(assert (=> b!1079930 (=> (not res!719711) (not e!617384))))

(assert (=> b!1079930 (= res!719711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079931 () Bool)

(declare-fun e!617383 () Bool)

(assert (=> b!1079931 (= e!617383 tp_is_empty!26247)))

(declare-fun mapNonEmpty!41125 () Bool)

(declare-fun tp!78587 () Bool)

(assert (=> mapNonEmpty!41125 (= mapRes!41125 (and tp!78587 e!617386))))

(declare-datatypes ((V!40123 0))(
  ( (V!40124 (val!13180 Int)) )
))
(declare-datatypes ((ValueCell!12414 0))(
  ( (ValueCellFull!12414 (v!15801 V!40123)) (EmptyCell!12414) )
))
(declare-datatypes ((array!69449 0))(
  ( (array!69450 (arr!33398 (Array (_ BitVec 32) ValueCell!12414)) (size!33934 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69449)

(declare-fun mapKey!41125 () (_ BitVec 32))

(declare-fun mapValue!41125 () ValueCell!12414)

(declare-fun mapRest!41125 () (Array (_ BitVec 32) ValueCell!12414))

(assert (=> mapNonEmpty!41125 (= (arr!33398 _values!874) (store mapRest!41125 mapKey!41125 mapValue!41125))))

(declare-fun b!1079933 () Bool)

(declare-fun res!719712 () Bool)

(assert (=> b!1079933 (=> (not res!719712) (not e!617384))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079933 (= res!719712 (and (= (size!33934 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33933 _keys!1070) (size!33934 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079934 () Bool)

(declare-fun res!719705 () Bool)

(assert (=> b!1079934 (=> (not res!719705) (not e!617384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079934 (= res!719705 (validKeyInArray!0 k0!904))))

(declare-fun b!1079935 () Bool)

(assert (=> b!1079935 (= e!617382 (not (bvsle #b00000000000000000000000000000000 (size!33933 _keys!1070))))))

(declare-fun arrayContainsKey!0 (array!69447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079935 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35510 0))(
  ( (Unit!35511) )
))
(declare-fun lt!478894 () Unit!35510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69447 (_ BitVec 64) (_ BitVec 32)) Unit!35510)

(assert (=> b!1079935 (= lt!478894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079936 () Bool)

(declare-fun e!617387 () Bool)

(assert (=> b!1079936 (= e!617387 (and e!617383 mapRes!41125))))

(declare-fun condMapEmpty!41125 () Bool)

(declare-fun mapDefault!41125 () ValueCell!12414)

(assert (=> b!1079936 (= condMapEmpty!41125 (= (arr!33398 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12414)) mapDefault!41125)))))

(declare-fun b!1079932 () Bool)

(declare-fun res!719710 () Bool)

(assert (=> b!1079932 (=> (not res!719710) (not e!617384))))

(assert (=> b!1079932 (= res!719710 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33933 _keys!1070))))))

(declare-fun res!719709 () Bool)

(assert (=> start!95592 (=> (not res!719709) (not e!617384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95592 (= res!719709 (validMask!0 mask!1414))))

(assert (=> start!95592 e!617384))

(assert (=> start!95592 true))

(declare-fun array_inv!25786 (array!69447) Bool)

(assert (=> start!95592 (array_inv!25786 _keys!1070)))

(declare-fun array_inv!25787 (array!69449) Bool)

(assert (=> start!95592 (and (array_inv!25787 _values!874) e!617387)))

(assert (= (and start!95592 res!719709) b!1079933))

(assert (= (and b!1079933 res!719712) b!1079930))

(assert (= (and b!1079930 res!719711) b!1079927))

(assert (= (and b!1079927 res!719704) b!1079932))

(assert (= (and b!1079932 res!719710) b!1079934))

(assert (= (and b!1079934 res!719705) b!1079928))

(assert (= (and b!1079928 res!719706) b!1079926))

(assert (= (and b!1079926 res!719708) b!1079929))

(assert (= (and b!1079929 res!719707) b!1079935))

(assert (= (and b!1079936 condMapEmpty!41125) mapIsEmpty!41125))

(assert (= (and b!1079936 (not condMapEmpty!41125)) mapNonEmpty!41125))

(get-info :version)

(assert (= (and mapNonEmpty!41125 ((_ is ValueCellFull!12414) mapValue!41125)) b!1079925))

(assert (= (and b!1079936 ((_ is ValueCellFull!12414) mapDefault!41125)) b!1079931))

(assert (= start!95592 b!1079936))

(declare-fun m!998001 () Bool)

(assert (=> b!1079934 m!998001))

(declare-fun m!998003 () Bool)

(assert (=> b!1079928 m!998003))

(declare-fun m!998005 () Bool)

(assert (=> b!1079926 m!998005))

(declare-fun m!998007 () Bool)

(assert (=> b!1079926 m!998007))

(declare-fun m!998009 () Bool)

(assert (=> start!95592 m!998009))

(declare-fun m!998011 () Bool)

(assert (=> start!95592 m!998011))

(declare-fun m!998013 () Bool)

(assert (=> start!95592 m!998013))

(declare-fun m!998015 () Bool)

(assert (=> b!1079927 m!998015))

(declare-fun m!998017 () Bool)

(assert (=> b!1079930 m!998017))

(declare-fun m!998019 () Bool)

(assert (=> mapNonEmpty!41125 m!998019))

(declare-fun m!998021 () Bool)

(assert (=> b!1079929 m!998021))

(declare-fun m!998023 () Bool)

(assert (=> b!1079935 m!998023))

(declare-fun m!998025 () Bool)

(assert (=> b!1079935 m!998025))

(check-sat (not mapNonEmpty!41125) tp_is_empty!26247 (not b!1079934) (not b!1079926) (not b!1079935) (not b!1079929) (not start!95592) (not b!1079930) (not b!1079927))
(check-sat)
