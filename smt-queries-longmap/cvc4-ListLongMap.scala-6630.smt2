; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83756 () Bool)

(assert start!83756)

(declare-fun b_free!19565 () Bool)

(declare-fun b_next!19565 () Bool)

(assert (=> start!83756 (= b_free!19565 (not b_next!19565))))

(declare-fun tp!68137 () Bool)

(declare-fun b_and!31219 () Bool)

(assert (=> start!83756 (= tp!68137 b_and!31219)))

(declare-fun b!978013 () Bool)

(declare-fun e!551417 () Bool)

(assert (=> b!978013 (= e!551417 (not true))))

(declare-datatypes ((V!35061 0))(
  ( (V!35062 (val!11330 Int)) )
))
(declare-datatypes ((tuple2!14524 0))(
  ( (tuple2!14525 (_1!7273 (_ BitVec 64)) (_2!7273 V!35061)) )
))
(declare-datatypes ((List!20395 0))(
  ( (Nil!20392) (Cons!20391 (h!21553 tuple2!14524) (t!28916 List!20395)) )
))
(declare-datatypes ((ListLongMap!13221 0))(
  ( (ListLongMap!13222 (toList!6626 List!20395)) )
))
(declare-fun lt!433570 () ListLongMap!13221)

(declare-fun lt!433572 () tuple2!14524)

(declare-fun lt!433571 () tuple2!14524)

(declare-fun +!2931 (ListLongMap!13221 tuple2!14524) ListLongMap!13221)

(assert (=> b!978013 (= (+!2931 (+!2931 lt!433570 lt!433572) lt!433571) (+!2931 (+!2931 lt!433570 lt!433571) lt!433572))))

(declare-fun lt!433574 () V!35061)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61145 0))(
  ( (array!61146 (arr!29430 (Array (_ BitVec 32) (_ BitVec 64))) (size!29909 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61145)

(assert (=> b!978013 (= lt!433571 (tuple2!14525 (select (arr!29430 _keys!1544) from!1932) lt!433574))))

(declare-fun minValue!1220 () V!35061)

(assert (=> b!978013 (= lt!433572 (tuple2!14525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32501 0))(
  ( (Unit!32502) )
))
(declare-fun lt!433573 () Unit!32501)

(declare-fun addCommutativeForDiffKeys!559 (ListLongMap!13221 (_ BitVec 64) V!35061 (_ BitVec 64) V!35061) Unit!32501)

(assert (=> b!978013 (= lt!433573 (addCommutativeForDiffKeys!559 lt!433570 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29430 _keys!1544) from!1932) lt!433574))))

(declare-datatypes ((ValueCell!10798 0))(
  ( (ValueCellFull!10798 (v!13892 V!35061)) (EmptyCell!10798) )
))
(declare-datatypes ((array!61147 0))(
  ( (array!61148 (arr!29431 (Array (_ BitVec 32) ValueCell!10798)) (size!29910 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61147)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15232 (ValueCell!10798 V!35061) V!35061)

(declare-fun dynLambda!1719 (Int (_ BitVec 64)) V!35061)

(assert (=> b!978013 (= lt!433574 (get!15232 (select (arr!29431 _values!1278) from!1932) (dynLambda!1719 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35061)

(declare-fun getCurrentListMapNoExtraKeys!3333 (array!61145 array!61147 (_ BitVec 32) (_ BitVec 32) V!35061 V!35061 (_ BitVec 32) Int) ListLongMap!13221)

(assert (=> b!978013 (= lt!433570 (+!2931 (getCurrentListMapNoExtraKeys!3333 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978014 () Bool)

(declare-fun res!654518 () Bool)

(assert (=> b!978014 (=> (not res!654518) (not e!551417))))

(assert (=> b!978014 (= res!654518 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978015 () Bool)

(declare-fun res!654515 () Bool)

(assert (=> b!978015 (=> (not res!654515) (not e!551417))))

(assert (=> b!978015 (= res!654515 (and (= (size!29910 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29909 _keys!1544) (size!29910 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978017 () Bool)

(declare-fun e!551420 () Bool)

(declare-fun tp_is_empty!22559 () Bool)

(assert (=> b!978017 (= e!551420 tp_is_empty!22559)))

(declare-fun mapNonEmpty!35867 () Bool)

(declare-fun mapRes!35867 () Bool)

(declare-fun tp!68136 () Bool)

(assert (=> mapNonEmpty!35867 (= mapRes!35867 (and tp!68136 e!551420))))

(declare-fun mapRest!35867 () (Array (_ BitVec 32) ValueCell!10798))

(declare-fun mapKey!35867 () (_ BitVec 32))

(declare-fun mapValue!35867 () ValueCell!10798)

(assert (=> mapNonEmpty!35867 (= (arr!29431 _values!1278) (store mapRest!35867 mapKey!35867 mapValue!35867))))

(declare-fun b!978018 () Bool)

(declare-fun res!654514 () Bool)

(assert (=> b!978018 (=> (not res!654514) (not e!551417))))

(declare-datatypes ((List!20396 0))(
  ( (Nil!20393) (Cons!20392 (h!21554 (_ BitVec 64)) (t!28917 List!20396)) )
))
(declare-fun arrayNoDuplicates!0 (array!61145 (_ BitVec 32) List!20396) Bool)

(assert (=> b!978018 (= res!654514 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20393))))

(declare-fun b!978019 () Bool)

(declare-fun res!654512 () Bool)

(assert (=> b!978019 (=> (not res!654512) (not e!551417))))

(assert (=> b!978019 (= res!654512 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29909 _keys!1544))))))

(declare-fun b!978020 () Bool)

(declare-fun res!654516 () Bool)

(assert (=> b!978020 (=> (not res!654516) (not e!551417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61145 (_ BitVec 32)) Bool)

(assert (=> b!978020 (= res!654516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35867 () Bool)

(assert (=> mapIsEmpty!35867 mapRes!35867))

(declare-fun res!654513 () Bool)

(assert (=> start!83756 (=> (not res!654513) (not e!551417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83756 (= res!654513 (validMask!0 mask!1948))))

(assert (=> start!83756 e!551417))

(assert (=> start!83756 true))

(assert (=> start!83756 tp_is_empty!22559))

(declare-fun e!551418 () Bool)

(declare-fun array_inv!22749 (array!61147) Bool)

(assert (=> start!83756 (and (array_inv!22749 _values!1278) e!551418)))

(assert (=> start!83756 tp!68137))

(declare-fun array_inv!22750 (array!61145) Bool)

(assert (=> start!83756 (array_inv!22750 _keys!1544)))

(declare-fun b!978016 () Bool)

(declare-fun res!654517 () Bool)

(assert (=> b!978016 (=> (not res!654517) (not e!551417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978016 (= res!654517 (validKeyInArray!0 (select (arr!29430 _keys!1544) from!1932)))))

(declare-fun b!978021 () Bool)

(declare-fun e!551419 () Bool)

(assert (=> b!978021 (= e!551419 tp_is_empty!22559)))

(declare-fun b!978022 () Bool)

(assert (=> b!978022 (= e!551418 (and e!551419 mapRes!35867))))

(declare-fun condMapEmpty!35867 () Bool)

(declare-fun mapDefault!35867 () ValueCell!10798)

