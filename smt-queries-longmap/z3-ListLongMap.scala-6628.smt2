; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83908 () Bool)

(assert start!83908)

(declare-fun mapIsEmpty!35843 () Bool)

(declare-fun mapRes!35843 () Bool)

(assert (=> mapIsEmpty!35843 mapRes!35843))

(declare-fun b!978679 () Bool)

(declare-fun res!654699 () Bool)

(declare-fun e!551880 () Bool)

(assert (=> b!978679 (=> (not res!654699) (not e!551880))))

(declare-datatypes ((array!61140 0))(
  ( (array!61141 (arr!29423 (Array (_ BitVec 32) (_ BitVec 64))) (size!29903 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61140)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978679 (= res!654699 (validKeyInArray!0 (select (arr!29423 _keys!1544) from!1932)))))

(declare-fun b!978680 () Bool)

(declare-fun res!654695 () Bool)

(assert (=> b!978680 (=> (not res!654695) (not e!551880))))

(declare-datatypes ((List!20381 0))(
  ( (Nil!20378) (Cons!20377 (h!21545 (_ BitVec 64)) (t!28888 List!20381)) )
))
(declare-fun arrayNoDuplicates!0 (array!61140 (_ BitVec 32) List!20381) Bool)

(assert (=> b!978680 (= res!654695 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20378))))

(declare-fun res!654697 () Bool)

(assert (=> start!83908 (=> (not res!654697) (not e!551880))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83908 (= res!654697 (validMask!0 mask!1948))))

(assert (=> start!83908 e!551880))

(assert (=> start!83908 true))

(declare-datatypes ((V!35041 0))(
  ( (V!35042 (val!11322 Int)) )
))
(declare-datatypes ((ValueCell!10790 0))(
  ( (ValueCellFull!10790 (v!13881 V!35041)) (EmptyCell!10790) )
))
(declare-datatypes ((array!61142 0))(
  ( (array!61143 (arr!29424 (Array (_ BitVec 32) ValueCell!10790)) (size!29904 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61142)

(declare-fun e!551881 () Bool)

(declare-fun array_inv!22793 (array!61142) Bool)

(assert (=> start!83908 (and (array_inv!22793 _values!1278) e!551881)))

(declare-fun array_inv!22794 (array!61140) Bool)

(assert (=> start!83908 (array_inv!22794 _keys!1544)))

(declare-fun mapNonEmpty!35843 () Bool)

(declare-fun tp!68096 () Bool)

(declare-fun e!551882 () Bool)

(assert (=> mapNonEmpty!35843 (= mapRes!35843 (and tp!68096 e!551882))))

(declare-fun mapKey!35843 () (_ BitVec 32))

(declare-fun mapRest!35843 () (Array (_ BitVec 32) ValueCell!10790))

(declare-fun mapValue!35843 () ValueCell!10790)

(assert (=> mapNonEmpty!35843 (= (arr!29424 _values!1278) (store mapRest!35843 mapKey!35843 mapValue!35843))))

(declare-fun b!978681 () Bool)

(declare-fun res!654696 () Bool)

(assert (=> b!978681 (=> (not res!654696) (not e!551880))))

(assert (=> b!978681 (= res!654696 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29903 _keys!1544))))))

(declare-fun b!978682 () Bool)

(declare-fun res!654698 () Bool)

(assert (=> b!978682 (=> (not res!654698) (not e!551880))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978682 (= res!654698 (and (= (size!29904 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29903 _keys!1544) (size!29904 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978683 () Bool)

(declare-fun res!654700 () Bool)

(assert (=> b!978683 (=> (not res!654700) (not e!551880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61140 (_ BitVec 32)) Bool)

(assert (=> b!978683 (= res!654700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978684 () Bool)

(declare-fun tp_is_empty!22543 () Bool)

(assert (=> b!978684 (= e!551882 tp_is_empty!22543)))

(declare-fun b!978685 () Bool)

(assert (=> b!978685 (= e!551880 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!978686 () Bool)

(declare-fun e!551883 () Bool)

(assert (=> b!978686 (= e!551881 (and e!551883 mapRes!35843))))

(declare-fun condMapEmpty!35843 () Bool)

(declare-fun mapDefault!35843 () ValueCell!10790)

(assert (=> b!978686 (= condMapEmpty!35843 (= (arr!29424 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10790)) mapDefault!35843)))))

(declare-fun b!978687 () Bool)

(assert (=> b!978687 (= e!551883 tp_is_empty!22543)))

(assert (= (and start!83908 res!654697) b!978682))

(assert (= (and b!978682 res!654698) b!978683))

(assert (= (and b!978683 res!654700) b!978680))

(assert (= (and b!978680 res!654695) b!978681))

(assert (= (and b!978681 res!654696) b!978679))

(assert (= (and b!978679 res!654699) b!978685))

(assert (= (and b!978686 condMapEmpty!35843) mapIsEmpty!35843))

(assert (= (and b!978686 (not condMapEmpty!35843)) mapNonEmpty!35843))

(get-info :version)

(assert (= (and mapNonEmpty!35843 ((_ is ValueCellFull!10790) mapValue!35843)) b!978684))

(assert (= (and b!978686 ((_ is ValueCellFull!10790) mapDefault!35843)) b!978687))

(assert (= start!83908 b!978686))

(declare-fun m!906221 () Bool)

(assert (=> mapNonEmpty!35843 m!906221))

(declare-fun m!906223 () Bool)

(assert (=> b!978680 m!906223))

(declare-fun m!906225 () Bool)

(assert (=> start!83908 m!906225))

(declare-fun m!906227 () Bool)

(assert (=> start!83908 m!906227))

(declare-fun m!906229 () Bool)

(assert (=> start!83908 m!906229))

(declare-fun m!906231 () Bool)

(assert (=> b!978683 m!906231))

(declare-fun m!906233 () Bool)

(assert (=> b!978679 m!906233))

(assert (=> b!978679 m!906233))

(declare-fun m!906235 () Bool)

(assert (=> b!978679 m!906235))

(check-sat (not mapNonEmpty!35843) (not b!978683) (not start!83908) tp_is_empty!22543 (not b!978680) (not b!978679))
(check-sat)
