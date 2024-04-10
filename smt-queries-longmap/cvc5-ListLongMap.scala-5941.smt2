; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77462 () Bool)

(assert start!77462)

(declare-fun mapIsEmpty!29422 () Bool)

(declare-fun mapRes!29422 () Bool)

(assert (=> mapIsEmpty!29422 mapRes!29422))

(declare-fun b!902740 () Bool)

(declare-fun e!505651 () Bool)

(declare-fun tp_is_empty!18475 () Bool)

(assert (=> b!902740 (= e!505651 tp_is_empty!18475)))

(declare-fun mapNonEmpty!29422 () Bool)

(declare-fun tp!56481 () Bool)

(assert (=> mapNonEmpty!29422 (= mapRes!29422 (and tp!56481 e!505651))))

(declare-fun mapKey!29422 () (_ BitVec 32))

(declare-datatypes ((V!29599 0))(
  ( (V!29600 (val!9288 Int)) )
))
(declare-datatypes ((ValueCell!8756 0))(
  ( (ValueCellFull!8756 (v!11793 V!29599)) (EmptyCell!8756) )
))
(declare-datatypes ((array!53010 0))(
  ( (array!53011 (arr!25465 (Array (_ BitVec 32) ValueCell!8756)) (size!25924 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53010)

(declare-fun mapValue!29422 () ValueCell!8756)

(declare-fun mapRest!29422 () (Array (_ BitVec 32) ValueCell!8756))

(assert (=> mapNonEmpty!29422 (= (arr!25465 _values!1152) (store mapRest!29422 mapKey!29422 mapValue!29422))))

(declare-fun b!902741 () Bool)

(declare-fun e!505650 () Bool)

(assert (=> b!902741 (= e!505650 false)))

(declare-fun lt!407907 () Bool)

(declare-datatypes ((array!53012 0))(
  ( (array!53013 (arr!25466 (Array (_ BitVec 32) (_ BitVec 64))) (size!25925 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53012)

(declare-datatypes ((List!17890 0))(
  ( (Nil!17887) (Cons!17886 (h!19032 (_ BitVec 64)) (t!25273 List!17890)) )
))
(declare-fun arrayNoDuplicates!0 (array!53012 (_ BitVec 32) List!17890) Bool)

(assert (=> b!902741 (= lt!407907 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17887))))

(declare-fun b!902742 () Bool)

(declare-fun e!505652 () Bool)

(assert (=> b!902742 (= e!505652 tp_is_empty!18475)))

(declare-fun res!609167 () Bool)

(assert (=> start!77462 (=> (not res!609167) (not e!505650))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77462 (= res!609167 (validMask!0 mask!1756))))

(assert (=> start!77462 e!505650))

(assert (=> start!77462 true))

(declare-fun e!505653 () Bool)

(declare-fun array_inv!19960 (array!53010) Bool)

(assert (=> start!77462 (and (array_inv!19960 _values!1152) e!505653)))

(declare-fun array_inv!19961 (array!53012) Bool)

(assert (=> start!77462 (array_inv!19961 _keys!1386)))

(declare-fun b!902743 () Bool)

(declare-fun res!609166 () Bool)

(assert (=> b!902743 (=> (not res!609166) (not e!505650))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902743 (= res!609166 (and (= (size!25924 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25925 _keys!1386) (size!25924 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902744 () Bool)

(declare-fun res!609165 () Bool)

(assert (=> b!902744 (=> (not res!609165) (not e!505650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53012 (_ BitVec 32)) Bool)

(assert (=> b!902744 (= res!609165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902745 () Bool)

(assert (=> b!902745 (= e!505653 (and e!505652 mapRes!29422))))

(declare-fun condMapEmpty!29422 () Bool)

(declare-fun mapDefault!29422 () ValueCell!8756)

