; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133450 () Bool)

(assert start!133450)

(declare-fun b!1560141 () Bool)

(declare-fun res!1066853 () Bool)

(declare-fun e!869326 () Bool)

(assert (=> b!1560141 (=> (not res!1066853) (not e!869326))))

(declare-datatypes ((array!103790 0))(
  ( (array!103791 (arr!50087 (Array (_ BitVec 32) (_ BitVec 64))) (size!50637 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103790)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103790 (_ BitVec 32)) Bool)

(assert (=> b!1560141 (= res!1066853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59175 () Bool)

(declare-fun mapRes!59175 () Bool)

(assert (=> mapIsEmpty!59175 mapRes!59175))

(declare-fun b!1560142 () Bool)

(declare-fun res!1066852 () Bool)

(assert (=> b!1560142 (=> (not res!1066852) (not e!869326))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59585 0))(
  ( (V!59586 (val!19350 Int)) )
))
(declare-datatypes ((ValueCell!18236 0))(
  ( (ValueCellFull!18236 (v!22102 V!59585)) (EmptyCell!18236) )
))
(declare-datatypes ((array!103792 0))(
  ( (array!103793 (arr!50088 (Array (_ BitVec 32) ValueCell!18236)) (size!50638 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103792)

(assert (=> b!1560142 (= res!1066852 (and (= (size!50638 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50637 _keys!637) (size!50638 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560143 () Bool)

(declare-fun res!1066854 () Bool)

(assert (=> b!1560143 (=> (not res!1066854) (not e!869326))))

(declare-datatypes ((List!36381 0))(
  ( (Nil!36378) (Cons!36377 (h!37823 (_ BitVec 64)) (t!51114 List!36381)) )
))
(declare-fun arrayNoDuplicates!0 (array!103790 (_ BitVec 32) List!36381) Bool)

(assert (=> b!1560143 (= res!1066854 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36378))))

(declare-fun b!1560144 () Bool)

(declare-fun res!1066855 () Bool)

(assert (=> b!1560144 (=> (not res!1066855) (not e!869326))))

(declare-datatypes ((tuple2!25028 0))(
  ( (tuple2!25029 (_1!12525 (_ BitVec 64)) (_2!12525 V!59585)) )
))
(declare-datatypes ((List!36382 0))(
  ( (Nil!36379) (Cons!36378 (h!37824 tuple2!25028) (t!51115 List!36382)) )
))
(declare-datatypes ((ListLongMap!22463 0))(
  ( (ListLongMap!22464 (toList!11247 List!36382)) )
))
(declare-fun contains!10237 (ListLongMap!22463 (_ BitVec 64)) Bool)

(assert (=> b!1560144 (= res!1066855 (not (contains!10237 (ListLongMap!22464 Nil!36379) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59175 () Bool)

(declare-fun tp!112830 () Bool)

(declare-fun e!869328 () Bool)

(assert (=> mapNonEmpty!59175 (= mapRes!59175 (and tp!112830 e!869328))))

(declare-fun mapRest!59175 () (Array (_ BitVec 32) ValueCell!18236))

(declare-fun mapKey!59175 () (_ BitVec 32))

(declare-fun mapValue!59175 () ValueCell!18236)

(assert (=> mapNonEmpty!59175 (= (arr!50088 _values!487) (store mapRest!59175 mapKey!59175 mapValue!59175))))

(declare-fun b!1560145 () Bool)

(declare-fun tp_is_empty!38533 () Bool)

(assert (=> b!1560145 (= e!869328 tp_is_empty!38533)))

(declare-fun b!1560146 () Bool)

(declare-fun e!869329 () Bool)

(assert (=> b!1560146 (= e!869329 tp_is_empty!38533)))

(declare-fun res!1066857 () Bool)

(assert (=> start!133450 (=> (not res!1066857) (not e!869326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133450 (= res!1066857 (validMask!0 mask!947))))

(assert (=> start!133450 e!869326))

(assert (=> start!133450 true))

(declare-fun array_inv!38933 (array!103790) Bool)

(assert (=> start!133450 (array_inv!38933 _keys!637)))

(declare-fun e!869327 () Bool)

(declare-fun array_inv!38934 (array!103792) Bool)

(assert (=> start!133450 (and (array_inv!38934 _values!487) e!869327)))

(declare-fun b!1560147 () Bool)

(assert (=> b!1560147 (= e!869326 false)))

(declare-fun lt!670956 () Bool)

(assert (=> b!1560147 (= lt!670956 (contains!10237 (ListLongMap!22464 Nil!36379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560148 () Bool)

(assert (=> b!1560148 (= e!869327 (and e!869329 mapRes!59175))))

(declare-fun condMapEmpty!59175 () Bool)

(declare-fun mapDefault!59175 () ValueCell!18236)

