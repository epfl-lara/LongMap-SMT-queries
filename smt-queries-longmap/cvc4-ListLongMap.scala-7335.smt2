; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93706 () Bool)

(assert start!93706)

(declare-fun b_free!21191 () Bool)

(declare-fun b_next!21191 () Bool)

(assert (=> start!93706 (= b_free!21191 (not b_next!21191))))

(declare-fun tp!74993 () Bool)

(declare-fun b_and!33901 () Bool)

(assert (=> start!93706 (= tp!74993 b_and!33901)))

(declare-fun b!1059994 () Bool)

(declare-fun e!603417 () Bool)

(declare-fun tp_is_empty!25001 () Bool)

(assert (=> b!1059994 (= e!603417 tp_is_empty!25001)))

(declare-fun mapNonEmpty!39169 () Bool)

(declare-fun mapRes!39169 () Bool)

(declare-fun tp!74992 () Bool)

(assert (=> mapNonEmpty!39169 (= mapRes!39169 (and tp!74992 e!603417))))

(declare-datatypes ((V!38469 0))(
  ( (V!38470 (val!12551 Int)) )
))
(declare-datatypes ((ValueCell!11797 0))(
  ( (ValueCellFull!11797 (v!15161 V!38469)) (EmptyCell!11797) )
))
(declare-fun mapValue!39169 () ValueCell!11797)

(declare-fun mapKey!39169 () (_ BitVec 32))

(declare-datatypes ((array!67027 0))(
  ( (array!67028 (arr!32222 (Array (_ BitVec 32) ValueCell!11797)) (size!32758 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67027)

(declare-fun mapRest!39169 () (Array (_ BitVec 32) ValueCell!11797))

(assert (=> mapNonEmpty!39169 (= (arr!32222 _values!955) (store mapRest!39169 mapKey!39169 mapValue!39169))))

(declare-fun b!1059996 () Bool)

(declare-fun res!708010 () Bool)

(declare-fun e!603418 () Bool)

(assert (=> b!1059996 (=> (not res!708010) (not e!603418))))

(declare-datatypes ((array!67029 0))(
  ( (array!67030 (arr!32223 (Array (_ BitVec 32) (_ BitVec 64))) (size!32759 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67029)

(declare-datatypes ((List!22453 0))(
  ( (Nil!22450) (Cons!22449 (h!23658 (_ BitVec 64)) (t!31760 List!22453)) )
))
(declare-fun arrayNoDuplicates!0 (array!67029 (_ BitVec 32) List!22453) Bool)

(assert (=> b!1059996 (= res!708010 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22450))))

(declare-fun b!1059997 () Bool)

(assert (=> b!1059997 (= e!603418 false)))

(declare-fun zeroValueBefore!47 () V!38469)

(declare-datatypes ((tuple2!15866 0))(
  ( (tuple2!15867 (_1!7944 (_ BitVec 64)) (_2!7944 V!38469)) )
))
(declare-datatypes ((List!22454 0))(
  ( (Nil!22451) (Cons!22450 (h!23659 tuple2!15866) (t!31761 List!22454)) )
))
(declare-datatypes ((ListLongMap!13835 0))(
  ( (ListLongMap!13836 (toList!6933 List!22454)) )
))
(declare-fun lt!467206 () ListLongMap!13835)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38469)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3535 (array!67029 array!67027 (_ BitVec 32) (_ BitVec 32) V!38469 V!38469 (_ BitVec 32) Int) ListLongMap!13835)

(assert (=> b!1059997 (= lt!467206 (getCurrentListMapNoExtraKeys!3535 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059998 () Bool)

(declare-fun e!603419 () Bool)

(declare-fun e!603420 () Bool)

(assert (=> b!1059998 (= e!603419 (and e!603420 mapRes!39169))))

(declare-fun condMapEmpty!39169 () Bool)

(declare-fun mapDefault!39169 () ValueCell!11797)

