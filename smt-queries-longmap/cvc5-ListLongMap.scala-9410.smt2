; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112030 () Bool)

(assert start!112030)

(declare-fun b!1327333 () Bool)

(declare-fun e!756587 () Bool)

(declare-datatypes ((array!89654 0))(
  ( (array!89655 (arr!43297 (Array (_ BitVec 32) (_ BitVec 64))) (size!43847 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89654)

(assert (=> b!1327333 (= e!756587 (bvsgt #b00000000000000000000000000000000 (size!43847 _keys!1590)))))

(declare-fun mapIsEmpty!56221 () Bool)

(declare-fun mapRes!56221 () Bool)

(assert (=> mapIsEmpty!56221 mapRes!56221))

(declare-fun mapNonEmpty!56221 () Bool)

(declare-fun tp!107128 () Bool)

(declare-fun e!756584 () Bool)

(assert (=> mapNonEmpty!56221 (= mapRes!56221 (and tp!107128 e!756584))))

(declare-datatypes ((V!53601 0))(
  ( (V!53602 (val!18261 Int)) )
))
(declare-datatypes ((ValueCell!17288 0))(
  ( (ValueCellFull!17288 (v!20897 V!53601)) (EmptyCell!17288) )
))
(declare-datatypes ((array!89656 0))(
  ( (array!89657 (arr!43298 (Array (_ BitVec 32) ValueCell!17288)) (size!43848 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89656)

(declare-fun mapKey!56221 () (_ BitVec 32))

(declare-fun mapValue!56221 () ValueCell!17288)

(declare-fun mapRest!56221 () (Array (_ BitVec 32) ValueCell!17288))

(assert (=> mapNonEmpty!56221 (= (arr!43298 _values!1320) (store mapRest!56221 mapKey!56221 mapValue!56221))))

(declare-fun b!1327334 () Bool)

(declare-fun res!880806 () Bool)

(assert (=> b!1327334 (=> (not res!880806) (not e!756587))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327334 (= res!880806 (and (= (size!43848 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43847 _keys!1590) (size!43848 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!880807 () Bool)

(assert (=> start!112030 (=> (not res!880807) (not e!756587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112030 (= res!880807 (validMask!0 mask!1998))))

(assert (=> start!112030 e!756587))

(assert (=> start!112030 true))

(declare-fun e!756583 () Bool)

(declare-fun array_inv!32681 (array!89656) Bool)

(assert (=> start!112030 (and (array_inv!32681 _values!1320) e!756583)))

(declare-fun array_inv!32682 (array!89654) Bool)

(assert (=> start!112030 (array_inv!32682 _keys!1590)))

(declare-fun b!1327335 () Bool)

(declare-fun tp_is_empty!36373 () Bool)

(assert (=> b!1327335 (= e!756584 tp_is_empty!36373)))

(declare-fun b!1327336 () Bool)

(declare-fun e!756585 () Bool)

(assert (=> b!1327336 (= e!756585 tp_is_empty!36373)))

(declare-fun b!1327337 () Bool)

(assert (=> b!1327337 (= e!756583 (and e!756585 mapRes!56221))))

(declare-fun condMapEmpty!56221 () Bool)

(declare-fun mapDefault!56221 () ValueCell!17288)

