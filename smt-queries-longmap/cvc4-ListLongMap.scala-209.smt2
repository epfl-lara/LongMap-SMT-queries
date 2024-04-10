; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3940 () Bool)

(assert start!3940)

(declare-fun b_free!845 () Bool)

(declare-fun b_next!845 () Bool)

(assert (=> start!3940 (= b_free!845 (not b_next!845))))

(declare-fun tp!3955 () Bool)

(declare-fun b_and!1655 () Bool)

(assert (=> start!3940 (= tp!3955 b_and!1655)))

(declare-fun b!28056 () Bool)

(declare-fun e!18186 () Bool)

(declare-fun tp_is_empty!1199 () Bool)

(assert (=> b!28056 (= e!18186 tp_is_empty!1199)))

(declare-fun b!28057 () Bool)

(declare-fun res!16677 () Bool)

(declare-fun e!18188 () Bool)

(assert (=> b!28057 (=> (not res!16677) (not e!18188))))

(declare-datatypes ((array!1639 0))(
  ( (array!1640 (arr!773 (Array (_ BitVec 32) (_ BitVec 64))) (size!874 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1639)

(declare-datatypes ((List!647 0))(
  ( (Nil!644) (Cons!643 (h!1210 (_ BitVec 64)) (t!3340 List!647)) )
))
(declare-fun arrayNoDuplicates!0 (array!1639 (_ BitVec 32) List!647) Bool)

(assert (=> b!28057 (= res!16677 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!644))))

(declare-fun mapNonEmpty!1327 () Bool)

(declare-fun mapRes!1327 () Bool)

(declare-fun tp!3954 () Bool)

(assert (=> mapNonEmpty!1327 (= mapRes!1327 (and tp!3954 e!18186))))

(declare-datatypes ((V!1423 0))(
  ( (V!1424 (val!626 Int)) )
))
(declare-datatypes ((ValueCell!400 0))(
  ( (ValueCellFull!400 (v!1715 V!1423)) (EmptyCell!400) )
))
(declare-fun mapValue!1327 () ValueCell!400)

(declare-fun mapRest!1327 () (Array (_ BitVec 32) ValueCell!400))

(declare-fun mapKey!1327 () (_ BitVec 32))

(declare-datatypes ((array!1641 0))(
  ( (array!1642 (arr!774 (Array (_ BitVec 32) ValueCell!400)) (size!875 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1641)

(assert (=> mapNonEmpty!1327 (= (arr!774 _values!1501) (store mapRest!1327 mapKey!1327 mapValue!1327))))

(declare-fun mapIsEmpty!1327 () Bool)

(assert (=> mapIsEmpty!1327 mapRes!1327))

(declare-fun b!28059 () Bool)

(declare-fun res!16675 () Bool)

(assert (=> b!28059 (=> (not res!16675) (not e!18188))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1639 (_ BitVec 32)) Bool)

(assert (=> b!28059 (= res!16675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28060 () Bool)

(declare-fun res!16674 () Bool)

(assert (=> b!28060 (=> (not res!16674) (not e!18188))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28060 (= res!16674 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28061 () Bool)

(declare-fun res!16673 () Bool)

(assert (=> b!28061 (=> (not res!16673) (not e!18188))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28061 (= res!16673 (and (= (size!875 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!874 _keys!1833) (size!875 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28062 () Bool)

(declare-fun e!18184 () Bool)

(declare-fun e!18187 () Bool)

(assert (=> b!28062 (= e!18184 (and e!18187 mapRes!1327))))

(declare-fun condMapEmpty!1327 () Bool)

(declare-fun mapDefault!1327 () ValueCell!400)

