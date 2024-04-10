; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37018 () Bool)

(assert start!37018)

(declare-fun b_free!8145 () Bool)

(declare-fun b_next!8145 () Bool)

(assert (=> start!37018 (= b_free!8145 (not b_next!8145))))

(declare-fun tp!29151 () Bool)

(declare-fun b_and!15387 () Bool)

(assert (=> start!37018 (= tp!29151 b_and!15387)))

(declare-fun b!371867 () Bool)

(declare-fun e!226915 () Bool)

(declare-datatypes ((array!21527 0))(
  ( (array!21528 (arr!10232 (Array (_ BitVec 32) (_ BitVec 64))) (size!10584 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21527)

(assert (=> b!371867 (= e!226915 (not (bvsle #b00000000000000000000000000000000 (size!10584 _keys!658))))))

(declare-datatypes ((V!12829 0))(
  ( (V!12830 (val!4441 Int)) )
))
(declare-datatypes ((tuple2!5892 0))(
  ( (tuple2!5893 (_1!2957 (_ BitVec 64)) (_2!2957 V!12829)) )
))
(declare-datatypes ((List!5733 0))(
  ( (Nil!5730) (Cons!5729 (h!6585 tuple2!5892) (t!10883 List!5733)) )
))
(declare-datatypes ((ListLongMap!4805 0))(
  ( (ListLongMap!4806 (toList!2418 List!5733)) )
))
(declare-fun lt!170450 () ListLongMap!4805)

(declare-fun lt!170452 () ListLongMap!4805)

(assert (=> b!371867 (and (= lt!170450 lt!170452) (= lt!170452 lt!170450))))

(declare-fun v!373 () V!12829)

(declare-fun lt!170453 () ListLongMap!4805)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!764 (ListLongMap!4805 tuple2!5892) ListLongMap!4805)

(assert (=> b!371867 (= lt!170452 (+!764 lt!170453 (tuple2!5893 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4053 0))(
  ( (ValueCellFull!4053 (v!6638 V!12829)) (EmptyCell!4053) )
))
(declare-datatypes ((array!21529 0))(
  ( (array!21530 (arr!10233 (Array (_ BitVec 32) ValueCell!4053)) (size!10585 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21529)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11434 0))(
  ( (Unit!11435) )
))
(declare-fun lt!170451 () Unit!11434)

(declare-fun zeroValue!472 () V!12829)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12829)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!19 (array!21527 array!21529 (_ BitVec 32) (_ BitVec 32) V!12829 V!12829 (_ BitVec 32) (_ BitVec 64) V!12829 (_ BitVec 32) Int) Unit!11434)

(assert (=> b!371867 (= lt!170451 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!19 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170454 () array!21527)

(declare-fun getCurrentListMapNoExtraKeys!695 (array!21527 array!21529 (_ BitVec 32) (_ BitVec 32) V!12829 V!12829 (_ BitVec 32) Int) ListLongMap!4805)

(assert (=> b!371867 (= lt!170450 (getCurrentListMapNoExtraKeys!695 lt!170454 (array!21530 (store (arr!10233 _values!506) i!548 (ValueCellFull!4053 v!373)) (size!10585 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371867 (= lt!170453 (getCurrentListMapNoExtraKeys!695 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371868 () Bool)

(declare-fun res!209129 () Bool)

(declare-fun e!226917 () Bool)

(assert (=> b!371868 (=> (not res!209129) (not e!226917))))

(declare-fun arrayContainsKey!0 (array!21527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371868 (= res!209129 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14754 () Bool)

(declare-fun mapRes!14754 () Bool)

(assert (=> mapIsEmpty!14754 mapRes!14754))

(declare-fun b!371869 () Bool)

(assert (=> b!371869 (= e!226917 e!226915)))

(declare-fun res!209123 () Bool)

(assert (=> b!371869 (=> (not res!209123) (not e!226915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21527 (_ BitVec 32)) Bool)

(assert (=> b!371869 (= res!209123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170454 mask!970))))

(assert (=> b!371869 (= lt!170454 (array!21528 (store (arr!10232 _keys!658) i!548 k0!778) (size!10584 _keys!658)))))

(declare-fun b!371870 () Bool)

(declare-fun res!209121 () Bool)

(assert (=> b!371870 (=> (not res!209121) (not e!226917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371870 (= res!209121 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14754 () Bool)

(declare-fun tp!29150 () Bool)

(declare-fun e!226916 () Bool)

(assert (=> mapNonEmpty!14754 (= mapRes!14754 (and tp!29150 e!226916))))

(declare-fun mapRest!14754 () (Array (_ BitVec 32) ValueCell!4053))

(declare-fun mapValue!14754 () ValueCell!4053)

(declare-fun mapKey!14754 () (_ BitVec 32))

(assert (=> mapNonEmpty!14754 (= (arr!10233 _values!506) (store mapRest!14754 mapKey!14754 mapValue!14754))))

(declare-fun res!209128 () Bool)

(assert (=> start!37018 (=> (not res!209128) (not e!226917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37018 (= res!209128 (validMask!0 mask!970))))

(assert (=> start!37018 e!226917))

(declare-fun e!226914 () Bool)

(declare-fun array_inv!7550 (array!21529) Bool)

(assert (=> start!37018 (and (array_inv!7550 _values!506) e!226914)))

(assert (=> start!37018 tp!29151))

(assert (=> start!37018 true))

(declare-fun tp_is_empty!8793 () Bool)

(assert (=> start!37018 tp_is_empty!8793))

(declare-fun array_inv!7551 (array!21527) Bool)

(assert (=> start!37018 (array_inv!7551 _keys!658)))

(declare-fun b!371871 () Bool)

(declare-fun res!209120 () Bool)

(assert (=> b!371871 (=> (not res!209120) (not e!226917))))

(assert (=> b!371871 (= res!209120 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10584 _keys!658))))))

(declare-fun b!371872 () Bool)

(declare-fun e!226918 () Bool)

(assert (=> b!371872 (= e!226918 tp_is_empty!8793)))

(declare-fun b!371873 () Bool)

(declare-fun res!209127 () Bool)

(assert (=> b!371873 (=> (not res!209127) (not e!226915))))

(declare-datatypes ((List!5734 0))(
  ( (Nil!5731) (Cons!5730 (h!6586 (_ BitVec 64)) (t!10884 List!5734)) )
))
(declare-fun arrayNoDuplicates!0 (array!21527 (_ BitVec 32) List!5734) Bool)

(assert (=> b!371873 (= res!209127 (arrayNoDuplicates!0 lt!170454 #b00000000000000000000000000000000 Nil!5731))))

(declare-fun b!371874 () Bool)

(assert (=> b!371874 (= e!226914 (and e!226918 mapRes!14754))))

(declare-fun condMapEmpty!14754 () Bool)

(declare-fun mapDefault!14754 () ValueCell!4053)

(assert (=> b!371874 (= condMapEmpty!14754 (= (arr!10233 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4053)) mapDefault!14754)))))

(declare-fun b!371875 () Bool)

(declare-fun res!209126 () Bool)

(assert (=> b!371875 (=> (not res!209126) (not e!226917))))

(assert (=> b!371875 (= res!209126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371876 () Bool)

(declare-fun res!209124 () Bool)

(assert (=> b!371876 (=> (not res!209124) (not e!226917))))

(assert (=> b!371876 (= res!209124 (or (= (select (arr!10232 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10232 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371877 () Bool)

(declare-fun res!209125 () Bool)

(assert (=> b!371877 (=> (not res!209125) (not e!226917))))

(assert (=> b!371877 (= res!209125 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5731))))

(declare-fun b!371878 () Bool)

(assert (=> b!371878 (= e!226916 tp_is_empty!8793)))

(declare-fun b!371879 () Bool)

(declare-fun res!209122 () Bool)

(assert (=> b!371879 (=> (not res!209122) (not e!226917))))

(assert (=> b!371879 (= res!209122 (and (= (size!10585 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10584 _keys!658) (size!10585 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37018 res!209128) b!371879))

(assert (= (and b!371879 res!209122) b!371875))

(assert (= (and b!371875 res!209126) b!371877))

(assert (= (and b!371877 res!209125) b!371871))

(assert (= (and b!371871 res!209120) b!371870))

(assert (= (and b!371870 res!209121) b!371876))

(assert (= (and b!371876 res!209124) b!371868))

(assert (= (and b!371868 res!209129) b!371869))

(assert (= (and b!371869 res!209123) b!371873))

(assert (= (and b!371873 res!209127) b!371867))

(assert (= (and b!371874 condMapEmpty!14754) mapIsEmpty!14754))

(assert (= (and b!371874 (not condMapEmpty!14754)) mapNonEmpty!14754))

(get-info :version)

(assert (= (and mapNonEmpty!14754 ((_ is ValueCellFull!4053) mapValue!14754)) b!371878))

(assert (= (and b!371874 ((_ is ValueCellFull!4053) mapDefault!14754)) b!371872))

(assert (= start!37018 b!371874))

(declare-fun m!367783 () Bool)

(assert (=> start!37018 m!367783))

(declare-fun m!367785 () Bool)

(assert (=> start!37018 m!367785))

(declare-fun m!367787 () Bool)

(assert (=> start!37018 m!367787))

(declare-fun m!367789 () Bool)

(assert (=> mapNonEmpty!14754 m!367789))

(declare-fun m!367791 () Bool)

(assert (=> b!371868 m!367791))

(declare-fun m!367793 () Bool)

(assert (=> b!371867 m!367793))

(declare-fun m!367795 () Bool)

(assert (=> b!371867 m!367795))

(declare-fun m!367797 () Bool)

(assert (=> b!371867 m!367797))

(declare-fun m!367799 () Bool)

(assert (=> b!371867 m!367799))

(declare-fun m!367801 () Bool)

(assert (=> b!371867 m!367801))

(declare-fun m!367803 () Bool)

(assert (=> b!371873 m!367803))

(declare-fun m!367805 () Bool)

(assert (=> b!371877 m!367805))

(declare-fun m!367807 () Bool)

(assert (=> b!371869 m!367807))

(declare-fun m!367809 () Bool)

(assert (=> b!371869 m!367809))

(declare-fun m!367811 () Bool)

(assert (=> b!371876 m!367811))

(declare-fun m!367813 () Bool)

(assert (=> b!371875 m!367813))

(declare-fun m!367815 () Bool)

(assert (=> b!371870 m!367815))

(check-sat (not b!371869) (not b!371867) (not b!371870) (not start!37018) (not mapNonEmpty!14754) (not b!371868) b_and!15387 (not b!371873) tp_is_empty!8793 (not b_next!8145) (not b!371877) (not b!371875))
(check-sat b_and!15387 (not b_next!8145))
