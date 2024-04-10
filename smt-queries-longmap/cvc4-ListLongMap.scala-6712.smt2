; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84248 () Bool)

(assert start!84248)

(declare-fun b_free!19949 () Bool)

(declare-fun b_next!19949 () Bool)

(assert (=> start!84248 (= b_free!19949 (not b_next!19949))))

(declare-fun tp!69450 () Bool)

(declare-fun b_and!31975 () Bool)

(assert (=> start!84248 (= tp!69450 b_and!31975)))

(declare-fun b!985647 () Bool)

(declare-fun res!659561 () Bool)

(declare-fun e!555587 () Bool)

(assert (=> b!985647 (=> (not res!659561) (not e!555587))))

(declare-datatypes ((array!62077 0))(
  ( (array!62078 (arr!29896 (Array (_ BitVec 32) (_ BitVec 64))) (size!30375 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62077)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62077 (_ BitVec 32)) Bool)

(assert (=> b!985647 (= res!659561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985648 () Bool)

(declare-fun e!555584 () Bool)

(assert (=> b!985648 (= e!555587 e!555584)))

(declare-fun res!659564 () Bool)

(assert (=> b!985648 (=> (not res!659564) (not e!555584))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985648 (= res!659564 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29896 _keys!1544) from!1932))))))

(declare-datatypes ((V!35717 0))(
  ( (V!35718 (val!11576 Int)) )
))
(declare-fun lt!437333 () V!35717)

(declare-datatypes ((ValueCell!11044 0))(
  ( (ValueCellFull!11044 (v!14138 V!35717)) (EmptyCell!11044) )
))
(declare-datatypes ((array!62079 0))(
  ( (array!62080 (arr!29897 (Array (_ BitVec 32) ValueCell!11044)) (size!30376 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62079)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15521 (ValueCell!11044 V!35717) V!35717)

(declare-fun dynLambda!1844 (Int (_ BitVec 64)) V!35717)

(assert (=> b!985648 (= lt!437333 (get!15521 (select (arr!29897 _values!1278) from!1932) (dynLambda!1844 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35717)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35717)

(declare-datatypes ((tuple2!14818 0))(
  ( (tuple2!14819 (_1!7420 (_ BitVec 64)) (_2!7420 V!35717)) )
))
(declare-datatypes ((List!20709 0))(
  ( (Nil!20706) (Cons!20705 (h!21867 tuple2!14818) (t!29602 List!20709)) )
))
(declare-datatypes ((ListLongMap!13515 0))(
  ( (ListLongMap!13516 (toList!6773 List!20709)) )
))
(declare-fun lt!437335 () ListLongMap!13515)

(declare-fun getCurrentListMapNoExtraKeys!3464 (array!62077 array!62079 (_ BitVec 32) (_ BitVec 32) V!35717 V!35717 (_ BitVec 32) Int) ListLongMap!13515)

(assert (=> b!985648 (= lt!437335 (getCurrentListMapNoExtraKeys!3464 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985649 () Bool)

(declare-fun e!555588 () Bool)

(declare-fun tp_is_empty!23051 () Bool)

(assert (=> b!985649 (= e!555588 tp_is_empty!23051)))

(declare-fun mapNonEmpty!36605 () Bool)

(declare-fun mapRes!36605 () Bool)

(declare-fun tp!69451 () Bool)

(declare-fun e!555585 () Bool)

(assert (=> mapNonEmpty!36605 (= mapRes!36605 (and tp!69451 e!555585))))

(declare-fun mapKey!36605 () (_ BitVec 32))

(declare-fun mapValue!36605 () ValueCell!11044)

(declare-fun mapRest!36605 () (Array (_ BitVec 32) ValueCell!11044))

(assert (=> mapNonEmpty!36605 (= (arr!29897 _values!1278) (store mapRest!36605 mapKey!36605 mapValue!36605))))

(declare-fun b!985650 () Bool)

(declare-fun e!555586 () Bool)

(assert (=> b!985650 (= e!555586 (and e!555588 mapRes!36605))))

(declare-fun condMapEmpty!36605 () Bool)

(declare-fun mapDefault!36605 () ValueCell!11044)

