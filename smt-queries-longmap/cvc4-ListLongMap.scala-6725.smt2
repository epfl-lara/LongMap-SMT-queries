; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84326 () Bool)

(assert start!84326)

(declare-fun b!986434 () Bool)

(declare-fun res!659990 () Bool)

(declare-fun e!556182 () Bool)

(assert (=> b!986434 (=> (not res!659990) (not e!556182))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35821 0))(
  ( (V!35822 (val!11615 Int)) )
))
(declare-datatypes ((ValueCell!11083 0))(
  ( (ValueCellFull!11083 (v!14177 V!35821)) (EmptyCell!11083) )
))
(declare-datatypes ((array!62225 0))(
  ( (array!62226 (arr!29970 (Array (_ BitVec 32) ValueCell!11083)) (size!30449 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62225)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62227 0))(
  ( (array!62228 (arr!29971 (Array (_ BitVec 32) (_ BitVec 64))) (size!30450 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62227)

(assert (=> b!986434 (= res!659990 (and (= (size!30449 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30450 _keys!1544) (size!30449 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986435 () Bool)

(declare-fun e!556178 () Bool)

(declare-fun e!556180 () Bool)

(declare-fun mapRes!36722 () Bool)

(assert (=> b!986435 (= e!556178 (and e!556180 mapRes!36722))))

(declare-fun condMapEmpty!36722 () Bool)

(declare-fun mapDefault!36722 () ValueCell!11083)

