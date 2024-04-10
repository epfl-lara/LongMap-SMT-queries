; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35748 () Bool)

(assert start!35748)

(declare-fun mapNonEmpty!13809 () Bool)

(declare-fun mapRes!13809 () Bool)

(declare-fun tp!27876 () Bool)

(declare-fun e!219887 () Bool)

(assert (=> mapNonEmpty!13809 (= mapRes!13809 (and tp!27876 e!219887))))

(declare-datatypes ((V!11911 0))(
  ( (V!11912 (val!4145 Int)) )
))
(declare-datatypes ((ValueCell!3757 0))(
  ( (ValueCellFull!3757 (v!6339 V!11911)) (EmptyCell!3757) )
))
(declare-fun mapRest!13809 () (Array (_ BitVec 32) ValueCell!3757))

(declare-fun mapValue!13809 () ValueCell!3757)

(declare-fun mapKey!13809 () (_ BitVec 32))

(declare-datatypes ((array!19961 0))(
  ( (array!19962 (arr!9474 (Array (_ BitVec 32) ValueCell!3757)) (size!9826 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19961)

(assert (=> mapNonEmpty!13809 (= (arr!9474 _values!1208) (store mapRest!13809 mapKey!13809 mapValue!13809))))

(declare-fun b!359120 () Bool)

(declare-fun res!199621 () Bool)

(declare-fun e!219884 () Bool)

(assert (=> b!359120 (=> (not res!199621) (not e!219884))))

(declare-datatypes ((array!19963 0))(
  ( (array!19964 (arr!9475 (Array (_ BitVec 32) (_ BitVec 64))) (size!9827 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19963)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19963 (_ BitVec 32)) Bool)

(assert (=> b!359120 (= res!199621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199619 () Bool)

(assert (=> start!35748 (=> (not res!199619) (not e!219884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35748 (= res!199619 (validMask!0 mask!1842))))

(assert (=> start!35748 e!219884))

(assert (=> start!35748 true))

(declare-fun e!219883 () Bool)

(declare-fun array_inv!6972 (array!19961) Bool)

(assert (=> start!35748 (and (array_inv!6972 _values!1208) e!219883)))

(declare-fun array_inv!6973 (array!19963) Bool)

(assert (=> start!35748 (array_inv!6973 _keys!1456)))

(declare-fun mapIsEmpty!13809 () Bool)

(assert (=> mapIsEmpty!13809 mapRes!13809))

(declare-fun b!359121 () Bool)

(assert (=> b!359121 (= e!219884 false)))

(declare-fun lt!166289 () Bool)

(declare-datatypes ((List!5456 0))(
  ( (Nil!5453) (Cons!5452 (h!6308 (_ BitVec 64)) (t!10606 List!5456)) )
))
(declare-fun arrayNoDuplicates!0 (array!19963 (_ BitVec 32) List!5456) Bool)

(assert (=> b!359121 (= lt!166289 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5453))))

(declare-fun b!359122 () Bool)

(declare-fun res!199620 () Bool)

(assert (=> b!359122 (=> (not res!199620) (not e!219884))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359122 (= res!199620 (and (= (size!9826 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9827 _keys!1456) (size!9826 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359123 () Bool)

(declare-fun e!219886 () Bool)

(declare-fun tp_is_empty!8201 () Bool)

(assert (=> b!359123 (= e!219886 tp_is_empty!8201)))

(declare-fun b!359124 () Bool)

(assert (=> b!359124 (= e!219887 tp_is_empty!8201)))

(declare-fun b!359125 () Bool)

(assert (=> b!359125 (= e!219883 (and e!219886 mapRes!13809))))

(declare-fun condMapEmpty!13809 () Bool)

(declare-fun mapDefault!13809 () ValueCell!3757)

