; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113302 () Bool)

(assert start!113302)

(declare-fun b_free!31353 () Bool)

(declare-fun b_next!31353 () Bool)

(assert (=> start!113302 (= b_free!31353 (not b_next!31353))))

(declare-fun tp!109863 () Bool)

(declare-fun b_and!50575 () Bool)

(assert (=> start!113302 (= tp!109863 b_and!50575)))

(declare-fun b!1344327 () Bool)

(declare-fun e!765128 () Bool)

(assert (=> b!1344327 (= e!765128 false)))

(declare-datatypes ((V!54907 0))(
  ( (V!54908 (val!18751 Int)) )
))
(declare-fun minValue!1245 () V!54907)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91548 0))(
  ( (array!91549 (arr!44230 (Array (_ BitVec 32) (_ BitVec 64))) (size!44780 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91548)

(declare-fun zeroValue!1245 () V!54907)

(declare-fun lt!595179 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17778 0))(
  ( (ValueCellFull!17778 (v!21399 V!54907)) (EmptyCell!17778) )
))
(declare-datatypes ((array!91550 0))(
  ( (array!91551 (arr!44231 (Array (_ BitVec 32) ValueCell!17778)) (size!44781 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91550)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24162 0))(
  ( (tuple2!24163 (_1!12092 (_ BitVec 64)) (_2!12092 V!54907)) )
))
(declare-datatypes ((List!31318 0))(
  ( (Nil!31315) (Cons!31314 (h!32523 tuple2!24162) (t!45842 List!31318)) )
))
(declare-datatypes ((ListLongMap!21819 0))(
  ( (ListLongMap!21820 (toList!10925 List!31318)) )
))
(declare-fun contains!9101 (ListLongMap!21819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5881 (array!91548 array!91550 (_ BitVec 32) (_ BitVec 32) V!54907 V!54907 (_ BitVec 32) Int) ListLongMap!21819)

(assert (=> b!1344327 (= lt!595179 (contains!9101 (getCurrentListMap!5881 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57736 () Bool)

(declare-fun mapRes!57736 () Bool)

(declare-fun tp!109864 () Bool)

(declare-fun e!765125 () Bool)

(assert (=> mapNonEmpty!57736 (= mapRes!57736 (and tp!109864 e!765125))))

(declare-fun mapRest!57736 () (Array (_ BitVec 32) ValueCell!17778))

(declare-fun mapKey!57736 () (_ BitVec 32))

(declare-fun mapValue!57736 () ValueCell!17778)

(assert (=> mapNonEmpty!57736 (= (arr!44231 _values!1303) (store mapRest!57736 mapKey!57736 mapValue!57736))))

(declare-fun res!891927 () Bool)

(assert (=> start!113302 (=> (not res!891927) (not e!765128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113302 (= res!891927 (validMask!0 mask!1977))))

(assert (=> start!113302 e!765128))

(declare-fun tp_is_empty!37353 () Bool)

(assert (=> start!113302 tp_is_empty!37353))

(assert (=> start!113302 true))

(declare-fun array_inv!33331 (array!91548) Bool)

(assert (=> start!113302 (array_inv!33331 _keys!1571)))

(declare-fun e!765127 () Bool)

(declare-fun array_inv!33332 (array!91550) Bool)

(assert (=> start!113302 (and (array_inv!33332 _values!1303) e!765127)))

(assert (=> start!113302 tp!109863))

(declare-fun b!1344328 () Bool)

(declare-fun res!891930 () Bool)

(assert (=> b!1344328 (=> (not res!891930) (not e!765128))))

(assert (=> b!1344328 (= res!891930 (and (= (size!44781 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44780 _keys!1571) (size!44781 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57736 () Bool)

(assert (=> mapIsEmpty!57736 mapRes!57736))

(declare-fun b!1344329 () Bool)

(declare-fun e!765126 () Bool)

(assert (=> b!1344329 (= e!765127 (and e!765126 mapRes!57736))))

(declare-fun condMapEmpty!57736 () Bool)

(declare-fun mapDefault!57736 () ValueCell!17778)

(assert (=> b!1344329 (= condMapEmpty!57736 (= (arr!44231 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17778)) mapDefault!57736)))))

(declare-fun b!1344330 () Bool)

(declare-fun res!891929 () Bool)

(assert (=> b!1344330 (=> (not res!891929) (not e!765128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91548 (_ BitVec 32)) Bool)

(assert (=> b!1344330 (= res!891929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344331 () Bool)

(declare-fun res!891926 () Bool)

(assert (=> b!1344331 (=> (not res!891926) (not e!765128))))

(declare-datatypes ((List!31319 0))(
  ( (Nil!31316) (Cons!31315 (h!32524 (_ BitVec 64)) (t!45843 List!31319)) )
))
(declare-fun arrayNoDuplicates!0 (array!91548 (_ BitVec 32) List!31319) Bool)

(assert (=> b!1344331 (= res!891926 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31316))))

(declare-fun b!1344332 () Bool)

(assert (=> b!1344332 (= e!765125 tp_is_empty!37353)))

(declare-fun b!1344333 () Bool)

(declare-fun res!891928 () Bool)

(assert (=> b!1344333 (=> (not res!891928) (not e!765128))))

(assert (=> b!1344333 (= res!891928 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44780 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344334 () Bool)

(assert (=> b!1344334 (= e!765126 tp_is_empty!37353)))

(assert (= (and start!113302 res!891927) b!1344328))

(assert (= (and b!1344328 res!891930) b!1344330))

(assert (= (and b!1344330 res!891929) b!1344331))

(assert (= (and b!1344331 res!891926) b!1344333))

(assert (= (and b!1344333 res!891928) b!1344327))

(assert (= (and b!1344329 condMapEmpty!57736) mapIsEmpty!57736))

(assert (= (and b!1344329 (not condMapEmpty!57736)) mapNonEmpty!57736))

(get-info :version)

(assert (= (and mapNonEmpty!57736 ((_ is ValueCellFull!17778) mapValue!57736)) b!1344332))

(assert (= (and b!1344329 ((_ is ValueCellFull!17778) mapDefault!57736)) b!1344334))

(assert (= start!113302 b!1344329))

(declare-fun m!1231967 () Bool)

(assert (=> mapNonEmpty!57736 m!1231967))

(declare-fun m!1231969 () Bool)

(assert (=> b!1344330 m!1231969))

(declare-fun m!1231971 () Bool)

(assert (=> b!1344327 m!1231971))

(assert (=> b!1344327 m!1231971))

(declare-fun m!1231973 () Bool)

(assert (=> b!1344327 m!1231973))

(declare-fun m!1231975 () Bool)

(assert (=> b!1344331 m!1231975))

(declare-fun m!1231977 () Bool)

(assert (=> start!113302 m!1231977))

(declare-fun m!1231979 () Bool)

(assert (=> start!113302 m!1231979))

(declare-fun m!1231981 () Bool)

(assert (=> start!113302 m!1231981))

(check-sat (not b!1344327) tp_is_empty!37353 (not mapNonEmpty!57736) (not b!1344330) (not b!1344331) (not b_next!31353) (not start!113302) b_and!50575)
(check-sat b_and!50575 (not b_next!31353))
