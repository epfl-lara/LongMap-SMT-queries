; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93766 () Bool)

(assert start!93766)

(declare-fun b_free!21239 () Bool)

(declare-fun b_next!21239 () Bool)

(assert (=> start!93766 (= b_free!21239 (not b_next!21239))))

(declare-fun tp!75140 () Bool)

(declare-fun b_and!33953 () Bool)

(assert (=> start!93766 (= tp!75140 b_and!33953)))

(declare-fun b!1060571 () Bool)

(declare-fun res!708327 () Bool)

(declare-fun e!603827 () Bool)

(assert (=> b!1060571 (=> (not res!708327) (not e!603827))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38533 0))(
  ( (V!38534 (val!12575 Int)) )
))
(declare-datatypes ((ValueCell!11821 0))(
  ( (ValueCellFull!11821 (v!15185 V!38533)) (EmptyCell!11821) )
))
(declare-datatypes ((array!67117 0))(
  ( (array!67118 (arr!32266 (Array (_ BitVec 32) ValueCell!11821)) (size!32802 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67117)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((array!67119 0))(
  ( (array!67120 (arr!32267 (Array (_ BitVec 32) (_ BitVec 64))) (size!32803 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67119)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060571 (= res!708327 (and (= (size!32802 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32803 _keys!1163) (size!32802 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060572 () Bool)

(declare-fun res!708328 () Bool)

(assert (=> b!1060572 (=> (not res!708328) (not e!603827))))

(declare-datatypes ((List!22480 0))(
  ( (Nil!22477) (Cons!22476 (h!23685 (_ BitVec 64)) (t!31789 List!22480)) )
))
(declare-fun arrayNoDuplicates!0 (array!67119 (_ BitVec 32) List!22480) Bool)

(assert (=> b!1060572 (= res!708328 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22477))))

(declare-fun b!1060573 () Bool)

(declare-fun e!603828 () Bool)

(declare-fun tp_is_empty!25049 () Bool)

(assert (=> b!1060573 (= e!603828 tp_is_empty!25049)))

(declare-fun mapNonEmpty!39244 () Bool)

(declare-fun mapRes!39244 () Bool)

(declare-fun tp!75139 () Bool)

(declare-fun e!603824 () Bool)

(assert (=> mapNonEmpty!39244 (= mapRes!39244 (and tp!75139 e!603824))))

(declare-fun mapRest!39244 () (Array (_ BitVec 32) ValueCell!11821))

(declare-fun mapValue!39244 () ValueCell!11821)

(declare-fun mapKey!39244 () (_ BitVec 32))

(assert (=> mapNonEmpty!39244 (= (arr!32266 _values!955) (store mapRest!39244 mapKey!39244 mapValue!39244))))

(declare-fun res!708326 () Bool)

(assert (=> start!93766 (=> (not res!708326) (not e!603827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93766 (= res!708326 (validMask!0 mask!1515))))

(assert (=> start!93766 e!603827))

(assert (=> start!93766 true))

(assert (=> start!93766 tp_is_empty!25049))

(declare-fun e!603825 () Bool)

(declare-fun array_inv!25002 (array!67117) Bool)

(assert (=> start!93766 (and (array_inv!25002 _values!955) e!603825)))

(assert (=> start!93766 tp!75140))

(declare-fun array_inv!25003 (array!67119) Bool)

(assert (=> start!93766 (array_inv!25003 _keys!1163)))

(declare-fun b!1060574 () Bool)

(assert (=> b!1060574 (= e!603825 (and e!603828 mapRes!39244))))

(declare-fun condMapEmpty!39244 () Bool)

(declare-fun mapDefault!39244 () ValueCell!11821)

