; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82728 () Bool)

(assert start!82728)

(declare-fun b_free!18861 () Bool)

(declare-fun b_next!18861 () Bool)

(assert (=> start!82728 (= b_free!18861 (not b_next!18861))))

(declare-fun tp!65702 () Bool)

(declare-fun b_and!30349 () Bool)

(assert (=> start!82728 (= tp!65702 b_and!30349)))

(declare-fun b!964856 () Bool)

(declare-fun res!645852 () Bool)

(declare-fun e!543921 () Bool)

(assert (=> b!964856 (=> (not res!645852) (not e!543921))))

(declare-datatypes ((array!59413 0))(
  ( (array!59414 (arr!28575 (Array (_ BitVec 32) (_ BitVec 64))) (size!29054 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59413)

(declare-datatypes ((List!19834 0))(
  ( (Nil!19831) (Cons!19830 (h!20992 (_ BitVec 64)) (t!28197 List!19834)) )
))
(declare-fun arrayNoDuplicates!0 (array!59413 (_ BitVec 32) List!19834) Bool)

(assert (=> b!964856 (= res!645852 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19831))))

(declare-fun b!964857 () Bool)

(declare-fun res!645851 () Bool)

(assert (=> b!964857 (=> (not res!645851) (not e!543921))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59413 (_ BitVec 32)) Bool)

(assert (=> b!964857 (= res!645851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34489 () Bool)

(declare-fun mapRes!34489 () Bool)

(assert (=> mapIsEmpty!34489 mapRes!34489))

(declare-fun b!964858 () Bool)

(declare-fun e!543923 () Bool)

(declare-fun tp_is_empty!21663 () Bool)

(assert (=> b!964858 (= e!543923 tp_is_empty!21663)))

(declare-fun b!964859 () Bool)

(declare-fun e!543920 () Bool)

(assert (=> b!964859 (= e!543920 (and e!543923 mapRes!34489))))

(declare-fun condMapEmpty!34489 () Bool)

(declare-datatypes ((V!33867 0))(
  ( (V!33868 (val!10882 Int)) )
))
(declare-datatypes ((ValueCell!10350 0))(
  ( (ValueCellFull!10350 (v!13440 V!33867)) (EmptyCell!10350) )
))
(declare-datatypes ((array!59415 0))(
  ( (array!59416 (arr!28576 (Array (_ BitVec 32) ValueCell!10350)) (size!29055 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59415)

(declare-fun mapDefault!34489 () ValueCell!10350)

(assert (=> b!964859 (= condMapEmpty!34489 (= (arr!28576 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10350)) mapDefault!34489)))))

(declare-fun mapNonEmpty!34489 () Bool)

(declare-fun tp!65703 () Bool)

(declare-fun e!543919 () Bool)

(assert (=> mapNonEmpty!34489 (= mapRes!34489 (and tp!65703 e!543919))))

(declare-fun mapKey!34489 () (_ BitVec 32))

(declare-fun mapRest!34489 () (Array (_ BitVec 32) ValueCell!10350))

(declare-fun mapValue!34489 () ValueCell!10350)

(assert (=> mapNonEmpty!34489 (= (arr!28576 _values!1400) (store mapRest!34489 mapKey!34489 mapValue!34489))))

(declare-fun res!645847 () Bool)

(assert (=> start!82728 (=> (not res!645847) (not e!543921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82728 (= res!645847 (validMask!0 mask!2110))))

(assert (=> start!82728 e!543921))

(assert (=> start!82728 true))

(declare-fun array_inv!22125 (array!59415) Bool)

(assert (=> start!82728 (and (array_inv!22125 _values!1400) e!543920)))

(declare-fun array_inv!22126 (array!59413) Bool)

(assert (=> start!82728 (array_inv!22126 _keys!1686)))

(assert (=> start!82728 tp!65702))

(assert (=> start!82728 tp_is_empty!21663))

(declare-fun b!964860 () Bool)

(declare-fun res!645846 () Bool)

(assert (=> b!964860 (=> (not res!645846) (not e!543921))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33867)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33867)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((tuple2!13990 0))(
  ( (tuple2!13991 (_1!7006 (_ BitVec 64)) (_2!7006 V!33867)) )
))
(declare-datatypes ((List!19835 0))(
  ( (Nil!19832) (Cons!19831 (h!20993 tuple2!13990) (t!28198 List!19835)) )
))
(declare-datatypes ((ListLongMap!12687 0))(
  ( (ListLongMap!12688 (toList!6359 List!19835)) )
))
(declare-fun contains!5462 (ListLongMap!12687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3592 (array!59413 array!59415 (_ BitVec 32) (_ BitVec 32) V!33867 V!33867 (_ BitVec 32) Int) ListLongMap!12687)

(assert (=> b!964860 (= res!645846 (contains!5462 (getCurrentListMap!3592 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28575 _keys!1686) i!803)))))

(declare-fun b!964861 () Bool)

(declare-fun res!645853 () Bool)

(assert (=> b!964861 (=> (not res!645853) (not e!543921))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964861 (= res!645853 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964862 () Bool)

(declare-fun res!645849 () Bool)

(assert (=> b!964862 (=> (not res!645849) (not e!543921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964862 (= res!645849 (validKeyInArray!0 (select (arr!28575 _keys!1686) i!803)))))

(declare-fun b!964863 () Bool)

(assert (=> b!964863 (= e!543919 tp_is_empty!21663)))

(declare-fun b!964864 () Bool)

(declare-fun e!543922 () Bool)

(assert (=> b!964864 (= e!543922 (bvsle newFrom!159 (size!29054 _keys!1686)))))

(assert (=> b!964864 (contains!5462 (getCurrentListMap!3592 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28575 _keys!1686) i!803))))

(declare-datatypes ((Unit!32299 0))(
  ( (Unit!32300) )
))
(declare-fun lt!431173 () Unit!32299)

(declare-fun lemmaInListMapFromThenInFromSmaller!38 (array!59413 array!59415 (_ BitVec 32) (_ BitVec 32) V!33867 V!33867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32299)

(assert (=> b!964864 (= lt!431173 (lemmaInListMapFromThenInFromSmaller!38 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964865 () Bool)

(assert (=> b!964865 (= e!543921 (not e!543922))))

(declare-fun res!645845 () Bool)

(assert (=> b!964865 (=> res!645845 e!543922)))

(assert (=> b!964865 (= res!645845 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29054 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964865 (contains!5462 (getCurrentListMap!3592 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28575 _keys!1686) i!803))))

(declare-fun lt!431172 () Unit!32299)

(declare-fun lemmaInListMapFromThenInFromMinusOne!44 (array!59413 array!59415 (_ BitVec 32) (_ BitVec 32) V!33867 V!33867 (_ BitVec 32) (_ BitVec 32) Int) Unit!32299)

(assert (=> b!964865 (= lt!431172 (lemmaInListMapFromThenInFromMinusOne!44 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964866 () Bool)

(declare-fun res!645850 () Bool)

(assert (=> b!964866 (=> (not res!645850) (not e!543921))))

(assert (=> b!964866 (= res!645850 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29054 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29054 _keys!1686))))))

(declare-fun b!964867 () Bool)

(declare-fun res!645848 () Bool)

(assert (=> b!964867 (=> (not res!645848) (not e!543921))))

(assert (=> b!964867 (= res!645848 (and (= (size!29055 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29054 _keys!1686) (size!29055 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82728 res!645847) b!964867))

(assert (= (and b!964867 res!645848) b!964857))

(assert (= (and b!964857 res!645851) b!964856))

(assert (= (and b!964856 res!645852) b!964866))

(assert (= (and b!964866 res!645850) b!964862))

(assert (= (and b!964862 res!645849) b!964860))

(assert (= (and b!964860 res!645846) b!964861))

(assert (= (and b!964861 res!645853) b!964865))

(assert (= (and b!964865 (not res!645845)) b!964864))

(assert (= (and b!964859 condMapEmpty!34489) mapIsEmpty!34489))

(assert (= (and b!964859 (not condMapEmpty!34489)) mapNonEmpty!34489))

(get-info :version)

(assert (= (and mapNonEmpty!34489 ((_ is ValueCellFull!10350) mapValue!34489)) b!964863))

(assert (= (and b!964859 ((_ is ValueCellFull!10350) mapDefault!34489)) b!964858))

(assert (= start!82728 b!964859))

(declare-fun m!894065 () Bool)

(assert (=> b!964856 m!894065))

(declare-fun m!894067 () Bool)

(assert (=> b!964862 m!894067))

(assert (=> b!964862 m!894067))

(declare-fun m!894069 () Bool)

(assert (=> b!964862 m!894069))

(declare-fun m!894071 () Bool)

(assert (=> start!82728 m!894071))

(declare-fun m!894073 () Bool)

(assert (=> start!82728 m!894073))

(declare-fun m!894075 () Bool)

(assert (=> start!82728 m!894075))

(declare-fun m!894077 () Bool)

(assert (=> mapNonEmpty!34489 m!894077))

(declare-fun m!894079 () Bool)

(assert (=> b!964865 m!894079))

(assert (=> b!964865 m!894067))

(assert (=> b!964865 m!894079))

(assert (=> b!964865 m!894067))

(declare-fun m!894081 () Bool)

(assert (=> b!964865 m!894081))

(declare-fun m!894083 () Bool)

(assert (=> b!964865 m!894083))

(declare-fun m!894085 () Bool)

(assert (=> b!964857 m!894085))

(declare-fun m!894087 () Bool)

(assert (=> b!964864 m!894087))

(assert (=> b!964864 m!894067))

(assert (=> b!964864 m!894087))

(assert (=> b!964864 m!894067))

(declare-fun m!894089 () Bool)

(assert (=> b!964864 m!894089))

(declare-fun m!894091 () Bool)

(assert (=> b!964864 m!894091))

(declare-fun m!894093 () Bool)

(assert (=> b!964860 m!894093))

(assert (=> b!964860 m!894067))

(assert (=> b!964860 m!894093))

(assert (=> b!964860 m!894067))

(declare-fun m!894095 () Bool)

(assert (=> b!964860 m!894095))

(check-sat b_and!30349 (not b!964862) (not b!964864) (not b!964865) (not b!964856) (not b_next!18861) (not mapNonEmpty!34489) (not start!82728) (not b!964860) tp_is_empty!21663 (not b!964857))
(check-sat b_and!30349 (not b_next!18861))
