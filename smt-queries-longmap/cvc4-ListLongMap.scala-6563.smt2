; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83266 () Bool)

(assert start!83266)

(declare-fun b_free!19259 () Bool)

(declare-fun b_next!19259 () Bool)

(assert (=> start!83266 (= b_free!19259 (not b_next!19259))))

(declare-fun tp!67055 () Bool)

(declare-fun b_and!30747 () Bool)

(assert (=> start!83266 (= tp!67055 b_and!30747)))

(declare-fun b!971689 () Bool)

(declare-fun res!650396 () Bool)

(declare-fun e!547742 () Bool)

(assert (=> b!971689 (=> (not res!650396) (not e!547742))))

(declare-datatypes ((array!60361 0))(
  ( (array!60362 (arr!29044 (Array (_ BitVec 32) (_ BitVec 64))) (size!29523 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60361)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60361 (_ BitVec 32)) Bool)

(assert (=> b!971689 (= res!650396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971690 () Bool)

(declare-fun res!650393 () Bool)

(assert (=> b!971690 (=> (not res!650393) (not e!547742))))

(declare-datatypes ((V!34525 0))(
  ( (V!34526 (val!11129 Int)) )
))
(declare-datatypes ((ValueCell!10597 0))(
  ( (ValueCellFull!10597 (v!13688 V!34525)) (EmptyCell!10597) )
))
(declare-datatypes ((array!60363 0))(
  ( (array!60364 (arr!29045 (Array (_ BitVec 32) ValueCell!10597)) (size!29524 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60363)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971690 (= res!650393 (and (= (size!29524 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29523 _keys!1717) (size!29524 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971691 () Bool)

(declare-fun e!547740 () Bool)

(declare-fun e!547744 () Bool)

(declare-fun mapRes!35245 () Bool)

(assert (=> b!971691 (= e!547740 (and e!547744 mapRes!35245))))

(declare-fun condMapEmpty!35245 () Bool)

(declare-fun mapDefault!35245 () ValueCell!10597)

