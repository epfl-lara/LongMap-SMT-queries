; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108408 () Bool)

(assert start!108408)

(declare-fun b_free!27955 () Bool)

(declare-fun b_next!27955 () Bool)

(assert (=> start!108408 (= b_free!27955 (not b_next!27955))))

(declare-fun tp!98975 () Bool)

(declare-fun b_and!46015 () Bool)

(assert (=> start!108408 (= tp!98975 b_and!46015)))

(declare-fun b!1279464 () Bool)

(declare-fun res!849926 () Bool)

(declare-fun e!731029 () Bool)

(assert (=> b!1279464 (=> (not res!849926) (not e!731029))))

(declare-datatypes ((array!84276 0))(
  ( (array!84277 (arr!40642 (Array (_ BitVec 32) (_ BitVec 64))) (size!41192 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84276)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84276 (_ BitVec 32)) Bool)

(assert (=> b!1279464 (= res!849926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279465 () Bool)

(declare-fun e!731026 () Bool)

(declare-fun tp_is_empty!33595 () Bool)

(assert (=> b!1279465 (= e!731026 tp_is_empty!33595)))

(declare-fun mapNonEmpty!51944 () Bool)

(declare-fun mapRes!51944 () Bool)

(declare-fun tp!98974 () Bool)

(declare-fun e!731030 () Bool)

(assert (=> mapNonEmpty!51944 (= mapRes!51944 (and tp!98974 e!731030))))

(declare-datatypes ((V!49897 0))(
  ( (V!49898 (val!16872 Int)) )
))
(declare-datatypes ((ValueCell!15899 0))(
  ( (ValueCellFull!15899 (v!19472 V!49897)) (EmptyCell!15899) )
))
(declare-fun mapValue!51944 () ValueCell!15899)

(declare-fun mapRest!51944 () (Array (_ BitVec 32) ValueCell!15899))

(declare-datatypes ((array!84278 0))(
  ( (array!84279 (arr!40643 (Array (_ BitVec 32) ValueCell!15899)) (size!41193 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84278)

(declare-fun mapKey!51944 () (_ BitVec 32))

(assert (=> mapNonEmpty!51944 (= (arr!40643 _values!1445) (store mapRest!51944 mapKey!51944 mapValue!51944))))

(declare-fun b!1279466 () Bool)

(declare-fun res!849923 () Bool)

(assert (=> b!1279466 (=> (not res!849923) (not e!731029))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279466 (= res!849923 (and (= (size!41193 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41192 _keys!1741) (size!41193 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279467 () Bool)

(declare-fun e!731027 () Bool)

(assert (=> b!1279467 (= e!731027 (and e!731026 mapRes!51944))))

(declare-fun condMapEmpty!51944 () Bool)

(declare-fun mapDefault!51944 () ValueCell!15899)

