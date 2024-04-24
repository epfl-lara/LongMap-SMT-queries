; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82762 () Bool)

(assert start!82762)

(declare-fun b_free!18727 () Bool)

(declare-fun b_next!18727 () Bool)

(assert (=> start!82762 (= b_free!18727 (not b_next!18727))))

(declare-fun tp!65302 () Bool)

(declare-fun b_and!30225 () Bool)

(assert (=> start!82762 (= tp!65302 b_and!30225)))

(declare-fun b!963503 () Bool)

(declare-fun res!644541 () Bool)

(declare-fun e!543419 () Bool)

(assert (=> b!963503 (=> (not res!644541) (not e!543419))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33689 0))(
  ( (V!33690 (val!10815 Int)) )
))
(declare-datatypes ((ValueCell!10283 0))(
  ( (ValueCellFull!10283 (v!13370 V!33689)) (EmptyCell!10283) )
))
(declare-datatypes ((array!59172 0))(
  ( (array!59173 (arr!28450 (Array (_ BitVec 32) ValueCell!10283)) (size!28930 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59172)

(declare-datatypes ((array!59174 0))(
  ( (array!59175 (arr!28451 (Array (_ BitVec 32) (_ BitVec 64))) (size!28931 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59174)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963503 (= res!644541 (and (= (size!28930 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28931 _keys!1686) (size!28930 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34288 () Bool)

(declare-fun mapRes!34288 () Bool)

(declare-fun tp!65301 () Bool)

(declare-fun e!543421 () Bool)

(assert (=> mapNonEmpty!34288 (= mapRes!34288 (and tp!65301 e!543421))))

(declare-fun mapKey!34288 () (_ BitVec 32))

(declare-fun mapValue!34288 () ValueCell!10283)

(declare-fun mapRest!34288 () (Array (_ BitVec 32) ValueCell!10283))

(assert (=> mapNonEmpty!34288 (= (arr!28450 _values!1400) (store mapRest!34288 mapKey!34288 mapValue!34288))))

(declare-fun mapIsEmpty!34288 () Bool)

(assert (=> mapIsEmpty!34288 mapRes!34288))

(declare-fun b!963504 () Bool)

(assert (=> b!963504 (= e!543419 false)))

(declare-fun minValue!1342 () V!33689)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431255 () Bool)

(declare-fun zeroValue!1342 () V!33689)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13872 0))(
  ( (tuple2!13873 (_1!6947 (_ BitVec 64)) (_2!6947 V!33689)) )
))
(declare-datatypes ((List!19723 0))(
  ( (Nil!19720) (Cons!19719 (h!20887 tuple2!13872) (t!28078 List!19723)) )
))
(declare-datatypes ((ListLongMap!12571 0))(
  ( (ListLongMap!12572 (toList!6301 List!19723)) )
))
(declare-fun contains!5416 (ListLongMap!12571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3534 (array!59174 array!59172 (_ BitVec 32) (_ BitVec 32) V!33689 V!33689 (_ BitVec 32) Int) ListLongMap!12571)

(assert (=> b!963504 (= lt!431255 (contains!5416 (getCurrentListMap!3534 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28451 _keys!1686) i!803)))))

(declare-fun b!963505 () Bool)

(declare-fun e!543418 () Bool)

(declare-fun e!543420 () Bool)

(assert (=> b!963505 (= e!543418 (and e!543420 mapRes!34288))))

(declare-fun condMapEmpty!34288 () Bool)

(declare-fun mapDefault!34288 () ValueCell!10283)

(assert (=> b!963505 (= condMapEmpty!34288 (= (arr!28450 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10283)) mapDefault!34288)))))

(declare-fun b!963506 () Bool)

(declare-fun res!644540 () Bool)

(assert (=> b!963506 (=> (not res!644540) (not e!543419))))

(declare-datatypes ((List!19724 0))(
  ( (Nil!19721) (Cons!19720 (h!20888 (_ BitVec 64)) (t!28079 List!19724)) )
))
(declare-fun arrayNoDuplicates!0 (array!59174 (_ BitVec 32) List!19724) Bool)

(assert (=> b!963506 (= res!644540 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19721))))

(declare-fun b!963507 () Bool)

(declare-fun tp_is_empty!21529 () Bool)

(assert (=> b!963507 (= e!543420 tp_is_empty!21529)))

(declare-fun b!963508 () Bool)

(declare-fun res!644539 () Bool)

(assert (=> b!963508 (=> (not res!644539) (not e!543419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59174 (_ BitVec 32)) Bool)

(assert (=> b!963508 (= res!644539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963509 () Bool)

(declare-fun res!644538 () Bool)

(assert (=> b!963509 (=> (not res!644538) (not e!543419))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963509 (= res!644538 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28931 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28931 _keys!1686))))))

(declare-fun res!644536 () Bool)

(assert (=> start!82762 (=> (not res!644536) (not e!543419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82762 (= res!644536 (validMask!0 mask!2110))))

(assert (=> start!82762 e!543419))

(assert (=> start!82762 true))

(declare-fun array_inv!22113 (array!59172) Bool)

(assert (=> start!82762 (and (array_inv!22113 _values!1400) e!543418)))

(declare-fun array_inv!22114 (array!59174) Bool)

(assert (=> start!82762 (array_inv!22114 _keys!1686)))

(assert (=> start!82762 tp!65302))

(assert (=> start!82762 tp_is_empty!21529))

(declare-fun b!963510 () Bool)

(assert (=> b!963510 (= e!543421 tp_is_empty!21529)))

(declare-fun b!963511 () Bool)

(declare-fun res!644537 () Bool)

(assert (=> b!963511 (=> (not res!644537) (not e!543419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963511 (= res!644537 (validKeyInArray!0 (select (arr!28451 _keys!1686) i!803)))))

(assert (= (and start!82762 res!644536) b!963503))

(assert (= (and b!963503 res!644541) b!963508))

(assert (= (and b!963508 res!644539) b!963506))

(assert (= (and b!963506 res!644540) b!963509))

(assert (= (and b!963509 res!644538) b!963511))

(assert (= (and b!963511 res!644537) b!963504))

(assert (= (and b!963505 condMapEmpty!34288) mapIsEmpty!34288))

(assert (= (and b!963505 (not condMapEmpty!34288)) mapNonEmpty!34288))

(get-info :version)

(assert (= (and mapNonEmpty!34288 ((_ is ValueCellFull!10283) mapValue!34288)) b!963510))

(assert (= (and b!963505 ((_ is ValueCellFull!10283) mapDefault!34288)) b!963507))

(assert (= start!82762 b!963505))

(declare-fun m!893503 () Bool)

(assert (=> start!82762 m!893503))

(declare-fun m!893505 () Bool)

(assert (=> start!82762 m!893505))

(declare-fun m!893507 () Bool)

(assert (=> start!82762 m!893507))

(declare-fun m!893509 () Bool)

(assert (=> b!963508 m!893509))

(declare-fun m!893511 () Bool)

(assert (=> b!963506 m!893511))

(declare-fun m!893513 () Bool)

(assert (=> mapNonEmpty!34288 m!893513))

(declare-fun m!893515 () Bool)

(assert (=> b!963511 m!893515))

(assert (=> b!963511 m!893515))

(declare-fun m!893517 () Bool)

(assert (=> b!963511 m!893517))

(declare-fun m!893519 () Bool)

(assert (=> b!963504 m!893519))

(assert (=> b!963504 m!893515))

(assert (=> b!963504 m!893519))

(assert (=> b!963504 m!893515))

(declare-fun m!893521 () Bool)

(assert (=> b!963504 m!893521))

(check-sat (not mapNonEmpty!34288) (not start!82762) tp_is_empty!21529 (not b!963511) (not b!963506) (not b!963504) (not b!963508) (not b_next!18727) b_and!30225)
(check-sat b_and!30225 (not b_next!18727))
