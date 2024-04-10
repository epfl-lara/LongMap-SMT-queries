; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84050 () Bool)

(assert start!84050)

(declare-fun b_free!19805 () Bool)

(declare-fun b_next!19805 () Bool)

(assert (=> start!84050 (= b_free!19805 (not b_next!19805))))

(declare-fun tp!68938 () Bool)

(declare-fun b_and!31693 () Bool)

(assert (=> start!84050 (= tp!68938 b_and!31693)))

(declare-fun b!982629 () Bool)

(declare-fun res!657574 () Bool)

(declare-fun e!553891 () Bool)

(assert (=> b!982629 (=> (not res!657574) (not e!553891))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982629 (= res!657574 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657578 () Bool)

(assert (=> start!84050 (=> (not res!657578) (not e!553891))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84050 (= res!657578 (validMask!0 mask!1948))))

(assert (=> start!84050 e!553891))

(assert (=> start!84050 true))

(declare-fun tp_is_empty!22853 () Bool)

(assert (=> start!84050 tp_is_empty!22853))

(declare-datatypes ((V!35453 0))(
  ( (V!35454 (val!11477 Int)) )
))
(declare-datatypes ((ValueCell!10945 0))(
  ( (ValueCellFull!10945 (v!14039 V!35453)) (EmptyCell!10945) )
))
(declare-datatypes ((array!61697 0))(
  ( (array!61698 (arr!29706 (Array (_ BitVec 32) ValueCell!10945)) (size!30185 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61697)

(declare-fun e!553895 () Bool)

(declare-fun array_inv!22973 (array!61697) Bool)

(assert (=> start!84050 (and (array_inv!22973 _values!1278) e!553895)))

(assert (=> start!84050 tp!68938))

(declare-datatypes ((array!61699 0))(
  ( (array!61700 (arr!29707 (Array (_ BitVec 32) (_ BitVec 64))) (size!30186 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61699)

(declare-fun array_inv!22974 (array!61699) Bool)

(assert (=> start!84050 (array_inv!22974 _keys!1544)))

(declare-fun b!982630 () Bool)

(declare-fun e!553893 () Bool)

(assert (=> b!982630 (= e!553891 e!553893)))

(declare-fun res!657573 () Bool)

(assert (=> b!982630 (=> (not res!657573) (not e!553893))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982630 (= res!657573 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29707 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436219 () V!35453)

(declare-fun get!15409 (ValueCell!10945 V!35453) V!35453)

(declare-fun dynLambda!1798 (Int (_ BitVec 64)) V!35453)

(assert (=> b!982630 (= lt!436219 (get!15409 (select (arr!29706 _values!1278) from!1932) (dynLambda!1798 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35453)

(declare-fun zeroValue!1220 () V!35453)

(declare-datatypes ((tuple2!14704 0))(
  ( (tuple2!14705 (_1!7363 (_ BitVec 64)) (_2!7363 V!35453)) )
))
(declare-datatypes ((List!20584 0))(
  ( (Nil!20581) (Cons!20580 (h!21742 tuple2!14704) (t!29339 List!20584)) )
))
(declare-datatypes ((ListLongMap!13401 0))(
  ( (ListLongMap!13402 (toList!6716 List!20584)) )
))
(declare-fun lt!436220 () ListLongMap!13401)

(declare-fun getCurrentListMapNoExtraKeys!3415 (array!61699 array!61697 (_ BitVec 32) (_ BitVec 32) V!35453 V!35453 (_ BitVec 32) Int) ListLongMap!13401)

(assert (=> b!982630 (= lt!436220 (getCurrentListMapNoExtraKeys!3415 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36308 () Bool)

(declare-fun mapRes!36308 () Bool)

(declare-fun tp!68937 () Bool)

(declare-fun e!553896 () Bool)

(assert (=> mapNonEmpty!36308 (= mapRes!36308 (and tp!68937 e!553896))))

(declare-fun mapRest!36308 () (Array (_ BitVec 32) ValueCell!10945))

(declare-fun mapKey!36308 () (_ BitVec 32))

(declare-fun mapValue!36308 () ValueCell!10945)

(assert (=> mapNonEmpty!36308 (= (arr!29706 _values!1278) (store mapRest!36308 mapKey!36308 mapValue!36308))))

(declare-fun b!982631 () Bool)

(declare-fun e!553892 () Bool)

(assert (=> b!982631 (= e!553892 tp_is_empty!22853)))

(declare-fun b!982632 () Bool)

(assert (=> b!982632 (= e!553895 (and e!553892 mapRes!36308))))

(declare-fun condMapEmpty!36308 () Bool)

(declare-fun mapDefault!36308 () ValueCell!10945)

