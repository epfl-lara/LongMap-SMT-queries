; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94616 () Bool)

(assert start!94616)

(declare-fun b_free!21899 () Bool)

(declare-fun b_next!21899 () Bool)

(assert (=> start!94616 (= b_free!21899 (not b_next!21899))))

(declare-fun tp!77149 () Bool)

(declare-fun b_and!34711 () Bool)

(assert (=> start!94616 (= tp!77149 b_and!34711)))

(declare-fun b!1069827 () Bool)

(declare-fun res!713773 () Bool)

(declare-fun e!610599 () Bool)

(assert (=> b!1069827 (=> (not res!713773) (not e!610599))))

(declare-datatypes ((array!68395 0))(
  ( (array!68396 (arr!32895 (Array (_ BitVec 32) (_ BitVec 64))) (size!33431 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68395)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68395 (_ BitVec 32)) Bool)

(assert (=> b!1069827 (= res!713773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!713772 () Bool)

(assert (=> start!94616 (=> (not res!713772) (not e!610599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94616 (= res!713772 (validMask!0 mask!1515))))

(assert (=> start!94616 e!610599))

(assert (=> start!94616 true))

(declare-fun tp_is_empty!25709 () Bool)

(assert (=> start!94616 tp_is_empty!25709))

(declare-datatypes ((V!39413 0))(
  ( (V!39414 (val!12905 Int)) )
))
(declare-datatypes ((ValueCell!12151 0))(
  ( (ValueCellFull!12151 (v!15521 V!39413)) (EmptyCell!12151) )
))
(declare-datatypes ((array!68397 0))(
  ( (array!68398 (arr!32896 (Array (_ BitVec 32) ValueCell!12151)) (size!33432 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68397)

(declare-fun e!610598 () Bool)

(declare-fun array_inv!25450 (array!68397) Bool)

(assert (=> start!94616 (and (array_inv!25450 _values!955) e!610598)))

(assert (=> start!94616 tp!77149))

(declare-fun array_inv!25451 (array!68395) Bool)

(assert (=> start!94616 (array_inv!25451 _keys!1163)))

(declare-fun b!1069828 () Bool)

(declare-fun e!610601 () Bool)

(assert (=> b!1069828 (= e!610601 tp_is_empty!25709)))

(declare-fun b!1069829 () Bool)

(declare-fun mapRes!40264 () Bool)

(assert (=> b!1069829 (= e!610598 (and e!610601 mapRes!40264))))

(declare-fun condMapEmpty!40264 () Bool)

(declare-fun mapDefault!40264 () ValueCell!12151)

