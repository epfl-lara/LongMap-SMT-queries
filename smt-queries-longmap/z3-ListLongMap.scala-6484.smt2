; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82726 () Bool)

(assert start!82726)

(declare-fun b_free!18877 () Bool)

(declare-fun b_next!18877 () Bool)

(assert (=> start!82726 (= b_free!18877 (not b_next!18877))))

(declare-fun tp!65751 () Bool)

(declare-fun b_and!30339 () Bool)

(assert (=> start!82726 (= tp!65751 b_and!30339)))

(declare-fun b!964845 () Bool)

(declare-fun res!645896 () Bool)

(declare-fun e!543898 () Bool)

(assert (=> b!964845 (=> (not res!645896) (not e!543898))))

(declare-datatypes ((array!59380 0))(
  ( (array!59381 (arr!28559 (Array (_ BitVec 32) (_ BitVec 64))) (size!29040 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59380)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964845 (= res!645896 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29040 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29040 _keys!1686))))))

(declare-fun b!964846 () Bool)

(declare-fun e!543895 () Bool)

(declare-fun tp_is_empty!21679 () Bool)

(assert (=> b!964846 (= e!543895 tp_is_empty!21679)))

(declare-fun mapIsEmpty!34513 () Bool)

(declare-fun mapRes!34513 () Bool)

(assert (=> mapIsEmpty!34513 mapRes!34513))

(declare-fun b!964847 () Bool)

(declare-fun res!645894 () Bool)

(assert (=> b!964847 (=> (not res!645894) (not e!543898))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33889 0))(
  ( (V!33890 (val!10890 Int)) )
))
(declare-datatypes ((ValueCell!10358 0))(
  ( (ValueCellFull!10358 (v!13447 V!33889)) (EmptyCell!10358) )
))
(declare-datatypes ((array!59382 0))(
  ( (array!59383 (arr!28560 (Array (_ BitVec 32) ValueCell!10358)) (size!29041 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59382)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964847 (= res!645894 (and (= (size!29041 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29040 _keys!1686) (size!29041 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964848 () Bool)

(assert (=> b!964848 (= e!543898 false)))

(declare-fun lt!430964 () Bool)

(declare-fun minValue!1342 () V!33889)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33889)

(declare-datatypes ((tuple2!14072 0))(
  ( (tuple2!14073 (_1!7047 (_ BitVec 64)) (_2!7047 V!33889)) )
))
(declare-datatypes ((List!19878 0))(
  ( (Nil!19875) (Cons!19874 (h!21036 tuple2!14072) (t!28232 List!19878)) )
))
(declare-datatypes ((ListLongMap!12759 0))(
  ( (ListLongMap!12760 (toList!6395 List!19878)) )
))
(declare-fun contains!5442 (ListLongMap!12759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3557 (array!59380 array!59382 (_ BitVec 32) (_ BitVec 32) V!33889 V!33889 (_ BitVec 32) Int) ListLongMap!12759)

(assert (=> b!964848 (= lt!430964 (contains!5442 (getCurrentListMap!3557 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28559 _keys!1686) i!803)))))

(declare-fun b!964849 () Bool)

(declare-fun e!543896 () Bool)

(assert (=> b!964849 (= e!543896 tp_is_empty!21679)))

(declare-fun res!645891 () Bool)

(assert (=> start!82726 (=> (not res!645891) (not e!543898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82726 (= res!645891 (validMask!0 mask!2110))))

(assert (=> start!82726 e!543898))

(assert (=> start!82726 true))

(declare-fun e!543894 () Bool)

(declare-fun array_inv!22177 (array!59382) Bool)

(assert (=> start!82726 (and (array_inv!22177 _values!1400) e!543894)))

(declare-fun array_inv!22178 (array!59380) Bool)

(assert (=> start!82726 (array_inv!22178 _keys!1686)))

(assert (=> start!82726 tp!65751))

(assert (=> start!82726 tp_is_empty!21679))

(declare-fun b!964850 () Bool)

(declare-fun res!645895 () Bool)

(assert (=> b!964850 (=> (not res!645895) (not e!543898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59380 (_ BitVec 32)) Bool)

(assert (=> b!964850 (= res!645895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964851 () Bool)

(declare-fun res!645892 () Bool)

(assert (=> b!964851 (=> (not res!645892) (not e!543898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964851 (= res!645892 (validKeyInArray!0 (select (arr!28559 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34513 () Bool)

(declare-fun tp!65752 () Bool)

(assert (=> mapNonEmpty!34513 (= mapRes!34513 (and tp!65752 e!543896))))

(declare-fun mapKey!34513 () (_ BitVec 32))

(declare-fun mapValue!34513 () ValueCell!10358)

(declare-fun mapRest!34513 () (Array (_ BitVec 32) ValueCell!10358))

(assert (=> mapNonEmpty!34513 (= (arr!28560 _values!1400) (store mapRest!34513 mapKey!34513 mapValue!34513))))

(declare-fun b!964852 () Bool)

(declare-fun res!645893 () Bool)

(assert (=> b!964852 (=> (not res!645893) (not e!543898))))

(declare-datatypes ((List!19879 0))(
  ( (Nil!19876) (Cons!19875 (h!21037 (_ BitVec 64)) (t!28233 List!19879)) )
))
(declare-fun arrayNoDuplicates!0 (array!59380 (_ BitVec 32) List!19879) Bool)

(assert (=> b!964852 (= res!645893 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19876))))

(declare-fun b!964853 () Bool)

(assert (=> b!964853 (= e!543894 (and e!543895 mapRes!34513))))

(declare-fun condMapEmpty!34513 () Bool)

(declare-fun mapDefault!34513 () ValueCell!10358)

(assert (=> b!964853 (= condMapEmpty!34513 (= (arr!28560 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10358)) mapDefault!34513)))))

(assert (= (and start!82726 res!645891) b!964847))

(assert (= (and b!964847 res!645894) b!964850))

(assert (= (and b!964850 res!645895) b!964852))

(assert (= (and b!964852 res!645893) b!964845))

(assert (= (and b!964845 res!645896) b!964851))

(assert (= (and b!964851 res!645892) b!964848))

(assert (= (and b!964853 condMapEmpty!34513) mapIsEmpty!34513))

(assert (= (and b!964853 (not condMapEmpty!34513)) mapNonEmpty!34513))

(get-info :version)

(assert (= (and mapNonEmpty!34513 ((_ is ValueCellFull!10358) mapValue!34513)) b!964849))

(assert (= (and b!964853 ((_ is ValueCellFull!10358) mapDefault!34513)) b!964846))

(assert (= start!82726 b!964853))

(declare-fun m!893491 () Bool)

(assert (=> b!964852 m!893491))

(declare-fun m!893493 () Bool)

(assert (=> start!82726 m!893493))

(declare-fun m!893495 () Bool)

(assert (=> start!82726 m!893495))

(declare-fun m!893497 () Bool)

(assert (=> start!82726 m!893497))

(declare-fun m!893499 () Bool)

(assert (=> b!964848 m!893499))

(declare-fun m!893501 () Bool)

(assert (=> b!964848 m!893501))

(assert (=> b!964848 m!893499))

(assert (=> b!964848 m!893501))

(declare-fun m!893503 () Bool)

(assert (=> b!964848 m!893503))

(declare-fun m!893505 () Bool)

(assert (=> mapNonEmpty!34513 m!893505))

(assert (=> b!964851 m!893501))

(assert (=> b!964851 m!893501))

(declare-fun m!893507 () Bool)

(assert (=> b!964851 m!893507))

(declare-fun m!893509 () Bool)

(assert (=> b!964850 m!893509))

(check-sat (not b_next!18877) (not b!964852) (not b!964848) (not b!964850) (not mapNonEmpty!34513) b_and!30339 (not b!964851) tp_is_empty!21679 (not start!82726))
(check-sat b_and!30339 (not b_next!18877))
