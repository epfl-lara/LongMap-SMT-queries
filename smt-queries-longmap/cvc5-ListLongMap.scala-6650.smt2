; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83872 () Bool)

(assert start!83872)

(declare-fun b_free!19681 () Bool)

(declare-fun b_next!19681 () Bool)

(assert (=> start!83872 (= b_free!19681 (not b_next!19681))))

(declare-fun tp!68484 () Bool)

(declare-fun b_and!31451 () Bool)

(assert (=> start!83872 (= tp!68484 b_and!31451)))

(declare-fun b!979961 () Bool)

(declare-fun res!655826 () Bool)

(declare-fun e!552381 () Bool)

(assert (=> b!979961 (=> (not res!655826) (not e!552381))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61361 0))(
  ( (array!61362 (arr!29538 (Array (_ BitVec 32) (_ BitVec 64))) (size!30017 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61361)

(assert (=> b!979961 (= res!655826 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30017 _keys!1544))))))

(declare-fun b!979962 () Bool)

(declare-fun e!552382 () Bool)

(declare-fun tp_is_empty!22675 () Bool)

(assert (=> b!979962 (= e!552382 tp_is_empty!22675)))

(declare-fun b!979963 () Bool)

(declare-fun res!655829 () Bool)

(assert (=> b!979963 (=> (not res!655829) (not e!552381))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61361 (_ BitVec 32)) Bool)

(assert (=> b!979963 (= res!655829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979964 () Bool)

(declare-fun res!655823 () Bool)

(assert (=> b!979964 (=> (not res!655823) (not e!552381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979964 (= res!655823 (validKeyInArray!0 (select (arr!29538 _keys!1544) from!1932)))))

(declare-fun b!979965 () Bool)

(declare-fun e!552384 () Bool)

(assert (=> b!979965 (= e!552381 (not e!552384))))

(declare-fun res!655828 () Bool)

(assert (=> b!979965 (=> res!655828 e!552384)))

(assert (=> b!979965 (= res!655828 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29538 _keys!1544) from!1932)))))

(declare-datatypes ((V!35217 0))(
  ( (V!35218 (val!11388 Int)) )
))
(declare-datatypes ((tuple2!14606 0))(
  ( (tuple2!14607 (_1!7314 (_ BitVec 64)) (_2!7314 V!35217)) )
))
(declare-datatypes ((List!20473 0))(
  ( (Nil!20470) (Cons!20469 (h!21631 tuple2!14606) (t!29110 List!20473)) )
))
(declare-datatypes ((ListLongMap!13303 0))(
  ( (ListLongMap!13304 (toList!6667 List!20473)) )
))
(declare-fun lt!434903 () ListLongMap!13303)

(declare-fun lt!434901 () ListLongMap!13303)

(declare-fun lt!434908 () tuple2!14606)

(declare-fun lt!434902 () tuple2!14606)

(declare-fun +!2972 (ListLongMap!13303 tuple2!14606) ListLongMap!13303)

(assert (=> b!979965 (= (+!2972 lt!434903 lt!434902) (+!2972 lt!434901 lt!434908))))

(declare-fun lt!434907 () ListLongMap!13303)

(assert (=> b!979965 (= lt!434901 (+!2972 lt!434907 lt!434902))))

(declare-fun lt!434904 () V!35217)

(assert (=> b!979965 (= lt!434902 (tuple2!14607 (select (arr!29538 _keys!1544) from!1932) lt!434904))))

(assert (=> b!979965 (= lt!434903 (+!2972 lt!434907 lt!434908))))

(declare-fun minValue!1220 () V!35217)

(assert (=> b!979965 (= lt!434908 (tuple2!14607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32583 0))(
  ( (Unit!32584) )
))
(declare-fun lt!434900 () Unit!32583)

(declare-fun addCommutativeForDiffKeys!600 (ListLongMap!13303 (_ BitVec 64) V!35217 (_ BitVec 64) V!35217) Unit!32583)

(assert (=> b!979965 (= lt!434900 (addCommutativeForDiffKeys!600 lt!434907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29538 _keys!1544) from!1932) lt!434904))))

(declare-datatypes ((ValueCell!10856 0))(
  ( (ValueCellFull!10856 (v!13950 V!35217)) (EmptyCell!10856) )
))
(declare-datatypes ((array!61363 0))(
  ( (array!61364 (arr!29539 (Array (_ BitVec 32) ValueCell!10856)) (size!30018 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61363)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15311 (ValueCell!10856 V!35217) V!35217)

(declare-fun dynLambda!1758 (Int (_ BitVec 64)) V!35217)

(assert (=> b!979965 (= lt!434904 (get!15311 (select (arr!29539 _values!1278) from!1932) (dynLambda!1758 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434906 () ListLongMap!13303)

(declare-fun lt!434909 () tuple2!14606)

(assert (=> b!979965 (= lt!434907 (+!2972 lt!434906 lt!434909))))

(declare-fun zeroValue!1220 () V!35217)

(assert (=> b!979965 (= lt!434909 (tuple2!14607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3372 (array!61361 array!61363 (_ BitVec 32) (_ BitVec 32) V!35217 V!35217 (_ BitVec 32) Int) ListLongMap!13303)

(assert (=> b!979965 (= lt!434906 (getCurrentListMapNoExtraKeys!3372 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655825 () Bool)

(assert (=> start!83872 (=> (not res!655825) (not e!552381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83872 (= res!655825 (validMask!0 mask!1948))))

(assert (=> start!83872 e!552381))

(assert (=> start!83872 true))

(assert (=> start!83872 tp_is_empty!22675))

(declare-fun e!552383 () Bool)

(declare-fun array_inv!22835 (array!61363) Bool)

(assert (=> start!83872 (and (array_inv!22835 _values!1278) e!552383)))

(assert (=> start!83872 tp!68484))

(declare-fun array_inv!22836 (array!61361) Bool)

(assert (=> start!83872 (array_inv!22836 _keys!1544)))

(declare-fun mapIsEmpty!36041 () Bool)

(declare-fun mapRes!36041 () Bool)

(assert (=> mapIsEmpty!36041 mapRes!36041))

(declare-fun b!979966 () Bool)

(declare-fun e!552379 () Bool)

(assert (=> b!979966 (= e!552383 (and e!552379 mapRes!36041))))

(declare-fun condMapEmpty!36041 () Bool)

(declare-fun mapDefault!36041 () ValueCell!10856)

