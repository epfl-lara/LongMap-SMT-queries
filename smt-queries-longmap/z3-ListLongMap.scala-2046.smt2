; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35446 () Bool)

(assert start!35446)

(declare-fun b_free!7833 () Bool)

(declare-fun b_next!7833 () Bool)

(assert (=> start!35446 (= b_free!7833 (not b_next!7833))))

(declare-fun tp!27284 () Bool)

(declare-fun b_and!15075 () Bool)

(assert (=> start!35446 (= tp!27284 b_and!15075)))

(declare-fun b!354992 () Bool)

(declare-fun e!217538 () Bool)

(declare-fun tp_is_empty!7899 () Bool)

(assert (=> b!354992 (= e!217538 tp_is_empty!7899)))

(declare-fun b!354993 () Bool)

(declare-fun res!196854 () Bool)

(declare-fun e!217541 () Bool)

(assert (=> b!354993 (=> (not res!196854) (not e!217541))))

(declare-datatypes ((array!19377 0))(
  ( (array!19378 (arr!9182 (Array (_ BitVec 32) (_ BitVec 64))) (size!9534 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19377)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19377 (_ BitVec 32)) Bool)

(assert (=> b!354993 (= res!196854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13356 () Bool)

(declare-fun mapRes!13356 () Bool)

(assert (=> mapIsEmpty!13356 mapRes!13356))

(declare-fun b!354994 () Bool)

(declare-fun res!196852 () Bool)

(assert (=> b!354994 (=> (not res!196852) (not e!217541))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354994 (= res!196852 (validKeyInArray!0 k0!1077))))

(declare-fun res!196857 () Bool)

(assert (=> start!35446 (=> (not res!196857) (not e!217541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35446 (= res!196857 (validMask!0 mask!1842))))

(assert (=> start!35446 e!217541))

(assert (=> start!35446 tp_is_empty!7899))

(assert (=> start!35446 true))

(assert (=> start!35446 tp!27284))

(declare-fun array_inv!6748 (array!19377) Bool)

(assert (=> start!35446 (array_inv!6748 _keys!1456)))

(declare-datatypes ((V!11509 0))(
  ( (V!11510 (val!3994 Int)) )
))
(declare-datatypes ((ValueCell!3606 0))(
  ( (ValueCellFull!3606 (v!6188 V!11509)) (EmptyCell!3606) )
))
(declare-datatypes ((array!19379 0))(
  ( (array!19380 (arr!9183 (Array (_ BitVec 32) ValueCell!3606)) (size!9535 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19379)

(declare-fun e!217537 () Bool)

(declare-fun array_inv!6749 (array!19379) Bool)

(assert (=> start!35446 (and (array_inv!6749 _values!1208) e!217537)))

(declare-fun b!354995 () Bool)

(declare-fun res!196858 () Bool)

(assert (=> b!354995 (=> (not res!196858) (not e!217541))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!354995 (= res!196858 (validKeyInArray!0 (select (arr!9182 _keys!1456) from!1805)))))

(declare-fun b!354996 () Bool)

(declare-fun res!196853 () Bool)

(assert (=> b!354996 (=> (not res!196853) (not e!217541))))

(declare-fun arrayContainsKey!0 (array!19377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354996 (= res!196853 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354997 () Bool)

(declare-fun res!196855 () Bool)

(assert (=> b!354997 (=> (not res!196855) (not e!217541))))

(declare-datatypes ((List!5317 0))(
  ( (Nil!5314) (Cons!5313 (h!6169 (_ BitVec 64)) (t!10467 List!5317)) )
))
(declare-fun arrayNoDuplicates!0 (array!19377 (_ BitVec 32) List!5317) Bool)

(assert (=> b!354997 (= res!196855 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5314))))

(declare-fun b!354998 () Bool)

(assert (=> b!354998 (= e!217541 (not true))))

(declare-fun minValue!1150 () V!11509)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11509)

(declare-datatypes ((tuple2!5674 0))(
  ( (tuple2!5675 (_1!2848 (_ BitVec 64)) (_2!2848 V!11509)) )
))
(declare-datatypes ((List!5318 0))(
  ( (Nil!5315) (Cons!5314 (h!6170 tuple2!5674) (t!10468 List!5318)) )
))
(declare-datatypes ((ListLongMap!4587 0))(
  ( (ListLongMap!4588 (toList!2309 List!5318)) )
))
(declare-fun contains!2389 (ListLongMap!4587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1830 (array!19377 array!19379 (_ BitVec 32) (_ BitVec 32) V!11509 V!11509 (_ BitVec 32) Int) ListLongMap!4587)

(assert (=> b!354998 (contains!2389 (getCurrentListMap!1830 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9182 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10940 0))(
  ( (Unit!10941) )
))
(declare-fun lt!165764 () Unit!10940)

(declare-fun lemmaValidKeyInArrayIsInListMap!187 (array!19377 array!19379 (_ BitVec 32) (_ BitVec 32) V!11509 V!11509 (_ BitVec 32) Int) Unit!10940)

(assert (=> b!354998 (= lt!165764 (lemmaValidKeyInArrayIsInListMap!187 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapNonEmpty!13356 () Bool)

(declare-fun tp!27285 () Bool)

(assert (=> mapNonEmpty!13356 (= mapRes!13356 (and tp!27285 e!217538))))

(declare-fun mapRest!13356 () (Array (_ BitVec 32) ValueCell!3606))

(declare-fun mapValue!13356 () ValueCell!3606)

(declare-fun mapKey!13356 () (_ BitVec 32))

(assert (=> mapNonEmpty!13356 (= (arr!9183 _values!1208) (store mapRest!13356 mapKey!13356 mapValue!13356))))

(declare-fun b!354999 () Bool)

(declare-fun e!217540 () Bool)

(assert (=> b!354999 (= e!217540 tp_is_empty!7899)))

(declare-fun b!355000 () Bool)

(declare-fun res!196850 () Bool)

(assert (=> b!355000 (=> (not res!196850) (not e!217541))))

(assert (=> b!355000 (= res!196850 (and (= (size!9535 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9534 _keys!1456) (size!9535 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355001 () Bool)

(declare-fun res!196856 () Bool)

(assert (=> b!355001 (=> (not res!196856) (not e!217541))))

(assert (=> b!355001 (= res!196856 (= (select (arr!9182 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355002 () Bool)

(declare-fun res!196851 () Bool)

(assert (=> b!355002 (=> (not res!196851) (not e!217541))))

(assert (=> b!355002 (= res!196851 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9534 _keys!1456))))))

(declare-fun b!355003 () Bool)

(assert (=> b!355003 (= e!217537 (and e!217540 mapRes!13356))))

(declare-fun condMapEmpty!13356 () Bool)

(declare-fun mapDefault!13356 () ValueCell!3606)

(assert (=> b!355003 (= condMapEmpty!13356 (= (arr!9183 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3606)) mapDefault!13356)))))

(assert (= (and start!35446 res!196857) b!355000))

(assert (= (and b!355000 res!196850) b!354993))

(assert (= (and b!354993 res!196854) b!354997))

(assert (= (and b!354997 res!196855) b!354994))

(assert (= (and b!354994 res!196852) b!355002))

(assert (= (and b!355002 res!196851) b!354996))

(assert (= (and b!354996 res!196853) b!355001))

(assert (= (and b!355001 res!196856) b!354995))

(assert (= (and b!354995 res!196858) b!354998))

(assert (= (and b!355003 condMapEmpty!13356) mapIsEmpty!13356))

(assert (= (and b!355003 (not condMapEmpty!13356)) mapNonEmpty!13356))

(get-info :version)

(assert (= (and mapNonEmpty!13356 ((_ is ValueCellFull!3606) mapValue!13356)) b!354992))

(assert (= (and b!355003 ((_ is ValueCellFull!3606) mapDefault!13356)) b!354999))

(assert (= start!35446 b!355003))

(declare-fun m!353835 () Bool)

(assert (=> b!354995 m!353835))

(assert (=> b!354995 m!353835))

(declare-fun m!353837 () Bool)

(assert (=> b!354995 m!353837))

(declare-fun m!353839 () Bool)

(assert (=> b!354994 m!353839))

(declare-fun m!353841 () Bool)

(assert (=> b!354998 m!353841))

(assert (=> b!354998 m!353835))

(assert (=> b!354998 m!353841))

(assert (=> b!354998 m!353835))

(declare-fun m!353843 () Bool)

(assert (=> b!354998 m!353843))

(declare-fun m!353845 () Bool)

(assert (=> b!354998 m!353845))

(declare-fun m!353847 () Bool)

(assert (=> b!354996 m!353847))

(declare-fun m!353849 () Bool)

(assert (=> b!354997 m!353849))

(declare-fun m!353851 () Bool)

(assert (=> b!354993 m!353851))

(declare-fun m!353853 () Bool)

(assert (=> mapNonEmpty!13356 m!353853))

(declare-fun m!353855 () Bool)

(assert (=> start!35446 m!353855))

(declare-fun m!353857 () Bool)

(assert (=> start!35446 m!353857))

(declare-fun m!353859 () Bool)

(assert (=> start!35446 m!353859))

(assert (=> b!355001 m!353835))

(check-sat (not b_next!7833) (not b!354995) (not b!354997) tp_is_empty!7899 (not start!35446) (not b!354993) (not b!354996) (not mapNonEmpty!13356) (not b!354994) (not b!354998) b_and!15075)
(check-sat b_and!15075 (not b_next!7833))
