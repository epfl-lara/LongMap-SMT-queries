; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37326 () Bool)

(assert start!37326)

(declare-fun b_free!8467 () Bool)

(declare-fun b_next!8467 () Bool)

(assert (=> start!37326 (= b_free!8467 (not b_next!8467))))

(declare-fun tp!30116 () Bool)

(declare-fun b_and!15723 () Bool)

(assert (=> start!37326 (= tp!30116 b_and!15723)))

(declare-fun b!378911 () Bool)

(declare-fun e!230568 () Bool)

(declare-fun e!230574 () Bool)

(assert (=> b!378911 (= e!230568 e!230574)))

(declare-fun res!214770 () Bool)

(assert (=> b!378911 (=> (not res!214770) (not e!230574))))

(declare-datatypes ((array!22142 0))(
  ( (array!22143 (arr!10539 (Array (_ BitVec 32) (_ BitVec 64))) (size!10891 (_ BitVec 32))) )
))
(declare-fun lt!176800 () array!22142)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22142 (_ BitVec 32)) Bool)

(assert (=> b!378911 (= res!214770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176800 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22142)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378911 (= lt!176800 (array!22143 (store (arr!10539 _keys!658) i!548 k0!778) (size!10891 _keys!658)))))

(declare-fun b!378912 () Bool)

(declare-fun res!214763 () Bool)

(assert (=> b!378912 (=> (not res!214763) (not e!230568))))

(assert (=> b!378912 (= res!214763 (or (= (select (arr!10539 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10539 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378913 () Bool)

(declare-fun e!230573 () Bool)

(declare-fun tp_is_empty!9115 () Bool)

(assert (=> b!378913 (= e!230573 tp_is_empty!9115)))

(declare-fun b!378914 () Bool)

(declare-fun res!214766 () Bool)

(assert (=> b!378914 (=> (not res!214766) (not e!230568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378914 (= res!214766 (validKeyInArray!0 k0!778))))

(declare-fun b!378915 () Bool)

(declare-fun e!230569 () Bool)

(declare-fun e!230570 () Bool)

(declare-fun mapRes!15237 () Bool)

(assert (=> b!378915 (= e!230569 (and e!230570 mapRes!15237))))

(declare-fun condMapEmpty!15237 () Bool)

(declare-datatypes ((V!13259 0))(
  ( (V!13260 (val!4602 Int)) )
))
(declare-datatypes ((ValueCell!4214 0))(
  ( (ValueCellFull!4214 (v!6800 V!13259)) (EmptyCell!4214) )
))
(declare-datatypes ((array!22144 0))(
  ( (array!22145 (arr!10540 (Array (_ BitVec 32) ValueCell!4214)) (size!10892 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22144)

(declare-fun mapDefault!15237 () ValueCell!4214)

(assert (=> b!378915 (= condMapEmpty!15237 (= (arr!10540 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4214)) mapDefault!15237)))))

(declare-fun b!378916 () Bool)

(declare-fun e!230572 () Bool)

(assert (=> b!378916 (= e!230572 true)))

(declare-datatypes ((tuple2!6050 0))(
  ( (tuple2!6051 (_1!3036 (_ BitVec 64)) (_2!3036 V!13259)) )
))
(declare-datatypes ((List!5888 0))(
  ( (Nil!5885) (Cons!5884 (h!6740 tuple2!6050) (t!11030 List!5888)) )
))
(declare-datatypes ((ListLongMap!4965 0))(
  ( (ListLongMap!4966 (toList!2498 List!5888)) )
))
(declare-fun lt!176794 () ListLongMap!4965)

(declare-fun lt!176791 () ListLongMap!4965)

(declare-fun lt!176790 () tuple2!6050)

(declare-fun +!894 (ListLongMap!4965 tuple2!6050) ListLongMap!4965)

(assert (=> b!378916 (= lt!176794 (+!894 lt!176791 lt!176790))))

(declare-fun v!373 () V!13259)

(declare-datatypes ((Unit!11671 0))(
  ( (Unit!11672) )
))
(declare-fun lt!176792 () Unit!11671)

(declare-fun lt!176797 () ListLongMap!4965)

(declare-fun minValue!472 () V!13259)

(declare-fun addCommutativeForDiffKeys!307 (ListLongMap!4965 (_ BitVec 64) V!13259 (_ BitVec 64) V!13259) Unit!11671)

(assert (=> b!378916 (= lt!176792 (addCommutativeForDiffKeys!307 lt!176797 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378917 () Bool)

(declare-fun res!214772 () Bool)

(assert (=> b!378917 (=> (not res!214772) (not e!230568))))

(declare-fun arrayContainsKey!0 (array!22142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378917 (= res!214772 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378919 () Bool)

(declare-fun e!230567 () Bool)

(assert (=> b!378919 (= e!230567 e!230572)))

(declare-fun res!214771 () Bool)

(assert (=> b!378919 (=> res!214771 e!230572)))

(assert (=> b!378919 (= res!214771 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176788 () ListLongMap!4965)

(assert (=> b!378919 (= lt!176788 lt!176791)))

(declare-fun lt!176796 () tuple2!6050)

(assert (=> b!378919 (= lt!176791 (+!894 lt!176797 lt!176796))))

(declare-fun lt!176793 () ListLongMap!4965)

(assert (=> b!378919 (= lt!176793 lt!176794)))

(declare-fun lt!176798 () ListLongMap!4965)

(assert (=> b!378919 (= lt!176794 (+!894 lt!176798 lt!176796))))

(declare-fun lt!176799 () ListLongMap!4965)

(assert (=> b!378919 (= lt!176793 (+!894 lt!176799 lt!176796))))

(assert (=> b!378919 (= lt!176796 (tuple2!6051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15237 () Bool)

(assert (=> mapIsEmpty!15237 mapRes!15237))

(declare-fun b!378920 () Bool)

(declare-fun res!214764 () Bool)

(assert (=> b!378920 (=> (not res!214764) (not e!230568))))

(assert (=> b!378920 (= res!214764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15237 () Bool)

(declare-fun tp!30117 () Bool)

(assert (=> mapNonEmpty!15237 (= mapRes!15237 (and tp!30117 e!230573))))

(declare-fun mapValue!15237 () ValueCell!4214)

(declare-fun mapRest!15237 () (Array (_ BitVec 32) ValueCell!4214))

(declare-fun mapKey!15237 () (_ BitVec 32))

(assert (=> mapNonEmpty!15237 (= (arr!10540 _values!506) (store mapRest!15237 mapKey!15237 mapValue!15237))))

(declare-fun b!378921 () Bool)

(declare-fun res!214768 () Bool)

(assert (=> b!378921 (=> (not res!214768) (not e!230568))))

(assert (=> b!378921 (= res!214768 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10891 _keys!658))))))

(declare-fun b!378922 () Bool)

(declare-fun res!214769 () Bool)

(assert (=> b!378922 (=> (not res!214769) (not e!230568))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378922 (= res!214769 (and (= (size!10892 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10891 _keys!658) (size!10892 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378923 () Bool)

(declare-fun res!214767 () Bool)

(assert (=> b!378923 (=> (not res!214767) (not e!230568))))

(declare-datatypes ((List!5889 0))(
  ( (Nil!5886) (Cons!5885 (h!6741 (_ BitVec 64)) (t!11031 List!5889)) )
))
(declare-fun arrayNoDuplicates!0 (array!22142 (_ BitVec 32) List!5889) Bool)

(assert (=> b!378923 (= res!214767 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5886))))

(declare-fun b!378924 () Bool)

(assert (=> b!378924 (= e!230574 (not e!230567))))

(declare-fun res!214762 () Bool)

(assert (=> b!378924 (=> res!214762 e!230567)))

(assert (=> b!378924 (= res!214762 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13259)

(declare-fun getCurrentListMap!1939 (array!22142 array!22144 (_ BitVec 32) (_ BitVec 32) V!13259 V!13259 (_ BitVec 32) Int) ListLongMap!4965)

(assert (=> b!378924 (= lt!176788 (getCurrentListMap!1939 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176789 () array!22144)

(assert (=> b!378924 (= lt!176793 (getCurrentListMap!1939 lt!176800 lt!176789 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378924 (and (= lt!176799 lt!176798) (= lt!176798 lt!176799))))

(assert (=> b!378924 (= lt!176798 (+!894 lt!176797 lt!176790))))

(assert (=> b!378924 (= lt!176790 (tuple2!6051 k0!778 v!373))))

(declare-fun lt!176795 () Unit!11671)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!126 (array!22142 array!22144 (_ BitVec 32) (_ BitVec 32) V!13259 V!13259 (_ BitVec 32) (_ BitVec 64) V!13259 (_ BitVec 32) Int) Unit!11671)

(assert (=> b!378924 (= lt!176795 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!126 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!786 (array!22142 array!22144 (_ BitVec 32) (_ BitVec 32) V!13259 V!13259 (_ BitVec 32) Int) ListLongMap!4965)

(assert (=> b!378924 (= lt!176799 (getCurrentListMapNoExtraKeys!786 lt!176800 lt!176789 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378924 (= lt!176789 (array!22145 (store (arr!10540 _values!506) i!548 (ValueCellFull!4214 v!373)) (size!10892 _values!506)))))

(assert (=> b!378924 (= lt!176797 (getCurrentListMapNoExtraKeys!786 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378925 () Bool)

(assert (=> b!378925 (= e!230570 tp_is_empty!9115)))

(declare-fun b!378918 () Bool)

(declare-fun res!214761 () Bool)

(assert (=> b!378918 (=> (not res!214761) (not e!230574))))

(assert (=> b!378918 (= res!214761 (arrayNoDuplicates!0 lt!176800 #b00000000000000000000000000000000 Nil!5886))))

(declare-fun res!214765 () Bool)

(assert (=> start!37326 (=> (not res!214765) (not e!230568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37326 (= res!214765 (validMask!0 mask!970))))

(assert (=> start!37326 e!230568))

(declare-fun array_inv!7810 (array!22144) Bool)

(assert (=> start!37326 (and (array_inv!7810 _values!506) e!230569)))

(assert (=> start!37326 tp!30116))

(assert (=> start!37326 true))

(assert (=> start!37326 tp_is_empty!9115))

(declare-fun array_inv!7811 (array!22142) Bool)

(assert (=> start!37326 (array_inv!7811 _keys!658)))

(assert (= (and start!37326 res!214765) b!378922))

(assert (= (and b!378922 res!214769) b!378920))

(assert (= (and b!378920 res!214764) b!378923))

(assert (= (and b!378923 res!214767) b!378921))

(assert (= (and b!378921 res!214768) b!378914))

(assert (= (and b!378914 res!214766) b!378912))

(assert (= (and b!378912 res!214763) b!378917))

(assert (= (and b!378917 res!214772) b!378911))

(assert (= (and b!378911 res!214770) b!378918))

(assert (= (and b!378918 res!214761) b!378924))

(assert (= (and b!378924 (not res!214762)) b!378919))

(assert (= (and b!378919 (not res!214771)) b!378916))

(assert (= (and b!378915 condMapEmpty!15237) mapIsEmpty!15237))

(assert (= (and b!378915 (not condMapEmpty!15237)) mapNonEmpty!15237))

(get-info :version)

(assert (= (and mapNonEmpty!15237 ((_ is ValueCellFull!4214) mapValue!15237)) b!378913))

(assert (= (and b!378915 ((_ is ValueCellFull!4214) mapDefault!15237)) b!378925))

(assert (= start!37326 b!378915))

(declare-fun m!376037 () Bool)

(assert (=> b!378919 m!376037))

(declare-fun m!376039 () Bool)

(assert (=> b!378919 m!376039))

(declare-fun m!376041 () Bool)

(assert (=> b!378919 m!376041))

(declare-fun m!376043 () Bool)

(assert (=> b!378920 m!376043))

(declare-fun m!376045 () Bool)

(assert (=> b!378918 m!376045))

(declare-fun m!376047 () Bool)

(assert (=> b!378912 m!376047))

(declare-fun m!376049 () Bool)

(assert (=> b!378914 m!376049))

(declare-fun m!376051 () Bool)

(assert (=> mapNonEmpty!15237 m!376051))

(declare-fun m!376053 () Bool)

(assert (=> b!378911 m!376053))

(declare-fun m!376055 () Bool)

(assert (=> b!378911 m!376055))

(declare-fun m!376057 () Bool)

(assert (=> b!378924 m!376057))

(declare-fun m!376059 () Bool)

(assert (=> b!378924 m!376059))

(declare-fun m!376061 () Bool)

(assert (=> b!378924 m!376061))

(declare-fun m!376063 () Bool)

(assert (=> b!378924 m!376063))

(declare-fun m!376065 () Bool)

(assert (=> b!378924 m!376065))

(declare-fun m!376067 () Bool)

(assert (=> b!378924 m!376067))

(declare-fun m!376069 () Bool)

(assert (=> b!378924 m!376069))

(declare-fun m!376071 () Bool)

(assert (=> b!378917 m!376071))

(declare-fun m!376073 () Bool)

(assert (=> b!378923 m!376073))

(declare-fun m!376075 () Bool)

(assert (=> start!37326 m!376075))

(declare-fun m!376077 () Bool)

(assert (=> start!37326 m!376077))

(declare-fun m!376079 () Bool)

(assert (=> start!37326 m!376079))

(declare-fun m!376081 () Bool)

(assert (=> b!378916 m!376081))

(declare-fun m!376083 () Bool)

(assert (=> b!378916 m!376083))

(check-sat (not b!378916) (not b!378917) (not b!378911) (not start!37326) (not b!378924) (not mapNonEmpty!15237) (not b!378919) (not b!378914) (not b!378923) tp_is_empty!9115 (not b_next!8467) b_and!15723 (not b!378920) (not b!378918))
(check-sat b_and!15723 (not b_next!8467))
