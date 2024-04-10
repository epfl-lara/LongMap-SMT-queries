; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133896 () Bool)

(assert start!133896)

(declare-fun b_free!32141 () Bool)

(declare-fun b_next!32141 () Bool)

(assert (=> start!133896 (= b_free!32141 (not b_next!32141))))

(declare-fun tp!113722 () Bool)

(declare-fun b_and!51719 () Bool)

(assert (=> start!133896 (= tp!113722 b_and!51719)))

(declare-fun b!1565309 () Bool)

(declare-fun res!1070041 () Bool)

(declare-fun e!872488 () Bool)

(assert (=> b!1565309 (=> (not res!1070041) (not e!872488))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60093 0))(
  ( (V!60094 (val!19541 Int)) )
))
(declare-datatypes ((ValueCell!18427 0))(
  ( (ValueCellFull!18427 (v!22296 V!60093)) (EmptyCell!18427) )
))
(declare-datatypes ((array!104518 0))(
  ( (array!104519 (arr!50447 (Array (_ BitVec 32) ValueCell!18427)) (size!50997 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104518)

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!104520 0))(
  ( (array!104521 (arr!50448 (Array (_ BitVec 32) (_ BitVec 64))) (size!50998 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104520)

(assert (=> b!1565309 (= res!1070041 (and (= (size!50997 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50998 _keys!637) (size!50997 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565310 () Bool)

(declare-fun res!1070043 () Bool)

(assert (=> b!1565310 (=> (not res!1070043) (not e!872488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104520 (_ BitVec 32)) Bool)

(assert (=> b!1565310 (= res!1070043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565311 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565311 (= e!872488 (not (bvslt (bvsub (size!50998 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50998 _keys!637)) from!782))))))

(declare-fun lt!672202 () V!60093)

(declare-datatypes ((tuple2!25210 0))(
  ( (tuple2!25211 (_1!12616 (_ BitVec 64)) (_2!12616 V!60093)) )
))
(declare-datatypes ((List!36598 0))(
  ( (Nil!36595) (Cons!36594 (h!38040 tuple2!25210) (t!51453 List!36598)) )
))
(declare-datatypes ((ListLongMap!22645 0))(
  ( (ListLongMap!22646 (toList!11338 List!36598)) )
))
(declare-fun lt!672201 () ListLongMap!22645)

(declare-fun contains!10327 (ListLongMap!22645 (_ BitVec 64)) Bool)

(declare-fun +!5068 (ListLongMap!22645 tuple2!25210) ListLongMap!22645)

(assert (=> b!1565311 (not (contains!10327 (+!5068 lt!672201 (tuple2!25211 (select (arr!50448 _keys!637) from!782) lt!672202)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51999 0))(
  ( (Unit!52000) )
))
(declare-fun lt!672203 () Unit!51999)

(declare-fun addStillNotContains!558 (ListLongMap!22645 (_ BitVec 64) V!60093 (_ BitVec 64)) Unit!51999)

(assert (=> b!1565311 (= lt!672203 (addStillNotContains!558 lt!672201 (select (arr!50448 _keys!637) from!782) lt!672202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26327 (ValueCell!18427 V!60093) V!60093)

(declare-fun dynLambda!3852 (Int (_ BitVec 64)) V!60093)

(assert (=> b!1565311 (= lt!672202 (get!26327 (select (arr!50447 _values!487) from!782) (dynLambda!3852 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60093)

(declare-fun minValue!453 () V!60093)

(declare-fun getCurrentListMapNoExtraKeys!6703 (array!104520 array!104518 (_ BitVec 32) (_ BitVec 32) V!60093 V!60093 (_ BitVec 32) Int) ListLongMap!22645)

(assert (=> b!1565311 (= lt!672201 (getCurrentListMapNoExtraKeys!6703 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070040 () Bool)

(assert (=> start!133896 (=> (not res!1070040) (not e!872488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133896 (= res!1070040 (validMask!0 mask!947))))

(assert (=> start!133896 e!872488))

(assert (=> start!133896 tp!113722))

(declare-fun tp_is_empty!38915 () Bool)

(assert (=> start!133896 tp_is_empty!38915))

(assert (=> start!133896 true))

(declare-fun array_inv!39201 (array!104520) Bool)

(assert (=> start!133896 (array_inv!39201 _keys!637)))

(declare-fun e!872485 () Bool)

(declare-fun array_inv!39202 (array!104518) Bool)

(assert (=> start!133896 (and (array_inv!39202 _values!487) e!872485)))

(declare-fun b!1565312 () Bool)

(declare-fun e!872486 () Bool)

(assert (=> b!1565312 (= e!872486 tp_is_empty!38915)))

(declare-fun b!1565313 () Bool)

(declare-fun res!1070039 () Bool)

(assert (=> b!1565313 (=> (not res!1070039) (not e!872488))))

(assert (=> b!1565313 (= res!1070039 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50998 _keys!637)) (bvslt from!782 (size!50998 _keys!637))))))

(declare-fun b!1565314 () Bool)

(declare-fun mapRes!59761 () Bool)

(assert (=> b!1565314 (= e!872485 (and e!872486 mapRes!59761))))

(declare-fun condMapEmpty!59761 () Bool)

(declare-fun mapDefault!59761 () ValueCell!18427)

