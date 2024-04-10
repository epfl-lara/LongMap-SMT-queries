; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84310 () Bool)

(assert start!84310)

(declare-fun b!986290 () Bool)

(declare-fun e!556061 () Bool)

(assert (=> b!986290 (= e!556061 false)))

(declare-fun lt!437465 () Bool)

(declare-datatypes ((array!62193 0))(
  ( (array!62194 (arr!29954 (Array (_ BitVec 32) (_ BitVec 64))) (size!30433 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62193)

(declare-datatypes ((List!20736 0))(
  ( (Nil!20733) (Cons!20732 (h!21894 (_ BitVec 64)) (t!29635 List!20736)) )
))
(declare-fun arrayNoDuplicates!0 (array!62193 (_ BitVec 32) List!20736) Bool)

(assert (=> b!986290 (= lt!437465 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20733))))

(declare-fun b!986291 () Bool)

(declare-fun e!556058 () Bool)

(declare-fun tp_is_empty!23113 () Bool)

(assert (=> b!986291 (= e!556058 tp_is_empty!23113)))

(declare-fun res!659916 () Bool)

(assert (=> start!84310 (=> (not res!659916) (not e!556061))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84310 (= res!659916 (validMask!0 mask!1948))))

(assert (=> start!84310 e!556061))

(assert (=> start!84310 true))

(declare-datatypes ((V!35801 0))(
  ( (V!35802 (val!11607 Int)) )
))
(declare-datatypes ((ValueCell!11075 0))(
  ( (ValueCellFull!11075 (v!14169 V!35801)) (EmptyCell!11075) )
))
(declare-datatypes ((array!62195 0))(
  ( (array!62196 (arr!29955 (Array (_ BitVec 32) ValueCell!11075)) (size!30434 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62195)

(declare-fun e!556062 () Bool)

(declare-fun array_inv!23151 (array!62195) Bool)

(assert (=> start!84310 (and (array_inv!23151 _values!1278) e!556062)))

(declare-fun array_inv!23152 (array!62193) Bool)

(assert (=> start!84310 (array_inv!23152 _keys!1544)))

(declare-fun b!986292 () Bool)

(declare-fun res!659918 () Bool)

(assert (=> b!986292 (=> (not res!659918) (not e!556061))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986292 (= res!659918 (and (= (size!30434 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30433 _keys!1544) (size!30434 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986293 () Bool)

(declare-fun mapRes!36698 () Bool)

(assert (=> b!986293 (= e!556062 (and e!556058 mapRes!36698))))

(declare-fun condMapEmpty!36698 () Bool)

(declare-fun mapDefault!36698 () ValueCell!11075)

