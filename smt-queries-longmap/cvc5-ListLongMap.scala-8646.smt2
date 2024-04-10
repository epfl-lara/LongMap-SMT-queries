; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105194 () Bool)

(assert start!105194)

(declare-fun b_free!26911 () Bool)

(declare-fun b_next!26911 () Bool)

(assert (=> start!105194 (= b_free!26911 (not b_next!26911))))

(declare-fun tp!94238 () Bool)

(declare-fun b_and!44725 () Bool)

(assert (=> start!105194 (= tp!94238 b_and!44725)))

(declare-fun b!1253557 () Bool)

(declare-fun res!835903 () Bool)

(declare-fun e!712162 () Bool)

(assert (=> b!1253557 (=> (not res!835903) (not e!712162))))

(declare-datatypes ((array!81284 0))(
  ( (array!81285 (arr!39204 (Array (_ BitVec 32) (_ BitVec 64))) (size!39740 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81284)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81284 (_ BitVec 32)) Bool)

(assert (=> b!1253557 (= res!835903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253558 () Bool)

(declare-fun e!712167 () Bool)

(declare-fun e!712164 () Bool)

(declare-fun mapRes!49495 () Bool)

(assert (=> b!1253558 (= e!712167 (and e!712164 mapRes!49495))))

(declare-fun condMapEmpty!49495 () Bool)

(declare-datatypes ((V!47783 0))(
  ( (V!47784 (val!15969 Int)) )
))
(declare-datatypes ((ValueCell!15143 0))(
  ( (ValueCellFull!15143 (v!18667 V!47783)) (EmptyCell!15143) )
))
(declare-datatypes ((array!81286 0))(
  ( (array!81287 (arr!39205 (Array (_ BitVec 32) ValueCell!15143)) (size!39741 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81286)

(declare-fun mapDefault!49495 () ValueCell!15143)

