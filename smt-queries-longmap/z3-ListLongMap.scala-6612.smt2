; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83538 () Bool)

(assert start!83538)

(declare-fun b_free!19543 () Bool)

(declare-fun b_next!19543 () Bool)

(assert (=> start!83538 (= b_free!19543 (not b_next!19543))))

(declare-fun tp!67917 () Bool)

(declare-fun b_and!31155 () Bool)

(assert (=> start!83538 (= tp!67917 b_and!31155)))

(declare-fun b!976159 () Bool)

(declare-fun res!653536 () Bool)

(declare-fun e!550113 () Bool)

(assert (=> b!976159 (=> (not res!653536) (not e!550113))))

(declare-datatypes ((array!60854 0))(
  ( (array!60855 (arr!29291 (Array (_ BitVec 32) (_ BitVec 64))) (size!29772 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60854)

(declare-datatypes ((List!20372 0))(
  ( (Nil!20369) (Cons!20368 (h!21530 (_ BitVec 64)) (t!28876 List!20372)) )
))
(declare-fun arrayNoDuplicates!0 (array!60854 (_ BitVec 32) List!20372) Bool)

(assert (=> b!976159 (= res!653536 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20369))))

(declare-fun b!976160 () Bool)

(declare-fun e!550111 () Bool)

(assert (=> b!976160 (= e!550113 e!550111)))

(declare-fun res!653542 () Bool)

(assert (=> b!976160 (=> (not res!653542) (not e!550111))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976160 (= res!653542 (not (validKeyInArray!0 (select (arr!29291 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34913 0))(
  ( (V!34914 (val!11274 Int)) )
))
(declare-datatypes ((ValueCell!10742 0))(
  ( (ValueCellFull!10742 (v!13832 V!34913)) (EmptyCell!10742) )
))
(declare-datatypes ((array!60856 0))(
  ( (array!60857 (arr!29292 (Array (_ BitVec 32) ValueCell!10742)) (size!29773 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60856)

(declare-fun zeroValue!1367 () V!34913)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34913)

(declare-datatypes ((tuple2!14566 0))(
  ( (tuple2!14567 (_1!7294 (_ BitVec 64)) (_2!7294 V!34913)) )
))
(declare-datatypes ((List!20373 0))(
  ( (Nil!20370) (Cons!20369 (h!21531 tuple2!14566) (t!28877 List!20373)) )
))
(declare-datatypes ((ListLongMap!13253 0))(
  ( (ListLongMap!13254 (toList!6642 List!20373)) )
))
(declare-fun lt!432894 () ListLongMap!13253)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3804 (array!60854 array!60856 (_ BitVec 32) (_ BitVec 32) V!34913 V!34913 (_ BitVec 32) Int) ListLongMap!13253)

(assert (=> b!976160 (= lt!432894 (getCurrentListMap!3804 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653538 () Bool)

(assert (=> start!83538 (=> (not res!653538) (not e!550113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83538 (= res!653538 (validMask!0 mask!2147))))

(assert (=> start!83538 e!550113))

(assert (=> start!83538 true))

(declare-fun e!550116 () Bool)

(declare-fun array_inv!22689 (array!60856) Bool)

(assert (=> start!83538 (and (array_inv!22689 _values!1425) e!550116)))

(declare-fun tp_is_empty!22447 () Bool)

(assert (=> start!83538 tp_is_empty!22447))

(assert (=> start!83538 tp!67917))

(declare-fun array_inv!22690 (array!60854) Bool)

(assert (=> start!83538 (array_inv!22690 _keys!1717)))

(declare-fun b!976161 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976161 (= e!550111 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-fun b!976162 () Bool)

(declare-fun res!653541 () Bool)

(assert (=> b!976162 (=> (not res!653541) (not e!550113))))

(declare-fun contains!5669 (ListLongMap!13253 (_ BitVec 64)) Bool)

(assert (=> b!976162 (= res!653541 (contains!5669 (getCurrentListMap!3804 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29291 _keys!1717) i!822)))))

(declare-fun b!976163 () Bool)

(declare-fun e!550114 () Bool)

(assert (=> b!976163 (= e!550114 tp_is_empty!22447)))

(declare-fun b!976164 () Bool)

(declare-fun res!653537 () Bool)

(assert (=> b!976164 (=> (not res!653537) (not e!550113))))

(assert (=> b!976164 (= res!653537 (and (= (size!29773 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29772 _keys!1717) (size!29773 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976165 () Bool)

(declare-fun e!550115 () Bool)

(declare-fun mapRes!35680 () Bool)

(assert (=> b!976165 (= e!550116 (and e!550115 mapRes!35680))))

(declare-fun condMapEmpty!35680 () Bool)

(declare-fun mapDefault!35680 () ValueCell!10742)

(assert (=> b!976165 (= condMapEmpty!35680 (= (arr!29292 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10742)) mapDefault!35680)))))

(declare-fun b!976166 () Bool)

(assert (=> b!976166 (= e!550115 tp_is_empty!22447)))

(declare-fun b!976167 () Bool)

(declare-fun res!653539 () Bool)

(assert (=> b!976167 (=> (not res!653539) (not e!550113))))

(assert (=> b!976167 (= res!653539 (validKeyInArray!0 (select (arr!29291 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35680 () Bool)

(declare-fun tp!67918 () Bool)

(assert (=> mapNonEmpty!35680 (= mapRes!35680 (and tp!67918 e!550114))))

(declare-fun mapValue!35680 () ValueCell!10742)

(declare-fun mapKey!35680 () (_ BitVec 32))

(declare-fun mapRest!35680 () (Array (_ BitVec 32) ValueCell!10742))

(assert (=> mapNonEmpty!35680 (= (arr!29292 _values!1425) (store mapRest!35680 mapKey!35680 mapValue!35680))))

(declare-fun mapIsEmpty!35680 () Bool)

(assert (=> mapIsEmpty!35680 mapRes!35680))

(declare-fun b!976168 () Bool)

(declare-fun res!653540 () Bool)

(assert (=> b!976168 (=> (not res!653540) (not e!550113))))

(assert (=> b!976168 (= res!653540 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29772 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29772 _keys!1717))))))

(declare-fun b!976169 () Bool)

(declare-fun res!653535 () Bool)

(assert (=> b!976169 (=> (not res!653535) (not e!550113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60854 (_ BitVec 32)) Bool)

(assert (=> b!976169 (= res!653535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83538 res!653538) b!976164))

(assert (= (and b!976164 res!653537) b!976169))

(assert (= (and b!976169 res!653535) b!976159))

(assert (= (and b!976159 res!653536) b!976168))

(assert (= (and b!976168 res!653540) b!976167))

(assert (= (and b!976167 res!653539) b!976162))

(assert (= (and b!976162 res!653541) b!976160))

(assert (= (and b!976160 res!653542) b!976161))

(assert (= (and b!976165 condMapEmpty!35680) mapIsEmpty!35680))

(assert (= (and b!976165 (not condMapEmpty!35680)) mapNonEmpty!35680))

(get-info :version)

(assert (= (and mapNonEmpty!35680 ((_ is ValueCellFull!10742) mapValue!35680)) b!976163))

(assert (= (and b!976165 ((_ is ValueCellFull!10742) mapDefault!35680)) b!976166))

(assert (= start!83538 b!976165))

(declare-fun m!902897 () Bool)

(assert (=> mapNonEmpty!35680 m!902897))

(declare-fun m!902899 () Bool)

(assert (=> b!976167 m!902899))

(assert (=> b!976167 m!902899))

(declare-fun m!902901 () Bool)

(assert (=> b!976167 m!902901))

(declare-fun m!902903 () Bool)

(assert (=> start!83538 m!902903))

(declare-fun m!902905 () Bool)

(assert (=> start!83538 m!902905))

(declare-fun m!902907 () Bool)

(assert (=> start!83538 m!902907))

(declare-fun m!902909 () Bool)

(assert (=> b!976159 m!902909))

(declare-fun m!902911 () Bool)

(assert (=> b!976169 m!902911))

(declare-fun m!902913 () Bool)

(assert (=> b!976160 m!902913))

(assert (=> b!976160 m!902913))

(declare-fun m!902915 () Bool)

(assert (=> b!976160 m!902915))

(declare-fun m!902917 () Bool)

(assert (=> b!976160 m!902917))

(declare-fun m!902919 () Bool)

(assert (=> b!976162 m!902919))

(assert (=> b!976162 m!902899))

(assert (=> b!976162 m!902919))

(assert (=> b!976162 m!902899))

(declare-fun m!902921 () Bool)

(assert (=> b!976162 m!902921))

(check-sat (not b!976167) (not b!976160) b_and!31155 (not b!976159) (not b!976169) (not b_next!19543) (not mapNonEmpty!35680) tp_is_empty!22447 (not start!83538) (not b!976162))
(check-sat b_and!31155 (not b_next!19543))
