; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112450 () Bool)

(assert start!112450)

(declare-fun b_free!30845 () Bool)

(declare-fun b_next!30845 () Bool)

(assert (=> start!112450 (= b_free!30845 (not b_next!30845))))

(declare-fun tp!108171 () Bool)

(declare-fun b_and!49691 () Bool)

(assert (=> start!112450 (= tp!108171 b_and!49691)))

(declare-fun mapIsEmpty!56806 () Bool)

(declare-fun mapRes!56806 () Bool)

(assert (=> mapIsEmpty!56806 mapRes!56806))

(declare-fun b!1333266 () Bool)

(declare-fun res!884772 () Bool)

(declare-fun e!759541 () Bool)

(assert (=> b!1333266 (=> (not res!884772) (not e!759541))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90384 0))(
  ( (array!90385 (arr!43658 (Array (_ BitVec 32) (_ BitVec 64))) (size!44208 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90384)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333266 (= res!884772 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44208 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333267 () Bool)

(declare-fun e!759537 () Bool)

(declare-fun tp_is_empty!36755 () Bool)

(assert (=> b!1333267 (= e!759537 tp_is_empty!36755)))

(declare-fun b!1333268 () Bool)

(declare-fun res!884767 () Bool)

(assert (=> b!1333268 (=> (not res!884767) (not e!759541))))

(declare-datatypes ((List!30928 0))(
  ( (Nil!30925) (Cons!30924 (h!32133 (_ BitVec 64)) (t!45132 List!30928)) )
))
(declare-fun arrayNoDuplicates!0 (array!90384 (_ BitVec 32) List!30928) Bool)

(assert (=> b!1333268 (= res!884767 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30925))))

(declare-fun b!1333269 () Bool)

(declare-fun e!759539 () Bool)

(declare-fun e!759540 () Bool)

(assert (=> b!1333269 (= e!759539 (and e!759540 mapRes!56806))))

(declare-fun condMapEmpty!56806 () Bool)

(declare-datatypes ((V!54109 0))(
  ( (V!54110 (val!18452 Int)) )
))
(declare-datatypes ((ValueCell!17479 0))(
  ( (ValueCellFull!17479 (v!21089 V!54109)) (EmptyCell!17479) )
))
(declare-datatypes ((array!90386 0))(
  ( (array!90387 (arr!43659 (Array (_ BitVec 32) ValueCell!17479)) (size!44209 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90386)

(declare-fun mapDefault!56806 () ValueCell!17479)

