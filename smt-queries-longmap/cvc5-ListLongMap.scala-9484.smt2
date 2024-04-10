; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112512 () Bool)

(assert start!112512)

(declare-fun b_free!30907 () Bool)

(declare-fun b_next!30907 () Bool)

(assert (=> start!112512 (= b_free!30907 (not b_next!30907))))

(declare-fun tp!108357 () Bool)

(declare-fun b_and!49815 () Bool)

(assert (=> start!112512 (= tp!108357 b_and!49815)))

(declare-fun b!1334598 () Bool)

(declare-fun res!885762 () Bool)

(declare-fun e!760086 () Bool)

(assert (=> b!1334598 (=> (not res!885762) (not e!760086))))

(declare-datatypes ((V!54193 0))(
  ( (V!54194 (val!18483 Int)) )
))
(declare-datatypes ((ValueCell!17510 0))(
  ( (ValueCellFull!17510 (v!21120 V!54193)) (EmptyCell!17510) )
))
(declare-datatypes ((array!90500 0))(
  ( (array!90501 (arr!43716 (Array (_ BitVec 32) ValueCell!17510)) (size!44266 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90500)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90502 0))(
  ( (array!90503 (arr!43717 (Array (_ BitVec 32) (_ BitVec 64))) (size!44267 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90502)

(assert (=> b!1334598 (= res!885762 (and (= (size!44266 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44267 _keys!1590) (size!44266 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334599 () Bool)

(declare-fun res!885758 () Bool)

(assert (=> b!1334599 (=> (not res!885758) (not e!760086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90502 (_ BitVec 32)) Bool)

(assert (=> b!1334599 (= res!885758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334600 () Bool)

(declare-fun res!885761 () Bool)

(assert (=> b!1334600 (=> (not res!885761) (not e!760086))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1334600 (= res!885761 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44267 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!885759 () Bool)

(assert (=> start!112512 (=> (not res!885759) (not e!760086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112512 (= res!885759 (validMask!0 mask!1998))))

(assert (=> start!112512 e!760086))

(declare-fun e!760083 () Bool)

(declare-fun array_inv!32969 (array!90500) Bool)

(assert (=> start!112512 (and (array_inv!32969 _values!1320) e!760083)))

(assert (=> start!112512 true))

(declare-fun array_inv!32970 (array!90502) Bool)

(assert (=> start!112512 (array_inv!32970 _keys!1590)))

(assert (=> start!112512 tp!108357))

(declare-fun tp_is_empty!36817 () Bool)

(assert (=> start!112512 tp_is_empty!36817))

(declare-fun mapIsEmpty!56899 () Bool)

(declare-fun mapRes!56899 () Bool)

(assert (=> mapIsEmpty!56899 mapRes!56899))

(declare-fun b!1334601 () Bool)

(declare-fun e!760084 () Bool)

(assert (=> b!1334601 (= e!760083 (and e!760084 mapRes!56899))))

(declare-fun condMapEmpty!56899 () Bool)

(declare-fun mapDefault!56899 () ValueCell!17510)

