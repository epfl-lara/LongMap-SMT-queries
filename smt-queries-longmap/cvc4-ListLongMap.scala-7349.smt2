; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93802 () Bool)

(assert start!93802)

(declare-fun b_free!21275 () Bool)

(declare-fun b_next!21275 () Bool)

(assert (=> start!93802 (= b_free!21275 (not b_next!21275))))

(declare-fun tp!75248 () Bool)

(declare-fun b_and!33989 () Bool)

(assert (=> start!93802 (= tp!75248 b_and!33989)))

(declare-fun b!1060949 () Bool)

(declare-fun res!708543 () Bool)

(declare-fun e!604097 () Bool)

(assert (=> b!1060949 (=> (not res!708543) (not e!604097))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38581 0))(
  ( (V!38582 (val!12593 Int)) )
))
(declare-datatypes ((ValueCell!11839 0))(
  ( (ValueCellFull!11839 (v!15203 V!38581)) (EmptyCell!11839) )
))
(declare-datatypes ((array!67179 0))(
  ( (array!67180 (arr!32297 (Array (_ BitVec 32) ValueCell!11839)) (size!32833 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67179)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67181 0))(
  ( (array!67182 (arr!32298 (Array (_ BitVec 32) (_ BitVec 64))) (size!32834 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67181)

(assert (=> b!1060949 (= res!708543 (and (= (size!32833 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32834 _keys!1163) (size!32833 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708541 () Bool)

(assert (=> start!93802 (=> (not res!708541) (not e!604097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93802 (= res!708541 (validMask!0 mask!1515))))

(assert (=> start!93802 e!604097))

(assert (=> start!93802 true))

(declare-fun tp_is_empty!25085 () Bool)

(assert (=> start!93802 tp_is_empty!25085))

(declare-fun e!604096 () Bool)

(declare-fun array_inv!25028 (array!67179) Bool)

(assert (=> start!93802 (and (array_inv!25028 _values!955) e!604096)))

(assert (=> start!93802 tp!75248))

(declare-fun array_inv!25029 (array!67181) Bool)

(assert (=> start!93802 (array_inv!25029 _keys!1163)))

(declare-fun mapIsEmpty!39298 () Bool)

(declare-fun mapRes!39298 () Bool)

(assert (=> mapIsEmpty!39298 mapRes!39298))

(declare-fun mapNonEmpty!39298 () Bool)

(declare-fun tp!75247 () Bool)

(declare-fun e!604094 () Bool)

(assert (=> mapNonEmpty!39298 (= mapRes!39298 (and tp!75247 e!604094))))

(declare-fun mapKey!39298 () (_ BitVec 32))

(declare-fun mapRest!39298 () (Array (_ BitVec 32) ValueCell!11839))

(declare-fun mapValue!39298 () ValueCell!11839)

(assert (=> mapNonEmpty!39298 (= (arr!32297 _values!955) (store mapRest!39298 mapKey!39298 mapValue!39298))))

(declare-fun b!1060950 () Bool)

(declare-fun e!604095 () Bool)

(assert (=> b!1060950 (= e!604096 (and e!604095 mapRes!39298))))

(declare-fun condMapEmpty!39298 () Bool)

(declare-fun mapDefault!39298 () ValueCell!11839)

