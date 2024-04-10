; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35450 () Bool)

(assert start!35450)

(declare-fun b_free!7837 () Bool)

(declare-fun b_next!7837 () Bool)

(assert (=> start!35450 (= b_free!7837 (not b_next!7837))))

(declare-fun tp!27297 () Bool)

(declare-fun b_and!15079 () Bool)

(assert (=> start!35450 (= tp!27297 b_and!15079)))

(declare-fun b!355064 () Bool)

(declare-fun e!217570 () Bool)

(declare-fun tp_is_empty!7903 () Bool)

(assert (=> b!355064 (= e!217570 tp_is_empty!7903)))

(declare-fun b!355065 () Bool)

(declare-fun res!196906 () Bool)

(declare-fun e!217568 () Bool)

(assert (=> b!355065 (=> (not res!196906) (not e!217568))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19385 0))(
  ( (array!19386 (arr!9186 (Array (_ BitVec 32) (_ BitVec 64))) (size!9538 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19385)

(assert (=> b!355065 (= res!196906 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9538 _keys!1456))))))

(declare-fun mapNonEmpty!13362 () Bool)

(declare-fun mapRes!13362 () Bool)

(declare-fun tp!27296 () Bool)

(declare-fun e!217571 () Bool)

(assert (=> mapNonEmpty!13362 (= mapRes!13362 (and tp!27296 e!217571))))

(declare-datatypes ((V!11515 0))(
  ( (V!11516 (val!3996 Int)) )
))
(declare-datatypes ((ValueCell!3608 0))(
  ( (ValueCellFull!3608 (v!6190 V!11515)) (EmptyCell!3608) )
))
(declare-fun mapRest!13362 () (Array (_ BitVec 32) ValueCell!3608))

(declare-fun mapKey!13362 () (_ BitVec 32))

(declare-fun mapValue!13362 () ValueCell!3608)

(declare-datatypes ((array!19387 0))(
  ( (array!19388 (arr!9187 (Array (_ BitVec 32) ValueCell!3608)) (size!9539 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19387)

(assert (=> mapNonEmpty!13362 (= (arr!9187 _values!1208) (store mapRest!13362 mapKey!13362 mapValue!13362))))

(declare-fun b!355066 () Bool)

(declare-fun res!196905 () Bool)

(assert (=> b!355066 (=> (not res!196905) (not e!217568))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!355066 (= res!196905 (= (select (arr!9186 _keys!1456) from!1805) k!1077))))

(declare-fun b!355067 () Bool)

(declare-fun res!196909 () Bool)

(assert (=> b!355067 (=> (not res!196909) (not e!217568))))

(declare-datatypes ((List!5321 0))(
  ( (Nil!5318) (Cons!5317 (h!6173 (_ BitVec 64)) (t!10471 List!5321)) )
))
(declare-fun arrayNoDuplicates!0 (array!19385 (_ BitVec 32) List!5321) Bool)

(assert (=> b!355067 (= res!196909 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5318))))

(declare-fun b!355068 () Bool)

(declare-fun e!217567 () Bool)

(assert (=> b!355068 (= e!217567 (and e!217570 mapRes!13362))))

(declare-fun condMapEmpty!13362 () Bool)

(declare-fun mapDefault!13362 () ValueCell!3608)

