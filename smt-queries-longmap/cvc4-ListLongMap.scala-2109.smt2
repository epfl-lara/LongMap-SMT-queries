; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35826 () Bool)

(assert start!35826)

(declare-fun res!200104 () Bool)

(declare-fun e!220472 () Bool)

(assert (=> start!35826 (=> (not res!200104) (not e!220472))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35826 (= res!200104 (validMask!0 mask!1842))))

(assert (=> start!35826 e!220472))

(declare-fun tp_is_empty!8279 () Bool)

(assert (=> start!35826 tp_is_empty!8279))

(assert (=> start!35826 true))

(declare-datatypes ((array!20111 0))(
  ( (array!20112 (arr!9549 (Array (_ BitVec 32) (_ BitVec 64))) (size!9901 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20111)

(declare-fun array_inv!7026 (array!20111) Bool)

(assert (=> start!35826 (array_inv!7026 _keys!1456)))

(declare-datatypes ((V!12015 0))(
  ( (V!12016 (val!4184 Int)) )
))
(declare-datatypes ((ValueCell!3796 0))(
  ( (ValueCellFull!3796 (v!6378 V!12015)) (EmptyCell!3796) )
))
(declare-datatypes ((array!20113 0))(
  ( (array!20114 (arr!9550 (Array (_ BitVec 32) ValueCell!3796)) (size!9902 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20113)

(declare-fun e!220469 () Bool)

(declare-fun array_inv!7027 (array!20113) Bool)

(assert (=> start!35826 (and (array_inv!7027 _values!1208) e!220469)))

(declare-fun b!359952 () Bool)

(declare-fun e!220471 () Bool)

(assert (=> b!359952 (= e!220471 tp_is_empty!8279)))

(declare-fun b!359953 () Bool)

(declare-fun res!200103 () Bool)

(assert (=> b!359953 (=> (not res!200103) (not e!220472))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359953 (= res!200103 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!359954 () Bool)

(declare-fun res!200107 () Bool)

(assert (=> b!359954 (=> (not res!200107) (not e!220472))))

(assert (=> b!359954 (= res!200107 (not (= (select (arr!9549 _keys!1456) from!1805) k!1077)))))

(declare-fun mapIsEmpty!13926 () Bool)

(declare-fun mapRes!13926 () Bool)

(assert (=> mapIsEmpty!13926 mapRes!13926))

(declare-fun b!359955 () Bool)

(assert (=> b!359955 (= e!220469 (and e!220471 mapRes!13926))))

(declare-fun condMapEmpty!13926 () Bool)

(declare-fun mapDefault!13926 () ValueCell!3796)

