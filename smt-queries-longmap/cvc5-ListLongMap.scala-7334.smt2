; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93696 () Bool)

(assert start!93696)

(declare-fun b_free!21181 () Bool)

(declare-fun b_next!21181 () Bool)

(assert (=> start!93696 (= b_free!21181 (not b_next!21181))))

(declare-fun tp!74962 () Bool)

(declare-fun b_and!33891 () Bool)

(assert (=> start!93696 (= tp!74962 b_and!33891)))

(declare-fun b!1059889 () Bool)

(declare-fun res!707953 () Bool)

(declare-fun e!603341 () Bool)

(assert (=> b!1059889 (=> (not res!707953) (not e!603341))))

(declare-datatypes ((array!67007 0))(
  ( (array!67008 (arr!32212 (Array (_ BitVec 32) (_ BitVec 64))) (size!32748 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67007)

(declare-datatypes ((List!22445 0))(
  ( (Nil!22442) (Cons!22441 (h!23650 (_ BitVec 64)) (t!31752 List!22445)) )
))
(declare-fun arrayNoDuplicates!0 (array!67007 (_ BitVec 32) List!22445) Bool)

(assert (=> b!1059889 (= res!707953 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22442))))

(declare-fun b!1059890 () Bool)

(assert (=> b!1059890 (= e!603341 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38457 0))(
  ( (V!38458 (val!12546 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38457)

(declare-datatypes ((ValueCell!11792 0))(
  ( (ValueCellFull!11792 (v!15156 V!38457)) (EmptyCell!11792) )
))
(declare-datatypes ((array!67009 0))(
  ( (array!67010 (arr!32213 (Array (_ BitVec 32) ValueCell!11792)) (size!32749 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67009)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38457)

(declare-datatypes ((tuple2!15858 0))(
  ( (tuple2!15859 (_1!7940 (_ BitVec 64)) (_2!7940 V!38457)) )
))
(declare-datatypes ((List!22446 0))(
  ( (Nil!22443) (Cons!22442 (h!23651 tuple2!15858) (t!31753 List!22446)) )
))
(declare-datatypes ((ListLongMap!13827 0))(
  ( (ListLongMap!13828 (toList!6929 List!22446)) )
))
(declare-fun lt!467191 () ListLongMap!13827)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3531 (array!67007 array!67009 (_ BitVec 32) (_ BitVec 32) V!38457 V!38457 (_ BitVec 32) Int) ListLongMap!13827)

(assert (=> b!1059890 (= lt!467191 (getCurrentListMapNoExtraKeys!3531 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059891 () Bool)

(declare-fun res!707950 () Bool)

(assert (=> b!1059891 (=> (not res!707950) (not e!603341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67007 (_ BitVec 32)) Bool)

(assert (=> b!1059891 (= res!707950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39154 () Bool)

(declare-fun mapRes!39154 () Bool)

(declare-fun tp!74963 () Bool)

(declare-fun e!603345 () Bool)

(assert (=> mapNonEmpty!39154 (= mapRes!39154 (and tp!74963 e!603345))))

(declare-fun mapKey!39154 () (_ BitVec 32))

(declare-fun mapValue!39154 () ValueCell!11792)

(declare-fun mapRest!39154 () (Array (_ BitVec 32) ValueCell!11792))

(assert (=> mapNonEmpty!39154 (= (arr!32213 _values!955) (store mapRest!39154 mapKey!39154 mapValue!39154))))

(declare-fun b!1059892 () Bool)

(declare-fun e!603344 () Bool)

(declare-fun tp_is_empty!24991 () Bool)

(assert (=> b!1059892 (= e!603344 tp_is_empty!24991)))

(declare-fun mapIsEmpty!39154 () Bool)

(assert (=> mapIsEmpty!39154 mapRes!39154))

(declare-fun b!1059894 () Bool)

(declare-fun e!603343 () Bool)

(assert (=> b!1059894 (= e!603343 (and e!603344 mapRes!39154))))

(declare-fun condMapEmpty!39154 () Bool)

(declare-fun mapDefault!39154 () ValueCell!11792)

