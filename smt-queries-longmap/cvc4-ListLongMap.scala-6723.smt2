; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84314 () Bool)

(assert start!84314)

(declare-fun mapNonEmpty!36704 () Bool)

(declare-fun mapRes!36704 () Bool)

(declare-fun tp!69559 () Bool)

(declare-fun e!556089 () Bool)

(assert (=> mapNonEmpty!36704 (= mapRes!36704 (and tp!69559 e!556089))))

(declare-datatypes ((V!35805 0))(
  ( (V!35806 (val!11609 Int)) )
))
(declare-datatypes ((ValueCell!11077 0))(
  ( (ValueCellFull!11077 (v!14171 V!35805)) (EmptyCell!11077) )
))
(declare-fun mapRest!36704 () (Array (_ BitVec 32) ValueCell!11077))

(declare-datatypes ((array!62201 0))(
  ( (array!62202 (arr!29958 (Array (_ BitVec 32) ValueCell!11077)) (size!30437 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62201)

(declare-fun mapValue!36704 () ValueCell!11077)

(declare-fun mapKey!36704 () (_ BitVec 32))

(assert (=> mapNonEmpty!36704 (= (arr!29958 _values!1278) (store mapRest!36704 mapKey!36704 mapValue!36704))))

(declare-fun b!986326 () Bool)

(declare-fun e!556091 () Bool)

(assert (=> b!986326 (= e!556091 false)))

(declare-fun lt!437471 () Bool)

(declare-datatypes ((array!62203 0))(
  ( (array!62204 (arr!29959 (Array (_ BitVec 32) (_ BitVec 64))) (size!30438 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62203)

(declare-datatypes ((List!20738 0))(
  ( (Nil!20735) (Cons!20734 (h!21896 (_ BitVec 64)) (t!29637 List!20738)) )
))
(declare-fun arrayNoDuplicates!0 (array!62203 (_ BitVec 32) List!20738) Bool)

(assert (=> b!986326 (= lt!437471 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20735))))

(declare-fun b!986327 () Bool)

(declare-fun res!659936 () Bool)

(assert (=> b!986327 (=> (not res!659936) (not e!556091))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986327 (= res!659936 (and (= (size!30437 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30438 _keys!1544) (size!30437 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659935 () Bool)

(assert (=> start!84314 (=> (not res!659935) (not e!556091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84314 (= res!659935 (validMask!0 mask!1948))))

(assert (=> start!84314 e!556091))

(assert (=> start!84314 true))

(declare-fun e!556090 () Bool)

(declare-fun array_inv!23155 (array!62201) Bool)

(assert (=> start!84314 (and (array_inv!23155 _values!1278) e!556090)))

(declare-fun array_inv!23156 (array!62203) Bool)

(assert (=> start!84314 (array_inv!23156 _keys!1544)))

(declare-fun b!986328 () Bool)

(declare-fun e!556088 () Bool)

(declare-fun tp_is_empty!23117 () Bool)

(assert (=> b!986328 (= e!556088 tp_is_empty!23117)))

(declare-fun b!986329 () Bool)

(assert (=> b!986329 (= e!556089 tp_is_empty!23117)))

(declare-fun mapIsEmpty!36704 () Bool)

(assert (=> mapIsEmpty!36704 mapRes!36704))

(declare-fun b!986330 () Bool)

(assert (=> b!986330 (= e!556090 (and e!556088 mapRes!36704))))

(declare-fun condMapEmpty!36704 () Bool)

(declare-fun mapDefault!36704 () ValueCell!11077)

