; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133760 () Bool)

(assert start!133760)

(declare-fun b!1564100 () Bool)

(declare-fun res!1069304 () Bool)

(declare-fun e!871751 () Bool)

(assert (=> b!1564100 (=> (not res!1069304) (not e!871751))))

(declare-datatypes ((array!104378 0))(
  ( (array!104379 (arr!50381 (Array (_ BitVec 32) (_ BitVec 64))) (size!50931 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104378)

(declare-datatypes ((List!36552 0))(
  ( (Nil!36549) (Cons!36548 (h!37994 (_ BitVec 64)) (t!51399 List!36552)) )
))
(declare-fun arrayNoDuplicates!0 (array!104378 (_ BitVec 32) List!36552) Bool)

(assert (=> b!1564100 (= res!1069304 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36549))))

(declare-fun b!1564101 () Bool)

(declare-fun e!871752 () Bool)

(declare-fun tp_is_empty!38843 () Bool)

(assert (=> b!1564101 (= e!871752 tp_is_empty!38843)))

(declare-fun mapIsEmpty!59640 () Bool)

(declare-fun mapRes!59640 () Bool)

(assert (=> mapIsEmpty!59640 mapRes!59640))

(declare-fun b!1564103 () Bool)

(declare-fun e!871749 () Bool)

(assert (=> b!1564103 (= e!871749 tp_is_empty!38843)))

(declare-fun b!1564104 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564104 (= e!871751 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50931 _keys!637)) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!50931 _keys!637)) from!782) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59640 () Bool)

(declare-fun tp!113565 () Bool)

(assert (=> mapNonEmpty!59640 (= mapRes!59640 (and tp!113565 e!871749))))

(declare-datatypes ((V!59997 0))(
  ( (V!59998 (val!19505 Int)) )
))
(declare-datatypes ((ValueCell!18391 0))(
  ( (ValueCellFull!18391 (v!22257 V!59997)) (EmptyCell!18391) )
))
(declare-fun mapRest!59640 () (Array (_ BitVec 32) ValueCell!18391))

(declare-fun mapValue!59640 () ValueCell!18391)

(declare-fun mapKey!59640 () (_ BitVec 32))

(declare-datatypes ((array!104380 0))(
  ( (array!104381 (arr!50382 (Array (_ BitVec 32) ValueCell!18391)) (size!50932 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104380)

(assert (=> mapNonEmpty!59640 (= (arr!50382 _values!487) (store mapRest!59640 mapKey!59640 mapValue!59640))))

(declare-fun b!1564102 () Bool)

(declare-fun res!1069303 () Bool)

(assert (=> b!1564102 (=> (not res!1069303) (not e!871751))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun mask!947 () (_ BitVec 32))

(assert (=> b!1564102 (= res!1069303 (and (= (size!50932 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50931 _keys!637) (size!50932 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069305 () Bool)

(assert (=> start!133760 (=> (not res!1069305) (not e!871751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133760 (= res!1069305 (validMask!0 mask!947))))

(assert (=> start!133760 e!871751))

(assert (=> start!133760 true))

(declare-fun array_inv!39153 (array!104378) Bool)

(assert (=> start!133760 (array_inv!39153 _keys!637)))

(declare-fun e!871753 () Bool)

(declare-fun array_inv!39154 (array!104380) Bool)

(assert (=> start!133760 (and (array_inv!39154 _values!487) e!871753)))

(declare-fun b!1564105 () Bool)

(assert (=> b!1564105 (= e!871753 (and e!871752 mapRes!59640))))

(declare-fun condMapEmpty!59640 () Bool)

(declare-fun mapDefault!59640 () ValueCell!18391)

