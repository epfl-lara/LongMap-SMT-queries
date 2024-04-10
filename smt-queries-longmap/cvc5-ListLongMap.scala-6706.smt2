; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84208 () Bool)

(assert start!84208)

(declare-fun b_free!19909 () Bool)

(declare-fun b_next!19909 () Bool)

(assert (=> start!84208 (= b_free!19909 (not b_next!19909))))

(declare-fun tp!69330 () Bool)

(declare-fun b_and!31895 () Bool)

(assert (=> start!84208 (= tp!69330 b_and!31895)))

(declare-fun b!984947 () Bool)

(declare-fun res!659080 () Bool)

(declare-fun e!555225 () Bool)

(assert (=> b!984947 (=> (not res!659080) (not e!555225))))

(declare-datatypes ((array!62001 0))(
  ( (array!62002 (arr!29858 (Array (_ BitVec 32) (_ BitVec 64))) (size!30337 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62001)

(declare-datatypes ((List!20676 0))(
  ( (Nil!20673) (Cons!20672 (h!21834 (_ BitVec 64)) (t!29529 List!20676)) )
))
(declare-fun arrayNoDuplicates!0 (array!62001 (_ BitVec 32) List!20676) Bool)

(assert (=> b!984947 (= res!659080 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20673))))

(declare-fun b!984948 () Bool)

(declare-fun res!659085 () Bool)

(assert (=> b!984948 (=> (not res!659085) (not e!555225))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984948 (= res!659085 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30337 _keys!1544))))))

(declare-fun res!659086 () Bool)

(assert (=> start!84208 (=> (not res!659086) (not e!555225))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84208 (= res!659086 (validMask!0 mask!1948))))

(assert (=> start!84208 e!555225))

(assert (=> start!84208 true))

(declare-fun tp_is_empty!23011 () Bool)

(assert (=> start!84208 tp_is_empty!23011))

(declare-datatypes ((V!35665 0))(
  ( (V!35666 (val!11556 Int)) )
))
(declare-datatypes ((ValueCell!11024 0))(
  ( (ValueCellFull!11024 (v!14118 V!35665)) (EmptyCell!11024) )
))
(declare-datatypes ((array!62003 0))(
  ( (array!62004 (arr!29859 (Array (_ BitVec 32) ValueCell!11024)) (size!30338 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62003)

(declare-fun e!555226 () Bool)

(declare-fun array_inv!23083 (array!62003) Bool)

(assert (=> start!84208 (and (array_inv!23083 _values!1278) e!555226)))

(assert (=> start!84208 tp!69330))

(declare-fun array_inv!23084 (array!62001) Bool)

(assert (=> start!84208 (array_inv!23084 _keys!1544)))

(declare-fun mapNonEmpty!36545 () Bool)

(declare-fun mapRes!36545 () Bool)

(declare-fun tp!69331 () Bool)

(declare-fun e!555227 () Bool)

(assert (=> mapNonEmpty!36545 (= mapRes!36545 (and tp!69331 e!555227))))

(declare-fun mapValue!36545 () ValueCell!11024)

(declare-fun mapKey!36545 () (_ BitVec 32))

(declare-fun mapRest!36545 () (Array (_ BitVec 32) ValueCell!11024))

(assert (=> mapNonEmpty!36545 (= (arr!29859 _values!1278) (store mapRest!36545 mapKey!36545 mapValue!36545))))

(declare-fun b!984949 () Bool)

(assert (=> b!984949 (= e!555227 tp_is_empty!23011)))

(declare-fun b!984950 () Bool)

(declare-fun res!659082 () Bool)

(assert (=> b!984950 (=> (not res!659082) (not e!555225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62001 (_ BitVec 32)) Bool)

(assert (=> b!984950 (= res!659082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984951 () Bool)

(declare-fun e!555224 () Bool)

(assert (=> b!984951 (= e!555224 (not true))))

(declare-datatypes ((tuple2!14784 0))(
  ( (tuple2!14785 (_1!7403 (_ BitVec 64)) (_2!7403 V!35665)) )
))
(declare-datatypes ((List!20677 0))(
  ( (Nil!20674) (Cons!20673 (h!21835 tuple2!14784) (t!29530 List!20677)) )
))
(declare-datatypes ((ListLongMap!13481 0))(
  ( (ListLongMap!13482 (toList!6756 List!20677)) )
))
(declare-fun lt!437036 () ListLongMap!13481)

(declare-fun lt!437033 () tuple2!14784)

(declare-fun lt!437032 () tuple2!14784)

(declare-fun +!3047 (ListLongMap!13481 tuple2!14784) ListLongMap!13481)

(assert (=> b!984951 (= (+!3047 (+!3047 lt!437036 lt!437033) lt!437032) (+!3047 (+!3047 lt!437036 lt!437032) lt!437033))))

(declare-fun lt!437035 () V!35665)

(assert (=> b!984951 (= lt!437032 (tuple2!14785 (select (arr!29858 _keys!1544) from!1932) lt!437035))))

(declare-fun minValue!1220 () V!35665)

(assert (=> b!984951 (= lt!437033 (tuple2!14785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32733 0))(
  ( (Unit!32734) )
))
(declare-fun lt!437034 () Unit!32733)

(declare-fun addCommutativeForDiffKeys!675 (ListLongMap!13481 (_ BitVec 64) V!35665 (_ BitVec 64) V!35665) Unit!32733)

(assert (=> b!984951 (= lt!437034 (addCommutativeForDiffKeys!675 lt!437036 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29858 _keys!1544) from!1932) lt!437035))))

(declare-fun mapIsEmpty!36545 () Bool)

(assert (=> mapIsEmpty!36545 mapRes!36545))

(declare-fun b!984952 () Bool)

(declare-fun res!659083 () Bool)

(assert (=> b!984952 (=> (not res!659083) (not e!555225))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984952 (= res!659083 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984953 () Bool)

(declare-fun res!659087 () Bool)

(assert (=> b!984953 (=> (not res!659087) (not e!555225))))

(assert (=> b!984953 (= res!659087 (and (= (size!30338 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30337 _keys!1544) (size!30338 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984954 () Bool)

(assert (=> b!984954 (= e!555225 e!555224)))

(declare-fun res!659084 () Bool)

(assert (=> b!984954 (=> (not res!659084) (not e!555224))))

(assert (=> b!984954 (= res!659084 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29858 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15493 (ValueCell!11024 V!35665) V!35665)

(declare-fun dynLambda!1828 (Int (_ BitVec 64)) V!35665)

(assert (=> b!984954 (= lt!437035 (get!15493 (select (arr!29859 _values!1278) from!1932) (dynLambda!1828 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35665)

(declare-fun getCurrentListMapNoExtraKeys!3448 (array!62001 array!62003 (_ BitVec 32) (_ BitVec 32) V!35665 V!35665 (_ BitVec 32) Int) ListLongMap!13481)

(assert (=> b!984954 (= lt!437036 (getCurrentListMapNoExtraKeys!3448 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984955 () Bool)

(declare-fun e!555223 () Bool)

(assert (=> b!984955 (= e!555223 tp_is_empty!23011)))

(declare-fun b!984956 () Bool)

(assert (=> b!984956 (= e!555226 (and e!555223 mapRes!36545))))

(declare-fun condMapEmpty!36545 () Bool)

(declare-fun mapDefault!36545 () ValueCell!11024)

