; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35460 () Bool)

(assert start!35460)

(declare-fun b_free!7847 () Bool)

(declare-fun b_next!7847 () Bool)

(assert (=> start!35460 (= b_free!7847 (not b_next!7847))))

(declare-fun tp!27327 () Bool)

(declare-fun b_and!15089 () Bool)

(assert (=> start!35460 (= tp!27327 b_and!15089)))

(declare-fun b!355244 () Bool)

(declare-fun res!197046 () Bool)

(declare-fun e!217644 () Bool)

(assert (=> b!355244 (=> (not res!197046) (not e!217644))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19405 0))(
  ( (array!19406 (arr!9196 (Array (_ BitVec 32) (_ BitVec 64))) (size!9548 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19405)

(assert (=> b!355244 (= res!197046 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9548 _keys!1456))))))

(declare-fun b!355246 () Bool)

(declare-fun res!197040 () Bool)

(assert (=> b!355246 (=> (not res!197040) (not e!217644))))

(declare-datatypes ((List!5329 0))(
  ( (Nil!5326) (Cons!5325 (h!6181 (_ BitVec 64)) (t!10479 List!5329)) )
))
(declare-fun arrayNoDuplicates!0 (array!19405 (_ BitVec 32) List!5329) Bool)

(assert (=> b!355246 (= res!197040 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5326))))

(declare-fun b!355247 () Bool)

(declare-fun res!197041 () Bool)

(assert (=> b!355247 (=> (not res!197041) (not e!217644))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!355247 (= res!197041 (= (select (arr!9196 _keys!1456) from!1805) k!1077))))

(declare-fun b!355248 () Bool)

(declare-fun e!217642 () Bool)

(declare-fun tp_is_empty!7913 () Bool)

(assert (=> b!355248 (= e!217642 tp_is_empty!7913)))

(declare-fun b!355249 () Bool)

(declare-fun res!197045 () Bool)

(assert (=> b!355249 (=> (not res!197045) (not e!217644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355249 (= res!197045 (validKeyInArray!0 (select (arr!9196 _keys!1456) from!1805)))))

(declare-fun b!355250 () Bool)

(declare-fun e!217645 () Bool)

(declare-fun mapRes!13377 () Bool)

(assert (=> b!355250 (= e!217645 (and e!217642 mapRes!13377))))

(declare-fun condMapEmpty!13377 () Bool)

(declare-datatypes ((V!11527 0))(
  ( (V!11528 (val!4001 Int)) )
))
(declare-datatypes ((ValueCell!3613 0))(
  ( (ValueCellFull!3613 (v!6195 V!11527)) (EmptyCell!3613) )
))
(declare-datatypes ((array!19407 0))(
  ( (array!19408 (arr!9197 (Array (_ BitVec 32) ValueCell!3613)) (size!9549 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19407)

(declare-fun mapDefault!13377 () ValueCell!3613)

