; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84028 () Bool)

(assert start!84028)

(declare-fun b_free!19783 () Bool)

(declare-fun b_next!19783 () Bool)

(assert (=> start!84028 (= b_free!19783 (not b_next!19783))))

(declare-fun tp!68871 () Bool)

(declare-fun b_and!31649 () Bool)

(assert (=> start!84028 (= tp!68871 b_and!31649)))

(declare-fun mapIsEmpty!36275 () Bool)

(declare-fun mapRes!36275 () Bool)

(assert (=> mapIsEmpty!36275 mapRes!36275))

(declare-fun b!982244 () Bool)

(declare-fun e!553695 () Bool)

(declare-fun tp_is_empty!22831 () Bool)

(assert (=> b!982244 (= e!553695 tp_is_empty!22831)))

(declare-fun b!982245 () Bool)

(declare-fun e!553694 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61655 0))(
  ( (array!61656 (arr!29685 (Array (_ BitVec 32) (_ BitVec 64))) (size!30164 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61655)

(assert (=> b!982245 (= e!553694 (not (bvsle from!1932 (size!30164 _keys!1544))))))

(declare-datatypes ((V!35425 0))(
  ( (V!35426 (val!11466 Int)) )
))
(declare-datatypes ((tuple2!14684 0))(
  ( (tuple2!14685 (_1!7353 (_ BitVec 64)) (_2!7353 V!35425)) )
))
(declare-datatypes ((List!20565 0))(
  ( (Nil!20562) (Cons!20561 (h!21723 tuple2!14684) (t!29298 List!20565)) )
))
(declare-datatypes ((ListLongMap!13381 0))(
  ( (ListLongMap!13382 (toList!6706 List!20565)) )
))
(declare-fun lt!436052 () ListLongMap!13381)

(declare-fun lt!436054 () tuple2!14684)

(declare-fun lt!436053 () tuple2!14684)

(declare-fun +!3004 (ListLongMap!13381 tuple2!14684) ListLongMap!13381)

(assert (=> b!982245 (= (+!3004 (+!3004 lt!436052 lt!436054) lt!436053) (+!3004 (+!3004 lt!436052 lt!436053) lt!436054))))

(declare-fun lt!436055 () V!35425)

(assert (=> b!982245 (= lt!436053 (tuple2!14685 (select (arr!29685 _keys!1544) from!1932) lt!436055))))

(declare-fun zeroValue!1220 () V!35425)

(assert (=> b!982245 (= lt!436054 (tuple2!14685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32647 0))(
  ( (Unit!32648) )
))
(declare-fun lt!436051 () Unit!32647)

(declare-fun addCommutativeForDiffKeys!632 (ListLongMap!13381 (_ BitVec 64) V!35425 (_ BitVec 64) V!35425) Unit!32647)

(assert (=> b!982245 (= lt!436051 (addCommutativeForDiffKeys!632 lt!436052 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29685 _keys!1544) from!1932) lt!436055))))

(declare-fun res!657311 () Bool)

(declare-fun e!553696 () Bool)

(assert (=> start!84028 (=> (not res!657311) (not e!553696))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84028 (= res!657311 (validMask!0 mask!1948))))

(assert (=> start!84028 e!553696))

(assert (=> start!84028 true))

(assert (=> start!84028 tp_is_empty!22831))

(declare-datatypes ((ValueCell!10934 0))(
  ( (ValueCellFull!10934 (v!14028 V!35425)) (EmptyCell!10934) )
))
(declare-datatypes ((array!61657 0))(
  ( (array!61658 (arr!29686 (Array (_ BitVec 32) ValueCell!10934)) (size!30165 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61657)

(declare-fun e!553693 () Bool)

(declare-fun array_inv!22955 (array!61657) Bool)

(assert (=> start!84028 (and (array_inv!22955 _values!1278) e!553693)))

(assert (=> start!84028 tp!68871))

(declare-fun array_inv!22956 (array!61655) Bool)

(assert (=> start!84028 (array_inv!22956 _keys!1544)))

(declare-fun mapNonEmpty!36275 () Bool)

(declare-fun tp!68872 () Bool)

(assert (=> mapNonEmpty!36275 (= mapRes!36275 (and tp!68872 e!553695))))

(declare-fun mapKey!36275 () (_ BitVec 32))

(declare-fun mapValue!36275 () ValueCell!10934)

(declare-fun mapRest!36275 () (Array (_ BitVec 32) ValueCell!10934))

(assert (=> mapNonEmpty!36275 (= (arr!29686 _values!1278) (store mapRest!36275 mapKey!36275 mapValue!36275))))

(declare-fun b!982246 () Bool)

(declare-fun res!657310 () Bool)

(assert (=> b!982246 (=> (not res!657310) (not e!553696))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982246 (= res!657310 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982247 () Bool)

(declare-fun e!553698 () Bool)

(assert (=> b!982247 (= e!553698 tp_is_empty!22831)))

(declare-fun b!982248 () Bool)

(declare-fun res!657308 () Bool)

(assert (=> b!982248 (=> (not res!657308) (not e!553696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982248 (= res!657308 (validKeyInArray!0 (select (arr!29685 _keys!1544) from!1932)))))

(declare-fun b!982249 () Bool)

(assert (=> b!982249 (= e!553696 e!553694)))

(declare-fun res!657312 () Bool)

(assert (=> b!982249 (=> (not res!657312) (not e!553694))))

(assert (=> b!982249 (= res!657312 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29685 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15394 (ValueCell!10934 V!35425) V!35425)

(declare-fun dynLambda!1789 (Int (_ BitVec 64)) V!35425)

(assert (=> b!982249 (= lt!436055 (get!15394 (select (arr!29686 _values!1278) from!1932) (dynLambda!1789 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35425)

(declare-fun getCurrentListMapNoExtraKeys!3406 (array!61655 array!61657 (_ BitVec 32) (_ BitVec 32) V!35425 V!35425 (_ BitVec 32) Int) ListLongMap!13381)

(assert (=> b!982249 (= lt!436052 (getCurrentListMapNoExtraKeys!3406 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982250 () Bool)

(declare-fun res!657309 () Bool)

(assert (=> b!982250 (=> (not res!657309) (not e!553696))))

(declare-datatypes ((List!20566 0))(
  ( (Nil!20563) (Cons!20562 (h!21724 (_ BitVec 64)) (t!29299 List!20566)) )
))
(declare-fun arrayNoDuplicates!0 (array!61655 (_ BitVec 32) List!20566) Bool)

(assert (=> b!982250 (= res!657309 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20563))))

(declare-fun b!982251 () Bool)

(assert (=> b!982251 (= e!553693 (and e!553698 mapRes!36275))))

(declare-fun condMapEmpty!36275 () Bool)

(declare-fun mapDefault!36275 () ValueCell!10934)

