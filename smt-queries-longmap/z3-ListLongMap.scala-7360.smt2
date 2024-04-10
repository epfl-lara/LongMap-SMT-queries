; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93866 () Bool)

(assert start!93866)

(declare-fun b_free!21339 () Bool)

(declare-fun b_next!21339 () Bool)

(assert (=> start!93866 (= b_free!21339 (not b_next!21339))))

(declare-fun tp!75440 () Bool)

(declare-fun b_and!34053 () Bool)

(assert (=> start!93866 (= tp!75440 b_and!34053)))

(declare-fun b!1061621 () Bool)

(declare-fun e!604577 () Bool)

(assert (=> b!1061621 (= e!604577 (not true))))

(declare-datatypes ((V!38667 0))(
  ( (V!38668 (val!12625 Int)) )
))
(declare-datatypes ((tuple2!15960 0))(
  ( (tuple2!15961 (_1!7991 (_ BitVec 64)) (_2!7991 V!38667)) )
))
(declare-datatypes ((List!22545 0))(
  ( (Nil!22542) (Cons!22541 (h!23750 tuple2!15960) (t!31854 List!22545)) )
))
(declare-datatypes ((ListLongMap!13929 0))(
  ( (ListLongMap!13930 (toList!6980 List!22545)) )
))
(declare-fun lt!467675 () ListLongMap!13929)

(declare-fun lt!467677 () ListLongMap!13929)

(assert (=> b!1061621 (= lt!467675 lt!467677)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38667)

(declare-datatypes ((Unit!34762 0))(
  ( (Unit!34763) )
))
(declare-fun lt!467676 () Unit!34762)

(declare-datatypes ((ValueCell!11871 0))(
  ( (ValueCellFull!11871 (v!15235 V!38667)) (EmptyCell!11871) )
))
(declare-datatypes ((array!67301 0))(
  ( (array!67302 (arr!32358 (Array (_ BitVec 32) ValueCell!11871)) (size!32894 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67301)

(declare-fun minValue!907 () V!38667)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38667)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67303 0))(
  ( (array!67304 (arr!32359 (Array (_ BitVec 32) (_ BitVec 64))) (size!32895 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67303)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!619 (array!67303 array!67301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38667 V!38667 V!38667 V!38667 (_ BitVec 32) Int) Unit!34762)

(assert (=> b!1061621 (= lt!467676 (lemmaNoChangeToArrayThenSameMapNoExtras!619 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3582 (array!67303 array!67301 (_ BitVec 32) (_ BitVec 32) V!38667 V!38667 (_ BitVec 32) Int) ListLongMap!13929)

(assert (=> b!1061621 (= lt!467677 (getCurrentListMapNoExtraKeys!3582 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061621 (= lt!467675 (getCurrentListMapNoExtraKeys!3582 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39394 () Bool)

(declare-fun mapRes!39394 () Bool)

(declare-fun tp!75439 () Bool)

(declare-fun e!604574 () Bool)

(assert (=> mapNonEmpty!39394 (= mapRes!39394 (and tp!75439 e!604574))))

(declare-fun mapKey!39394 () (_ BitVec 32))

(declare-fun mapRest!39394 () (Array (_ BitVec 32) ValueCell!11871))

(declare-fun mapValue!39394 () ValueCell!11871)

(assert (=> mapNonEmpty!39394 (= (arr!32358 _values!955) (store mapRest!39394 mapKey!39394 mapValue!39394))))

(declare-fun b!1061622 () Bool)

(declare-fun res!708928 () Bool)

(assert (=> b!1061622 (=> (not res!708928) (not e!604577))))

(declare-datatypes ((List!22546 0))(
  ( (Nil!22543) (Cons!22542 (h!23751 (_ BitVec 64)) (t!31855 List!22546)) )
))
(declare-fun arrayNoDuplicates!0 (array!67303 (_ BitVec 32) List!22546) Bool)

(assert (=> b!1061622 (= res!708928 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22543))))

(declare-fun b!1061623 () Bool)

(declare-fun tp_is_empty!25149 () Bool)

(assert (=> b!1061623 (= e!604574 tp_is_empty!25149)))

(declare-fun res!708927 () Bool)

(assert (=> start!93866 (=> (not res!708927) (not e!604577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93866 (= res!708927 (validMask!0 mask!1515))))

(assert (=> start!93866 e!604577))

(assert (=> start!93866 true))

(assert (=> start!93866 tp_is_empty!25149))

(declare-fun e!604578 () Bool)

(declare-fun array_inv!25072 (array!67301) Bool)

(assert (=> start!93866 (and (array_inv!25072 _values!955) e!604578)))

(assert (=> start!93866 tp!75440))

(declare-fun array_inv!25073 (array!67303) Bool)

(assert (=> start!93866 (array_inv!25073 _keys!1163)))

(declare-fun b!1061624 () Bool)

(declare-fun res!708925 () Bool)

(assert (=> b!1061624 (=> (not res!708925) (not e!604577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67303 (_ BitVec 32)) Bool)

(assert (=> b!1061624 (= res!708925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061625 () Bool)

(declare-fun e!604576 () Bool)

(assert (=> b!1061625 (= e!604576 tp_is_empty!25149)))

(declare-fun mapIsEmpty!39394 () Bool)

(assert (=> mapIsEmpty!39394 mapRes!39394))

(declare-fun b!1061626 () Bool)

(assert (=> b!1061626 (= e!604578 (and e!604576 mapRes!39394))))

(declare-fun condMapEmpty!39394 () Bool)

(declare-fun mapDefault!39394 () ValueCell!11871)

(assert (=> b!1061626 (= condMapEmpty!39394 (= (arr!32358 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11871)) mapDefault!39394)))))

(declare-fun b!1061627 () Bool)

(declare-fun res!708926 () Bool)

(assert (=> b!1061627 (=> (not res!708926) (not e!604577))))

(assert (=> b!1061627 (= res!708926 (and (= (size!32894 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32895 _keys!1163) (size!32894 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93866 res!708927) b!1061627))

(assert (= (and b!1061627 res!708926) b!1061624))

(assert (= (and b!1061624 res!708925) b!1061622))

(assert (= (and b!1061622 res!708928) b!1061621))

(assert (= (and b!1061626 condMapEmpty!39394) mapIsEmpty!39394))

(assert (= (and b!1061626 (not condMapEmpty!39394)) mapNonEmpty!39394))

(get-info :version)

(assert (= (and mapNonEmpty!39394 ((_ is ValueCellFull!11871) mapValue!39394)) b!1061623))

(assert (= (and b!1061626 ((_ is ValueCellFull!11871) mapDefault!39394)) b!1061625))

(assert (= start!93866 b!1061626))

(declare-fun m!980445 () Bool)

(assert (=> b!1061622 m!980445))

(declare-fun m!980447 () Bool)

(assert (=> mapNonEmpty!39394 m!980447))

(declare-fun m!980449 () Bool)

(assert (=> b!1061621 m!980449))

(declare-fun m!980451 () Bool)

(assert (=> b!1061621 m!980451))

(declare-fun m!980453 () Bool)

(assert (=> b!1061621 m!980453))

(declare-fun m!980455 () Bool)

(assert (=> start!93866 m!980455))

(declare-fun m!980457 () Bool)

(assert (=> start!93866 m!980457))

(declare-fun m!980459 () Bool)

(assert (=> start!93866 m!980459))

(declare-fun m!980461 () Bool)

(assert (=> b!1061624 m!980461))

(check-sat b_and!34053 tp_is_empty!25149 (not b_next!21339) (not start!93866) (not b!1061621) (not mapNonEmpty!39394) (not b!1061624) (not b!1061622))
(check-sat b_and!34053 (not b_next!21339))
