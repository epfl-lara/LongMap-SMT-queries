; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94436 () Bool)

(assert start!94436)

(declare-fun b_free!21763 () Bool)

(declare-fun b_next!21763 () Bool)

(assert (=> start!94436 (= b_free!21763 (not b_next!21763))))

(declare-fun tp!76736 () Bool)

(declare-fun b_and!34555 () Bool)

(assert (=> start!94436 (= tp!76736 b_and!34555)))

(declare-fun res!712551 () Bool)

(declare-fun e!609098 () Bool)

(assert (=> start!94436 (=> (not res!712551) (not e!609098))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94436 (= res!712551 (validMask!0 mask!1515))))

(assert (=> start!94436 e!609098))

(assert (=> start!94436 true))

(declare-fun tp_is_empty!25573 () Bool)

(assert (=> start!94436 tp_is_empty!25573))

(declare-datatypes ((V!39233 0))(
  ( (V!39234 (val!12837 Int)) )
))
(declare-datatypes ((ValueCell!12083 0))(
  ( (ValueCellFull!12083 (v!15451 V!39233)) (EmptyCell!12083) )
))
(declare-datatypes ((array!68129 0))(
  ( (array!68130 (arr!32764 (Array (_ BitVec 32) ValueCell!12083)) (size!33300 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68129)

(declare-fun e!609097 () Bool)

(declare-fun array_inv!25366 (array!68129) Bool)

(assert (=> start!94436 (and (array_inv!25366 _values!955) e!609097)))

(assert (=> start!94436 tp!76736))

(declare-datatypes ((array!68131 0))(
  ( (array!68132 (arr!32765 (Array (_ BitVec 32) (_ BitVec 64))) (size!33301 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68131)

(declare-fun array_inv!25367 (array!68131) Bool)

(assert (=> start!94436 (array_inv!25367 _keys!1163)))

(declare-fun b!1067801 () Bool)

(declare-fun e!609099 () Bool)

(assert (=> b!1067801 (= e!609099 tp_is_empty!25573)))

(declare-fun b!1067802 () Bool)

(declare-fun mapRes!40054 () Bool)

(assert (=> b!1067802 (= e!609097 (and e!609099 mapRes!40054))))

(declare-fun condMapEmpty!40054 () Bool)

(declare-fun mapDefault!40054 () ValueCell!12083)

