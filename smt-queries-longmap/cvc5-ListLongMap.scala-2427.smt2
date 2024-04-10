; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38320 () Bool)

(assert start!38320)

(declare-fun b!395227 () Bool)

(declare-fun e!239290 () Bool)

(declare-fun tp_is_empty!9799 () Bool)

(assert (=> b!395227 (= e!239290 tp_is_empty!9799)))

(declare-fun b!395228 () Bool)

(declare-fun res!226569 () Bool)

(declare-fun e!239289 () Bool)

(assert (=> b!395228 (=> (not res!226569) (not e!239289))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395228 (= res!226569 (validKeyInArray!0 k!794))))

(declare-fun b!395229 () Bool)

(declare-fun res!226568 () Bool)

(assert (=> b!395229 (=> (not res!226568) (not e!239289))))

(declare-datatypes ((array!23503 0))(
  ( (array!23504 (arr!11205 (Array (_ BitVec 32) (_ BitVec 64))) (size!11557 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23503)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23503 (_ BitVec 32)) Bool)

(assert (=> b!395229 (= res!226568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395230 () Bool)

(declare-fun res!226571 () Bool)

(assert (=> b!395230 (=> (not res!226571) (not e!239289))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14171 0))(
  ( (V!14172 (val!4944 Int)) )
))
(declare-datatypes ((ValueCell!4556 0))(
  ( (ValueCellFull!4556 (v!7190 V!14171)) (EmptyCell!4556) )
))
(declare-datatypes ((array!23505 0))(
  ( (array!23506 (arr!11206 (Array (_ BitVec 32) ValueCell!4556)) (size!11558 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23505)

(assert (=> b!395230 (= res!226571 (and (= (size!11558 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11557 _keys!709) (size!11558 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!226573 () Bool)

(assert (=> start!38320 (=> (not res!226573) (not e!239289))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38320 (= res!226573 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11557 _keys!709))))))

(assert (=> start!38320 e!239289))

(assert (=> start!38320 true))

(declare-fun e!239286 () Bool)

(declare-fun array_inv!8224 (array!23505) Bool)

(assert (=> start!38320 (and (array_inv!8224 _values!549) e!239286)))

(declare-fun array_inv!8225 (array!23503) Bool)

(assert (=> start!38320 (array_inv!8225 _keys!709)))

(declare-fun b!395231 () Bool)

(declare-fun res!226572 () Bool)

(assert (=> b!395231 (=> (not res!226572) (not e!239289))))

(declare-datatypes ((List!6506 0))(
  ( (Nil!6503) (Cons!6502 (h!7358 (_ BitVec 64)) (t!11680 List!6506)) )
))
(declare-fun arrayNoDuplicates!0 (array!23503 (_ BitVec 32) List!6506) Bool)

(assert (=> b!395231 (= res!226572 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6503))))

(declare-fun mapIsEmpty!16308 () Bool)

(declare-fun mapRes!16308 () Bool)

(assert (=> mapIsEmpty!16308 mapRes!16308))

(declare-fun b!395232 () Bool)

(declare-fun res!226567 () Bool)

(assert (=> b!395232 (=> (not res!226567) (not e!239289))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395232 (= res!226567 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11557 _keys!709))))))

(declare-fun b!395233 () Bool)

(declare-fun e!239287 () Bool)

(assert (=> b!395233 (= e!239287 tp_is_empty!9799)))

(declare-fun b!395234 () Bool)

(declare-fun res!226570 () Bool)

(assert (=> b!395234 (=> (not res!226570) (not e!239289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395234 (= res!226570 (validMask!0 mask!1025))))

(declare-fun b!395235 () Bool)

(assert (=> b!395235 (= e!239286 (and e!239290 mapRes!16308))))

(declare-fun condMapEmpty!16308 () Bool)

(declare-fun mapDefault!16308 () ValueCell!4556)

