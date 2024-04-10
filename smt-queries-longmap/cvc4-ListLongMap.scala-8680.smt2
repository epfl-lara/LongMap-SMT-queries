; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105482 () Bool)

(assert start!105482)

(declare-fun b_free!27119 () Bool)

(declare-fun b_next!27119 () Bool)

(assert (=> start!105482 (= b_free!27119 (not b_next!27119))))

(declare-fun tp!94873 () Bool)

(declare-fun b_and!44975 () Bool)

(assert (=> start!105482 (= tp!94873 b_and!44975)))

(declare-fun b!1256681 () Bool)

(declare-fun res!837736 () Bool)

(declare-fun e!714450 () Bool)

(assert (=> b!1256681 (=> (not res!837736) (not e!714450))))

(declare-datatypes ((array!81680 0))(
  ( (array!81681 (arr!39398 (Array (_ BitVec 32) (_ BitVec 64))) (size!39934 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81680)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81680 (_ BitVec 32)) Bool)

(assert (=> b!1256681 (= res!837736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256682 () Bool)

(declare-fun e!714448 () Bool)

(declare-fun tp_is_empty!32021 () Bool)

(assert (=> b!1256682 (= e!714448 tp_is_empty!32021)))

(declare-fun b!1256683 () Bool)

(declare-fun e!714447 () Bool)

(declare-fun e!714445 () Bool)

(declare-fun mapRes!49819 () Bool)

(assert (=> b!1256683 (= e!714447 (and e!714445 mapRes!49819))))

(declare-fun condMapEmpty!49819 () Bool)

(declare-datatypes ((V!48059 0))(
  ( (V!48060 (val!16073 Int)) )
))
(declare-datatypes ((ValueCell!15247 0))(
  ( (ValueCellFull!15247 (v!18774 V!48059)) (EmptyCell!15247) )
))
(declare-datatypes ((array!81682 0))(
  ( (array!81683 (arr!39399 (Array (_ BitVec 32) ValueCell!15247)) (size!39935 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81682)

(declare-fun mapDefault!49819 () ValueCell!15247)

