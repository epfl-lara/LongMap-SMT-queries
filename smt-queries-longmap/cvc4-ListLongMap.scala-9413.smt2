; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112078 () Bool)

(assert start!112078)

(declare-fun b!1327630 () Bool)

(declare-fun res!880962 () Bool)

(declare-fun e!756808 () Bool)

(assert (=> b!1327630 (=> (not res!880962) (not e!756808))))

(declare-datatypes ((V!53629 0))(
  ( (V!53630 (val!18272 Int)) )
))
(declare-datatypes ((ValueCell!17299 0))(
  ( (ValueCellFull!17299 (v!20908 V!53629)) (EmptyCell!17299) )
))
(declare-datatypes ((array!89696 0))(
  ( (array!89697 (arr!43315 (Array (_ BitVec 32) ValueCell!17299)) (size!43865 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89696)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89698 0))(
  ( (array!89699 (arr!43316 (Array (_ BitVec 32) (_ BitVec 64))) (size!43866 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89698)

(assert (=> b!1327630 (= res!880962 (and (= (size!43865 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43866 _keys!1590) (size!43865 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327631 () Bool)

(declare-fun e!756812 () Bool)

(declare-fun e!756807 () Bool)

(declare-fun mapRes!56263 () Bool)

(assert (=> b!1327631 (= e!756812 (and e!756807 mapRes!56263))))

(declare-fun condMapEmpty!56263 () Bool)

(declare-fun mapDefault!56263 () ValueCell!17299)

