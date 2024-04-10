; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112444 () Bool)

(assert start!112444)

(declare-fun b_free!30839 () Bool)

(declare-fun b_next!30839 () Bool)

(assert (=> start!112444 (= b_free!30839 (not b_next!30839))))

(declare-fun tp!108154 () Bool)

(declare-fun b_and!49681 () Bool)

(assert (=> start!112444 (= tp!108154 b_and!49681)))

(declare-fun b!1333155 () Bool)

(declare-fun res!884692 () Bool)

(declare-fun e!759494 () Bool)

(assert (=> b!1333155 (=> (not res!884692) (not e!759494))))

(declare-datatypes ((array!90372 0))(
  ( (array!90373 (arr!43652 (Array (_ BitVec 32) (_ BitVec 64))) (size!44202 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90372)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90372 (_ BitVec 32)) Bool)

(assert (=> b!1333155 (= res!884692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333156 () Bool)

(declare-fun e!759492 () Bool)

(declare-fun tp_is_empty!36749 () Bool)

(assert (=> b!1333156 (= e!759492 tp_is_empty!36749)))

(declare-fun b!1333157 () Bool)

(declare-fun res!884693 () Bool)

(assert (=> b!1333157 (=> (not res!884693) (not e!759494))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333157 (= res!884693 (not (= (select (arr!43652 _keys!1590) from!1980) k!1153)))))

(declare-fun res!884687 () Bool)

(assert (=> start!112444 (=> (not res!884687) (not e!759494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112444 (= res!884687 (validMask!0 mask!1998))))

(assert (=> start!112444 e!759494))

(declare-datatypes ((V!54101 0))(
  ( (V!54102 (val!18449 Int)) )
))
(declare-datatypes ((ValueCell!17476 0))(
  ( (ValueCellFull!17476 (v!21086 V!54101)) (EmptyCell!17476) )
))
(declare-datatypes ((array!90374 0))(
  ( (array!90375 (arr!43653 (Array (_ BitVec 32) ValueCell!17476)) (size!44203 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90374)

(declare-fun e!759496 () Bool)

(declare-fun array_inv!32923 (array!90374) Bool)

(assert (=> start!112444 (and (array_inv!32923 _values!1320) e!759496)))

(assert (=> start!112444 true))

(declare-fun array_inv!32924 (array!90372) Bool)

(assert (=> start!112444 (array_inv!32924 _keys!1590)))

(assert (=> start!112444 tp!108154))

(assert (=> start!112444 tp_is_empty!36749))

(declare-fun b!1333158 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333158 (= e!759494 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1333159 () Bool)

(declare-fun res!884689 () Bool)

(assert (=> b!1333159 (=> (not res!884689) (not e!759494))))

(declare-datatypes ((List!30923 0))(
  ( (Nil!30920) (Cons!30919 (h!32128 (_ BitVec 64)) (t!45121 List!30923)) )
))
(declare-fun arrayNoDuplicates!0 (array!90372 (_ BitVec 32) List!30923) Bool)

(assert (=> b!1333159 (= res!884689 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30920))))

(declare-fun b!1333160 () Bool)

(declare-fun res!884688 () Bool)

(assert (=> b!1333160 (=> (not res!884688) (not e!759494))))

(assert (=> b!1333160 (= res!884688 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44202 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56797 () Bool)

(declare-fun mapRes!56797 () Bool)

(assert (=> mapIsEmpty!56797 mapRes!56797))

(declare-fun b!1333161 () Bool)

(declare-fun e!759493 () Bool)

(assert (=> b!1333161 (= e!759496 (and e!759493 mapRes!56797))))

(declare-fun condMapEmpty!56797 () Bool)

(declare-fun mapDefault!56797 () ValueCell!17476)

