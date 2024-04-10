; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93552 () Bool)

(assert start!93552)

(declare-fun res!707471 () Bool)

(declare-fun e!602546 () Bool)

(assert (=> start!93552 (=> (not res!707471) (not e!602546))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93552 (= res!707471 (validMask!0 mask!1515))))

(assert (=> start!93552 e!602546))

(assert (=> start!93552 true))

(declare-datatypes ((V!38337 0))(
  ( (V!38338 (val!12501 Int)) )
))
(declare-datatypes ((ValueCell!11747 0))(
  ( (ValueCellFull!11747 (v!15110 V!38337)) (EmptyCell!11747) )
))
(declare-datatypes ((array!66827 0))(
  ( (array!66828 (arr!32128 (Array (_ BitVec 32) ValueCell!11747)) (size!32664 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66827)

(declare-fun e!602547 () Bool)

(declare-fun array_inv!24908 (array!66827) Bool)

(assert (=> start!93552 (and (array_inv!24908 _values!955) e!602547)))

(declare-datatypes ((array!66829 0))(
  ( (array!66830 (arr!32129 (Array (_ BitVec 32) (_ BitVec 64))) (size!32665 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66829)

(declare-fun array_inv!24909 (array!66829) Bool)

(assert (=> start!93552 (array_inv!24909 _keys!1163)))

(declare-fun mapIsEmpty!39001 () Bool)

(declare-fun mapRes!39001 () Bool)

(assert (=> mapIsEmpty!39001 mapRes!39001))

(declare-fun mapNonEmpty!39001 () Bool)

(declare-fun tp!74807 () Bool)

(declare-fun e!602544 () Bool)

(assert (=> mapNonEmpty!39001 (= mapRes!39001 (and tp!74807 e!602544))))

(declare-fun mapValue!39001 () ValueCell!11747)

(declare-fun mapRest!39001 () (Array (_ BitVec 32) ValueCell!11747))

(declare-fun mapKey!39001 () (_ BitVec 32))

(assert (=> mapNonEmpty!39001 (= (arr!32128 _values!955) (store mapRest!39001 mapKey!39001 mapValue!39001))))

(declare-fun b!1058921 () Bool)

(declare-fun tp_is_empty!24901 () Bool)

(assert (=> b!1058921 (= e!602544 tp_is_empty!24901)))

(declare-fun b!1058922 () Bool)

(declare-fun e!602545 () Bool)

(assert (=> b!1058922 (= e!602547 (and e!602545 mapRes!39001))))

(declare-fun condMapEmpty!39001 () Bool)

(declare-fun mapDefault!39001 () ValueCell!11747)

