; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94434 () Bool)

(assert start!94434)

(declare-fun b_free!21761 () Bool)

(declare-fun b_next!21761 () Bool)

(assert (=> start!94434 (= b_free!21761 (not b_next!21761))))

(declare-fun tp!76730 () Bool)

(declare-fun b_and!34553 () Bool)

(assert (=> start!94434 (= tp!76730 b_and!34553)))

(declare-fun b!1067774 () Bool)

(declare-fun res!712531 () Bool)

(declare-fun e!609079 () Bool)

(assert (=> b!1067774 (=> (not res!712531) (not e!609079))))

(declare-datatypes ((array!68125 0))(
  ( (array!68126 (arr!32762 (Array (_ BitVec 32) (_ BitVec 64))) (size!33298 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68125)

(declare-datatypes ((List!22850 0))(
  ( (Nil!22847) (Cons!22846 (h!24055 (_ BitVec 64)) (t!32175 List!22850)) )
))
(declare-fun arrayNoDuplicates!0 (array!68125 (_ BitVec 32) List!22850) Bool)

(assert (=> b!1067774 (= res!712531 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22847))))

(declare-fun b!1067775 () Bool)

(declare-fun e!609074 () Bool)

(assert (=> b!1067775 (= e!609074 true)))

(declare-datatypes ((V!39229 0))(
  ( (V!39230 (val!12836 Int)) )
))
(declare-datatypes ((tuple2!16294 0))(
  ( (tuple2!16295 (_1!8158 (_ BitVec 64)) (_2!8158 V!39229)) )
))
(declare-datatypes ((List!22851 0))(
  ( (Nil!22848) (Cons!22847 (h!24056 tuple2!16294) (t!32176 List!22851)) )
))
(declare-datatypes ((ListLongMap!14263 0))(
  ( (ListLongMap!14264 (toList!7147 List!22851)) )
))
(declare-fun lt!471621 () ListLongMap!14263)

(declare-fun -!633 (ListLongMap!14263 (_ BitVec 64)) ListLongMap!14263)

(assert (=> b!1067775 (= (-!633 lt!471621 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471621)))

(declare-datatypes ((Unit!35091 0))(
  ( (Unit!35092) )
))
(declare-fun lt!471619 () Unit!35091)

(declare-fun removeNotPresentStillSame!43 (ListLongMap!14263 (_ BitVec 64)) Unit!35091)

(assert (=> b!1067775 (= lt!471619 (removeNotPresentStillSame!43 lt!471621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067776 () Bool)

(declare-fun e!609078 () Bool)

(assert (=> b!1067776 (= e!609078 e!609074)))

(declare-fun res!712536 () Bool)

(assert (=> b!1067776 (=> res!712536 e!609074)))

(declare-fun contains!6283 (ListLongMap!14263 (_ BitVec 64)) Bool)

(assert (=> b!1067776 (= res!712536 (contains!6283 lt!471621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39229)

(declare-datatypes ((ValueCell!12082 0))(
  ( (ValueCellFull!12082 (v!15450 V!39229)) (EmptyCell!12082) )
))
(declare-datatypes ((array!68127 0))(
  ( (array!68128 (arr!32763 (Array (_ BitVec 32) ValueCell!12082)) (size!33299 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68127)

(declare-fun minValue!907 () V!39229)

(declare-fun defaultEntry!963 () Int)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4080 (array!68125 array!68127 (_ BitVec 32) (_ BitVec 32) V!39229 V!39229 (_ BitVec 32) Int) ListLongMap!14263)

(assert (=> b!1067776 (= lt!471621 (getCurrentListMap!4080 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712535 () Bool)

(assert (=> start!94434 (=> (not res!712535) (not e!609079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94434 (= res!712535 (validMask!0 mask!1515))))

(assert (=> start!94434 e!609079))

(assert (=> start!94434 true))

(declare-fun tp_is_empty!25571 () Bool)

(assert (=> start!94434 tp_is_empty!25571))

(declare-fun e!609075 () Bool)

(declare-fun array_inv!25364 (array!68127) Bool)

(assert (=> start!94434 (and (array_inv!25364 _values!955) e!609075)))

(assert (=> start!94434 tp!76730))

(declare-fun array_inv!25365 (array!68125) Bool)

(assert (=> start!94434 (array_inv!25365 _keys!1163)))

(declare-fun b!1067777 () Bool)

(assert (=> b!1067777 (= e!609079 (not e!609078))))

(declare-fun res!712534 () Bool)

(assert (=> b!1067777 (=> res!712534 e!609078)))

(assert (=> b!1067777 (= res!712534 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471622 () ListLongMap!14263)

(declare-fun lt!471620 () ListLongMap!14263)

(assert (=> b!1067777 (= lt!471622 lt!471620)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39229)

(declare-fun lt!471618 () Unit!35091)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!767 (array!68125 array!68127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39229 V!39229 V!39229 V!39229 (_ BitVec 32) Int) Unit!35091)

(assert (=> b!1067777 (= lt!471618 (lemmaNoChangeToArrayThenSameMapNoExtras!767 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3730 (array!68125 array!68127 (_ BitVec 32) (_ BitVec 32) V!39229 V!39229 (_ BitVec 32) Int) ListLongMap!14263)

(assert (=> b!1067777 (= lt!471620 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067777 (= lt!471622 (getCurrentListMapNoExtraKeys!3730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067778 () Bool)

(declare-fun res!712532 () Bool)

(assert (=> b!1067778 (=> (not res!712532) (not e!609079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68125 (_ BitVec 32)) Bool)

(assert (=> b!1067778 (= res!712532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067779 () Bool)

(declare-fun e!609073 () Bool)

(declare-fun mapRes!40051 () Bool)

(assert (=> b!1067779 (= e!609075 (and e!609073 mapRes!40051))))

(declare-fun condMapEmpty!40051 () Bool)

(declare-fun mapDefault!40051 () ValueCell!12082)

