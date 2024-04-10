; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112536 () Bool)

(assert start!112536)

(declare-fun b_free!30931 () Bool)

(declare-fun b_next!30931 () Bool)

(assert (=> start!112536 (= b_free!30931 (not b_next!30931))))

(declare-fun tp!108429 () Bool)

(declare-fun b_and!49839 () Bool)

(assert (=> start!112536 (= tp!108429 b_and!49839)))

(declare-fun b!1334886 () Bool)

(declare-fun e!760267 () Bool)

(assert (=> b!1334886 (= e!760267 false)))

(declare-datatypes ((V!54225 0))(
  ( (V!54226 (val!18495 Int)) )
))
(declare-datatypes ((ValueCell!17522 0))(
  ( (ValueCellFull!17522 (v!21132 V!54225)) (EmptyCell!17522) )
))
(declare-datatypes ((array!90544 0))(
  ( (array!90545 (arr!43738 (Array (_ BitVec 32) ValueCell!17522)) (size!44288 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90544)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90546 0))(
  ( (array!90547 (arr!43739 (Array (_ BitVec 32) (_ BitVec 64))) (size!44289 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90546)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592402 () Bool)

(declare-fun minValue!1262 () V!54225)

(declare-fun zeroValue!1262 () V!54225)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23848 0))(
  ( (tuple2!23849 (_1!11935 (_ BitVec 64)) (_2!11935 V!54225)) )
))
(declare-datatypes ((List!30986 0))(
  ( (Nil!30983) (Cons!30982 (h!32191 tuple2!23848) (t!45250 List!30986)) )
))
(declare-datatypes ((ListLongMap!21505 0))(
  ( (ListLongMap!21506 (toList!10768 List!30986)) )
))
(declare-fun contains!8932 (ListLongMap!21505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5742 (array!90546 array!90544 (_ BitVec 32) (_ BitVec 32) V!54225 V!54225 (_ BitVec 32) Int) ListLongMap!21505)

(assert (=> b!1334886 (= lt!592402 (contains!8932 (getCurrentListMap!5742 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334887 () Bool)

(declare-fun res!885942 () Bool)

(assert (=> b!1334887 (=> (not res!885942) (not e!760267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90546 (_ BitVec 32)) Bool)

(assert (=> b!1334887 (= res!885942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334888 () Bool)

(declare-fun e!760265 () Bool)

(declare-fun tp_is_empty!36841 () Bool)

(assert (=> b!1334888 (= e!760265 tp_is_empty!36841)))

(declare-fun b!1334889 () Bool)

(declare-fun res!885940 () Bool)

(assert (=> b!1334889 (=> (not res!885940) (not e!760267))))

(assert (=> b!1334889 (= res!885940 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44289 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!885941 () Bool)

(assert (=> start!112536 (=> (not res!885941) (not e!760267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112536 (= res!885941 (validMask!0 mask!1998))))

(assert (=> start!112536 e!760267))

(declare-fun e!760264 () Bool)

(declare-fun array_inv!32983 (array!90544) Bool)

(assert (=> start!112536 (and (array_inv!32983 _values!1320) e!760264)))

(assert (=> start!112536 true))

(declare-fun array_inv!32984 (array!90546) Bool)

(assert (=> start!112536 (array_inv!32984 _keys!1590)))

(assert (=> start!112536 tp!108429))

(assert (=> start!112536 tp_is_empty!36841))

(declare-fun b!1334890 () Bool)

(declare-fun res!885939 () Bool)

(assert (=> b!1334890 (=> (not res!885939) (not e!760267))))

(assert (=> b!1334890 (= res!885939 (and (= (size!44288 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44289 _keys!1590) (size!44288 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334891 () Bool)

(declare-fun res!885938 () Bool)

(assert (=> b!1334891 (=> (not res!885938) (not e!760267))))

(declare-datatypes ((List!30987 0))(
  ( (Nil!30984) (Cons!30983 (h!32192 (_ BitVec 64)) (t!45251 List!30987)) )
))
(declare-fun arrayNoDuplicates!0 (array!90546 (_ BitVec 32) List!30987) Bool)

(assert (=> b!1334891 (= res!885938 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30984))))

(declare-fun b!1334892 () Bool)

(declare-fun e!760266 () Bool)

(declare-fun mapRes!56935 () Bool)

(assert (=> b!1334892 (= e!760264 (and e!760266 mapRes!56935))))

(declare-fun condMapEmpty!56935 () Bool)

(declare-fun mapDefault!56935 () ValueCell!17522)

