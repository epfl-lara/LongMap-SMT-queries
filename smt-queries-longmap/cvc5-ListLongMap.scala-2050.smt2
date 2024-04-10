; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35468 () Bool)

(assert start!35468)

(declare-fun b_free!7855 () Bool)

(declare-fun b_next!7855 () Bool)

(assert (=> start!35468 (= b_free!7855 (not b_next!7855))))

(declare-fun tp!27350 () Bool)

(declare-fun b_and!15097 () Bool)

(assert (=> start!35468 (= tp!27350 b_and!15097)))

(declare-fun b!355388 () Bool)

(declare-fun res!197150 () Bool)

(declare-fun e!217703 () Bool)

(assert (=> b!355388 (=> (not res!197150) (not e!217703))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355388 (= res!197150 (validKeyInArray!0 k!1077))))

(declare-fun res!197154 () Bool)

(assert (=> start!35468 (=> (not res!197154) (not e!217703))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35468 (= res!197154 (validMask!0 mask!1842))))

(assert (=> start!35468 e!217703))

(declare-fun tp_is_empty!7921 () Bool)

(assert (=> start!35468 tp_is_empty!7921))

(assert (=> start!35468 true))

(assert (=> start!35468 tp!27350))

(declare-datatypes ((array!19421 0))(
  ( (array!19422 (arr!9204 (Array (_ BitVec 32) (_ BitVec 64))) (size!9556 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19421)

(declare-fun array_inv!6762 (array!19421) Bool)

(assert (=> start!35468 (array_inv!6762 _keys!1456)))

(declare-datatypes ((V!11539 0))(
  ( (V!11540 (val!4005 Int)) )
))
(declare-datatypes ((ValueCell!3617 0))(
  ( (ValueCellFull!3617 (v!6199 V!11539)) (EmptyCell!3617) )
))
(declare-datatypes ((array!19423 0))(
  ( (array!19424 (arr!9205 (Array (_ BitVec 32) ValueCell!3617)) (size!9557 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19423)

(declare-fun e!217705 () Bool)

(declare-fun array_inv!6763 (array!19423) Bool)

(assert (=> start!35468 (and (array_inv!6763 _values!1208) e!217705)))

(declare-fun b!355389 () Bool)

(declare-fun res!197148 () Bool)

(assert (=> b!355389 (=> (not res!197148) (not e!217703))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!355389 (= res!197148 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9556 _keys!1456))))))

(declare-fun b!355390 () Bool)

(declare-fun e!217706 () Bool)

(declare-fun mapRes!13389 () Bool)

(assert (=> b!355390 (= e!217705 (and e!217706 mapRes!13389))))

(declare-fun condMapEmpty!13389 () Bool)

(declare-fun mapDefault!13389 () ValueCell!3617)

