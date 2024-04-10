; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93978 () Bool)

(assert start!93978)

(declare-fun b_free!21415 () Bool)

(declare-fun b_next!21415 () Bool)

(assert (=> start!93978 (= b_free!21415 (not b_next!21415))))

(declare-fun tp!75674 () Bool)

(declare-fun b_and!34147 () Bool)

(assert (=> start!93978 (= tp!75674 b_and!34147)))

(declare-fun b!1062836 () Bool)

(declare-fun res!709652 () Bool)

(declare-fun e!605476 () Bool)

(assert (=> b!1062836 (=> (not res!709652) (not e!605476))))

(declare-datatypes ((array!67455 0))(
  ( (array!67456 (arr!32433 (Array (_ BitVec 32) (_ BitVec 64))) (size!32969 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67455)

(declare-datatypes ((List!22606 0))(
  ( (Nil!22603) (Cons!22602 (h!23811 (_ BitVec 64)) (t!31919 List!22606)) )
))
(declare-fun arrayNoDuplicates!0 (array!67455 (_ BitVec 32) List!22606) Bool)

(assert (=> b!1062836 (= res!709652 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22603))))

(declare-fun b!1062837 () Bool)

(declare-fun e!605480 () Bool)

(declare-fun e!605475 () Bool)

(assert (=> b!1062837 (= e!605480 e!605475)))

(declare-fun res!709650 () Bool)

(assert (=> b!1062837 (=> res!709650 e!605475)))

(declare-datatypes ((V!38769 0))(
  ( (V!38770 (val!12663 Int)) )
))
(declare-datatypes ((tuple2!16026 0))(
  ( (tuple2!16027 (_1!8024 (_ BitVec 64)) (_2!8024 V!38769)) )
))
(declare-datatypes ((List!22607 0))(
  ( (Nil!22604) (Cons!22603 (h!23812 tuple2!16026) (t!31920 List!22607)) )
))
(declare-datatypes ((ListLongMap!13995 0))(
  ( (ListLongMap!13996 (toList!7013 List!22607)) )
))
(declare-fun lt!468358 () ListLongMap!13995)

(declare-fun contains!6245 (ListLongMap!13995 (_ BitVec 64)) Bool)

(assert (=> b!1062837 (= res!709650 (contains!6245 lt!468358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38769)

(declare-datatypes ((ValueCell!11909 0))(
  ( (ValueCellFull!11909 (v!15274 V!38769)) (EmptyCell!11909) )
))
(declare-datatypes ((array!67457 0))(
  ( (array!67458 (arr!32434 (Array (_ BitVec 32) ValueCell!11909)) (size!32970 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67457)

(declare-fun minValue!907 () V!38769)

(declare-fun defaultEntry!963 () Int)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3997 (array!67455 array!67457 (_ BitVec 32) (_ BitVec 32) V!38769 V!38769 (_ BitVec 32) Int) ListLongMap!13995)

(assert (=> b!1062837 (= lt!468358 (getCurrentListMap!3997 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709648 () Bool)

(assert (=> start!93978 (=> (not res!709648) (not e!605476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93978 (= res!709648 (validMask!0 mask!1515))))

(assert (=> start!93978 e!605476))

(assert (=> start!93978 true))

(declare-fun tp_is_empty!25225 () Bool)

(assert (=> start!93978 tp_is_empty!25225))

(declare-fun e!605474 () Bool)

(declare-fun array_inv!25124 (array!67457) Bool)

(assert (=> start!93978 (and (array_inv!25124 _values!955) e!605474)))

(assert (=> start!93978 tp!75674))

(declare-fun array_inv!25125 (array!67455) Bool)

(assert (=> start!93978 (array_inv!25125 _keys!1163)))

(declare-fun b!1062838 () Bool)

(declare-fun e!605478 () Bool)

(assert (=> b!1062838 (= e!605478 tp_is_empty!25225)))

(declare-fun b!1062839 () Bool)

(declare-fun res!709651 () Bool)

(assert (=> b!1062839 (=> (not res!709651) (not e!605476))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1062839 (= res!709651 (and (= (size!32970 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32969 _keys!1163) (size!32970 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062840 () Bool)

(declare-fun res!709653 () Bool)

(assert (=> b!1062840 (=> (not res!709653) (not e!605476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67455 (_ BitVec 32)) Bool)

(assert (=> b!1062840 (= res!709653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062841 () Bool)

(assert (=> b!1062841 (= e!605475 true)))

(declare-fun -!576 (ListLongMap!13995 (_ BitVec 64)) ListLongMap!13995)

(assert (=> b!1062841 (= (-!576 lt!468358 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468358)))

(declare-datatypes ((Unit!34826 0))(
  ( (Unit!34827) )
))
(declare-fun lt!468360 () Unit!34826)

(declare-fun removeNotPresentStillSame!23 (ListLongMap!13995 (_ BitVec 64)) Unit!34826)

(assert (=> b!1062841 (= lt!468360 (removeNotPresentStillSame!23 lt!468358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!39514 () Bool)

(declare-fun mapRes!39514 () Bool)

(declare-fun tp!75673 () Bool)

(declare-fun e!605479 () Bool)

(assert (=> mapNonEmpty!39514 (= mapRes!39514 (and tp!75673 e!605479))))

(declare-fun mapRest!39514 () (Array (_ BitVec 32) ValueCell!11909))

(declare-fun mapKey!39514 () (_ BitVec 32))

(declare-fun mapValue!39514 () ValueCell!11909)

(assert (=> mapNonEmpty!39514 (= (arr!32434 _values!955) (store mapRest!39514 mapKey!39514 mapValue!39514))))

(declare-fun b!1062842 () Bool)

(assert (=> b!1062842 (= e!605474 (and e!605478 mapRes!39514))))

(declare-fun condMapEmpty!39514 () Bool)

(declare-fun mapDefault!39514 () ValueCell!11909)

