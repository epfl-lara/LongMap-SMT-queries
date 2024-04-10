; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83748 () Bool)

(assert start!83748)

(declare-fun b_free!19557 () Bool)

(declare-fun b_next!19557 () Bool)

(assert (=> start!83748 (= b_free!19557 (not b_next!19557))))

(declare-fun tp!68112 () Bool)

(declare-fun b_and!31207 () Bool)

(assert (=> start!83748 (= tp!68112 b_and!31207)))

(declare-fun mapIsEmpty!35855 () Bool)

(declare-fun mapRes!35855 () Bool)

(assert (=> mapIsEmpty!35855 mapRes!35855))

(declare-fun b!977889 () Bool)

(declare-fun e!551357 () Bool)

(declare-fun tp_is_empty!22551 () Bool)

(assert (=> b!977889 (= e!551357 tp_is_empty!22551)))

(declare-fun b!977890 () Bool)

(declare-fun e!551358 () Bool)

(assert (=> b!977890 (= e!551358 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35051 0))(
  ( (V!35052 (val!11326 Int)) )
))
(declare-fun minValue!1220 () V!35051)

(declare-datatypes ((ValueCell!10794 0))(
  ( (ValueCellFull!10794 (v!13888 V!35051)) (EmptyCell!10794) )
))
(declare-datatypes ((array!61129 0))(
  ( (array!61130 (arr!29422 (Array (_ BitVec 32) ValueCell!10794)) (size!29901 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61129)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14518 0))(
  ( (tuple2!14519 (_1!7270 (_ BitVec 64)) (_2!7270 V!35051)) )
))
(declare-datatypes ((List!20390 0))(
  ( (Nil!20387) (Cons!20386 (h!21548 tuple2!14518) (t!28905 List!20390)) )
))
(declare-datatypes ((ListLongMap!13215 0))(
  ( (ListLongMap!13216 (toList!6623 List!20390)) )
))
(declare-fun lt!433526 () ListLongMap!13215)

(declare-fun zeroValue!1220 () V!35051)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61131 0))(
  ( (array!61132 (arr!29423 (Array (_ BitVec 32) (_ BitVec 64))) (size!29902 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61131)

(declare-fun +!2928 (ListLongMap!13215 tuple2!14518) ListLongMap!13215)

(declare-fun getCurrentListMapNoExtraKeys!3330 (array!61131 array!61129 (_ BitVec 32) (_ BitVec 32) V!35051 V!35051 (_ BitVec 32) Int) ListLongMap!13215)

(assert (=> b!977890 (= lt!433526 (+!2928 (getCurrentListMapNoExtraKeys!3330 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapNonEmpty!35855 () Bool)

(declare-fun tp!68113 () Bool)

(assert (=> mapNonEmpty!35855 (= mapRes!35855 (and tp!68113 e!551357))))

(declare-fun mapValue!35855 () ValueCell!10794)

(declare-fun mapRest!35855 () (Array (_ BitVec 32) ValueCell!10794))

(declare-fun mapKey!35855 () (_ BitVec 32))

(assert (=> mapNonEmpty!35855 (= (arr!29422 _values!1278) (store mapRest!35855 mapKey!35855 mapValue!35855))))

(declare-fun b!977891 () Bool)

(declare-fun res!654432 () Bool)

(assert (=> b!977891 (=> (not res!654432) (not e!551358))))

(assert (=> b!977891 (= res!654432 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29902 _keys!1544))))))

(declare-fun b!977892 () Bool)

(declare-fun res!654428 () Bool)

(assert (=> b!977892 (=> (not res!654428) (not e!551358))))

(assert (=> b!977892 (= res!654428 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!654431 () Bool)

(assert (=> start!83748 (=> (not res!654431) (not e!551358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83748 (= res!654431 (validMask!0 mask!1948))))

(assert (=> start!83748 e!551358))

(assert (=> start!83748 true))

(assert (=> start!83748 tp_is_empty!22551))

(declare-fun e!551361 () Bool)

(declare-fun array_inv!22743 (array!61129) Bool)

(assert (=> start!83748 (and (array_inv!22743 _values!1278) e!551361)))

(assert (=> start!83748 tp!68112))

(declare-fun array_inv!22744 (array!61131) Bool)

(assert (=> start!83748 (array_inv!22744 _keys!1544)))

(declare-fun b!977893 () Bool)

(declare-fun e!551359 () Bool)

(assert (=> b!977893 (= e!551359 tp_is_empty!22551)))

(declare-fun b!977894 () Bool)

(declare-fun res!654433 () Bool)

(assert (=> b!977894 (=> (not res!654433) (not e!551358))))

(assert (=> b!977894 (= res!654433 (and (= (size!29901 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29902 _keys!1544) (size!29901 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977895 () Bool)

(declare-fun res!654429 () Bool)

(assert (=> b!977895 (=> (not res!654429) (not e!551358))))

(declare-datatypes ((List!20391 0))(
  ( (Nil!20388) (Cons!20387 (h!21549 (_ BitVec 64)) (t!28906 List!20391)) )
))
(declare-fun arrayNoDuplicates!0 (array!61131 (_ BitVec 32) List!20391) Bool)

(assert (=> b!977895 (= res!654429 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20388))))

(declare-fun b!977896 () Bool)

(declare-fun res!654434 () Bool)

(assert (=> b!977896 (=> (not res!654434) (not e!551358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61131 (_ BitVec 32)) Bool)

(assert (=> b!977896 (= res!654434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977897 () Bool)

(declare-fun res!654430 () Bool)

(assert (=> b!977897 (=> (not res!654430) (not e!551358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977897 (= res!654430 (validKeyInArray!0 (select (arr!29423 _keys!1544) from!1932)))))

(declare-fun b!977898 () Bool)

(assert (=> b!977898 (= e!551361 (and e!551359 mapRes!35855))))

(declare-fun condMapEmpty!35855 () Bool)

(declare-fun mapDefault!35855 () ValueCell!10794)

(assert (=> b!977898 (= condMapEmpty!35855 (= (arr!29422 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10794)) mapDefault!35855)))))

(assert (= (and start!83748 res!654431) b!977894))

(assert (= (and b!977894 res!654433) b!977896))

(assert (= (and b!977896 res!654434) b!977895))

(assert (= (and b!977895 res!654429) b!977891))

(assert (= (and b!977891 res!654432) b!977897))

(assert (= (and b!977897 res!654430) b!977892))

(assert (= (and b!977892 res!654428) b!977890))

(assert (= (and b!977898 condMapEmpty!35855) mapIsEmpty!35855))

(assert (= (and b!977898 (not condMapEmpty!35855)) mapNonEmpty!35855))

(get-info :version)

(assert (= (and mapNonEmpty!35855 ((_ is ValueCellFull!10794) mapValue!35855)) b!977889))

(assert (= (and b!977898 ((_ is ValueCellFull!10794) mapDefault!35855)) b!977893))

(assert (= start!83748 b!977898))

(declare-fun m!904995 () Bool)

(assert (=> start!83748 m!904995))

(declare-fun m!904997 () Bool)

(assert (=> start!83748 m!904997))

(declare-fun m!904999 () Bool)

(assert (=> start!83748 m!904999))

(declare-fun m!905001 () Bool)

(assert (=> mapNonEmpty!35855 m!905001))

(declare-fun m!905003 () Bool)

(assert (=> b!977897 m!905003))

(assert (=> b!977897 m!905003))

(declare-fun m!905005 () Bool)

(assert (=> b!977897 m!905005))

(declare-fun m!905007 () Bool)

(assert (=> b!977890 m!905007))

(assert (=> b!977890 m!905007))

(declare-fun m!905009 () Bool)

(assert (=> b!977890 m!905009))

(declare-fun m!905011 () Bool)

(assert (=> b!977896 m!905011))

(declare-fun m!905013 () Bool)

(assert (=> b!977895 m!905013))

(check-sat (not b!977895) (not b_next!19557) (not start!83748) (not b!977896) b_and!31207 (not mapNonEmpty!35855) (not b!977890) (not b!977897) tp_is_empty!22551)
(check-sat b_and!31207 (not b_next!19557))
