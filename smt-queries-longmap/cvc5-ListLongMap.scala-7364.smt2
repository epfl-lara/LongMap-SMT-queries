; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93902 () Bool)

(assert start!93902)

(declare-fun b_free!21361 () Bool)

(declare-fun b_next!21361 () Bool)

(assert (=> start!93902 (= b_free!21361 (not b_next!21361))))

(declare-fun tp!75509 () Bool)

(declare-fun b_and!34083 () Bool)

(assert (=> start!93902 (= tp!75509 b_and!34083)))

(declare-fun b!1061950 () Bool)

(declare-fun e!604809 () Bool)

(assert (=> b!1061950 (= e!604809 true)))

(declare-datatypes ((V!38697 0))(
  ( (V!38698 (val!12636 Int)) )
))
(declare-datatypes ((tuple2!15976 0))(
  ( (tuple2!15977 (_1!7999 (_ BitVec 64)) (_2!7999 V!38697)) )
))
(declare-datatypes ((List!22559 0))(
  ( (Nil!22556) (Cons!22555 (h!23764 tuple2!15976) (t!31870 List!22559)) )
))
(declare-datatypes ((ListLongMap!13945 0))(
  ( (ListLongMap!13946 (toList!6988 List!22559)) )
))
(declare-fun lt!467831 () ListLongMap!13945)

(declare-fun -!554 (ListLongMap!13945 (_ BitVec 64)) ListLongMap!13945)

(assert (=> b!1061950 (= (-!554 lt!467831 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467831)))

(declare-datatypes ((Unit!34778 0))(
  ( (Unit!34779) )
))
(declare-fun lt!467828 () Unit!34778)

(declare-fun removeNotPresentStillSame!1 (ListLongMap!13945 (_ BitVec 64)) Unit!34778)

(assert (=> b!1061950 (= lt!467828 (removeNotPresentStillSame!1 lt!467831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1061951 () Bool)

(declare-fun e!604813 () Bool)

(declare-fun tp_is_empty!25171 () Bool)

(assert (=> b!1061951 (= e!604813 tp_is_empty!25171)))

(declare-fun b!1061952 () Bool)

(declare-fun res!709103 () Bool)

(declare-fun e!604808 () Bool)

(assert (=> b!1061952 (=> (not res!709103) (not e!604808))))

(declare-datatypes ((array!67347 0))(
  ( (array!67348 (arr!32380 (Array (_ BitVec 32) (_ BitVec 64))) (size!32916 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67347)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67347 (_ BitVec 32)) Bool)

(assert (=> b!1061952 (= res!709103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061953 () Bool)

(declare-fun res!709104 () Bool)

(assert (=> b!1061953 (=> (not res!709104) (not e!604808))))

(declare-datatypes ((List!22560 0))(
  ( (Nil!22557) (Cons!22556 (h!23765 (_ BitVec 64)) (t!31871 List!22560)) )
))
(declare-fun arrayNoDuplicates!0 (array!67347 (_ BitVec 32) List!22560) Bool)

(assert (=> b!1061953 (= res!709104 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22557))))

(declare-fun mapIsEmpty!39430 () Bool)

(declare-fun mapRes!39430 () Bool)

(assert (=> mapIsEmpty!39430 mapRes!39430))

(declare-fun res!709106 () Bool)

(assert (=> start!93902 (=> (not res!709106) (not e!604808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93902 (= res!709106 (validMask!0 mask!1515))))

(assert (=> start!93902 e!604808))

(assert (=> start!93902 true))

(assert (=> start!93902 tp_is_empty!25171))

(declare-datatypes ((ValueCell!11882 0))(
  ( (ValueCellFull!11882 (v!15246 V!38697)) (EmptyCell!11882) )
))
(declare-datatypes ((array!67349 0))(
  ( (array!67350 (arr!32381 (Array (_ BitVec 32) ValueCell!11882)) (size!32917 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67349)

(declare-fun e!604811 () Bool)

(declare-fun array_inv!25088 (array!67349) Bool)

(assert (=> start!93902 (and (array_inv!25088 _values!955) e!604811)))

(assert (=> start!93902 tp!75509))

(declare-fun array_inv!25089 (array!67347) Bool)

(assert (=> start!93902 (array_inv!25089 _keys!1163)))

(declare-fun b!1061954 () Bool)

(declare-fun e!604812 () Bool)

(assert (=> b!1061954 (= e!604811 (and e!604812 mapRes!39430))))

(declare-fun condMapEmpty!39430 () Bool)

(declare-fun mapDefault!39430 () ValueCell!11882)

