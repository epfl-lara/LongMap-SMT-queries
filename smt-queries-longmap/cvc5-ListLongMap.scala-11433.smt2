; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133374 () Bool)

(assert start!133374)

(declare-fun res!1066348 () Bool)

(declare-fun e!868863 () Bool)

(assert (=> start!133374 (=> (not res!1066348) (not e!868863))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133374 (= res!1066348 (validMask!0 mask!947))))

(assert (=> start!133374 e!868863))

(assert (=> start!133374 true))

(declare-datatypes ((V!59513 0))(
  ( (V!59514 (val!19323 Int)) )
))
(declare-datatypes ((ValueCell!18209 0))(
  ( (ValueCellFull!18209 (v!22074 V!59513)) (EmptyCell!18209) )
))
(declare-datatypes ((array!103682 0))(
  ( (array!103683 (arr!50035 (Array (_ BitVec 32) ValueCell!18209)) (size!50585 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103682)

(declare-fun e!868861 () Bool)

(declare-fun array_inv!38895 (array!103682) Bool)

(assert (=> start!133374 (and (array_inv!38895 _values!487) e!868861)))

(declare-datatypes ((array!103684 0))(
  ( (array!103685 (arr!50036 (Array (_ BitVec 32) (_ BitVec 64))) (size!50586 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103684)

(declare-fun array_inv!38896 (array!103684) Bool)

(assert (=> start!133374 (array_inv!38896 _keys!637)))

(declare-fun b!1559366 () Bool)

(declare-fun res!1066351 () Bool)

(assert (=> b!1559366 (=> (not res!1066351) (not e!868863))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559366 (= res!1066351 (and (= (size!50585 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50586 _keys!637) (size!50585 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559367 () Bool)

(declare-fun res!1066349 () Bool)

(assert (=> b!1559367 (=> (not res!1066349) (not e!868863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103684 (_ BitVec 32)) Bool)

(assert (=> b!1559367 (= res!1066349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559368 () Bool)

(declare-fun res!1066350 () Bool)

(assert (=> b!1559368 (=> (not res!1066350) (not e!868863))))

(assert (=> b!1559368 (= res!1066350 (and (bvsle #b00000000000000000000000000000000 (size!50586 _keys!637)) (bvslt (size!50586 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1559369 () Bool)

(declare-fun e!868865 () Bool)

(declare-fun mapRes!59088 () Bool)

(assert (=> b!1559369 (= e!868861 (and e!868865 mapRes!59088))))

(declare-fun condMapEmpty!59088 () Bool)

(declare-fun mapDefault!59088 () ValueCell!18209)

