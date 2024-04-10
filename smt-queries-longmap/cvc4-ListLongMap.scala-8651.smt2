; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105250 () Bool)

(assert start!105250)

(declare-fun b_free!26945 () Bool)

(declare-fun b_next!26945 () Bool)

(assert (=> start!105250 (= b_free!26945 (not b_next!26945))))

(declare-fun tp!94343 () Bool)

(declare-fun b_and!44771 () Bool)

(assert (=> start!105250 (= tp!94343 b_and!44771)))

(declare-fun b!1254149 () Bool)

(declare-fun res!836239 () Bool)

(declare-fun e!712587 () Bool)

(assert (=> b!1254149 (=> (not res!836239) (not e!712587))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81352 0))(
  ( (array!81353 (arr!39237 (Array (_ BitVec 32) (_ BitVec 64))) (size!39773 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81352)

(declare-datatypes ((V!47827 0))(
  ( (V!47828 (val!15986 Int)) )
))
(declare-datatypes ((ValueCell!15160 0))(
  ( (ValueCellFull!15160 (v!18685 V!47827)) (EmptyCell!15160) )
))
(declare-datatypes ((array!81354 0))(
  ( (array!81355 (arr!39238 (Array (_ BitVec 32) ValueCell!15160)) (size!39774 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81354)

(assert (=> b!1254149 (= res!836239 (and (= (size!39774 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39773 _keys!1118) (size!39774 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49549 () Bool)

(declare-fun mapRes!49549 () Bool)

(assert (=> mapIsEmpty!49549 mapRes!49549))

(declare-fun b!1254150 () Bool)

(declare-fun res!836240 () Bool)

(assert (=> b!1254150 (=> (not res!836240) (not e!712587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81352 (_ BitVec 32)) Bool)

(assert (=> b!1254150 (= res!836240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254151 () Bool)

(declare-fun e!712588 () Bool)

(declare-fun tp_is_empty!31847 () Bool)

(assert (=> b!1254151 (= e!712588 tp_is_empty!31847)))

(declare-fun res!836238 () Bool)

(assert (=> start!105250 (=> (not res!836238) (not e!712587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105250 (= res!836238 (validMask!0 mask!1466))))

(assert (=> start!105250 e!712587))

(assert (=> start!105250 true))

(assert (=> start!105250 tp!94343))

(assert (=> start!105250 tp_is_empty!31847))

(declare-fun array_inv!29913 (array!81352) Bool)

(assert (=> start!105250 (array_inv!29913 _keys!1118)))

(declare-fun e!712592 () Bool)

(declare-fun array_inv!29914 (array!81354) Bool)

(assert (=> start!105250 (and (array_inv!29914 _values!914) e!712592)))

(declare-fun b!1254152 () Bool)

(assert (=> b!1254152 (= e!712592 (and e!712588 mapRes!49549))))

(declare-fun condMapEmpty!49549 () Bool)

(declare-fun mapDefault!49549 () ValueCell!15160)

