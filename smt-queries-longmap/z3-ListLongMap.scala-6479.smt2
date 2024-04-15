; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82696 () Bool)

(assert start!82696)

(declare-fun b_free!18847 () Bool)

(declare-fun b_next!18847 () Bool)

(assert (=> start!82696 (= b_free!18847 (not b_next!18847))))

(declare-fun tp!65662 () Bool)

(declare-fun b_and!30309 () Bool)

(assert (=> start!82696 (= tp!65662 b_and!30309)))

(declare-fun mapIsEmpty!34468 () Bool)

(declare-fun mapRes!34468 () Bool)

(assert (=> mapIsEmpty!34468 mapRes!34468))

(declare-fun b!964365 () Bool)

(declare-fun res!645553 () Bool)

(declare-fun e!543646 () Bool)

(assert (=> b!964365 (=> (not res!645553) (not e!543646))))

(declare-datatypes ((array!59320 0))(
  ( (array!59321 (arr!28529 (Array (_ BitVec 32) (_ BitVec 64))) (size!29010 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59320)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964365 (= res!645553 (validKeyInArray!0 (select (arr!28529 _keys!1686) i!803)))))

(declare-fun b!964366 () Bool)

(declare-fun res!645552 () Bool)

(assert (=> b!964366 (=> (not res!645552) (not e!543646))))

(declare-datatypes ((List!19854 0))(
  ( (Nil!19851) (Cons!19850 (h!21012 (_ BitVec 64)) (t!28208 List!19854)) )
))
(declare-fun arrayNoDuplicates!0 (array!59320 (_ BitVec 32) List!19854) Bool)

(assert (=> b!964366 (= res!645552 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19851))))

(declare-fun b!964367 () Bool)

(declare-fun e!543649 () Bool)

(declare-fun tp_is_empty!21649 () Bool)

(assert (=> b!964367 (= e!543649 tp_is_empty!21649)))

(declare-fun b!964368 () Bool)

(declare-fun res!645547 () Bool)

(assert (=> b!964368 (=> (not res!645547) (not e!543646))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33849 0))(
  ( (V!33850 (val!10875 Int)) )
))
(declare-datatypes ((ValueCell!10343 0))(
  ( (ValueCellFull!10343 (v!13432 V!33849)) (EmptyCell!10343) )
))
(declare-datatypes ((array!59322 0))(
  ( (array!59323 (arr!28530 (Array (_ BitVec 32) ValueCell!10343)) (size!29011 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59322)

(declare-fun minValue!1342 () V!33849)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33849)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14048 0))(
  ( (tuple2!14049 (_1!7035 (_ BitVec 64)) (_2!7035 V!33849)) )
))
(declare-datatypes ((List!19855 0))(
  ( (Nil!19852) (Cons!19851 (h!21013 tuple2!14048) (t!28209 List!19855)) )
))
(declare-datatypes ((ListLongMap!12735 0))(
  ( (ListLongMap!12736 (toList!6383 List!19855)) )
))
(declare-fun contains!5430 (ListLongMap!12735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3545 (array!59320 array!59322 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) Int) ListLongMap!12735)

(assert (=> b!964368 (= res!645547 (contains!5430 (getCurrentListMap!3545 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28529 _keys!1686) i!803)))))

(declare-fun res!645554 () Bool)

(assert (=> start!82696 (=> (not res!645554) (not e!543646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82696 (= res!645554 (validMask!0 mask!2110))))

(assert (=> start!82696 e!543646))

(assert (=> start!82696 true))

(declare-fun e!543645 () Bool)

(declare-fun array_inv!22157 (array!59322) Bool)

(assert (=> start!82696 (and (array_inv!22157 _values!1400) e!543645)))

(declare-fun array_inv!22158 (array!59320) Bool)

(assert (=> start!82696 (array_inv!22158 _keys!1686)))

(assert (=> start!82696 tp!65662))

(assert (=> start!82696 tp_is_empty!21649))

(declare-fun b!964369 () Bool)

(declare-fun e!543647 () Bool)

(assert (=> b!964369 (= e!543646 (not e!543647))))

(declare-fun res!645550 () Bool)

(assert (=> b!964369 (=> res!645550 e!543647)))

(assert (=> b!964369 (= res!645550 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29010 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964369 (contains!5430 (getCurrentListMap!3545 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28529 _keys!1686) i!803))))

(declare-datatypes ((Unit!32152 0))(
  ( (Unit!32153) )
))
(declare-fun lt!430895 () Unit!32152)

(declare-fun lemmaInListMapFromThenInFromMinusOne!41 (array!59320 array!59322 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) (_ BitVec 32) Int) Unit!32152)

(assert (=> b!964369 (= lt!430895 (lemmaInListMapFromThenInFromMinusOne!41 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964370 () Bool)

(declare-fun res!645551 () Bool)

(assert (=> b!964370 (=> (not res!645551) (not e!543646))))

(assert (=> b!964370 (= res!645551 (and (= (size!29011 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29010 _keys!1686) (size!29011 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964371 () Bool)

(assert (=> b!964371 (= e!543645 (and e!543649 mapRes!34468))))

(declare-fun condMapEmpty!34468 () Bool)

(declare-fun mapDefault!34468 () ValueCell!10343)

(assert (=> b!964371 (= condMapEmpty!34468 (= (arr!28530 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10343)) mapDefault!34468)))))

(declare-fun b!964372 () Bool)

(declare-fun res!645549 () Bool)

(assert (=> b!964372 (=> (not res!645549) (not e!543646))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964372 (= res!645549 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29010 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29010 _keys!1686))))))

(declare-fun b!964373 () Bool)

(declare-fun res!645546 () Bool)

(assert (=> b!964373 (=> (not res!645546) (not e!543646))))

(assert (=> b!964373 (= res!645546 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964374 () Bool)

(assert (=> b!964374 (= e!543647 true)))

(assert (=> b!964374 (contains!5430 (getCurrentListMap!3545 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28529 _keys!1686) i!803))))

(declare-fun lt!430894 () Unit!32152)

(declare-fun lemmaInListMapFromThenInFromSmaller!36 (array!59320 array!59322 (_ BitVec 32) (_ BitVec 32) V!33849 V!33849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32152)

(assert (=> b!964374 (= lt!430894 (lemmaInListMapFromThenInFromSmaller!36 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34468 () Bool)

(declare-fun tp!65661 () Bool)

(declare-fun e!543644 () Bool)

(assert (=> mapNonEmpty!34468 (= mapRes!34468 (and tp!65661 e!543644))))

(declare-fun mapKey!34468 () (_ BitVec 32))

(declare-fun mapValue!34468 () ValueCell!10343)

(declare-fun mapRest!34468 () (Array (_ BitVec 32) ValueCell!10343))

(assert (=> mapNonEmpty!34468 (= (arr!28530 _values!1400) (store mapRest!34468 mapKey!34468 mapValue!34468))))

(declare-fun b!964375 () Bool)

(assert (=> b!964375 (= e!543644 tp_is_empty!21649)))

(declare-fun b!964376 () Bool)

(declare-fun res!645548 () Bool)

(assert (=> b!964376 (=> (not res!645548) (not e!543646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59320 (_ BitVec 32)) Bool)

(assert (=> b!964376 (= res!645548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82696 res!645554) b!964370))

(assert (= (and b!964370 res!645551) b!964376))

(assert (= (and b!964376 res!645548) b!964366))

(assert (= (and b!964366 res!645552) b!964372))

(assert (= (and b!964372 res!645549) b!964365))

(assert (= (and b!964365 res!645553) b!964368))

(assert (= (and b!964368 res!645547) b!964373))

(assert (= (and b!964373 res!645546) b!964369))

(assert (= (and b!964369 (not res!645550)) b!964374))

(assert (= (and b!964371 condMapEmpty!34468) mapIsEmpty!34468))

(assert (= (and b!964371 (not condMapEmpty!34468)) mapNonEmpty!34468))

(get-info :version)

(assert (= (and mapNonEmpty!34468 ((_ is ValueCellFull!10343) mapValue!34468)) b!964375))

(assert (= (and b!964371 ((_ is ValueCellFull!10343) mapDefault!34468)) b!964367))

(assert (= start!82696 b!964371))

(declare-fun m!893083 () Bool)

(assert (=> b!964369 m!893083))

(declare-fun m!893085 () Bool)

(assert (=> b!964369 m!893085))

(assert (=> b!964369 m!893083))

(assert (=> b!964369 m!893085))

(declare-fun m!893087 () Bool)

(assert (=> b!964369 m!893087))

(declare-fun m!893089 () Bool)

(assert (=> b!964369 m!893089))

(declare-fun m!893091 () Bool)

(assert (=> start!82696 m!893091))

(declare-fun m!893093 () Bool)

(assert (=> start!82696 m!893093))

(declare-fun m!893095 () Bool)

(assert (=> start!82696 m!893095))

(declare-fun m!893097 () Bool)

(assert (=> b!964368 m!893097))

(assert (=> b!964368 m!893085))

(assert (=> b!964368 m!893097))

(assert (=> b!964368 m!893085))

(declare-fun m!893099 () Bool)

(assert (=> b!964368 m!893099))

(declare-fun m!893101 () Bool)

(assert (=> b!964374 m!893101))

(assert (=> b!964374 m!893085))

(assert (=> b!964374 m!893101))

(assert (=> b!964374 m!893085))

(declare-fun m!893103 () Bool)

(assert (=> b!964374 m!893103))

(declare-fun m!893105 () Bool)

(assert (=> b!964374 m!893105))

(declare-fun m!893107 () Bool)

(assert (=> mapNonEmpty!34468 m!893107))

(declare-fun m!893109 () Bool)

(assert (=> b!964366 m!893109))

(assert (=> b!964365 m!893085))

(assert (=> b!964365 m!893085))

(declare-fun m!893111 () Bool)

(assert (=> b!964365 m!893111))

(declare-fun m!893113 () Bool)

(assert (=> b!964376 m!893113))

(check-sat (not b_next!18847) (not b!964369) (not start!82696) (not mapNonEmpty!34468) (not b!964366) b_and!30309 (not b!964365) tp_is_empty!21649 (not b!964374) (not b!964376) (not b!964368))
(check-sat b_and!30309 (not b_next!18847))
