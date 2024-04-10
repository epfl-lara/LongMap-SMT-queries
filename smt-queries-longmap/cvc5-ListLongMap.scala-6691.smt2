; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84118 () Bool)

(assert start!84118)

(declare-fun b!983554 () Bool)

(declare-fun res!658154 () Bool)

(declare-fun e!554456 () Bool)

(assert (=> b!983554 (=> (not res!658154) (not e!554456))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61829 0))(
  ( (array!61830 (arr!29772 (Array (_ BitVec 32) (_ BitVec 64))) (size!30251 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61829)

(declare-datatypes ((V!35545 0))(
  ( (V!35546 (val!11511 Int)) )
))
(declare-datatypes ((ValueCell!10979 0))(
  ( (ValueCellFull!10979 (v!14073 V!35545)) (EmptyCell!10979) )
))
(declare-datatypes ((array!61831 0))(
  ( (array!61832 (arr!29773 (Array (_ BitVec 32) ValueCell!10979)) (size!30252 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61831)

(assert (=> b!983554 (= res!658154 (and (= (size!30252 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30251 _keys!1544) (size!30252 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983555 () Bool)

(declare-fun e!554459 () Bool)

(declare-fun tp_is_empty!22921 () Bool)

(assert (=> b!983555 (= e!554459 tp_is_empty!22921)))

(declare-fun res!658153 () Bool)

(assert (=> start!84118 (=> (not res!658153) (not e!554456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84118 (= res!658153 (validMask!0 mask!1948))))

(assert (=> start!84118 e!554456))

(assert (=> start!84118 true))

(declare-fun e!554460 () Bool)

(declare-fun array_inv!23021 (array!61831) Bool)

(assert (=> start!84118 (and (array_inv!23021 _values!1278) e!554460)))

(declare-fun array_inv!23022 (array!61829) Bool)

(assert (=> start!84118 (array_inv!23022 _keys!1544)))

(declare-fun b!983556 () Bool)

(assert (=> b!983556 (= e!554456 false)))

(declare-fun lt!436538 () Bool)

(declare-datatypes ((List!20616 0))(
  ( (Nil!20613) (Cons!20612 (h!21774 (_ BitVec 64)) (t!29407 List!20616)) )
))
(declare-fun arrayNoDuplicates!0 (array!61829 (_ BitVec 32) List!20616) Bool)

(assert (=> b!983556 (= lt!436538 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20613))))

(declare-fun mapNonEmpty!36410 () Bool)

(declare-fun mapRes!36410 () Bool)

(declare-fun tp!69094 () Bool)

(declare-fun e!554458 () Bool)

(assert (=> mapNonEmpty!36410 (= mapRes!36410 (and tp!69094 e!554458))))

(declare-fun mapKey!36410 () (_ BitVec 32))

(declare-fun mapRest!36410 () (Array (_ BitVec 32) ValueCell!10979))

(declare-fun mapValue!36410 () ValueCell!10979)

(assert (=> mapNonEmpty!36410 (= (arr!29773 _values!1278) (store mapRest!36410 mapKey!36410 mapValue!36410))))

(declare-fun mapIsEmpty!36410 () Bool)

(assert (=> mapIsEmpty!36410 mapRes!36410))

(declare-fun b!983557 () Bool)

(assert (=> b!983557 (= e!554460 (and e!554459 mapRes!36410))))

(declare-fun condMapEmpty!36410 () Bool)

(declare-fun mapDefault!36410 () ValueCell!10979)

