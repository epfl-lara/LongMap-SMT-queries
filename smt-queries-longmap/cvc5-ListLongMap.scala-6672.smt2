; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84004 () Bool)

(assert start!84004)

(declare-fun b_free!19759 () Bool)

(declare-fun b_next!19759 () Bool)

(assert (=> start!84004 (= b_free!19759 (not b_next!19759))))

(declare-fun tp!68800 () Bool)

(declare-fun b_and!31601 () Bool)

(assert (=> start!84004 (= tp!68800 b_and!31601)))

(declare-fun b!981824 () Bool)

(declare-fun res!657019 () Bool)

(declare-fun e!553477 () Bool)

(assert (=> b!981824 (=> (not res!657019) (not e!553477))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981824 (= res!657019 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981825 () Bool)

(declare-fun e!553480 () Bool)

(assert (=> b!981825 (= e!553477 e!553480)))

(declare-fun res!657022 () Bool)

(assert (=> b!981825 (=> (not res!657022) (not e!553480))))

(declare-datatypes ((array!61609 0))(
  ( (array!61610 (arr!29662 (Array (_ BitVec 32) (_ BitVec 64))) (size!30141 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61609)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981825 (= res!657022 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29662 _keys!1544) from!1932))))))

(declare-datatypes ((V!35393 0))(
  ( (V!35394 (val!11454 Int)) )
))
(declare-fun lt!435874 () V!35393)

(declare-datatypes ((ValueCell!10922 0))(
  ( (ValueCellFull!10922 (v!14016 V!35393)) (EmptyCell!10922) )
))
(declare-datatypes ((array!61611 0))(
  ( (array!61612 (arr!29663 (Array (_ BitVec 32) ValueCell!10922)) (size!30142 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61611)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15376 (ValueCell!10922 V!35393) V!35393)

(declare-fun dynLambda!1779 (Int (_ BitVec 64)) V!35393)

(assert (=> b!981825 (= lt!435874 (get!15376 (select (arr!29663 _values!1278) from!1932) (dynLambda!1779 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35393)

(declare-datatypes ((tuple2!14664 0))(
  ( (tuple2!14665 (_1!7343 (_ BitVec 64)) (_2!7343 V!35393)) )
))
(declare-datatypes ((List!20547 0))(
  ( (Nil!20544) (Cons!20543 (h!21705 tuple2!14664) (t!29256 List!20547)) )
))
(declare-datatypes ((ListLongMap!13361 0))(
  ( (ListLongMap!13362 (toList!6696 List!20547)) )
))
(declare-fun lt!435873 () ListLongMap!13361)

(declare-fun zeroValue!1220 () V!35393)

(declare-fun getCurrentListMapNoExtraKeys!3396 (array!61609 array!61611 (_ BitVec 32) (_ BitVec 32) V!35393 V!35393 (_ BitVec 32) Int) ListLongMap!13361)

(assert (=> b!981825 (= lt!435873 (getCurrentListMapNoExtraKeys!3396 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36239 () Bool)

(declare-fun mapRes!36239 () Bool)

(declare-fun tp!68799 () Bool)

(declare-fun e!553478 () Bool)

(assert (=> mapNonEmpty!36239 (= mapRes!36239 (and tp!68799 e!553478))))

(declare-fun mapKey!36239 () (_ BitVec 32))

(declare-fun mapRest!36239 () (Array (_ BitVec 32) ValueCell!10922))

(declare-fun mapValue!36239 () ValueCell!10922)

(assert (=> mapNonEmpty!36239 (= (arr!29663 _values!1278) (store mapRest!36239 mapKey!36239 mapValue!36239))))

(declare-fun b!981826 () Bool)

(declare-fun e!553482 () Bool)

(declare-fun tp_is_empty!22807 () Bool)

(assert (=> b!981826 (= e!553482 tp_is_empty!22807)))

(declare-fun b!981827 () Bool)

(declare-fun res!657020 () Bool)

(assert (=> b!981827 (=> (not res!657020) (not e!553477))))

(assert (=> b!981827 (= res!657020 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30141 _keys!1544))))))

(declare-fun res!657021 () Bool)

(assert (=> start!84004 (=> (not res!657021) (not e!553477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84004 (= res!657021 (validMask!0 mask!1948))))

(assert (=> start!84004 e!553477))

(assert (=> start!84004 true))

(assert (=> start!84004 tp_is_empty!22807))

(declare-fun e!553479 () Bool)

(declare-fun array_inv!22935 (array!61611) Bool)

(assert (=> start!84004 (and (array_inv!22935 _values!1278) e!553479)))

(assert (=> start!84004 tp!68800))

(declare-fun array_inv!22936 (array!61609) Bool)

(assert (=> start!84004 (array_inv!22936 _keys!1544)))

(declare-fun b!981828 () Bool)

(declare-fun res!657026 () Bool)

(assert (=> b!981828 (=> (not res!657026) (not e!553477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61609 (_ BitVec 32)) Bool)

(assert (=> b!981828 (= res!657026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981829 () Bool)

(assert (=> b!981829 (= e!553480 (not true))))

(declare-fun lt!435875 () tuple2!14664)

(declare-fun lt!435871 () tuple2!14664)

(declare-fun +!2996 (ListLongMap!13361 tuple2!14664) ListLongMap!13361)

(assert (=> b!981829 (= (+!2996 (+!2996 lt!435873 lt!435875) lt!435871) (+!2996 (+!2996 lt!435873 lt!435871) lt!435875))))

(assert (=> b!981829 (= lt!435871 (tuple2!14665 (select (arr!29662 _keys!1544) from!1932) lt!435874))))

(assert (=> b!981829 (= lt!435875 (tuple2!14665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32631 0))(
  ( (Unit!32632) )
))
(declare-fun lt!435872 () Unit!32631)

(declare-fun addCommutativeForDiffKeys!624 (ListLongMap!13361 (_ BitVec 64) V!35393 (_ BitVec 64) V!35393) Unit!32631)

(assert (=> b!981829 (= lt!435872 (addCommutativeForDiffKeys!624 lt!435873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29662 _keys!1544) from!1932) lt!435874))))

(declare-fun b!981830 () Bool)

(declare-fun res!657024 () Bool)

(assert (=> b!981830 (=> (not res!657024) (not e!553477))))

(assert (=> b!981830 (= res!657024 (and (= (size!30142 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30141 _keys!1544) (size!30142 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981831 () Bool)

(assert (=> b!981831 (= e!553479 (and e!553482 mapRes!36239))))

(declare-fun condMapEmpty!36239 () Bool)

(declare-fun mapDefault!36239 () ValueCell!10922)

