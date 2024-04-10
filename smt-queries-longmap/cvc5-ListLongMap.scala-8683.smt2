; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105496 () Bool)

(assert start!105496)

(declare-fun b_free!27133 () Bool)

(declare-fun b_next!27133 () Bool)

(assert (=> start!105496 (= b_free!27133 (not b_next!27133))))

(declare-fun tp!94916 () Bool)

(declare-fun b_and!44989 () Bool)

(assert (=> start!105496 (= tp!94916 b_and!44989)))

(declare-fun b!1256869 () Bool)

(declare-fun res!837862 () Bool)

(declare-fun e!714592 () Bool)

(assert (=> b!1256869 (=> (not res!837862) (not e!714592))))

(declare-datatypes ((array!81708 0))(
  ( (array!81709 (arr!39412 (Array (_ BitVec 32) (_ BitVec 64))) (size!39948 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81708)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81708 (_ BitVec 32)) Bool)

(assert (=> b!1256869 (= res!837862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49840 () Bool)

(declare-fun mapRes!49840 () Bool)

(assert (=> mapIsEmpty!49840 mapRes!49840))

(declare-fun b!1256870 () Bool)

(declare-fun res!837860 () Bool)

(assert (=> b!1256870 (=> (not res!837860) (not e!714592))))

(declare-datatypes ((List!27990 0))(
  ( (Nil!27987) (Cons!27986 (h!29195 (_ BitVec 64)) (t!41479 List!27990)) )
))
(declare-fun arrayNoDuplicates!0 (array!81708 (_ BitVec 32) List!27990) Bool)

(assert (=> b!1256870 (= res!837860 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27987))))

(declare-fun b!1256871 () Bool)

(declare-fun e!714594 () Bool)

(declare-fun e!714596 () Bool)

(assert (=> b!1256871 (= e!714594 (and e!714596 mapRes!49840))))

(declare-fun condMapEmpty!49840 () Bool)

(declare-datatypes ((V!48079 0))(
  ( (V!48080 (val!16080 Int)) )
))
(declare-datatypes ((ValueCell!15254 0))(
  ( (ValueCellFull!15254 (v!18781 V!48079)) (EmptyCell!15254) )
))
(declare-datatypes ((array!81710 0))(
  ( (array!81711 (arr!39413 (Array (_ BitVec 32) ValueCell!15254)) (size!39949 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81710)

(declare-fun mapDefault!49840 () ValueCell!15254)

