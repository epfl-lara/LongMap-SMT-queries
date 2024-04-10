; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112096 () Bool)

(assert start!112096)

(declare-fun mapIsEmpty!56275 () Bool)

(declare-fun mapRes!56275 () Bool)

(assert (=> mapIsEmpty!56275 mapRes!56275))

(declare-fun b!1327721 () Bool)

(declare-fun res!881013 () Bool)

(declare-fun e!756885 () Bool)

(assert (=> b!1327721 (=> (not res!881013) (not e!756885))))

(declare-datatypes ((array!89710 0))(
  ( (array!89711 (arr!43321 (Array (_ BitVec 32) (_ BitVec 64))) (size!43871 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89710)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89710 (_ BitVec 32)) Bool)

(assert (=> b!1327721 (= res!881013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327722 () Bool)

(declare-fun e!756884 () Bool)

(declare-fun tp_is_empty!36401 () Bool)

(assert (=> b!1327722 (= e!756884 tp_is_empty!36401)))

(declare-fun res!881011 () Bool)

(assert (=> start!112096 (=> (not res!881011) (not e!756885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112096 (= res!881011 (validMask!0 mask!1998))))

(assert (=> start!112096 e!756885))

(assert (=> start!112096 true))

(declare-datatypes ((V!53637 0))(
  ( (V!53638 (val!18275 Int)) )
))
(declare-datatypes ((ValueCell!17302 0))(
  ( (ValueCellFull!17302 (v!20912 V!53637)) (EmptyCell!17302) )
))
(declare-datatypes ((array!89712 0))(
  ( (array!89713 (arr!43322 (Array (_ BitVec 32) ValueCell!17302)) (size!43872 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89712)

(declare-fun e!756886 () Bool)

(declare-fun array_inv!32697 (array!89712) Bool)

(assert (=> start!112096 (and (array_inv!32697 _values!1320) e!756886)))

(declare-fun array_inv!32698 (array!89710) Bool)

(assert (=> start!112096 (array_inv!32698 _keys!1590)))

(declare-fun mapNonEmpty!56275 () Bool)

(declare-fun tp!107182 () Bool)

(declare-fun e!756883 () Bool)

(assert (=> mapNonEmpty!56275 (= mapRes!56275 (and tp!107182 e!756883))))

(declare-fun mapRest!56275 () (Array (_ BitVec 32) ValueCell!17302))

(declare-fun mapValue!56275 () ValueCell!17302)

(declare-fun mapKey!56275 () (_ BitVec 32))

(assert (=> mapNonEmpty!56275 (= (arr!43322 _values!1320) (store mapRest!56275 mapKey!56275 mapValue!56275))))

(declare-fun b!1327723 () Bool)

(assert (=> b!1327723 (= e!756883 tp_is_empty!36401)))

(declare-fun b!1327724 () Bool)

(assert (=> b!1327724 (= e!756885 false)))

(declare-fun lt!590743 () Bool)

(declare-datatypes ((List!30696 0))(
  ( (Nil!30693) (Cons!30692 (h!31901 (_ BitVec 64)) (t!44702 List!30696)) )
))
(declare-fun arrayNoDuplicates!0 (array!89710 (_ BitVec 32) List!30696) Bool)

(assert (=> b!1327724 (= lt!590743 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30693))))

(declare-fun b!1327725 () Bool)

(assert (=> b!1327725 (= e!756886 (and e!756884 mapRes!56275))))

(declare-fun condMapEmpty!56275 () Bool)

(declare-fun mapDefault!56275 () ValueCell!17302)

