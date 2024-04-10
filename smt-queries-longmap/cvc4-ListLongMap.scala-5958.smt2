; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77578 () Bool)

(assert start!77578)

(declare-fun b_free!16163 () Bool)

(declare-fun b_next!16163 () Bool)

(assert (=> start!77578 (= b_free!16163 (not b_next!16163))))

(declare-fun tp!56751 () Bool)

(declare-fun b_and!26529 () Bool)

(assert (=> start!77578 (= tp!56751 b_and!26529)))

(declare-fun b!903975 () Bool)

(declare-fun e!506527 () Bool)

(declare-fun tp_is_empty!18581 () Bool)

(assert (=> b!903975 (= e!506527 tp_is_empty!18581)))

(declare-fun res!609906 () Bool)

(declare-fun e!506525 () Bool)

(assert (=> start!77578 (=> (not res!609906) (not e!506525))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77578 (= res!609906 (validMask!0 mask!1756))))

(assert (=> start!77578 e!506525))

(declare-datatypes ((V!29739 0))(
  ( (V!29740 (val!9341 Int)) )
))
(declare-datatypes ((ValueCell!8809 0))(
  ( (ValueCellFull!8809 (v!11846 V!29739)) (EmptyCell!8809) )
))
(declare-datatypes ((array!53214 0))(
  ( (array!53215 (arr!25566 (Array (_ BitVec 32) ValueCell!8809)) (size!26025 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53214)

(declare-fun e!506523 () Bool)

(declare-fun array_inv!20032 (array!53214) Bool)

(assert (=> start!77578 (and (array_inv!20032 _values!1152) e!506523)))

(assert (=> start!77578 tp!56751))

(assert (=> start!77578 true))

(assert (=> start!77578 tp_is_empty!18581))

(declare-datatypes ((array!53216 0))(
  ( (array!53217 (arr!25567 (Array (_ BitVec 32) (_ BitVec 64))) (size!26026 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53216)

(declare-fun array_inv!20033 (array!53216) Bool)

(assert (=> start!77578 (array_inv!20033 _keys!1386)))

(declare-fun b!903976 () Bool)

(declare-fun res!609910 () Bool)

(assert (=> b!903976 (=> (not res!609910) (not e!506525))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903976 (= res!609910 (inRange!0 i!717 mask!1756))))

(declare-fun b!903977 () Bool)

(declare-fun res!609903 () Bool)

(assert (=> b!903977 (=> (not res!609903) (not e!506525))))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!903977 (= res!609903 (and (= (select (arr!25567 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903978 () Bool)

(declare-fun mapRes!29584 () Bool)

(assert (=> b!903978 (= e!506523 (and e!506527 mapRes!29584))))

(declare-fun condMapEmpty!29584 () Bool)

(declare-fun mapDefault!29584 () ValueCell!8809)

