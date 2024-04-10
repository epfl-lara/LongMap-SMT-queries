; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84014 () Bool)

(assert start!84014)

(declare-fun b_free!19769 () Bool)

(declare-fun b_next!19769 () Bool)

(assert (=> start!84014 (= b_free!19769 (not b_next!19769))))

(declare-fun tp!68829 () Bool)

(declare-fun b_and!31621 () Bool)

(assert (=> start!84014 (= tp!68829 b_and!31621)))

(declare-fun b!981999 () Bool)

(declare-fun e!553567 () Bool)

(declare-fun e!553569 () Bool)

(assert (=> b!981999 (= e!553567 e!553569)))

(declare-fun res!657144 () Bool)

(assert (=> b!981999 (=> (not res!657144) (not e!553569))))

(declare-datatypes ((array!61629 0))(
  ( (array!61630 (arr!29672 (Array (_ BitVec 32) (_ BitVec 64))) (size!30151 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61629)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981999 (= res!657144 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29672 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((V!35405 0))(
  ( (V!35406 (val!11459 Int)) )
))
(declare-datatypes ((ValueCell!10927 0))(
  ( (ValueCellFull!10927 (v!14021 V!35405)) (EmptyCell!10927) )
))
(declare-datatypes ((array!61631 0))(
  ( (array!61632 (arr!29673 (Array (_ BitVec 32) ValueCell!10927)) (size!30152 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61631)

(declare-fun lt!435949 () V!35405)

(declare-fun get!15382 (ValueCell!10927 V!35405) V!35405)

(declare-fun dynLambda!1783 (Int (_ BitVec 64)) V!35405)

(assert (=> b!981999 (= lt!435949 (get!15382 (select (arr!29673 _values!1278) from!1932) (dynLambda!1783 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35405)

(declare-fun zeroValue!1220 () V!35405)

(declare-datatypes ((tuple2!14672 0))(
  ( (tuple2!14673 (_1!7347 (_ BitVec 64)) (_2!7347 V!35405)) )
))
(declare-datatypes ((List!20553 0))(
  ( (Nil!20550) (Cons!20549 (h!21711 tuple2!14672) (t!29272 List!20553)) )
))
(declare-datatypes ((ListLongMap!13369 0))(
  ( (ListLongMap!13370 (toList!6700 List!20553)) )
))
(declare-fun lt!435947 () ListLongMap!13369)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3400 (array!61629 array!61631 (_ BitVec 32) (_ BitVec 32) V!35405 V!35405 (_ BitVec 32) Int) ListLongMap!13369)

(assert (=> b!981999 (= lt!435947 (getCurrentListMapNoExtraKeys!3400 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!657143 () Bool)

(assert (=> start!84014 (=> (not res!657143) (not e!553567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84014 (= res!657143 (validMask!0 mask!1948))))

(assert (=> start!84014 e!553567))

(assert (=> start!84014 true))

(declare-fun tp_is_empty!22817 () Bool)

(assert (=> start!84014 tp_is_empty!22817))

(declare-fun e!553572 () Bool)

(declare-fun array_inv!22943 (array!61631) Bool)

(assert (=> start!84014 (and (array_inv!22943 _values!1278) e!553572)))

(assert (=> start!84014 tp!68829))

(declare-fun array_inv!22944 (array!61629) Bool)

(assert (=> start!84014 (array_inv!22944 _keys!1544)))

(declare-fun b!982000 () Bool)

(declare-fun res!657146 () Bool)

(assert (=> b!982000 (=> (not res!657146) (not e!553567))))

(assert (=> b!982000 (= res!657146 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30151 _keys!1544))))))

(declare-fun mapNonEmpty!36254 () Bool)

(declare-fun mapRes!36254 () Bool)

(declare-fun tp!68830 () Bool)

(declare-fun e!553568 () Bool)

(assert (=> mapNonEmpty!36254 (= mapRes!36254 (and tp!68830 e!553568))))

(declare-fun mapKey!36254 () (_ BitVec 32))

(declare-fun mapRest!36254 () (Array (_ BitVec 32) ValueCell!10927))

(declare-fun mapValue!36254 () ValueCell!10927)

(assert (=> mapNonEmpty!36254 (= (arr!29673 _values!1278) (store mapRest!36254 mapKey!36254 mapValue!36254))))

(declare-fun b!982001 () Bool)

(declare-fun res!657145 () Bool)

(assert (=> b!982001 (=> (not res!657145) (not e!553567))))

(declare-datatypes ((List!20554 0))(
  ( (Nil!20551) (Cons!20550 (h!21712 (_ BitVec 64)) (t!29273 List!20554)) )
))
(declare-fun arrayNoDuplicates!0 (array!61629 (_ BitVec 32) List!20554) Bool)

(assert (=> b!982001 (= res!657145 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20551))))

(declare-fun b!982002 () Bool)

(declare-fun res!657141 () Bool)

(assert (=> b!982002 (=> (not res!657141) (not e!553567))))

(assert (=> b!982002 (= res!657141 (and (= (size!30152 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30151 _keys!1544) (size!30152 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982003 () Bool)

(declare-fun res!657142 () Bool)

(assert (=> b!982003 (=> (not res!657142) (not e!553567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61629 (_ BitVec 32)) Bool)

(assert (=> b!982003 (= res!657142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36254 () Bool)

(assert (=> mapIsEmpty!36254 mapRes!36254))

(declare-fun b!982004 () Bool)

(declare-fun e!553570 () Bool)

(assert (=> b!982004 (= e!553570 tp_is_empty!22817)))

(declare-fun b!982005 () Bool)

(assert (=> b!982005 (= e!553568 tp_is_empty!22817)))

(declare-fun b!982006 () Bool)

(declare-fun res!657140 () Bool)

(assert (=> b!982006 (=> (not res!657140) (not e!553567))))

(assert (=> b!982006 (= res!657140 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982007 () Bool)

(assert (=> b!982007 (= e!553572 (and e!553570 mapRes!36254))))

(declare-fun condMapEmpty!36254 () Bool)

(declare-fun mapDefault!36254 () ValueCell!10927)

