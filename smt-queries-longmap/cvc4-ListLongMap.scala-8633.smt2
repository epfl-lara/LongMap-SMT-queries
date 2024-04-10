; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105104 () Bool)

(assert start!105104)

(declare-fun b_free!26837 () Bool)

(declare-fun b_next!26837 () Bool)

(assert (=> start!105104 (= b_free!26837 (not b_next!26837))))

(declare-fun tp!94013 () Bool)

(declare-fun b_and!44641 () Bool)

(assert (=> start!105104 (= tp!94013 b_and!44641)))

(declare-fun b!1252512 () Bool)

(declare-fun res!835278 () Bool)

(declare-fun e!711394 () Bool)

(assert (=> b!1252512 (=> (not res!835278) (not e!711394))))

(declare-datatypes ((array!81140 0))(
  ( (array!81141 (arr!39133 (Array (_ BitVec 32) (_ BitVec 64))) (size!39669 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81140)

(declare-datatypes ((List!27784 0))(
  ( (Nil!27781) (Cons!27780 (h!28989 (_ BitVec 64)) (t!41263 List!27784)) )
))
(declare-fun arrayNoDuplicates!0 (array!81140 (_ BitVec 32) List!27784) Bool)

(assert (=> b!1252512 (= res!835278 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27781))))

(declare-fun b!1252513 () Bool)

(declare-fun e!711393 () Bool)

(declare-fun tp_is_empty!31739 () Bool)

(assert (=> b!1252513 (= e!711393 tp_is_empty!31739)))

(declare-fun b!1252514 () Bool)

(declare-fun e!711398 () Bool)

(assert (=> b!1252514 (= e!711398 tp_is_empty!31739)))

(declare-fun b!1252515 () Bool)

(declare-fun res!835281 () Bool)

(assert (=> b!1252515 (=> (not res!835281) (not e!711394))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81140 (_ BitVec 32)) Bool)

(assert (=> b!1252515 (= res!835281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252517 () Bool)

(declare-fun e!711396 () Bool)

(declare-fun mapRes!49381 () Bool)

(assert (=> b!1252517 (= e!711396 (and e!711398 mapRes!49381))))

(declare-fun condMapEmpty!49381 () Bool)

(declare-datatypes ((V!47683 0))(
  ( (V!47684 (val!15932 Int)) )
))
(declare-datatypes ((ValueCell!15106 0))(
  ( (ValueCellFull!15106 (v!18630 V!47683)) (EmptyCell!15106) )
))
(declare-datatypes ((array!81142 0))(
  ( (array!81143 (arr!39134 (Array (_ BitVec 32) ValueCell!15106)) (size!39670 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81142)

(declare-fun mapDefault!49381 () ValueCell!15106)

