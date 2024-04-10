; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93720 () Bool)

(assert start!93720)

(declare-fun b_free!21205 () Bool)

(declare-fun b_next!21205 () Bool)

(assert (=> start!93720 (= b_free!21205 (not b_next!21205))))

(declare-fun tp!75034 () Bool)

(declare-fun b_and!33915 () Bool)

(assert (=> start!93720 (= tp!75034 b_and!33915)))

(declare-fun b!1060141 () Bool)

(declare-fun e!603523 () Bool)

(assert (=> b!1060141 (= e!603523 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38489 0))(
  ( (V!38490 (val!12558 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38489)

(declare-datatypes ((tuple2!15874 0))(
  ( (tuple2!15875 (_1!7948 (_ BitVec 64)) (_2!7948 V!38489)) )
))
(declare-datatypes ((List!22460 0))(
  ( (Nil!22457) (Cons!22456 (h!23665 tuple2!15874) (t!31767 List!22460)) )
))
(declare-datatypes ((ListLongMap!13843 0))(
  ( (ListLongMap!13844 (toList!6937 List!22460)) )
))
(declare-fun lt!467227 () ListLongMap!13843)

(declare-datatypes ((ValueCell!11804 0))(
  ( (ValueCellFull!11804 (v!15168 V!38489)) (EmptyCell!11804) )
))
(declare-datatypes ((array!67051 0))(
  ( (array!67052 (arr!32234 (Array (_ BitVec 32) ValueCell!11804)) (size!32770 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67051)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38489)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67053 0))(
  ( (array!67054 (arr!32235 (Array (_ BitVec 32) (_ BitVec 64))) (size!32771 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67053)

(declare-fun getCurrentListMapNoExtraKeys!3539 (array!67053 array!67051 (_ BitVec 32) (_ BitVec 32) V!38489 V!38489 (_ BitVec 32) Int) ListLongMap!13843)

(assert (=> b!1060141 (= lt!467227 (getCurrentListMapNoExtraKeys!3539 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060142 () Bool)

(declare-fun e!603525 () Bool)

(declare-fun tp_is_empty!25015 () Bool)

(assert (=> b!1060142 (= e!603525 tp_is_empty!25015)))

(declare-fun b!1060143 () Bool)

(declare-fun e!603522 () Bool)

(assert (=> b!1060143 (= e!603522 tp_is_empty!25015)))

(declare-fun b!1060144 () Bool)

(declare-fun res!708096 () Bool)

(assert (=> b!1060144 (=> (not res!708096) (not e!603523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67053 (_ BitVec 32)) Bool)

(assert (=> b!1060144 (= res!708096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060145 () Bool)

(declare-fun e!603524 () Bool)

(declare-fun mapRes!39190 () Bool)

(assert (=> b!1060145 (= e!603524 (and e!603525 mapRes!39190))))

(declare-fun condMapEmpty!39190 () Bool)

(declare-fun mapDefault!39190 () ValueCell!11804)

