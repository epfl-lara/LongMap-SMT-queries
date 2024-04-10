; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106936 () Bool)

(assert start!106936)

(declare-fun b!1268227 () Bool)

(declare-fun e!722629 () Bool)

(declare-fun tp_is_empty!32647 () Bool)

(assert (=> b!1268227 (= e!722629 tp_is_empty!32647)))

(declare-fun b!1268228 () Bool)

(declare-fun res!844128 () Bool)

(declare-fun e!722625 () Bool)

(assert (=> b!1268228 (=> (not res!844128) (not e!722625))))

(declare-datatypes ((array!82564 0))(
  ( (array!82565 (arr!39821 (Array (_ BitVec 32) (_ BitVec 64))) (size!40357 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82564)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82564 (_ BitVec 32)) Bool)

(assert (=> b!1268228 (= res!844128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268229 () Bool)

(declare-fun res!844125 () Bool)

(assert (=> b!1268229 (=> (not res!844125) (not e!722625))))

(assert (=> b!1268229 (= res!844125 (and (bvsle #b00000000000000000000000000000000 (size!40357 _keys!1364)) (bvslt (size!40357 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!50545 () Bool)

(declare-fun mapRes!50545 () Bool)

(assert (=> mapIsEmpty!50545 mapRes!50545))

(declare-fun b!1268230 () Bool)

(declare-fun e!722626 () Bool)

(assert (=> b!1268230 (= e!722626 (and e!722629 mapRes!50545))))

(declare-fun condMapEmpty!50545 () Bool)

(declare-datatypes ((V!48723 0))(
  ( (V!48724 (val!16398 Int)) )
))
(declare-datatypes ((ValueCell!15470 0))(
  ( (ValueCellFull!15470 (v!19034 V!48723)) (EmptyCell!15470) )
))
(declare-datatypes ((array!82566 0))(
  ( (array!82567 (arr!39822 (Array (_ BitVec 32) ValueCell!15470)) (size!40358 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82566)

(declare-fun mapDefault!50545 () ValueCell!15470)

