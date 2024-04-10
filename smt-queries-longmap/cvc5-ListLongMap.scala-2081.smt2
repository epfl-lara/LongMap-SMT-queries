; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35654 () Bool)

(assert start!35654)

(declare-fun b_free!7909 () Bool)

(declare-fun b_next!7909 () Bool)

(assert (=> start!35654 (= b_free!7909 (not b_next!7909))))

(declare-fun tp!27711 () Bool)

(declare-fun b_and!15151 () Bool)

(assert (=> start!35654 (= tp!27711 b_and!15151)))

(declare-fun res!198973 () Bool)

(declare-fun e!219164 () Bool)

(assert (=> start!35654 (=> (not res!198973) (not e!219164))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35654 (= res!198973 (validMask!0 mask!1842))))

(assert (=> start!35654 e!219164))

(declare-fun tp_is_empty!8107 () Bool)

(assert (=> start!35654 tp_is_empty!8107))

(assert (=> start!35654 true))

(assert (=> start!35654 tp!27711))

(declare-datatypes ((array!19781 0))(
  ( (array!19782 (arr!9384 (Array (_ BitVec 32) (_ BitVec 64))) (size!9736 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19781)

(declare-fun array_inv!6898 (array!19781) Bool)

(assert (=> start!35654 (array_inv!6898 _keys!1456)))

(declare-datatypes ((V!11787 0))(
  ( (V!11788 (val!4098 Int)) )
))
(declare-datatypes ((ValueCell!3710 0))(
  ( (ValueCellFull!3710 (v!6292 V!11787)) (EmptyCell!3710) )
))
(declare-datatypes ((array!19783 0))(
  ( (array!19784 (arr!9385 (Array (_ BitVec 32) ValueCell!3710)) (size!9737 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19783)

(declare-fun e!219166 () Bool)

(declare-fun array_inv!6899 (array!19783) Bool)

(assert (=> start!35654 (and (array_inv!6899 _values!1208) e!219166)))

(declare-fun b!358043 () Bool)

(declare-fun e!219162 () Bool)

(declare-fun mapRes!13668 () Bool)

(assert (=> b!358043 (= e!219166 (and e!219162 mapRes!13668))))

(declare-fun condMapEmpty!13668 () Bool)

(declare-fun mapDefault!13668 () ValueCell!3710)

