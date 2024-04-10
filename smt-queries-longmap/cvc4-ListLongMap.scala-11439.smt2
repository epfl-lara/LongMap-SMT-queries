; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133436 () Bool)

(assert start!133436)

(declare-fun b!1559952 () Bool)

(declare-fun res!1066730 () Bool)

(declare-fun e!869221 () Bool)

(assert (=> b!1559952 (=> (not res!1066730) (not e!869221))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103764 0))(
  ( (array!103765 (arr!50074 (Array (_ BitVec 32) (_ BitVec 64))) (size!50624 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103764)

(assert (=> b!1559952 (= res!1066730 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50624 _keys!637)) (bvsge from!782 (size!50624 _keys!637))))))

(declare-fun mapNonEmpty!59154 () Bool)

(declare-fun mapRes!59154 () Bool)

(declare-fun tp!112809 () Bool)

(declare-fun e!869222 () Bool)

(assert (=> mapNonEmpty!59154 (= mapRes!59154 (and tp!112809 e!869222))))

(declare-datatypes ((V!59565 0))(
  ( (V!59566 (val!19343 Int)) )
))
(declare-datatypes ((ValueCell!18229 0))(
  ( (ValueCellFull!18229 (v!22095 V!59565)) (EmptyCell!18229) )
))
(declare-fun mapValue!59154 () ValueCell!18229)

(declare-fun mapRest!59154 () (Array (_ BitVec 32) ValueCell!18229))

(declare-datatypes ((array!103766 0))(
  ( (array!103767 (arr!50075 (Array (_ BitVec 32) ValueCell!18229)) (size!50625 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103766)

(declare-fun mapKey!59154 () (_ BitVec 32))

(assert (=> mapNonEmpty!59154 (= (arr!50075 _values!487) (store mapRest!59154 mapKey!59154 mapValue!59154))))

(declare-fun b!1559953 () Bool)

(declare-fun res!1066727 () Bool)

(assert (=> b!1559953 (=> (not res!1066727) (not e!869221))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559953 (= res!1066727 (and (= (size!50625 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50624 _keys!637) (size!50625 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559954 () Bool)

(declare-fun res!1066726 () Bool)

(assert (=> b!1559954 (=> (not res!1066726) (not e!869221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103764 (_ BitVec 32)) Bool)

(assert (=> b!1559954 (= res!1066726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559955 () Bool)

(declare-fun e!869220 () Bool)

(declare-fun tp_is_empty!38519 () Bool)

(assert (=> b!1559955 (= e!869220 tp_is_empty!38519)))

(declare-fun b!1559956 () Bool)

(declare-fun res!1066729 () Bool)

(assert (=> b!1559956 (=> (not res!1066729) (not e!869221))))

(declare-datatypes ((List!36372 0))(
  ( (Nil!36369) (Cons!36368 (h!37814 (_ BitVec 64)) (t!51105 List!36372)) )
))
(declare-fun arrayNoDuplicates!0 (array!103764 (_ BitVec 32) List!36372) Bool)

(assert (=> b!1559956 (= res!1066729 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36369))))

(declare-fun res!1066731 () Bool)

(assert (=> start!133436 (=> (not res!1066731) (not e!869221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133436 (= res!1066731 (validMask!0 mask!947))))

(assert (=> start!133436 e!869221))

(assert (=> start!133436 true))

(declare-fun array_inv!38923 (array!103764) Bool)

(assert (=> start!133436 (array_inv!38923 _keys!637)))

(declare-fun e!869223 () Bool)

(declare-fun array_inv!38924 (array!103766) Bool)

(assert (=> start!133436 (and (array_inv!38924 _values!487) e!869223)))

(declare-fun b!1559957 () Bool)

(assert (=> b!1559957 (= e!869221 false)))

(declare-fun lt!670935 () Bool)

(declare-datatypes ((tuple2!25018 0))(
  ( (tuple2!25019 (_1!12520 (_ BitVec 64)) (_2!12520 V!59565)) )
))
(declare-datatypes ((List!36373 0))(
  ( (Nil!36370) (Cons!36369 (h!37815 tuple2!25018) (t!51106 List!36373)) )
))
(declare-datatypes ((ListLongMap!22453 0))(
  ( (ListLongMap!22454 (toList!11242 List!36373)) )
))
(declare-fun contains!10232 (ListLongMap!22453 (_ BitVec 64)) Bool)

(assert (=> b!1559957 (= lt!670935 (contains!10232 (ListLongMap!22454 Nil!36370) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559958 () Bool)

(declare-fun res!1066728 () Bool)

(assert (=> b!1559958 (=> (not res!1066728) (not e!869221))))

(assert (=> b!1559958 (= res!1066728 (not (contains!10232 (ListLongMap!22454 Nil!36370) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559959 () Bool)

(assert (=> b!1559959 (= e!869222 tp_is_empty!38519)))

(declare-fun b!1559960 () Bool)

(assert (=> b!1559960 (= e!869223 (and e!869220 mapRes!59154))))

(declare-fun condMapEmpty!59154 () Bool)

(declare-fun mapDefault!59154 () ValueCell!18229)

