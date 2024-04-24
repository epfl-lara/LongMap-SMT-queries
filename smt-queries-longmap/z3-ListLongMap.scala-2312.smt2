; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37320 () Bool)

(assert start!37320)

(declare-fun b_free!8461 () Bool)

(declare-fun b_next!8461 () Bool)

(assert (=> start!37320 (= b_free!8461 (not b_next!8461))))

(declare-fun tp!30098 () Bool)

(declare-fun b_and!15717 () Bool)

(assert (=> start!37320 (= tp!30098 b_and!15717)))

(declare-fun b!378776 () Bool)

(declare-fun res!214663 () Bool)

(declare-fun e!230497 () Bool)

(assert (=> b!378776 (=> (not res!214663) (not e!230497))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378776 (= res!214663 (validKeyInArray!0 k0!778))))

(declare-fun b!378777 () Bool)

(declare-fun e!230498 () Bool)

(assert (=> b!378777 (= e!230497 e!230498)))

(declare-fun res!214659 () Bool)

(assert (=> b!378777 (=> (not res!214659) (not e!230498))))

(declare-datatypes ((array!22132 0))(
  ( (array!22133 (arr!10534 (Array (_ BitVec 32) (_ BitVec 64))) (size!10886 (_ BitVec 32))) )
))
(declare-fun lt!176678 () array!22132)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22132 (_ BitVec 32)) Bool)

(assert (=> b!378777 (= res!214659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176678 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!22132)

(assert (=> b!378777 (= lt!176678 (array!22133 (store (arr!10534 _keys!658) i!548 k0!778) (size!10886 _keys!658)))))

(declare-fun b!378778 () Bool)

(declare-fun e!230495 () Bool)

(declare-fun tp_is_empty!9109 () Bool)

(assert (=> b!378778 (= e!230495 tp_is_empty!9109)))

(declare-fun b!378779 () Bool)

(declare-fun e!230501 () Bool)

(declare-fun e!230499 () Bool)

(assert (=> b!378779 (= e!230501 e!230499)))

(declare-fun res!214661 () Bool)

(assert (=> b!378779 (=> res!214661 e!230499)))

(assert (=> b!378779 (= res!214661 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13251 0))(
  ( (V!13252 (val!4599 Int)) )
))
(declare-datatypes ((tuple2!6046 0))(
  ( (tuple2!6047 (_1!3034 (_ BitVec 64)) (_2!3034 V!13251)) )
))
(declare-datatypes ((List!5885 0))(
  ( (Nil!5882) (Cons!5881 (h!6737 tuple2!6046) (t!11027 List!5885)) )
))
(declare-datatypes ((ListLongMap!4961 0))(
  ( (ListLongMap!4962 (toList!2496 List!5885)) )
))
(declare-fun lt!176679 () ListLongMap!4961)

(declare-fun lt!176671 () ListLongMap!4961)

(assert (=> b!378779 (= lt!176679 lt!176671)))

(declare-fun lt!176683 () ListLongMap!4961)

(declare-fun lt!176682 () tuple2!6046)

(declare-fun +!892 (ListLongMap!4961 tuple2!6046) ListLongMap!4961)

(assert (=> b!378779 (= lt!176671 (+!892 lt!176683 lt!176682))))

(declare-fun lt!176673 () ListLongMap!4961)

(declare-fun lt!176675 () ListLongMap!4961)

(assert (=> b!378779 (= lt!176673 lt!176675)))

(declare-fun lt!176680 () ListLongMap!4961)

(assert (=> b!378779 (= lt!176675 (+!892 lt!176680 lt!176682))))

(declare-fun lt!176676 () ListLongMap!4961)

(assert (=> b!378779 (= lt!176673 (+!892 lt!176676 lt!176682))))

(declare-fun minValue!472 () V!13251)

(assert (=> b!378779 (= lt!176682 (tuple2!6047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378780 () Bool)

(declare-fun res!214654 () Bool)

(assert (=> b!378780 (=> (not res!214654) (not e!230497))))

(declare-fun arrayContainsKey!0 (array!22132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378780 (= res!214654 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!214656 () Bool)

(assert (=> start!37320 (=> (not res!214656) (not e!230497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37320 (= res!214656 (validMask!0 mask!970))))

(assert (=> start!37320 e!230497))

(declare-datatypes ((ValueCell!4211 0))(
  ( (ValueCellFull!4211 (v!6797 V!13251)) (EmptyCell!4211) )
))
(declare-datatypes ((array!22134 0))(
  ( (array!22135 (arr!10535 (Array (_ BitVec 32) ValueCell!4211)) (size!10887 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22134)

(declare-fun e!230496 () Bool)

(declare-fun array_inv!7808 (array!22134) Bool)

(assert (=> start!37320 (and (array_inv!7808 _values!506) e!230496)))

(assert (=> start!37320 tp!30098))

(assert (=> start!37320 true))

(assert (=> start!37320 tp_is_empty!9109))

(declare-fun array_inv!7809 (array!22132) Bool)

(assert (=> start!37320 (array_inv!7809 _keys!658)))

(declare-fun b!378781 () Bool)

(declare-fun res!214664 () Bool)

(assert (=> b!378781 (=> (not res!214664) (not e!230497))))

(assert (=> b!378781 (= res!214664 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10886 _keys!658))))))

(declare-fun b!378782 () Bool)

(declare-fun e!230502 () Bool)

(assert (=> b!378782 (= e!230502 tp_is_empty!9109)))

(declare-fun b!378783 () Bool)

(declare-fun res!214660 () Bool)

(assert (=> b!378783 (=> (not res!214660) (not e!230497))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378783 (= res!214660 (and (= (size!10887 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10886 _keys!658) (size!10887 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378784 () Bool)

(declare-fun res!214655 () Bool)

(assert (=> b!378784 (=> (not res!214655) (not e!230497))))

(declare-datatypes ((List!5886 0))(
  ( (Nil!5883) (Cons!5882 (h!6738 (_ BitVec 64)) (t!11028 List!5886)) )
))
(declare-fun arrayNoDuplicates!0 (array!22132 (_ BitVec 32) List!5886) Bool)

(assert (=> b!378784 (= res!214655 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5883))))

(declare-fun b!378785 () Bool)

(declare-fun res!214653 () Bool)

(assert (=> b!378785 (=> (not res!214653) (not e!230498))))

(assert (=> b!378785 (= res!214653 (arrayNoDuplicates!0 lt!176678 #b00000000000000000000000000000000 Nil!5883))))

(declare-fun mapNonEmpty!15228 () Bool)

(declare-fun mapRes!15228 () Bool)

(declare-fun tp!30099 () Bool)

(assert (=> mapNonEmpty!15228 (= mapRes!15228 (and tp!30099 e!230495))))

(declare-fun mapRest!15228 () (Array (_ BitVec 32) ValueCell!4211))

(declare-fun mapValue!15228 () ValueCell!4211)

(declare-fun mapKey!15228 () (_ BitVec 32))

(assert (=> mapNonEmpty!15228 (= (arr!10535 _values!506) (store mapRest!15228 mapKey!15228 mapValue!15228))))

(declare-fun b!378786 () Bool)

(assert (=> b!378786 (= e!230496 (and e!230502 mapRes!15228))))

(declare-fun condMapEmpty!15228 () Bool)

(declare-fun mapDefault!15228 () ValueCell!4211)

(assert (=> b!378786 (= condMapEmpty!15228 (= (arr!10535 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4211)) mapDefault!15228)))))

(declare-fun b!378787 () Bool)

(declare-fun res!214662 () Bool)

(assert (=> b!378787 (=> (not res!214662) (not e!230497))))

(assert (=> b!378787 (= res!214662 (or (= (select (arr!10534 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10534 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15228 () Bool)

(assert (=> mapIsEmpty!15228 mapRes!15228))

(declare-fun b!378788 () Bool)

(declare-fun res!214657 () Bool)

(assert (=> b!378788 (=> (not res!214657) (not e!230497))))

(assert (=> b!378788 (= res!214657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378789 () Bool)

(assert (=> b!378789 (= e!230499 true)))

(declare-fun lt!176677 () tuple2!6046)

(assert (=> b!378789 (= lt!176675 (+!892 lt!176671 lt!176677))))

(declare-fun v!373 () V!13251)

(declare-datatypes ((Unit!11667 0))(
  ( (Unit!11668) )
))
(declare-fun lt!176672 () Unit!11667)

(declare-fun addCommutativeForDiffKeys!306 (ListLongMap!4961 (_ BitVec 64) V!13251 (_ BitVec 64) V!13251) Unit!11667)

(assert (=> b!378789 (= lt!176672 (addCommutativeForDiffKeys!306 lt!176683 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378790 () Bool)

(assert (=> b!378790 (= e!230498 (not e!230501))))

(declare-fun res!214658 () Bool)

(assert (=> b!378790 (=> res!214658 e!230501)))

(assert (=> b!378790 (= res!214658 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13251)

(declare-fun getCurrentListMap!1937 (array!22132 array!22134 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) Int) ListLongMap!4961)

(assert (=> b!378790 (= lt!176679 (getCurrentListMap!1937 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176674 () array!22134)

(assert (=> b!378790 (= lt!176673 (getCurrentListMap!1937 lt!176678 lt!176674 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378790 (and (= lt!176676 lt!176680) (= lt!176680 lt!176676))))

(assert (=> b!378790 (= lt!176680 (+!892 lt!176683 lt!176677))))

(assert (=> b!378790 (= lt!176677 (tuple2!6047 k0!778 v!373))))

(declare-fun lt!176681 () Unit!11667)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!124 (array!22132 array!22134 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) (_ BitVec 64) V!13251 (_ BitVec 32) Int) Unit!11667)

(assert (=> b!378790 (= lt!176681 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!124 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!784 (array!22132 array!22134 (_ BitVec 32) (_ BitVec 32) V!13251 V!13251 (_ BitVec 32) Int) ListLongMap!4961)

(assert (=> b!378790 (= lt!176676 (getCurrentListMapNoExtraKeys!784 lt!176678 lt!176674 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378790 (= lt!176674 (array!22135 (store (arr!10535 _values!506) i!548 (ValueCellFull!4211 v!373)) (size!10887 _values!506)))))

(assert (=> b!378790 (= lt!176683 (getCurrentListMapNoExtraKeys!784 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37320 res!214656) b!378783))

(assert (= (and b!378783 res!214660) b!378788))

(assert (= (and b!378788 res!214657) b!378784))

(assert (= (and b!378784 res!214655) b!378781))

(assert (= (and b!378781 res!214664) b!378776))

(assert (= (and b!378776 res!214663) b!378787))

(assert (= (and b!378787 res!214662) b!378780))

(assert (= (and b!378780 res!214654) b!378777))

(assert (= (and b!378777 res!214659) b!378785))

(assert (= (and b!378785 res!214653) b!378790))

(assert (= (and b!378790 (not res!214658)) b!378779))

(assert (= (and b!378779 (not res!214661)) b!378789))

(assert (= (and b!378786 condMapEmpty!15228) mapIsEmpty!15228))

(assert (= (and b!378786 (not condMapEmpty!15228)) mapNonEmpty!15228))

(get-info :version)

(assert (= (and mapNonEmpty!15228 ((_ is ValueCellFull!4211) mapValue!15228)) b!378778))

(assert (= (and b!378786 ((_ is ValueCellFull!4211) mapDefault!15228)) b!378782))

(assert (= start!37320 b!378786))

(declare-fun m!375893 () Bool)

(assert (=> b!378790 m!375893))

(declare-fun m!375895 () Bool)

(assert (=> b!378790 m!375895))

(declare-fun m!375897 () Bool)

(assert (=> b!378790 m!375897))

(declare-fun m!375899 () Bool)

(assert (=> b!378790 m!375899))

(declare-fun m!375901 () Bool)

(assert (=> b!378790 m!375901))

(declare-fun m!375903 () Bool)

(assert (=> b!378790 m!375903))

(declare-fun m!375905 () Bool)

(assert (=> b!378790 m!375905))

(declare-fun m!375907 () Bool)

(assert (=> b!378789 m!375907))

(declare-fun m!375909 () Bool)

(assert (=> b!378789 m!375909))

(declare-fun m!375911 () Bool)

(assert (=> mapNonEmpty!15228 m!375911))

(declare-fun m!375913 () Bool)

(assert (=> b!378787 m!375913))

(declare-fun m!375915 () Bool)

(assert (=> b!378776 m!375915))

(declare-fun m!375917 () Bool)

(assert (=> b!378780 m!375917))

(declare-fun m!375919 () Bool)

(assert (=> b!378779 m!375919))

(declare-fun m!375921 () Bool)

(assert (=> b!378779 m!375921))

(declare-fun m!375923 () Bool)

(assert (=> b!378779 m!375923))

(declare-fun m!375925 () Bool)

(assert (=> b!378777 m!375925))

(declare-fun m!375927 () Bool)

(assert (=> b!378777 m!375927))

(declare-fun m!375929 () Bool)

(assert (=> start!37320 m!375929))

(declare-fun m!375931 () Bool)

(assert (=> start!37320 m!375931))

(declare-fun m!375933 () Bool)

(assert (=> start!37320 m!375933))

(declare-fun m!375935 () Bool)

(assert (=> b!378788 m!375935))

(declare-fun m!375937 () Bool)

(assert (=> b!378784 m!375937))

(declare-fun m!375939 () Bool)

(assert (=> b!378785 m!375939))

(check-sat (not b!378790) (not start!37320) (not b!378788) (not b!378789) (not mapNonEmpty!15228) tp_is_empty!9109 (not b_next!8461) b_and!15717 (not b!378784) (not b!378779) (not b!378776) (not b!378777) (not b!378780) (not b!378785))
(check-sat b_and!15717 (not b_next!8461))
