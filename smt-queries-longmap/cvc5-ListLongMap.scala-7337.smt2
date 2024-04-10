; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93714 () Bool)

(assert start!93714)

(declare-fun b_free!21199 () Bool)

(declare-fun b_next!21199 () Bool)

(assert (=> start!93714 (= b_free!21199 (not b_next!21199))))

(declare-fun tp!75017 () Bool)

(declare-fun b_and!33909 () Bool)

(assert (=> start!93714 (= tp!75017 b_and!33909)))

(declare-fun res!708061 () Bool)

(declare-fun e!603476 () Bool)

(assert (=> start!93714 (=> (not res!708061) (not e!603476))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93714 (= res!708061 (validMask!0 mask!1515))))

(assert (=> start!93714 e!603476))

(assert (=> start!93714 true))

(declare-fun tp_is_empty!25009 () Bool)

(assert (=> start!93714 tp_is_empty!25009))

(declare-datatypes ((V!38481 0))(
  ( (V!38482 (val!12555 Int)) )
))
(declare-datatypes ((ValueCell!11801 0))(
  ( (ValueCellFull!11801 (v!15165 V!38481)) (EmptyCell!11801) )
))
(declare-datatypes ((array!67041 0))(
  ( (array!67042 (arr!32229 (Array (_ BitVec 32) ValueCell!11801)) (size!32765 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67041)

(declare-fun e!603477 () Bool)

(declare-fun array_inv!24978 (array!67041) Bool)

(assert (=> start!93714 (and (array_inv!24978 _values!955) e!603477)))

(assert (=> start!93714 tp!75017))

(declare-datatypes ((array!67043 0))(
  ( (array!67044 (arr!32230 (Array (_ BitVec 32) (_ BitVec 64))) (size!32766 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67043)

(declare-fun array_inv!24979 (array!67043) Bool)

(assert (=> start!93714 (array_inv!24979 _keys!1163)))

(declare-fun mapNonEmpty!39181 () Bool)

(declare-fun mapRes!39181 () Bool)

(declare-fun tp!75016 () Bool)

(declare-fun e!603479 () Bool)

(assert (=> mapNonEmpty!39181 (= mapRes!39181 (and tp!75016 e!603479))))

(declare-fun mapValue!39181 () ValueCell!11801)

(declare-fun mapRest!39181 () (Array (_ BitVec 32) ValueCell!11801))

(declare-fun mapKey!39181 () (_ BitVec 32))

(assert (=> mapNonEmpty!39181 (= (arr!32229 _values!955) (store mapRest!39181 mapKey!39181 mapValue!39181))))

(declare-fun b!1060078 () Bool)

(declare-fun res!708059 () Bool)

(assert (=> b!1060078 (=> (not res!708059) (not e!603476))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060078 (= res!708059 (and (= (size!32765 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32766 _keys!1163) (size!32765 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39181 () Bool)

(assert (=> mapIsEmpty!39181 mapRes!39181))

(declare-fun b!1060079 () Bool)

(assert (=> b!1060079 (= e!603476 false)))

(declare-fun zeroValueBefore!47 () V!38481)

(declare-datatypes ((tuple2!15870 0))(
  ( (tuple2!15871 (_1!7946 (_ BitVec 64)) (_2!7946 V!38481)) )
))
(declare-datatypes ((List!22457 0))(
  ( (Nil!22454) (Cons!22453 (h!23662 tuple2!15870) (t!31764 List!22457)) )
))
(declare-datatypes ((ListLongMap!13839 0))(
  ( (ListLongMap!13840 (toList!6935 List!22457)) )
))
(declare-fun lt!467218 () ListLongMap!13839)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38481)

(declare-fun getCurrentListMapNoExtraKeys!3537 (array!67043 array!67041 (_ BitVec 32) (_ BitVec 32) V!38481 V!38481 (_ BitVec 32) Int) ListLongMap!13839)

(assert (=> b!1060079 (= lt!467218 (getCurrentListMapNoExtraKeys!3537 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060080 () Bool)

(assert (=> b!1060080 (= e!603479 tp_is_empty!25009)))

(declare-fun b!1060081 () Bool)

(declare-fun res!708060 () Bool)

(assert (=> b!1060081 (=> (not res!708060) (not e!603476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67043 (_ BitVec 32)) Bool)

(assert (=> b!1060081 (= res!708060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060082 () Bool)

(declare-fun e!603478 () Bool)

(assert (=> b!1060082 (= e!603477 (and e!603478 mapRes!39181))))

(declare-fun condMapEmpty!39181 () Bool)

(declare-fun mapDefault!39181 () ValueCell!11801)

