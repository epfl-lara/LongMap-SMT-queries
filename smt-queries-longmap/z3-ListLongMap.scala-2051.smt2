; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35460 () Bool)

(assert start!35460)

(declare-fun b_free!7861 () Bool)

(declare-fun b_next!7861 () Bool)

(assert (=> start!35460 (= b_free!7861 (not b_next!7861))))

(declare-fun tp!27369 () Bool)

(declare-fun b_and!15077 () Bool)

(assert (=> start!35460 (= tp!27369 b_and!15077)))

(declare-fun b!355221 () Bool)

(declare-fun e!217572 () Bool)

(declare-fun e!217575 () Bool)

(declare-fun mapRes!13398 () Bool)

(assert (=> b!355221 (= e!217572 (and e!217575 mapRes!13398))))

(declare-fun condMapEmpty!13398 () Bool)

(declare-datatypes ((V!11547 0))(
  ( (V!11548 (val!4008 Int)) )
))
(declare-datatypes ((ValueCell!3620 0))(
  ( (ValueCellFull!3620 (v!6196 V!11547)) (EmptyCell!3620) )
))
(declare-datatypes ((array!19419 0))(
  ( (array!19420 (arr!9203 (Array (_ BitVec 32) ValueCell!3620)) (size!9556 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19419)

(declare-fun mapDefault!13398 () ValueCell!3620)

(assert (=> b!355221 (= condMapEmpty!13398 (= (arr!9203 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3620)) mapDefault!13398)))))

(declare-fun mapIsEmpty!13398 () Bool)

(assert (=> mapIsEmpty!13398 mapRes!13398))

(declare-fun b!355222 () Bool)

(declare-fun res!197105 () Bool)

(declare-fun e!217574 () Bool)

(assert (=> b!355222 (=> (not res!197105) (not e!217574))))

(declare-datatypes ((array!19421 0))(
  ( (array!19422 (arr!9204 (Array (_ BitVec 32) (_ BitVec 64))) (size!9557 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19421)

(declare-datatypes ((List!5308 0))(
  ( (Nil!5305) (Cons!5304 (h!6160 (_ BitVec 64)) (t!10449 List!5308)) )
))
(declare-fun arrayNoDuplicates!0 (array!19421 (_ BitVec 32) List!5308) Bool)

(assert (=> b!355222 (= res!197105 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5305))))

(declare-fun b!355223 () Bool)

(declare-fun res!197106 () Bool)

(assert (=> b!355223 (=> (not res!197106) (not e!217574))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355223 (= res!197106 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355224 () Bool)

(declare-fun res!197099 () Bool)

(assert (=> b!355224 (=> (not res!197099) (not e!217574))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!355224 (= res!197099 (and (= (size!9556 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9557 _keys!1456) (size!9556 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355225 () Bool)

(declare-fun res!197101 () Bool)

(assert (=> b!355225 (=> (not res!197101) (not e!217574))))

(assert (=> b!355225 (= res!197101 (= (select (arr!9204 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355226 () Bool)

(declare-fun res!197102 () Bool)

(assert (=> b!355226 (=> (not res!197102) (not e!217574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355226 (= res!197102 (validKeyInArray!0 (select (arr!9204 _keys!1456) from!1805)))))

(declare-fun b!355227 () Bool)

(declare-fun e!217571 () Bool)

(declare-fun tp_is_empty!7927 () Bool)

(assert (=> b!355227 (= e!217571 tp_is_empty!7927)))

(declare-fun b!355228 () Bool)

(declare-fun res!197100 () Bool)

(assert (=> b!355228 (=> (not res!197100) (not e!217574))))

(assert (=> b!355228 (= res!197100 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9557 _keys!1456))))))

(declare-fun b!355229 () Bool)

(declare-fun res!197104 () Bool)

(assert (=> b!355229 (=> (not res!197104) (not e!217574))))

(assert (=> b!355229 (= res!197104 (validKeyInArray!0 k0!1077))))

(declare-fun b!355230 () Bool)

(assert (=> b!355230 (= e!217575 tp_is_empty!7927)))

(declare-fun b!355231 () Bool)

(declare-fun res!197107 () Bool)

(assert (=> b!355231 (=> (not res!197107) (not e!217574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19421 (_ BitVec 32)) Bool)

(assert (=> b!355231 (= res!197107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355232 () Bool)

(assert (=> b!355232 (= e!217574 (not (bvsle #b00000000000000000000000000000000 (size!9557 _keys!1456))))))

(declare-fun minValue!1150 () V!11547)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11547)

(declare-datatypes ((tuple2!5664 0))(
  ( (tuple2!5665 (_1!2843 (_ BitVec 64)) (_2!2843 V!11547)) )
))
(declare-datatypes ((List!5309 0))(
  ( (Nil!5306) (Cons!5305 (h!6161 tuple2!5664) (t!10450 List!5309)) )
))
(declare-datatypes ((ListLongMap!4567 0))(
  ( (ListLongMap!4568 (toList!2299 List!5309)) )
))
(declare-fun contains!2389 (ListLongMap!4567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1804 (array!19421 array!19419 (_ BitVec 32) (_ BitVec 32) V!11547 V!11547 (_ BitVec 32) Int) ListLongMap!4567)

(assert (=> b!355232 (contains!2389 (getCurrentListMap!1804 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9204 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10944 0))(
  ( (Unit!10945) )
))
(declare-fun lt!165571 () Unit!10944)

(declare-fun lemmaValidKeyInArrayIsInListMap!196 (array!19421 array!19419 (_ BitVec 32) (_ BitVec 32) V!11547 V!11547 (_ BitVec 32) Int) Unit!10944)

(assert (=> b!355232 (= lt!165571 (lemmaValidKeyInArrayIsInListMap!196 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun res!197103 () Bool)

(assert (=> start!35460 (=> (not res!197103) (not e!217574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35460 (= res!197103 (validMask!0 mask!1842))))

(assert (=> start!35460 e!217574))

(assert (=> start!35460 tp_is_empty!7927))

(assert (=> start!35460 true))

(assert (=> start!35460 tp!27369))

(declare-fun array_inv!6812 (array!19421) Bool)

(assert (=> start!35460 (array_inv!6812 _keys!1456)))

(declare-fun array_inv!6813 (array!19419) Bool)

(assert (=> start!35460 (and (array_inv!6813 _values!1208) e!217572)))

(declare-fun mapNonEmpty!13398 () Bool)

(declare-fun tp!27368 () Bool)

(assert (=> mapNonEmpty!13398 (= mapRes!13398 (and tp!27368 e!217571))))

(declare-fun mapRest!13398 () (Array (_ BitVec 32) ValueCell!3620))

(declare-fun mapValue!13398 () ValueCell!3620)

(declare-fun mapKey!13398 () (_ BitVec 32))

(assert (=> mapNonEmpty!13398 (= (arr!9203 _values!1208) (store mapRest!13398 mapKey!13398 mapValue!13398))))

(assert (= (and start!35460 res!197103) b!355224))

(assert (= (and b!355224 res!197099) b!355231))

(assert (= (and b!355231 res!197107) b!355222))

(assert (= (and b!355222 res!197105) b!355229))

(assert (= (and b!355229 res!197104) b!355228))

(assert (= (and b!355228 res!197100) b!355223))

(assert (= (and b!355223 res!197106) b!355225))

(assert (= (and b!355225 res!197101) b!355226))

(assert (= (and b!355226 res!197102) b!355232))

(assert (= (and b!355221 condMapEmpty!13398) mapIsEmpty!13398))

(assert (= (and b!355221 (not condMapEmpty!13398)) mapNonEmpty!13398))

(get-info :version)

(assert (= (and mapNonEmpty!13398 ((_ is ValueCellFull!3620) mapValue!13398)) b!355227))

(assert (= (and b!355221 ((_ is ValueCellFull!3620) mapDefault!13398)) b!355230))

(assert (= start!35460 b!355221))

(declare-fun m!353469 () Bool)

(assert (=> b!355229 m!353469))

(declare-fun m!353471 () Bool)

(assert (=> mapNonEmpty!13398 m!353471))

(declare-fun m!353473 () Bool)

(assert (=> b!355231 m!353473))

(declare-fun m!353475 () Bool)

(assert (=> b!355225 m!353475))

(declare-fun m!353477 () Bool)

(assert (=> b!355223 m!353477))

(declare-fun m!353479 () Bool)

(assert (=> start!35460 m!353479))

(declare-fun m!353481 () Bool)

(assert (=> start!35460 m!353481))

(declare-fun m!353483 () Bool)

(assert (=> start!35460 m!353483))

(declare-fun m!353485 () Bool)

(assert (=> b!355232 m!353485))

(assert (=> b!355232 m!353475))

(assert (=> b!355232 m!353485))

(assert (=> b!355232 m!353475))

(declare-fun m!353487 () Bool)

(assert (=> b!355232 m!353487))

(declare-fun m!353489 () Bool)

(assert (=> b!355232 m!353489))

(declare-fun m!353491 () Bool)

(assert (=> b!355222 m!353491))

(assert (=> b!355226 m!353475))

(assert (=> b!355226 m!353475))

(declare-fun m!353493 () Bool)

(assert (=> b!355226 m!353493))

(check-sat tp_is_empty!7927 (not b!355222) (not b!355231) (not b!355229) (not b!355226) (not start!35460) b_and!15077 (not b!355232) (not mapNonEmpty!13398) (not b!355223) (not b_next!7861))
(check-sat b_and!15077 (not b_next!7861))
