; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93828 () Bool)

(assert start!93828)

(declare-fun b_free!21307 () Bool)

(declare-fun b_next!21307 () Bool)

(assert (=> start!93828 (= b_free!21307 (not b_next!21307))))

(declare-fun tp!75344 () Bool)

(declare-fun b_and!33995 () Bool)

(assert (=> start!93828 (= tp!75344 b_and!33995)))

(declare-fun b!1061132 () Bool)

(declare-fun res!708667 () Bool)

(declare-fun e!604245 () Bool)

(assert (=> b!1061132 (=> (not res!708667) (not e!604245))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38625 0))(
  ( (V!38626 (val!12609 Int)) )
))
(declare-datatypes ((ValueCell!11855 0))(
  ( (ValueCellFull!11855 (v!15218 V!38625)) (EmptyCell!11855) )
))
(declare-datatypes ((array!67184 0))(
  ( (array!67185 (arr!32300 (Array (_ BitVec 32) ValueCell!11855)) (size!32838 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67184)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67186 0))(
  ( (array!67187 (arr!32301 (Array (_ BitVec 32) (_ BitVec 64))) (size!32839 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67186)

(assert (=> b!1061132 (= res!708667 (and (= (size!32838 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32839 _keys!1163) (size!32838 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39346 () Bool)

(declare-fun mapRes!39346 () Bool)

(assert (=> mapIsEmpty!39346 mapRes!39346))

(declare-fun b!1061133 () Bool)

(declare-fun e!604243 () Bool)

(declare-fun e!604244 () Bool)

(assert (=> b!1061133 (= e!604243 (and e!604244 mapRes!39346))))

(declare-fun condMapEmpty!39346 () Bool)

(declare-fun mapDefault!39346 () ValueCell!11855)

(assert (=> b!1061133 (= condMapEmpty!39346 (= (arr!32300 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11855)) mapDefault!39346)))))

(declare-fun b!1061134 () Bool)

(declare-fun res!708666 () Bool)

(assert (=> b!1061134 (=> (not res!708666) (not e!604245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67186 (_ BitVec 32)) Bool)

(assert (=> b!1061134 (= res!708666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061135 () Bool)

(declare-fun e!604241 () Bool)

(declare-fun tp_is_empty!25117 () Bool)

(assert (=> b!1061135 (= e!604241 tp_is_empty!25117)))

(declare-fun b!1061136 () Bool)

(assert (=> b!1061136 (= e!604244 tp_is_empty!25117)))

(declare-fun b!1061137 () Bool)

(declare-fun res!708664 () Bool)

(assert (=> b!1061137 (=> (not res!708664) (not e!604245))))

(declare-datatypes ((List!22560 0))(
  ( (Nil!22557) (Cons!22556 (h!23765 (_ BitVec 64)) (t!31860 List!22560)) )
))
(declare-fun arrayNoDuplicates!0 (array!67186 (_ BitVec 32) List!22560) Bool)

(assert (=> b!1061137 (= res!708664 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22557))))

(declare-fun b!1061138 () Bool)

(assert (=> b!1061138 (= e!604245 (not true))))

(declare-datatypes ((tuple2!16006 0))(
  ( (tuple2!16007 (_1!8014 (_ BitVec 64)) (_2!8014 V!38625)) )
))
(declare-datatypes ((List!22561 0))(
  ( (Nil!22558) (Cons!22557 (h!23766 tuple2!16006) (t!31861 List!22561)) )
))
(declare-datatypes ((ListLongMap!13975 0))(
  ( (ListLongMap!13976 (toList!7003 List!22561)) )
))
(declare-fun lt!467333 () ListLongMap!13975)

(declare-fun lt!467331 () ListLongMap!13975)

(assert (=> b!1061138 (= lt!467333 lt!467331)))

(declare-fun zeroValueBefore!47 () V!38625)

(declare-datatypes ((Unit!34605 0))(
  ( (Unit!34606) )
))
(declare-fun lt!467332 () Unit!34605)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38625)

(declare-fun minValue!907 () V!38625)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!614 (array!67186 array!67184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38625 V!38625 V!38625 V!38625 (_ BitVec 32) Int) Unit!34605)

(assert (=> b!1061138 (= lt!467332 (lemmaNoChangeToArrayThenSameMapNoExtras!614 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3620 (array!67186 array!67184 (_ BitVec 32) (_ BitVec 32) V!38625 V!38625 (_ BitVec 32) Int) ListLongMap!13975)

(assert (=> b!1061138 (= lt!467331 (getCurrentListMapNoExtraKeys!3620 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061138 (= lt!467333 (getCurrentListMapNoExtraKeys!3620 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39346 () Bool)

(declare-fun tp!75343 () Bool)

(assert (=> mapNonEmpty!39346 (= mapRes!39346 (and tp!75343 e!604241))))

(declare-fun mapKey!39346 () (_ BitVec 32))

(declare-fun mapRest!39346 () (Array (_ BitVec 32) ValueCell!11855))

(declare-fun mapValue!39346 () ValueCell!11855)

(assert (=> mapNonEmpty!39346 (= (arr!32300 _values!955) (store mapRest!39346 mapKey!39346 mapValue!39346))))

(declare-fun res!708665 () Bool)

(assert (=> start!93828 (=> (not res!708665) (not e!604245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93828 (= res!708665 (validMask!0 mask!1515))))

(assert (=> start!93828 e!604245))

(assert (=> start!93828 true))

(assert (=> start!93828 tp_is_empty!25117))

(declare-fun array_inv!25034 (array!67184) Bool)

(assert (=> start!93828 (and (array_inv!25034 _values!955) e!604243)))

(assert (=> start!93828 tp!75344))

(declare-fun array_inv!25035 (array!67186) Bool)

(assert (=> start!93828 (array_inv!25035 _keys!1163)))

(assert (= (and start!93828 res!708665) b!1061132))

(assert (= (and b!1061132 res!708667) b!1061134))

(assert (= (and b!1061134 res!708666) b!1061137))

(assert (= (and b!1061137 res!708664) b!1061138))

(assert (= (and b!1061133 condMapEmpty!39346) mapIsEmpty!39346))

(assert (= (and b!1061133 (not condMapEmpty!39346)) mapNonEmpty!39346))

(get-info :version)

(assert (= (and mapNonEmpty!39346 ((_ is ValueCellFull!11855) mapValue!39346)) b!1061135))

(assert (= (and b!1061133 ((_ is ValueCellFull!11855) mapDefault!39346)) b!1061136))

(assert (= start!93828 b!1061133))

(declare-fun m!979531 () Bool)

(assert (=> start!93828 m!979531))

(declare-fun m!979533 () Bool)

(assert (=> start!93828 m!979533))

(declare-fun m!979535 () Bool)

(assert (=> start!93828 m!979535))

(declare-fun m!979537 () Bool)

(assert (=> mapNonEmpty!39346 m!979537))

(declare-fun m!979539 () Bool)

(assert (=> b!1061134 m!979539))

(declare-fun m!979541 () Bool)

(assert (=> b!1061137 m!979541))

(declare-fun m!979543 () Bool)

(assert (=> b!1061138 m!979543))

(declare-fun m!979545 () Bool)

(assert (=> b!1061138 m!979545))

(declare-fun m!979547 () Bool)

(assert (=> b!1061138 m!979547))

(check-sat (not b!1061137) (not b!1061138) (not start!93828) b_and!33995 (not b!1061134) tp_is_empty!25117 (not mapNonEmpty!39346) (not b_next!21307))
(check-sat b_and!33995 (not b_next!21307))
