; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133442 () Bool)

(assert start!133442)

(declare-fun b!1560033 () Bool)

(declare-fun e!869265 () Bool)

(declare-fun tp_is_empty!38525 () Bool)

(assert (=> b!1560033 (= e!869265 tp_is_empty!38525)))

(declare-fun res!1066782 () Bool)

(declare-fun e!869266 () Bool)

(assert (=> start!133442 (=> (not res!1066782) (not e!869266))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133442 (= res!1066782 (validMask!0 mask!947))))

(assert (=> start!133442 e!869266))

(assert (=> start!133442 true))

(declare-datatypes ((array!103774 0))(
  ( (array!103775 (arr!50079 (Array (_ BitVec 32) (_ BitVec 64))) (size!50629 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103774)

(declare-fun array_inv!38927 (array!103774) Bool)

(assert (=> start!133442 (array_inv!38927 _keys!637)))

(declare-datatypes ((V!59573 0))(
  ( (V!59574 (val!19346 Int)) )
))
(declare-datatypes ((ValueCell!18232 0))(
  ( (ValueCellFull!18232 (v!22098 V!59573)) (EmptyCell!18232) )
))
(declare-datatypes ((array!103776 0))(
  ( (array!103777 (arr!50080 (Array (_ BitVec 32) ValueCell!18232)) (size!50630 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103776)

(declare-fun e!869267 () Bool)

(declare-fun array_inv!38928 (array!103776) Bool)

(assert (=> start!133442 (and (array_inv!38928 _values!487) e!869267)))

(declare-fun b!1560034 () Bool)

(declare-fun res!1066785 () Bool)

(assert (=> b!1560034 (=> (not res!1066785) (not e!869266))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560034 (= res!1066785 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50629 _keys!637)) (bvsge from!782 (size!50629 _keys!637))))))

(declare-fun mapIsEmpty!59163 () Bool)

(declare-fun mapRes!59163 () Bool)

(assert (=> mapIsEmpty!59163 mapRes!59163))

(declare-fun b!1560035 () Bool)

(declare-fun res!1066784 () Bool)

(assert (=> b!1560035 (=> (not res!1066784) (not e!869266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103774 (_ BitVec 32)) Bool)

(assert (=> b!1560035 (= res!1066784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560036 () Bool)

(assert (=> b!1560036 (= e!869266 false)))

(declare-fun lt!670944 () Bool)

(declare-datatypes ((tuple2!25022 0))(
  ( (tuple2!25023 (_1!12522 (_ BitVec 64)) (_2!12522 V!59573)) )
))
(declare-datatypes ((List!36376 0))(
  ( (Nil!36373) (Cons!36372 (h!37818 tuple2!25022) (t!51109 List!36376)) )
))
(declare-datatypes ((ListLongMap!22457 0))(
  ( (ListLongMap!22458 (toList!11244 List!36376)) )
))
(declare-fun contains!10234 (ListLongMap!22457 (_ BitVec 64)) Bool)

(assert (=> b!1560036 (= lt!670944 (contains!10234 (ListLongMap!22458 Nil!36373) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1560037 () Bool)

(assert (=> b!1560037 (= e!869267 (and e!869265 mapRes!59163))))

(declare-fun condMapEmpty!59163 () Bool)

(declare-fun mapDefault!59163 () ValueCell!18232)

