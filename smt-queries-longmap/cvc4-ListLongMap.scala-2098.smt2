; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35760 () Bool)

(assert start!35760)

(declare-fun b!359228 () Bool)

(declare-fun res!199675 () Bool)

(declare-fun e!219973 () Bool)

(assert (=> b!359228 (=> (not res!199675) (not e!219973))))

(declare-datatypes ((array!19985 0))(
  ( (array!19986 (arr!9486 (Array (_ BitVec 32) (_ BitVec 64))) (size!9838 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19985)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19985 (_ BitVec 32)) Bool)

(assert (=> b!359228 (= res!199675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359229 () Bool)

(declare-fun e!219977 () Bool)

(declare-fun tp_is_empty!8213 () Bool)

(assert (=> b!359229 (= e!219977 tp_is_empty!8213)))

(declare-fun res!199674 () Bool)

(assert (=> start!35760 (=> (not res!199674) (not e!219973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35760 (= res!199674 (validMask!0 mask!1842))))

(assert (=> start!35760 e!219973))

(assert (=> start!35760 true))

(declare-datatypes ((V!11927 0))(
  ( (V!11928 (val!4151 Int)) )
))
(declare-datatypes ((ValueCell!3763 0))(
  ( (ValueCellFull!3763 (v!6345 V!11927)) (EmptyCell!3763) )
))
(declare-datatypes ((array!19987 0))(
  ( (array!19988 (arr!9487 (Array (_ BitVec 32) ValueCell!3763)) (size!9839 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19987)

(declare-fun e!219975 () Bool)

(declare-fun array_inv!6980 (array!19987) Bool)

(assert (=> start!35760 (and (array_inv!6980 _values!1208) e!219975)))

(declare-fun array_inv!6981 (array!19985) Bool)

(assert (=> start!35760 (array_inv!6981 _keys!1456)))

(declare-fun b!359230 () Bool)

(declare-fun res!199673 () Bool)

(assert (=> b!359230 (=> (not res!199673) (not e!219973))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359230 (= res!199673 (and (= (size!9839 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9838 _keys!1456) (size!9839 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359231 () Bool)

(declare-fun mapRes!13827 () Bool)

(assert (=> b!359231 (= e!219975 (and e!219977 mapRes!13827))))

(declare-fun condMapEmpty!13827 () Bool)

(declare-fun mapDefault!13827 () ValueCell!3763)

