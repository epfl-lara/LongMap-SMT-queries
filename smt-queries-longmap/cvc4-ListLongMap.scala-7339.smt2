; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93730 () Bool)

(assert start!93730)

(declare-fun b_free!21215 () Bool)

(declare-fun b_next!21215 () Bool)

(assert (=> start!93730 (= b_free!21215 (not b_next!21215))))

(declare-fun tp!75065 () Bool)

(declare-fun b_and!33925 () Bool)

(assert (=> start!93730 (= tp!75065 b_and!33925)))

(declare-fun res!708155 () Bool)

(declare-fun e!603596 () Bool)

(assert (=> start!93730 (=> (not res!708155) (not e!603596))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93730 (= res!708155 (validMask!0 mask!1515))))

(assert (=> start!93730 e!603596))

(assert (=> start!93730 true))

(declare-fun tp_is_empty!25025 () Bool)

(assert (=> start!93730 tp_is_empty!25025))

(declare-datatypes ((V!38501 0))(
  ( (V!38502 (val!12563 Int)) )
))
(declare-datatypes ((ValueCell!11809 0))(
  ( (ValueCellFull!11809 (v!15173 V!38501)) (EmptyCell!11809) )
))
(declare-datatypes ((array!67071 0))(
  ( (array!67072 (arr!32244 (Array (_ BitVec 32) ValueCell!11809)) (size!32780 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67071)

(declare-fun e!603599 () Bool)

(declare-fun array_inv!24990 (array!67071) Bool)

(assert (=> start!93730 (and (array_inv!24990 _values!955) e!603599)))

(assert (=> start!93730 tp!75065))

(declare-datatypes ((array!67073 0))(
  ( (array!67074 (arr!32245 (Array (_ BitVec 32) (_ BitVec 64))) (size!32781 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67073)

(declare-fun array_inv!24991 (array!67073) Bool)

(assert (=> start!93730 (array_inv!24991 _keys!1163)))

(declare-fun mapIsEmpty!39205 () Bool)

(declare-fun mapRes!39205 () Bool)

(assert (=> mapIsEmpty!39205 mapRes!39205))

(declare-fun mapNonEmpty!39205 () Bool)

(declare-fun tp!75064 () Bool)

(declare-fun e!603598 () Bool)

(assert (=> mapNonEmpty!39205 (= mapRes!39205 (and tp!75064 e!603598))))

(declare-fun mapKey!39205 () (_ BitVec 32))

(declare-fun mapValue!39205 () ValueCell!11809)

(declare-fun mapRest!39205 () (Array (_ BitVec 32) ValueCell!11809))

(assert (=> mapNonEmpty!39205 (= (arr!32244 _values!955) (store mapRest!39205 mapKey!39205 mapValue!39205))))

(declare-fun b!1060246 () Bool)

(declare-fun e!603597 () Bool)

(assert (=> b!1060246 (= e!603597 tp_is_empty!25025)))

(declare-fun b!1060247 () Bool)

(declare-fun res!708154 () Bool)

(assert (=> b!1060247 (=> (not res!708154) (not e!603596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67073 (_ BitVec 32)) Bool)

(assert (=> b!1060247 (= res!708154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060248 () Bool)

(assert (=> b!1060248 (= e!603599 (and e!603597 mapRes!39205))))

(declare-fun condMapEmpty!39205 () Bool)

(declare-fun mapDefault!39205 () ValueCell!11809)

