; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94512 () Bool)

(assert start!94512)

(declare-fun b_free!21817 () Bool)

(declare-fun b_next!21817 () Bool)

(assert (=> start!94512 (= b_free!21817 (not b_next!21817))))

(declare-fun tp!76901 () Bool)

(declare-fun b_and!34619 () Bool)

(assert (=> start!94512 (= tp!76901 b_and!34619)))

(declare-fun b!1068687 () Bool)

(declare-fun res!713100 () Bool)

(declare-fun e!609766 () Bool)

(assert (=> b!1068687 (=> (not res!713100) (not e!609766))))

(declare-datatypes ((array!68233 0))(
  ( (array!68234 (arr!32815 (Array (_ BitVec 32) (_ BitVec 64))) (size!33351 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68233)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68233 (_ BitVec 32)) Bool)

(assert (=> b!1068687 (= res!713100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068688 () Bool)

(declare-fun e!609764 () Bool)

(assert (=> b!1068688 (= e!609764 true)))

(declare-datatypes ((V!39305 0))(
  ( (V!39306 (val!12864 Int)) )
))
(declare-datatypes ((tuple2!16342 0))(
  ( (tuple2!16343 (_1!8182 (_ BitVec 64)) (_2!8182 V!39305)) )
))
(declare-datatypes ((List!22891 0))(
  ( (Nil!22888) (Cons!22887 (h!24096 tuple2!16342) (t!32218 List!22891)) )
))
(declare-datatypes ((ListLongMap!14311 0))(
  ( (ListLongMap!14312 (toList!7171 List!22891)) )
))
(declare-fun lt!472163 () ListLongMap!14311)

(declare-fun -!653 (ListLongMap!14311 (_ BitVec 64)) ListLongMap!14311)

(assert (=> b!1068688 (= (-!653 lt!472163 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472163)))

(declare-datatypes ((Unit!35141 0))(
  ( (Unit!35142) )
))
(declare-fun lt!472164 () Unit!35141)

(declare-fun removeNotPresentStillSame!63 (ListLongMap!14311 (_ BitVec 64)) Unit!35141)

(assert (=> b!1068688 (= lt!472164 (removeNotPresentStillSame!63 lt!472163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068689 () Bool)

(declare-fun e!609765 () Bool)

(declare-fun e!609767 () Bool)

(declare-fun mapRes!40138 () Bool)

(assert (=> b!1068689 (= e!609765 (and e!609767 mapRes!40138))))

(declare-fun condMapEmpty!40138 () Bool)

(declare-datatypes ((ValueCell!12110 0))(
  ( (ValueCellFull!12110 (v!15479 V!39305)) (EmptyCell!12110) )
))
(declare-datatypes ((array!68235 0))(
  ( (array!68236 (arr!32816 (Array (_ BitVec 32) ValueCell!12110)) (size!33352 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68235)

(declare-fun mapDefault!40138 () ValueCell!12110)

