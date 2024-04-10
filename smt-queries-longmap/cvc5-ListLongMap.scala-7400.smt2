; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94192 () Bool)

(assert start!94192)

(declare-fun b_free!21577 () Bool)

(declare-fun b_next!21577 () Bool)

(assert (=> start!94192 (= b_free!21577 (not b_next!21577))))

(declare-fun tp!76169 () Bool)

(declare-fun b_and!34337 () Bool)

(assert (=> start!94192 (= tp!76169 b_and!34337)))

(declare-fun mapIsEmpty!39766 () Bool)

(declare-fun mapRes!39766 () Bool)

(assert (=> mapIsEmpty!39766 mapRes!39766))

(declare-fun b!1065170 () Bool)

(declare-fun e!607185 () Bool)

(declare-datatypes ((V!38985 0))(
  ( (V!38986 (val!12744 Int)) )
))
(declare-datatypes ((tuple2!16148 0))(
  ( (tuple2!16149 (_1!8085 (_ BitVec 64)) (_2!8085 V!38985)) )
))
(declare-datatypes ((List!22716 0))(
  ( (Nil!22713) (Cons!22712 (h!23921 tuple2!16148) (t!32035 List!22716)) )
))
(declare-datatypes ((ListLongMap!14117 0))(
  ( (ListLongMap!14118 (toList!7074 List!22716)) )
))
(declare-fun lt!469601 () ListLongMap!14117)

(declare-fun lt!469602 () ListLongMap!14117)

(assert (=> b!1065170 (= e!607185 (= lt!469601 lt!469602))))

(declare-fun b!1065171 () Bool)

(declare-fun res!711014 () Bool)

(declare-fun e!607182 () Bool)

(assert (=> b!1065171 (=> (not res!711014) (not e!607182))))

(declare-datatypes ((array!67761 0))(
  ( (array!67762 (arr!32583 (Array (_ BitVec 32) (_ BitVec 64))) (size!33119 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67761)

(declare-datatypes ((List!22717 0))(
  ( (Nil!22714) (Cons!22713 (h!23922 (_ BitVec 64)) (t!32036 List!22717)) )
))
(declare-fun arrayNoDuplicates!0 (array!67761 (_ BitVec 32) List!22717) Bool)

(assert (=> b!1065171 (= res!711014 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22714))))

(declare-fun mapNonEmpty!39766 () Bool)

(declare-fun tp!76168 () Bool)

(declare-fun e!607181 () Bool)

(assert (=> mapNonEmpty!39766 (= mapRes!39766 (and tp!76168 e!607181))))

(declare-datatypes ((ValueCell!11990 0))(
  ( (ValueCellFull!11990 (v!15356 V!38985)) (EmptyCell!11990) )
))
(declare-fun mapValue!39766 () ValueCell!11990)

(declare-fun mapKey!39766 () (_ BitVec 32))

(declare-datatypes ((array!67763 0))(
  ( (array!67764 (arr!32584 (Array (_ BitVec 32) ValueCell!11990)) (size!33120 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67763)

(declare-fun mapRest!39766 () (Array (_ BitVec 32) ValueCell!11990))

(assert (=> mapNonEmpty!39766 (= (arr!32584 _values!955) (store mapRest!39766 mapKey!39766 mapValue!39766))))

(declare-fun b!1065172 () Bool)

(declare-fun e!607183 () Bool)

(declare-fun tp_is_empty!25387 () Bool)

(assert (=> b!1065172 (= e!607183 tp_is_empty!25387)))

(declare-fun b!1065173 () Bool)

(declare-fun e!607184 () Bool)

(assert (=> b!1065173 (= e!607184 (and e!607183 mapRes!39766))))

(declare-fun condMapEmpty!39766 () Bool)

(declare-fun mapDefault!39766 () ValueCell!11990)

