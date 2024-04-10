; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111722 () Bool)

(assert start!111722)

(declare-fun b_free!30379 () Bool)

(declare-fun b_next!30379 () Bool)

(assert (=> start!111722 (= b_free!30379 (not b_next!30379))))

(declare-fun tp!106612 () Bool)

(declare-fun b_and!48917 () Bool)

(assert (=> start!111722 (= tp!106612 b_and!48917)))

(declare-fun res!878723 () Bool)

(declare-fun e!754682 () Bool)

(assert (=> start!111722 (=> (not res!878723) (not e!754682))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111722 (= res!878723 (validMask!0 mask!2019))))

(assert (=> start!111722 e!754682))

(declare-datatypes ((array!89314 0))(
  ( (array!89315 (arr!43131 (Array (_ BitVec 32) (_ BitVec 64))) (size!43681 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89314)

(declare-fun array_inv!32559 (array!89314) Bool)

(assert (=> start!111722 (array_inv!32559 _keys!1609)))

(assert (=> start!111722 true))

(declare-fun tp_is_empty!36199 () Bool)

(assert (=> start!111722 tp_is_empty!36199))

(declare-datatypes ((V!53369 0))(
  ( (V!53370 (val!18174 Int)) )
))
(declare-datatypes ((ValueCell!17201 0))(
  ( (ValueCellFull!17201 (v!20804 V!53369)) (EmptyCell!17201) )
))
(declare-datatypes ((array!89316 0))(
  ( (array!89317 (arr!43132 (Array (_ BitVec 32) ValueCell!17201)) (size!43682 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89316)

(declare-fun e!754683 () Bool)

(declare-fun array_inv!32560 (array!89316) Bool)

(assert (=> start!111722 (and (array_inv!32560 _values!1337) e!754683)))

(assert (=> start!111722 tp!106612))

(declare-fun b!1323844 () Bool)

(assert (=> b!1323844 (= e!754682 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53369)

(declare-fun minValue!1279 () V!53369)

(declare-fun lt!589401 () Bool)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23432 0))(
  ( (tuple2!23433 (_1!11727 (_ BitVec 64)) (_2!11727 V!53369)) )
))
(declare-datatypes ((List!30573 0))(
  ( (Nil!30570) (Cons!30569 (h!31778 tuple2!23432) (t!44499 List!30573)) )
))
(declare-datatypes ((ListLongMap!21089 0))(
  ( (ListLongMap!21090 (toList!10560 List!30573)) )
))
(declare-fun contains!8715 (ListLongMap!21089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5556 (array!89314 array!89316 (_ BitVec 32) (_ BitVec 32) V!53369 V!53369 (_ BitVec 32) Int) ListLongMap!21089)

(assert (=> b!1323844 (= lt!589401 (contains!8715 (getCurrentListMap!5556 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!55946 () Bool)

(declare-fun mapRes!55946 () Bool)

(declare-fun tp!106613 () Bool)

(declare-fun e!754684 () Bool)

(assert (=> mapNonEmpty!55946 (= mapRes!55946 (and tp!106613 e!754684))))

(declare-fun mapKey!55946 () (_ BitVec 32))

(declare-fun mapValue!55946 () ValueCell!17201)

(declare-fun mapRest!55946 () (Array (_ BitVec 32) ValueCell!17201))

(assert (=> mapNonEmpty!55946 (= (arr!43132 _values!1337) (store mapRest!55946 mapKey!55946 mapValue!55946))))

(declare-fun b!1323845 () Bool)

(assert (=> b!1323845 (= e!754684 tp_is_empty!36199)))

(declare-fun b!1323846 () Bool)

(declare-fun e!754680 () Bool)

(assert (=> b!1323846 (= e!754680 tp_is_empty!36199)))

(declare-fun b!1323847 () Bool)

(assert (=> b!1323847 (= e!754683 (and e!754680 mapRes!55946))))

(declare-fun condMapEmpty!55946 () Bool)

(declare-fun mapDefault!55946 () ValueCell!17201)

