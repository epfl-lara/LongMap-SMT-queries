; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112488 () Bool)

(assert start!112488)

(declare-fun b_free!30883 () Bool)

(declare-fun b_next!30883 () Bool)

(assert (=> start!112488 (= b_free!30883 (not b_next!30883))))

(declare-fun tp!108285 () Bool)

(declare-fun b_and!49767 () Bool)

(assert (=> start!112488 (= tp!108285 b_and!49767)))

(declare-fun b!1334082 () Bool)

(declare-fun res!885384 () Bool)

(declare-fun e!759870 () Bool)

(assert (=> b!1334082 (=> (not res!885384) (not e!759870))))

(declare-datatypes ((V!54161 0))(
  ( (V!54162 (val!18471 Int)) )
))
(declare-datatypes ((ValueCell!17498 0))(
  ( (ValueCellFull!17498 (v!21108 V!54161)) (EmptyCell!17498) )
))
(declare-datatypes ((array!90452 0))(
  ( (array!90453 (arr!43692 (Array (_ BitVec 32) ValueCell!17498)) (size!44242 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90452)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90454 0))(
  ( (array!90455 (arr!43693 (Array (_ BitVec 32) (_ BitVec 64))) (size!44243 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90454)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun zeroValue!1262 () V!54161)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54161)

(declare-datatypes ((tuple2!23812 0))(
  ( (tuple2!23813 (_1!11917 (_ BitVec 64)) (_2!11917 V!54161)) )
))
(declare-datatypes ((List!30954 0))(
  ( (Nil!30951) (Cons!30950 (h!32159 tuple2!23812) (t!45196 List!30954)) )
))
(declare-datatypes ((ListLongMap!21469 0))(
  ( (ListLongMap!21470 (toList!10750 List!30954)) )
))
(declare-fun contains!8914 (ListLongMap!21469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5727 (array!90454 array!90452 (_ BitVec 32) (_ BitVec 32) V!54161 V!54161 (_ BitVec 32) Int) ListLongMap!21469)

(assert (=> b!1334082 (= res!885384 (contains!8914 (getCurrentListMap!5727 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56863 () Bool)

(declare-fun mapRes!56863 () Bool)

(assert (=> mapIsEmpty!56863 mapRes!56863))

(declare-fun b!1334083 () Bool)

(declare-fun e!759869 () Bool)

(declare-fun tp_is_empty!36793 () Bool)

(assert (=> b!1334083 (= e!759869 tp_is_empty!36793)))

(declare-fun b!1334084 () Bool)

(declare-fun res!885376 () Bool)

(assert (=> b!1334084 (=> (not res!885376) (not e!759870))))

(assert (=> b!1334084 (= res!885376 (and (= (size!44242 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44243 _keys!1590) (size!44242 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334086 () Bool)

(declare-fun res!885381 () Bool)

(assert (=> b!1334086 (=> (not res!885381) (not e!759870))))

(assert (=> b!1334086 (= res!885381 (not (= (select (arr!43693 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1334087 () Bool)

(declare-fun res!885379 () Bool)

(assert (=> b!1334087 (=> (not res!885379) (not e!759870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90454 (_ BitVec 32)) Bool)

(assert (=> b!1334087 (= res!885379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334088 () Bool)

(declare-fun e!759871 () Bool)

(assert (=> b!1334088 (= e!759871 (and e!759869 mapRes!56863))))

(declare-fun condMapEmpty!56863 () Bool)

(declare-fun mapDefault!56863 () ValueCell!17498)

