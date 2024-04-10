; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7402 () Bool)

(assert start!7402)

(declare-fun b!47506 () Bool)

(declare-fun e!30432 () Bool)

(declare-fun tp_is_empty!2039 () Bool)

(assert (=> b!47506 (= e!30432 tp_is_empty!2039)))

(declare-fun mapIsEmpty!2102 () Bool)

(declare-fun mapRes!2102 () Bool)

(assert (=> mapIsEmpty!2102 mapRes!2102))

(declare-fun b!47507 () Bool)

(declare-fun res!27636 () Bool)

(declare-fun e!30429 () Bool)

(assert (=> b!47507 (=> (not res!27636) (not e!30429))))

(declare-datatypes ((array!3143 0))(
  ( (array!3144 (arr!1506 (Array (_ BitVec 32) (_ BitVec 64))) (size!1728 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3143)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3143 (_ BitVec 32)) Bool)

(assert (=> b!47507 (= res!27636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47508 () Bool)

(declare-fun e!30433 () Bool)

(declare-fun e!30430 () Bool)

(assert (=> b!47508 (= e!30433 (and e!30430 mapRes!2102))))

(declare-fun condMapEmpty!2102 () Bool)

(declare-datatypes ((V!2451 0))(
  ( (V!2452 (val!1058 Int)) )
))
(declare-datatypes ((ValueCell!730 0))(
  ( (ValueCellFull!730 (v!2119 V!2451)) (EmptyCell!730) )
))
(declare-datatypes ((array!3145 0))(
  ( (array!3146 (arr!1507 (Array (_ BitVec 32) ValueCell!730)) (size!1729 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3145)

(declare-fun mapDefault!2102 () ValueCell!730)

