; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84738 () Bool)

(assert start!84738)

(declare-fun b_free!20093 () Bool)

(declare-fun b_next!20093 () Bool)

(assert (=> start!84738 (= b_free!20093 (not b_next!20093))))

(declare-fun tp!70078 () Bool)

(declare-fun b_and!32263 () Bool)

(assert (=> start!84738 (= tp!70078 b_and!32263)))

(declare-fun b!990948 () Bool)

(declare-fun res!662525 () Bool)

(declare-fun e!558787 () Bool)

(assert (=> b!990948 (=> (not res!662525) (not e!558787))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62581 0))(
  ( (array!62582 (arr!30141 (Array (_ BitVec 32) (_ BitVec 64))) (size!30620 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62581)

(assert (=> b!990948 (= res!662525 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30620 _keys!1544))))))

(declare-fun mapIsEmpty!37016 () Bool)

(declare-fun mapRes!37016 () Bool)

(assert (=> mapIsEmpty!37016 mapRes!37016))

(declare-fun mapNonEmpty!37016 () Bool)

(declare-fun tp!70077 () Bool)

(declare-fun e!558791 () Bool)

(assert (=> mapNonEmpty!37016 (= mapRes!37016 (and tp!70077 e!558791))))

(declare-fun mapKey!37016 () (_ BitVec 32))

(declare-datatypes ((V!36061 0))(
  ( (V!36062 (val!11705 Int)) )
))
(declare-datatypes ((ValueCell!11173 0))(
  ( (ValueCellFull!11173 (v!14278 V!36061)) (EmptyCell!11173) )
))
(declare-datatypes ((array!62583 0))(
  ( (array!62584 (arr!30142 (Array (_ BitVec 32) ValueCell!11173)) (size!30621 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62583)

(declare-fun mapValue!37016 () ValueCell!11173)

(declare-fun mapRest!37016 () (Array (_ BitVec 32) ValueCell!11173))

(assert (=> mapNonEmpty!37016 (= (arr!30142 _values!1278) (store mapRest!37016 mapKey!37016 mapValue!37016))))

(declare-fun b!990949 () Bool)

(declare-fun e!558790 () Bool)

(assert (=> b!990949 (= e!558790 (bvsge from!1932 (size!30621 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!36061)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14926 0))(
  ( (tuple2!14927 (_1!7474 (_ BitVec 64)) (_2!7474 V!36061)) )
))
(declare-datatypes ((List!20855 0))(
  ( (Nil!20852) (Cons!20851 (h!22013 tuple2!14926) (t!29832 List!20855)) )
))
(declare-datatypes ((ListLongMap!13623 0))(
  ( (ListLongMap!13624 (toList!6827 List!20855)) )
))
(declare-fun lt!439706 () ListLongMap!13623)

(declare-fun zeroValue!1220 () V!36061)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3877 (array!62581 array!62583 (_ BitVec 32) (_ BitVec 32) V!36061 V!36061 (_ BitVec 32) Int) ListLongMap!13623)

(assert (=> b!990949 (= lt!439706 (getCurrentListMap!3877 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990950 () Bool)

(declare-fun e!558789 () Bool)

(declare-fun e!558788 () Bool)

(assert (=> b!990950 (= e!558789 (and e!558788 mapRes!37016))))

(declare-fun condMapEmpty!37016 () Bool)

(declare-fun mapDefault!37016 () ValueCell!11173)

