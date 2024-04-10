; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108406 () Bool)

(assert start!108406)

(declare-fun b_free!27953 () Bool)

(declare-fun b_next!27953 () Bool)

(assert (=> start!108406 (= b_free!27953 (not b_next!27953))))

(declare-fun tp!98969 () Bool)

(declare-fun b_and!46013 () Bool)

(assert (=> start!108406 (= tp!98969 b_and!46013)))

(declare-fun b!1279440 () Bool)

(declare-fun res!849909 () Bool)

(declare-fun e!731015 () Bool)

(assert (=> b!1279440 (=> (not res!849909) (not e!731015))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49893 0))(
  ( (V!49894 (val!16871 Int)) )
))
(declare-datatypes ((ValueCell!15898 0))(
  ( (ValueCellFull!15898 (v!19471 V!49893)) (EmptyCell!15898) )
))
(declare-datatypes ((array!84272 0))(
  ( (array!84273 (arr!40640 (Array (_ BitVec 32) ValueCell!15898)) (size!41190 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84272)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84274 0))(
  ( (array!84275 (arr!40641 (Array (_ BitVec 32) (_ BitVec 64))) (size!41191 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84274)

(assert (=> b!1279440 (= res!849909 (and (= (size!41190 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41191 _keys!1741) (size!41190 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279441 () Bool)

(declare-fun e!731014 () Bool)

(declare-fun tp_is_empty!33593 () Bool)

(assert (=> b!1279441 (= e!731014 tp_is_empty!33593)))

(declare-fun b!1279442 () Bool)

(declare-fun res!849907 () Bool)

(assert (=> b!1279442 (=> (not res!849907) (not e!731015))))

(declare-datatypes ((List!28785 0))(
  ( (Nil!28782) (Cons!28781 (h!29990 (_ BitVec 64)) (t!42325 List!28785)) )
))
(declare-fun arrayNoDuplicates!0 (array!84274 (_ BitVec 32) List!28785) Bool)

(assert (=> b!1279442 (= res!849907 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28782))))

(declare-fun b!1279443 () Bool)

(declare-fun e!731012 () Bool)

(assert (=> b!1279443 (= e!731012 tp_is_empty!33593)))

(declare-fun b!1279444 () Bool)

(assert (=> b!1279444 (= e!731015 false)))

(declare-fun minValue!1387 () V!49893)

(declare-fun zeroValue!1387 () V!49893)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576011 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21586 0))(
  ( (tuple2!21587 (_1!10804 (_ BitVec 64)) (_2!10804 V!49893)) )
))
(declare-datatypes ((List!28786 0))(
  ( (Nil!28783) (Cons!28782 (h!29991 tuple2!21586) (t!42326 List!28786)) )
))
(declare-datatypes ((ListLongMap!19243 0))(
  ( (ListLongMap!19244 (toList!9637 List!28786)) )
))
(declare-fun contains!7752 (ListLongMap!19243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4721 (array!84274 array!84272 (_ BitVec 32) (_ BitVec 32) V!49893 V!49893 (_ BitVec 32) Int) ListLongMap!19243)

(assert (=> b!1279444 (= lt!576011 (contains!7752 (getCurrentListMap!4721 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279445 () Bool)

(declare-fun e!731011 () Bool)

(declare-fun mapRes!51941 () Bool)

(assert (=> b!1279445 (= e!731011 (and e!731014 mapRes!51941))))

(declare-fun condMapEmpty!51941 () Bool)

(declare-fun mapDefault!51941 () ValueCell!15898)

