; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93674 () Bool)

(assert start!93674)

(declare-fun mapNonEmpty!39133 () Bool)

(declare-fun mapRes!39133 () Bool)

(declare-fun tp!74939 () Bool)

(declare-fun e!603227 () Bool)

(assert (=> mapNonEmpty!39133 (= mapRes!39133 (and tp!74939 e!603227))))

(declare-fun mapKey!39133 () (_ BitVec 32))

(declare-datatypes ((V!38441 0))(
  ( (V!38442 (val!12540 Int)) )
))
(declare-datatypes ((ValueCell!11786 0))(
  ( (ValueCellFull!11786 (v!15150 V!38441)) (EmptyCell!11786) )
))
(declare-fun mapValue!39133 () ValueCell!11786)

(declare-datatypes ((array!66983 0))(
  ( (array!66984 (arr!32201 (Array (_ BitVec 32) ValueCell!11786)) (size!32737 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66983)

(declare-fun mapRest!39133 () (Array (_ BitVec 32) ValueCell!11786))

(assert (=> mapNonEmpty!39133 (= (arr!32201 _values!955) (store mapRest!39133 mapKey!39133 mapValue!39133))))

(declare-fun b!1059735 () Bool)

(declare-fun e!603226 () Bool)

(declare-fun tp_is_empty!24979 () Bool)

(assert (=> b!1059735 (= e!603226 tp_is_empty!24979)))

(declare-fun b!1059736 () Bool)

(declare-fun e!603228 () Bool)

(assert (=> b!1059736 (= e!603228 (and e!603226 mapRes!39133))))

(declare-fun condMapEmpty!39133 () Bool)

(declare-fun mapDefault!39133 () ValueCell!11786)

