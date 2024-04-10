; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83292 () Bool)

(assert start!83292)

(declare-fun b_free!19285 () Bool)

(declare-fun b_next!19285 () Bool)

(assert (=> start!83292 (= b_free!19285 (not b_next!19285))))

(declare-fun tp!67134 () Bool)

(declare-fun b_and!30791 () Bool)

(assert (=> start!83292 (= tp!67134 b_and!30791)))

(declare-fun b!972126 () Bool)

(declare-fun res!650695 () Bool)

(declare-fun e!547966 () Bool)

(assert (=> b!972126 (=> (not res!650695) (not e!547966))))

(declare-datatypes ((array!60413 0))(
  ( (array!60414 (arr!29070 (Array (_ BitVec 32) (_ BitVec 64))) (size!29549 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60413)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60413 (_ BitVec 32)) Bool)

(assert (=> b!972126 (= res!650695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972127 () Bool)

(declare-fun e!547964 () Bool)

(declare-fun tp_is_empty!22183 () Bool)

(assert (=> b!972127 (= e!547964 tp_is_empty!22183)))

(declare-fun b!972128 () Bool)

(declare-fun res!650694 () Bool)

(assert (=> b!972128 (=> (not res!650694) (not e!547966))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972128 (= res!650694 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29549 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29549 _keys!1717))))))

(declare-fun b!972129 () Bool)

(declare-fun e!547968 () Bool)

(declare-fun e!547967 () Bool)

(declare-fun mapRes!35284 () Bool)

(assert (=> b!972129 (= e!547968 (and e!547967 mapRes!35284))))

(declare-fun condMapEmpty!35284 () Bool)

(declare-datatypes ((V!34561 0))(
  ( (V!34562 (val!11142 Int)) )
))
(declare-datatypes ((ValueCell!10610 0))(
  ( (ValueCellFull!10610 (v!13701 V!34561)) (EmptyCell!10610) )
))
(declare-datatypes ((array!60415 0))(
  ( (array!60416 (arr!29071 (Array (_ BitVec 32) ValueCell!10610)) (size!29550 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60415)

(declare-fun mapDefault!35284 () ValueCell!10610)

