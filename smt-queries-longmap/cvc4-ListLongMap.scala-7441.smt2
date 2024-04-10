; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94522 () Bool)

(assert start!94522)

(declare-fun b_free!21827 () Bool)

(declare-fun b_next!21827 () Bool)

(assert (=> start!94522 (= b_free!21827 (not b_next!21827))))

(declare-fun tp!76931 () Bool)

(declare-fun b_and!34629 () Bool)

(assert (=> start!94522 (= tp!76931 b_and!34629)))

(declare-fun b!1068822 () Bool)

(declare-fun res!713188 () Bool)

(declare-fun e!609867 () Bool)

(assert (=> b!1068822 (=> (not res!713188) (not e!609867))))

(declare-datatypes ((array!68251 0))(
  ( (array!68252 (arr!32824 (Array (_ BitVec 32) (_ BitVec 64))) (size!33360 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68251)

(declare-datatypes ((List!22897 0))(
  ( (Nil!22894) (Cons!22893 (h!24102 (_ BitVec 64)) (t!32224 List!22897)) )
))
(declare-fun arrayNoDuplicates!0 (array!68251 (_ BitVec 32) List!22897) Bool)

(assert (=> b!1068822 (= res!713188 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22894))))

(declare-fun b!1068823 () Bool)

(declare-fun e!609870 () Bool)

(assert (=> b!1068823 (= e!609870 true)))

(declare-datatypes ((V!39317 0))(
  ( (V!39318 (val!12869 Int)) )
))
(declare-datatypes ((tuple2!16350 0))(
  ( (tuple2!16351 (_1!8186 (_ BitVec 64)) (_2!8186 V!39317)) )
))
(declare-datatypes ((List!22898 0))(
  ( (Nil!22895) (Cons!22894 (h!24103 tuple2!16350) (t!32225 List!22898)) )
))
(declare-datatypes ((ListLongMap!14319 0))(
  ( (ListLongMap!14320 (toList!7175 List!22898)) )
))
(declare-fun lt!472241 () ListLongMap!14319)

(declare-fun -!656 (ListLongMap!14319 (_ BitVec 64)) ListLongMap!14319)

(assert (=> b!1068823 (= (-!656 lt!472241 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472241)))

(declare-datatypes ((Unit!35149 0))(
  ( (Unit!35150) )
))
(declare-fun lt!472239 () Unit!35149)

(declare-fun removeNotPresentStillSame!66 (ListLongMap!14319 (_ BitVec 64)) Unit!35149)

(assert (=> b!1068823 (= lt!472239 (removeNotPresentStillSame!66 lt!472241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068824 () Bool)

(declare-fun res!713186 () Bool)

(assert (=> b!1068824 (=> (not res!713186) (not e!609867))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68251 (_ BitVec 32)) Bool)

(assert (=> b!1068824 (= res!713186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068825 () Bool)

(declare-fun e!609866 () Bool)

(declare-fun e!609869 () Bool)

(declare-fun mapRes!40153 () Bool)

(assert (=> b!1068825 (= e!609866 (and e!609869 mapRes!40153))))

(declare-fun condMapEmpty!40153 () Bool)

(declare-datatypes ((ValueCell!12115 0))(
  ( (ValueCellFull!12115 (v!15484 V!39317)) (EmptyCell!12115) )
))
(declare-datatypes ((array!68253 0))(
  ( (array!68254 (arr!32825 (Array (_ BitVec 32) ValueCell!12115)) (size!33361 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68253)

(declare-fun mapDefault!40153 () ValueCell!12115)

