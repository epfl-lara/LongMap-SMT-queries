; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134114 () Bool)

(assert start!134114)

(declare-fun b_free!32225 () Bool)

(declare-fun b_next!32225 () Bool)

(assert (=> start!134114 (= b_free!32225 (not b_next!32225))))

(declare-fun tp!113996 () Bool)

(declare-fun b_and!51873 () Bool)

(assert (=> start!134114 (= tp!113996 b_and!51873)))

(declare-fun b!1567427 () Bool)

(declare-fun res!1071248 () Bool)

(declare-fun e!873734 () Bool)

(assert (=> b!1567427 (=> (not res!1071248) (not e!873734))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104700 0))(
  ( (array!104701 (arr!50534 (Array (_ BitVec 32) (_ BitVec 64))) (size!51084 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104700)

(assert (=> b!1567427 (= res!1071248 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51084 _keys!637)) (bvslt from!782 (size!51084 _keys!637))))))

(declare-fun b!1567428 () Bool)

(declare-fun res!1071250 () Bool)

(assert (=> b!1567428 (=> (not res!1071250) (not e!873734))))

(declare-datatypes ((List!36660 0))(
  ( (Nil!36657) (Cons!36656 (h!38103 (_ BitVec 64)) (t!51566 List!36660)) )
))
(declare-fun arrayNoDuplicates!0 (array!104700 (_ BitVec 32) List!36660) Bool)

(assert (=> b!1567428 (= res!1071250 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36657))))

(declare-fun b!1567429 () Bool)

(declare-fun e!873733 () Bool)

(declare-fun tp_is_empty!39005 () Bool)

(assert (=> b!1567429 (= e!873733 tp_is_empty!39005)))

(declare-fun mapNonEmpty!59910 () Bool)

(declare-fun mapRes!59910 () Bool)

(declare-fun tp!113997 () Bool)

(declare-fun e!873735 () Bool)

(assert (=> mapNonEmpty!59910 (= mapRes!59910 (and tp!113997 e!873735))))

(declare-datatypes ((V!60213 0))(
  ( (V!60214 (val!19586 Int)) )
))
(declare-datatypes ((ValueCell!18472 0))(
  ( (ValueCellFull!18472 (v!22346 V!60213)) (EmptyCell!18472) )
))
(declare-fun mapValue!59910 () ValueCell!18472)

(declare-fun mapKey!59910 () (_ BitVec 32))

(declare-datatypes ((array!104702 0))(
  ( (array!104703 (arr!50535 (Array (_ BitVec 32) ValueCell!18472)) (size!51085 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104702)

(declare-fun mapRest!59910 () (Array (_ BitVec 32) ValueCell!18472))

(assert (=> mapNonEmpty!59910 (= (arr!50535 _values!487) (store mapRest!59910 mapKey!59910 mapValue!59910))))

(declare-fun b!1567430 () Bool)

(declare-fun res!1071249 () Bool)

(assert (=> b!1567430 (=> (not res!1071249) (not e!873734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567430 (= res!1071249 (not (validKeyInArray!0 (select (arr!50534 _keys!637) from!782))))))

(declare-fun b!1567431 () Bool)

(declare-fun e!873731 () Bool)

(declare-datatypes ((tuple2!25274 0))(
  ( (tuple2!25275 (_1!12648 (_ BitVec 64)) (_2!12648 V!60213)) )
))
(declare-datatypes ((List!36661 0))(
  ( (Nil!36658) (Cons!36657 (h!38104 tuple2!25274) (t!51567 List!36661)) )
))
(declare-datatypes ((ListLongMap!22709 0))(
  ( (ListLongMap!22710 (toList!11370 List!36661)) )
))
(declare-fun lt!672939 () ListLongMap!22709)

(declare-fun contains!10365 (ListLongMap!22709 (_ BitVec 64)) Bool)

(assert (=> b!1567431 (= e!873731 (contains!10365 lt!672939 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1071252 () Bool)

(assert (=> start!134114 (=> (not res!1071252) (not e!873734))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134114 (= res!1071252 (validMask!0 mask!947))))

(assert (=> start!134114 e!873734))

(assert (=> start!134114 tp!113996))

(assert (=> start!134114 tp_is_empty!39005))

(assert (=> start!134114 true))

(declare-fun array_inv!39261 (array!104700) Bool)

(assert (=> start!134114 (array_inv!39261 _keys!637)))

(declare-fun e!873732 () Bool)

(declare-fun array_inv!39262 (array!104702) Bool)

(assert (=> start!134114 (and (array_inv!39262 _values!487) e!873732)))

(declare-fun b!1567432 () Bool)

(declare-fun res!1071253 () Bool)

(assert (=> b!1567432 (=> (not res!1071253) (not e!873734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104700 (_ BitVec 32)) Bool)

(assert (=> b!1567432 (= res!1071253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567433 () Bool)

(assert (=> b!1567433 (= e!873734 e!873731)))

(declare-fun res!1071251 () Bool)

(assert (=> b!1567433 (=> res!1071251 e!873731)))

(assert (=> b!1567433 (= res!1071251 (contains!10365 lt!672939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60213)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60213)

(declare-fun getCurrentListMapNoExtraKeys!6735 (array!104700 array!104702 (_ BitVec 32) (_ BitVec 32) V!60213 V!60213 (_ BitVec 32) Int) ListLongMap!22709)

(assert (=> b!1567433 (= lt!672939 (getCurrentListMapNoExtraKeys!6735 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567434 () Bool)

(assert (=> b!1567434 (= e!873735 tp_is_empty!39005)))

(declare-fun b!1567435 () Bool)

(assert (=> b!1567435 (= e!873732 (and e!873733 mapRes!59910))))

(declare-fun condMapEmpty!59910 () Bool)

(declare-fun mapDefault!59910 () ValueCell!18472)

