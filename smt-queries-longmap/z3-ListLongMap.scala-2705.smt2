; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40034 () Bool)

(assert start!40034)

(declare-fun b_free!10315 () Bool)

(declare-fun b_next!10315 () Bool)

(assert (=> start!40034 (= b_free!10315 (not b_next!10315))))

(declare-fun tp!36474 () Bool)

(declare-fun b_and!18297 () Bool)

(assert (=> start!40034 (= tp!36474 b_and!18297)))

(declare-fun b!436868 () Bool)

(declare-fun res!257637 () Bool)

(declare-fun e!257920 () Bool)

(assert (=> b!436868 (=> (not res!257637) (not e!257920))))

(declare-datatypes ((array!26760 0))(
  ( (array!26761 (arr!12829 (Array (_ BitVec 32) (_ BitVec 64))) (size!13181 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26760)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436868 (= res!257637 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436869 () Bool)

(declare-fun res!257631 () Bool)

(assert (=> b!436869 (=> (not res!257631) (not e!257920))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436869 (= res!257631 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13181 _keys!709))))))

(declare-fun b!436870 () Bool)

(declare-fun e!257922 () Bool)

(declare-fun e!257918 () Bool)

(declare-fun mapRes!18822 () Bool)

(assert (=> b!436870 (= e!257922 (and e!257918 mapRes!18822))))

(declare-fun condMapEmpty!18822 () Bool)

(declare-datatypes ((V!16395 0))(
  ( (V!16396 (val!5778 Int)) )
))
(declare-datatypes ((ValueCell!5390 0))(
  ( (ValueCellFull!5390 (v!8026 V!16395)) (EmptyCell!5390) )
))
(declare-datatypes ((array!26762 0))(
  ( (array!26763 (arr!12830 (Array (_ BitVec 32) ValueCell!5390)) (size!13182 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26762)

(declare-fun mapDefault!18822 () ValueCell!5390)

(assert (=> b!436870 (= condMapEmpty!18822 (= (arr!12830 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5390)) mapDefault!18822)))))

(declare-fun b!436871 () Bool)

(declare-fun e!257919 () Bool)

(declare-fun tp_is_empty!11467 () Bool)

(assert (=> b!436871 (= e!257919 tp_is_empty!11467)))

(declare-fun b!436872 () Bool)

(declare-fun res!257632 () Bool)

(assert (=> b!436872 (=> (not res!257632) (not e!257920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436872 (= res!257632 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18822 () Bool)

(declare-fun tp!36473 () Bool)

(assert (=> mapNonEmpty!18822 (= mapRes!18822 (and tp!36473 e!257919))))

(declare-fun mapKey!18822 () (_ BitVec 32))

(declare-fun mapRest!18822 () (Array (_ BitVec 32) ValueCell!5390))

(declare-fun mapValue!18822 () ValueCell!5390)

(assert (=> mapNonEmpty!18822 (= (arr!12830 _values!549) (store mapRest!18822 mapKey!18822 mapValue!18822))))

(declare-fun b!436873 () Bool)

(declare-fun res!257639 () Bool)

(declare-fun e!257917 () Bool)

(assert (=> b!436873 (=> (not res!257639) (not e!257917))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!436873 (= res!257639 (bvsle from!863 i!563))))

(declare-fun b!436874 () Bool)

(declare-fun res!257640 () Bool)

(assert (=> b!436874 (=> (not res!257640) (not e!257920))))

(declare-datatypes ((List!7550 0))(
  ( (Nil!7547) (Cons!7546 (h!8402 (_ BitVec 64)) (t!13298 List!7550)) )
))
(declare-fun arrayNoDuplicates!0 (array!26760 (_ BitVec 32) List!7550) Bool)

(assert (=> b!436874 (= res!257640 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7547))))

(declare-fun b!436875 () Bool)

(declare-fun res!257633 () Bool)

(assert (=> b!436875 (=> (not res!257633) (not e!257920))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26760 (_ BitVec 32)) Bool)

(assert (=> b!436875 (= res!257633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18822 () Bool)

(assert (=> mapIsEmpty!18822 mapRes!18822))

(declare-fun b!436876 () Bool)

(declare-fun res!257638 () Bool)

(assert (=> b!436876 (=> (not res!257638) (not e!257917))))

(declare-fun lt!201503 () array!26760)

(assert (=> b!436876 (= res!257638 (arrayNoDuplicates!0 lt!201503 #b00000000000000000000000000000000 Nil!7547))))

(declare-fun res!257634 () Bool)

(assert (=> start!40034 (=> (not res!257634) (not e!257920))))

(assert (=> start!40034 (= res!257634 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13181 _keys!709))))))

(assert (=> start!40034 e!257920))

(assert (=> start!40034 tp_is_empty!11467))

(assert (=> start!40034 tp!36474))

(assert (=> start!40034 true))

(declare-fun array_inv!9382 (array!26762) Bool)

(assert (=> start!40034 (and (array_inv!9382 _values!549) e!257922)))

(declare-fun array_inv!9383 (array!26760) Bool)

(assert (=> start!40034 (array_inv!9383 _keys!709)))

(declare-fun b!436867 () Bool)

(assert (=> b!436867 (= e!257920 e!257917)))

(declare-fun res!257643 () Bool)

(assert (=> b!436867 (=> (not res!257643) (not e!257917))))

(assert (=> b!436867 (= res!257643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201503 mask!1025))))

(assert (=> b!436867 (= lt!201503 (array!26761 (store (arr!12829 _keys!709) i!563 k0!794) (size!13181 _keys!709)))))

(declare-fun b!436877 () Bool)

(declare-fun res!257641 () Bool)

(assert (=> b!436877 (=> (not res!257641) (not e!257920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436877 (= res!257641 (validMask!0 mask!1025))))

(declare-fun b!436878 () Bool)

(declare-fun e!257923 () Bool)

(assert (=> b!436878 (= e!257923 (not true))))

(declare-fun lt!201502 () array!26762)

(declare-fun minValue!515 () V!16395)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16395)

(declare-fun v!412 () V!16395)

(declare-datatypes ((tuple2!7562 0))(
  ( (tuple2!7563 (_1!3792 (_ BitVec 64)) (_2!3792 V!16395)) )
))
(declare-datatypes ((List!7551 0))(
  ( (Nil!7548) (Cons!7547 (h!8403 tuple2!7562) (t!13299 List!7551)) )
))
(declare-datatypes ((ListLongMap!6477 0))(
  ( (ListLongMap!6478 (toList!3254 List!7551)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1487 (array!26760 array!26762 (_ BitVec 32) (_ BitVec 32) V!16395 V!16395 (_ BitVec 32) Int) ListLongMap!6477)

(declare-fun +!1455 (ListLongMap!6477 tuple2!7562) ListLongMap!6477)

(assert (=> b!436878 (= (getCurrentListMapNoExtraKeys!1487 lt!201503 lt!201502 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1455 (getCurrentListMapNoExtraKeys!1487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7563 k0!794 v!412)))))

(declare-datatypes ((Unit!12985 0))(
  ( (Unit!12986) )
))
(declare-fun lt!201501 () Unit!12985)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!615 (array!26760 array!26762 (_ BitVec 32) (_ BitVec 32) V!16395 V!16395 (_ BitVec 32) (_ BitVec 64) V!16395 (_ BitVec 32) Int) Unit!12985)

(assert (=> b!436878 (= lt!201501 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!615 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436879 () Bool)

(assert (=> b!436879 (= e!257917 e!257923)))

(declare-fun res!257636 () Bool)

(assert (=> b!436879 (=> (not res!257636) (not e!257923))))

(assert (=> b!436879 (= res!257636 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201504 () ListLongMap!6477)

(assert (=> b!436879 (= lt!201504 (getCurrentListMapNoExtraKeys!1487 lt!201503 lt!201502 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436879 (= lt!201502 (array!26763 (store (arr!12830 _values!549) i!563 (ValueCellFull!5390 v!412)) (size!13182 _values!549)))))

(declare-fun lt!201500 () ListLongMap!6477)

(assert (=> b!436879 (= lt!201500 (getCurrentListMapNoExtraKeys!1487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436880 () Bool)

(assert (=> b!436880 (= e!257918 tp_is_empty!11467)))

(declare-fun b!436881 () Bool)

(declare-fun res!257635 () Bool)

(assert (=> b!436881 (=> (not res!257635) (not e!257920))))

(assert (=> b!436881 (= res!257635 (or (= (select (arr!12829 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12829 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436882 () Bool)

(declare-fun res!257642 () Bool)

(assert (=> b!436882 (=> (not res!257642) (not e!257920))))

(assert (=> b!436882 (= res!257642 (and (= (size!13182 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13181 _keys!709) (size!13182 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40034 res!257634) b!436877))

(assert (= (and b!436877 res!257641) b!436882))

(assert (= (and b!436882 res!257642) b!436875))

(assert (= (and b!436875 res!257633) b!436874))

(assert (= (and b!436874 res!257640) b!436869))

(assert (= (and b!436869 res!257631) b!436872))

(assert (= (and b!436872 res!257632) b!436881))

(assert (= (and b!436881 res!257635) b!436868))

(assert (= (and b!436868 res!257637) b!436867))

(assert (= (and b!436867 res!257643) b!436876))

(assert (= (and b!436876 res!257638) b!436873))

(assert (= (and b!436873 res!257639) b!436879))

(assert (= (and b!436879 res!257636) b!436878))

(assert (= (and b!436870 condMapEmpty!18822) mapIsEmpty!18822))

(assert (= (and b!436870 (not condMapEmpty!18822)) mapNonEmpty!18822))

(get-info :version)

(assert (= (and mapNonEmpty!18822 ((_ is ValueCellFull!5390) mapValue!18822)) b!436871))

(assert (= (and b!436870 ((_ is ValueCellFull!5390) mapDefault!18822)) b!436880))

(assert (= start!40034 b!436870))

(declare-fun m!424913 () Bool)

(assert (=> b!436876 m!424913))

(declare-fun m!424915 () Bool)

(assert (=> b!436867 m!424915))

(declare-fun m!424917 () Bool)

(assert (=> b!436867 m!424917))

(declare-fun m!424919 () Bool)

(assert (=> b!436881 m!424919))

(declare-fun m!424921 () Bool)

(assert (=> b!436875 m!424921))

(declare-fun m!424923 () Bool)

(assert (=> b!436868 m!424923))

(declare-fun m!424925 () Bool)

(assert (=> b!436877 m!424925))

(declare-fun m!424927 () Bool)

(assert (=> b!436874 m!424927))

(declare-fun m!424929 () Bool)

(assert (=> start!40034 m!424929))

(declare-fun m!424931 () Bool)

(assert (=> start!40034 m!424931))

(declare-fun m!424933 () Bool)

(assert (=> b!436872 m!424933))

(declare-fun m!424935 () Bool)

(assert (=> b!436878 m!424935))

(declare-fun m!424937 () Bool)

(assert (=> b!436878 m!424937))

(assert (=> b!436878 m!424937))

(declare-fun m!424939 () Bool)

(assert (=> b!436878 m!424939))

(declare-fun m!424941 () Bool)

(assert (=> b!436878 m!424941))

(declare-fun m!424943 () Bool)

(assert (=> mapNonEmpty!18822 m!424943))

(declare-fun m!424945 () Bool)

(assert (=> b!436879 m!424945))

(declare-fun m!424947 () Bool)

(assert (=> b!436879 m!424947))

(declare-fun m!424949 () Bool)

(assert (=> b!436879 m!424949))

(check-sat (not b!436868) b_and!18297 (not b!436872) (not mapNonEmpty!18822) (not b_next!10315) (not b!436879) (not b!436874) tp_is_empty!11467 (not b!436876) (not b!436875) (not b!436878) (not b!436867) (not b!436877) (not start!40034))
(check-sat b_and!18297 (not b_next!10315))
