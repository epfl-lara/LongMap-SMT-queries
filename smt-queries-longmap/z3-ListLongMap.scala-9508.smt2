; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112800 () Bool)

(assert start!112800)

(declare-fun b_free!31053 () Bool)

(declare-fun b_next!31053 () Bool)

(assert (=> start!112800 (= b_free!31053 (not b_next!31053))))

(declare-fun tp!108806 () Bool)

(declare-fun b_and!50053 () Bool)

(assert (=> start!112800 (= tp!108806 b_and!50053)))

(declare-fun b!1337813 () Bool)

(declare-fun e!761774 () Bool)

(declare-fun tp_is_empty!36963 () Bool)

(assert (=> b!1337813 (= e!761774 tp_is_empty!36963)))

(declare-fun b!1337814 () Bool)

(declare-fun res!887727 () Bool)

(declare-fun e!761771 () Bool)

(assert (=> b!1337814 (=> (not res!887727) (not e!761771))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90784 0))(
  ( (array!90785 (arr!43855 (Array (_ BitVec 32) (_ BitVec 64))) (size!44405 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90784)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337814 (= res!887727 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44405 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337815 () Bool)

(declare-fun res!887726 () Bool)

(assert (=> b!1337815 (=> (not res!887726) (not e!761771))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90784 (_ BitVec 32)) Bool)

(assert (=> b!1337815 (= res!887726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337816 () Bool)

(declare-fun res!887725 () Bool)

(assert (=> b!1337816 (=> (not res!887725) (not e!761771))))

(declare-datatypes ((V!54387 0))(
  ( (V!54388 (val!18556 Int)) )
))
(declare-datatypes ((ValueCell!17583 0))(
  ( (ValueCellFull!17583 (v!21200 V!54387)) (EmptyCell!17583) )
))
(declare-datatypes ((array!90786 0))(
  ( (array!90787 (arr!43856 (Array (_ BitVec 32) ValueCell!17583)) (size!44406 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90786)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54387)

(declare-fun zeroValue!1262 () V!54387)

(declare-datatypes ((tuple2!23938 0))(
  ( (tuple2!23939 (_1!11980 (_ BitVec 64)) (_2!11980 V!54387)) )
))
(declare-datatypes ((List!31080 0))(
  ( (Nil!31077) (Cons!31076 (h!32285 tuple2!23938) (t!45402 List!31080)) )
))
(declare-datatypes ((ListLongMap!21595 0))(
  ( (ListLongMap!21596 (toList!10813 List!31080)) )
))
(declare-fun contains!8982 (ListLongMap!21595 (_ BitVec 64)) Bool)

(declare-fun +!4749 (ListLongMap!21595 tuple2!23938) ListLongMap!21595)

(declare-fun getCurrentListMapNoExtraKeys!6391 (array!90784 array!90786 (_ BitVec 32) (_ BitVec 32) V!54387 V!54387 (_ BitVec 32) Int) ListLongMap!21595)

(declare-fun get!22137 (ValueCell!17583 V!54387) V!54387)

(declare-fun dynLambda!3688 (Int (_ BitVec 64)) V!54387)

(assert (=> b!1337816 (= res!887725 (contains!8982 (+!4749 (getCurrentListMapNoExtraKeys!6391 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23939 (select (arr!43855 _keys!1590) from!1980) (get!22137 (select (arr!43856 _values!1320) from!1980) (dynLambda!3688 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1337817 () Bool)

(declare-fun res!887724 () Bool)

(assert (=> b!1337817 (=> (not res!887724) (not e!761771))))

(assert (=> b!1337817 (= res!887724 (and (= (size!44406 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44405 _keys!1590) (size!44406 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337818 () Bool)

(assert (=> b!1337818 (= e!761771 (= k0!1153 (select (arr!43855 _keys!1590) from!1980)))))

(declare-fun b!1337819 () Bool)

(declare-fun res!887722 () Bool)

(assert (=> b!1337819 (=> (not res!887722) (not e!761771))))

(assert (=> b!1337819 (= res!887722 (not (= (select (arr!43855 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!57129 () Bool)

(declare-fun mapRes!57129 () Bool)

(assert (=> mapIsEmpty!57129 mapRes!57129))

(declare-fun b!1337820 () Bool)

(declare-fun res!887723 () Bool)

(assert (=> b!1337820 (=> (not res!887723) (not e!761771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337820 (= res!887723 (validKeyInArray!0 (select (arr!43855 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!57129 () Bool)

(declare-fun tp!108807 () Bool)

(declare-fun e!761770 () Bool)

(assert (=> mapNonEmpty!57129 (= mapRes!57129 (and tp!108807 e!761770))))

(declare-fun mapRest!57129 () (Array (_ BitVec 32) ValueCell!17583))

(declare-fun mapValue!57129 () ValueCell!17583)

(declare-fun mapKey!57129 () (_ BitVec 32))

(assert (=> mapNonEmpty!57129 (= (arr!43856 _values!1320) (store mapRest!57129 mapKey!57129 mapValue!57129))))

(declare-fun b!1337821 () Bool)

(declare-fun e!761772 () Bool)

(assert (=> b!1337821 (= e!761772 (and e!761774 mapRes!57129))))

(declare-fun condMapEmpty!57129 () Bool)

(declare-fun mapDefault!57129 () ValueCell!17583)

(assert (=> b!1337821 (= condMapEmpty!57129 (= (arr!43856 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17583)) mapDefault!57129)))))

(declare-fun b!1337822 () Bool)

(assert (=> b!1337822 (= e!761770 tp_is_empty!36963)))

(declare-fun res!887728 () Bool)

(assert (=> start!112800 (=> (not res!887728) (not e!761771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112800 (= res!887728 (validMask!0 mask!1998))))

(assert (=> start!112800 e!761771))

(declare-fun array_inv!33073 (array!90786) Bool)

(assert (=> start!112800 (and (array_inv!33073 _values!1320) e!761772)))

(assert (=> start!112800 true))

(declare-fun array_inv!33074 (array!90784) Bool)

(assert (=> start!112800 (array_inv!33074 _keys!1590)))

(assert (=> start!112800 tp!108806))

(assert (=> start!112800 tp_is_empty!36963))

(declare-fun b!1337823 () Bool)

(declare-fun res!887720 () Bool)

(assert (=> b!1337823 (=> (not res!887720) (not e!761771))))

(assert (=> b!1337823 (= res!887720 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1337824 () Bool)

(declare-fun res!887719 () Bool)

(assert (=> b!1337824 (=> (not res!887719) (not e!761771))))

(declare-fun getCurrentListMap!5782 (array!90784 array!90786 (_ BitVec 32) (_ BitVec 32) V!54387 V!54387 (_ BitVec 32) Int) ListLongMap!21595)

(assert (=> b!1337824 (= res!887719 (contains!8982 (getCurrentListMap!5782 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337825 () Bool)

(declare-fun res!887721 () Bool)

(assert (=> b!1337825 (=> (not res!887721) (not e!761771))))

(declare-datatypes ((List!31081 0))(
  ( (Nil!31078) (Cons!31077 (h!32286 (_ BitVec 64)) (t!45403 List!31081)) )
))
(declare-fun arrayNoDuplicates!0 (array!90784 (_ BitVec 32) List!31081) Bool)

(assert (=> b!1337825 (= res!887721 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31078))))

(assert (= (and start!112800 res!887728) b!1337817))

(assert (= (and b!1337817 res!887724) b!1337815))

(assert (= (and b!1337815 res!887726) b!1337825))

(assert (= (and b!1337825 res!887721) b!1337814))

(assert (= (and b!1337814 res!887727) b!1337824))

(assert (= (and b!1337824 res!887719) b!1337819))

(assert (= (and b!1337819 res!887722) b!1337820))

(assert (= (and b!1337820 res!887723) b!1337823))

(assert (= (and b!1337823 res!887720) b!1337816))

(assert (= (and b!1337816 res!887725) b!1337818))

(assert (= (and b!1337821 condMapEmpty!57129) mapIsEmpty!57129))

(assert (= (and b!1337821 (not condMapEmpty!57129)) mapNonEmpty!57129))

(get-info :version)

(assert (= (and mapNonEmpty!57129 ((_ is ValueCellFull!17583) mapValue!57129)) b!1337822))

(assert (= (and b!1337821 ((_ is ValueCellFull!17583) mapDefault!57129)) b!1337813))

(assert (= start!112800 b!1337821))

(declare-fun b_lambda!24247 () Bool)

(assert (=> (not b_lambda!24247) (not b!1337816)))

(declare-fun t!45401 () Bool)

(declare-fun tb!12125 () Bool)

(assert (=> (and start!112800 (= defaultEntry!1323 defaultEntry!1323) t!45401) tb!12125))

(declare-fun result!25327 () Bool)

(assert (=> tb!12125 (= result!25327 tp_is_empty!36963)))

(assert (=> b!1337816 t!45401))

(declare-fun b_and!50055 () Bool)

(assert (= b_and!50053 (and (=> t!45401 result!25327) b_and!50055)))

(declare-fun m!1225973 () Bool)

(assert (=> b!1337820 m!1225973))

(assert (=> b!1337820 m!1225973))

(declare-fun m!1225975 () Bool)

(assert (=> b!1337820 m!1225975))

(declare-fun m!1225977 () Bool)

(assert (=> b!1337825 m!1225977))

(declare-fun m!1225979 () Bool)

(assert (=> start!112800 m!1225979))

(declare-fun m!1225981 () Bool)

(assert (=> start!112800 m!1225981))

(declare-fun m!1225983 () Bool)

(assert (=> start!112800 m!1225983))

(assert (=> b!1337819 m!1225973))

(declare-fun m!1225985 () Bool)

(assert (=> b!1337816 m!1225985))

(declare-fun m!1225987 () Bool)

(assert (=> b!1337816 m!1225987))

(declare-fun m!1225989 () Bool)

(assert (=> b!1337816 m!1225989))

(declare-fun m!1225991 () Bool)

(assert (=> b!1337816 m!1225991))

(assert (=> b!1337816 m!1225985))

(declare-fun m!1225993 () Bool)

(assert (=> b!1337816 m!1225993))

(assert (=> b!1337816 m!1225989))

(declare-fun m!1225995 () Bool)

(assert (=> b!1337816 m!1225995))

(assert (=> b!1337816 m!1225987))

(assert (=> b!1337816 m!1225991))

(assert (=> b!1337816 m!1225973))

(declare-fun m!1225997 () Bool)

(assert (=> b!1337824 m!1225997))

(assert (=> b!1337824 m!1225997))

(declare-fun m!1225999 () Bool)

(assert (=> b!1337824 m!1225999))

(declare-fun m!1226001 () Bool)

(assert (=> b!1337815 m!1226001))

(assert (=> b!1337818 m!1225973))

(declare-fun m!1226003 () Bool)

(assert (=> mapNonEmpty!57129 m!1226003))

(check-sat (not b!1337824) (not b!1337815) (not b!1337816) (not mapNonEmpty!57129) tp_is_empty!36963 (not b_lambda!24247) (not b!1337820) (not start!112800) b_and!50055 (not b_next!31053) (not b!1337825))
(check-sat b_and!50055 (not b_next!31053))
