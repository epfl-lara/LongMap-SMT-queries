; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3766 () Bool)

(assert start!3766)

(declare-fun b!26288 () Bool)

(declare-fun res!15619 () Bool)

(declare-fun e!17096 () Bool)

(assert (=> b!26288 (=> (not res!15619) (not e!17096))))

(declare-datatypes ((V!1275 0))(
  ( (V!1276 (val!570 Int)) )
))
(declare-datatypes ((ValueCell!344 0))(
  ( (ValueCellFull!344 (v!1656 V!1275)) (EmptyCell!344) )
))
(declare-datatypes ((array!1419 0))(
  ( (array!1420 (arr!667 (Array (_ BitVec 32) ValueCell!344)) (size!768 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1419)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1421 0))(
  ( (array!1422 (arr!668 (Array (_ BitVec 32) (_ BitVec 64))) (size!769 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1421)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26288 (= res!15619 (and (= (size!768 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!769 _keys!1833) (size!768 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1147 () Bool)

(declare-fun mapRes!1147 () Bool)

(assert (=> mapIsEmpty!1147 mapRes!1147))

(declare-fun b!26289 () Bool)

(assert (=> b!26289 (= e!17096 false)))

(declare-fun lt!10340 () Bool)

(declare-datatypes ((List!585 0))(
  ( (Nil!582) (Cons!581 (h!1148 (_ BitVec 64)) (t!3272 List!585)) )
))
(declare-fun arrayNoDuplicates!0 (array!1421 (_ BitVec 32) List!585) Bool)

(assert (=> b!26289 (= lt!10340 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!582))))

(declare-fun b!26290 () Bool)

(declare-fun e!17097 () Bool)

(declare-fun tp_is_empty!1087 () Bool)

(assert (=> b!26290 (= e!17097 tp_is_empty!1087)))

(declare-fun res!15620 () Bool)

(assert (=> start!3766 (=> (not res!15620) (not e!17096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3766 (= res!15620 (validMask!0 mask!2294))))

(assert (=> start!3766 e!17096))

(assert (=> start!3766 true))

(declare-fun e!17095 () Bool)

(declare-fun array_inv!453 (array!1419) Bool)

(assert (=> start!3766 (and (array_inv!453 _values!1501) e!17095)))

(declare-fun array_inv!454 (array!1421) Bool)

(assert (=> start!3766 (array_inv!454 _keys!1833)))

(declare-fun b!26291 () Bool)

(assert (=> b!26291 (= e!17095 (and e!17097 mapRes!1147))))

(declare-fun condMapEmpty!1147 () Bool)

(declare-fun mapDefault!1147 () ValueCell!344)

