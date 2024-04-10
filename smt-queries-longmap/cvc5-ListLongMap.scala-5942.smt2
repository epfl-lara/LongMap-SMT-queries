; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77468 () Bool)

(assert start!77468)

(declare-fun b!902794 () Bool)

(declare-fun e!505695 () Bool)

(assert (=> b!902794 (= e!505695 false)))

(declare-fun lt!407916 () Bool)

(declare-datatypes ((array!53022 0))(
  ( (array!53023 (arr!25471 (Array (_ BitVec 32) (_ BitVec 64))) (size!25930 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53022)

(declare-datatypes ((List!17893 0))(
  ( (Nil!17890) (Cons!17889 (h!19035 (_ BitVec 64)) (t!25276 List!17893)) )
))
(declare-fun arrayNoDuplicates!0 (array!53022 (_ BitVec 32) List!17893) Bool)

(assert (=> b!902794 (= lt!407916 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17890))))

(declare-fun mapIsEmpty!29431 () Bool)

(declare-fun mapRes!29431 () Bool)

(assert (=> mapIsEmpty!29431 mapRes!29431))

(declare-fun mapNonEmpty!29431 () Bool)

(declare-fun tp!56490 () Bool)

(declare-fun e!505698 () Bool)

(assert (=> mapNonEmpty!29431 (= mapRes!29431 (and tp!56490 e!505698))))

(declare-datatypes ((V!29607 0))(
  ( (V!29608 (val!9291 Int)) )
))
(declare-datatypes ((ValueCell!8759 0))(
  ( (ValueCellFull!8759 (v!11796 V!29607)) (EmptyCell!8759) )
))
(declare-fun mapValue!29431 () ValueCell!8759)

(declare-fun mapRest!29431 () (Array (_ BitVec 32) ValueCell!8759))

(declare-fun mapKey!29431 () (_ BitVec 32))

(declare-datatypes ((array!53024 0))(
  ( (array!53025 (arr!25472 (Array (_ BitVec 32) ValueCell!8759)) (size!25931 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53024)

(assert (=> mapNonEmpty!29431 (= (arr!25472 _values!1152) (store mapRest!29431 mapKey!29431 mapValue!29431))))

(declare-fun b!902795 () Bool)

(declare-fun res!609192 () Bool)

(assert (=> b!902795 (=> (not res!609192) (not e!505695))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!902795 (= res!609192 (and (= (size!25931 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25930 _keys!1386) (size!25931 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609194 () Bool)

(assert (=> start!77468 (=> (not res!609194) (not e!505695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77468 (= res!609194 (validMask!0 mask!1756))))

(assert (=> start!77468 e!505695))

(assert (=> start!77468 true))

(declare-fun e!505696 () Bool)

(declare-fun array_inv!19966 (array!53024) Bool)

(assert (=> start!77468 (and (array_inv!19966 _values!1152) e!505696)))

(declare-fun array_inv!19967 (array!53022) Bool)

(assert (=> start!77468 (array_inv!19967 _keys!1386)))

(declare-fun b!902796 () Bool)

(declare-fun e!505694 () Bool)

(declare-fun tp_is_empty!18481 () Bool)

(assert (=> b!902796 (= e!505694 tp_is_empty!18481)))

(declare-fun b!902797 () Bool)

(assert (=> b!902797 (= e!505696 (and e!505694 mapRes!29431))))

(declare-fun condMapEmpty!29431 () Bool)

(declare-fun mapDefault!29431 () ValueCell!8759)

