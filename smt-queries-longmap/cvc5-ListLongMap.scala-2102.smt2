; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35780 () Bool)

(assert start!35780)

(declare-fun res!199764 () Bool)

(declare-fun e!220127 () Bool)

(assert (=> start!35780 (=> (not res!199764) (not e!220127))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35780 (= res!199764 (validMask!0 mask!1842))))

(assert (=> start!35780 e!220127))

(assert (=> start!35780 true))

(declare-datatypes ((V!11955 0))(
  ( (V!11956 (val!4161 Int)) )
))
(declare-datatypes ((ValueCell!3773 0))(
  ( (ValueCellFull!3773 (v!6355 V!11955)) (EmptyCell!3773) )
))
(declare-datatypes ((array!20023 0))(
  ( (array!20024 (arr!9505 (Array (_ BitVec 32) ValueCell!3773)) (size!9857 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20023)

(declare-fun e!220126 () Bool)

(declare-fun array_inv!6990 (array!20023) Bool)

(assert (=> start!35780 (and (array_inv!6990 _values!1208) e!220126)))

(declare-datatypes ((array!20025 0))(
  ( (array!20026 (arr!9506 (Array (_ BitVec 32) (_ BitVec 64))) (size!9858 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20025)

(declare-fun array_inv!6991 (array!20025) Bool)

(assert (=> start!35780 (array_inv!6991 _keys!1456)))

(declare-fun b!359408 () Bool)

(declare-fun res!199763 () Bool)

(assert (=> b!359408 (=> (not res!199763) (not e!220127))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359408 (= res!199763 (and (= (size!9857 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9858 _keys!1456) (size!9857 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13857 () Bool)

(declare-fun mapRes!13857 () Bool)

(declare-fun tp!27924 () Bool)

(declare-fun e!220124 () Bool)

(assert (=> mapNonEmpty!13857 (= mapRes!13857 (and tp!27924 e!220124))))

(declare-fun mapRest!13857 () (Array (_ BitVec 32) ValueCell!3773))

(declare-fun mapKey!13857 () (_ BitVec 32))

(declare-fun mapValue!13857 () ValueCell!3773)

(assert (=> mapNonEmpty!13857 (= (arr!9505 _values!1208) (store mapRest!13857 mapKey!13857 mapValue!13857))))

(declare-fun b!359409 () Bool)

(declare-fun e!220123 () Bool)

(assert (=> b!359409 (= e!220126 (and e!220123 mapRes!13857))))

(declare-fun condMapEmpty!13857 () Bool)

(declare-fun mapDefault!13857 () ValueCell!3773)

