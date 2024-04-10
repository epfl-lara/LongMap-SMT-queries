; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112120 () Bool)

(assert start!112120)

(declare-fun b!1327937 () Bool)

(declare-fun res!881119 () Bool)

(declare-fun e!757066 () Bool)

(assert (=> b!1327937 (=> (not res!881119) (not e!757066))))

(declare-datatypes ((array!89750 0))(
  ( (array!89751 (arr!43341 (Array (_ BitVec 32) (_ BitVec 64))) (size!43891 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89750)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89750 (_ BitVec 32)) Bool)

(assert (=> b!1327937 (= res!881119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327938 () Bool)

(declare-fun e!757063 () Bool)

(declare-fun tp_is_empty!36425 () Bool)

(assert (=> b!1327938 (= e!757063 tp_is_empty!36425)))

(declare-fun b!1327939 () Bool)

(assert (=> b!1327939 (= e!757066 false)))

(declare-fun lt!590779 () Bool)

(declare-datatypes ((List!30703 0))(
  ( (Nil!30700) (Cons!30699 (h!31908 (_ BitVec 64)) (t!44709 List!30703)) )
))
(declare-fun arrayNoDuplicates!0 (array!89750 (_ BitVec 32) List!30703) Bool)

(assert (=> b!1327939 (= lt!590779 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30700))))

(declare-fun res!881120 () Bool)

(assert (=> start!112120 (=> (not res!881120) (not e!757066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112120 (= res!881120 (validMask!0 mask!1998))))

(assert (=> start!112120 e!757066))

(assert (=> start!112120 true))

(declare-datatypes ((V!53669 0))(
  ( (V!53670 (val!18287 Int)) )
))
(declare-datatypes ((ValueCell!17314 0))(
  ( (ValueCellFull!17314 (v!20924 V!53669)) (EmptyCell!17314) )
))
(declare-datatypes ((array!89752 0))(
  ( (array!89753 (arr!43342 (Array (_ BitVec 32) ValueCell!17314)) (size!43892 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89752)

(declare-fun e!757064 () Bool)

(declare-fun array_inv!32711 (array!89752) Bool)

(assert (=> start!112120 (and (array_inv!32711 _values!1320) e!757064)))

(declare-fun array_inv!32712 (array!89750) Bool)

(assert (=> start!112120 (array_inv!32712 _keys!1590)))

(declare-fun mapIsEmpty!56311 () Bool)

(declare-fun mapRes!56311 () Bool)

(assert (=> mapIsEmpty!56311 mapRes!56311))

(declare-fun b!1327940 () Bool)

(declare-fun res!881121 () Bool)

(assert (=> b!1327940 (=> (not res!881121) (not e!757066))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327940 (= res!881121 (and (= (size!43892 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43891 _keys!1590) (size!43892 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56311 () Bool)

(declare-fun tp!107218 () Bool)

(assert (=> mapNonEmpty!56311 (= mapRes!56311 (and tp!107218 e!757063))))

(declare-fun mapValue!56311 () ValueCell!17314)

(declare-fun mapRest!56311 () (Array (_ BitVec 32) ValueCell!17314))

(declare-fun mapKey!56311 () (_ BitVec 32))

(assert (=> mapNonEmpty!56311 (= (arr!43342 _values!1320) (store mapRest!56311 mapKey!56311 mapValue!56311))))

(declare-fun b!1327941 () Bool)

(declare-fun e!757062 () Bool)

(assert (=> b!1327941 (= e!757064 (and e!757062 mapRes!56311))))

(declare-fun condMapEmpty!56311 () Bool)

(declare-fun mapDefault!56311 () ValueCell!17314)

