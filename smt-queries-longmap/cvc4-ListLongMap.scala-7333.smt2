; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93684 () Bool)

(assert start!93684)

(declare-fun b!1059833 () Bool)

(declare-fun e!603303 () Bool)

(declare-fun tp_is_empty!24989 () Bool)

(assert (=> b!1059833 (= e!603303 tp_is_empty!24989)))

(declare-fun b!1059834 () Bool)

(declare-fun e!603299 () Bool)

(assert (=> b!1059834 (= e!603299 tp_is_empty!24989)))

(declare-fun res!707925 () Bool)

(declare-fun e!603302 () Bool)

(assert (=> start!93684 (=> (not res!707925) (not e!603302))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93684 (= res!707925 (validMask!0 mask!1515))))

(assert (=> start!93684 e!603302))

(assert (=> start!93684 true))

(declare-datatypes ((V!38453 0))(
  ( (V!38454 (val!12545 Int)) )
))
(declare-datatypes ((ValueCell!11791 0))(
  ( (ValueCellFull!11791 (v!15155 V!38453)) (EmptyCell!11791) )
))
(declare-datatypes ((array!67001 0))(
  ( (array!67002 (arr!32210 (Array (_ BitVec 32) ValueCell!11791)) (size!32746 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67001)

(declare-fun e!603300 () Bool)

(declare-fun array_inv!24966 (array!67001) Bool)

(assert (=> start!93684 (and (array_inv!24966 _values!955) e!603300)))

(declare-datatypes ((array!67003 0))(
  ( (array!67004 (arr!32211 (Array (_ BitVec 32) (_ BitVec 64))) (size!32747 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67003)

(declare-fun array_inv!24967 (array!67003) Bool)

(assert (=> start!93684 (array_inv!24967 _keys!1163)))

(declare-fun mapNonEmpty!39148 () Bool)

(declare-fun mapRes!39148 () Bool)

(declare-fun tp!74954 () Bool)

(assert (=> mapNonEmpty!39148 (= mapRes!39148 (and tp!74954 e!603303))))

(declare-fun mapValue!39148 () ValueCell!11791)

(declare-fun mapKey!39148 () (_ BitVec 32))

(declare-fun mapRest!39148 () (Array (_ BitVec 32) ValueCell!11791))

(assert (=> mapNonEmpty!39148 (= (arr!32210 _values!955) (store mapRest!39148 mapKey!39148 mapValue!39148))))

(declare-fun b!1059835 () Bool)

(assert (=> b!1059835 (= e!603300 (and e!603299 mapRes!39148))))

(declare-fun condMapEmpty!39148 () Bool)

(declare-fun mapDefault!39148 () ValueCell!11791)

