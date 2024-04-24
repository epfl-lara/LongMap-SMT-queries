; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94010 () Bool)

(assert start!94010)

(declare-fun b_free!21247 () Bool)

(declare-fun b_next!21247 () Bool)

(assert (=> start!94010 (= b_free!21247 (not b_next!21247))))

(declare-fun tp!75164 () Bool)

(declare-fun b_and!33971 () Bool)

(assert (=> start!94010 (= tp!75164 b_and!33971)))

(declare-fun b!1061982 () Bool)

(declare-fun res!708896 () Bool)

(declare-fun e!604739 () Bool)

(assert (=> b!1061982 (=> (not res!708896) (not e!604739))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38545 0))(
  ( (V!38546 (val!12579 Int)) )
))
(declare-datatypes ((ValueCell!11825 0))(
  ( (ValueCellFull!11825 (v!15185 V!38545)) (EmptyCell!11825) )
))
(declare-datatypes ((array!67179 0))(
  ( (array!67180 (arr!32291 (Array (_ BitVec 32) ValueCell!11825)) (size!32828 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67179)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67181 0))(
  ( (array!67182 (arr!32292 (Array (_ BitVec 32) (_ BitVec 64))) (size!32829 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67181)

(assert (=> b!1061982 (= res!708896 (and (= (size!32828 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32829 _keys!1163) (size!32828 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061983 () Bool)

(declare-fun e!604743 () Bool)

(declare-fun tp_is_empty!25057 () Bool)

(assert (=> b!1061983 (= e!604743 tp_is_empty!25057)))

(declare-fun b!1061984 () Bool)

(declare-fun res!708897 () Bool)

(assert (=> b!1061984 (=> (not res!708897) (not e!604739))))

(declare-datatypes ((List!22473 0))(
  ( (Nil!22470) (Cons!22469 (h!23687 (_ BitVec 64)) (t!31774 List!22473)) )
))
(declare-fun arrayNoDuplicates!0 (array!67181 (_ BitVec 32) List!22473) Bool)

(assert (=> b!1061984 (= res!708897 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22470))))

(declare-fun b!1061985 () Bool)

(assert (=> b!1061985 (= e!604739 false)))

(declare-datatypes ((tuple2!15888 0))(
  ( (tuple2!15889 (_1!7955 (_ BitVec 64)) (_2!7955 V!38545)) )
))
(declare-datatypes ((List!22474 0))(
  ( (Nil!22471) (Cons!22470 (h!23688 tuple2!15888) (t!31775 List!22474)) )
))
(declare-datatypes ((ListLongMap!13865 0))(
  ( (ListLongMap!13866 (toList!6948 List!22474)) )
))
(declare-fun lt!467856 () ListLongMap!13865)

(declare-fun minValue!907 () V!38545)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38545)

(declare-fun getCurrentListMapNoExtraKeys!3596 (array!67181 array!67179 (_ BitVec 32) (_ BitVec 32) V!38545 V!38545 (_ BitVec 32) Int) ListLongMap!13865)

(assert (=> b!1061985 (= lt!467856 (getCurrentListMapNoExtraKeys!3596 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38545)

(declare-fun lt!467855 () ListLongMap!13865)

(assert (=> b!1061985 (= lt!467855 (getCurrentListMapNoExtraKeys!3596 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061986 () Bool)

(declare-fun e!604741 () Bool)

(declare-fun e!604740 () Bool)

(declare-fun mapRes!39256 () Bool)

(assert (=> b!1061986 (= e!604741 (and e!604740 mapRes!39256))))

(declare-fun condMapEmpty!39256 () Bool)

(declare-fun mapDefault!39256 () ValueCell!11825)

(assert (=> b!1061986 (= condMapEmpty!39256 (= (arr!32291 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11825)) mapDefault!39256)))))

(declare-fun b!1061988 () Bool)

(declare-fun res!708895 () Bool)

(assert (=> b!1061988 (=> (not res!708895) (not e!604739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67181 (_ BitVec 32)) Bool)

(assert (=> b!1061988 (= res!708895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39256 () Bool)

(assert (=> mapIsEmpty!39256 mapRes!39256))

(declare-fun mapNonEmpty!39256 () Bool)

(declare-fun tp!75163 () Bool)

(assert (=> mapNonEmpty!39256 (= mapRes!39256 (and tp!75163 e!604743))))

(declare-fun mapValue!39256 () ValueCell!11825)

(declare-fun mapRest!39256 () (Array (_ BitVec 32) ValueCell!11825))

(declare-fun mapKey!39256 () (_ BitVec 32))

(assert (=> mapNonEmpty!39256 (= (arr!32291 _values!955) (store mapRest!39256 mapKey!39256 mapValue!39256))))

(declare-fun b!1061987 () Bool)

(assert (=> b!1061987 (= e!604740 tp_is_empty!25057)))

(declare-fun res!708898 () Bool)

(assert (=> start!94010 (=> (not res!708898) (not e!604739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94010 (= res!708898 (validMask!0 mask!1515))))

(assert (=> start!94010 e!604739))

(assert (=> start!94010 true))

(assert (=> start!94010 tp_is_empty!25057))

(declare-fun array_inv!25036 (array!67179) Bool)

(assert (=> start!94010 (and (array_inv!25036 _values!955) e!604741)))

(assert (=> start!94010 tp!75164))

(declare-fun array_inv!25037 (array!67181) Bool)

(assert (=> start!94010 (array_inv!25037 _keys!1163)))

(assert (= (and start!94010 res!708898) b!1061982))

(assert (= (and b!1061982 res!708896) b!1061988))

(assert (= (and b!1061988 res!708895) b!1061984))

(assert (= (and b!1061984 res!708897) b!1061985))

(assert (= (and b!1061986 condMapEmpty!39256) mapIsEmpty!39256))

(assert (= (and b!1061986 (not condMapEmpty!39256)) mapNonEmpty!39256))

(get-info :version)

(assert (= (and mapNonEmpty!39256 ((_ is ValueCellFull!11825) mapValue!39256)) b!1061983))

(assert (= (and b!1061986 ((_ is ValueCellFull!11825) mapDefault!39256)) b!1061987))

(assert (= start!94010 b!1061986))

(declare-fun m!981343 () Bool)

(assert (=> mapNonEmpty!39256 m!981343))

(declare-fun m!981345 () Bool)

(assert (=> b!1061985 m!981345))

(declare-fun m!981347 () Bool)

(assert (=> b!1061985 m!981347))

(declare-fun m!981349 () Bool)

(assert (=> b!1061988 m!981349))

(declare-fun m!981351 () Bool)

(assert (=> b!1061984 m!981351))

(declare-fun m!981353 () Bool)

(assert (=> start!94010 m!981353))

(declare-fun m!981355 () Bool)

(assert (=> start!94010 m!981355))

(declare-fun m!981357 () Bool)

(assert (=> start!94010 m!981357))

(check-sat (not b_next!21247) (not start!94010) (not b!1061984) b_and!33971 tp_is_empty!25057 (not mapNonEmpty!39256) (not b!1061985) (not b!1061988))
(check-sat b_and!33971 (not b_next!21247))
