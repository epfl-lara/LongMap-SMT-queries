; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83592 () Bool)

(assert start!83592)

(declare-fun b_free!19417 () Bool)

(declare-fun b_next!19417 () Bool)

(assert (=> start!83592 (= b_free!19417 (not b_next!19417))))

(declare-fun tp!67530 () Bool)

(declare-fun b_and!31029 () Bool)

(assert (=> start!83592 (= tp!67530 b_and!31029)))

(declare-fun res!652571 () Bool)

(declare-fun e!549760 () Bool)

(assert (=> start!83592 (=> (not res!652571) (not e!549760))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83592 (= res!652571 (validMask!0 mask!2147))))

(assert (=> start!83592 e!549760))

(assert (=> start!83592 true))

(declare-datatypes ((V!34737 0))(
  ( (V!34738 (val!11208 Int)) )
))
(declare-datatypes ((ValueCell!10676 0))(
  ( (ValueCellFull!10676 (v!13764 V!34737)) (EmptyCell!10676) )
))
(declare-datatypes ((array!60702 0))(
  ( (array!60703 (arr!29210 (Array (_ BitVec 32) ValueCell!10676)) (size!29690 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60702)

(declare-fun e!549759 () Bool)

(declare-fun array_inv!22643 (array!60702) Bool)

(assert (=> start!83592 (and (array_inv!22643 _values!1425) e!549759)))

(declare-fun tp_is_empty!22315 () Bool)

(assert (=> start!83592 tp_is_empty!22315))

(assert (=> start!83592 tp!67530))

(declare-datatypes ((array!60704 0))(
  ( (array!60705 (arr!29211 (Array (_ BitVec 32) (_ BitVec 64))) (size!29691 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60704)

(declare-fun array_inv!22644 (array!60704) Bool)

(assert (=> start!83592 (array_inv!22644 _keys!1717)))

(declare-fun b!975247 () Bool)

(declare-fun e!549762 () Bool)

(assert (=> b!975247 (= e!549762 tp_is_empty!22315)))

(declare-fun b!975248 () Bool)

(assert (=> b!975248 (= e!549760 false)))

(declare-fun zeroValue!1367 () V!34737)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34737)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14414 0))(
  ( (tuple2!14415 (_1!7218 (_ BitVec 64)) (_2!7218 V!34737)) )
))
(declare-datatypes ((List!20258 0))(
  ( (Nil!20255) (Cons!20254 (h!21422 tuple2!14414) (t!28727 List!20258)) )
))
(declare-datatypes ((ListLongMap!13113 0))(
  ( (ListLongMap!13114 (toList!6572 List!20258)) )
))
(declare-fun lt!433122 () ListLongMap!13113)

(declare-fun getCurrentListMap!3805 (array!60704 array!60702 (_ BitVec 32) (_ BitVec 32) V!34737 V!34737 (_ BitVec 32) Int) ListLongMap!13113)

(assert (=> b!975248 (= lt!433122 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35482 () Bool)

(declare-fun mapRes!35482 () Bool)

(assert (=> mapIsEmpty!35482 mapRes!35482))

(declare-fun b!975249 () Bool)

(declare-fun e!549761 () Bool)

(assert (=> b!975249 (= e!549761 tp_is_empty!22315)))

(declare-fun b!975250 () Bool)

(declare-fun res!652568 () Bool)

(assert (=> b!975250 (=> (not res!652568) (not e!549760))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975250 (= res!652568 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29691 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29691 _keys!1717))))))

(declare-fun b!975251 () Bool)

(declare-fun res!652569 () Bool)

(assert (=> b!975251 (=> (not res!652569) (not e!549760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60704 (_ BitVec 32)) Bool)

(assert (=> b!975251 (= res!652569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975252 () Bool)

(declare-fun res!652566 () Bool)

(assert (=> b!975252 (=> (not res!652566) (not e!549760))))

(declare-fun contains!5677 (ListLongMap!13113 (_ BitVec 64)) Bool)

(assert (=> b!975252 (= res!652566 (contains!5677 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29211 _keys!1717) i!822)))))

(declare-fun b!975253 () Bool)

(assert (=> b!975253 (= e!549759 (and e!549761 mapRes!35482))))

(declare-fun condMapEmpty!35482 () Bool)

(declare-fun mapDefault!35482 () ValueCell!10676)

(assert (=> b!975253 (= condMapEmpty!35482 (= (arr!29210 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10676)) mapDefault!35482)))))

(declare-fun b!975254 () Bool)

(declare-fun res!652565 () Bool)

(assert (=> b!975254 (=> (not res!652565) (not e!549760))))

(declare-datatypes ((List!20259 0))(
  ( (Nil!20256) (Cons!20255 (h!21423 (_ BitVec 64)) (t!28728 List!20259)) )
))
(declare-fun arrayNoDuplicates!0 (array!60704 (_ BitVec 32) List!20259) Bool)

(assert (=> b!975254 (= res!652565 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20256))))

(declare-fun b!975255 () Bool)

(declare-fun res!652567 () Bool)

(assert (=> b!975255 (=> (not res!652567) (not e!549760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975255 (= res!652567 (validKeyInArray!0 (select (arr!29211 _keys!1717) i!822)))))

(declare-fun b!975256 () Bool)

(declare-fun res!652570 () Bool)

(assert (=> b!975256 (=> (not res!652570) (not e!549760))))

(assert (=> b!975256 (= res!652570 (and (= (size!29690 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29691 _keys!1717) (size!29690 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35482 () Bool)

(declare-fun tp!67531 () Bool)

(assert (=> mapNonEmpty!35482 (= mapRes!35482 (and tp!67531 e!549762))))

(declare-fun mapRest!35482 () (Array (_ BitVec 32) ValueCell!10676))

(declare-fun mapKey!35482 () (_ BitVec 32))

(declare-fun mapValue!35482 () ValueCell!10676)

(assert (=> mapNonEmpty!35482 (= (arr!29210 _values!1425) (store mapRest!35482 mapKey!35482 mapValue!35482))))

(assert (= (and start!83592 res!652571) b!975256))

(assert (= (and b!975256 res!652570) b!975251))

(assert (= (and b!975251 res!652569) b!975254))

(assert (= (and b!975254 res!652565) b!975250))

(assert (= (and b!975250 res!652568) b!975255))

(assert (= (and b!975255 res!652567) b!975252))

(assert (= (and b!975252 res!652566) b!975248))

(assert (= (and b!975253 condMapEmpty!35482) mapIsEmpty!35482))

(assert (= (and b!975253 (not condMapEmpty!35482)) mapNonEmpty!35482))

(get-info :version)

(assert (= (and mapNonEmpty!35482 ((_ is ValueCellFull!10676) mapValue!35482)) b!975247))

(assert (= (and b!975253 ((_ is ValueCellFull!10676) mapDefault!35482)) b!975249))

(assert (= start!83592 b!975253))

(declare-fun m!903185 () Bool)

(assert (=> b!975252 m!903185))

(declare-fun m!903187 () Bool)

(assert (=> b!975252 m!903187))

(assert (=> b!975252 m!903185))

(assert (=> b!975252 m!903187))

(declare-fun m!903189 () Bool)

(assert (=> b!975252 m!903189))

(declare-fun m!903191 () Bool)

(assert (=> b!975254 m!903191))

(declare-fun m!903193 () Bool)

(assert (=> start!83592 m!903193))

(declare-fun m!903195 () Bool)

(assert (=> start!83592 m!903195))

(declare-fun m!903197 () Bool)

(assert (=> start!83592 m!903197))

(assert (=> b!975255 m!903187))

(assert (=> b!975255 m!903187))

(declare-fun m!903199 () Bool)

(assert (=> b!975255 m!903199))

(declare-fun m!903201 () Bool)

(assert (=> mapNonEmpty!35482 m!903201))

(declare-fun m!903203 () Bool)

(assert (=> b!975251 m!903203))

(declare-fun m!903205 () Bool)

(assert (=> b!975248 m!903205))

(check-sat tp_is_empty!22315 (not b!975252) (not b!975248) (not b!975254) (not b!975255) b_and!31029 (not b_next!19417) (not start!83592) (not b!975251) (not mapNonEmpty!35482))
(check-sat b_and!31029 (not b_next!19417))
