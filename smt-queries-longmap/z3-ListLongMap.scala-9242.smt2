; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110802 () Bool)

(assert start!110802)

(declare-fun b_free!29637 () Bool)

(declare-fun b_next!29637 () Bool)

(assert (=> start!110802 (= b_free!29637 (not b_next!29637))))

(declare-fun tp!104233 () Bool)

(declare-fun b_and!47845 () Bool)

(assert (=> start!110802 (= tp!104233 b_and!47845)))

(declare-fun b!1311431 () Bool)

(declare-fun e!748139 () Bool)

(declare-fun e!748140 () Bool)

(declare-fun mapRes!54679 () Bool)

(assert (=> b!1311431 (= e!748139 (and e!748140 mapRes!54679))))

(declare-fun condMapEmpty!54679 () Bool)

(declare-datatypes ((V!52259 0))(
  ( (V!52260 (val!17758 Int)) )
))
(declare-datatypes ((ValueCell!16785 0))(
  ( (ValueCellFull!16785 (v!20385 V!52259)) (EmptyCell!16785) )
))
(declare-datatypes ((array!87722 0))(
  ( (array!87723 (arr!42341 (Array (_ BitVec 32) ValueCell!16785)) (size!42891 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87722)

(declare-fun mapDefault!54679 () ValueCell!16785)

(assert (=> b!1311431 (= condMapEmpty!54679 (= (arr!42341 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16785)) mapDefault!54679)))))

(declare-fun b!1311432 () Bool)

(declare-fun e!748141 () Bool)

(declare-fun tp_is_empty!35367 () Bool)

(assert (=> b!1311432 (= e!748141 tp_is_empty!35367)))

(declare-fun mapIsEmpty!54679 () Bool)

(assert (=> mapIsEmpty!54679 mapRes!54679))

(declare-fun res!870610 () Bool)

(declare-fun e!748142 () Bool)

(assert (=> start!110802 (=> (not res!870610) (not e!748142))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110802 (= res!870610 (validMask!0 mask!2040))))

(assert (=> start!110802 e!748142))

(assert (=> start!110802 tp!104233))

(declare-datatypes ((array!87724 0))(
  ( (array!87725 (arr!42342 (Array (_ BitVec 32) (_ BitVec 64))) (size!42892 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87724)

(declare-fun array_inv!31995 (array!87724) Bool)

(assert (=> start!110802 (array_inv!31995 _keys!1628)))

(assert (=> start!110802 true))

(assert (=> start!110802 tp_is_empty!35367))

(declare-fun array_inv!31996 (array!87722) Bool)

(assert (=> start!110802 (and (array_inv!31996 _values!1354) e!748139)))

(declare-fun b!1311433 () Bool)

(declare-fun res!870609 () Bool)

(assert (=> b!1311433 (=> (not res!870609) (not e!748142))))

(declare-datatypes ((List!30026 0))(
  ( (Nil!30023) (Cons!30022 (h!31231 (_ BitVec 64)) (t!43632 List!30026)) )
))
(declare-fun arrayNoDuplicates!0 (array!87724 (_ BitVec 32) List!30026) Bool)

(assert (=> b!1311433 (= res!870609 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30023))))

(declare-fun b!1311434 () Bool)

(declare-fun res!870608 () Bool)

(assert (=> b!1311434 (=> (not res!870608) (not e!748142))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311434 (= res!870608 (and (= (size!42891 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42892 _keys!1628) (size!42891 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54679 () Bool)

(declare-fun tp!104232 () Bool)

(assert (=> mapNonEmpty!54679 (= mapRes!54679 (and tp!104232 e!748141))))

(declare-fun mapKey!54679 () (_ BitVec 32))

(declare-fun mapValue!54679 () ValueCell!16785)

(declare-fun mapRest!54679 () (Array (_ BitVec 32) ValueCell!16785))

(assert (=> mapNonEmpty!54679 (= (arr!42341 _values!1354) (store mapRest!54679 mapKey!54679 mapValue!54679))))

(declare-fun b!1311435 () Bool)

(declare-fun res!870612 () Bool)

(assert (=> b!1311435 (=> (not res!870612) (not e!748142))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311435 (= res!870612 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42892 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311436 () Bool)

(declare-fun res!870611 () Bool)

(assert (=> b!1311436 (=> (not res!870611) (not e!748142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87724 (_ BitVec 32)) Bool)

(assert (=> b!1311436 (= res!870611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311437 () Bool)

(assert (=> b!1311437 (= e!748140 tp_is_empty!35367)))

(declare-fun b!1311438 () Bool)

(assert (=> b!1311438 (= e!748142 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52259)

(declare-fun zeroValue!1296 () V!52259)

(declare-fun lt!585474 () Bool)

(declare-datatypes ((tuple2!22884 0))(
  ( (tuple2!22885 (_1!11453 (_ BitVec 64)) (_2!11453 V!52259)) )
))
(declare-datatypes ((List!30027 0))(
  ( (Nil!30024) (Cons!30023 (h!31232 tuple2!22884) (t!43633 List!30027)) )
))
(declare-datatypes ((ListLongMap!20541 0))(
  ( (ListLongMap!20542 (toList!10286 List!30027)) )
))
(declare-fun contains!8436 (ListLongMap!20541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5299 (array!87724 array!87722 (_ BitVec 32) (_ BitVec 32) V!52259 V!52259 (_ BitVec 32) Int) ListLongMap!20541)

(assert (=> b!1311438 (= lt!585474 (contains!8436 (getCurrentListMap!5299 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110802 res!870610) b!1311434))

(assert (= (and b!1311434 res!870608) b!1311436))

(assert (= (and b!1311436 res!870611) b!1311433))

(assert (= (and b!1311433 res!870609) b!1311435))

(assert (= (and b!1311435 res!870612) b!1311438))

(assert (= (and b!1311431 condMapEmpty!54679) mapIsEmpty!54679))

(assert (= (and b!1311431 (not condMapEmpty!54679)) mapNonEmpty!54679))

(get-info :version)

(assert (= (and mapNonEmpty!54679 ((_ is ValueCellFull!16785) mapValue!54679)) b!1311432))

(assert (= (and b!1311431 ((_ is ValueCellFull!16785) mapDefault!54679)) b!1311437))

(assert (= start!110802 b!1311431))

(declare-fun m!1200901 () Bool)

(assert (=> start!110802 m!1200901))

(declare-fun m!1200903 () Bool)

(assert (=> start!110802 m!1200903))

(declare-fun m!1200905 () Bool)

(assert (=> start!110802 m!1200905))

(declare-fun m!1200907 () Bool)

(assert (=> b!1311438 m!1200907))

(assert (=> b!1311438 m!1200907))

(declare-fun m!1200909 () Bool)

(assert (=> b!1311438 m!1200909))

(declare-fun m!1200911 () Bool)

(assert (=> b!1311433 m!1200911))

(declare-fun m!1200913 () Bool)

(assert (=> mapNonEmpty!54679 m!1200913))

(declare-fun m!1200915 () Bool)

(assert (=> b!1311436 m!1200915))

(check-sat tp_is_empty!35367 b_and!47845 (not mapNonEmpty!54679) (not b_next!29637) (not b!1311436) (not b!1311433) (not b!1311438) (not start!110802))
(check-sat b_and!47845 (not b_next!29637))
