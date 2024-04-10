; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42392 () Bool)

(assert start!42392)

(declare-fun b_free!11867 () Bool)

(declare-fun b_next!11867 () Bool)

(assert (=> start!42392 (= b_free!11867 (not b_next!11867))))

(declare-fun tp!41635 () Bool)

(declare-fun b_and!20323 () Bool)

(assert (=> start!42392 (= tp!41635 b_and!20323)))

(declare-fun b!472976 () Bool)

(declare-fun res!282508 () Bool)

(declare-fun e!277404 () Bool)

(assert (=> b!472976 (=> (not res!282508) (not e!277404))))

(declare-datatypes ((array!30349 0))(
  ( (array!30350 (arr!14594 (Array (_ BitVec 32) (_ BitVec 64))) (size!14946 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30349)

(declare-datatypes ((List!8899 0))(
  ( (Nil!8896) (Cons!8895 (h!9751 (_ BitVec 64)) (t!14869 List!8899)) )
))
(declare-fun arrayNoDuplicates!0 (array!30349 (_ BitVec 32) List!8899) Bool)

(assert (=> b!472976 (= res!282508 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8896))))

(declare-fun res!282507 () Bool)

(assert (=> start!42392 (=> (not res!282507) (not e!277404))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42392 (= res!282507 (validMask!0 mask!1365))))

(assert (=> start!42392 e!277404))

(declare-fun tp_is_empty!13295 () Bool)

(assert (=> start!42392 tp_is_empty!13295))

(assert (=> start!42392 tp!41635))

(assert (=> start!42392 true))

(declare-fun array_inv!10524 (array!30349) Bool)

(assert (=> start!42392 (array_inv!10524 _keys!1025)))

(declare-datatypes ((V!18831 0))(
  ( (V!18832 (val!6692 Int)) )
))
(declare-datatypes ((ValueCell!6304 0))(
  ( (ValueCellFull!6304 (v!8983 V!18831)) (EmptyCell!6304) )
))
(declare-datatypes ((array!30351 0))(
  ( (array!30352 (arr!14595 (Array (_ BitVec 32) ValueCell!6304)) (size!14947 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30351)

(declare-fun e!277407 () Bool)

(declare-fun array_inv!10525 (array!30351) Bool)

(assert (=> start!42392 (and (array_inv!10525 _values!833) e!277407)))

(declare-fun b!472977 () Bool)

(declare-fun res!282511 () Bool)

(assert (=> b!472977 (=> (not res!282511) (not e!277404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30349 (_ BitVec 32)) Bool)

(assert (=> b!472977 (= res!282511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472978 () Bool)

(declare-fun e!277409 () Bool)

(declare-fun mapRes!21655 () Bool)

(assert (=> b!472978 (= e!277407 (and e!277409 mapRes!21655))))

(declare-fun condMapEmpty!21655 () Bool)

(declare-fun mapDefault!21655 () ValueCell!6304)

