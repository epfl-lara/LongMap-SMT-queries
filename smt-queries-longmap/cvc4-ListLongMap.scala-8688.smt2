; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105552 () Bool)

(assert start!105552)

(declare-fun b_free!27167 () Bool)

(declare-fun b_next!27167 () Bool)

(assert (=> start!105552 (= b_free!27167 (not b_next!27167))))

(declare-fun tp!95020 () Bool)

(declare-fun b_and!45033 () Bool)

(assert (=> start!105552 (= tp!95020 b_and!45033)))

(declare-fun b!1257469 () Bool)

(declare-fun res!838211 () Bool)

(declare-fun e!715033 () Bool)

(assert (=> b!1257469 (=> (not res!838211) (not e!715033))))

(declare-datatypes ((array!81774 0))(
  ( (array!81775 (arr!39444 (Array (_ BitVec 32) (_ BitVec 64))) (size!39980 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81774)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81774 (_ BitVec 32)) Bool)

(assert (=> b!1257469 (= res!838211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257470 () Bool)

(declare-fun e!715032 () Bool)

(declare-fun tp_is_empty!32069 () Bool)

(assert (=> b!1257470 (= e!715032 tp_is_empty!32069)))

(declare-fun res!838212 () Bool)

(assert (=> start!105552 (=> (not res!838212) (not e!715033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105552 (= res!838212 (validMask!0 mask!1466))))

(assert (=> start!105552 e!715033))

(assert (=> start!105552 true))

(assert (=> start!105552 tp!95020))

(assert (=> start!105552 tp_is_empty!32069))

(declare-fun array_inv!30047 (array!81774) Bool)

(assert (=> start!105552 (array_inv!30047 _keys!1118)))

(declare-datatypes ((V!48123 0))(
  ( (V!48124 (val!16097 Int)) )
))
(declare-datatypes ((ValueCell!15271 0))(
  ( (ValueCellFull!15271 (v!18799 V!48123)) (EmptyCell!15271) )
))
(declare-datatypes ((array!81776 0))(
  ( (array!81777 (arr!39445 (Array (_ BitVec 32) ValueCell!15271)) (size!39981 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81776)

(declare-fun e!715034 () Bool)

(declare-fun array_inv!30048 (array!81776) Bool)

(assert (=> start!105552 (and (array_inv!30048 _values!914) e!715034)))

(declare-fun b!1257471 () Bool)

(declare-fun e!715035 () Bool)

(assert (=> b!1257471 (= e!715035 tp_is_empty!32069)))

(declare-fun b!1257472 () Bool)

(declare-fun res!838210 () Bool)

(assert (=> b!1257472 (=> (not res!838210) (not e!715033))))

(declare-datatypes ((List!28013 0))(
  ( (Nil!28010) (Cons!28009 (h!29218 (_ BitVec 64)) (t!41504 List!28013)) )
))
(declare-fun arrayNoDuplicates!0 (array!81774 (_ BitVec 32) List!28013) Bool)

(assert (=> b!1257472 (= res!838210 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28010))))

(declare-fun b!1257473 () Bool)

(declare-fun res!838213 () Bool)

(assert (=> b!1257473 (=> (not res!838213) (not e!715033))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257473 (= res!838213 (and (= (size!39981 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39980 _keys!1118) (size!39981 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257474 () Bool)

(declare-fun mapRes!49894 () Bool)

(assert (=> b!1257474 (= e!715034 (and e!715032 mapRes!49894))))

(declare-fun condMapEmpty!49894 () Bool)

(declare-fun mapDefault!49894 () ValueCell!15271)

