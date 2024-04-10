; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84334 () Bool)

(assert start!84334)

(declare-fun b!986506 () Bool)

(declare-fun e!556240 () Bool)

(declare-fun e!556241 () Bool)

(declare-fun mapRes!36734 () Bool)

(assert (=> b!986506 (= e!556240 (and e!556241 mapRes!36734))))

(declare-fun condMapEmpty!36734 () Bool)

(declare-datatypes ((V!35833 0))(
  ( (V!35834 (val!11619 Int)) )
))
(declare-datatypes ((ValueCell!11087 0))(
  ( (ValueCellFull!11087 (v!14181 V!35833)) (EmptyCell!11087) )
))
(declare-datatypes ((array!62237 0))(
  ( (array!62238 (arr!29976 (Array (_ BitVec 32) ValueCell!11087)) (size!30455 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62237)

(declare-fun mapDefault!36734 () ValueCell!11087)

