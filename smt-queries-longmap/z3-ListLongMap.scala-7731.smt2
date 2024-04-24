; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97350 () Bool)

(assert start!97350)

(declare-fun mapIsEmpty!42856 () Bool)

(declare-fun mapRes!42856 () Bool)

(assert (=> mapIsEmpty!42856 mapRes!42856))

(declare-fun b!1105851 () Bool)

(declare-fun res!737437 () Bool)

(declare-fun e!631319 () Bool)

(assert (=> b!1105851 (=> (not res!737437) (not e!631319))))

(declare-datatypes ((array!71679 0))(
  ( (array!71680 (arr!34487 (Array (_ BitVec 32) (_ BitVec 64))) (size!35024 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71679)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105851 (= res!737437 (= (select (arr!34487 _keys!1208) i!673) k0!934))))

(declare-fun b!1105852 () Bool)

(declare-fun e!631321 () Bool)

(declare-fun tp_is_empty!27361 () Bool)

(assert (=> b!1105852 (= e!631321 tp_is_empty!27361)))

(declare-fun b!1105853 () Bool)

(declare-fun res!737436 () Bool)

(assert (=> b!1105853 (=> (not res!737436) (not e!631319))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105853 (= res!737436 (validMask!0 mask!1564))))

(declare-fun b!1105854 () Bool)

(declare-fun res!737433 () Bool)

(assert (=> b!1105854 (=> (not res!737433) (not e!631319))))

(declare-datatypes ((List!24079 0))(
  ( (Nil!24076) (Cons!24075 (h!25293 (_ BitVec 64)) (t!34336 List!24079)) )
))
(declare-fun arrayNoDuplicates!0 (array!71679 (_ BitVec 32) List!24079) Bool)

(assert (=> b!1105854 (= res!737433 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24076))))

(declare-fun b!1105855 () Bool)

(declare-fun res!737430 () Bool)

(assert (=> b!1105855 (=> (not res!737430) (not e!631319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105855 (= res!737430 (validKeyInArray!0 k0!934))))

(declare-fun b!1105857 () Bool)

(declare-fun res!737435 () Bool)

(assert (=> b!1105857 (=> (not res!737435) (not e!631319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71679 (_ BitVec 32)) Bool)

(assert (=> b!1105857 (= res!737435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105858 () Bool)

(declare-fun e!631318 () Bool)

(assert (=> b!1105858 (= e!631318 (and e!631321 mapRes!42856))))

(declare-fun condMapEmpty!42856 () Bool)

(declare-datatypes ((V!41609 0))(
  ( (V!41610 (val!13737 Int)) )
))
(declare-datatypes ((ValueCell!12971 0))(
  ( (ValueCellFull!12971 (v!16366 V!41609)) (EmptyCell!12971) )
))
(declare-datatypes ((array!71681 0))(
  ( (array!71682 (arr!34488 (Array (_ BitVec 32) ValueCell!12971)) (size!35025 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71681)

(declare-fun mapDefault!42856 () ValueCell!12971)

(assert (=> b!1105858 (= condMapEmpty!42856 (= (arr!34488 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12971)) mapDefault!42856)))))

(declare-fun b!1105859 () Bool)

(declare-fun e!631317 () Bool)

(assert (=> b!1105859 (= e!631317 false)))

(declare-fun lt!495670 () Bool)

(declare-fun lt!495669 () array!71679)

(assert (=> b!1105859 (= lt!495670 (arrayNoDuplicates!0 lt!495669 #b00000000000000000000000000000000 Nil!24076))))

(declare-fun b!1105860 () Bool)

(declare-fun e!631322 () Bool)

(assert (=> b!1105860 (= e!631322 tp_is_empty!27361)))

(declare-fun mapNonEmpty!42856 () Bool)

(declare-fun tp!81776 () Bool)

(assert (=> mapNonEmpty!42856 (= mapRes!42856 (and tp!81776 e!631322))))

(declare-fun mapRest!42856 () (Array (_ BitVec 32) ValueCell!12971))

(declare-fun mapValue!42856 () ValueCell!12971)

(declare-fun mapKey!42856 () (_ BitVec 32))

(assert (=> mapNonEmpty!42856 (= (arr!34488 _values!996) (store mapRest!42856 mapKey!42856 mapValue!42856))))

(declare-fun b!1105861 () Bool)

(assert (=> b!1105861 (= e!631319 e!631317)))

(declare-fun res!737431 () Bool)

(assert (=> b!1105861 (=> (not res!737431) (not e!631317))))

(assert (=> b!1105861 (= res!737431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495669 mask!1564))))

(assert (=> b!1105861 (= lt!495669 (array!71680 (store (arr!34487 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35024 _keys!1208)))))

(declare-fun b!1105862 () Bool)

(declare-fun res!737438 () Bool)

(assert (=> b!1105862 (=> (not res!737438) (not e!631319))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105862 (= res!737438 (and (= (size!35025 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35024 _keys!1208) (size!35025 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105856 () Bool)

(declare-fun res!737432 () Bool)

(assert (=> b!1105856 (=> (not res!737432) (not e!631319))))

(assert (=> b!1105856 (= res!737432 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35024 _keys!1208))))))

(declare-fun res!737434 () Bool)

(assert (=> start!97350 (=> (not res!737434) (not e!631319))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97350 (= res!737434 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35024 _keys!1208))))))

(assert (=> start!97350 e!631319))

(declare-fun array_inv!26586 (array!71679) Bool)

(assert (=> start!97350 (array_inv!26586 _keys!1208)))

(assert (=> start!97350 true))

(declare-fun array_inv!26587 (array!71681) Bool)

(assert (=> start!97350 (and (array_inv!26587 _values!996) e!631318)))

(assert (= (and start!97350 res!737434) b!1105853))

(assert (= (and b!1105853 res!737436) b!1105862))

(assert (= (and b!1105862 res!737438) b!1105857))

(assert (= (and b!1105857 res!737435) b!1105854))

(assert (= (and b!1105854 res!737433) b!1105856))

(assert (= (and b!1105856 res!737432) b!1105855))

(assert (= (and b!1105855 res!737430) b!1105851))

(assert (= (and b!1105851 res!737437) b!1105861))

(assert (= (and b!1105861 res!737431) b!1105859))

(assert (= (and b!1105858 condMapEmpty!42856) mapIsEmpty!42856))

(assert (= (and b!1105858 (not condMapEmpty!42856)) mapNonEmpty!42856))

(get-info :version)

(assert (= (and mapNonEmpty!42856 ((_ is ValueCellFull!12971) mapValue!42856)) b!1105860))

(assert (= (and b!1105858 ((_ is ValueCellFull!12971) mapDefault!42856)) b!1105852))

(assert (= start!97350 b!1105858))

(declare-fun m!1025911 () Bool)

(assert (=> b!1105861 m!1025911))

(declare-fun m!1025913 () Bool)

(assert (=> b!1105861 m!1025913))

(declare-fun m!1025915 () Bool)

(assert (=> mapNonEmpty!42856 m!1025915))

(declare-fun m!1025917 () Bool)

(assert (=> b!1105859 m!1025917))

(declare-fun m!1025919 () Bool)

(assert (=> b!1105855 m!1025919))

(declare-fun m!1025921 () Bool)

(assert (=> b!1105853 m!1025921))

(declare-fun m!1025923 () Bool)

(assert (=> b!1105851 m!1025923))

(declare-fun m!1025925 () Bool)

(assert (=> b!1105854 m!1025925))

(declare-fun m!1025927 () Bool)

(assert (=> start!97350 m!1025927))

(declare-fun m!1025929 () Bool)

(assert (=> start!97350 m!1025929))

(declare-fun m!1025931 () Bool)

(assert (=> b!1105857 m!1025931))

(check-sat (not mapNonEmpty!42856) (not b!1105854) (not b!1105853) (not b!1105857) (not start!97350) (not b!1105859) (not b!1105855) (not b!1105861) tp_is_empty!27361)
(check-sat)
