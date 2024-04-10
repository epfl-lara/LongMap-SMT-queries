; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108808 () Bool)

(assert start!108808)

(declare-fun b_free!28321 () Bool)

(declare-fun b_next!28321 () Bool)

(assert (=> start!108808 (= b_free!28321 (not b_next!28321))))

(declare-fun tp!100078 () Bool)

(declare-fun b_and!46387 () Bool)

(assert (=> start!108808 (= tp!100078 b_and!46387)))

(declare-fun b!1284919 () Bool)

(declare-fun res!853590 () Bool)

(declare-fun e!733966 () Bool)

(assert (=> b!1284919 (=> (not res!853590) (not e!733966))))

(declare-datatypes ((V!50385 0))(
  ( (V!50386 (val!17055 Int)) )
))
(declare-fun minValue!1387 () V!50385)

(declare-fun zeroValue!1387 () V!50385)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16082 0))(
  ( (ValueCellFull!16082 (v!19657 V!50385)) (EmptyCell!16082) )
))
(declare-datatypes ((array!84980 0))(
  ( (array!84981 (arr!40992 (Array (_ BitVec 32) ValueCell!16082)) (size!41542 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84980)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84982 0))(
  ( (array!84983 (arr!40993 (Array (_ BitVec 32) (_ BitVec 64))) (size!41543 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84982)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21852 0))(
  ( (tuple2!21853 (_1!10937 (_ BitVec 64)) (_2!10937 V!50385)) )
))
(declare-datatypes ((List!29046 0))(
  ( (Nil!29043) (Cons!29042 (h!30251 tuple2!21852) (t!42590 List!29046)) )
))
(declare-datatypes ((ListLongMap!19509 0))(
  ( (ListLongMap!19510 (toList!9770 List!29046)) )
))
(declare-fun contains!7887 (ListLongMap!19509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4849 (array!84982 array!84980 (_ BitVec 32) (_ BitVec 32) V!50385 V!50385 (_ BitVec 32) Int) ListLongMap!19509)

(assert (=> b!1284919 (= res!853590 (contains!7887 (getCurrentListMap!4849 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284920 () Bool)

(declare-fun e!733969 () Bool)

(declare-fun tp_is_empty!33961 () Bool)

(assert (=> b!1284920 (= e!733969 tp_is_empty!33961)))

(declare-fun b!1284921 () Bool)

(declare-fun e!733968 () Bool)

(assert (=> b!1284921 (= e!733968 tp_is_empty!33961)))

(declare-fun b!1284922 () Bool)

(declare-fun res!853583 () Bool)

(assert (=> b!1284922 (=> (not res!853583) (not e!733966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84982 (_ BitVec 32)) Bool)

(assert (=> b!1284922 (= res!853583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284923 () Bool)

(assert (=> b!1284923 (= e!733966 false)))

(declare-fun lt!576859 () Bool)

(declare-fun +!4301 (ListLongMap!19509 tuple2!21852) ListLongMap!19509)

(declare-fun getCurrentListMapNoExtraKeys!5931 (array!84982 array!84980 (_ BitVec 32) (_ BitVec 32) V!50385 V!50385 (_ BitVec 32) Int) ListLongMap!19509)

(assert (=> b!1284923 (= lt!576859 (contains!7887 (+!4301 (getCurrentListMapNoExtraKeys!5931 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun b!1284924 () Bool)

(declare-fun res!853582 () Bool)

(assert (=> b!1284924 (=> (not res!853582) (not e!733966))))

(assert (=> b!1284924 (= res!853582 (and (= (size!41542 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41543 _keys!1741) (size!41542 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284925 () Bool)

(declare-fun res!853584 () Bool)

(assert (=> b!1284925 (=> (not res!853584) (not e!733966))))

(declare-datatypes ((List!29047 0))(
  ( (Nil!29044) (Cons!29043 (h!30252 (_ BitVec 64)) (t!42591 List!29047)) )
))
(declare-fun arrayNoDuplicates!0 (array!84982 (_ BitVec 32) List!29047) Bool)

(assert (=> b!1284925 (= res!853584 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29044))))

(declare-fun b!1284926 () Bool)

(declare-fun res!853585 () Bool)

(assert (=> b!1284926 (=> (not res!853585) (not e!733966))))

(assert (=> b!1284926 (= res!853585 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41543 _keys!1741))))))

(declare-fun b!1284928 () Bool)

(declare-fun res!853587 () Bool)

(assert (=> b!1284928 (=> (not res!853587) (not e!733966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284928 (= res!853587 (validKeyInArray!0 (select (arr!40993 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!52499 () Bool)

(declare-fun mapRes!52499 () Bool)

(declare-fun tp!100079 () Bool)

(assert (=> mapNonEmpty!52499 (= mapRes!52499 (and tp!100079 e!733969))))

(declare-fun mapValue!52499 () ValueCell!16082)

(declare-fun mapKey!52499 () (_ BitVec 32))

(declare-fun mapRest!52499 () (Array (_ BitVec 32) ValueCell!16082))

(assert (=> mapNonEmpty!52499 (= (arr!40992 _values!1445) (store mapRest!52499 mapKey!52499 mapValue!52499))))

(declare-fun b!1284929 () Bool)

(declare-fun e!733967 () Bool)

(assert (=> b!1284929 (= e!733967 (and e!733968 mapRes!52499))))

(declare-fun condMapEmpty!52499 () Bool)

(declare-fun mapDefault!52499 () ValueCell!16082)

