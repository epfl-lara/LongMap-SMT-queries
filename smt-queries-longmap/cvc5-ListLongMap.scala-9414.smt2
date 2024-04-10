; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112092 () Bool)

(assert start!112092)

(declare-fun res!880993 () Bool)

(declare-fun e!756852 () Bool)

(assert (=> start!112092 (=> (not res!880993) (not e!756852))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112092 (= res!880993 (validMask!0 mask!1998))))

(assert (=> start!112092 e!756852))

(assert (=> start!112092 true))

(declare-datatypes ((V!53633 0))(
  ( (V!53634 (val!18273 Int)) )
))
(declare-datatypes ((ValueCell!17300 0))(
  ( (ValueCellFull!17300 (v!20910 V!53633)) (EmptyCell!17300) )
))
(declare-datatypes ((array!89702 0))(
  ( (array!89703 (arr!43317 (Array (_ BitVec 32) ValueCell!17300)) (size!43867 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89702)

(declare-fun e!756855 () Bool)

(declare-fun array_inv!32693 (array!89702) Bool)

(assert (=> start!112092 (and (array_inv!32693 _values!1320) e!756855)))

(declare-datatypes ((array!89704 0))(
  ( (array!89705 (arr!43318 (Array (_ BitVec 32) (_ BitVec 64))) (size!43868 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89704)

(declare-fun array_inv!32694 (array!89704) Bool)

(assert (=> start!112092 (array_inv!32694 _keys!1590)))

(declare-fun mapIsEmpty!56269 () Bool)

(declare-fun mapRes!56269 () Bool)

(assert (=> mapIsEmpty!56269 mapRes!56269))

(declare-fun b!1327685 () Bool)

(declare-fun res!880995 () Bool)

(assert (=> b!1327685 (=> (not res!880995) (not e!756852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89704 (_ BitVec 32)) Bool)

(assert (=> b!1327685 (= res!880995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327686 () Bool)

(declare-fun e!756853 () Bool)

(declare-fun tp_is_empty!36397 () Bool)

(assert (=> b!1327686 (= e!756853 tp_is_empty!36397)))

(declare-fun b!1327687 () Bool)

(declare-fun e!756854 () Bool)

(assert (=> b!1327687 (= e!756854 tp_is_empty!36397)))

(declare-fun b!1327688 () Bool)

(assert (=> b!1327688 (= e!756855 (and e!756854 mapRes!56269))))

(declare-fun condMapEmpty!56269 () Bool)

(declare-fun mapDefault!56269 () ValueCell!17300)

